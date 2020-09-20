{
  基于DataAbstract的数据模型基类库

  Written by caowm (remobjects@qq.com)
  2014年9月
}

unit App_DAModel;

interface

{$WARNINGS OFF}
{ .$Define EnableDAModelLogger }

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
  uROClient,
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
  uDARemoteCommand,
  uROBinMessage,
  uROJsonMessage,
  uROLocalChannel,
  uROLocalServer,
  uDAWhere,
  uROMessage,
  uROTransportChannel,
  uDAFields,
  uDASchemaClasses,
  uDAXMLAdapter,
  uDAJSONDataStreamer,
  uROXmlRpcMessage,
  uROSOAPMessage,
{$IFDEF EnableDAModelLogger}App_Common, {$ENDIF}
  uDACore,
  App_Function;

{ 以下放在组织单元中
  uROJSONMessage,
  uROXmlRpcMessage,
  uROSOAPMessage,
  uROBaseHTTPClient,
  uROIndyHTTPChannel,
  uROIndyTCPChannel,
  uROSuperTCPChannel,
}
// uDAScriptingProvider,
// uDAEcmaScriptEngine,
// uDASpiderMonkeyScriptProvider,

const
  sTargetListSection = 'TargetList';

  sDataAdapterNotSet = '没有设置数据适配器:%s';
  sDataDefinitionDuplicate = '重复定义逻辑数据:%s';
  sCommonDataContainerNotExists = '没有找到公共数据:%s';
  sCommonDataIndexOutOfRange = '公共数据索引超出范围';
  sWorkerNoAccess = '没有操作权限';

const
  sDABinaryOperator: array [TDABinaryOperator] of string = (' And ', ' Or ',
    ' Xor ', ' < ', ' <= ', ' > ', ' >= ', ' <> ', ' = ', ' Like ', ' In ',
    ' + ', ' - ', ' * ', ' / ', ' not in ');
  //
  // const
  // // 二元操作符(Binary Operator)
  // dboAnd = 0;
  // dboOr = 1;
  // dboXor = 2;
  // dboLess = 3;
  // dboLessOrEqual = 4;
  // dboGreater = 5;
  // dboGreaterOrEqual = 6;
  // dboNotEqual = 7;
  // dboEqual = 8;
  // dboLike = 9;
  // dboIn = 10;
  //
  // // 字段类型
  // datUnknown = 0;
  // datString = 1;
  // datDateTime = 2;
  // datFloat = 3;
  // datCurrency = 4;
  // datAutoInc = 5;
  // datInteger = 6;
  // datLargeInt = 7;
  // datBoolean = 8;
  // datMemo = 9;
  // datBlob = 10;
  // datWideString = 11;
  // datWideMemo = 12;
  // datLargeAutoInc = 13;
  // datByte = 14;
  // datShortInt = 15;
  // datWord = 16;
  // datSmallInt = 17;
  // datCardinal = 18;
  // datLargeUInt = 19;
  // datGuid = 20;
  // datXml = 21;
  // datDecimal = 22;
  // datSingleFloat = 23;
  // datFixedChar = 24;
  // datFixedWideChar = 25;
  // datCursor = 26;
  //
  // // 参数标志
  // fIn = 0;
  // fOut = 1;
  // fInOut = 2;
  // fResult = 3;
  //
  // // 参数类型
  // rtInteger = 0;
  // rtDateTime = 1;
  // rtDouble = 2;
  // rtCurrency = 3;
  // rtWidestring = 4;
  // rtString = 5;
  // rtInt64 = 6;
  // rtBoolean = 7;
  // rtVariant = 8;
  // rtBinary = 9;
  // rtXML = 10;
  // rtGuid = 11;
  // rtDecimal = 12;
  // rtUTF8String = 13;
  // rtXsDateTime = 14;
  // rtUserDefined = 15;

type

  { Data Export interface }
  IDataExportWizard = interface
    ['{174AE4D9-6F2A-4573-AE01-F4D25C236DD0}']
    procedure ExportData(ADataSet: TDataSet; AExportFields: string);
  end;

  { Data Import interface }
  IDataImportWizard = interface
    ['{04812F0C-5A73-4508-9105-04C22248A062}']
    procedure ImportData(ADataSet: TDataSet;
      AImportFields, AKeyColumns: string);
  end;

  TVariantArray = array of Variant;
  TDABinaryOperatorArray = array of TDABinaryOperator;

  TCustomData = class;
  TDataConnection = class;

  { 远程服务连接 }
  TROConnection = class(TComponent)
  private
    FTargetUrl: string;
    FTargetList: TStrings;
    FTargetIndex: Integer;
    FLoginServiceName: string;
    FSystemServiceName: string;
    FMessage: TROMessage;
    FChannel: TROTransportChannel;
    FService: TRORemoteService;
    FDynamicRequest: TRODynamicRequest;

{$IFDEF EnableDAModelLogger}
    PerformanceCounter1, PerformanceCounter2, PerformanceFrequency: Int64;
    procedure DataAdapterBeforeGetDataCall(Sender: TObject;
      Request: TRODynamicRequest);
    procedure DataAdapterAfterGetDataCall(Sender: TObject;
      Request: TRODynamicRequest);
    procedure DataAdapterGetSchemaCallBeforeExecute(Sender: TRODynamicRequest);
    procedure DataAdapterUpdateDataCallAfterExecute(Sender: TRODynamicRequest);
    procedure DataAdapterUpdateDataCallExecuteError(Sender: TRODynamicRequest;
      Error: Exception; var Ignore: Boolean);
    procedure DataAdapterUpdateDataCallBeforeExecute(Sender: TRODynamicRequest);
{$ENDIF}
  protected
    procedure SetTargetIndex(const Value: Integer);
    procedure SetTargetUrl(ATargetUrl: string); virtual;
  public
    constructor Create(AOwner: TComponent; ATargetUrl: string); virtual;
    destructor Destroy(); override;

    procedure ConnectLocalServer(ALocalServer: TROLocalServer);

    procedure MakeRequest(const AServiceName, AMethodName: string;
      AParamName: array of string; AParamValue: array of Variant;
      AParamType: array of TRODataType; AParamFlag: array of TRODLParamFlag);

    procedure BeginMethod(AServiceName, AMethodName: string);
    procedure SetMethodParam(AParamName: string; AParamValue: Variant;
      AParamType: Integer; AParamFlag: Integer);
    procedure EndMethod();
    function GetMethodParam(ParamName: string): Variant;

    function Login(ALoginText: string): string;
    procedure Logout();

    property TargetUrl: string read FTargetUrl write SetTargetUrl;
    property TargetList: TStrings read FTargetList;
    // Organizer负责TargetUrl/TargetList
    property TargetIndex: Integer read FTargetIndex write SetTargetIndex;
    property LoginServiceName: string read FLoginServiceName
      write FLoginServiceName;
    property SystemServiceName: string read FSystemServiceName
      write FSystemServiceName;
    property ROMessage: TROMessage read FMessage;
    property Channel: TROTransportChannel read FChannel;
    property ROService: TRORemoteService read FService;
    property DynamicRequest: TRODynamicRequest read FDynamicRequest;
  end;

  // 遍历TDADataTable的过程
  TDataTableEnumProc = procedure(ADataTable: TDADataTable; AParam: Variant)
    of object;
  // 遍历TDADataTable.Fields的过程
  TTableFieldEnumProc = procedure(AField: TDAField; AParam: Variant) of object;
  // 记录选择过程
  TRecordSelectionProc = function(ADataTable: TDADataTable): Boolean of object;

  // 获取选择的记录用到的记录
  TSelectTableRecord = record
    ResultList: TStrings;
    ResultField: string;
    CompareField: string;
    CompareValue: Variant;
  end;

  PSelectTableRecord = ^TSelectTableRecord;

  // 获取选择的记录用到的记录
  TSumTableRecord = record
    SumResult: Double;
    SumField: string;
    CompareField: string;
    CompareValue: Variant;
  end;

  PSumTableRecord = ^TSumTableRecord;

  { 数据视图类别 }
  TDataViewType = (dvGrid, dvBand, dvCard, dvChart, dvTree, dvPivot, dvForm);

  {
    数据服务对应的客户端通讯组件

    使用TDataServiceContainer.RegisterDataService进行创建
  }
  TCustomDataService = class(TComponent)
  private
    FDataService: TRORemoteService;
    FDataStreamer: TDADataStreamer;
    FDataAdapter: TDARemoteDataAdapter;
    FDACommand: TDARemoteCommand;
    FDataConnection: TDataConnection;

    procedure CorrectService();
    function GetDataAdapter: TDARemoteDataAdapter;
    function GetDataService: TRORemoteService;
    function GetDACommand(): TDARemoteCommand;
    procedure DoBeforeExecuteCommandEx(Sender: TRODynamicRequest);
    procedure DoAfterExecuteCommandEx(Sender: TRODynamicRequest);
  public
    constructor Create(const AServiceName: string;
      ADataConnection: TDataConnection);

    procedure BeginCommand(ACommandName: string);
    procedure SetCommandParam(AParamName: string; AParamValue: Variant);
    procedure EndCommand();
    function GetCommandOutputParam(AParamName: string): Variant;

    property DAService: TRORemoteService read GetDataService;
    property DAAdapter: TDARemoteDataAdapter read GetDataAdapter;
    property DACommand: TDARemoteCommand read GetDACommand;
    property DAConnection: TDataConnection read FDataConnection;
  end;

  TCustomDataServiceClass = class of TCustomDataService;

  {
    数据服务连接
  }
  TDataConnection = class(TROConnection)
  private
    FDataAdapter: TDARemoteDataAdapter;
    FDataStreamer: TDADataStreamer;
    FDAStreamer: string;
    FDataServiceList: TObjectList;
    function NewDAStreamer(AOwner: TComponent): TDADataStreamer;
  public
    constructor Create(AOwner: TComponent; ATargetUrl: string;
      ADAStreamer: string); reintroduce;
    destructor Destroy(); override;

    function RegisterDataService(const AServiceName: string)
      : TCustomDataService; overload;
    function RegisterDataService(const AServiceName: string;
      AServiceClass: TCustomDataServiceClass): TCustomDataService; overload;
    function GetDataService(const AServiceName: string): TCustomDataService;

    property DataAdapter: TDARemoteDataAdapter read FDataAdapter;
  end;

  {
    数据基类

    1. 注意在登录之前不能访问Table和Source

    2. 通常应使用Open来打开数据, 而不使用Table.Active:=True

    3. 通过调用RemoteDataAdapter.FillSchema，将Schema中定义的属性填充到
    TDAMemDataTable.CustomAttributes和TDAField.CustomAttributes中。

    4. DataTable的CustomAttributes目前不能从Schema中直接获取，只有在类中定义, 或者
    在Schema中添加一个固定名称的字段_Attr，专用于设置DataTable的自定义属性。这个
    字段也可辅助来完成一些特殊任务。<><><><><><><><><><><>(此问题已解决)

    5. CustomAttributes中的属性名不区分大小写！
    具体属性参考技术文档DataAbstract Schema.xls.

    6. 可在DataTable的自定义属性中定义一个ColorField属性，用于指明行的
    背景色来自于该字段。

    7. 一个字段在LookupResultFields自定义属性中可指明多个Lookup结果！！！

    8. 在Schema中可指定IndexFieldNames，在查询完成后将自动排序。
    结合Table.AutoSortRecords可在编辑数据后完成自动排序！！！。

    9. 不设置数据服务名时或者名称错误，可以用作本地表！！

    10. 增加主从表自动关联功能，适用于主从表都需要同时编辑的数据。
    主表：EanableScroll/DisableScroll，自身随时调用TriggerScroll
    从表：绑定到主表BindMaster，或者编写响应OnScroll事件
    一主表可绑定多可从从!

    如果数据绑定到了TCustomTableGridDataView, 则不要EnableScroll，TableView负责触发scroll

    简单情况下可用TCustomTableGridDataView.OnRecordScroll

    11. 创建时可以传参数，查询时可据此进行不同查询，数据逻辑处理也可据此作出判断。
    目前使用场景：Schema中一个表定义，需要据此生成多个字典数据表

  }
  TCustomData = class(TComponent)
  private
    FDataConnection: TDataConnection;
    FServiceName: string;
    FLogicalName: string;
    FTable: TDAMemDataTable;
    FSource: TDADataSource;
    // FScriptProvider: TDASpiderMonkeyScriptProvider;
    FKeyFieldNames: string;
    FAccess: string; // 用于字典维护
    FDialogImage: string;
    FReporterNames: TStrings;
    FReporterTypeField: string;
    FReporterGroupField: string; // 打印分组字段，相同组只打印一次
    FOnScroll: TNotifyEvent; // 由自身和视图共同决定何时触发
    FOnBeforePost: TNotifyEvent;
    FOnBeforeDelete: TNotifyEvent;
    FOnAfterPost: TNotifyEvent;
    FOnAfterInsert: TNotifyEvent;
    FOnCalcFields: TNotifyEvent;
    FOnBeforeFilter: TNotifyEvent;

    FScrollObservers: TObjectList;
    FForeignField: string; // 外键字段，用于主从表查询
    FMasterData: TCustomData; // 主表
    FMasterKey: Variant;
    FCreateParam: Variant;
    FAutoSave: Boolean; // 自动保存

    FFilterFields: TStrings;
    FFilterFromServer: Boolean; // 是否通过服务器进行过滤
    FFilterMinLen: Integer; // 过滤最小长度
    FFilterCompareOperator: string; // 过滤比较符

    FFixFilterField: string;
    FFixFilterText: string;
    FFixFilterOperator: TDABinaryOperator;

    function GetTable(): TDAMemDataTable;
    function GetSource(): TDADataSource;
    procedure SetLogicalName(ALogicalName: string);
    function GetDefaultViewType(): TDataViewType;
    function GetDescription(): string;
    function GetCategory(): string;

    procedure SetIndexFieldNames(AValue: string);
    function GetIndexFieldNames(): string;
    function GetKeyValue(): Variant;
    function GetAsString(const FieldName: string): string;
    procedure SetAsString(const FieldName: string; const Value: string);
    function GetAsVariant(const FieldName: string): Variant;
    procedure SetAsVariant(const FieldName: string; const Value: Variant);
    function GetAsCurrency(const FieldName: string): Currency;
    procedure SetAsCurrency(const FieldName: string; const Value: Currency);
    function GetAsBoolean(const FieldName: string): Boolean;
    procedure SetAsBoolean(const FieldName: string; const Value: Boolean);
    function GetAsInteger(const FieldName: string): Integer;
    procedure SetAsInteger(const FieldName: string; const Value: Integer);
    function GetAsDouble(const FieldName: string): Double;
    procedure SetAsDouble(const FieldName: string; const Value: Double);
    function GetCustomAttributes: TStrings;
    function GetFieldCustomAttributes(const FieldName: string): TStrings;
    function GetAsDecimal(const FieldName: string): TBCD;
    procedure SetAsDecimal(const FieldName: string; const Value: TBCD);
    function GetAsDateTime(const FieldName: string): TDateTime;
    procedure SetAsDateTime(const FieldName: string; const Value: TDateTime);
    function GetOldValue(const FieldName: string): Variant;
    function GetScrollObservers: TObjectList;
    function GetLogChanges: Boolean;
    procedure SetLogChanges(const Value: Boolean);
    function GetFieldLogChanges(const FieldName: string): Boolean;
    procedure SetFieldLogChanges(const FieldName: string; const Value: Boolean);
    function GetFieldDisplayLabel(const FieldName: string): string;
    procedure SetFieldDisplayText(const FieldName, Value: string);
    function GetParamValue(const ParamName: string): Variant;
    procedure SetParamValue(const ParamName: string; const Value: Variant);
    function GetMaxRecords: Integer;
    procedure SetMaxRecords(const Value: Integer);
    function GetParamCount: Integer;
    procedure SetFilterText(const Value: string);
    function GetFilterText: string;
  protected
    procedure Notification(AComponent: TComponent;
      Operation: TOperation); override;

    procedure InitTableBeforeOpen(ATable: TDAMemDataTable); virtual;
    procedure InitTableAfterSchema(ATable: TDAMemDataTable); virtual;
    procedure InitTableField(AField: TDAField; AParam: Variant); virtual;
    procedure SetFieldDefaultValue(AField: TDAField; AParam: Variant); virtual;
    procedure ValidatFieldValue(AField: TDAField; AParam: Variant); virtual;

    procedure DoInternalOpen(); virtual;
    procedure DoDataBeforePost(Sender: TDADataTable); virtual;
    procedure DoDataBeforeDelete(Sender: TDADataTable); virtual;
    procedure DoDataAfterInsert(Sender: TDADataTable); virtual;
    procedure DoDataAfterEdit(Sender: TDADataTable); virtual;
    procedure DoDataAfterPost(Sender: TDADataTable); virtual;
    procedure DoDataAfterScroll(Sender: TDADataTable); virtual;
    procedure DoDataCalcFields(Sender: TDADataTable); virtual;
    procedure DoMasterScroll(Sender: TDADataTable); virtual;
    procedure DoAutoSave(); virtual;
    procedure DoDataBeforeFilter(); virtual;

    property ScrollObservers: TObjectList read GetScrollObservers;
  public
    constructor Create(AOwner: TComponent; ADataConnection: TDataConnection;
      const AServiceName, ALogicalName: string); virtual;
    destructor Destroy(); override;

    procedure InitData();

    function CanEdit(): Boolean; virtual;
    function CanInsert(): Boolean; virtual;
    function CanDelete(): Boolean; virtual;
    function CanSave(): Boolean; virtual;
    function CanCancel(): Boolean; virtual;
    function CanQuery(): Boolean; virtual;
    function CanPrint(): Boolean; virtual;

    procedure Edit(); virtual;
    procedure Insert(); virtual;
    procedure Delete(); virtual;
    procedure Save(); virtual;
    procedure Cancel(); virtual;
    procedure First();
    procedure Prior();
    procedure Next();
    procedure Last();
    function Eof: Boolean;
    function RecID: Integer;
    function RecordCount(): Integer;
    function FieldByName(AName: string): TDAField;
    function GetBookmark(): TBookmark;
    procedure GotoBookmark(Bookmark: TBookmark);
    procedure FreeBookmark(Bookmark: TBookmark);
    function Locate(const KeyFields: string; const KeyValues: Variant;
      Options: TLocateOptions): Boolean;

    procedure BindMaster(AMaster: TCustomData; const AForeignField: string);
    procedure QueryAfterMasterScroll(); virtual;
    procedure TriggerScroll();
    procedure DisableScroll();
    procedure EnableScroll();
    procedure DisableControls();
    procedure EnableControls();
    procedure EnableBatchUpdate();
    procedure DisableBatchUpdate();
    procedure ApplyUpdates(); virtual;

    procedure Open(); virtual;
    procedure Close(); virtual;
    procedure Refresh(); virtual;

    procedure EditWithNoLogChanges(FieldNames: array of string;
      FieldValues: array of Variant);
    procedure AssignFieldValue(const AFieldName: string; ASource: TCustomData;
      var ADone: Boolean); virtual;
    procedure ClearAllFieldValues();

    procedure SetFixFilter(const AFieldName, AFilterText: string;
      AFilterOperator: TDABinaryOperator = dboEqual); virtual;
    function GetFixFilterWhereText(): string;

    procedure DoLocalFilter(const AFilterText: string); virtual;
    procedure DoServerFilter(const AFilterText: string); virtual;

    procedure BuildDynamicWhere(const AFieldNames: array of string;
      const AFieldValues: array of Variant;
      const AOperators: array of TDABinaryOperator;
      const AListOperator: array of TDABinaryOperator);

    procedure OpenByList(const AFieldNames: array of string;
      const AFieldValues: array of Variant;
      const AOperators: array of TDABinaryOperator;
      const AListOperator: array of TDABinaryOperator);

    procedure OpenByFieldValue(const AFieldName: string; AFieldValue: Variant;
      AOperator: TDABinaryOperator = dboEqual);

    procedure OpenByPeriod(const ADateFieldName: string;
      ABeginDate, AEndDate: TDateTime);

    procedure OpenByBetween(const AFieldName: string;
      AStartValue, AEndValue: Variant);

    procedure OpenByKeyValue(AValue: Variant);

    procedure OpenByWhereText(const AText: string); deprecated;

    procedure OpenByParam(const AParamNames: array of string;
      const AParamValues: array of Variant);

    procedure CreateLocalTableFields(const ATableAttributes: string;
      const AFieldNames: array of string;
      const AFieldTypes: array of TDADataType;
      const AFieldSizes: array of Integer;
      const AFieldAttributes: array of string);

    function GetRecordText(const AFieldNames: string;
      ASeperator: string = ' '): string;

    property DataConnection: TDataConnection read FDataConnection;
    property Table: TDAMemDataTable read GetTable;
    property Source: TDADataSource read GetSource;
    property LogicalName: string read FLogicalName write SetLogicalName;
    property KeyFieldNames: string read FKeyFieldNames;
    property KeyValue: Variant read GetKeyValue;
    property DefaultViewType: TDataViewType read GetDefaultViewType;
    property IndexFieldNames: string read GetIndexFieldNames
      write SetIndexFieldNames;
    property Description: string read GetDescription;
    property LogChanges: Boolean read GetLogChanges write SetLogChanges;
    property Category: string read GetCategory;
    property Access: string read FAccess;
    property DialogImage: string read FDialogImage;
    property ReporterNames: TStrings read FReporterNames;
    property ReporterTypeField: string read FReporterTypeField
      write FReporterTypeField;
    property ReporterGroupField: string read FReporterGroupField
      write FReporterGroupField;
    property MasterData: TCustomData read FMasterData;
    property MasterKey: Variant read FMasterKey;
    property CreateParam: Variant read FCreateParam write FCreateParam;
    property MaxRecords: Integer read GetMaxRecords write SetMaxRecords;
    property FilterFields: TStrings read FFilterFields;
    property FilterFromServer: Boolean read FFilterFromServer
      write FFilterFromServer;
    property FilterText: string read GetFilterText write SetFilterText;
    property CustomAttributes: TStrings read GetCustomAttributes;
    property FieldCustomAttributes[const FieldName: string]: TStrings
      read GetFieldCustomAttributes;
    property FieldLogChanges[const FieldName: string]: Boolean
      read GetFieldLogChanges write SetFieldLogChanges;
    property FieldDisplayLabel[const FieldName: string]: string
      read GetFieldDisplayLabel write SetFieldDisplayText;
    property ParamValue[const ParamName: string]: Variant read GetParamValue
      write SetParamValue;
    property ParamCount: Integer read GetParamCount;
    property AutoSave: Boolean read FAutoSave write FAutoSave;
    property OldValue[const FieldName: string]: Variant read GetOldValue;
    property AsString[const FieldName: string]: string read GetAsString
      write SetAsString;
    property AsBoolean[const FieldName: string]: Boolean read GetAsBoolean
      write SetAsBoolean;
    property AsInteger[const FieldName: string]: Integer read GetAsInteger
      write SetAsInteger;
    property AsFloat[const FieldName: string]: Double read GetAsDouble
      write SetAsDouble;
    property AsDateTime[const FieldName: string]: TDateTime read GetAsDateTime
      write SetAsDateTime;
    property AsCurrency[const FieldName: string]: Currency read GetAsCurrency
      write SetAsCurrency;
    property AsVariant[const FieldName: string]: Variant read GetAsVariant
      write SetAsVariant;
    property AsDecimal[const FieldName: string]: TBCD read GetAsDecimal
      write SetAsDecimal;

  published
    property OnScroll: TNotifyEvent read FOnScroll write FOnScroll;
    property OnBeforePost: TNotifyEvent read FOnBeforePost write FOnBeforePost;
    property OnBeforeDelete: TNotifyEvent read FOnBeforeDelete
      write FOnBeforeDelete;
    property OnAfterPost: TNotifyEvent read FOnAfterPost write FOnAfterPost;
    property OnAfterInsert: TNotifyEvent read FOnAfterInsert
      write FOnAfterInsert;
    property OnCalcFields: TNotifyEvent read FOnCalcFields write FOnCalcFields;
    property OnBeforeFilter: TNotifyEvent read FOnBeforeFilter
      write FOnBeforeFilter;
  end;

  TCustomDataClass = class of TCustomData;

const
  // Data Definition Flag
  DD_DICTIONARY = $0001; // 字典标志

type

  { 数据项定义 }
  TDataDefinition = class
  private
    FDataConnection: TDataConnection;
    FServiceName: string;
    FLogicalName: string;
    FFlag: Integer;
    FData: TCustomData;
    FDataClass: TCustomDataClass;
    FCreateParam: Variant;

    function GetData(): TCustomData;
  public
    constructor Create(ADataConnection: TDataConnection;
      AServiceName, ALogicalName: string; ADataClass: TCustomDataClass;
      AFlag: Integer; ACreateParam: string);
    destructor Destroy(); override;

    function CreateData(AOwner: TComponent): TCustomData;

    property DAClient: TDataConnection read FDataConnection;
    property ServiceName: string read FServiceName;
    property LogicanName: string read FLogicalName;
    property Flag: Integer read FFlag;
    property DataClass: TCustomDataClass read FDataClass;
    property CreateParam: Variant read FCreateParam;
    property CustomData: TCustomData read GetData;
  end;

  {
    数据容器

    1 自动管理数据，除了CreateData所创建的数据(由外部管理)
    2 只在GetSource中自动打开数据，GetItemByLogicalName方法中不自动打开数据
    3 应该注册所有数据，便于集中管理
  }
  TDataContainer = class
  private
    FDataList: TStringList;
    function GetDataDefinition(const ALogicalName: string): TDataDefinition;
    function GetDataDefinition2(Index: Integer): TDataDefinition;
    function GetItemByLogicalName(const ALogicalName: string): TCustomData;
    function GetCount(): Integer;
  public
    constructor Create();
    destructor Destroy(); override;

    procedure RegisterData(ADataConnection: TDataConnection;
      const AServiceName, ALogicalName: string; AFlag: Integer;
      ACreateParam: string); overload;

    procedure RegisterData(ADataConnection: TDataConnection;
      const AServiceName, ALogicalName: string; ADataClass: TCustomDataClass;
      AFlag: Integer; ACreateParam: string); overload;

    procedure RegisterData(ADataConnection: TDataConnection;
      const AServiceName, ALogicalName: string; ADataClassName: String;
      AFlag: Integer; ACreateParam: string); overload;

    function CreateData(AOwner: TComponent; const ALogicalName: string)
      : TCustomData;

    function GetSource(const ALogicalName: string): TDADataSource;
    property Items[const ALogicalName: string]: TCustomData
      read GetItemByLogicalName; default;
    property ItemsByIndex[AIndex: Integer]: TDataDefinition
      read GetDataDefinition2;
    property Count: Integer read GetCount;
  end;

procedure EnumDataTable(ADataTable: TDADataTable; AEnumProc: TDataTableEnumProc;
  AParam: Variant);

procedure EnumDataTableField(ADataTable: TDADataTable;
  AEnumProc: TTableFieldEnumProc; AParam: Variant);

procedure DataTable_CopyFieldsDefinition(ASource, ADest: TDADataTable;
  AIgnoreAutoInc: Boolean);

procedure DataTable_CopyAllData(ASource, ADest: TCustomData);

procedure DataTable_CopySelectedData(ASource, ADest: TCustomData;
  AMultiSelectField: string;
  ASourceFields, ADestFields: array of string); overload;

procedure DataTable_CopySelectedData(ASource, ADest: TCustomData;
  AMultiSelectField: string); overload;

procedure DataTable_CopySelectedData(ASource, ADest: TCustomData;
  ARecordSelectionProc: TRecordSelectionProc); overload;

procedure DataTable_CopyCurrentRecord(ASource, ADest: TDADataTable); overload;

procedure DataTable_CopyCurrentRecord(ASource, ADest: TDADataTable;
  ASourceFields, ADestFields: array of string); overload;

procedure DataTable_GetSelectedList(ADataTable: TDADataTable;
  AResultList: TStrings; const AResultField, ACompareField: string;
  ACompareValue: Variant);

function DataTable_GetSelectedCommaText(ADataTable: TDADataTable;
  const AResultField, ACompareField: string; ACompareValue: Variant): string;

procedure DataTable_SaveToXmlStream(ADataTable: TDADataTable; AStream: TStream;
  MaxRows: Integer = -1);

function DataTable_GetXmlText(ADataTable: TDADataTable;
  MaxRows: Integer = -1): string;

procedure DataTable_SaveToXmlFile(ADataTable: TDADataTable; AFileName: string);

procedure DataTable_LoadFromXmlFile(ADataTable: TDADataTable;
  AFileName: string);

procedure DataTable_SaveToJsonStream(ADataTable: TDADataTable; AStream: TStream;
  MaxRows: Integer = -1);

function DataTable_GetJsonText(ADataTable: TDADataTable;
  MaxRows: Integer = -1): string;

procedure DataTable_SaveToJsonFile(ADataTable: TDADataTable; AFileName: string);

procedure DataTable_LoadFromJsonFile(ADataTable: TDADataTable;
  AFileName: string);

procedure DataTable_SetFieldsVisible(ADataTable: TDADataTable;
  AVisibleFields: array of string; AVisible: Boolean = True); overload;

procedure DataTable_SetFieldsVisible(ADataTable: TDADataTable;
  ACommaFields: string; AVisible: Boolean = True); overload;

function DataTable_GetSelectedSum(ADataTable: TDADataTable;
  const ASumField, ACompareField: string; ACompareValue: Variant): Double;

procedure DataTable_IntoEditState(ADataTable: TDADataTable);

procedure DataTable_UpdateFieldValue(ADataTable: TDADataTable;
  const AField: string; AValue: Variant);

var
  DataContainer: TDataContainer; // 公共(逻辑)数据容器
  DataConnection: TDataConnection; // 由组织者创建

  DataExportWizard: IDataExportWizard; // 由Advanced Data Export Wizard管理
  DataImportWizard: IDataImportWizard; // 由Advanced Data Import Wizard管理

implementation

// 更新所有记录指定字段的值
procedure DataTable_UpdateFieldValue(ADataTable: TDADataTable;
  const AField: string; AValue: Variant);
var
  bk: TBookmark;
begin
  ADataTable.DisableControls;
  try
    bk := ADataTable.GetBookmark;
    ADataTable.First;

    while not ADataTable.Eof do
    begin
      ADataTable.Edit;
      ADataTable.FieldByName(AField).Value := AValue;
      ADataTable.Post;;

      ADataTable.Next;
    end;
    ADataTable.GotoBookmark(bk);
  finally
    ADataTable.FreeBookmark(bk);
  end;
end;

procedure DataTable_IntoEditState(ADataTable: TDADataTable);
begin
  // 使DataTable进入编辑状态
  if not(ADataTable.State in [dsEdit, dsInsert]) then
    if ADataTable.Eof then
      ADataTable.Append
    else
      ADataTable.Edit;
end;

procedure DataTable_SaveToXmlStream(ADataTable: TDADataTable; AStream: TStream;
  MaxRows: Integer);
var
  Streamer: TDAXmlDataStreamer;
  bk: TBookmark;
begin
  Streamer := TDAXmlDataStreamer.Create(nil);
  if ADataTable.State in [dsEdit, dsInsert] then
    ADataTable.Post;
  bk := ADataTable.GetBookmark;
  ADataTable.DisableControls;
  try
    if MaxRows < 0 then
      ADataTable.First;
    Streamer.WriteDataset(AStream, ADataTable, [woRows], MaxRows);
  finally
    Streamer.Free;
    ADataTable.GotoBookmark(bk);
    ADataTable.EnableControls;
  end;
end;

function DataTable_GetXmlText(ADataTable: TDADataTable;
  MaxRows: Integer): string;
var
  StringStream: TStringStream;
begin
  // 获取DataTable的XML文本表示，与存储过程的XML数据类型结合起来，
  // 可动态修改业务流程，而不需修改软件
  StringStream := TStringStream.Create('', TEncoding.UTF8);
  try
    DataTable_SaveToXmlStream(ADataTable, StringStream, MaxRows);
    Result := StringStream.DataString;
    // 去掉第1行: <?xml version="1.0" encoding="utf-8"?>, SQLServer不能转换格式
    Result := Copy(Result, Pos('<XMLData>', Result), Length(Result));
  finally
    StringStream.Free;
  end;
end;

{ 用XML格式保存数据 }

procedure DataTable_SaveToXmlFile(ADataTable: TDADataTable; AFileName: string);
var
  FileStream: TFileStream;
begin
  FileStream := TFileStream.Create(AFileName, fmCreate);
  try
    DataTable_SaveToXmlStream(ADataTable, FileStream);
  finally
    FileStream.Free;
  end;
end;

{ 用XML格式加载数据 }

procedure DataTable_LoadFromXmlFile(ADataTable: TDADataTable;
  AFileName: string);
var
  Streamer: TDAXmlDataStreamer;
  FileStream: TFileStream;
begin
  Streamer := TDAXmlDataStreamer.Create(nil);
  try
    FileStream := TFileStream.Create(AFileName, fmOpenRead);
    try
      Streamer.ReadDataset(FileStream, ADataTable)
    finally
      FileStream.Free;
    end;
  finally
    Streamer.Free;
  end;
end;

procedure DataTable_SaveToJsonStream(ADataTable: TDADataTable; AStream: TStream;
  MaxRows: Integer);
var
  Streamer: TDAJSONDataStreamer;
  bk: TBookmark;
begin
  Streamer := TDAJSONDataStreamer.Create(nil);
  if ADataTable.State in [dsEdit, dsInsert] then
    ADataTable.Post;
  bk := ADataTable.GetBookmark;
  ADataTable.DisableControls;
  try
    if MaxRows < 0 then
      ADataTable.First;
    Streamer.WriteDataset(AStream, ADataTable, [woRows], MaxRows);
  finally
    Streamer.Free;
    ADataTable.GotoBookmark(bk);
    ADataTable.EnableControls;
  end;
end;

function DataTable_GetJsonText(ADataTable: TDADataTable;
  MaxRows: Integer): string;
var
  StringStream: TStringStream;
begin
  // 获取DataTable的XML文本表示，与存储过程的XML数据类型结合起来，
  // 可动态修改业务流程，而不需修改软件
  StringStream := TStringStream.Create('');
  try
    DataTable_SaveToJsonStream(ADataTable, StringStream, MaxRows);
    Result := StringStream.DataString;
    // 去掉第1行: <?xml version="1.0" encoding="utf-8"?>, SQLServer不能转换格式
    Result := Copy(Result, Pos('<XMLData>', Result), Length(Result));
  finally
    StringStream.Free;
  end;
end;

{ 用JSON格式保存数据 }

procedure DataTable_SaveToJsonFile(ADataTable: TDADataTable; AFileName: string);
var
  FileStream: TFileStream;
begin
  FileStream := TFileStream.Create(AFileName, fmCreate);
  try
    DataTable_SaveToJsonStream(ADataTable, FileStream);
  finally
    FileStream.Free;
  end;
end;

{ 用JSON格式加载数据 }

procedure DataTable_LoadFromJsonFile(ADataTable: TDADataTable;
  AFileName: string);
var
  Streamer: TDAJSONDataStreamer;
  FileStream: TFileStream;
begin
  Streamer := TDAJSONDataStreamer.Create(nil);
  try
    FileStream := TFileStream.Create(AFileName, fmOpenRead);
    try
      Streamer.ReadDataset(FileStream, ADataTable)
    finally
      FileStream.Free;
    end;
  finally
    Streamer.Free;
  end;
end;

{ 复制字段定义 }

procedure DataTable_CopyFieldsDefinition(ASource, ADest: TDADataTable;
  AIgnoreAutoInc: Boolean);
var
  I: Integer;
begin
  ADest.CustomAttributes.Assign(ASource.CustomAttributes);
  ADest.Fields.Clear;
  for I := 0 to ASource.FieldCount - 1 do
  begin
    if not SameText(ASource.Fields[I].Name, 'RecID') then
      with ADest.Fields.Add do
      begin
        Assign(ASource.Fields[I]);

        if AIgnoreAutoInc and (DataType = datAutoInc) then
          DataType := datInteger;
      end;
  end;
end;

{ 复制全部信息 }

procedure DataTable_CopyAllData(ASource, ADest: TCustomData);
var
  bk: TBookmark;
begin
  ADest.DisableControls;
  ASource.DisableControls;
  try
    bk := ASource.GetBookmark;
    ASource.Save;
    ASource.First;

    while not ASource.Eof do
    begin
      ADest.Insert;
      DataTable_CopyCurrentRecord(ASource.Table, ADest.Table);
      ADest.Save;

      ASource.Next;
    end;
    ASource.GotoBookmark(bk);
  finally
    ASource.FreeBookmark(bk);
    ADest.EnableControls;
    ASource.EnableControls;
  end;
end;

{ 复制选择的记录 }

procedure DataTable_CopySelectedData(ASource, ADest: TCustomData;
  AMultiSelectField: string; ASourceFields, ADestFields: array of string);
var
  bk: TBookmark;
begin
  ADest.DisableControls;
  ASource.DisableControls;
  try
    bk := ASource.GetBookmark;
    ASource.Save;
    ASource.First;
    while not ASource.Eof do
    begin
      if ASource.FieldByName(AMultiSelectField).AsBoolean then
      begin
        ADest.Insert;
        DataTable_CopyCurrentRecord(ASource.Table, ADest.Table, ASourceFields,
          ADestFields);
        ADest.Save;
      end;
      ASource.Next;
    end;
    ASource.GotoBookmark(bk);
  finally
    ADest.Cancel;
    ASource.FreeBookmark(bk);
    ADest.EnableControls;
    ASource.EnableControls;
  end;
end;

procedure DataTable_CopySelectedData(ASource, ADest: TCustomData;
  AMultiSelectField: string);
var
  bk: TBookmark;
begin
  ADest.DisableControls;
  ASource.DisableControls;
  try
    bk := ASource.GetBookmark;
    ASource.Save;
    ASource.First;
    while not ASource.Eof do
    begin
      if ASource.FieldByName(AMultiSelectField).AsBoolean then
      begin
        ADest.Insert;
        DataTable_CopyCurrentRecord(ASource.Table, ADest.Table);
        ADest.Save;
      end;
      ASource.Next;
    end;
    ASource.GotoBookmark(bk);
  finally
    ASource.FreeBookmark(bk);
    ADest.Cancel;
    ADest.EnableControls;
    ASource.EnableControls;
  end;
end;

procedure DataTable_CopySelectedData(ASource, ADest: TCustomData;
  ARecordSelectionProc: TRecordSelectionProc); overload;
var
  bk: TBookmark;
begin
  ADest.DisableControls;
  ASource.DisableControls;
  try
    bk := ASource.GetBookmark;
    ASource.Save;
    ASource.First;
    while not ASource.Eof do
    begin
      if ARecordSelectionProc(ASource.Table) then
      begin
        ADest.Insert;
        DataTable_CopyCurrentRecord(ASource.Table, ADest.Table);
        ADest.Save;
      end;
      ASource.Next;
    end;
    ASource.GotoBookmark(bk);
  finally
    ASource.FreeBookmark(bk);
    ADest.Cancel;
    ADest.EnableControls;
    ASource.EnableControls;
  end;
end;

{ 复制表的当前记录各字段值 }

procedure DataTable_CopyCurrentRecord(ASource, ADest: TDADataTable);
var
  I: Integer;
  FieldName: string;
begin
  for I := 0 to ADest.FieldCount - 1 do
  begin
    FieldName := ADest.Fields[I].Name;
    if not SameText(FieldName, 'RecID') and
      not(ADest.Fields[I].DataType in [datAutoInc, datLargeAutoInc]) and
      (ASource.FindField(FieldName) <> nil) then
      ADest.Fields[I].Value := ASource.FieldByName(FieldName).Value;
  end;
end;

{ 复制表的当前记录各字段值 }

procedure DataTable_CopyCurrentRecord(ASource, ADest: TDADataTable;
  ASourceFields, ADestFields: array of string);
var
  I: Integer;
begin
  Assert(Length(ASourceFields) = Length(ADestFields));
  for I := 0 to Length(ADestFields) - 1 do
  begin
    if not(ADest.FieldByName(ADestFields[I]).DataType in [datAutoInc,
      datLargeAutoInc]) then
      ADest.FieldByName(ADestFields[I]).Value :=
        ASource.FieldByName(ASourceFields[I]).Value;
  end;
end;

procedure DataTable_SetFieldsVisible(ADataTable: TDADataTable;
  AVisibleFields: array of string; AVisible: Boolean);
var
  I: Integer;
begin
  // 设置Table字段的可见性，其他字段可见性相反
  // 便于构建不同的界面，例如表格显示和窗体编辑常常不同
  for I := 0 to ADataTable.FieldCount - 1 do
    ADataTable.Fields[I].Visible := not AVisible;
  for I := 0 to Length(AVisibleFields) - 1 do
    ADataTable.FieldByName(AVisibleFields[I]).Visible := AVisible;
end;

procedure DataTable_SetFieldsVisible(ADataTable: TDADataTable;
  ACommaFields: string; AVisible: Boolean);
var
  FieldStrings: TStrings;
  I: Integer;
begin
  // 设置Table字段的可见性，其他字段可见性相反
  // 便于构建不同的界面，例如表格显示和窗体编辑常常不同
  for I := 0 to ADataTable.FieldCount - 1 do
    ADataTable.Fields[I].Visible := not AVisible;

  FieldStrings := TStringList.Create();
  try
    FieldStrings.CommaText := ACommaFields;
    for I := 0 to FieldStrings.Count - 1 do
    begin
      ADataTable.FieldByName(FieldStrings[I]).Visible := AVisible;
    end;
  finally
    FieldStrings.Free;
  end;
end;

{ 遍历表 }

procedure EnumDataTable(ADataTable: TDADataTable; AEnumProc: TDataTableEnumProc;
  AParam: Variant);
var
  bk: TBookmark;
begin
  Assert(ADataTable <> nil);
  Assert(Assigned(AEnumProc));
  Assert(ADataTable.Active);

  with ADataTable do
    try
      DisableControls;
      bk := GetBookmark;
      First;
      while not Eof do
      begin
        AEnumProc(ADataTable, AParam);
        Next;
      end;
      GotoBookmark(bk);
    finally
      FreeBookmark(bk);
      EnableControls;
    end;
end;

{ 遍历表的字段，遍历过程中可添加字段 }

procedure EnumDataTableField(ADataTable: TDADataTable;
  AEnumProc: TTableFieldEnumProc; AParam: Variant);
var
  I: Integer;
  Fields: array of TDAField;
begin
  SetLength(Fields, ADataTable.Fields.Count);
  // 拷贝下来后，在遍历时可添加字段、调整字段的顺序
  for I := 0 to ADataTable.Fields.Count - 1 do
    Fields[I] := ADataTable.Fields[I];
  for I := Low(Fields) to High(Fields) do
    AEnumProc(Fields[I], AParam);
end;

procedure SelectTableCompareProc(Self: TObject; ATable: TDADataTable;
  AParam: Variant);
begin
  with ATable, PSelectTableRecord(Integer(AParam))^ do
  begin
    if FieldByName(CompareField).AsVariant = CompareValue then
      ResultList.Add(FieldByName(ResultField).AsString)
  end;
end;

procedure DataTable_GetSelectedList(ADataTable: TDADataTable;
  AResultList: TStrings; const AResultField, ACompareField: string;
  ACompareValue: Variant);
var
  Param: TSelectTableRecord;
begin
  { 比较一个字段的值，从而得到另一个字段值的列表 }
  with Param do
  begin
    ResultList := AResultList;
    ResultField := AResultField;
    CompareField := ACompareField;
    CompareValue := ACompareValue;
  end;
  EnumDataTable(ADataTable,
    TDataTableEnumProc(MakeMethod(@SelectTableCompareProc)), Integer(@Param));
end;

function DataTable_GetSelectedCommaText(ADataTable: TDADataTable;
  const AResultField, ACompareField: string; ACompareValue: Variant): string;
var
  ResultList: TStringList;
begin
  ResultList := TStringList.Create;
  try
    DataTable_GetSelectedList(ADataTable, ResultList, AResultField,
      ACompareField, ACompareValue);
    Result := ResultList.CommaText;
  finally
    ResultList.Free;
  end;
end;

procedure SumTableCompareProc(Self: TObject; ATable: TDADataTable;
  AParam: Variant);
begin
  with ATable, PSumTableRecord(Integer(AParam))^ do
  begin
    if FieldByName(CompareField).AsVariant = CompareValue then
      SumResult := SumResult + FieldByName(SumField).AsFloat;
  end;
end;

function DataTable_GetSelectedSum(ADataTable: TDADataTable;
  const ASumField, ACompareField: string; ACompareValue: Variant): Double;
var
  EnumParam: TSumTableRecord;
begin
  { 比较一个字段的值，从而得到另一个字段值的和 }
  with EnumParam do
  begin
    SumResult := 0;
    SumField := ASumField;
    CompareField := ACompareField;
    CompareValue := ACompareValue;
  end;
  EnumDataTable(ADataTable, TDataTableEnumProc(MakeMethod(@SumTableCompareProc)
    ), Integer(@EnumParam));
  Result := EnumParam.SumResult;
end;

{ TROConnection }

procedure TROConnection.BeginMethod(AServiceName, AMethodName: string);
begin
  ROService.ServiceName := AServiceName;
  DynamicRequest.MethodName := AMethodName;
  DynamicRequest.Params.Clear;
end;

procedure TROConnection.ConnectLocalServer(ALocalServer: TROLocalServer);
begin
  FreeAndNil(FMessage);
  FreeAndNil(FChannel);

  { 配置为内部智联，默认Bin格式 }
  FMessage := TROBinMessage.Create(Self);
  FChannel := TROLocalChannel.Create(Self);
  TROLocalChannel(FChannel).ServerChannel := ALocalServer;

  FService.Message := FMessage;
  FService.Channel := FChannel;
end;

constructor TROConnection.Create(AOwner: TComponent; ATargetUrl: string);
begin
  inherited Create(AOwner);

  FLoginServiceName := 'LoginService';
  FSystemServiceName := 'SystemService';
  FTargetList := TStringList.Create;

  FService := TRORemoteService.Create(Self);
  FDynamicRequest := TRODynamicRequest.Create(Self);
  FDynamicRequest.RemoteService := FService;

  SetTargetUrl(ATargetUrl);
end;

{$IFDEF EnableDAModelLogger}

procedure TROConnection.DataAdapterAfterGetDataCall(Sender: TObject;
  Request: TRODynamicRequest);
begin
  QueryPerformanceCounter(PerformanceCounter2);
  QueryPerformanceFrequency(PerformanceFrequency);
  AppCore.Logger.WriteFmt('查询用时 %0.3f 秒',
    [(PerformanceCounter2 - PerformanceCounter1) /
    PerformanceFrequency], mtDebug);
end;

procedure TROConnection.DataAdapterBeforeGetDataCall(Sender: TObject;
  Request: TRODynamicRequest);
begin
  AppCore.Logger.Write('正在查询数据...', mtDebug);
  QueryPerformanceCounter(PerformanceCounter1);
end;

procedure TROConnection.DataAdapterGetSchemaCallBeforeExecute
  (Sender: TRODynamicRequest);
begin
  AppCore.Logger.Write('数据适配器正在查询Schema...', mtDebug);
end;

procedure TROConnection.DataAdapterUpdateDataCallAfterExecute
  (Sender: TRODynamicRequest);
begin
  AppCore.Logger.Write('数据提交成功', mtDebug);
end;

procedure TROConnection.DataAdapterUpdateDataCallBeforeExecute
  (Sender: TRODynamicRequest);
begin
  AppCore.Logger.Write('正在提交数据...', mtDebug);
end;

procedure TROConnection.DataAdapterUpdateDataCallExecuteError
  (Sender: TRODynamicRequest; Error: Exception; var Ignore: Boolean);
begin
  AppCore.Logger.Write('数据提交失败，原因：' + Error.Message, mtError);
end;
{$ENDIF}

destructor TROConnection.Destroy;
begin
  FreeAndNil(FMessage);
  FreeAndNil(FChannel);
  FreeAndNil(FTargetList);
  inherited;
end;

procedure TROConnection.EndMethod;
begin
  DynamicRequest.Execute(nil);
end;

function TROConnection.GetMethodParam(ParamName: string): Variant;
begin
  Result := DynamicRequest.ParamByName(ParamName).AsVariant;
end;

function TROConnection.Login(ALoginText: string): string;
begin
  MakeRequest(FLoginServiceName, 'Login', ['LoginText', 'Result'],
    [ALoginText, ''], [rtUtf8String, rtUtf8String], [fIn, fResult]);
  Result := FDynamicRequest.Params.ResultParam.AsString;
end;

procedure TROConnection.Logout;
begin
  MakeRequest(FLoginServiceName, 'Logout', [], [], [], []);
end;

// 动态调用服务中的方法，限制：方法涉及的参数只能是简单类型，不能时复杂类型

procedure TROConnection.MakeRequest(const AServiceName, AMethodName: string;
  AParamName: array of string; AParamValue: array of Variant;
  AParamType: array of TRODataType; AParamFlag: array of TRODLParamFlag);
var
  I: Integer;
begin
  Assert((Length(AParamName) = Length(AParamValue)) and
    (Length(AParamValue) = Length(AParamType)), '数组长度不一致');

  FService.ServiceName := AServiceName;
  with FDynamicRequest do
  begin
    MethodName := AMethodName;
    Params.Clear;
    for I := 0 to Length(AParamName) - 1 do
    begin
      with Params.Add do
      begin
        Name := AParamName[I];
        DataType := AParamType[I];
        Value := AParamValue[I];
        Flag := AParamFlag[I];
      end;
    end;
    Execute(nil);
  end;
end;

procedure TROConnection.SetMethodParam(AParamName: string; AParamValue: Variant;
  AParamType, AParamFlag: Integer);
begin
  with DynamicRequest.Params.Add do
  begin
    Name := AParamName;
    Value := AParamValue;
    Flag := TRODLParamFlag(AParamFlag);
    DataType := TRODataType(AParamType);
  end;
end;

procedure TROConnection.SetTargetIndex(const Value: Integer);
begin
  FTargetIndex := Value;
  if FTargetIndex >= FTargetList.Count then
    FTargetIndex := FTargetList.Count - 1;

  if (FTargetIndex < 0) and (FTargetList.Count > 0) then
    FTargetIndex := 0;

  if FTargetIndex >= 0 then
    TargetUrl := FTargetList.ValueFromIndex[FTargetIndex];
end;

procedure TROConnection.SetTargetUrl(ATargetUrl: string);
begin
  FreeAndNil(FMessage);
  FreeAndNil(FChannel);
  FTargetUrl := ATargetUrl;
  FMessage := TROMessage.MessageMatchingTargetUrl(ATargetUrl);
  FChannel := TROTransportChannel.ChannelMatchingTargetUrl(ATargetUrl);
  FService.Message := FMessage;
  FService.Channel := FChannel;
  if FMessage.InheritsFrom(TROJSONMessage) then
  begin
    with TROJSONMessage(FMessage) do
    begin
      IncludeTypeName := True;
      SessionIdAsId := True;
      SendExtendedException := True;
      WrapResult := True;
    end;
  end
  else if FMessage.InheritsFrom(TROXmlRpcMessage) then
  begin
    TROXmlRpcMessage(FMessage).SendSessionId := True;
  end;
end;

{ TCustomData }

function TCustomData.CanCancel: Boolean;
begin
  Result := Table.State in [dsEdit, dsInsert]
end;

procedure TCustomData.Cancel;
begin
  if CanCancel then
  begin
    Table.Cancel;
  end;
end;

function TCustomData.CanDelete: Boolean;
begin
  Result := not Table.ReadOnly and Table.Active and not Table.Eof and
    (Table.State in [dsBrowse]);
end;

{ 只根据Table的状态来判断是否可编辑、插入、删除 }

function TCustomData.CanEdit: Boolean;
begin
  Result := not Table.ReadOnly and Table.Active and not Table.Eof and
    (Table.State in [dsBrowse]);
end;

function TCustomData.CanInsert: Boolean;
begin
  Result := ((MasterData = nil) or (not MasterData.Eof)) and
    (not Table.ReadOnly) and Table.Active
  // and (Table.State in [dsBrowse]);
end;

function TCustomData.CanPrint: Boolean;
begin
  Result := Table.Active and not Table.Eof and (Table.State in [dsBrowse]) and
    (ReporterNames.Count > 0)
end;

function TCustomData.CanQuery: Boolean;
begin
  Result := ((MasterData = nil) or (not MasterData.Eof)) and
    not(Table.State in [dsEdit, dsInsert])
end;

function TCustomData.CanSave: Boolean;
begin
  Result := Table.State in [dsEdit, dsInsert];
end;

procedure TCustomData.Close;
begin
  DoAutoSave;
  Table.Close;
end;

constructor TCustomData.Create(AOwner: TComponent;
  ADataConnection: TDataConnection; const AServiceName, ALogicalName: string);
begin
  inherited Create(AOwner);
  FDataConnection := ADataConnection;
  FServiceName := AServiceName;
  FLogicalName := ALogicalName;
  FFilterFields := TStringList.Create;
  FFilterFields.Delimiter := ';';
  FReporterNames := TStringList.Create;
  FReporterNames.Delimiter := ';';
end;

procedure TCustomData.Delete;
begin
  Table.Delete;
end;

procedure TCustomData.DoDataAfterInsert(Sender: TDADataTable);
begin
  ClearAllFieldValues();
  if Assigned(FOnAfterInsert) then
    FOnAfterInsert(Self);
end;

procedure TCustomData.DoDataBeforeDelete(Sender: TDADataTable);
begin

end;

procedure TCustomData.DoDataBeforePost(Sender: TDADataTable);
begin
  EnumDataTableField(Sender, ValidatFieldValue, Null);

  if Assigned(FOnBeforePost) then
    FOnBeforePost(Self);
end;

procedure TCustomData.DoDataAfterPost(Sender: TDADataTable);
begin
  if Assigned(FOnAfterPost) then
    FOnAfterPost(Self);
end;

procedure TCustomData.Edit;
begin
  Table.Edit;
end;

function TCustomData.GetDefaultViewType: TDataViewType;
var
  Attr: string;
begin
  Attr := Trim(Table.CustomAttributes.Values['DefaultViewType']);
  if Attr = '' then
    Attr := 'dvGrid';
  Result := TDataViewType(GetEnumValue(TypeInfo(TDataViewType), Attr));
end;

function TCustomData.GetSource: TDADataSource;
begin
  if FSource = nil then
  begin
    FSource := TDADataSource.Create(Self);
    FSource.DataTable := Table;
    FSource.AutoEdit := False;
  end;
  Result := FSource;
end;

{ 首次访问时才创建DataTable }

function TCustomData.GetTable: TDAMemDataTable;
begin
  if FTable = nil then
  begin
    FTable := TDAMemDataTable.Create(Self);
    FTable.LogicalName := FLogicalName;
    FTable.BeforePost := DoDataBeforePost;
    FTable.BeforeDelete := DoDataBeforeDelete;
    FTable.AfterInsert := DoDataAfterInsert;
    FTable.AfterPost := DoDataAfterPost;
    FTable.AfterEdit := DoDataAfterEdit;
    // FTable.AfterScroll := DoDataAfterScroll;
    FTable.OnCalcFields := DoDataCalcFields;

    // 不设置数据服务名时，当做本地表使用(注意：错误名称情况相同)
    if (FServiceName = '') or (FDataConnection = nil) then
    begin
      Table.RemoteFetchEnabled := False;
    end
    else
    begin
      FTable.RemoteDataAdapter := FDataConnection.GetDataService(FServiceName)
        .DAAdapter;
      FTable.RemoteUpdatesOptions := [ruoOnPost];

      // 如果还没有获取Schema(第一次访问)
      if FTable.FieldCount = 0 then
      begin
        InitTableBeforeOpen(FTable);
        Check(FTable.RemoteDataAdapter = nil, sDataAdapterNotSet,
          [FLogicalName]);

        // 获取Schema
        FTable.RemoteDataAdapter.FillSchema([FTable]);
        {
          // 加载脚本
          FTable.RemoteDataAdapter.FillScripts([FTable]);
          if FTable.ScriptCode.Text <> '' then
          begin
          FScriptProvider := TDASpiderMonkeyScriptProvider.Create(nil);
          FTable.ScriptingProvider := FScriptProvider;
          end;
        }
        InitTableAfterSchema(FTable);
      end;
    end;
  end;
  Result := FTable;
end;

{
  在获取Schema后被调用，可进一步手动设置自定义属性。
  Schema中已包含参数的定义
}

procedure TCustomData.InitTableAfterSchema(ATable: TDAMemDataTable);
var
  I: Integer;
  SortFields: TStringDynArray;
  SortDirection: array of TDASortDirection;

  procedure SetSortDirection();
  var
    I: Integer;
  begin
    SetLength(SortDirection, Length(SortFields));
    for I := 0 to Length(SortFields) - 1 do
      SortDirection[I] := sdAscending;
  end;

begin
  FKeyFieldNames := '';
  FAccess := ATable.CustomAttributes.Values['Access'];
  IndexFieldNames := ATable.CustomAttributes.Values['IndexFieldNames'];
  // 实现自动排序需设置IndexFieldNames/AutoSortRecords/Sort，
  // 如在AfterPost事件中调用排序，有内存泄露???
  if IndexFieldNames <> '' then
  begin
    ATable.AutoSortRecords := True;
    SortFields := DelimitedTextToArray(IndexFieldNames);
    SetSortDirection();
    ATable.Sort(SortFields, SortDirection);
  end;

  FDialogImage := ATable.CustomAttributes.Values['DialogImage'];
  FReporterNames.DelimitedText := ATable.CustomAttributes.Values
    ['ReporterNames'];
  FReporterTypeField := ATable.CustomAttributes.Values['ReporterTypeField'];
  FReporterGroupField := ATable.CustomAttributes.Values['ReporterGroupField'];

  FFilterFromServer := StrToBoolDef(ATable.CustomAttributes.Values
    ['FilterFromServer'], False);
  FFilterFields.DelimitedText := ATable.CustomAttributes.Values['FilterFields'];
  FFilterMinLen := StrToIntDef(ATable.CustomAttributes.Values
    ['FilterMinLen'], 0);
  FFilterCompareOperator := ATable.CustomAttributes.Values
    ['FilterCompareOperator'];
  if FFilterCompareOperator = '' then
    FFilterCompareOperator := 'like';

  // 如果没有定义过滤字段，则自动添加所有文本字段
  if FFilterFields.Count = 0 then
    for I := 0 to ATable.Fields.Count - 1 do
    begin
      if ATable.Fields[I].DataType in [datString, datWideString] then
        FFilterFields.Add(ATable.Fields[I].Name);
    end;

  EnumDataTableField(ATable, InitTableField, Null);
  // 加入自定义属性中，方便其他对象获取. 如果KeyFieldNames已经存在，将被忽略，不冲突
  ATable.CustomAttributes.Add('KeyFieldNames=' + KeyFieldNames);
  ATable.MaxRecords := StrToIntDef(ATable.CustomAttributes.Values
    ['MaxRecords'], -1);

end;

{ 在获取Schema前被调用，可设置其他如：IndexFieldNames等属性 }

procedure TCustomData.InitTableBeforeOpen(ATable: TDAMemDataTable);
begin

end;

{ 获取字段的自定义属性 }

procedure TCustomData.InitTableField(AField: TDAField; AParam: Variant);
var
  AttrValue: string;
  LookupField: TDAField;
  LookupData: TCustomData;
  LookupFields: TStrings;
  I: Integer;
begin
  if AField.InPrimaryKey then
  begin
    if FKeyFieldNames = '' then
      FKeyFieldNames := AField.Name
    else
      FKeyFieldNames := FKeyFieldNames + ';' + AField.Name
  end;

  AttrValue := Trim(AField.CustomAttributes.Values['Lookup']);
  if StrToBoolDef(AttrValue, False) then
  begin
    // 添加Lookup字段
    // 不能将Schema中的字段设置为Lookup，否则将导致查询时字段个数不匹配
    // Lookup字段在TableView显示时，自动生成下拉列表
    // 将来可能在Schema中直接定义Lookup字段
    LookupFields := TStringList.Create;
    try
      LookupFields.Delimiter := ';';
      LookupFields.DelimitedText :=
        Trim(AField.CustomAttributes.Values['LookupResultFields']);

      // 根据配置创建多个Lookup字段
      for I := 0 to LookupFields.Count - 1 do
      begin
        LookupField := FTable.Fields.Add;
        LookupField.Index := AField.Index + 1 + I;
        LookupField.Lookup := True;
        LookupField.LookupCache := True;
        LookupField.KeyFields :=
          Trim(AField.CustomAttributes.Values['KeyFields']);
        // 没有指定时，表明是本字段的Lookup
        if LookupField.KeyFields = '' then
          LookupField.KeyFields := AField.Name;
        LookupField.LookupResultField := LookupFields.Strings[I];

        LookupData := DataContainer
          [AField.CustomAttributes.Values['LookupSource']];
        with LookupData.Source.DataTable.FieldByName
          (LookupField.LookupResultField) do
        begin
          LookupField.LookupSource := LookupData.Source;
          LookupField.DisplayLabel := DisplayLabel;
          LookupField.Name := AField.Name + '_' + Name;
          LookupField.LookupKeyFields := LookupData.KeyFieldNames;
          LookupField.DataType := DataType;
          LookupField.Size := Size;
          LookupField.Alignment := Alignment;
          LookupField.DecimalPrecision := DecimalPrecision;
          LookupField.DecimalScale := DecimalScale;
        end;
      end;
    finally
      LookupFields.Free;
    end;
  end;
end;

procedure TCustomData.Insert;
begin
  // Table.Insert;
  Table.Append;
end;

{
  如果没有打开数据，则打开它！
  注意：在没有登录之前不能Open
  如果先前使用了DynamicWhere, 它会继续起作用
}

procedure TCustomData.Open;
begin
  DoInternalOpen;
end;

{ 刷新 }

procedure TCustomData.Refresh;
begin
  Close;
  Open;
end;

{ 设置DataAdapter后重置DataTable }

procedure TCustomData.Save;
begin
  if CanSave then
    Table.Post;
end;

{ 设置LogicalName后重置DataTable }

procedure TCustomData.SetLogicalName(ALogicalName: string);
begin
  FLogicalName := ALogicalName;
  if FTable <> nil then
  begin
    FTable.Close;
    FTable.Fields.Clear;
  end;
end;

function TCustomData.GetDescription: string;
begin
  Result := Table.CustomAttributes.Values['Description'];
  if Result = '' then
    Result := FLogicalName;
end;

function TCustomData.GetCategory: string;
begin
  Result := Table.CustomAttributes.Values['Category'];
  if Result = '' then
    Result := '未分类';
end;

{ 操作该表所需的权限 }
procedure TCustomData.SetFieldDefaultValue(AField: TDAField; AParam: Variant);
begin
  if (FMasterData <> nil) and (FForeignField = AField.Name) then
  begin
    // 自动为绑定到主表的外键字段赋值
    AField.Value := FMasterData.GetKeyValue;
  end
  else if (AField.DefaultValue <> '') then
    AField.Value := AField.DefaultValue
  else if AField.DataType in [datFloat, datCurrency, datInteger, datLargeInt,
    datBoolean, datByte, datShortInt, datWord, datSmallInt, datCardinal,
    datLargeUInt, datDecimal, datSingleFloat] then
    AField.Value := 0
  else if AField.DataType in [datString, datWideString] then
    AField.Value := ''
  else if (AField.DataType = datDateTime) and AField.Required then
  begin
    if StrToBoolDef(AField.CustomAttributes.Values['Properties.SaveTime'], True)
    then
      AField.Value := Now()
    else
      AField.Value := Date();
  end
  else if AField.DataType = datGuid then
    AField.Value := GUIDToString(NewGuid);
end;

function TCustomData.GetKeyValue: Variant;
begin
  // 限制：不能是多个字段
  if not Table.Eof then
    Result := Table.FieldByName(KeyFieldNames).AsVariant
  else
    Result := Null;
end;

procedure TCustomData.SetIndexFieldNames(AValue: string);
begin
  Table.IndexFieldNames := AValue;
end;

function TCustomData.GetIndexFieldNames: string;
begin
  Result := Table.IndexFieldNames;
end;

procedure TCustomData.First;
begin
  FTable.First;
end;

procedure TCustomData.Last;
begin
  FTable.Last;
end;

procedure TCustomData.Next;
begin
  FTable.Next;
end;

procedure TCustomData.Prior;
begin
  FTable.Prior;
end;

{
  工具方法。作为本地数据时使用，方便创建字段。
  只有datString,datWideString字段需要指定数据大小，其他为0
}

procedure TCustomData.CreateLocalTableFields(const ATableAttributes: string;
  const AFieldNames: array of string; const AFieldTypes: array of TDADataType;
  const AFieldSizes: array of Integer; const AFieldAttributes: array of string);
var
  I: Integer;
begin
  Check((Length(AFieldNames) <> Length(AFieldTypes)) or
    (Length(AFieldTypes) <> Length(AFieldSizes)) or
    (Length(AFieldSizes) <> Length(AFieldAttributes)),
    'TCustomData.CreateClientFileds参数大小不一致');

  Table.ClearFields;
  Table.CustomAttributes.Delimiter := ';';
  Table.CustomAttributes.DelimitedText := ATableAttributes;

  for I := 0 to Length(AFieldNames) - 1 do
  begin
    with Table.Fields.Add do
    begin
      Name := AFieldNames[I];
      DataType := AFieldTypes[I];
      if DataType in [datString, datWideString] then
        Size := AFieldSizes[I];
      CustomAttributes.Delimiter := ';';
      CustomAttributes.DelimitedText := AFieldAttributes[I];
    end;
  end;
end;

procedure TCustomData.DoDataCalcFields(Sender: TDADataTable);
begin
  if Assigned(FOnCalcFields) then
    FOnCalcFields(Self);
end;

procedure TCustomData.ValidatFieldValue(AField: TDAField; AParam: Variant);
begin
  // todo: 校验字段值
  // if AField.Required and (AField.DataType in [datString, datWideString]) then
  // Check(Trim(AField.AsString) = '', '请输入%s', [AField.DisplayLabel]);
end;

{ 按字段的值查询 }

procedure TCustomData.OpenByFieldValue(const AFieldName: string;
  AFieldValue: Variant; AOperator: TDABinaryOperator = dboEqual);
begin
  Close();
  with Table do
  begin
    // Where.Clear;
    DynamicWhere.Clear;
    DynamicWhere.Expression := DynamicWhere.NewBinaryExpression
      (DynamicWhere.NewField(LogicalName, AFieldName),
      DynamicWhere.NewConstant(AFieldValue, FieldByName(AFieldName).DataType),
      AOperator);
  end;
  DoInternalOpen;
end;

{ 按时间段查询 }

procedure TCustomData.OpenByPeriod(const ADateFieldName: string;
  ABeginDate, AEndDate: TDateTime);
begin
  // 只查询用于统计的费用，新发票、申请退费发票不用于统计
  OpenByList([ADateFieldName, ADateFieldName], [ABeginDate, AEndDate],
    [dboGreaterOrEqual, dboLessOrEqual], [dboAnd]);
end;

{ 按区间值查询 }

procedure TCustomData.OpenByBetween(const AFieldName: string;
  AStartValue, AEndValue: Variant);
begin
  OpenByList([AFieldName, AFieldName], [AStartValue, AEndValue],
    [dboGreaterOrEqual, dboLessOrEqual], [dboAnd]);
end;

{ 按多个字段的值进行查询 }

procedure TCustomData.OpenByList(const AFieldNames: array of string;
  const AFieldValues: array of Variant;
  const AOperators: array of TDABinaryOperator;
  const AListOperator: array of TDABinaryOperator);
begin
  Close;
  BuildDynamicWhere(AFieldNames, AFieldValues, AOperators, AListOperator);
  DoInternalOpen;
end;

procedure TCustomData.DoInternalOpen;
begin
  with Table do
    if not Active then
    begin
      DisableControls;
      try
        Open;
      finally
        EnableControls;
      end;
    end;
end;

procedure TCustomData.BuildDynamicWhere(const AFieldNames: array of string;
  const AFieldValues: array of Variant;
  const AOperators: array of TDABinaryOperator;
  const AListOperator: array of TDABinaryOperator);
var
  I: Integer;
  NewExpression, Expression: TDAWhereExpression;
  lDynamicWhere: TDAWhereBuilder;
begin
  Check((Length(AFieldNames) <> Length(AFieldValues)) or
    (Length(AFieldValues) <> Length(AOperators)), '查询字段列表、值列表、比较符列表的个数不一致');

  Check((Length(AFieldNames) - 1 <> Length(AListOperator)),
    '条件列表个数不等于字段列表个数-1');

  Close();
  lDynamicWhere := Table.DynamicWhere;
  lDynamicWhere.Clear;
  for I := 0 to Length(AFieldNames) - 1 do
  begin
    NewExpression := lDynamicWhere.NewBinaryExpression
      (lDynamicWhere.NewField('', AFieldNames[I]),
      lDynamicWhere.NewConstant(AFieldValues[I], FieldByName(AFieldNames[I])
      .DataType), AOperators[I]);
    if I = 0 then
      Expression := NewExpression
    else
      Expression := lDynamicWhere.NewBinaryExpression(Expression, NewExpression,
        AListOperator[I - 1]);
  end;
  lDynamicWhere.Expression := Expression;
end;

procedure TCustomData.BindMaster(AMaster: TCustomData;
  const AForeignField: string);
begin
  // 只能绑定一个主表。解除绑定传nil。
  if FMasterData <> nil then
  begin
    FMasterData.ScrollObservers.Remove(Self);
    FMasterData.RemoveFreeNotification(Self);
  end;
  FMasterData := AMaster;
  FForeignField := AForeignField;
  if FMasterData <> nil then
  begin
    FMasterData.ScrollObservers.Add(Self);
    FMasterData.FreeNotification(Self);
    FMasterData.TriggerScroll;
  end;
end;

procedure TCustomData.DoMasterScroll(Sender: TDADataTable);
begin
  Close; // Close可以自动保存
  FMasterKey := Null;
  if (FMasterData.Table.State in [dsBrowse]) and not FMasterData.Table.Eof then
  begin
    FMasterKey := FMasterData.GetKeyValue;
  end;
  QueryAfterMasterScroll();
end;

procedure TCustomData.TriggerScroll;
var
  I: Integer;
begin
  if Assigned(FOnScroll) then
  begin
    FOnScroll(Self);
    // AppCore.Logger.Write(LogicalName + ' scrolled. ' +
    // KeyFieldNames + ' = ' + VarToStr(KeyValue));
  end;
  if FScrollObservers <> nil then
    for I := 0 to FScrollObservers.Count - 1 do
      TCustomData(FScrollObservers[I]).DoMasterScroll(Self.Table);
end;

procedure TCustomData.DoDataAfterScroll(Sender: TDADataTable);
begin
  TriggerScroll;
end;

procedure TCustomData.DisableScroll;
begin
  Table.AfterScroll := nil;
end;

{ EnableScroll应该在没有绑定到视图时使用 }

procedure TCustomData.EnableScroll;
begin
  Table.AfterScroll := DoDataAfterScroll;
  TriggerScroll;
end;

procedure TCustomData.OpenByKeyValue(AValue: Variant);
begin
  OpenByFieldValue(KeyFieldNames, AValue);
end;

procedure TCustomData.OpenByWhereText(const AText: string);
begin
  Close();
  with Table do
  begin
    DynamicWhere.Clear;
    PlainWhereClause := AText;
  end;
  DoInternalOpen;
end;

procedure TCustomData.OpenByParam(const AParamNames: array of string;
  const AParamValues: array of Variant);
var
  I: Integer;
begin
  Check((Length(AParamNames) <> Length(AParamValues)), '查询参数名称和值列表个数不一致');

  with Table do
  begin
    Close();
    for I := 0 to Length(AParamNames) - 1 do
    begin
      ParamByName(AParamNames[I]).Value := AParamValues[I];
    end;
  end;
  DoInternalOpen;
end;

function TCustomData.Eof: Boolean;
begin
  Result := Table.Eof;
end;

procedure TCustomData.InitData;
begin
  GetTable();
end;

procedure TCustomData.DoLocalFilter(const AFilterText: string);
var
  I: Integer;
  S, T, Operand: string;
begin
  { 本地过滤数据 }
  if (FFilterMinLen > 0) and (Length(AFilterText) < FFilterMinLen) then
    Exit;

  DoDataBeforeFilter;

  with Table do
  begin
    Filtered := False;
    if Trim(AFilterText) = '' then
      Exit;
    S := '';
    for I := 0 to FilterFields.Count - 1 do
    begin
      if FFilterCompareOperator = 'like' then
        Operand := QuotedStr('%' + AFilterText + '%')
      else
        Operand := QuotedStr(AFilterText);

      T := FilterFields[I] + ' ' + FFilterCompareOperator + ' ' + Operand;

      if S <> '' then
        S := S + ' or ' + T
      else
        S := T;
    end;
    if FFixFilterField <> '' then
    begin
      S := S + ' and ' + FFixFilterField + '=' + FFixFilterText;
      // todo: 只考虑'='?
    end;
    Filter := S;
    Filtered := True;
  end;
end;

{
  通过服务器过滤数据
  1 默认把AFilterText传给参数FilterText
  2 或者根据字段列表动态生成DynamicWhere
  3 子类可覆盖默认实现
}

procedure TCustomData.DoServerFilter(const AFilterText: string);
var
  WhereText: string;

  function GetWhereText(): string;
  var
    I: Integer;
    Temp, Operand: string;
  begin
    Result := '';
    for I := 0 to FilterFields.Count - 1 do
    begin
      if FFilterCompareOperator = 'like' then
        Operand := QuotedStr('%' + AFilterText + '%')
      else
        Operand := QuotedStr(AFilterText);

      Temp := FilterFields[I] + ' ' + FFilterCompareOperator + ' ' + Operand;
      if Result = '' then
        Result := Temp
      else
        Result := Result + ' or ' + Temp;
    end;
  end;

begin
  if (FFilterMinLen > 0) and (Length(AFilterText) < FFilterMinLen) then
    Exit;
  DoDataBeforeFilter;
  if ParamCount > 0 then
  begin
    ParamValue['FilterText'] := AFilterText;
    Refresh;
  end
  else
  begin
    // todo: 改成dynamicwhere
    WhereText := GetWhereText;
    if FFixFilterField <> '' then
    begin
      WhereText := GetFixFilterWhereText + ' and (' + WhereText + ')';
    end;
    OpenByWhereText(WhereText);
  end;
end;

destructor TCustomData.Destroy;
begin
  DoAutoSave;
  // 解除主从绑定
  BindMaster(nil, '');
  FFilterFields.Free;
  FScrollObservers.Free;
  FReporterNames.Free;
  inherited;
end;

procedure TCustomData.SetFixFilter(const AFieldName, AFilterText: string;
  AFilterOperator: TDABinaryOperator);
begin
  FFixFilterField := AFieldName;
  FFixFilterText := AFilterText;
  FFixFilterOperator := AFilterOperator;
end;

{ 打开批更新模式 }

procedure TCustomData.EnableBatchUpdate;
begin
  Table.RemoteUpdatesOptions := [];
end;

procedure TCustomData.DisableBatchUpdate;
begin
  Table.RemoteUpdatesOptions := [ruoOnPost];
end;

function TCustomData.GetFixFilterWhereText: string;
begin
  if FFixFilterField = '' then
    Result := ''
  else
    Result := FFixFilterField + sDABinaryOperator[FFixFilterOperator] +
      QuotedStr(FFixFilterText);
end;

procedure TCustomData.DisableControls;
begin
  Table.DisableControls;
end;

procedure TCustomData.EnableControls;
begin
  Table.EnableControls;
end;

function TCustomData.GetBookmark: TBookmark;
begin
  Result := Table.GetBookmark;
end;

procedure TCustomData.GotoBookmark(Bookmark: TBookmark);
begin
  Table.GotoBookmark(Bookmark);
end;

function TCustomData.FieldByName(AName: string): TDAField;
begin
  Result := Table.FieldByName(AName);
end;

function TCustomData.RecordCount: Integer;
begin
  Result := Table.RecordCount;
end;

function TCustomData.RecID: Integer;
begin
  Result := Table.RecNo - 1;
end;

function TCustomData.GetAsString(const FieldName: string): string;
begin
  Result := Table.FieldByName(FieldName).AsString;
end;

procedure TCustomData.SetAsString(const FieldName: string; const Value: string);
begin
  Table.FieldByName(FieldName).AsString := Value;
end;

function TCustomData.GetAsVariant(const FieldName: string): Variant;
begin
  Result := Table.FieldByName(FieldName).AsVariant;
end;

procedure TCustomData.SetAsVariant(const FieldName: string;
  const Value: Variant);
begin
  Table.FieldByName(FieldName).AsVariant := Value;
end;

function TCustomData.GetAsCurrency(const FieldName: string): Currency;
begin
  Result := Table.FieldByName(FieldName).AsCurrency;
end;

procedure TCustomData.SetAsCurrency(const FieldName: string;
  const Value: Currency);
begin
  Table.FieldByName(FieldName).AsCurrency := Value;
end;

function TCustomData.GetAsBoolean(const FieldName: string): Boolean;
begin
  Result := Table.FieldByName(FieldName).AsBoolean;
end;

procedure TCustomData.SetAsBoolean(const FieldName: string;
  const Value: Boolean);
begin
  Table.FieldByName(FieldName).AsBoolean := Value;
end;

function TCustomData.GetAsInteger(const FieldName: string): Integer;
begin
  Result := Table.FieldByName(FieldName).AsInteger;
end;

procedure TCustomData.SetAsInteger(const FieldName: string;
  const Value: Integer);
begin
  Table.FieldByName(FieldName).AsInteger := Value
end;

function TCustomData.GetCustomAttributes: TStrings;
begin
  Result := Table.CustomAttributes;
end;

function TCustomData.GetFieldCustomAttributes(const FieldName: string)
  : TStrings;
begin
  Result := Table.FieldByName(FieldName).CustomAttributes;
end;

function TCustomData.GetAsDouble(const FieldName: string): Double;
begin
  Result := Table.FieldByName(FieldName).AsFloat;
end;

procedure TCustomData.SetAsDouble(const FieldName: string; const Value: Double);
begin
  Table.FieldByName(FieldName).AsFloat := Value;
end;

function TCustomData.GetAsDecimal(const FieldName: string): TBCD;
begin
  Result := Table.FieldByName(FieldName).AsDecimal;
end;

procedure TCustomData.SetAsDecimal(const FieldName: string; const Value: TBCD);
begin
  Table.FieldByName(FieldName).AsDecimal := Value;
end;

function TCustomData.GetAsDateTime(const FieldName: string): TDateTime;
begin
  Result := Table.FieldByName(FieldName).AsDateTime;
end;

procedure TCustomData.SetAsDateTime(const FieldName: string;
  const Value: TDateTime);
begin
  Table.FieldByName(FieldName).AsDateTime := Value;
end;

procedure TCustomData.ApplyUpdates;
begin
  Table.ApplyUpdates();
end;

function TCustomData.GetOldValue(const FieldName: string): Variant;
begin
  Result := Table.FieldByName(FieldName).OldValue;
end;

function TCustomData.GetScrollObservers: TObjectList;
begin
  if FScrollObservers = nil then
    FScrollObservers := TObjectList.Create(False);
  Result := FScrollObservers;
end;

procedure TCustomData.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  if AComponent = FMasterData then
  begin
    FMasterData := nil;
  end;
  inherited;
end;

function TCustomData.GetLogChanges: Boolean;
begin
  Result := Table.LogChanges;
end;

procedure TCustomData.SetLogChanges(const Value: Boolean);
begin
  Table.LogChanges := Value;
end;

function TCustomData.GetFieldLogChanges(const FieldName: string): Boolean;
begin
  Result := Table.FieldByName(FieldName).LogChanges;
end;

procedure TCustomData.SetFieldLogChanges(const FieldName: string;
  const Value: Boolean);
begin
  Table.FieldByName(FieldName).LogChanges := Value;
end;

function TCustomData.Locate(const KeyFields: string; const KeyValues: Variant;
  Options: TLocateOptions): Boolean;
begin
  Result := Table.Locate(KeyFields, KeyValues, Options);
end;

function TCustomData.GetRecordText(const AFieldNames: string;
  ASeperator: string): string;
var
  FieldList: TStrings;
  I: Integer;
  OneFieldText: string;
begin
  FieldList := TStringList.Create;
  try
    FieldList.Delimiter := ';';
    FieldList.DelimitedText := AFieldNames;
    for I := 0 to FieldList.Count - 1 do
    begin
      OneFieldText := FieldDisplayLabel[FieldList[I]] + ':' +
        AsString[FieldList[I]];
      if I = 0 then
        Result := OneFieldText
      else
        Result := Result + ASeperator + OneFieldText;
    end;
  finally
    FieldList.Free;
  end;
end;

function TCustomData.GetFieldDisplayLabel(const FieldName: string): string;
begin
  Result := Table.FieldByName(FieldName).DisplayLabel;
end;

procedure TCustomData.SetFieldDisplayText(const FieldName, Value: string);
begin
  Table.FieldByName(FieldName).DisplayLabel := Value;
end;

function TCustomData.GetParamValue(const ParamName: string): Variant;
begin
  Result := Table.Params.ParamByName(ParamName).Value;
end;

procedure TCustomData.SetParamValue(const ParamName: string;
  const Value: Variant);
begin
  Table.Params.ParamByName(ParamName).Value := Value;
end;

procedure TCustomData.QueryAfterMasterScroll;
begin
  // 子类可根据需要更复杂的查询
  OpenByFieldValue(FForeignField, FMasterKey);
end;

procedure TCustomData.FreeBookmark(Bookmark: TBookmark);
begin
  Table.FreeBookmark(Bookmark);
end;

procedure TCustomData.EditWithNoLogChanges(FieldNames: array of string;
  FieldValues: array of Variant);
var
  OldLogChanges: Boolean;
  I: Integer;
begin
  Assert(Length(FieldNames) = Length(FieldValues));

  OldLogChanges := LogChanges;
  LogChanges := False;
  try
    Edit;
    for I := 0 to Length(FieldNames) - 1 do
      AsVariant[FieldNames[I]] := FieldValues[I];
    Save;
  finally
    LogChanges := OldLogChanges;
  end;
end;

function TCustomData.GetMaxRecords: Integer;
begin
  Result := Table.MaxRecords;
end;

procedure TCustomData.SetMaxRecords(const Value: Integer);
begin
  Table.MaxRecords := Value;
end;

procedure TCustomData.AssignFieldValue(const AFieldName: string;
  ASource: TCustomData; var ADone: Boolean);
begin
  // Wrapper在输入数据时调用
  // 子类可以根据FieldName和Source来自定义赋值
end;

procedure TCustomData.DoAutoSave;
begin
  if FAutoSave then
    try
      Save;
    except
    end;
end;

procedure TCustomData.ClearAllFieldValues;
begin
  // 清空所有字段的值，恢复到默认值
  if not(Table.State in [dsEdit, dsInsert]) then
    Table.Edit;
  EnumDataTableField(Table, SetFieldDefaultValue, Null);
end;

function TCustomData.GetParamCount: Integer;
begin
  Result := Table.Params.Count;
end;

procedure TCustomData.SetFilterText(const Value: string);
begin
  Table.Filtered := False;
  if Value = '' then
    Exit;
  Table.Filter := Value;
  Table.Filtered := True;
end;

function TCustomData.GetFilterText: string;
begin
  Result := Table.Filter;
end;

procedure TCustomData.DoDataAfterEdit(Sender: TDADataTable);
begin

end;

procedure TCustomData.DoDataBeforeFilter;
begin
  // 可用于设置查询参数
  if Assigned(FOnBeforeFilter) then
    FOnBeforePost(Self);
end;

{ TDataContainer }

constructor TDataContainer.Create;
begin
  FDataList := TStringList.Create();
  // FDataList.Sorted := True;
end;

function TDataContainer.CreateData(AOwner: TComponent;
  const ALogicalName: string): TCustomData;
begin
  // 创建数据，由外部负责释放
  Result := GetDataDefinition(ALogicalName).CreateData(AOwner);
end;

destructor TDataContainer.Destroy;
var
  I: Integer;
begin
  for I := 0 to FDataList.Count - 1 do
    FDataList.Objects[I].Free;
  FreeAndNil(FDataList);
  inherited;
end;

function TDataContainer.GetCount: Integer;
begin
  Result := FDataList.Count;
end;

function TDataContainer.GetDataDefinition(const ALogicalName: string)
  : TDataDefinition;
var
  Index: Integer;
begin
  Index := FDataList.IndexOf(ALogicalName);
  Check(Index < 0, sCommonDataContainerNotExists, [ALogicalName]);
  Result := TDataDefinition(FDataList.Objects[Index]);
end;

function TDataContainer.GetDataDefinition2(Index: Integer): TDataDefinition;
begin
  Check((Index < 0) and (index >= Count), sCommonDataIndexOutOfRange);
  Result := TDataDefinition(FDataList.Objects[Index]);
end;

function TDataContainer.GetItemByLogicalName(const ALogicalName: string)
  : TCustomData;
begin
  Result := GetDataDefinition(ALogicalName).CustomData;
  // Result.InitData(); // 初始化Schema
end;

{ 主要在Lookup字段设置。此方法自动打开数据 }

function TDataContainer.GetSource(const ALogicalName: string): TDADataSource;
begin
  with Items[ALogicalName] do
  begin
    Open;
    Result := Source;
  end;
end;

procedure TDataContainer.RegisterData(ADataConnection: TDataConnection;
  const AServiceName, ALogicalName: string; AFlag: Integer;
  ACreateParam: string);
begin
  RegisterData(ADataConnection, AServiceName, ALogicalName, TCustomData, AFlag,
    ACreateParam);
end;

procedure TDataContainer.RegisterData(ADataConnection: TDataConnection;
  const AServiceName, ALogicalName: string; ADataClass: TCustomDataClass;
  AFlag: Integer; ACreateParam: string);
var
  DataItem: TDataDefinition;
begin
  Check(FDataList.IndexOf(ALogicalName) > -1, sDataDefinitionDuplicate,
    [ALogicalName]);
  DataItem := TDataDefinition.Create(ADataConnection, AServiceName,
    ALogicalName, ADataClass, AFlag, ACreateParam);
  FDataList.AddObject(ALogicalName, DataItem);
end;

procedure TDataContainer.RegisterData(ADataConnection: TDataConnection;
  const AServiceName, ALogicalName: string; ADataClassName: String;
  AFlag: Integer; ACreateParam: string);
begin
  RegisterData(ADataConnection, AServiceName, ALogicalName,
    TCustomDataClass(GetClass(ADataClassName)), AFlag, ACreateParam);
end;

{ TCustomDataService }

procedure TCustomDataService.BeginCommand(ACommandName: string);
begin
  with DACommand.ExecuteCall do
  begin
    ParamByName(OutgoingCommandNameParameter).AsString := ACommandName;
    with ParamByName(OutgoingParametersParameter) do
    begin
      AsComplexType := DataParameterArray.Create;
      OwnsComplexType := True;
    end;
  end;
end;

procedure TCustomDataService.CorrectService;
begin
  // TDataConnection重新设置TargetUrl时会重建Channel/Message，这时需同步本服务的属性
  if FDataService.Channel <> FDataConnection.Channel then
    FDataService.Channel := FDataConnection.Channel;
  if FDataService.Message <> FDataConnection.ROMessage then
    FDataService.Message := FDataConnection.ROMessage;
end;

constructor TCustomDataService.Create(const AServiceName: string;
  ADataConnection: TDataConnection);
begin
  inherited Create(nil);
  FDataConnection := ADataConnection;

  FDataService := TRORemoteService.Create(Self);
  with FDataService do
  begin
    ServiceName := AServiceName;
    Channel := ADataConnection.Channel;
    Message := ADataConnection.ROMessage;
  end;

  FDataStreamer := FDataConnection.NewDAStreamer(Self);
  FDataAdapter := TDARemoteDataAdapter.Create(Self);
  with FDataAdapter do
  begin
    DataStreamer := FDataStreamer;
    Assign(FDataConnection.DataAdapter);
    RemoteService := FDataService;
    CacheSchema := True;
  end;
end;

procedure TCustomDataService.DoAfterExecuteCommandEx(Sender: TRODynamicRequest);
var
  lParam: TRORequestParam;
begin
  lParam := Sender.Params.FindParam
    (DACommand.ExecuteCall.IncomingParametersParameter);
  if Assigned(lParam) then
    lParam.OwnsComplexType := True; // 防止内存泄露
end;

procedure TCustomDataService.DoBeforeExecuteCommandEx
  (Sender: TRODynamicRequest);
var
  lParam: TRORequestParam;
begin
  lParam := Sender.Params.FindParam
    (DACommand.ExecuteCall.IncomingParametersParameter);
  if Assigned(lParam) then
    lParam.OwnsComplexType := True; // 防止内存泄露
end;

procedure TCustomDataService.EndCommand;
var
  Cmd: TDASQLCommand;
begin
  with DAAdapter.Schema, DACommand.ExecuteCall do
  begin
    Cmd := Commands.SQLCommandByName(ParamByName(OutgoingCommandNameParameter)
      .AsString);
    Check(Cmd = nil, '当前命令无效');
    Execute();
  end;
end;

function TCustomDataService.GetCommandOutputParam(AParamName: string): Variant;
var
  I: Integer;
begin
  with DataParameterArray(DACommand.ExecuteCall.ParamByName('aOutputParameters')
    .AsComplexType) do
    for I := 0 to Count - 1 do
      if SameText(AParamName, Items[I].Name) then
      begin
        Result := Items[I].Value;
        Exit;
      end;
end;

function TCustomDataService.GetDACommand: TDARemoteCommand;
begin
  if FDACommand = nil then
  begin
    FDACommand := TDARemoteCommand.Create(Self);
    FDACommand.RemoteService := FDataService;
    // FDACommand.ExecuteCall.RefreshParams(); 不适应动态创建的Service
    with FDACommand.ExecuteCall do
    begin
      Params.Clear();
      IncomingAffectedRowsParameter := Params.Add('Result', rtInteger,
        fResult).Name;
      OutgoingCommandNameParameter := Params.Add('aCommandName', rtUtf8String,
        fIn).Name;
      Params.Add('aInputParameters', rtUserDefined, fIn, 'DataParameterArray');
      Params.Add('aOutputParameters', rtUserDefined, fOut,
        'DataParameterArray');
      OutgoingParametersParameter := 'aInputParameters';
      IncomingParametersParameter := 'aOutputParameters';
      OnBeforeExecute := DoBeforeExecuteCommandEx;
      OnAfterExecute := DoAfterExecuteCommandEx;
      MethodName := 'ExecuteCommandEx';
    end;
  end;
  CorrectService;
  Result := FDACommand;
end;

function TCustomDataService.GetDataAdapter: TDARemoteDataAdapter;
begin
  CorrectService;
  Result := FDataAdapter;
end;

function TCustomDataService.GetDataService: TRORemoteService;
begin
  CorrectService;
  Result := FDataService;
end;

procedure TCustomDataService.SetCommandParam(AParamName: string;
  AParamValue: Variant);
begin
  with DACommand.ExecuteCall do
  begin
    with DataParameterArray(ParamByName(OutgoingParametersParameter)
      .AsComplexType).Add do
    begin
      Name := AParamName;
      Value := AParamValue;
    end;
  end;
end;

{ TDataConnection }

constructor TDataConnection.Create(AOwner: TComponent; ATargetUrl: string;
  ADAStreamer: string);
begin
  inherited Create(AOwner, ATargetUrl);
  FDataServiceList := TObjectList.Create(True);
  FDAStreamer := ADAStreamer;
  FDataStreamer := NewDAStreamer(Self);
  FDataAdapter := TDARemoteDataAdapter.Create(Self);
  with FDataAdapter do
  begin
    RemoteService := FService;
    DataStreamer := FDataStreamer;
{$IFDEF EnableDAModelLogger}
    AfterGetDataCall := DataAdapterAfterGetDataCall;
    BeforeGetDataCall := DataAdapterBeforeGetDataCall;
    GetSchemaCall.OnBeforeExecute := DataAdapterGetSchemaCallBeforeExecute;
    UpdateDataCall.OnAfterExecute := DataAdapterUpdateDataCallAfterExecute;
    UpdateDataCall.OnBeforeExecute := DataAdapterUpdateDataCallBeforeExecute;
    UpdateDataCall.OnExecuteError := DataAdapterUpdateDataCallExecuteError;
{$ENDIF}
  end;
end;

destructor TDataConnection.Destroy;
begin
  FreeAndNil(FDataServiceList);
  inherited;
end;

function TDataConnection.GetDataService(const AServiceName: string)
  : TCustomDataService;
var
  Index: Integer;
begin
  Result := nil;
  if (AServiceName = '') then
    Exit;

  for Index := 0 to FDataServiceList.Count - 1 do
  begin
    if SameText(TCustomDataService(FDataServiceList[Index])
      .DAService.ServiceName, AServiceName) then
    begin
      Result := TCustomDataService(FDataServiceList[Index]);
      Break;
    end;
  end;
  if Result = nil then
  begin
    // 自动注册数据服务
    Result := RegisterDataService(AServiceName);
  end;
end;

function TDataConnection.NewDAStreamer(AOwner: TComponent): TDADataStreamer;
begin
  if SameText(FDAStreamer, 'JSON') then
    Result := TDAJSONDataStreamer.Create(AOwner)
  else
    Result := TDABin2DataStreamer.Create(AOwner);
end;

function TDataConnection.RegisterDataService(const AServiceName: string;
  AServiceClass: TCustomDataServiceClass): TCustomDataService;
begin
  Assert(AServiceClass <> nil);
  // if GetDataService(AServiceName) <> nil then
  // raise Exception.CreateFmt('不能重复注册数据服务：%s', [AServiceName]);

  Result := AServiceClass.Create(AServiceName, Self);
  FDataServiceList.Add(Result);
end;

function TDataConnection.RegisterDataService(const AServiceName: string)
  : TCustomDataService;
begin
  Result := RegisterDataService(AServiceName, TCustomDataService);
end;

{ TDataDefinition }

constructor TDataDefinition.Create(ADataConnection: TDataConnection;
  AServiceName, ALogicalName: string; ADataClass: TCustomDataClass;
  AFlag: Integer; ACreateParam: string);
begin
  FDataConnection := ADataConnection;
  FServiceName := AServiceName;
  FLogicalName := ALogicalName;
  FDataClass := ADataClass;
  if FDataClass = nil then
    FDataClass := TCustomData;
  FFlag := AFlag;
  FCreateParam := ACreateParam;
end;

function TDataDefinition.CreateData(AOwner: TComponent): TCustomData;
begin
  Result := FDataClass.Create(AOwner, FDataConnection, FServiceName,
    FLogicalName);
  Result.CreateParam := FCreateParam;
end;

destructor TDataDefinition.Destroy;
begin
  FreeAndNil(FData);
  inherited;
end;

function TDataDefinition.GetData: TCustomData;
begin
  if FData = nil then
    FData := CreateData(nil);
  Result := FData;
end;

initialization

DataContainer := TDataContainer.Create;

finalization

FreeAndNil(DataContainer);

end.
