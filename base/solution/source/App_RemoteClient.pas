unit App_RemoteClient;

{
  RemObjects DataAbstrat客户端通讯组件库

  1. 默认使用SuperTCP，可在Organizer中设置为其他通讯通道
  2. 组件自动加载和保存配置
}

interface

uses
  SysUtils,
  Classes,
  Forms,
  Windows,
  Dialogs,
  DB,
  App_Common,
  uROClient,
  DataAbstract4_Intf,
  uROClientIntf,
  uDAScriptingProvider,
  uDADataTable,
  uDAMemDataTable,
  uRODynamicRequest,
  uDARemoteDataAdapter,
  uDADataStreamer,
  uDABin2DataStreamer,
  uRORemoteService,
  uROBinMessage,
  uDAInterfaces,
  uROEventRepository,
  uROSuperTCPChannel,
  uROBaseSuperChannel,
  uROBaseSuperTCPChannel,
  uDADataAdapter,
  uROBaseHTTPClient,
  uROIndyHTTPChannel,
  uDARemoteCommand,
  uDADesigntimeCall;


type
  TROClient = class(TDataModule)
    BinMessage: TROBinMessage;
    RemoteService: TRORemoteService;
    DataStreamer: TDABin2DataStreamer;
    DataAdapter: TDARemoteDataAdapter;
    TestTable: TDAMemDataTable;
    TestSource: TDADataSource;
    EventReceiver: TROEventReceiver;
    DARemoteCommand: TDARemoteCommand;
    DADesigntimeCall: TDADesigntimeCall;
    LoginService: TRORemoteService;
    DATestCall: TDADesigntimeCall;
    SuperChannel: TROSuperTCPChannel;
    HttpChannel: TROIndyHTTPChannel;
    procedure DataAdapterBeforeGetDataCall(Sender: TObject; Request: TRODynamicRequest);
    procedure DataAdapterAfterGetDataCall(Sender: TObject; Request: TRODynamicRequest);
    procedure DataAdapterGetSchemaCallBeforeExecute(Sender: TRODynamicRequest);
    procedure DataAdapterUpdateDataCallAfterExecute(Sender: TRODynamicRequest);
    procedure DataAdapterUpdateDataCallExecuteError(Sender: TRODynamicRequest;
      Error: Exception; var Ignore: Boolean);
    procedure DataAdapterUpdateDataCallBeforeExecute(
      Sender: TRODynamicRequest);
  private
    PerformanceCounter1, PerformanceCounter2, PerformanceFrequency: Int64;
  public
  end;

var
  ROClient: TROClient;

implementation

{$R *.dfm}

const
  sConfigSection = 'RemoteClient';

{ TRemoteClientModule }

procedure TROClient.DataAdapterBeforeGetDataCall(Sender: TObject;
  Request: TRODynamicRequest);
begin
  AppCore.Logger.Write('正在查询数据...', mtDebug, 0);
  QueryPerformanceCounter(PerformanceCounter1);
end;

procedure TROClient.DataAdapterAfterGetDataCall(Sender: TObject;
  Request: TRODynamicRequest);
begin
  QueryPerformanceCounter(PerformanceCounter2);
  QueryPerformanceFrequency(PerformanceFrequency);
  AppCore.Logger.WriteFmt('查询用时 %0.3f 秒',
    [(PerformanceCounter2 - PerformanceCounter1) / PerformanceFrequency],
    mtDebug, 0);
end;

procedure TROClient.DataAdapterGetSchemaCallBeforeExecute(
  Sender: TRODynamicRequest);
begin
  AppCore.Logger.Write('数据适配器正在查询Schema...', mtDebug, 0);
end;

procedure TROClient.DataAdapterUpdateDataCallBeforeExecute(
  Sender: TRODynamicRequest);
begin
  AppCore.Logger.Write('正在提交数据...', mtDebug, 0);
end;

procedure TROClient.DataAdapterUpdateDataCallAfterExecute(
  Sender: TRODynamicRequest);
begin
  AppCore.Logger.Write('数据提交成功', mtDebug, 0);
end;

procedure TROClient.DataAdapterUpdateDataCallExecuteError(
  Sender: TRODynamicRequest; Error: Exception; var Ignore: Boolean);
begin
  AppCore.Logger.Write('数据提交失败，原因：' + Error.Message, mtError, 0);
end;

initialization
  ROClient := TROClient.Create(nil);

finalization
  FreeAndNil(ROClient);

end.

