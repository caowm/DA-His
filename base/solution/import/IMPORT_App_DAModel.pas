unit IMPORT_App_DAModel;
interface
uses
  SysUtils,
  Classes,
  Variants,
  StrUtils,
  DB,
  Contnrs,
  TypInfo,
  Types,
  Windows,
  FMTBcd,
  uROMessage,
  uROClient,
  uROTransportChannel,
  uRODL,
  uROClientIntf,
  uRODynamicRequest,
  uDAScriptingProvider,
  DataAbstract4_Intf,
  uDADataTable,
  uDAMemDataTable,
  uDARemoteDataAdapter,
  uDADataStreamer,
  uDABin2DataStreamer,
  uRORemoteService,
  uDAInterfaces,
  uROEventRepository,
  uROBaseSuperChannel,
  uROBaseSuperTCPChannel,
  uDADataAdapter,
  uDADesigntimeCall,
  uROClasses,
  uDASchema,
  uDACore,
  uDAFields,
  uDAWhere,
  uDARemoteCommand,
  uROBinMessage,
  uROLocalChannel,
  uROLocalServer,
  App_Function,
  uDAXMLAdapter,
  App_DAModel,
  PaxCompiler,
  PaxRegister;
procedure RegisterIMPORT_App_DAModel;
implementation
function TROConnection_GetROMessage(Self:TROConnection):TROMessage;
begin
  result := Self.ROMessage;
end;
function TROConnection_GetChannel(Self:TROConnection):TROTransportChannel;
begin
  result := Self.Channel;
end;
function TROConnection_GetROService(Self:TROConnection):TRORemoteService;
begin
  result := Self.ROService;
end;
function TROConnection_GetDynamicRequest(Self:TROConnection):TRODynamicRequest;
begin
  result := Self.DynamicRequest;
end;
function TROConnection_GetLoginServiceName(Self:TROConnection):string;
begin
  result := Self.LoginServiceName;
end;
procedure TROConnection_PutLoginServiceName(Self:TROConnection;const Value: string);
begin
  Self.LoginServiceName := Value;
end;
function TROConnection_GetSystemServiceName(Self:TROConnection):string;
begin
  result := Self.SystemServiceName;
end;
procedure TROConnection_PutSystemServiceName(Self:TROConnection;const Value: string);
begin
  Self.SystemServiceName := Value;
end;
function TROConnection_GetTargetUrl(Self:TROConnection):string;
begin
  result := Self.TargetUrl;
end;
procedure TROConnection_PutTargetUrl(Self:TROConnection;const Value: string);
begin
  Self.TargetUrl := Value;
end;
function TROConnection_GetTargetList(Self:TROConnection):TStrings;
begin
  result := Self.TargetList;
end;
function TROConnection_GetTargetIndex(Self:TROConnection):Integer;
begin
  result := Self.TargetIndex;
end;
procedure TROConnection_PutTargetIndex(Self:TROConnection;const Value: Integer);
begin
  Self.TargetIndex := Value;
end;
function TDataConnection_GetDataAdapter(Self:TDataConnection):TDARemoteDataAdapter;
begin
  result := Self.DataAdapter;
end;
function TCustomDataService_GetDAService(Self:TCustomDataService):TRORemoteService;
begin
  result := Self.DAService;
end;
function TCustomDataService_GetDAAdapter(Self:TCustomDataService):TDARemoteDataAdapter;
begin
  result := Self.DAAdapter;
end;
function TCustomDataService_GetDACommand(Self:TCustomDataService):TDARemoteCommand;
begin
  result := Self.DACommand;
end;
function TCustomDataService_GetDAConnection(Self:TCustomDataService):TDataConnection;
begin
  result := Self.DAConnection;
end;
function TDataConnection_RegisterDataService1(Self: TDataConnection;const AServiceName: string): TCustomDataService; 
begin
  result := Self.RegisterDataService(ASERVICENAME);
end;
function TDataConnection_RegisterDataService2(Self: TDataConnection;const AServiceName: string;
      AServiceClass: TCustomDataServiceClass): TCustomDataService; 
begin
  result := Self.RegisterDataService(ASERVICENAME,ASERVICECLASS);
end;
function TCustomData_GetDataConnection(Self:TCustomData):TDataConnection;
begin
  result := Self.DataConnection;
end;
function TCustomData_GetTable(Self:TCustomData):TDAMemDataTable;
begin
  result := Self.Table;
end;
function TCustomData_GetSource(Self:TCustomData):TDADataSource;
begin
  result := Self.Source;
end;
function TCustomData_GetLogicalName(Self:TCustomData):string;
begin
  result := Self.LogicalName;
end;
procedure TCustomData_PutLogicalName(Self:TCustomData;const Value: string);
begin
  Self.LogicalName := Value;
end;
function TCustomData_GetKeyFieldNames(Self:TCustomData):string;
begin
  result := Self.KeyFieldNames;
end;
function TCustomData_GetKeyValue(Self:TCustomData):Variant;
begin
  result := Self.KeyValue;
end;
function TCustomData_GetDefaultViewType(Self:TCustomData):TDataViewType;
begin
  result := Self.DefaultViewType;
end;
function TCustomData_GetIndexFieldNames(Self:TCustomData):string;
begin
  result := Self.IndexFieldNames;
end;
procedure TCustomData_PutIndexFieldNames(Self:TCustomData;const Value: string);
begin
  Self.IndexFieldNames := Value;
end;
function TCustomData_GetDescription(Self:TCustomData):string;
begin
  result := Self.Description;
end;
function TCustomData_GetLogChanges(Self:TCustomData):Boolean;
begin
  result := Self.LogChanges;
end;
procedure TCustomData_PutLogChanges(Self:TCustomData;const Value: Boolean);
begin
  Self.LogChanges := Value;
end;
function TCustomData_GetCategory(Self:TCustomData):string;
begin
  result := Self.Category;
end;
function TCustomData_GetAccess(Self:TCustomData):string;
begin
  result := Self.Access;
end;
function TCustomData_GetDialogImage(Self:TCustomData):string;
begin
  result := Self.DialogImage;
end;
function TCustomData_GetReporterNames(Self:TCustomData):TStrings;
begin
  result := Self.ReporterNames;
end;
function TCustomData_GetReporterTypeField(Self:TCustomData):string;
begin
  result := Self.ReporterTypeField;
end;
procedure TCustomData_PutReporterTypeField(Self:TCustomData;const Value: string);
begin
  Self.ReporterTypeField := Value;
end;
function TCustomData_GetMasterData(Self:TCustomData):TCustomData;
begin
  result := Self.MasterData;
end;
function TCustomData_GetMasterKey(Self:TCustomData):Variant;
begin
  result := Self.MasterKey;
end;
function TCustomData_GetCreateParam(Self:TCustomData):Variant;
begin
  result := Self.CreateParam;
end;
procedure TCustomData_PutCreateParam(Self:TCustomData;const Value: Variant);
begin
  Self.CreateParam := Value;
end;
function TCustomData_GetMaxRecords(Self:TCustomData):Integer;
begin
  result := Self.MaxRecords;
end;
procedure TCustomData_PutMaxRecords(Self:TCustomData;const Value: Integer);
begin
  Self.MaxRecords := Value;
end;
function TCustomData_GetFilterFields(Self:TCustomData):TStrings;
begin
  result := Self.FilterFields;
end;
function TCustomData_GetFilterFromServer(Self:TCustomData):Boolean;
begin
  result := Self.FilterFromServer;
end;
procedure TCustomData_PutFilterFromServer(Self:TCustomData;const Value: Boolean);
begin
  Self.FilterFromServer := Value;
end;
function TCustomData_GetCustomAttributes(Self:TCustomData):TStrings;
begin
  result := Self.CustomAttributes;
end;
function TCustomData_GetFieldCustomAttributes(Self:TCustomData;const FieldName: string):TStrings;
begin
  result := Self.FieldCustomAttributes[FieldName];
end;
function TCustomData_GetFieldLogChanges(Self:TCustomData;const FieldName: string):Boolean;
begin
  result := Self.FieldLogChanges[FieldName];
end;
procedure TCustomData_PutFieldLogChanges(Self:TCustomData;const FieldName: string;const Value: Boolean);
begin
  Self.FieldLogChanges[FieldName] := Value;
end;
function TCustomData_GetFieldDisplayLabel(Self:TCustomData;const FieldName: string):string;
begin
  result := Self.FieldDisplayLabel[FieldName];
end;
procedure TCustomData_PutFieldDisplayLabel(Self:TCustomData;const FieldName: string;const Value: string);
begin
  Self.FieldDisplayLabel[FieldName] := Value;
end;
function TCustomData_GetParamValue(Self:TCustomData;const ParamName: string):Variant;
begin
  result := Self.ParamValue[ParamName];
end;
procedure TCustomData_PutParamValue(Self:TCustomData;const ParamName: string;const Value: Variant);
begin
  Self.ParamValue[ParamName] := Value;
end;
function TCustomData_GetOldValue(Self:TCustomData;const FieldName: string):Variant;
begin
  result := Self.OldValue[FieldName];
end;
function TCustomData_GetAsString(Self:TCustomData;const FieldName: string):string;
begin
  result := Self.AsString[FieldName];
end;
procedure TCustomData_PutAsString(Self:TCustomData;const FieldName: string;const Value: string);
begin
  Self.AsString[FieldName] := Value;
end;
function TCustomData_GetAsBoolean(Self:TCustomData;const FieldName: string):Boolean;
begin
  result := Self.AsBoolean[FieldName];
end;
procedure TCustomData_PutAsBoolean(Self:TCustomData;const FieldName: string;const Value: Boolean);
begin
  Self.AsBoolean[FieldName] := Value;
end;
function TCustomData_GetAsInteger(Self:TCustomData;const FieldName: string):Integer;
begin
  result := Self.AsInteger[FieldName];
end;
procedure TCustomData_PutAsInteger(Self:TCustomData;const FieldName: string;const Value: Integer);
begin
  Self.AsInteger[FieldName] := Value;
end;
function TCustomData_GetAsFloat(Self:TCustomData;const FieldName: string):Double;
begin
  result := Self.AsFloat[FieldName];
end;
procedure TCustomData_PutAsFloat(Self:TCustomData;const FieldName: string;const Value: Double);
begin
  Self.AsFloat[FieldName] := Value;
end;
function TCustomData_GetAsDateTime(Self:TCustomData;const FieldName: string):TDateTime;
begin
  result := Self.AsDateTime[FieldName];
end;
procedure TCustomData_PutAsDateTime(Self:TCustomData;const FieldName: string;const Value: TDateTime);
begin
  Self.AsDateTime[FieldName] := Value;
end;
function TCustomData_GetAsCurrency(Self:TCustomData;const FieldName: string):Currency;
begin
  result := Self.AsCurrency[FieldName];
end;
procedure TCustomData_PutAsCurrency(Self:TCustomData;const FieldName: string;const Value: Currency);
begin
  Self.AsCurrency[FieldName] := Value;
end;
function TCustomData_GetAsVariant(Self:TCustomData;const FieldName: string):Variant;
begin
  result := Self.AsVariant[FieldName];
end;
procedure TCustomData_PutAsVariant(Self:TCustomData;const FieldName: string;const Value: Variant);
begin
  Self.AsVariant[FieldName] := Value;
end;
function TCustomData_GetAsDecimal(Self:TCustomData;const FieldName: string):TBCD;
begin
  result := Self.AsDecimal[FieldName];
end;
procedure TCustomData_PutAsDecimal(Self:TCustomData;const FieldName: string;const Value: TBCD);
begin
  Self.AsDecimal[FieldName] := Value;
end;
function TDataDefinition_GetDAClient(Self:TDataDefinition):TDataConnection;
begin
  result := Self.DAClient;
end;
function TDataDefinition_GetServiceName(Self:TDataDefinition):string;
begin
  result := Self.ServiceName;
end;
function TDataDefinition_GetLogicanName(Self:TDataDefinition):string;
begin
  result := Self.LogicanName;
end;
function TDataDefinition_GetFlag(Self:TDataDefinition):Integer;
begin
  result := Self.Flag;
end;
function TDataDefinition_GetDataClass(Self:TDataDefinition):TCustomDataClass;
begin
  result := Self.DataClass;
end;
function TDataDefinition_GetCreateParam(Self:TDataDefinition):Variant;
begin
  result := Self.CreateParam;
end;
function TDataDefinition_GetCustomData(Self:TDataDefinition):TCustomData;
begin
  result := Self.CustomData;
end;
procedure TDataContainer_RegisterData3(Self: TDataContainer;ADataConnection: TDataConnection; const AServiceName,
      ALogicalName: string; AFlag: Integer; ACreateParam: string); 
begin
  Self.RegisterData(ADATACONNECTION,ASERVICENAME,ALOGICALNAME,AFLAG,ACREATEPARAM);
end;
procedure TDataContainer_RegisterData4(Self: TDataContainer;ADataConnection: TDataConnection; const AServiceName,
      ALogicalName: string; ADataClass: TCustomDataClass;
      AFlag: Integer; ACreateParam: string); 
begin
  Self.RegisterData(ADATACONNECTION,ASERVICENAME,ALOGICALNAME,ADATACLASS,AFLAG,ACREATEPARAM);
end;
procedure TDataContainer_RegisterData5(Self: TDataContainer;ADataConnection: TDataConnection; const AServiceName,
      ALogicalName: string; ADataClassName: String;
      AFlag: Integer; ACreateParam: string); 
begin
  Self.RegisterData(ADATACONNECTION,ASERVICENAME,ALOGICALNAME,ADATACLASSNAME,AFLAG,ACREATEPARAM);
end;
function TDataContainer_GetItems(Self:TDataContainer;const ALogicalName: string):TCustomData;
begin
  result := Self.Items[ALogicalName];
end;
function TDataContainer_GetItemsByIndex(Self:TDataContainer;AIndex: Integer):TDataDefinition;
begin
  result := Self.ItemsByIndex[AIndex];
end;
function TDataContainer_GetCount(Self:TDataContainer):Integer;
begin
  result := Self.Count;
end;
procedure DataTable_CopySelectedData7(ASource, ADest: TCustomData;
    AMultiSelectField: string); 
begin
  App_DAModel.DataTable_CopySelectedData(ASOURCE,ADEST,AMULTISELECTFIELD);
end;
procedure RegisterIMPORT_App_DAModel;
var G, H: Integer;
begin
  H := RegisterNamespace(0, 'uDAWhere');
  RegisterRTTIType(H, TypeInfo(TDABinaryOperator));
  H := RegisterNamespace(0, 'App_DAModel');
  RegisterConstant(H, 'sTargetListSection', 'TargetList');
  RegisterConstant(H, 'sDataAdapterNotSet', '没有设置数据适配器:%s');
  RegisterConstant(H, 'sDataDefinitionDuplicate', '重复定义逻辑数据:%s');
  RegisterConstant(H, 'sCommonDataContainerNotExists', '没有找到公共数据:%s');
  RegisterConstant(H, 'sCommonDataIndexOutOfRange', '公共数据索引超出范围');
  RegisterConstant(H, 'sWorkerNoAccess', '没有操作权限');
  // Begin of interface IDataExportWizard
  RegisterInterfaceType(H, 'IDataExportWizard',IDataExportWizard,'IUnknown',IUnknown);
  RegisterHeader(G, 
       'procedure ExportData(ADataSet: TDataSet; AExportFields: string);',
       nil, -1);
  // End of interface IDataExportWizard
  // Begin of interface IDataImportWizard
  RegisterInterfaceType(H, 'IDataImportWizard',IDataImportWizard,'IUnknown',IUnknown);
  RegisterHeader(G, 
       'procedure ImportData(ADataSet: TDataSet; AImportFields, AKeyColumns: string);',
       nil, -1);
  // End of interface IDataImportWizard
  // Begin of class TROConnection
  G := RegisterClassType(H, TROConnection);
  RegisterHeader(G, 
       'constructor Create(AOwner: TComponent; ATargetUrl: string); virtual;',
       @TROConnection.Create);
  RegisterHeader(G, 
       'destructor Destroy(); override;',
       @TROConnection.Destroy);
  RegisterHeader(G, 
       'procedure ConnectLocalServer(ALocalServer: TROLocalServer);',
       @TROConnection.ConnectLocalServer);
  RegisterHeader(G, 
       'procedure MakeRequest(const AServiceName, AMethodName: string;      AParamName: array of string; AParamValue: array of Variant;      AParamType: array of TRODataType; AParamFlag: array of TRODLParamFlag);',
       @TROConnection.MakeRequest);
  RegisterHeader(G, 
       'procedure BeginMethod(AServiceName, AMethodName: string);',
       @TROConnection.BeginMethod);
  RegisterHeader(G, 
       'procedure SetMethodParam(AParamName: string; AParamValue: Variant; AParamType: Integer; AParamFlag: Integer);',
       @TROConnection.SetMethodParam);
  RegisterHeader(G, 
       'procedure EndMethod();',
       @TROConnection.EndMethod);
  RegisterHeader(G, 
       'function GetMethodParam(ParamName: string): Variant;',
       @TROConnection.GetMethodParam);
  RegisterHeader(G, 
       'function Login(ALoginText: string): string;',
       @TROConnection.Login);
  RegisterHeader(G, 
       'procedure Logout();',
       @TROConnection.Logout);
  RegisterFakeHeader(G, 
       'function TROConnection_GetROMessage:TROMessage;',
       @TROConnection_GetROMessage);
  RegisterProperty(G, 
       'property ROMessage:TROMessage read TROConnection_GetROMessage;');
  RegisterFakeHeader(G, 
       'function TROConnection_GetChannel:TROTransportChannel;',
       @TROConnection_GetChannel);
  RegisterProperty(G, 
       'property Channel:TROTransportChannel read TROConnection_GetChannel;');
  RegisterFakeHeader(G, 
       'function TROConnection_GetROService:TRORemoteService;',
       @TROConnection_GetROService);
  RegisterProperty(G, 
       'property ROService:TRORemoteService read TROConnection_GetROService;');
  RegisterFakeHeader(G, 
       'function TROConnection_GetDynamicRequest:TRODynamicRequest;',
       @TROConnection_GetDynamicRequest);
  RegisterProperty(G, 
       'property DynamicRequest:TRODynamicRequest read TROConnection_GetDynamicRequest;');
  RegisterFakeHeader(G, 
       'function TROConnection_GetLoginServiceName:string;',
       @TROConnection_GetLoginServiceName);
  RegisterFakeHeader(G,
       'procedure TROConnection_PutLoginServiceName(const Value: string);',
       @TROConnection_PutLoginServiceName);
  RegisterProperty(G,
       'property LoginServiceName:string read TROConnection_GetLoginServiceName write TROConnection_PutLoginServiceName;');
  RegisterFakeHeader(G, 
       'function TROConnection_GetSystemServiceName:string;',
       @TROConnection_GetSystemServiceName);
  RegisterFakeHeader(G,
       'procedure TROConnection_PutSystemServiceName(const Value: string);',
       @TROConnection_PutSystemServiceName);
  RegisterProperty(G, 
       'property SystemServiceName:string read TROConnection_GetSystemServiceName write TROConnection_PutSystemServiceName;');
  RegisterFakeHeader(G, 
       'function TROConnection_GetTargetUrl:string;',
       @TROConnection_GetTargetUrl);
  RegisterFakeHeader(G, 
       'procedure TROConnection_PutTargetUrl(const Value: string);',
       @TROConnection_PutTargetUrl);
  RegisterProperty(G, 
       'property TargetUrl:string read TROConnection_GetTargetUrl write TROConnection_PutTargetUrl;');
  RegisterFakeHeader(G, 
       'function TROConnection_GetTargetList:TStrings;',
       @TROConnection_GetTargetList);
  RegisterProperty(G, 
       'property TargetList:TStrings read TROConnection_GetTargetList;');
  RegisterFakeHeader(G, 
       'function TROConnection_GetTargetIndex:Integer;',
       @TROConnection_GetTargetIndex);
  RegisterFakeHeader(G, 
       'procedure TROConnection_PutTargetIndex(const Value: Integer);',
       @TROConnection_PutTargetIndex);
  RegisterProperty(G, 
       'property TargetIndex:Integer read TROConnection_GetTargetIndex write TROConnection_PutTargetIndex;');
  // End of class TROConnection
  RegisterRTTIType(H, TypeInfo(TDataViewType));
  // Begin of class TCustomDataService
  G := RegisterClassType(H, TCustomDataService);
  RegisterHeader(G, 
       'constructor Create(const AServiceName: string; ADataConnection: TDataConnection);',
       @TCustomDataService.Create);
  RegisterHeader(G, 
       'procedure BeginCommand(ACommandName: string);',
       @TCustomDataService.BeginCommand);
  RegisterHeader(G, 
       'procedure SetCommandParam(AParamName: string; AParamValue: Variant);',
       @TCustomDataService.SetCommandParam);
  RegisterHeader(G, 
       'procedure EndCommand();',
       @TCustomDataService.EndCommand);
  RegisterHeader(G, 
       'function GetCommandOutputParam(AParamName: string): Variant;',
       @TCustomDataService.GetCommandOutputParam);
  RegisterFakeHeader(G, 
       'function TCustomDataService_GetDAService:TRORemoteService;',
       @TCustomDataService_GetDAService);
  RegisterProperty(G, 
       'property DAService:TRORemoteService read TCustomDataService_GetDAService;');
  RegisterFakeHeader(G, 
       'function TCustomDataService_GetDAAdapter:TDARemoteDataAdapter;',
       @TCustomDataService_GetDAAdapter);
  RegisterProperty(G, 
       'property DAAdapter:TDARemoteDataAdapter read TCustomDataService_GetDAAdapter;');
  RegisterFakeHeader(G, 
       'function TCustomDataService_GetDACommand:TDARemoteCommand;',
       @TCustomDataService_GetDACommand);
  RegisterProperty(G, 
       'property DACommand:TDARemoteCommand read TCustomDataService_GetDACommand;');
  RegisterFakeHeader(G, 
       'function TCustomDataService_GetDAConnection:TDataConnection;',
       @TCustomDataService_GetDAConnection);
  RegisterProperty(G, 
       'property DAConnection:TDataConnection read TCustomDataService_GetDAConnection;');
  // End of class TCustomDataService
  RegisterClassReferenceType(H, 'TCustomDataServiceClass');
  // Begin of class TDataConnection
  G := RegisterClassType(H, TDataConnection);
  RegisterHeader(G, 
       'constructor Create(AOwner: TComponent; ATargetUrl: string); override;',
       @TDataConnection.Create);
  RegisterHeader(G, 
       'destructor Destroy(); override;',
       @TDataConnection.Destroy);
  RegisterHeader(G,
       'function RegisterDataService(const AServiceName: string): TCustomDataService; overload;',
       @TDataConnection_RegisterDataService1);
  RegisterHeader(G, 
       'function RegisterDataService(const AServiceName: string;      AServiceClass: TCustomDataServiceClass): TCustomDataService; overload;',
       @TDataConnection_RegisterDataService2);
  RegisterHeader(G, 
       'function GetDataService(const AServiceName: string): TCustomDataService;',
       @TDataConnection.GetDataService);
  RegisterFakeHeader(G,
       'function TDataConnection_GetDataAdapter:TDARemoteDataAdapter;',
       @TDataConnection_GetDataAdapter);
  RegisterProperty(G,
       'property DataAdapter:TDARemoteDataAdapter read TDataConnection_GetDataAdapter;');
  // End of class TDataConnection
  // Begin of class TCustomData
  G := RegisterClassType(H, TCustomData);
  RegisterHeader(G, 
       'constructor Create(AOwner: TComponent; ADataConnection: TDataConnection;      const AServiceName, ALogicalName: string); virtual;',
       @TCustomData.Create);
  RegisterHeader(G, 
       'destructor Destroy(); override;',
       @TCustomData.Destroy);
  RegisterHeader(G, 
       'procedure InitData();',
       @TCustomData.InitData);
  RegisterHeader(G, 
       'function CanEdit(): Boolean; virtual;',
       @TCustomData.CanEdit);
  RegisterHeader(G, 
       'function CanInsert(): Boolean; virtual;',
       @TCustomData.CanInsert);
  RegisterHeader(G, 
       'function CanDelete(): Boolean; virtual;',
       @TCustomData.CanDelete);
  RegisterHeader(G, 
       'function CanSave(): Boolean; virtual;',
       @TCustomData.CanSave);
  RegisterHeader(G, 
       'function CanCancel(): Boolean; virtual;',
       @TCustomData.CanCancel);
  RegisterHeader(G, 
       'function CanQuery(): Boolean; virtual;',
       @TCustomData.CanQuery);
  RegisterHeader(G, 
       'function CanPrint(): Boolean; virtual;',
       @TCustomData.CanPrint);
  RegisterHeader(G, 
       'procedure Edit(); virtual;',
       @TCustomData.Edit);
  RegisterHeader(G, 
       'procedure Insert(); virtual;',
       @TCustomData.Insert);
  RegisterHeader(G, 
       'procedure Delete(); virtual;',
       @TCustomData.Delete);
  RegisterHeader(G, 
       'procedure Save(); virtual;',
       @TCustomData.Save);
  RegisterHeader(G, 
       'procedure Cancel(); virtual;',
       @TCustomData.Cancel);
  RegisterHeader(G, 
       'procedure First();',
       @TCustomData.First);
  RegisterHeader(G, 
       'procedure Prior();',
       @TCustomData.Prior);
  RegisterHeader(G, 
       'procedure Next();',
       @TCustomData.Next);
  RegisterHeader(G, 
       'procedure Last();',
       @TCustomData.Last);
  RegisterHeader(G, 
       'function Eof: Boolean;',
       @TCustomData.Eof);
  RegisterHeader(G, 
       'function RecID: Integer;',
       @TCustomData.RecID);
  RegisterHeader(G, 
       'function RecordCount(): Integer;',
       @TCustomData.RecordCount);
  RegisterHeader(G, 
       'function FieldByName(AName: string): TDAField;',
       @TCustomData.FieldByName);
  RegisterHeader(G, 
       'function GetBookmark(): Pointer;',
       @TCustomData.GetBookmark);
  RegisterHeader(G, 
       'procedure GotoBookmark(Bookmark: Pointer);',
       @TCustomData.GotoBookmark);
  RegisterHeader(G, 
       'procedure FreeBookmark(Bookmark: Pointer);',
       @TCustomData.FreeBookmark);
  RegisterHeader(G, 
       'function Locate(const KeyFields: string; const KeyValues: Variant; Options: TLocateOptions): Boolean;',
       @TCustomData.Locate);
  RegisterHeader(G, 
       'procedure BindMaster(AMaster: TCustomData; const AForeignField: string);',
       @TCustomData.BindMaster);
  RegisterHeader(G, 
       'procedure QueryAfterMasterScroll(); virtual;',
       @TCustomData.QueryAfterMasterScroll);
  RegisterHeader(G, 
       'procedure TriggerScroll();',
       @TCustomData.TriggerScroll);
  RegisterHeader(G, 
       'procedure DisableScroll();',
       @TCustomData.DisableScroll);
  RegisterHeader(G, 
       'procedure EnableScroll();',
       @TCustomData.EnableScroll);
  RegisterHeader(G, 
       'procedure DisableControls();',
       @TCustomData.DisableControls);
  RegisterHeader(G, 
       'procedure EnableControls();',
       @TCustomData.EnableControls);
  RegisterHeader(G, 
       'procedure EnableBatchUpdate();',
       @TCustomData.EnableBatchUpdate);
  RegisterHeader(G, 
       'procedure DisableBatchUpdate();',
       @TCustomData.DisableBatchUpdate);
  RegisterHeader(G, 
       'procedure ApplyUpdates(); virtual;',
       @TCustomData.ApplyUpdates);
  RegisterHeader(G, 
       'procedure Open(); virtual;',
       @TCustomData.Open);
  RegisterHeader(G, 
       'procedure Close(); virtual;',
       @TCustomData.Close);
  RegisterHeader(G, 
       'procedure Refresh(); virtual;',
       @TCustomData.Refresh);
  RegisterHeader(G, 
       'procedure EditWithNoLogChanges(FieldNames: array of string; FieldValues: array of Variant);',
       @TCustomData.EditWithNoLogChanges);
  RegisterHeader(G, 
       'function GetFixFilterWhereText(): string;',
       @TCustomData.GetFixFilterWhereText);
  RegisterHeader(G, 
       'procedure DoLocalFilter(const AFilterText: string); virtual;',
       @TCustomData.DoLocalFilter);
  RegisterHeader(G, 
       'procedure DoServerFilter(const AFilterText: string); virtual;',
       @TCustomData.DoServerFilter);
  RegisterHeader(G, 
       'procedure BuildDynamicWhere(const AFieldNames: array of string;      const AFieldValues: array of Variant;      const AOperators: array of TDABinaryOperator;      const AListOperator: array of TDABinaryOperator);',
       @TCustomData.BuildDynamicWhere);
  RegisterHeader(G, 
       'procedure OpenByList(const AFieldNames: array of string;      const AFieldValues: array of Variant;      const AOperators: array of TDABinaryOperator;      const AListOperator: array of TDABinaryOperator);',
       @TCustomData.OpenByList);
  RegisterHeader(G, 
       'procedure OpenByPeriod(const ADateFieldName: string;      ABeginDate, AEndDate: TDateTime);',
       @TCustomData.OpenByPeriod);
  RegisterHeader(G,
       'procedure OpenByBetween(const AFieldName: string; AStartValue, AEndValue: Variant);',
       @TCustomData.OpenByBetween);
  RegisterHeader(G,
       'procedure OpenByKeyValue(AValue: Variant);',
       @TCustomData.OpenByKeyValue);
  RegisterHeader(G, 
       'procedure OpenByFieldValue(const AFieldName: string; AFieldValue: Variant; AOperator: TDABinaryOperator);',
       @TCustomData.OpenByFieldValue);
  RegisterHeader(G,
       'procedure OpenByWhereText(const AText: string);',
       @TCustomData.OpenByWhereText);
  RegisterHeader(G, 
       'procedure OpenByParam(const AParamNames: array of string;      const AParamValues: array of Variant);',
       @TCustomData.OpenByParam);
  RegisterHeader(G, 
       'procedure CreateLocalTableFields(const ATableAttributes: string;      const AFieldNames: array of string;      const AFieldTypes: array of TDADataType;      const AFieldSizes: array of Integer;      const AFieldAttributes: array of string);',
       @TCustomData.CreateLocalTableFields);
  RegisterHeader(G, 
       'function GetRecordText(const AFieldNames: string; ASeperator: string='' ''): string;',
       @TCustomData.GetRecordText);
  RegisterFakeHeader(G, 
       'function TCustomData_GetDataConnection:TDataConnection;',
       @TCustomData_GetDataConnection);
  RegisterProperty(G, 
       'property DataConnection:TDataConnection read TCustomData_GetDataConnection;');
  RegisterFakeHeader(G, 
       'function TCustomData_GetTable:TDAMemDataTable;',
       @TCustomData_GetTable);
  RegisterProperty(G, 
       'property Table:TDAMemDataTable read TCustomData_GetTable;');
  RegisterFakeHeader(G, 
       'function TCustomData_GetSource:TDADataSource;',
       @TCustomData_GetSource);
  RegisterProperty(G, 
       'property Source:TDADataSource read TCustomData_GetSource;');
  RegisterFakeHeader(G, 
       'function TCustomData_GetLogicalName:string;',
       @TCustomData_GetLogicalName);
  RegisterFakeHeader(G, 
       'procedure TCustomData_PutLogicalName(const Value: string);',
       @TCustomData_PutLogicalName);
  RegisterProperty(G, 
       'property LogicalName:string read TCustomData_GetLogicalName write TCustomData_PutLogicalName;');
  RegisterFakeHeader(G, 
       'function TCustomData_GetKeyFieldNames:string;',
       @TCustomData_GetKeyFieldNames);
  RegisterProperty(G, 
       'property KeyFieldNames:string read TCustomData_GetKeyFieldNames;');
  RegisterFakeHeader(G, 
       'function TCustomData_GetKeyValue:Variant;',
       @TCustomData_GetKeyValue);
  RegisterProperty(G, 
       'property KeyValue:Variant read TCustomData_GetKeyValue;');
  RegisterFakeHeader(G, 
       'function TCustomData_GetDefaultViewType:TDataViewType;',
       @TCustomData_GetDefaultViewType);
  RegisterProperty(G, 
       'property DefaultViewType:TDataViewType read TCustomData_GetDefaultViewType;');
  RegisterFakeHeader(G, 
       'function TCustomData_GetIndexFieldNames:string;',
       @TCustomData_GetIndexFieldNames);
  RegisterFakeHeader(G, 
       'procedure TCustomData_PutIndexFieldNames(const Value: string);',
       @TCustomData_PutIndexFieldNames);
  RegisterProperty(G, 
       'property IndexFieldNames:string read TCustomData_GetIndexFieldNames write TCustomData_PutIndexFieldNames;');
  RegisterFakeHeader(G, 
       'function TCustomData_GetDescription:string;',
       @TCustomData_GetDescription);
  RegisterProperty(G, 
       'property Description:string read TCustomData_GetDescription;');
  RegisterFakeHeader(G, 
       'function TCustomData_GetLogChanges:Boolean;',
       @TCustomData_GetLogChanges);
  RegisterFakeHeader(G, 
       'procedure TCustomData_PutLogChanges(const Value: Boolean);',
       @TCustomData_PutLogChanges);
  RegisterProperty(G, 
       'property LogChanges:Boolean read TCustomData_GetLogChanges write TCustomData_PutLogChanges;');
  RegisterFakeHeader(G, 
       'function TCustomData_GetCategory:string;',
       @TCustomData_GetCategory);
  RegisterProperty(G, 
       'property Category:string read TCustomData_GetCategory;');
  RegisterFakeHeader(G, 
       'function TCustomData_GetAccess:string;',
       @TCustomData_GetAccess);
  RegisterProperty(G, 
       'property Access:string read TCustomData_GetAccess;');
  RegisterFakeHeader(G, 
       'function TCustomData_GetDialogImage:string;',
       @TCustomData_GetDialogImage);
  RegisterProperty(G, 
       'property DialogImage:string read TCustomData_GetDialogImage;');
  RegisterFakeHeader(G, 
       'function TCustomData_GetReporterNames:TStrings;',
       @TCustomData_GetReporterNames);
  RegisterProperty(G, 
       'property ReporterNames:TStrings read TCustomData_GetReporterNames;');
  RegisterFakeHeader(G, 
       'function TCustomData_GetReporterTypeField:string;',
       @TCustomData_GetReporterTypeField);
  RegisterFakeHeader(G, 
       'procedure TCustomData_PutReporterTypeField(const Value: string);',
       @TCustomData_PutReporterTypeField);
  RegisterProperty(G, 
       'property ReporterTypeField:string read TCustomData_GetReporterTypeField write TCustomData_PutReporterTypeField;');
  RegisterFakeHeader(G, 
       'function TCustomData_GetMasterData:TCustomData;',
       @TCustomData_GetMasterData);
  RegisterProperty(G, 
       'property MasterData:TCustomData read TCustomData_GetMasterData;');
  RegisterFakeHeader(G, 
       'function TCustomData_GetMasterKey:Variant;',
       @TCustomData_GetMasterKey);
  RegisterProperty(G, 
       'property MasterKey:Variant read TCustomData_GetMasterKey;');
  RegisterFakeHeader(G, 
       'function TCustomData_GetCreateParam:Variant;',
       @TCustomData_GetCreateParam);
  RegisterFakeHeader(G, 
       'procedure TCustomData_PutCreateParam(const Value: Variant);',
       @TCustomData_PutCreateParam);
  RegisterProperty(G, 
       'property CreateParam:Variant read TCustomData_GetCreateParam write TCustomData_PutCreateParam;');
  RegisterFakeHeader(G, 
       'function TCustomData_GetMaxRecords:Integer;',
       @TCustomData_GetMaxRecords);
  RegisterFakeHeader(G, 
       'procedure TCustomData_PutMaxRecords(const Value: Integer);',
       @TCustomData_PutMaxRecords);
  RegisterProperty(G, 
       'property MaxRecords:Integer read TCustomData_GetMaxRecords write TCustomData_PutMaxRecords;');
  RegisterFakeHeader(G, 
       'function TCustomData_GetFilterFields:TStrings;',
       @TCustomData_GetFilterFields);
  RegisterProperty(G, 
       'property FilterFields:TStrings read TCustomData_GetFilterFields;');
  RegisterFakeHeader(G, 
       'function TCustomData_GetFilterFromServer:Boolean;',
       @TCustomData_GetFilterFromServer);
  RegisterFakeHeader(G, 
       'procedure TCustomData_PutFilterFromServer(const Value: Boolean);',
       @TCustomData_PutFilterFromServer);
  RegisterProperty(G, 
       'property FilterFromServer:Boolean read TCustomData_GetFilterFromServer write TCustomData_PutFilterFromServer;');
  RegisterFakeHeader(G, 
       'function TCustomData_GetCustomAttributes:TStrings;',
       @TCustomData_GetCustomAttributes);
  RegisterProperty(G, 
       'property CustomAttributes:TStrings read TCustomData_GetCustomAttributes;');
  RegisterFakeHeader(G, 
       'function TCustomData_GetFieldCustomAttributes(const FieldName: string):TStrings;',
       @TCustomData_GetFieldCustomAttributes);
  RegisterProperty(G, 
       'property FieldCustomAttributes[const FieldName: string]:TStrings read TCustomData_GetFieldCustomAttributes;');
  RegisterFakeHeader(G, 
       'function TCustomData_GetFieldLogChanges(const FieldName: string):Boolean;',
       @TCustomData_GetFieldLogChanges);
  RegisterFakeHeader(G, 
       'procedure TCustomData_PutFieldLogChanges(const FieldName: string;const Value: Boolean);',
       @TCustomData_PutFieldLogChanges);
  RegisterProperty(G, 
       'property FieldLogChanges[const FieldName: string]:Boolean read TCustomData_GetFieldLogChanges write TCustomData_PutFieldLogChanges;');
  RegisterFakeHeader(G, 
       'function TCustomData_GetFieldDisplayLabel(const FieldName: string):string;',
       @TCustomData_GetFieldDisplayLabel);
  RegisterFakeHeader(G, 
       'procedure TCustomData_PutFieldDisplayLabel(const FieldName: string;const Value: string);',
       @TCustomData_PutFieldDisplayLabel);
  RegisterProperty(G, 
       'property FieldDisplayLabel[const FieldName: string]:string read TCustomData_GetFieldDisplayLabel write TCustomData_PutFieldDisplayLabel;');
  RegisterFakeHeader(G, 
       'function TCustomData_GetParamValue(const ParamName: string):Variant;',
       @TCustomData_GetParamValue);
  RegisterFakeHeader(G, 
       'procedure TCustomData_PutParamValue(const ParamName: string;const Value: Variant);',
       @TCustomData_PutParamValue);
  RegisterProperty(G, 
       'property ParamValue[const ParamName: string]:Variant read TCustomData_GetParamValue write TCustomData_PutParamValue;');
  RegisterFakeHeader(G, 
       'function TCustomData_GetOldValue(const FieldName: string):Variant;',
       @TCustomData_GetOldValue);
  RegisterProperty(G, 
       'property OldValue[const FieldName: string]:Variant read TCustomData_GetOldValue;');
  RegisterFakeHeader(G, 
       'function TCustomData_GetAsString(const FieldName: string):string;',
       @TCustomData_GetAsString);
  RegisterFakeHeader(G, 
       'procedure TCustomData_PutAsString(const FieldName: string;const Value: string);',
       @TCustomData_PutAsString);
  RegisterProperty(G, 
       'property AsString[const FieldName: string]:string read TCustomData_GetAsString write TCustomData_PutAsString;');
  RegisterFakeHeader(G, 
       'function TCustomData_GetAsBoolean(const FieldName: string):Boolean;',
       @TCustomData_GetAsBoolean);
  RegisterFakeHeader(G, 
       'procedure TCustomData_PutAsBoolean(const FieldName: string;const Value: Boolean);',
       @TCustomData_PutAsBoolean);
  RegisterProperty(G, 
       'property AsBoolean[const FieldName: string]:Boolean read TCustomData_GetAsBoolean write TCustomData_PutAsBoolean;');
  RegisterFakeHeader(G, 
       'function TCustomData_GetAsInteger(const FieldName: string):Integer;',
       @TCustomData_GetAsInteger);
  RegisterFakeHeader(G, 
       'procedure TCustomData_PutAsInteger(const FieldName: string;const Value: Integer);',
       @TCustomData_PutAsInteger);
  RegisterProperty(G, 
       'property AsInteger[const FieldName: string]:Integer read TCustomData_GetAsInteger write TCustomData_PutAsInteger;');
  RegisterFakeHeader(G, 
       'function TCustomData_GetAsFloat(const FieldName: string):Double;',
       @TCustomData_GetAsFloat);
  RegisterFakeHeader(G, 
       'procedure TCustomData_PutAsFloat(const FieldName: string;const Value: Double);',
       @TCustomData_PutAsFloat);
  RegisterProperty(G, 
       'property AsFloat[const FieldName: string]:Double read TCustomData_GetAsFloat write TCustomData_PutAsFloat;');
  RegisterFakeHeader(G, 
       'function TCustomData_GetAsDateTime(const FieldName: string):TDateTime;',
       @TCustomData_GetAsDateTime);
  RegisterFakeHeader(G, 
       'procedure TCustomData_PutAsDateTime(const FieldName: string;const Value: TDateTime);',
       @TCustomData_PutAsDateTime);
  RegisterProperty(G, 
       'property AsDateTime[const FieldName: string]:TDateTime read TCustomData_GetAsDateTime write TCustomData_PutAsDateTime;');
  RegisterFakeHeader(G, 
       'function TCustomData_GetAsCurrency(const FieldName: string):Currency;',
       @TCustomData_GetAsCurrency);
  RegisterFakeHeader(G, 
       'procedure TCustomData_PutAsCurrency(const FieldName: string;const Value: Currency);',
       @TCustomData_PutAsCurrency);
  RegisterProperty(G, 
       'property AsCurrency[const FieldName: string]:Currency read TCustomData_GetAsCurrency write TCustomData_PutAsCurrency;');
  RegisterFakeHeader(G, 
       'function TCustomData_GetAsVariant(const FieldName: string):Variant;',
       @TCustomData_GetAsVariant);
  RegisterFakeHeader(G, 
       'procedure TCustomData_PutAsVariant(const FieldName: string;const Value: Variant);',
       @TCustomData_PutAsVariant);
  RegisterProperty(G, 
       'property AsVariant[const FieldName: string]:Variant read TCustomData_GetAsVariant write TCustomData_PutAsVariant;');
  RegisterFakeHeader(G, 
       'function TCustomData_GetAsDecimal(const FieldName: string):TBCD;',
       @TCustomData_GetAsDecimal);
  RegisterFakeHeader(G, 
       'procedure TCustomData_PutAsDecimal(const FieldName: string;const Value: TBCD);',
       @TCustomData_PutAsDecimal);
  RegisterProperty(G, 
       'property AsDecimal[const FieldName: string]:TBCD read TCustomData_GetAsDecimal write TCustomData_PutAsDecimal;');
  // End of class TCustomData
  RegisterClassReferenceType(H, 'TCustomDataClass');
  RegisterConstant(H, 'DD_DICTIONARY', $0001);
  // Begin of class TDataDefinition
  G := RegisterClassType(H, TDataDefinition);
  RegisterHeader(G, 
       'constructor Create(ADataConnection: TDataConnection; AServiceName, ALogicalName: string;      ADataClass: TCustomDataClass; AFlag: Integer; ACreateParam: string);',
       @TDataDefinition.Create);
  RegisterHeader(G, 
       'destructor Destroy(); override;',
       @TDataDefinition.Destroy);
  RegisterHeader(G, 
       'function CreateData(AOwner: TComponent): TCustomData;',
       @TDataDefinition.CreateData);
  RegisterFakeHeader(G, 
       'function TDataDefinition_GetDAClient:TDataConnection;',
       @TDataDefinition_GetDAClient);
  RegisterProperty(G, 
       'property DAClient:TDataConnection read TDataDefinition_GetDAClient;');
  RegisterFakeHeader(G, 
       'function TDataDefinition_GetServiceName:string;',
       @TDataDefinition_GetServiceName);
  RegisterProperty(G, 
       'property ServiceName:string read TDataDefinition_GetServiceName;');
  RegisterFakeHeader(G, 
       'function TDataDefinition_GetLogicanName:string;',
       @TDataDefinition_GetLogicanName);
  RegisterProperty(G, 
       'property LogicanName:string read TDataDefinition_GetLogicanName;');
  RegisterFakeHeader(G, 
       'function TDataDefinition_GetFlag:Integer;',
       @TDataDefinition_GetFlag);
  RegisterProperty(G, 
       'property Flag:Integer read TDataDefinition_GetFlag;');
  RegisterFakeHeader(G, 
       'function TDataDefinition_GetDataClass:TCustomDataClass;',
       @TDataDefinition_GetDataClass);
  RegisterProperty(G, 
       'property DataClass:TCustomDataClass read TDataDefinition_GetDataClass;');
  RegisterFakeHeader(G, 
       'function TDataDefinition_GetCreateParam:Variant;',
       @TDataDefinition_GetCreateParam);
  RegisterProperty(G, 
       'property CreateParam:Variant read TDataDefinition_GetCreateParam;');
  RegisterFakeHeader(G, 
       'function TDataDefinition_GetCustomData:TCustomData;',
       @TDataDefinition_GetCustomData);
  RegisterProperty(G, 
       'property CustomData:TCustomData read TDataDefinition_GetCustomData;');
  // End of class TDataDefinition
  // Begin of class TDataContainer
  G := RegisterClassType(H, TDataContainer);
  RegisterHeader(G, 
       'constructor Create();',
       @TDataContainer.Create);
  RegisterHeader(G, 
       'destructor Destroy(); override;',
       @TDataContainer.Destroy);
  RegisterHeader(G, 'procedure RegisterData(ADataConnection: TDataConnection; const AServiceName,      ALogicalName: string; AFlag: Integer; ACreateParam: string); overload;', @TDataContainer_RegisterData3);
  RegisterHeader(G, 'procedure RegisterData(ADataConnection: TDataConnection; const AServiceName,      ALogicalName: string; ADataClass: TCustomDataClass;      AFlag: Integer; ACreateParam: string); overload;', @TDataContainer_RegisterData4);
  RegisterHeader(G, 'procedure RegisterData(ADataConnection: TDataConnection; const AServiceName,      ALogicalName: string; ADataClassName: String;      AFlag: Integer; ACreateParam: string); overload;', @TDataContainer_RegisterData5);
  RegisterHeader(G, 
       'function CreateData(AOwner: TComponent; const ALogicalName: string): TCustomData;',
       @TDataContainer.CreateData);
  RegisterHeader(G, 
       'function GetSource(const ALogicalName: string): TDADataSource;',
       @TDataContainer.GetSource);
  RegisterFakeHeader(G, 
       'function TDataContainer_GetItems(const ALogicalName: string):TCustomData;',
       @TDataContainer_GetItems);
  RegisterProperty(G, 
       'property Items[const ALogicalName: string]:TCustomData read TDataContainer_GetItems;default;');
  RegisterFakeHeader(G, 
       'function TDataContainer_GetItemsByIndex(AIndex: Integer):TDataDefinition;',
       @TDataContainer_GetItemsByIndex);
  RegisterProperty(G, 
       'property ItemsByIndex[AIndex: Integer]:TDataDefinition read TDataContainer_GetItemsByIndex;');
  RegisterFakeHeader(G, 
       'function TDataContainer_GetCount:Integer;',
       @TDataContainer_GetCount);
  RegisterProperty(G, 
       'property Count:Integer read TDataContainer_GetCount;');
  // End of class TDataContainer
  RegisterHeader(H, 'procedure EnumDataTable(ADataTable: TDADataTable;    AEnumProc: TDataTableEnumProc; AParam: Variant);', @EnumDataTable);
  RegisterHeader(H, 'procedure EnumDataTableField(ADataTable: TDADataTable;    AEnumProc: TTableFieldEnumProc; AParam: Variant);', @EnumDataTableField);
  RegisterHeader(H, 'procedure DataTable_CopyFieldsDefinition(ASource, ADest: TDADataTable;    AIgnoreAutoInc: Boolean);', @DataTable_CopyFieldsDefinition);
  RegisterHeader(H, 'procedure DataTable_CopyAllData(ASource, ADest: TCustomData);', @DataTable_CopyAllData);
  RegisterHeader(H, 'procedure DataTable_CopySelectedData(ASource, ADest: TCustomData;    AMultiSelectField: string); overload;', @DataTable_CopySelectedData7);
  RegisterHeader(H, 'procedure DataTable_GetSelectedList(ADataTable: TDADataTable; AResultList: TStrings;    const AResultField, ACompareField: string; ACompareValue: Variant);', @DataTable_GetSelectedList);
  RegisterHeader(H, 'function DataTable_GetSelectedCommaText(ADataTable: TDADataTable; const AResultField,    ACompareField: string; ACompareValue: Variant): string;', @DataTable_GetSelectedCommaText);
  RegisterHeader(H, 'procedure DataTable_SaveToXmlStream(ADataTable: TDADataTable; AStream: TStream);', @DataTable_SaveToXmlStream);
  RegisterHeader(H, 'function DataTable_GetXmlText(ADataTable: TDADataTable): string;', @DataTable_GetXmlText);
  RegisterHeader(H, 'procedure DataTable_SaveToXmlFile(ADataTable: TDADataTable; AFileName: string);', @DataTable_SaveToXmlFile);
  RegisterHeader(H, 'procedure DataTable_LoadFromXmlFile(ADataTable: TDADataTable; AFileName: string);', @DataTable_LoadFromXmlFile);
  RegisterHeader(H, 'function DataTable_GetSelectedSum(ADataTable: TDADataTable; const ASumField,    ACompareField: string; ACompareValue: Variant): Double;', @DataTable_GetSelectedSum);
  RegisterHeader(H, 'procedure DataTable_IntoEditState(ADataTable: TDADataTable);', @DataTable_IntoEditState);
  RegisterHeader(H, 'procedure DataTable_UpdateFieldValue(ADataTable: TDADataTable;    const AField: string; AValue: Variant);', @DataTable_UpdateFieldValue);
  RegisterVariable(H, 'DataContainer: TDataContainer;',@DataContainer);
  RegisterVariable(H, 'DataConnection: TDataConnection;',@DataConnection);
  RegisterVariable(H, 'DataExportWizard: IDataExportWizard;',@DataExportWizard);
  RegisterVariable(H, 'DataImportWizard: IDataImportWizard;',@DataImportWizard);
end;
initialization
  RegisterIMPORT_App_DAModel;
end.

