unit App_RemoteServer;

{
    远程服务器
    1 可根据需要启动服务器
    2 JSON格式的问题：GetSchema调用很慢、GetData无动态查询条件？？？
      XMLRPC/SOAP: GetData无动态查询条件???
      
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
  uROIndyHTTPServer,
  uDAEngine,
  uDADriverManager,
  uDAInterfaces,
  //uDAClasses,
  uROSessions,
  uDAADODriver,
  uROIndyTCPServer,
  uROBaseHTTPServer,
  uROEventRepository,
  uROBaseSuperTCPServer,
  uROSuperTCPServer,
  uROXmlRpcMessage,
  uROJSONMessage,
  uROSOAPMessage,
  uROWinMessageServer,
  uDADataStreamer,
  uDAXMLAdapter,
  uROLocalServer, TypInfo, uDAServerInterfaces, uROServerIntf,
  uROCustomRODLReader, uROXMLIntf, uDAFields, uDADelta,
  uROCustomHTTPServer, uDAClientSchema, uDASchema, uROBaseConnection,
  uDAStreamableComponent, uDAConnectionManager, uROComponent, uROMessage;

const
  DebugEventID = 0;
  InfoEventID = 1;
  WarnEventID = 2;
  ErrorEventID = 3;
  FatalEventID = 4;

  sServerSection = 'RemoteServer';
  sServerNullName = '没有配置服务器名';
  sServerConfig = '%s服务器启动成功, 端口号: %d';
  sServerConfig2 = '%s服务器启动成功, 窗口ID: %s';

type

  TServiceSchema = class
    Schema: TDASchema;
    ServiceName: string;
    ConnectionName: string;
  end;

  TRemoteServer = class(TDataModule)
    BinMessage: TROBinMessage;
    DriverManager: TDADriverManager;
    SessionManager: TROInMemorySessionManager;
    ADODriver: TDAADODriver;
    EventRepository: TROInMemoryEventRepository;
    ConnectionManager: TDAConnectionManager;
    SuperServer: TROSuperTCPServer;
    ServerSchema: TDASchema;
    HTTPServer: TROIndyHTTPServer;
    XmlRpcMessage: TROXmlRpcMessage;
    JSONMessage: TROJSONMessage;
    TCPServer: TROIndyTCPServer;
    SOAPMessage: TROSOAPMessage;
    WinServer: TROWinMessageServer;
    MainSchema: TDASchema;
    ROLocalServer: TROLocalServer;

    procedure DataModuleCreate(Sender: TObject);
    procedure BinMessageWriteException(Sender: TROMessage; aStream: TStream;
      E: Exception);
    procedure BinMessageServerException(anException: Exception;
      var RaiseException: Boolean);
    procedure DataModuleDestroy(Sender: TObject);
  private
    FServerName: string;
    FLoginConnectionName: string;
    FSchemas: TObjectList;
    procedure LoadState();
    procedure SaveState();
  public
    procedure StartHttpServer();
    procedure StartTcpServer();
    procedure StartSuperServer();
    procedure StartWinServer();
    procedure LoadConnections();
    procedure LoadSchema();

    procedure RegisterServiceSchema(ASchema: TDASchema; AServiceName, AConnectionName: string);
    function GetServiceSchema(const AServiceName: string): TServiceSchema;
    function NewConnection(AConnectionName: string = ''): IDAConnection;
    procedure LoadSchemaFromFile(ASchema: TDASchema; AFileName: string);
    
    property ServerName: string read FServerName write FServerName;
    property LoginConnectionName: string read FLoginConnectionName;
  end;

function ADOString2DAString(const ADOConStr: string): string;
function DAString2ADOString(const DAConStr: string): string;

var
  RemoteServer: TRemoteServer;

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

procedure StartServer(Server: TROServer; ServerProtocal: string);
begin
  with TROServerHack(Server) do
  try
    Active := False;
    Port := AppCore.IniFile.ReadInteger(sServerSection, ServerProtocal + 'Port', Port);
    Active := AppCore.IniFile.ReadBool(sServerSection, ServerProtocal + 'Active', False);
    if Active then
      AppCore.Logger.WriteFmt(sServerConfig, [ClassName, Port], mtInfo, 0);
  except
    on E: Exception do
      AppCore.Logger.Write(E.Message, mtError, 0);
  end;
end;

{ TRemoteServer }

procedure TRemoteServer.BinMessageWriteException(Sender: TROMessage;
  aStream: TStream; E: Exception);
var
  S: string;
  Session: TROSession;
begin
  Session := SessionManager.FindSession(Sender.ClientID);
  if Session <> nil then
    S := Format('服务器错误|%s|%s|%s|%s|%s|', [Session.Values['ClientAddress'],
      Session.Values['AppID'], Session.Values['AppVer'],
      Session.Values['UserID'], Session.Values['UserName']]);
  AppCore.Logger.Write(S + E.Message, mtError, 0);
end;

procedure TRemoteServer.BinMessageServerException(anException: Exception;
  var RaiseException: Boolean);
begin
  AppCore.Logger.Write(anException.Message, mtError, 0);
end;

procedure TRemoteServer.DataModuleCreate(Sender: TObject);
begin
  FSchemas := TObjectList.Create(True);
  LoadState;
end;

procedure TRemoteServer.DataModuleDestroy(Sender: TObject);
begin
  FreeAndNil(FSchemas);
  SaveState;
end;

procedure TRemoteServer.LoadConnections;
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

procedure TRemoteServer.LoadSchema;
begin
  // ServerSchema定义系统内容, 如用户、权限、日志等
  LoadSchemaFromFile(ServerSchema, 'ServerSchema.daSchema');
  // MainSchema定义业务内容
  LoadSchemaFromFile(MainSchema, 'MainSchema.daSchema');
end;

procedure TRemoteServer.LoadState;
begin
  // 读取服务器名称
  FServerName := AppCore.IniFile.ReadString(sServerSection,
    'ServerName', sServerNullName); 
  // 读取登录连接名称，如果没有定义则使用默认的连接
  FLoginConnectionName := AppCore.IniFile.ReadString(sServerSection,
    'LoginConnectionName', '');
  ConnectionManager.PoolingEnabled := AppCore.IniFile.ReadBool(sServerSection,
    'ConnectionPoolingEnabled', True);
  ConnectionManager.MaxPoolSize := AppCore.IniFile.ReadInteger(sServerSection,
    'ConnectionMaxPoolSize', 50);
  ConnectionManager.WaitIntervalSeconds := AppCore.IniFile.ReadInteger(sServerSection,
    'ConnectionWaitIntervalSeconds', 5);
  // 根据配置参数启动服务器
  StartHttpServer;
  StartTcpServer;
  StartSuperServer;
  StartWinServer;
  // 加载数据库连接定义
  LoadConnections;
  LoadSchema;
end;

function TRemoteServer.NewConnection(AConnectionName: string): IDAConnection;
begin
  if AConnectionName = '' then
    AConnectionName := ConnectionManager.GetDefaultConnectionName;
  Result := ConnectionManager.NewConnection(AConnectionName);
end;

procedure TRemoteServer.SaveState;
begin
  with AppCore.IniFile do
  begin
    WriteString(sServerSection, 'ServerName', ServerName);
    WriteInteger(sServerSection, 'HttpPort', HTTPServer.Port);
    WriteBool(sServerSection, 'HttpActive', HTTPServer.Active);
    WriteInteger(sServerSection, 'TcpPort', TcpServer.Port);
    WriteBool(sServerSection, 'TcpActive', TcpServer.Active);
    WriteInteger(sServerSection, 'SupertcpPort', SuperServer.Port);
    WriteBool(sServerSection, 'SupertcpActive', SuperServer.Active);
    WriteString(sServerSection, 'WinServerID', WinServer.ServerID);
    WriteBool(sServerSection, 'WinActive', WinServer.Active);
  end;
end;

procedure TRemoteServer.StartHttpServer;
begin
  StartServer(HttpServer, 'Http');
end;

procedure TRemoteServer.StartSuperServer;
begin
  StartServer(SuperServer, 'Supertcp');
end;

procedure TRemoteServer.StartTcpServer;
begin
  StartServer(TcpServer, 'Tcp');
end;

procedure TRemoteServer.StartWinServer;
begin
  with WinServer do
  try
    Active := False;
    ServerID := AppCore.IniFile.ReadString(sServerSection, 'WinServerID', ServerID);
    Active := AppCore.IniFile.ReadBool(sServerSection, 'WinActive', False);
    if Active then
      AppCore.Logger.WriteFmt(sServerConfig2, [ClassName, ServerID], mtInfo, 0);
  except
    on E: Exception do
      AppCore.Logger.Write(E.Message, mtError, 0);
  end;
end;

function TRemoteServer.GetServiceSchema(const AServiceName: string): TServiceSchema;
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

procedure TRemoteServer.RegisterServiceSchema(ASchema: TDASchema;
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

procedure TRemoteServer.LoadSchemaFromFile(ASchema: TDASchema;
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
  RemoteServer := TRemoteServer.Create(Application);

end.

