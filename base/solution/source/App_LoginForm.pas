unit App_LoginForm;

{
  用户操作

  1 登录
  2 修改密码
  3 配置连接
  4 启动升级

  Written by caowm (remobjects@qq.com)
  2014年9月
}

interface

uses
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  StdCtrls,
  Buttons,
  ExtCtrls,
  Menus,
  ShellAPI,
  StrUtils,
  uROClient,
  uROClasses,
  uRODL,
  uROTransportChannel,
  App_Function,
  App_Common,
  App_Class,
  App_DAModel,
  dxLayoutControl,
  dxLayoutContainer,
  cxControls,
  cxLookAndFeelPainters,
  cxButtons,
  cxMaskEdit,
  cxContainer,
  cxEdit,
  cxTextEdit,
  cxSpinEdit,
  cxGraphics,
  cxLookAndFeels,
  cxDropDownEdit,
  cxLabel;

type
  TOnLoginEvent = function(const AUserID, APassword: string): Boolean of object;
  TOnChangePasswordEvent = function(const AOldPassword, ANewPassword: string)
    : Boolean of object;

  {
    用户、操作员基类

    1. 登录后自动设置Operation的Visible属性
    2. 设置ROClient.SuperChannel.SuperChannelLoginNeeded超时需登录事件
  }
  TUser = class(TBaseUser)
  private
    FConnection: TROConnection;
    FRoleID, FRoleName: string;
    FServerName: string;
    FServerTime: TDateTime;
    function CallLogin(const AWorkerNum, APassword: string): Boolean;
    procedure DisableOpertionsBeforeLogin(AOperation: TBaseOperation);
    procedure EnableOperationsAfterLogin(AOperation: TBaseOperation);
    procedure ChannelLoginNeeded(Sender: TROTransportChannel;
      anException: Exception; var aRetry: Boolean);
    function GetServerTime: TDateTime;
  protected
    procedure DoAfterLogin(LoginInfo: TStrings); virtual;
  public
    constructor Create(AConnection: TROConnection);
    destructor Destroy(); override;

    function DoLogin(const AWorkerNum, APassword: string): Boolean; override;
    function DoChangePassword(const AOldPassword, ANewPassword: string)
      : Boolean; override;
    function ConfigureConnection(): Boolean; virtual;
    procedure SelectConnection(); virtual;
    procedure Logout(); override;
    function HaveAccess(const AAccessID: string): Boolean; override;

    procedure DisableOperations();
    procedure EnableOperations();

    property ROConnection: TROConnection read FConnection;
    property RoleID: string read FRoleID write FRoleID;
    property RoleName: string read FRoleName write FRoleName;
    property ServerName: string read FServerName write FServerName;
    property ServerTime: TDateTime read GetServerTime;
  end;

  TLoginForm = class(TForm)
    PasswordEdit: TcxTextEdit;
    Label1: TLabel;
    Label2: TLabel;
    ImageLogin: TImage;
    OKBtn: TcxButton;
    IDCombo: TcxComboBox;
    UpdateButton: TcxButton;
    ServerButton: TcxButton;
    AppLabel: TcxLabel;
    ImageLogo: TImage;
    procedure IDComboKeyPress(Sender: TObject; var Key: Char);
    procedure PasswordEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure OkBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure UpdateButtonClick(Sender: TObject);
    procedure ServerButtonClick(Sender: TObject);
  private
    FUser: TUser;
    FErrorCount: Integer;
    function GetWorkerNum: string;
    function GetWorkerPassword: string;
    procedure ClearWorkerNum();
    procedure IDButtonClick(Sender: TObject; AButtonIndex: Integer);
  public
    property UserID: string read GetWorkerNum;
    property Password: string read GetWorkerPassword;
  end;

  TChangePasswordForm = class(TBaseDialog)
  private
    OldPassEdit, NewPassEdit, NewPassEdit2: TcxTextEdit;
    FOnChangeEvent: TOnChangePasswordEvent;
  protected
    procedure BuildDialog(); override;
    procedure DoDialogOK(Sender: TObject); override;
  public
    property OnChangePasswordEvent: TOnChangePasswordEvent read FOnChangeEvent
      write FOnChangeEvent;

    class function ChangePass(AOnChangePassword
      : TOnChangePasswordEvent): Boolean;
  end;

function ShowLoginForm(AUser: TUser): Boolean;
// todo: 在登录窗体上根据注册表创建操作按钮或菜单
// procedure RegisterLoginOperation(AOperationID: string);

implementation

const
  sLoginForm = 'LoginForm';

{$R *.dfm}
  { 软件升级，更新自身或其他
    AParam[0]: 是否关闭当前窗体
    AParam[1]: AppID
    AParam[2]: AppPath
    AParam[3]: AppExeName
  }

function Function_UpdateApp(const AParam: array of Variant): Variant;
const
  sFileName = '%s\UpdateClient\bin\UpdateClient.exe ';
  sParam = '-AppID "%s" -AppPath "%s" -AppExe "%s"';
var
  UpdateClient: string; // 更新客户端
  CloseWindow: Boolean;
  AppID: string;
  AppPath: string;
  AppExe: string;
  ShellParam: string;
begin
  UpdateClient := ExtractFileDir(ExcludeTrailingBackslash(AppCore.AppPath));
  UpdateClient := Format(sFileName, [UpdateClient]);

  if Length(AParam) = 0 then
  begin
    // 更新自身
    CloseWindow := True;
    AppID := AppCore.ID;
    AppPath := AppCore.AppPath;
    AppExe := AppCore.BinPath + AppCore.ExeName;
  end
  else
  begin
    CloseWindow := AParam[0];
    AppID := AParam[1];
    AppPath := AParam[2];
    AppExe := AParam[3];
  end;

  Check(not FileExists(UpdateClient), '未找到更新客户端.');

  // if CloseWindow then
  // if not ShowYesNo('软件将关闭，确定升级吗?') then
  // Exit;

  if CloseWindow and (Screen.ActiveForm <> nil) then
    Screen.ActiveForm.Close;

  // 文件和参数不能合在一起，否则太长系统不执行
  ShellParam := Format(sParam, [AppID, AppPath, AppExe]);
  ShellExecute(0, nil, PChar(UpdateClient), PChar(ShellParam), nil, 0);
end;

{ 配置连接参数 }

function Function_ConfigConnection(const AParam: array of Variant): Variant;
begin
end;

{ TLoginForm }

procedure TLoginForm.PasswordEditKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    OKBtn.Click;
end;

procedure TLoginForm.OkBtnClick(Sender: TObject);
begin
  try
    if FUser.DoLogin(UserID, Password) then
    begin
      // 把当前工号移到登录历史列表最前面
      if (IDCombo.Properties.Items.IndexOf(UserID) >= 0) then
        IDCombo.Properties.Items.Delete
          (IDCombo.Properties.Items.IndexOf(UserID));
      IDCombo.Properties.Items.Insert(0, IDCombo.Text);
      ModalResult := mrOk;
    end
  except
    Inc(FErrorCount);
    if FErrorCount >= 5 then
    begin
      ShowWarning('登录出错达到5次, 软件将自动关闭!');
      ModalResult := mrCancel;
    end
    else
      raise;
  end;
end;

procedure TLoginForm.FormCreate(Sender: TObject);
begin
  FErrorCount := 0;
  Caption := Application.Title + ' 用户登录';
  AppLabel.Caption := 'AppID:' + AppCore.ID + '  版本:' + AppCore.Version;
  Width := AppCore.IniFile.ReadInteger(sLoginForm, 'FormWidth', Width);
  Height := AppCore.IniFile.ReadInteger(sLoginForm, 'FormHeight', Height);
  // IDCombo.Text := AppCore.IniFile.ReadString(sLoginForm, 'WorkerID', '');
  // IDCombo.Properties.Items.CommaText := AppCore.IniFile.ReadString(sLoginForm, 'WorkerList', '');

  with IDCombo.Properties.Buttons.Add do
  begin
    Hint := '删除';
    Caption := '×';
    Kind := bkText; // bkText; bkGlyph;
    // AppCore.SmallImage.ImageList.GetBitmap(AppCore.SmallImage.IndexOf('del'), Glyph);
  end;
  IDCombo.Properties.OnButtonClick := IDButtonClick;

  if FileExists(AppCore.ImagePath + 'login.png') then
  begin
    ImageLogin.Picture.LoadFromFile(AppCore.ImagePath + 'login.png');
    // ImageLogin.Left := 0;
    // ImageLogin.Top := 0;
    if (ImageLogin.Width > Constraints.MinWidth) and
      (ImageLogin.Height > Constraints.MinHeight) then
    begin
      BorderStyle := bsSingle;
      ClientWidth := ImageLogin.Width;
      ClientHeight := ImageLogin.Height;
    end;
  end;

  if FileExists(AppCore.ImagePath + 'logo.png') then
  begin
    ImageLogo.Picture.LoadFromFile(AppCore.ImagePath + 'logo.png');
  end;
end;

function ShowLoginForm(AUser: TUser): Boolean;
begin
  with TLoginForm.Create(nil) do
  begin
    FUser := AUser;
    Result := ShowModal = mrOk;
    Free;
  end;
end;

procedure TLoginForm.FormShow(Sender: TObject);
begin
  // IDEdit.SetFocus;
  IDCombo.SetFocus;
end;

procedure TLoginForm.FormDestroy(Sender: TObject);
begin
  AppCore.IniFile.WriteString(sLoginForm, 'WorkerID', IDCombo.Text);
  AppCore.IniFile.WriteString(sLoginForm, 'WorkerList',
    IDCombo.Properties.Items.CommaText);
  AppCore.IniFile.WriteInteger(sLoginForm, 'FormWidth', Width);
  AppCore.IniFile.WriteInteger(sLoginForm, 'FormHeight', Height);
end;

procedure TLoginForm.IDButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  if AButtonIndex = 1 then
  begin
    ClearWorkerNum;
  end;
end;

procedure TLoginForm.ClearWorkerNum;
begin
  with IDCombo.Properties.Items do
  begin
    if IndexOf(IDCombo.Text) > -1 then
    begin
      Delete(IndexOf(IDCombo.Text));
    end;
    IDCombo.Text := '';
    if Count > 0 then
      IDCombo.ItemIndex := 0;
  end;
end;

procedure TLoginForm.IDComboKeyPress(Sender: TObject; var Key: Char);
begin
  if Ord(Key) = VK_RETURN then
    PasswordEdit.SetFocus;
end;

function TLoginForm.GetWorkerNum: string;
begin
  Result := IDCombo.Text;
end;

function TLoginForm.GetWorkerPassword: string;
begin
  Result := PasswordEdit.Text;
end;

{ TChangePasswordForm }

procedure TChangePasswordForm.BuildDialog;
begin
  inherited;

  ImageName := 'misc\key.png';
  Font := AppCore.MainView.Font;
  Caption := '设置新密码';
  BorderIcons := [biSystemMenu];
  BorderStyle := bsDialog;

  OldPassEdit := TcxTextEdit.Create(Self);
  OldPassEdit.Properties.MaxLength := 32;
  OldPassEdit.Properties.EchoMode := eemPassword;
  OldPassEdit.Width := 300;

  NewPassEdit := TcxTextEdit.Create(Self);
  NewPassEdit.Properties.MaxLength := 32;
  NewPassEdit.Properties.EchoMode := eemPassword;

  NewPassEdit2 := TcxTextEdit.Create(Self);
  NewPassEdit2.Properties.MaxLength := 32;
  NewPassEdit2.Properties.EchoMode := eemPassword;

  with DialogGroup do
  begin
    CreateItemForControl(OldPassEdit).Caption := '旧密码:';
    CreateItemForControl(NewPassEdit).Caption := '新密码:';
    CreateItemForControl(NewPassEdit2).Caption := '新密码:';
  end;
end;

class function TChangePasswordForm.ChangePass(AOnChangePassword
  : TOnChangePasswordEvent): Boolean;
begin
  with TChangePasswordForm.Create(nil) do
  begin
    OnChangePasswordEvent := AOnChangePassword;
    Result := ShowModal = mrOk;
    Free;
  end;
end;

procedure TChangePasswordForm.DoDialogOK(Sender: TObject);
begin
  if not Assigned(FOnChangeEvent) then
    raise Exception.Create('没有设置修改密码按钮事件');

  if NewPassEdit.Text <> NewPassEdit2.Text then
    raise Exception.Create('新密码输入不一致');

  if FOnChangeEvent(OldPassEdit.Text, NewPassEdit.Text) then
  begin
    ShowOK('密码修改成功');
    ModalResult := mrOk;
  end
  else
    ShowError('密码修改失败');
end;

procedure TLoginForm.UpdateButtonClick(Sender: TObject);
begin
  AppCore.Functions.Execute(iFunctionID_UpdateApp, []);
end;

procedure TLoginForm.ServerButtonClick(Sender: TObject);
begin
  // FUser.ConfigureConnection;
  FUser.SelectConnection;
end;

{ TUser }

function TUser.CallLogin(const AWorkerNum, APassword: string): Boolean;
var
  LoginStr: string;
  LoginInfo: TStringList;
begin
  LoginStr :=
    Format('UserID=%s'#13#10'Password=%s'#13#10'AppID=%s'#13#10'AppVer=%s'#13#10'ResVer=%s',
    [AWorkerNum, APassword, AppCore.ID, AppCore.Version,
    AppCore.ResourceVersion]);

  LoginInfo := TStringList.Create;
  try
    LoginInfo.Text := FConnection.Login(LoginStr);
    // (HisConnection.ROService as ILoginService).Login(LoginStr);
    // Check(LoginInfo.IndexOf('OK') < 0, '系统拒绝服务.');
    if LoginInfo.Values['Msg'] <> '' then
      ShowOK(LoginInfo.Values['Msg']);
    Result := True;

    // 如果时会话超时重新登录，则不能重置信息
    if not IsLogined then
    begin
      Name := LoginInfo.Values['UserName'];
      ID := LoginInfo.Values['UserID'];
      UnitName := StringReplace(LoginInfo.Values['UnitName'], '/', #13#10,
        [rfReplaceAll]);
      UnitID := LoginInfo.Values['UnitID'];
      Password := APassword;
      IsAdmin := StrToBoolDef(LoginInfo.Values['IsAdmin'], False);
      OfficeID := LoginInfo.Values['OfficeID'];
      OfficeName := LoginInfo.Values['OfficeName'];
      RoleID := LoginInfo.Values['RoleID'];
      RoleName := LoginInfo.Values['RoleName'];
      Accesses.CommaText := LoginInfo.Values['Accesses'];
      FServerName := LoginInfo.Values['ServerName'];
      FServerTime := StrToDateDef(LoginInfo.Values['ServerTime'], Now());
      IsLogined := True;
      DoAfterLogin(LoginInfo);
    end;
  finally
    FreeAndNil(LoginInfo);
  end;
end;

procedure TUser.DisableOpertionsBeforeLogin(AOperation: TBaseOperation);
begin
  // 业务Visible=False，并且不设置权限，才能不显示在菜单和操作目录中
  if AOperation.Visible then
    AOperation.Visible := AOperation.Access = '';
end;

procedure TUser.EnableOperationsAfterLogin(AOperation: TBaseOperation);
begin
  if (AOperation.Access <> '') then
    AOperation.Visible := HaveAccess(AOperation.Access)
end;

constructor TUser.Create(AConnection: TROConnection);
begin
  inherited Create();
  FConnection := AConnection;
end;

destructor TUser.Destroy;
begin
  Logout;
  inherited;
end;

function TUser.DoChangePassword(const AOldPassword, ANewPassword
  : string): Boolean;
begin
  ROConnection.MakeRequest(ROConnection.SystemServiceName, 'ChangePassword',
    ['UserID', 'OldPassword', 'NewPassord', 'Result'],
    [ID, AOldPassword, ANewPassword, False], [rtString, rtString, rtString,
    rtBoolean], [fIn, fIn, fIn, fResult]);
  Result := ROConnection.DynamicRequest.Params.ResultParam.AsBoolean;
  // 记录新密码，防止超时重新登录失败
  if Result then
    Password := ANewPassword;
end;

function TUser.DoLogin(const AWorkerNum, APassword: string): Boolean;
begin
  Logout;
  DisableOperations;

  Result := CallLogin(AWorkerNum, APassword);
  FConnection.Channel.OnLoginNeeded := ChannelLoginNeeded;
  if Result then
  begin
    LoginSubject.Notify(Self); // 放在设置操作项之前
    AppCore.Logger.WriteFmt('%s|%s|登录的服务器: %s', [ID, Name, ServerName],
      mtInfo, 0);
    EnableOperations();
  end
end;

{ 拥有父权限ID，即拥有一切子权限，方便权限分配 }
function TUser.HaveAccess(const AAccessID: string): Boolean;
  function HaveParentAccess(ID: string): Boolean;
  begin
    Result := Accesses.IndexOf(ID) > -1;
    if not Result and (Length(ID) > 2) then
      Result := HaveParentAccess(LeftStr(ID, Length(ID) - 2));
  end;

begin
  Result := IsAdmin or (AAccessID = '') or HaveParentAccess(AAccessID);
end;

procedure TUser.Logout;
begin
  if IsLogined then
  begin
    IsLogined := False;
    Name := '';
    Password := '';
    OfficeID := '';
    OfficeName := '';
    RoleID := '';
    RoleName := '';
    Accesses.Clear;
    IsAdmin := False;
    try
      // (HisConnection.ROService as ILoginService).Logout();
      FConnection.Logout;
    except
      // 防止在注销时程序无法退出
      on E: Exception do
        AppCore.Logger.WriteFmt('注销失败|%s', [E.Message], mtWarning, 0)
    end;
    LoginSubject.Notify(Self);
  end;
end;

procedure TUser.ChannelLoginNeeded(Sender: TROTransportChannel;
  anException: Exception; var aRetry: Boolean);
begin
  aRetry := CallLogin(ID, Password);
end;

function TUser.ConfigureConnection: Boolean;
begin
  with TTextDialog.Create(nil) do
  begin
    Caption := '配置服务器';
    EditItem.Caption := '服务器地址:';
    Text := ROConnection.TargetUrl;
    Result := Execute;
    if Result then
      ROConnection.TargetUrl := Text;
    Free;
  end;
end;

procedure TUser.DoAfterLogin(LoginInfo: TStrings);
begin

end;

procedure TUser.SelectConnection;
var
  Dialog: TSelectDialog;
begin
  Dialog := TSelectDialog.Create(nil);
  with Dialog do
  begin
    Caption := '选择服务器';
    // DialogGroup.Caption := '服务器列表';
    // DialogGroup.ShowBorder := True;
    ListBox.Width := 400;
    ListBox.Height := 80;
    Selections.Assign(ROConnection.TargetList);
    SelectIndex := ROConnection.TargetIndex;
    if Execute then
      ROConnection.TargetIndex := SelectIndex;
    Free;
  end;
end;

procedure TUser.DisableOperations;
begin
  // 根据权限设置Operation
  AppCore.Operations.ForEach(DisableOpertionsBeforeLogin);
end;

procedure TUser.EnableOperations;
begin
  // 根据权限设置Operation
  AppCore.Operations.ForEach(EnableOperationsAfterLogin);
end;

function TUser.GetServerTime: TDateTime;
begin
  Result := FServerTime;
end;

initialization

AppCore.Functions.Register(iFunctionID_UpdateApp, Function_UpdateApp);

end.
