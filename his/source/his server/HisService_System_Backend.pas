unit HisService_System_Backend;

{
  系统服务后端

  1 创建时自动从Bin\SystemService.daScheama文件中加载Schema。
    所以在设计器中修改Schema后，要保存并覆盖此文件，然后可点命令重新加载Schema。

    此种方法，不知在并发访问时会出现哪些异常！！！
    Relativity Server可随时刷新Schema，不知是否考虑并发问题？？？
}

interface

uses
  SysUtils,
  Classes,
  Variants,
  SyncObjs,
  StrUtils,
  App_Common,
  App_DAServer,
  uROXMLIntf,
  uROClientIntf,
  uROTypes,
  uROServer,
  uROServerIntf,
  uROSessions,
  uRORemoteDataModule,
  uDAInterfaces,
  DataAbstractService_Impl,
  DataAbstract4_Intf,
  uDASchema,
  uDAServerInterfaces,
  uROClient,
  HisServer_Const,
  HisServer_Classes, uROComponent, uDAStreamableComponent, uDAClientSchema;

const
  sIPClientAppID = 'chip'; // 集成平台客户端AppID

type
  TSystemBackend = class(TBaseBackend)
    DASchema: TDASchema;
  protected
    function NewConnection(): IDAConnection;
    function InternalGetSchema(): TDASchema; override;
    function GetSchemaFileName(): string; override;
  public
    function Pwd_Client_Decrypt(APassword: string): string;
    function Pwd_Server_Encrypt(APassword: string): string;
    function Pwd_Server_Decrypt(APassword: string): string;

    function Login(Sender: TRORemoteDataModule; const ALoginString: string): string;
    procedure Logout(Sender: TRORemoteDataModule);
    function ChangePassword(Sender: TDataAbstractService; const AUserID: string; const AOldPassword: AnsiString; const ANewPassword: AnsiString): Boolean;
    function ResetPassword(Sender: TDataAbstractService; const AUserID: AnsiString; const ANewPassword: AnsiString): Boolean;

    function IsFieldValueExists(Sender: TDataAbstractService; const ATableName: AnsiString; const AFieldName: AnsiString; const AFieldValue: AnsiString): Boolean;
    function GetFieldMaxValue(Sender: TDataAbstractService; const ATableName: AnsiString; const AFieldName: string; ADataBase: string=''): Variant;
    function LookupValue(const ATableName, AKeyFieldName, AResultFieldName: string; AKeyFieldValue: Variant): Variant;

    function WriteLog(Sender: TDataAbstractService; const AUserID: Integer; const AFlag: Integer; const ATitle: AnsiString; const AContent: AnsiString): Integer;
    function GetParam(Sender: TDataAbstractService; const AParamName: AnsiString; const ADefaultValue: Variant): Variant;
    procedure WriteParam(Sender: TDataAbstractService; const AParamName: AnsiString; const AParamValue: Variant);
  end;

var
  SystemBackend: TSystemBackend;

implementation

uses
  App_ROCipher;

{$R *.DFM}

{ TSystemServiceBackend }

function TSystemBackend.ChangePassword(Sender: TDataAbstractService;
  const AUserID: string; const AOldPassword,
  ANewPassword: AnsiString): Boolean;
begin

  GetSchema.NewCommand(NewConnection, 'Pro_Sys_Op_ChangePwd',
    ['OpID', 'OldPassword', 'NewPassword'],
    [AUserID, AOldPassword, ANewPassword]);

  Result := True;
end;

// 针对ChzyyHis数据库，求某个表关键字段的最大值

function TSystemBackend.GetFieldMaxValue(
  Sender: TDataAbstractService; const ATableName: AnsiString;
  const AFieldName: string; ADataBase: string): Variant;
begin
  if ADataBase = '' then ADataBase := sDBNameHis;

  with RemoteServer.NewConnection.NewDataset(
    Format('select max(%s) from %s', [AFieldName, ATableName])) do
  begin
    Open;
    Result := FieldValues[0];
  end;
end;

function TSystemBackend.GetParam(Sender: TDataAbstractService;
  const AParamName: AnsiString; const ADefaultValue: Variant): Variant;
begin

end;

function TSystemBackend.GetSchemaFileName: string;
begin
  Result := 'HisService_System.daSchema'
end;

function TSystemBackend.InternalGetSchema: TDASchema;
begin
  Result := DASchema;
end;

function TSystemBackend.IsFieldValueExists(
  Sender: TDataAbstractService; const ATableName, AFieldName,
  AFieldValue: AnsiString): Boolean;
begin
  with RemoteServer.NewConnection.NewDataset(
    Format('Select top 1 %s from %s where %s = %s',
    [AFieldName, ATableName, AFieldName, QuotedStr(AFieldValue)])) do
  begin
    Open;
    Result := not IsEmpty;
  end;
end;

function TSystemBackend.Login(Sender: TRORemoteDataModule;
  const ALoginString: string): string;
var
  DataSet: IDADataSet;
  LoginStrings: TStrings;
  ResultStrings: TStrings;
  Conn: IDAConnection;
  AppID, AppVer, ResVer, UserID, Password, ClientAddress: string;
  UserName, OfficeID, OfficeName, AccessList, ExtendList: string;
begin
  Result := '';

  LoginStrings := TStringList.Create();
  ResultStrings := TStringList.Create;

  try
    LoginStrings.Text := ALoginString;

    AppID := LoginStrings.Values['AppID'];
    AppVer := LoginStrings.Values['AppVer'];  
    ResVer := LoginStrings.Values['ResVer'];
    UserID := LeftStr(LoginStrings.Values['UserID'], 20);  
    Password := LeftStr(LoginStrings.Values['Password'], 32);
    ClientAddress := IROTCPTransport(Sender.Transport).ClientAddress;
    UserName := '';
    OfficeID := '';
    OfficeName := '';

    // 对集成平台客户端做版本检查，版本小于当前最新版本时，要求强制更新
//    if SameText(AppID, sIPClientAppID) and
//      ((AppVer < AppCore.IniFile.ReadString(sAppSection, 'IPClientVersion', '')) or
//      (ResVer < AppCore.IniFile.ReadString(sAppSection, 'IPClientResVer', '')))
//      then
//      raise Exception.Create('您的软件版本较低,请先升级软件！');

    if RemoteServer.Maintaining then
      raise Exception.Create(AppCore.IniFile.ReadString(sAppSection,
        'MaintainText', '服务器正在维护，马上回来...'));

    Conn := NewConnection;

    // 调用登录存储过程，执行成功说明密码正确
    with DASchema.NewCommand(Conn, 'Pro_Sys_Op_Login',
      ['UserID', 'Password', 'AppID', 'AppVer', 'ResVer', 'ClientAddress', 'ServerID'],
      [UserID, Password, AppID, AppVer, ResVer, ClientAddress, RemoteServer.ServerID]) do
    begin
      // 返回非0值，并且无错误时，直接返回
      if ParamByName('Return_Value').AsInteger <> 0 then
        Exit;

      UserName := ParamByName('UserName').AsString;
      OfficeID := ParamByName('OfficeID').AsString;
      OfficeName := ParamByName('OfficeName').AsString;
      AccessList := ParamByName('AccessList').AsString;
      ExtendList := ParamByName('ExtendList').AsString;

      //AppCore.Logger.Write('权限列表: ' + AccessList, mtInfo, 0);
      //AppCore.Logger.Write('扩展列表: ' + ExtendList, mtInfo, 0);
    end;

    // 只有RequiresSession属性为False的模块中才能建立起Session，并只在访问时建立
    with Sender.Session do
    begin
      Values['AppID'] := AppID;
      Values['AppVer'] := AppVer;
      Values['UserID'] := UserID;
      Values['UserName'] := UserName;
      Values['OfficeID'] := OfficeID;
      Values['OfficeName'] := OfficeName;
      Values['AccessList'] := AccessList;
      Values['ClientAddress'] := ClientAddress;
      Values['LoginTime'] := Now();
    end;

    // ResultStrings.Add('OK');
    ResultStrings.Add('ServerName=' + RemoteServer.ServerName);
    ResultStrings.Add('UserID=' + UserID);
    ResultStrings.Add('UserName=' + UserName);
    ResultStrings.Add('OfficeID=' + OfficeID);
    ResultStrings.Add('OfficeName=' + OfficeName);
    ResultStrings.Add('Accesses=' + AccessList);
    ResultStrings.Add(ExtendList);

    Result := ResultStrings.Text;

  finally    
  
    AppCore.Logger.WriteFmt('登录|UserID=%s|AppID=%s|AppVer=%s|ResVer=%s|IP=%s|Office=%s',
      [UserID, AppID, AppVer, ResVer, ClientAddress, OfficeName], mtInfo, 0);

    FreeAndNil(LoginStrings);
    FreeAndNil(ResultStrings);
  end;
end;

procedure TSystemBackend.Logout(Sender: TRORemoteDataModule);
begin
  try
    AppCore.Logger.WriteFmt('注销|UserID=%s|UserName=%s|IP=%s|Office=%s',
      [Sender.Session.Values['UserID'],
      Sender.Session.Values['UserName'],
      Sender.Session.Values['ClientAddress'],
      Sender.Session.Values['OfficeName']],
      mtInfo, 0);

    DASchema.NewCommand(NewConnection, 'Pro_Sys_Op_Logout',
        ['UserID'],
        [Sender.Session.Values['UserID']]);
  finally
    Sender.DestroySession;
  end;
end;

function TSystemBackend.LookupValue(const ATableName, AKeyFieldName,
  AResultFieldName: string; AKeyFieldValue: Variant): Variant;
var
  KeyValue: string;
begin
  Result := Unassigned;

  case VarType(AKeyFieldValue) of
    varString: KeyValue := QuotedStr(AKeyFieldName);
    else
      KeyValue := VarToStr(AKeyFieldValue);
  end;
  with RemoteServer.NewConnection.NewDataset(
    Format('Select top 1 %s from %s where %s = %s',
    [AResultFieldName, ATableName, AKeyFieldName, AKeyFieldValue])) do
  begin
    Open;
    if not IsEmpty then Result := FieldByName(AResultFieldName).AsVariant;
  end;
end;

function TSystemBackend.NewConnection: IDAConnection;
begin
  Result := RemoteServer.NewConnection('His_Sys');
end;

function TSystemBackend.Pwd_Client_Decrypt(
  APassword: string): string;
begin
  Result := DecryptString(APassword, 'TwoFish', '')
end;

function TSystemBackend.Pwd_Server_Decrypt(
  APassword: string): string;
begin
  Result := DecryptString(APassword, 'Shark', '');
end;

function TSystemBackend.Pwd_Server_Encrypt(
  APassword: string): string;
begin
  Result := EncryptString(APassword, 'Shark', '');
end;

function TSystemBackend.ResetPassword(Sender: TDataAbstractService;
  const AUserID, ANewPassword: AnsiString): Boolean;
begin
  GetSchema.NewCommand(NewConnection, 'Pro_Sys_Op_ResetPwd',
    ['OpID', 'NewPassword'],
    [AUserID, ANewPassword]);

  Result := True;       
end;

function TSystemBackend.WriteLog(Sender: TDataAbstractService;
  const AUserID, AFlag: Integer; const ATitle,
  AContent: AnsiString): Integer;
var
  Conn: IDAConnection;
begin
  Conn := NewConnection;
  Conn.BeginTransaction;
  try
    DASchema.NewCommand(Conn, 'Cmd_WriteLog',
      ['FLogTime', 'FWorkerID', 'FFlag', 'FTitle', 'FContent', 'FClientIP'],
      [Now(), AUserID, AFlag, ATitle, AContent,
      IROTCPTransport(Sender.Transport).ClientAddress]).Execute;
    Result := Conn.GetLastAutoIncValue();
    Conn.CommitTransaction;
  except
    Conn.RollbackTransaction;
  end;
end;

procedure TSystemBackend.WriteParam(Sender: TDataAbstractService;
  const AParamName: AnsiString; const AParamValue: Variant);
begin

end;

initialization
  SystemBackend := TSystemBackend.Create(nil);

finalization
  FreeAndNil(SystemBackend);

end.

