unit App_DALocalServer;

{
    本地直连服务器
}

interface

uses
  SysUtils,
  Classes,
  Forms,
  StrUtils,
  SyncObjs,
  Windows,
  DB,
  ADODB,
  Contnrs,
  App_Common,
  uROClient,
  uROClasses,
  uROClientIntf,
  uROServer,
  uROBinMessage,
  uDAEngine,
  uDADriverManager,
  uDAInterfaces,
  uDAClasses,
  uDAADODriver,
  uROLocalServer;

const
  DebugEventID = 0;
  InfoEventID = 1;
  WarnEventID = 2;
  ErrorEventID = 3;
  FatalEventID = 4;

  sServerSection = 'RemoteServer';

type

  TServiceSchema = class
    Schema: TDASchema;
    ServiceName: string;
    ConnectionName: string;
  end;

  TLocalServer = class(TDataModule)
    BinMessage: TROBinMessage;
    DriverManager: TDADriverManager;
    ADODriver: TDAADODriver;
    ConnectionManager: TDAConnectionManager;
    ROLocalServer: TROLocalServer;
    MainSchema: TDASchema;

    procedure DataModuleCreate(Sender: TObject);
    procedure BinMessageWriteException(Sender: TROMessage; aStream: TStream;
      E: Exception);
    procedure BinMessageServerException(anException: Exception;
      var RaiseException: Boolean);
    procedure DataModuleDestroy(Sender: TObject);
  private
    FSchemas: TObjectList;
    procedure LoadState();
    procedure SaveState();
  public
    procedure LoadConnections();
    procedure LoadSchema();

    procedure RegisterServiceSchema(ASchema: TDASchema; AServiceName, AConnectionName: string);
    function GetServiceSchema(const AServiceName: string): TServiceSchema;
    function NewConnection(AConnectionName: string = ''): IDAConnection;
    procedure LoadSchemaFromFile(ASchema: TDASchema; AFileName: string);
  end;

function ADOString2DAString(const ADOConStr: string): string;
function DAString2ADOString(const DAConStr: string): string;

var
  LocalServer: TLocalServer;

implementation

{$R *.dfm}

type
  TROServerHack = class(TROServer);

function ADOString2DAString(const ADOConStr: string): string;
var
  SL1: TStringList;
begin
  SL1 := TStringList.Create;
  try
    SL1.CaseSensitive := False;
    SL1.Delimiter := ';';
    SL1.DelimitedText := ADOConStr;
    if SL1.ValueFromIndex[0] <> 'SQLOLEDB.1' then
      raise Exception.Create('SQL Server配置错误');

    Result := 'ADO?AuxDriver=SQLOLEDB.1';
    Result := Result + ';Server=' + SL1.Values['Source'];
    Result := Result + ';Database=' + SL1.Values['Catalog'];
    if SL1.Values['Security'] <> '' then
      Result := Result + ';Integrated Security=' + SL1.Values['Security']
    else
    begin
      Result := Result + ';UserID=' + SL1.Values['ID'];
      Result := Result + ';Password=' + SL1.Values['Password'];
    end;
  finally
    SL1.Free;
  end;
end;

function DAString2ADOString(const DAConStr: string): string;
var
  SL1: TStringList;
begin
  SL1 := TStringList.Create;
  try
    SL1.CaseSensitive := False;
    SL1.Delimiter := ';';
    SL1.DelimitedText := DAConStr;

    Result := 'Provider=SQLOLEDB.1;Persist Security Info=True';
    Result := Result + ';Data Source=' + SL1.Values['Server'];
    Result := Result + ';Initial Catalog=' + SL1.Values['Database'];
    if SL1.Values['Security'] <> '' then
      Result := Result + ';Integrated Security=' + SL1.Values['Security']
    else
    begin
      Result := Result + ';User ID=' + SL1.Values['UserID'];
      Result := Result + ';Password=' + SL1.Values['Password'];
    end;
  finally
    SL1.Free;
  end;
end;

procedure TLocalServer.BinMessageWriteException(Sender: TROMessage;
  aStream: TStream; E: Exception);
begin
  AppCore.Logger.WriteFmt('服务器错误|%s', [ E.Message], mtError, 0);
end;

procedure TLocalServer.BinMessageServerException(anException: Exception;
  var RaiseException: Boolean);
begin
  AppCore.Logger.Write(anException.Message, mtError, 0);
end;

procedure TLocalServer.DataModuleCreate(Sender: TObject);
begin
  FSchemas := TObjectList.Create(True);
  LoadState;
end;

procedure TLocalServer.DataModuleDestroy(Sender: TObject);
begin
  FreeAndNil(FSchemas);
  SaveState;
end;

procedure TLocalServer.LoadConnections;
var
  FileName: string;
begin
  FileName := AppCore.BinPath + 'Connection.daConnections';
  if FileExists(FileName) then
  begin
    ConnectionManager.LoadFromFile(FileName);
    AppCore.Logger.Write(FileName + '加载成功', mtInfo, 0);
  end;
end;

procedure TLocalServer.LoadSchema;
begin
  LoadSchemaFromFile(MainSchema, 'MainSchema.daSchema');
end;

procedure TLocalServer.LoadState;
begin
  ConnectionManager.PoolingEnabled := AppCore.IniFile.ReadBool(sServerSection,
    'ConnectionPoolingEnabled', True);

  ConnectionManager.MaxPoolSize := AppCore.IniFile.ReadInteger(sServerSection,
    'ConnectionMaxPoolSize', 2);   
  // 根据配置参数启动服务器
  // 加载数据库连接定义
  LoadConnections;
  LoadSchema;
end;

function TLocalServer.NewConnection(AConnectionName: string): IDAConnection;
begin
  if AConnectionName = '' then
    AConnectionName := ConnectionManager.GetDefaultConnectionName;
  Result := ConnectionManager.NewConnection(AConnectionName);
end;

procedure TLocalServer.SaveState;
begin
  with AppCore.IniFile do
  begin
    
  end;
end;

function TLocalServer.GetServiceSchema(const AServiceName: string): TServiceSchema;
var
  I: Integer;
begin
  Result := nil;
  for I := 0 to FSchemas.Count - 1 do
  begin
    if SameText(AServiceName, TServiceSchema(FSchemas[I]).ServiceName) then
    begin
      Result := TServiceSchema(FSchemas[I]);
      Break;
    end;
  end;  
  Check(Result = nil, '%s服务的Schema未注册', [AServiceName]);
end;

// 注册全局服务Schema

procedure TLocalServer.RegisterServiceSchema(ASchema: TDASchema;
  AServiceName, AConnectionName: string);
var
  Temp: TServiceSchema;
begin
  Temp := TServiceSchema.Create;
  with Temp do
  begin
    Schema := ASchema;
    ServiceName := AServiceName;
    ConnectionName := AConnectionName;
  end;
  FSchemas.Add(Temp);
end;

procedure TLocalServer.LoadSchemaFromFile(ASchema: TDASchema;
  AFileName: string);
begin
  AFileName := AppCore.BinPath + AFileName;
  if FileExists(AFileName) then
  begin
    ASchema.LoadFromFile(AFileName);
    AppCore.Logger.Write(AFileName + '加载成功', mtInfo, 0);
  end;
end;

initialization
  LocalServer := TLocalServer.Create(Application);

end.

