unit DataAbstractService_Impl;
{----------------------------------------------------------------------------}
{ Data Abstract Library - Core Library                                       }
{                                                                            }
{ (c)opyright RemObjects Software. all rights reserved.                      }
{                                                                            }
{ Using this code requires a valid license of the Data Abstract              }
{ which can be obtained at http://www.remobjects.com.                        }
{----------------------------------------------------------------------------}

{----------------------------------------------------------------------------}
{ When applying fixes to this unit, please see if the need to be propagates  }
{ to the duplicate dlogic in legacy DARemoteService_Impl.pas, too.           }
{----------------------------------------------------------------------------}

{$IFDEF MSWINDOWS}
{$I ..\DataAbstract.inc}
{$ELSE}
{$I ../DataAbstract.inc}
{$ENDIF}
interface

uses
  {$IFDEF DELPHIXE2UP}
    {$IFDEF MSWINDOWS}Winapi.Windows,{$ENDIF}
    System.SysUtils, System.Classes, System.Variants,
    Data.DB,
  {$ELSE}
    {$IFDEF MSWINDOWS}Windows,{$ENDIF}
    SysUtils, Classes, Variants, DB,
  {$ENDIF}
  {Generated:} DataAbstract4_Intf, DataAbstractSimple_Intf,
  uROClientIntf, uROTypes, uROServer, uROSessions, uRORemoteDataModule, uROClasses, uROEncoding,
  uDAInterfaces, uDAServerInterfaces,
  uDACore, uDASchema, uDADataTable, uDADataStreamer, uDABusinessProcessor,
  uDADataTableReferenceCollection, uDADelta, uDALocalHelpers, uDAMacros, uDAScriptingInterfaces, uDAScriptingProvider;

type
  {$IFDEF DELPHI10UP}{$REGION 'Events'}{$ENDIF}
  { Events }
  TDAAcquireConnectionEvent = procedure(aSender: TObject; var aConnectionName: string) of object;
  TDAConnectionAcquiredEvent = procedure(aSender: TObject; const aConnectionName: string; const aAcquiredConnection: IDAConnection) of object;
  TDAAcquireConnectionFailureEvent = procedure(aSender: TObject; const aConnectionName: string; aError: Exception) of object;
  TDAGetDatasetSchemaEvent = procedure(aSender: TObject; const aDataset: IDADataset) of object;
  TDAGetDatasetDataEvent = procedure(aSender: TObject; const aDataset: IDADataset; const aIncludeSchema: Boolean; const aMaxRecords: Integer) of object;
  TDABusinessProcessorAutoCreatedEvent = procedure(aSender: TRORemoteDataModule; BusinessProcessor : TDABusinessProcessor) of object;
  TDABeforeExecuteCommandEvent = procedure(aSender: TObject; const aCommand: IDASQLCommand) of object;
  TDAAfterExecuteCommandEvent = procedure(aSender: TObject; const aCommand: IDASQLCommand; aRowsAffacted : integer) of object;
  TDAConnectionReleasedEvent = procedure(aSender: TObject; const aConnectionName: string) of object;
  TDAGetSchemaAsXMLEvent = procedure(aSender: TObject; var aSchemaXML: string) of object;
  TDAProcessDeltasEvent = procedure(aSender: TObject; aDeltaStructs: TDADeltaStructList) of object;
  TDAProcessDeltasErrorEvent = procedure(aSender: TObject; aDeltaStructs: TDADeltaStructList; aError: Exception; var aDoRaise: boolean) of object;
  TDASchemaElementAccessValidationEvent = procedure(Sender: TObject; const aConnection: IDAConnection; const aDatasetName: string;
                                          const aParamNames: array of string; const aParamValues : array of variant;
                                          aSchema: TDASchema; var Allowed : boolean) of object;
  TDASQLValidationEvent = procedure(Sender: TObject; const aConnection: IDAConnection; const aSQLText: string;
                                          const aParamNames: array of string; const aParamValues : array of variant;
                                          var Allowed : boolean) of object;
  TDAUpdateDataTransactionEvent = procedure(Sender: TObject; var aUseDefaultTransactionLogic: Boolean) of object;
  {$IFDEF DELPHI10UP}{$ENDREGION}{$ENDIF}

  TDADeltasMode = (dumExported, dumStandard);
  TDADeltasModes = set of TDADeltasMode;

  PDAServiceExchangeData = ^TDAServiceExchangeData;
  TDAServiceExchangeData = record
    lTableName: string;
    lParamNames: array of string;
    lParamValues: array of Variant;
    lDynSelectFields: array of string;
    lWhereClause: UnicodeString;
    lColumnSortingStr: string;
    lColumnSortingMode: Boolean;
    lOptions: TDAWriteOptions;
    lMaxRecords: integer;
    lUserFilter: string;
  end;

  { TDataAbstractService }
  TDataAbstractService = class(TRORemoteDataModule,
    IDataAbstractService,
    IDataAbstractLocalServiceAccess,
    ISimpleDataAbstractService,
    IDADataAbstractServiceEvents)
  private
    { Properties }
    fAllowExecuteCommands: boolean;
    fAllowExecuteSQL: boolean;
    fAllowDataAccess: boolean;
    fAllowSchemaAccess: boolean;
    fAllowWhereSQL: boolean;
    fConnectionName: string;
    fAcquireConnection: boolean;
    fServiceSchema: TDASchema;
    fAutoCreateBusinessProcessors: boolean;
    fServiceDataStreamer: TDADataStreamer;
    fProcessDeltasWithoutUpdateRules: boolean;

    fConnection: IDAConnection;
    fHETConnection: IDAHETConnection;
    fExportedDataTables: TDADataTableReferenceCollection;

    { Events }
    fOnBeforeGetDatasetSchema: TDAGetDatasetSchemaEvent;
    fOnBeforeProcessDeltas: TDAProcessDeltasEvent;
    fOnAcquireConnectionFailure: TDAAcquireConnectionFailureEvent;
    fOnUpdateDataCommitTransaction: TDAUpdateDataTransactionEvent;
    fOnGetDatasetDataValidation: TDASchemaElementAccessValidationEvent;
    fOnExecuteCommandValidation: TDASchemaElementAccessValidationEvent;
    fOnSQLValidation: TDASQLValidationEvent;
    fOnAfterExecuteCommand: TDAAfterExecuteCommandEvent;
    fOnBeforeAcquireConnection: TDAAcquireConnectionEvent;
    fOnUpdateDataRollBackTransaction: TDAUpdateDataTransactionEvent;
    fOnAfterGetDatasetData: TDAGetDatasetDataEvent;
    fOnAfterReleaseConnection: TDAConnectionReleasedEvent;
    fOnAfterGetDatasetSchema: TDAGetDatasetSchemaEvent;
    fOnAfterProcessDeltas: TDAProcessDeltasEvent;
    fOnGetSchemaAsXML: TDAGetSchemaAsXMLEvent;
    fOnBusinessProcessorAutoCreated: TDABusinessProcessorAutoCreatedEvent;
    fOnUpdateDataBeginTransaction: TDAUpdateDataTransactionEvent;
    fOnAfterAcquireConnection: TDAConnectionAcquiredEvent;
    fOnProcessDeltasError: TDAProcessDeltasErrorEvent;
    fOnBeforeExecuteCommand: TDABeforeExecuteCommandEvent;
    fOnBeforeGetDatasetData: TDAGetDatasetDataEvent;
    fOnBeforeReleaseConnection: TDAConnectionAcquiredEvent;
    fOnBeforeExecuteDeltaCommand: uDAServerInterfaces.TDABeforeExecuteCommandEvent;
    fAllowDynamicSelect: boolean;
    fAllowDynamicWhere: boolean;
    fAllowUpdates: boolean;
    fReturnUpdateFailureDelta: boolean;
    fAllowAllFieldsInDynamicWhere: Boolean;
    fOnUnknownMacroVariable: TOnUnknownIdentifier;
    fScriptContext: IDAServerScriptContext;
    fScriptProvider: IDAScriptProvider;
    fReturnFullSchema: boolean;
    fMacroProcessorEventSet: Boolean;
    procedure SetServiceDataStreamer(const Value: TDADataStreamer);
    procedure SetServiceSchema(const Value: TDASchema);
    procedure SetExportedDataTables(const Value: TDADataTableReferenceCollection);
    procedure Check2;

    function InternalGetSchema(const aFilter: string; aCanAccessPrivateTables: Boolean): string;
    function InternalExecuteCommandEx(const aCommandName: String; const aInputParameters: DataParameterArray; out aOutputParameters: DataParameterArray; aCanAccessPrivateTables: Boolean):integer;
    function InternalGetDatasetScripts(const DatasetNames: string; aCanAccessPrivateTables: Boolean): string;
    function GetServiceSchema: TDASchema;

    {$IFDEF DELPHI10UP}{$REGION 'Connection support'}{$ENDIF}
    function GetConnection: IDAConnection;
    procedure DoReleaseConnection(var aConnection: IDAConnection);
    function TriggerTransactionEvent(aEvent: TDAUpdateDataTransactionEvent): boolean;
    procedure AssignMacroProcesserEvent(AConnection: IDAConnection);
    procedure DeAssignMacroProcesserEvent(AConnection: IDAConnection);
    function DoOnUnknownIdentifier(Sender: TObject; const Name, OrgName: string; var Value: string): Boolean;
    {$IFDEF DELPHI10UP}{$ENDREGION}{$ENDIF}

    {$IFDEF DELPHI10UP}{$REGION 'LDA support'}{$ENDIF}
    function LDA_GetServiceSchema: TDASchema;
    function LDA_InternalGetSchema(const aFilter: string): string;
    procedure LDA_InternalUpdateData(aDeltaList: IDeltaArray);
    procedure LDA_InternalGetData(const aTableNameArray: StringArray; const aTableRequestInfoArray: TableRequestInfoArray; aStreamer: TDADataStreamer);
    function LDA_GetDatasetScripts(const DatasetNames: string): string;
    function LDA_InternalExecuteCommandEx(const aCommandName: String; const aInputParameters: DataParameterArray; out aOutputParameters: DataParameterArray):integer;
    {$IFDEF DELPHI10UP}{$ENDREGION}{$ENDIF}

    {$IFDEF DELPHI10UP}{$REGION 'Simple*Data methods'}{$ENDIF}
    function UnpackSimpleDeltas(const aDelta: SimpleDeltaArray): IDeltaArray;
    function PackSimpleDeltas(const aDelta: IDeltaArray): SimpleDeltaArray;
    function ConvertFromSimple(aValue: string; aDataType: TDADataType): variant;
    function ConvertToSimple(aValue: Variant; aDataType: TDADataType): string;
    procedure BuildParameters(aReq: SimpleRequestInfo; AParameterArray: DataParameterArray);
    {$IFDEF DELPHI10UP}{$ENDREGION}{$ENDIF}

    {$IFDEF DELPHI10UP}{$REGION 'IDataAbstractLocalServiceAccess'}{$ENDIF}
    function DoScriptProvider_UnknownSqlMacroIdentifier(aIdentifier: String;var aValue: String): Boolean;
    procedure DoScriptProvider_CreateTransaction;
    procedure DoScriptProvider_AfterCommit;
    procedure DoScriptProvider_BeforeCommit;
    procedure DoScriptProvider_AfterRollback;
    procedure DoScriptProvider_BeforeRollback;
    procedure DoScriptProvider_BeforeGetData(const aTableNameArray: StringArray; const aTableRequestInfoArray: TableRequestInfoArray);
    procedure DoScriptProvider_AfterGetData(const aTableNameArray: StringArray; const aTableRequestInfoArray: TableRequestInfoArray);
    procedure DoScriptProvider_BeforeExecuteCommand(aSQL, aCommandName: String; aParameters: DataParameterArray);
    procedure DoScriptProvider_AfterExecuteCommand(aSQL: String; aCommandName: String; aParameters: DataParameterArray; aRowsAffected: integer);
    procedure DoScriptProvider_ValidateDirectSQLAccess(aSQL: String; aParameterNames: array of String; aParameterValues: array of variant; var aAllowed: Boolean);
    procedure DoScriptProvider_ValidateDataTableAccess(aName: String; aParameterNames: array of String; aParameterValues: Array of Variant; var aAllowed: Boolean);
    procedure DoScriptProvider_ValidateCommandAccess(aName: String; aParameterNames: array of String; aParameterValues: Array of Variant; var aAllowed: Boolean);
    procedure SetScriptProvider(const Value: IDAScriptProvider);
    procedure SetupScriptProvider;
    procedure UninstallScriptProvider;
    {$IFDEF DELPHI10UP}{$REGION 'IDADataAbstractServiceEvents implementation'}{$ENDIF}
    procedure DoScriptProvider_BeforeProcessDelta(aDelta: IDADelta);
    procedure DoScriptProvider_AfterProcessDelta(aDelta: IDADelta);
    procedure DoScriptProvider_BeforeProcessDeltaChange(aDelta: IDADelta; aChange: TDADeltaChange; aWasRefreshed: Boolean; var aCanRemove: Boolean);
    procedure DoScriptProvider_AfterProcessDeltaChange(aDelta: IDADelta; aChange: TDADeltaChange; aWasRefreshed: Boolean);
    procedure DoScriptProvider_ProcessError(aDelta: IDADelta; aChange: TDADeltaChange; var aCanContinue: Boolean; var aError: Exception);
//    procedure BP_GenerateSQLEvent(aChangeType: TDAChangeType;const ReferencedStatement: TDAStatement;const aDelta: IDADelta;var SQL: string);
//    procedure BP_AfterExecuteCommandEvent(const ACommand: IDASQLCommand; CommandName: string);
//    procedure BP_BeforeExecuteCommandEvent(const ACommand: IDASQLCommand; CommandName: string);
    {$IFDEF DELPHI10UP}{$ENDREGION}{$ENDIF}
    {$IFDEF DELPHI10UP}{$REGION 'IDADataAbstractServiceEvents'}{$ENDIF}
    procedure IDADataAbstractServiceEvents.BeforeProcessDelta = DoScriptProvider_BeforeProcessDelta;
    procedure IDADataAbstractServiceEvents.AfterProcessDelta = DoScriptProvider_AfterProcessDelta;
    procedure IDADataAbstractServiceEvents.BeforeProcessDeltaChange = DoScriptProvider_BeforeProcessDeltaChange;
    procedure IDADataAbstractServiceEvents.AfterProcessDeltaChange = DoScriptProvider_AfterProcessDeltaChange;
    procedure IDADataAbstractServiceEvents.ProcessError = DoScriptProvider_ProcessError;
//    procedure IDADataAbstractServiceEvents.GenerateSQLEvent = BP_GenerateSQLEvent;
//    procedure IDADataAbstractServiceEvents.AfterExecuteCommandEvent = BP_AfterExecuteCommandEvent;
//    procedure IDADataAbstractServiceEvents.BeforeExecuteCommandEvent = BP_BeforeExecuteCommandEvent;
    {$IFDEF DELPHI10UP}{$ENDREGION}{$ENDIF}

    {$IFDEF DELPHI10UP}{$ENDREGION}{$ENDIF}

    {$IFDEF DELPHI10UP}{$REGION 'UpdateData support methods'}{$ENDIF}
    procedure ExportedDataTables_MergeDelta(ADelta: IDADelta);
    function ReadDeltaFromStream(const DeltaStream: Binary):IDeltaArray;
    function PackDeltas(aDeltaList: IDeltaArray): Binary;
    function UnpackDeltas(aDeltaList: IDeltaArray; DeltaStructList: TDADeltaStructList): TDADeltasModes;
    procedure BP_ProcessChanges(aStruct: TDADeltaStruct;aChangeTypes: TDAChangeTypes;aSynchronizeAutoIncs: Boolean);
    procedure ValidateDeltaStruct(aDeltaStructs: TDADeltaStructList; aCanAccessPrivateTables: Boolean);
    procedure ProcessUnhandledChanges(aDeltaStructs: TDADeltaStructList);
    procedure UpdateData_StandardMode(aDeltaStructs: TDADeltaStructList);
    procedure UpdateData_ExportedDataTables(aDeltaStructs: TDADeltaStructList);
    procedure Fix_NET_issue_with_AutoInc_at_Insert(aDelta: IDADelta);
    procedure ParseParameters(const aParameterArray: DataParameterArray; const aRec: PDAServiceExchangeData);
    function CreateBP(const aDeltaName: String): TDABusinessProcessor;
    function FindUserDefinedBP(const aDeltaName: String; const isReducedDelta: Boolean): TDABusinessProcessor;
    procedure SetupMasterDetails(DeltaStructList: TDADeltaStructList);
    {$IFDEF DELPHI10UP}{$ENDREGION}{$ENDIF}

    {$IFDEF DELPHI10UP}{$REGION 'GetData support methods'}{$ENDIF}
    procedure GetData_UnionDataTable(const aRec: PDAServiceExchangeData;aStreamer: TDADataStreamer);
    procedure GetData_StandardMode(const aRec: PDAServiceExchangeData;aStreamer: TDADataStreamer);
    procedure GetData_ExportedDataTables(const aDataset: IDADataset; const aRec: PDAServiceExchangeData;aStreamer: TDADataStreamer);
    procedure InternalGetData_QueryBuilder(aTableName: String; aRequestInfo: TableRequestInfo; aStreamer: TDADataStreamer);
    procedure ParseTableRequestInfoV5(const aRequestInfo: TableRequestInfov5; const aRec: PDAServiceExchangeData);
    {$IFDEF DELPHI10UP}{$ENDREGION}{$ENDIF}
  protected
    {$IFDEF DELPHI10UP}{$REGION 'events'}{$ENDIF}
    function DoStartTransaction(var aConnection: IDAConnection): Boolean;virtual;
    procedure DoCommitTransaction(aConnection: IDAConnection);virtual;
    procedure DoRollbackTransaction(aConnection: IDAConnection);virtual;
    procedure DoBeforeGetDatasetSchema(const aDataset: IDADataset);
    procedure DoBeforeGetDatasetData(const aDataset: IDADataset; const aIncludeSchema: Boolean; const aMaxRecords: Integer); virtual;
    procedure DoValidateDirectSQLAccess(const aConnection: IDAConnection; const aSQLText: string; const aRec: PDAServiceExchangeData);
    procedure DoValidateCommandAccess(const aConnection: IDAConnection; const aDatasetName: string; const aRec: PDAServiceExchangeData);
    procedure DoValidateDataTableAccess(const aDatasetName: string; const aRec: PDAServiceExchangeData);
    {$IFDEF DELPHI10UP}{$ENDREGION}{$ENDIF}
  protected
    procedure Check(CheckOnlyDataStreamer:Boolean = false);
    procedure InternalGetData(const aTableNameArray: StringArray; const aTableRequestInfoArray: TableRequestInfoArray; aStreamer: TDADataStreamer; aCanAccessPrivateTables: Boolean);
    procedure InternalUpdateData(aDeltaList: IDeltaArray; aCanAccessPrivateTables: Boolean); virtual;

    {$IFDEF DELPHI10UP}{$REGION 'IDataAbstractService'}{$ENDIF}
    function GetSchema(const aFilter: string): string;
    function GetData(const aTableNameArray: StringArray; const aTableRequestInfoArray: TableRequestInfoArray): Binary;
    function UpdateData(const aDelta: Binary): Binary;
    function ExecuteCommand(const aCommandName: string; const aParameterArray: DataParameterArray): Integer;
    function ExecuteCommandEx(const aCommandName: string; const aInputParameters: DataParameterArray; out aOutputParameters: DataParameterArray): Integer;
    function GetTableSchema(const aTableNameArray: StringArray): string;
    function GetCommandSchema(const aCommandNameArray: StringArray): string;
    function SQLGetData(const aSQLText: string; const aIncludeSchema: Boolean; const aMaxRecords: Integer): Binary;
    function SQLGetDataEx(const aSQLText: string; const aIncludeSchema: Boolean; const aMaxRecords: Integer; const aDynamicWhereXML: UnicodeString): Binary;
    function SQLExecuteCommand(const aSQLText: string): Integer;
    function SQLExecuteCommandEx(const aSQLText: string; const aDynamicWhereXML: UnicodeString): Integer;
    function GetDatasetScripts(const DatasetNames: string): string;
    procedure RegisterForDataChangeNotification(const aTableName: string);
    procedure UnregisterForDataChangeNotification(const aTableName: string);
    {$IFDEF DELPHI10UP}{$ENDREGION}{$ENDIF}

    {$IFDEF DELPHI10UP}{$REGION 'IDataAbstractLocalServiceAccess'}{$ENDIF}
    function IDataAbstractLocalServiceAccess.GetSchema = LDA_InternalGetSchema;
    procedure IDataAbstractLocalServiceAccess.UpdateData = LDA_InternalUpdateData;
    procedure IDataAbstractLocalServiceAccess.GetData = LDA_InternalGetData;
    function IDataAbstractLocalServiceAccess.GetDatasetScripts = LDA_GetDatasetScripts;
    function IDataAbstractLocalServiceAccess.ExecuteCommandEx = LDA_InternalExecuteCommandEx;
    function IDataAbstractLocalServiceAccess.GetServiceSchema = LDA_GetServiceSchema;
    {$IFDEF DELPHI10UP}{$ENDREGION}{$ENDIF}

    {$IFDEF DELPHI10UP}{$REGION 'ISimpleDataAbstractService'}{$ENDIF}
    function SimpleGetData(const Request: SimpleRequestInfoArray): SimpleDataResultArray;virtual;
    function SimpleUpdateData(const aDelta: SimpleDeltaArray): SimpleDeltaArray;virtual;
    {$IFDEF DELPHI10UP}{$ENDREGION}{$ENDIF}

    { TRORemoteDataModule }
    procedure DoOnDeactivate(aClientID: TGUID); override;

    procedure Notification(AComponent: TComponent; Operation: TOperation); override;

    function GetConnectionForObject(const aName: string): IDAConnection; virtual;
    function GetScriptContext: IDAServerScriptContext; virtual;
    procedure Loaded; override;
  public
    constructor Create(aOwner : TComponent); override;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
    procedure SetConnection(aConnection: IDAConnection); deprecated;
    {$WARN SYMBOL_DEPRECATED OFF}
    property Connection: IDAConnection read GetConnection write SetConnection;
    {$WARN SYMBOL_DEPRECATED ON}
    procedure ReleaseConnection;
    procedure CheckForConnectionManager;
  published
    {$IFDEF DELPHI10UP}{$REGION 'properties'}{$ENDIF}
    property AcquireConnection: boolean read fAcquireConnection write fAcquireConnection default true;
    property ConnectionName: string read fConnectionName write fConnectionName;
    property AutoCreateBusinessProcessors : boolean read fAutoCreateBusinessProcessors write fAutoCreateBusinessProcessors default true;
    property ServiceSchema: TDASchema read GetServiceSchema write SetServiceSchema;
    property ServiceDataStreamer: TDADataStreamer read fServiceDataStreamer write SetServiceDataStreamer;

    property AllowDataAccess: boolean read fAllowDataAccess write fAllowDataAccess default true;
    property AllowSchemaAccess: boolean read fAllowSchemaAccess write fAllowSchemaAccess default true;
    property AllowUpdates: boolean read fAllowUpdates write fAllowUpdates default true;
    property AllowExecuteSQL: boolean read fAllowExecuteSQL write fAllowExecuteSQL default false;
    property AllowExecuteCommands: boolean read fAllowExecuteCommands write fAllowExecuteCommands default false;
    property AllowDynamicSelect: boolean read fAllowDynamicSelect write fAllowDynamicSelect default true;
    property AllowDynamicWhere: boolean read fAllowDynamicWhere write fAllowDynamicWhere default true;

    property ProcessDeltasWithoutUpdateRules: boolean read fProcessDeltasWithoutUpdateRules write fProcessDeltasWithoutUpdateRules default true;
    property ExportedDataTables: TDADataTableReferenceCollection read fExportedDataTables write SetExportedDataTables;
    property ReturnUpdateFailureDelta: boolean read fReturnUpdateFailureDelta write FReturnUpdateFailureDelta default True;
    property AllowAllFieldsInDynamicWhere: Boolean read fAllowAllFieldsInDynamicWhere write fAllowAllFieldsInDynamicWhere default False;
    property ScriptProvider: IDAScriptProvider read fScriptProvider write SetScriptProvider;
    property ReturnFullSchema: boolean read fReturnFullSchema write fReturnFullSchema default False;
    {$IFDEF DELPHI10UP}{$ENDREGION}{$ENDIF}
    {$IFDEF DELPHI10UP}{$REGION 'Events'}{$ENDIF}
    property OnBeforeAcquireConnection: TDAAcquireConnectionEvent read fOnBeforeAcquireConnection write fOnBeforeAcquireConnection;
    property OnAfterAcquireConnection: TDAConnectionAcquiredEvent read fOnAfterAcquireConnection write fOnAfterAcquireConnection;
    property OnBeforeReleaseConnection: TDAConnectionAcquiredEvent read fOnBeforeReleaseConnection write fOnBeforeReleaseConnection;
    property OnAfterReleaseConnection: TDAConnectionReleasedEvent read fOnAfterReleaseConnection write fOnAfterReleaseConnection;
    property OnAcquireConnectionFailure: TDAAcquireConnectionFailureEvent read fOnAcquireConnectionFailure write fOnAcquireConnectionFailure;

    property OnBeforeProcessDeltas : TDAProcessDeltasEvent read fOnBeforeProcessDeltas write fOnBeforeProcessDeltas;
    property OnAfterProcessDeltas: TDAProcessDeltasEvent read fOnAfterProcessDeltas write fOnAfterProcessDeltas;
    property OnProcessDeltasError: TDAProcessDeltasErrorEvent read fOnProcessDeltasError write fOnProcessDeltasError;

    property OnBeforeGetDatasetSchema: TDAGetDatasetSchemaEvent read fOnBeforeGetDatasetSchema write fOnBeforeGetDatasetSchema;
    property OnBeforeGetDatasetData: TDAGetDatasetDataEvent read fOnBeforeGetDatasetData write fOnBeforeGetDatasetData;
    property OnAfterGetDatasetSchema: TDAGetDatasetSchemaEvent read fOnAfterGetDatasetSchema write fOnAfterGetDatasetSchema;
    property OnAfterGetDatasetData: TDAGetDatasetDataEvent read fOnAfterGetDatasetData write fOnAfterGetDatasetData;
    property OnBusinessProcessorAutoCreated: TDABusinessProcessorAutoCreatedEvent read fOnBusinessProcessorAutoCreated write fOnBusinessProcessorAutoCreated;
    property OnBeforeExecuteCommand: TDABeforeExecuteCommandEvent read fOnBeforeExecuteCommand write fOnBeforeExecuteCommand;
    property OnAfterExecuteCommand: TDAAfterExecuteCommandEvent read fOnAfterExecuteCommand write fOnAfterExecuteCommand;
    property OnGetSchemaAsXMLEvent: TDAGetSchemaAsXMLEvent read fOnGetSchemaAsXML write fOnGetSchemaAsXML;
    property OnValidateDatasetAccess: TDASchemaElementAccessValidationEvent read fOnGetDatasetDataValidation write fOnGetDatasetDataValidation;
    property OnValidateCommandExecution: TDASchemaElementAccessValidationEvent read  fOnExecuteCommandValidation write fOnExecuteCommandValidation;
    property OnValidateDirectSQLAccess: TDASQLValidationEvent read fOnSQLValidation write fOnSQLValidation;

    property OnUpdateDataBeginTransaction    : TDAUpdateDataTransactionEvent read fOnUpdateDataBeginTransaction write fOnUpdateDataBeginTransaction;
    property OnUpdateDataCommitTransaction   : TDAUpdateDataTransactionEvent read fOnUpdateDataCommitTransaction write fOnUpdateDataCommitTransaction;
    property OnUpdateDataRollBackTransaction : TDAUpdateDataTransactionEvent read fOnUpdateDataRollBackTransaction write fOnUpdateDataRollBackTransaction;

    property OnBeforeExecuteDeltaCommand: uDAServerInterfaces.TDABeforeExecuteCommandEvent read fOnBeforeExecuteDeltaCommand write fOnBeforeExecuteDeltaCommand;
    property OnUnknownMacroVariable: TOnUnknownIdentifier read fOnUnknownMacroVariable write fOnUnknownMacroVariable;
    {$IFDEF DELPHI10UP}{$ENDREGION}{$ENDIF}
  published // deprecated
    // DynamicWhere expressions should be used instead of AllowWhereSQL
    property AllowWhereSQL: boolean read fAllowWhereSQL write fAllowWhereSQL default false; {deprecated;}
    property BeforeAcquireConnection: TDAAcquireConnectionEvent read fOnBeforeAcquireConnection write fOnBeforeAcquireConnection;
    property AfterAcquireConnection: TDAConnectionAcquiredEvent read fOnAfterAcquireConnection write fOnAfterAcquireConnection;
    property BeforeReleaseConnection: TDAConnectionAcquiredEvent read fOnBeforeReleaseConnection write fOnBeforeReleaseConnection;
    property AfterReleaseConnection: TDAConnectionReleasedEvent read fOnAfterReleaseConnection write fOnAfterReleaseConnection;
    property BeforeProcessDeltas : TDAProcessDeltasEvent read fOnBeforeProcessDeltas write fOnBeforeProcessDeltas;
    property AfterProcessDeltas: TDAProcessDeltasEvent read fOnAfterProcessDeltas write fOnAfterProcessDeltas;
    property BeforeGetDatasetSchema: TDAGetDatasetSchemaEvent read fOnBeforeGetDatasetSchema write fOnBeforeGetDatasetSchema;
    property BeforeGetDatasetData: TDAGetDatasetDataEvent read fOnBeforeGetDatasetData write fOnBeforeGetDatasetData;
    property AfterGetDatasetSchema: TDAGetDatasetSchemaEvent read fOnAfterGetDatasetSchema write fOnAfterGetDatasetSchema;
    property AfterGetDatasetData: TDAGetDatasetDataEvent read fOnAfterGetDatasetData write fOnAfterGetDatasetData;
    property BeforeExecuteCommand: TDABeforeExecuteCommandEvent read fOnBeforeExecuteCommand write fOnBeforeExecuteCommand;
    property AfterExecuteCommand: TDAAfterExecuteCommandEvent read fOnAfterExecuteCommand write fOnAfterExecuteCommand;
    property ValidateDatasetAccess: TDASchemaElementAccessValidationEvent read fOnGetDatasetDataValidation write fOnGetDatasetDataValidation;
    property ValidateCommandExecution: TDASchemaElementAccessValidationEvent read  fOnExecuteCommandValidation write fOnExecuteCommandValidation;
    property ValidateDirectSQLAccess: TDASQLValidationEvent read fOnSQLValidation write fOnSQLValidation;
    property BeforeExecuteDeltaCommand: uDAServerInterfaces.TDABeforeExecuteCommandEvent read fOnBeforeExecuteDeltaCommand write fOnBeforeExecuteDeltaCommand;
  end;

implementation

uses
  uROXMLIntf,uROBinaryHelpers, uROCompression, uRODateTimeSupport, uROSystem,
  uDARes, uDAExceptions, uDAXMLUtils, uDAWhere, uDASimpleDataStreamer,
  uDAScriptContext, uDAMemDataTable,uDADatasetRelationship, uDAQueryBuilder,
  uDASchemaClasses,uDAUnionDataTables, uDAJoinDataTables, uDAFields,
  uDASimpleQueryBuilder, uROTypesNextGen;

type
  { TableRequestInfoV6 }
  TableRequestInfoWithQueryBuilder = class(TableRequestInfo)
  private
    fQueryBuilder: TDAQueryBuilder;
  public
    property QueryBuilder: TDAQueryBuilder read fQueryBuilder write fQueryBuilder;
  end;

const
  TSimpleDataTypeMapping : array [SimpleDataType] of TDADataType =
    (datWideString, datInteger, datFloat, datDateTime, datLargeInt,datCurrency, datGuid,datBlob,datBoolean);

procedure CheckUTF8Decode(const aOriginalStr: string; aDecodedStr: string);
begin
  {$IFNDEF UNICODE}
  if (aDecodedStr = '') and (aOriginalStr <> '') then raise EDAConvertException.CreateFmt(err_UTF8DecodeError, [aOriginalStr]);
  {$ENDIF}
end;

{$IFDEF DELPHI10UP}{$REGION 'DataAbstractService'}{$ENDIF}
{ DataAbstractService }

procedure TDataAbstractService.Check2;
begin
  DAValidateProperty(not (Assigned(Connection) or AcquireConnection), Name, err_AcquireConnectionIsNotSetAndThereIsNoConnectionAvailable);
  DAValidateProperty(not Assigned(ServiceSchema),Name,err_ServiceSchemaPropertyIsNotAssigned);
end;

procedure TDataAbstractService.CheckForConnectionManager;
begin
  DAValidateProperty((fServiceSchema = nil) or (fServiceSchema.ConnectionManager = nil),Name,err_DARDMInvalidSchema);
end;

function TDataAbstractService.ConvertFromSimple(aValue: string;
  aDataType: TDADataType): variant;
var
  loffset: integer;
  aStr: UnicodeString;
  ldoc: IXMLDocument;
begin
  Result := Null;
  aStr := AnsiDequotedStr({$IFNDEF UNICODE}UTF8ToString{$ENDIF}(aValue), '''');
  if aStr = ''  then exit;

  case aDataType of
    datString, datFixedChar,datMemo: Result := aStr;
    datDateTime: Result := SOAPDateTimeToDateTime(aStr, loffset);
    datSingleFloat,datFloat: Result := StrToFloatDef(aStr,0);
    datCurrency: Result := StrToCurrDef(aStr,0);
    datByte,
    datShortInt,
    datWord,
    datSmallInt,
    datCardinal,
    datAutoInc, datInteger: Result := StrToIntDef(aStr,0);
    datLargeInt,datLargeAutoInc: Result := StrToInt64Def(aStr,0);
    datBoolean: Result := StrToBoolDef(aStr, False);
    datFixedWideChar, datWideString, datWideMemo: Result := aStr;
    datLargeUInt: Result := Uint64(StrToInt64Def(aStr,0));
    datGuid: result := aStr;
    datXml: begin
      ldoc := NewROXmlDocument;
      ldoc.new();
      ldoc.XML := aStr;
      Result := ldoc.DocumentNode;
      ldoc := nil;
    end;
    datDecimal: Result := aStr;
    datBlob: Result := DecodeString(aValue);
  end;
end;

function TDataAbstractService.ConvertToSimple(aValue: Variant;
  aDataType: TDADataType): string;
var
  s: UnicodeString;
begin
  Result := '';
  if TestForNull(aValue) then Exit;
  case aDataType of
    datString, datFixedChar,datMemo: s := VarToStr(aValue);
    datDateTime: s:= DateTimeToSOAPDateTime(GetVarDateTime(aValue));
    datSingleFloat,
    datFloat: s := FloatToStr(aValue);
    datCurrency: s := CurrToStr(GetVarCurrency(aValue));
    datByte,
    datShortInt,
    datWord,
    datSmallInt,
    datCardinal,
    datAutoInc, datInteger: s := IntToStr(aValue);
    datLargeInt,datLargeAutoInc,datLargeUInt: s := InttoStr(GetVarInt64(aValue));
    datBoolean: s := IntToStr(ord(bytebool(GetVarBoolean(aValue))));
    datFixedWideChar, datWideString, datWideMemo: s := aValue;
    datGuid: s := VarToStr(aValue);
    datXml:  s := VarToStr(aValue);
    datDecimal: s:= DecimalVariantToString(aValue);
    datBlob: begin
      Result := EncodeString({$IFNDEF UNICODE}UTF8Encode{$ENDIF}(aValue));
      Exit;
    end;
  end;
  Result := {$IFNDEF UNICODE}UTF8Encode{$ENDIF}(s);
end;

constructor TDataAbstractService.Create(aOwner : TComponent);
begin
  fAllowDataAccess := true;
  fAllowSchemaAccess := true;
  fAllowDynamicSelect := true;
  fAllowDynamicWhere := true;
  fAllowUpdates := true;
  fAutoCreateBusinessProcessors := true;
  fProcessDeltasWithoutUpdateRules := true;
  fAcquireConnection := true;
  fExportedDataTables := TDADataTableReferenceCollection.Create(Self);
  fReturnUpdateFailureDelta := True;
  inherited;
end;

function TDataAbstractService.CreateBP(const aDeltaName: String): TDABusinessProcessor;
var
  l: string;
  i: integer;
begin
  DAValidateProperty(not AutoCreateBusinessProcessors,Name,err_DARDMCannotFindProxessorForDelta, [aDeltaName]);
  //ToDo: this will never get freed, until the DM frees?
  Result := TDABusinessProcessor.Create(self);
  l := StringReplace(aDeltaName,' ','',[rfReplaceAll]);
  for I := _StrLow to _StrHigh(l) do
    if not (ord(l[i]) in[ord('A')..ord('Z'),ord('a')..ord('z'),ord('0')..ord('9')]) then l[i]:='_';
  Result.Name := 'autogeneratedBPfor'+l;
  Result.ReferencedDataset := aDeltaName;
  Result.Schema := ServiceSchema;
  Result.RaiseExceptionAtError := not fReturnUpdateFailureDelta;
  Result.SetupDeltaCommands(aDeltaName,True);
  Result.OnBeforeExecuteCommand := fOnBeforeExecuteDeltaCommand;
  if Assigned(fOnBusinessProcessorAutoCreated) then fOnBusinessProcessorAutoCreated(Self, Result);
end;

procedure TDataAbstractService.DeAssignMacroProcesserEvent(
  AConnection: IDAConnection);
var
  lmacro: IDAHasMacroProcessor;
begin
  if AConnection.UseMacroProcessor then
    if Supports(AConnection, IDAHasMacroProcessor, lmacro) then begin
      if Assigned(lmacro.GetMacroProcessor) and fMacroProcessorEventSet then begin
        lmacro.GetMacroProcessor.OnDAServiceUnknownIdentifier := nil;
        fMacroProcessorEventSet:=False;
      end;
    end;
end;

destructor TDataAbstractService.Destroy;
begin
  ScriptProvider := nil;
  ServiceSchema := nil;
  ServiceDataStreamer := nil;
  inherited;
  FreeAndNIL(fExportedDataTables);
end;

procedure TDataAbstractService.Notification(AComponent: TComponent; Operation: TOperation);
var
  lRef: TDADataTableReference;
  lna, lna1: IDANativeAccess;
begin
  inherited;

  if (Operation = opRemove) then begin

    if ((AComponent is TDADataTable) or (AComponent is TDataSet)) and (fExportedDataTables.Count > 0) then begin
      lRef := fExportedDataTables.FindByDataTable(TDADataTable(aComponent));
      if (lRef<>nil) then lRef.DataTable := nil;
    end
    else if (AComponent = fServiceSchema) then begin
      ServiceSchema := nil;
    end
    else if (AComponent = fServiceDataStreamer) then begin
      ServiceDataStreamer := nil;
    end
    else if (fScriptProvider <> nil) and
      Supports(fScriptProvider, IDANativeAccess, lna) and
      Supports(AComponent, IDANativeAccess, lna1) and
      (lna.Native = lna1.Native) then begin
      ScriptProvider := nil;
    end;
  end
end;

function TDataAbstractService.PackDeltas(aDeltaList: IDeltaArray): Binary;
var
  oldDeltaMode: Boolean;
  i: integer;
begin
  Result := Binary.Create;
  Result.CapacityIncrement := ServiceDataStreamer.BufferSize;
  oldDeltaMode:=ServiceDataStreamer.SendReducedDelta;
  ServiceDataStreamer.Initialize(result, aiWrite);
  try
    for i := 0 to Length(aDeltaList)-1 do
      ServiceDataStreamer.WriteDelta(aDeltaList[i]);
  finally
    ServiceDataStreamer.Finalize;
    ServiceDataStreamer.SendReducedDelta:=oldDeltaMode;
  end;
end;

function TDataAbstractService.PackSimpleDeltas(
  const aDelta: IDeltaArray): SimpleDeltaArray;
var
  i,j,k: Integer;
  lDelta:  IDADelta;
  lSimpleDelta : SimpleDelta;
  lRows: SimpleDeltaChange;
  s: string;
begin
  Result := SimpleDeltaArray.Create;
  for i:=  0  to  Length(aDelta)-1  do  begin
    lDelta := aDelta[i];
    lSimpleDelta := Result.Add;
    lSimpleDelta.TableName := {$IFNDEF UNICODE}UTF8Encode{$ENDIF}(lDelta.LogicalName);
    for j :=  0  to lDelta.LoggedFieldCount-1  do
      lSimpleDelta.Fields.Add({$IFNDEF UNICODE}UTF8Encode{$ENDIF}(lDelta.LoggedFieldNames[j]));

    for  j :=  0  to  lDelta.Count-1  do  begin
      lRows := lSimpleDelta.Rows.Add;
      if (lDelta[j].Status = csResolved)  then
        lRows.Error := ''
      else begin
        s :=lDelta[j].Message;
        if s = '' then s := 'Error';
        lRows.Error := {$IFNDEF UNICODE}UTF8Encode{$ENDIF}(s);
      end;

      for k:=  0  to lDelta.LoggedFieldCount-1  do  begin
        lRows.OldValues.Add( ConvertToSimple(lDelta[i].OldValues[k], lDelta.LoggedFieldTypes[k]));
        lRows.NewValues.Add( ConvertToSimple(lDelta[i].NewValues[k], lDelta.LoggedFieldTypes[k]));
      end;
    end;
  end;
end;

procedure TDataAbstractService.ParseParameters(const aParameterArray: DataParameterArray; const aRec: PDAServiceExchangeData);
var
  j: integer;
begin
  SetLength(aRec^.lParamNames, aParameterArray.Count);
  SetLength(aRec^.lParamValues, aParameterArray.Count);
  for j := 0 to (aParameterArray.Count-1) do begin
    aRec^.lParamNames[j] := {$IFNDEF UNICODE}UTF8ToString{$ENDIF}(aParameterArray[j].Name);
    CheckUTF8Decode(aParameterArray[j].Name, aRec^.lParamNames[j]);
    aRec^.lParamValues[j] := aParameterArray[j].Value;
  end;
end;

procedure TDataAbstractService.ParseTableRequestInfoV5(const aRequestInfo: TableRequestInfov5; const aRec: PDAServiceExchangeData);
var
  j: integer;
begin
  if assigned(aRequestInfo.DynamicSelectFieldNames) then begin
    DAValidateProperty(not AllowDynamicSelect,Name,err_DynamicSelectSupportHasBeenDisabledGetData);
    SetLength(aRec^.lDynSelectFields,aRequestInfo.DynamicSelectFieldNames.Count);
    for j := 0 to aRequestInfo.DynamicSelectFieldNames.Count-1 do begin
      CheckUTF8Decode(aRequestInfo.DynamicSelectFieldNames[j], {$IFNDEF UNICODE}UTF8ToString{$ENDIF}(aRequestInfo.DynamicSelectFieldNames[j]));
      aRec^.lDynSelectFields[j] := Trim({$IFNDEF UNICODE}UTF8ToString{$ENDIF}(aRequestInfo.DynamicSelectFieldNames[j]));
    end;
    if aRequestInfo.DynamicSelectFieldNames.Count > 0 then aRec^.lOptions := aRec^.lOptions+[woSchema];
  end;
  if assigned(aRequestInfo.WhereClause) then begin
    DAValidateProperty(not AllowDynamicWhere,Name,err_DynamicWhereSupportHasBeenDisabledGetData);
    aRec^.lWhereClause := aRequestInfo.WhereClause.XML
  end;
  if Assigned(aRequestInfo.Sorting) then begin
    aRec^.lColumnSortingStr := Trim({$IFNDEF UNICODE}UTF8ToString{$ENDIF}(aRequestInfo.Sorting.FieldName));
    aRec^.lColumnSortingMode := aRequestInfo.Sorting.SortDirection  = ColumnSortDirection_Ascending;
  end;
end;

procedure TDataAbstractService.ProcessUnhandledChanges(
  aDeltaStructs: TDADeltaStructList);
var
  i,j: integer;
  lc: TDADeltaChange;
begin
  // Check for unhandled changes
  for i := 0 to aDeltaStructs.Count-1 do begin
    for j := 0 to aDeltaStructs[i].Delta.Count -1 do begin
      lc := aDeltaStructs[i].Delta[j];
      if lc.Status = csPending then begin
        lc.Status := csFailed;
        lc.Message := err_ChangeWasNotProcessed;
      end;
    end;
  end;
end;

function TDataAbstractService.TriggerTransactionEvent(aEvent: TDAUpdateDataTransactionEvent): boolean;
begin
  result := True;
  if Assigned(aEvent) then aEvent(Self, Result);
end;

{ IDataAbstractService: Schema Access }

function TDataAbstractService.InternalGetSchema(const aFilter: string;aCanAccessPrivateTables: Boolean): string;

  procedure CleanUpSQLCommand(ASQLCommand: TDASQLCommand);
  begin
    if ASQLCommand.Statements <> nil then ASQLCommand.Statements.Clear;
    ASQLCommand.DynamicWhereXML := '';
    ASQLCommand.BusinessRulesServer.Clear;
  end;

  procedure CleanUpDataset(ADataset: TDADataset);
  begin
    CleanUpSQLCommand(ADataset);
    ADataset.InsertCommandName := '';
    ADataset.DeleteCommandName := '';
    ADataset.UpdateCommandName := '';
  end;

  procedure CleanUpUnionDataTable(ADataset: TDAUnionDataTable);
  begin
    CleanUpDataset(ADataset);
    ADataset.SourceTables.Clear;
    ADataset.DefaultSourceTable := '';
  end;


var
  xml: TROBinaryMemoryStream;
  tempSchema: TDASchema;
  i: integer;
  obj: TObject;
begin
  tempSchema := LDA_GetServiceSchema;
  try
    for I := tempSchema.Datasets.Count - 1 downto 0 do begin
      if aCanAccessPrivateTables or tempSchema.Datasets[i].IsPublic then begin
        if not fReturnFullSchema then CleanUpDataset(tempSchema.Datasets[i]);
      end
      else begin
        obj := tempSchema.Datasets[i];
        FreeAndNil(obj);
      end;
    end;

    for I := tempSchema.Commands.Count - 1 downto 0 do begin
      if aCanAccessPrivateTables or tempSchema.Commands[i].IsPublic then begin
        if not fReturnFullSchema then CleanUpSQLCommand(tempSchema.Commands[i]);
      end
      else begin
        obj := tempSchema.Commands[i];
        FreeAndNil(obj);
      end;
    end;

    for I := tempSchema.UnionDataTables.Count - 1 downto 0 do begin
      if aCanAccessPrivateTables or tempSchema.UnionDataTables[i].IsPublic then begin
        if not fReturnFullSchema then CleanUpUnionDataTable(tempSchema.UnionDataTables[i]);
      end
      else begin
        obj := tempSchema.UnionDataTables[i];
        FreeAndNil(obj);
      end;
    end;

    if not fReturnFullSchema then begin
      tempSchema.BusinessRulesServer.Clear;
      tempSchema.RelationShips.Clear;
      tempSchema.UpdateRules.Clear;
    end;

    // Returns the schema
    xml := TROBinaryMemoryStream.Create('');
    try
      tempSchema.SaveToStream(xml);
      {$IFDEF UNICODE}
      //Result := xml.ToString;     // caowm 2019-2-22 µ÷ÓÃµÄAnsiBytesToString?
      Result := UTF8BytesToString(xml.Memory, xml.Size);
      {$ELSE}
      Result := UTF8BytesToString(xml.Memory, xml.Size);
      {$ENDIF}
    finally
      xml.Free;
    end;
    if Assigned(fOnGetSchemaAsXML) then fOnGetSchemaAsXML(Self, result);
  finally
    tempSchema.Free;
  end;
end;

procedure TDataAbstractService.InternalUpdateData(aDeltaList: IDeltaArray; aCanAccessPrivateTables: Boolean);
var
  lDeltaStructs: TDADeltaStructList;
  lDoRaise: boolean;
  modes: TDADeltasModes;
begin
  SetupScriptProvider;
  lDeltaStructs := TDADeltaStructList.Create;
  try
    try
      modes:= UnpackDeltas(aDeltaList, lDeltaStructs);
      if modes = [] then exit;

      if dumStandard in modes then begin
        Check2;
        Connection;
        DoStartTransaction(fConnection);
      end;
      if Assigned(fOnBeforeProcessDeltas) then fOnBeforeProcessDeltas(Self, lDeltaStructs);

      ValidateDeltaStruct(lDeltaStructs,aCanAccessPrivateTables);

      if dumExported in modes then UpdateData_ExportedDataTables(lDeltaStructs);
      if dumStandard in modes then UpdateData_StandardMode(lDeltaStructs);

      if Assigned(fOnAfterProcessDeltas) then fOnAfterProcessDeltas(Self, lDeltaStructs);

      if dumStandard in modes then DoCommitTransaction(Connection);

      ProcessUnhandledChanges(lDeltaStructs);
    except
      on E:Exception do begin
        lDoRaise := true;
        try
          if Assigned(fOnProcessDeltasError) then fOnProcessDeltasError(Self, lDeltaStructs, E, lDoRaise);
        finally
          if dumStandard in modes then DoRollbackTransaction(Connection);
        end;
        if lDoRaise then raise;
      end;
    end;
  finally
    lDeltaStructs.Free;
  end;
end;

procedure TDataAbstractService.UpdateData_ExportedDataTables(
  aDeltaStructs: TDADeltaStructList);
var
  i: integer;
begin
  // Processes the delta for exported tables (BP=nil)
  for i := 0 to aDeltaStructs.Count-1 do begin
    if aDeltaStructs[i].BusinessProcessor = nil then
      ExportedDataTables_MergeDelta(aDeltaStructs[i].Delta);
  end;
end;

function TDataAbstractService.LDA_InternalExecuteCommandEx(
  const aCommandName: String; const aInputParameters: DataParameterArray;
  out aOutputParameters: DataParameterArray): integer;
begin
  Result := InternalExecuteCommandEx(aCommandName,aInputParameters,aOutputParameters, True);
end;

procedure TDataAbstractService.LDA_InternalGetData(
  const aTableNameArray: StringArray;
  const aTableRequestInfoArray: TableRequestInfoArray;
  aStreamer: TDADataStreamer);
begin
  InternalGetData(aTableNameArray, aTableRequestInfoArray, aStreamer, True);
end;

function TDataAbstractService.LDA_InternalGetSchema(
  const aFilter: string): string;
begin
  Result := InternalGetSchema(aFilter, True);
end;

procedure TDataAbstractService.LDA_InternalUpdateData(aDeltaList: IDeltaArray);
begin
  InternalUpdateData(aDeltaList, True);
end;

procedure TDataAbstractService.UpdateData_StandardMode(
  aDeltaStructs: TDADeltaStructList);
var
  i: integer;
  lProcessedDeltas: TStringList;
  lStruct: TDADeltaStruct;
begin
  if (ServiceSchema.UpdateRules.Count = 0) and ProcessDeltasWithoutUpdateRules then begin
    // Processes them in order, from first to last delta sent
    for i := 0 to aDeltaStructs.Count-1 do
      BP_ProcessChanges(aDeltaStructs[i],AllChanges, True);
  end
  else begin
    lProcessedDeltas := TStringList.Create;
    try
      for i := 0 to (ServiceSchema.UpdateRules.Count-1) do begin
        // Processes them in the order defined in the schema
        lStruct := aDeltaStructs.FindStruct(ServiceSchema.UpdateRules[i].DatasetName);
        if assigned(lStruct) then begin
          if lStruct.BusinessProcessor = nil then Continue;
          // Adds the dataset name to the list of processed deltas. Those that don't have update rules will be processed later
          lProcessedDeltas.Add(lStruct.Delta.LogicalName);

          BP_ProcessChanges(lStruct,ServiceSchema.UpdateRules[i].ChangeTypes, ctInsert in ServiceSchema.UpdateRules[i].ChangeTypes);
        end;
      end;
      // Processes the deltas for which update rules were not defined
      if (ProcessDeltasWithoutUpdateRules) then begin
        for i := 0 to aDeltaStructs.Count-1 do begin
          lStruct := aDeltaStructs[i];
          // Skips if already processed
          if (lProcessedDeltas.IndexOf(lStruct.Delta.LogicalName)>=0) then Continue;

          BP_ProcessChanges(lStruct,AllChanges, True);
        end;
      end;
    finally
      lProcessedDeltas.Free;
    end;
  end;
end;

procedure TDataAbstractService.ValidateDeltaStruct(
  aDeltaStructs: TDADeltaStructList; aCanAccessPrivateTables: Boolean);
var
  i: integer;
  lDs: TDADataset;
begin
  for i := 0 to aDeltaStructs.Count-1 do begin
    if ServiceSchema <> nil then
      lDs := ServiceSchema.FindDataset(aDeltaStructs[i].Delta.LogicalName)
    else
      lDs := nil;
    if lDs <> nil then begin
      DAError(not (aCanAccessPrivateTables or lDs.IsPublic),err_SIsNotAccessible,[lDs.Name]);
      DAError(lDs.ReadOnly,err_SIsReadOnly,[lDs.Name]);
    end;
  end;
end;

function TDataAbstractService.GetTableSchema(const aTableNameArray: StringArray): string;

  function CreateDatasetFromIDADataset(aRef: IDADataset): TDADataset;
  begin
    Result := TDADataset.Create(nil);
    Result.Name := aRef.LogicalName;
    Result.Fields.AssignFieldCollection(aRef.Fields);
    Result.Params.AssignParamCollection(aRef.Params);
  end;

var
  lxml: IXMLDocument;
  i: integer;
  lDataSet: TDADataset;
  lDataTableRef: TDADataTableReference;
  lNeedDeleteDataset: Boolean;
  lTableName: string;
begin
  DAValidateProperty(not AllowSchemaAccess,Name,err_SchemaAccessHasBeenDisabledGetTableSchema);
  DAValidateProperty(not Assigned(ServiceSchema) and (fExportedDataTables.Count=0),Name,err_ServiceSchemaPropertyIsNotAssignedAndNoDataTablesAreExported);

  // Returns the schema
  lxml := NewROXmlDocument;
  lxml.New('DataTables');
  try
    for i := 0 to aTableNameArray.Count - 1 do begin
      lTableName := {$IFNDEF UNICODE}UTF8ToString{$ENDIF}(aTableNameArray[i]);
      CheckUTF8Decode(aTableNameArray[i], lTableName);
      lDataSet := nil;
      if (fExportedDataTables.Count > 0) then begin
        lDataTableRef := fExportedDataTables.FindByName(lTableName);
        if lDataTableRef <> nil then lDataSet := CreateDatasetFromIDADataset(lDataTableRef.Dataset);
      end;
      lNeedDeleteDataset := lDataSet <> nil;
      if not lNeedDeleteDataset and (ServiceSchema <> nil) then
         lDataSet := ServiceSchema.Datasets.DatasetByName(lTableName);
      try
        if lDataSet <> nil then begin
          // if Assigned(fOnBeforeGetDatasetSchema) then fOnBeforeGetDatasetSchema(Self, lDataset as IDADataset);
          SaveObjectToXMLNode(lDataSet, lxml.DocumentNode.Add('SchemaDataTable'), [], [], False);
          //if Assigned(fOnAfterGetDatasetSchema) then fOnAfterGetDatasetSchema(Self, lDataset as IDADataset);
          DAError(not (lDataSet.IsPublic),err_SIsNotAccessible,[lDataset.Name]);
        end;
      finally
        if lNeedDeleteDataset then lDataSet.Free;
      end;
    end;
    Result := {$IFNDEF UNICODE}UTF8Encode{$ENDIF}(lxml.DocumentNode.XML);
  finally
    lxml := nil;
  end;
end;

function TDataAbstractService.InternalExecuteCommandEx(const aCommandName: String;
  const aInputParameters: DataParameterArray; out aOutputParameters: DataParameterArray; aCanAccessPrivateTables: Boolean):integer;
var
  j: integer;
  lCommand: IDASQLCommand;
  lCommandSchema: TDASQLCommand;
  lConnection: IDAConnection;
  lp: DataParameter;
  lRec:TDAServiceExchangeData;
begin
  FillChar(lRec, SizeOf(lRec),0);
  SetupScriptProvider;
  if Assigned(aInputParameters) then ParseParameters(aInputParameters,@lRec);

  lCommandSchema := ServiceSchema.Commands.SQLCommandByName(aCommandName);
  if assigned(lCommandSchema) then DAError(not (aCanAccessPrivateTables or lCommandSchema.IsPublic),err_SIsNotAccessible,[lCommandSchema.Name]);

  lConnection := GetConnectionForObject(aCommandName);
  DoValidateCommandAccess(lConnection, aCommandName, @lRec);
  DoStartTransaction(lConnection);
  if lConnection = nil then begin
    lConnection := GetConnectionForObject(aCommandName);
    DoStartTransaction(lConnection);
  end;
  try
    lCommand := ServiceSchema.NewCommand(lConnection, aCommandName, lRec.lParamNames, lRec.lParamValues, false);

    if Assigned(fOnBeforeExecuteCommand) then fOnBeforeExecuteCommand(self, lCommand);
    DoScriptProvider_BeforeExecuteCommand(lCommand.SQL,aCommandName,aInputParameters);

    result := lCommand.Execute;

    DoScriptProvider_AfterExecuteCommand(lCommand.SQL,aCommandName,aInputParameters,Result);
    if assigned(fOnAfterExecuteCommand) then fOnAfterExecuteCommand(self, lCommand, Result);

    aOutputParameters := DataParameterArray.Create;
    for j := 0 to lCommand.Params.Count -1 do begin
      if (lCommand.Params[j].ParamType <> daptUnknown) and (lCommand.Params[j].ParamType <> daptInput) then begin
        lp := aOutputParameters.Add;
        lp.Name := {$IFNDEF UNICODE}AnsiToUtf8{$ENDIF}(lCommand.Params[j].Name);
        lp.Value := lCommand.Params[j].Value;
      end;
    end;
    DoCommitTransaction(lConnection);
  except
    DoRollbackTransaction(lConnection);
    raise;
  end;
end;

procedure TDataAbstractService.InternalGetData(
  const aTableNameArray: StringArray;
  const aTableRequestInfoArray: TableRequestInfoArray;
  aStreamer: TDADataStreamer;
  aCanAccessPrivateTables: Boolean);
var
  i: integer;
  lHasTransaction: boolean;
  lDataTableRef: TDADataTableReference;
  lDataTable: TDADataset;
  ltri: TableRequestInfo;
  lRec: TDAServiceExchangeData;
  lProcessed: Boolean;
  lDataset: IDADataset;
begin
  FillChar(lRec, SizeOf(lRec),0);
  SetupScriptProvider;
  if not assigned(aTableNameArray) or (aTableNameArray.Count = 0) then exit;

  DAError(assigned(aTableRequestInfoArray) and (aTableNameArray.Count <> aTableRequestInfoArray.Count),
    err_NumberOfItemsPassedToATableNameArrayAndATableRequestInfoArrayD);

  DoScriptProvider_BeforeGetData(aTableNameArray,aTableRequestInfoArray);
  lHasTransaction := false;
  try
    for i := 0 to (aTableNameArray.Count-1) do begin
      lRec.lTableName := {$IFNDEF UNICODE}UTF8ToString{$ENDIF}(aTableNameArray[i]);
      CheckUTF8Decode(aTableNameArray[i], lRec.lTableName);
      lRec.lOptions := [woRows];
      lRec.lMaxRecords := -1;
      SetLength(lRec.lDynSelectFields,0);
      lRec.lWhereClause := '';
      lRec.lColumnSortingStr := '';
      lRec.lColumnSortingMode := True;
      lRec.lUserFilter := '';

      if assigned(aTableRequestInfoArray) and assigned(aTableRequestInfoArray[i]) then begin
        ltri :=aTableRequestInfoArray[i];
        // TableRequestInfo with QB
        if ltri is TableRequestInfoWithQueryBuilder then begin
          InternalGetData_QueryBuilder(lRec.lTableName,ltri,aStreamer);
          Continue;
        end;

        // v6 TableRequestInfo
        if ltri is TableRequestInfoV6 then
          DAError(true, err_DASQLExecutionIsNotSupportedYet);

        // v4 TableRequestInfo
        if ltri.IncludeSchema then lRec.lOptions := lRec.lOptions+[woSchema];
        lRec.lMaxRecords := ltri.MaxRecords;
        lRec.lUserFilter := aTableRequestInfoArray[i].UserFilter;
        ParseParameters(ltri.Parameters, @lRec);

        // v5  TableRequestInfo
        if ltri is TableRequestInfoV5 then
          ParseTableRequestInfoV5(TableRequestInfoV5(ltri), @lRec);
      end;

      if (fExportedDataTables.Count > 0) and Assigned(fExportedDataTables.FindByName(lRec.lTableName)) then begin
       // lConnection := nil;
      end
      else begin
        Check2;
        //lConnection := GetConnectionForObject(aTableNameArray[i]);
      end;

      DoValidateDataTableAccess(lRec.lTableName, @lRec);

      lProcessed := False;
      if (fExportedDataTables.Count > 0) then begin
        lDataTableRef := fExportedDataTables.FindByName(lRec.lTableName);
        if assigned(lDataTableRef) then begin
          lDataset := lDataTableRef.Dataset;
          if assigned(lDataset) then begin
            // ExportedDataTables mode is detected!
            lProcessed := True;
            GetData_ExportedDataTables(lDataset,@lRec, aStreamer);
            lDataset := nil;
          end;
        end;
      end;

      if not lProcessed then begin
        // Create transaction, if needed
        if not lHasTransaction then begin
          Connection;
          lHasTransaction := DoStartTransaction(fConnection);
        end;

        lDataTable := ServiceSchema.FindDataset(lRec.lTableName);
        if assigned(lDataTable) then DAError(not (aCanAccessPrivateTables or lDataTable.IsPublic),err_SIsNotAccessible,[lDataTable.Name]);

        { Unions }
        if lDataTable is TDAUnionDataTable then begin
          GetData_UnionDataTable(@lRec, aStreamer);
        end
        { Joins }
        else if lDataTable is TDAJoinDataTable then begin
          raise EDAException.Create('TODO: Joined Data Tables are not implemented in this release, yet.');
        end
        { Plain Data Tables }
        else begin
          GetData_StandardMode(@lRec, aStreamer);
        end;
      end;
    end; { for }
    if lHasTransaction then DoCommitTransaction(Connection);
  except
    if lHasTransaction then DoRollbackTransaction(Connection);
    raise;
  end;
  DoScriptProvider_AfterGetData(aTableNameArray,aTableRequestInfoArray);
end;

type
  TMyDatasetCollection = class(TDADatasetCollection)
  end;

function TDataAbstractService.InternalGetDatasetScripts(
  const DatasetNames: string; aCanAccessPrivateTables: Boolean): string;
var
  names : TStringList;
  i : integer;
  ds : TDADataset;
  lResult: UnicodeString;
  lLogicalName: string;
  ld:TMyDatasetCollection;
begin
  lresult := '';
  names := TStringList.Create;
  try
    names.CommaText := {$IFNDEF UNICODE}UTF8ToString{$ENDIF}(DatasetNames);
    CheckUTF8Decode(DatasetNames,names.CommaText);
    for i := 0 to (names.Count-1) do begin
      // scripts for externaltables is not allowed
      lLogicalName := names[i];
      if fExportedDataTables.FindByName(lLogicalName) <> nil then continue;
      ds := ServiceSchema.Datasets.FindDatasetByName(lLogicalName);
      if not assigned(ds) then
        ds := ServiceSchema.UnionDataTables.FindUnionDataTableByName(lLogicalName);
      if not assigned(ds) then
        ds := ServiceSchema.JoinDataTables.FindJoinTableByName(lLogicalName);
      ld := TMyDatasetCollection(ServiceSchema.Datasets);
      DAError(ds = nil, err_CannotFindItem, [ld.ItemName, lLogicalName, ld.ClassName]);
      DAError(not (aCanAccessPrivateTables or ds.IsPublic), err_SIsNotAccessible, [lLogicalName]);

      lresult := lresult+Format('<%s Language="%s"><![CDATA[%s]]></%s>', [
          lLogicalName,
          ROGetEnumName(TypeInfo(TROSEScriptLanguage), Ord(ds.BusinessRulesClient.ScriptLanguage)),
          ds.BusinessRulesClient.Script,
          lLogicalName]);
    end;

    result := {$IFNDEF UNICODE}UTF8Encode{$ENDIF}('<Scripts>'+lresult+'</Scripts>');
  finally
    FreeAndNIL(names);
  end;
end;

procedure TDataAbstractService.GetData_ExportedDataTables(const aDataset: IDADataset;
  const aRec: PDAServiceExchangeData; aStreamer: TDADataStreamer);
var
  lFilter: string;
  lEditableDataset: IDAEditableDataset;
begin
  lFilter:={$IFNDEF UNICODE}UTF8ToString{$ENDIF}(aRec^.lUserFilter);
  CheckUTF8Decode(aRec^.lUserFilter,lFilter);
  DAError(Trim(lFilter)<>'',err_WHEREClausesAreNotSupportedOnDataFromExportedDataTables);

  if (woSchema in aRec^.lOptions) then DoBeforeGetDatasetSchema(aDataset);
  if (woRows in aRec^.lOptions) then DoBeforeGetDatasetData(aDataset, (woSchema in aRec^.lOptions), aRec^.lMaxRecords);

  if aDataset.Active and (aRec^.lMaxRecords = -1) then begin
    if aDataset.QueryInterface(IDAEditableDataset,lEditableDataset) = s_ok then begin
      lEditableDataset.First;
      lEditableDataset := nil;
    end
    else begin
      aDataset.Close;
    end;
  end;

  if not aDataset.Active then aDataset.Open;
  aStreamer.WriteDataset(aDataset, aRec^.lOptions, aRec^.lMaxRecords,aRec^.lDynSelectFields);

  if (woRows in aRec^.lOptions) and Assigned(fOnAfterGetDatasetData) then fOnAfterGetDatasetData(self, aDataset, (woSchema in aRec^.lOptions), aRec^.lMaxRecords);
  if (woSchema in aRec^.lOptions) and Assigned(fOnAfterGetDatasetSchema) then fOnAfterGetDatasetSchema(self, aDataset);
end;

procedure TDataAbstractService.GetData_StandardMode(
  const aRec: PDAServiceExchangeData; aStreamer: TDADataStreamer);
var
  lDataSet: IDADataset;
  lWhereSup: IDALegacyWhereSupport;
  lFilter: string;
  k: integer;
begin
  lDataSet := ServiceSchema.NewDataset(
    GetConnectionForObject(aRec^.lTableName),
    aRec^.lTableName,
    aRec^.lParamNames,
    aRec^.lParamValues,
    aRec^.lDynSelectFields,
    aRec^.lWhereClause,
    False,
    '',
    fAllowAllFieldsInDynamicWhere,
    aRec^.lColumnSortingStr,
    aRec^.lColumnSortingMode,
    aRec^.lMaxRecords
    );
  try
    if (woSchema in aRec^.lOptions) then DoBeforeGetDatasetSchema(lDataset);
    if (woRows in aRec^.lOptions) then DoBeforeGetDatasetData(lDataset, (woSchema in aRec^.lOptions), aRec^.lMaxRecords);

    if (aRec^.lUserFilter <> '') then begin
      lFilter:={$IFNDEF UNICODE}UTF8ToString{$ENDIF}(aRec^.lUserFilter);
      CheckUTF8Decode(aRec^.lUserFilter,lFilter);
      if (Trim(lFilter)<>'') then begin
        DAValidateProperty(not AllowWhereSQL,Name,err_PassingOfClearTextWHEREClausesHasBeenDisabledGetData);
        if Supports(lDataSet,IDALegacyWhereSupport, lWhereSup) then begin
          lWhereSup.WhereClause := lFilter;
          lWhereSup := nil;
        end;
        for k := 0 to High(aRec^.lParamValues) do
          lDataSet.ParamByName(aRec^.lParamNames[k]).Value := aRec^.lParamValues[k];
      end;
    end;
    lDataSet.Open;

    aStreamer.WriteDataset(lDataset, aRec^.lOptions, aRec^.lMaxRecords,aRec^.lDynSelectFields);

    if (woRows in aRec^.lOptions) and Assigned(fOnAfterGetDatasetData) then fOnAfterGetDatasetData(self, lDataset, (woSchema in aRec^.lOptions), aRec^.lMaxRecords);
    if (woSchema in aRec^.lOptions) and Assigned(fOnAfterGetDatasetSchema) then fOnAfterGetDatasetSchema(self, lDataset);
  finally
    lDataSet := nil;
  end;
end;

procedure TDataAbstractService.GetData_UnionDataTable(const aRec: PDAServiceExchangeData;aStreamer: TDADataStreamer);
var
  lConnection: IDAConnection;
  lDataSet: IDADataset;
  lFilter: string;
begin
  if (aRec^.lUserFilter <> '') then begin
    lFilter:={$IFNDEF UNICODE}UTF8ToString{$ENDIF}(aRec^.lUserFilter);
    CheckUTF8Decode(aRec^.lUserFilter,lFilter);
    DAError(Trim(lFilter)<>'',err_PassingOfClearTextWHEREClausesIsNotSupportedForUNIONSGetDa);
  end;

  lConnection := Connection;
  try
    lDataSet := ServiceSchema.NewUnionDataset(
      lConnection,
      aRec^.lTableName,
      aRec^.lParamNames,
      aRec^.lParamValues,
      aRec^.lDynSelectFields,
      aRec^.lWhereClause,
      False,
      False,
      Self.fAllowAllFieldsInDynamicWhere,
      aRec^.lColumnSortingStr,
      aRec^.lColumnSortingMode
      );
    if (woSchema in aRec^.lOptions) then DoBeforeGetDatasetSchema(lDataset);
    if (woRows in aRec^.lOptions) then DoBeforeGetDatasetData(lDataset, (woSchema in aRec^.lOptions), aRec^.lMaxRecords);

    lDataSet.Open;

    aStreamer.WriteDataset(lDataset, aRec^.lOptions, aRec^.lMaxRecords, aRec^.lDynSelectFields);

    if (woRows in aRec^.lOptions) and Assigned(fOnAfterGetDatasetData) then fOnAfterGetDatasetData(self, lDataset, (woSchema in aRec^.lOptions), aRec^.lMaxRecords);
    if (woSchema in aRec^.lOptions) and Assigned(fOnAfterGetDatasetSchema) then fOnAfterGetDatasetSchema(self, lDataset);
  finally
    lDataSet := nil;
    lConnection := nil;
  end;
end;

function TDataAbstractService.GetSchema(const aFilter: string): string;
begin
  DAValidateProperty(not AllowSchemaAccess,Name,err_SchemaAccessHasBeenDisabledGetSchema);

  Result := InternalGetSchema(aFilter, False);
end;


function TDataAbstractService.GetScriptContext: IDAServerScriptContext;
var
  ln: IDANativeAccess;
begin
  if fScriptContext = nil  then begin
    Result := TDAScriptContext.Create(Self, InternalGetSession);
  end
  else begin
    if fScriptContext.QueryInterface(IDANativeAccess, ln) = S_OK then begin
      TDAScriptContext(ln.Native).ChangeSession(InternalGetSession);
      ln := nil;
    end;
    Result := fScriptContext;
  end;
end;

function TDataAbstractService.GetServiceSchema: TDASchema;
begin
  Result := fServiceSchema;
  if not (csDesigning in ComponentState) then SetupScriptProvider;
end;

function TDataAbstractService.LDA_GetDatasetScripts(
  const DatasetNames: string): string;
begin
  Result := InternalGetDatasetScripts(DatasetNames, True);
end;

function TDataAbstractService.LDA_GetServiceSchema: TDASchema;

  procedure MergeDatatablesToSchema;
  var
    i,j : integer;
    ref : TDADataset;
    dt : IDADataset;
  begin
    j:=0;
    for i := 0 to fExportedDataTables.Count-1 do
      if fExportedDataTables[i].IsValidReference then begin
        dt := fExportedDataTables[i].Dataset;
        ref := Result.Datasets.Add;
        ref.Name := dt.LogicalName;
        ref.Fields.AssignFieldCollection(dt.Fields);
        ref.Params.AssignParamCollection(dt.Params);
        ref.Index := j;
        inc(j);
      end;
  end;

begin
  DAValidateProperty(not Assigned(ServiceSchema) and (fExportedDataTables.Count=0),Name,err_ServiceSchemaPropertyIsNotAssignedAndNoDataTablesAreExported);
  Result := TDASchema.Create(nil);
  Result.Assign(ServiceSchema);
  MergeDatatablesToSchema;
end;

procedure TDataAbstractService.Loaded;
var
  lScriptProvider: IDAScriptProvider;
begin
  if fScriptProvider <> nil then begin
    lScriptProvider := fScriptProvider;
    fScriptProvider := nil;
    ScriptProvider := lScriptProvider;
  end;
  inherited;
end;

function TDataAbstractService.GetCommandSchema(const aCommandNameArray: StringArray): string;
var
  lxml: IXMLDocument;
  i: integer;
  lSQLCommand: TDASQLCommand;
  lCommand: string;
begin
  DAValidateProperty(not AllowSchemaAccess,Name,err_SchemaAccessHasBeenDisabledGetCommandSchema);
  DAValidateProperty(not Assigned(ServiceSchema),Name,err_ServiceSchemaPropertyIsNotAssigned);

  // Returns the schema
  lxml := NewROXmlDocument;
  lxml.New('Commands');
  try
    for i := 0 to aCommandNameArray.Count - 1 do begin
      lCommand:={$IFNDEF UNICODE}UTF8ToString{$ENDIF}(aCommandNameArray[i]);
      CheckUTF8Decode(aCommandNameArray[i], lCommand);
      lSQLCommand:=ServiceSchema.Commands.SQLCommandByName(lCommand);
      if lSQLCommand <> nil then begin
        DAError(not lSQLCommand.IsPublic,err_SIsNotAccessible,[lSqlCommand.Name]);
        SaveObjectToXMLNode(lSQLCommand, lxml.DocumentNode.Add('SchemaCommand'), [], [], False);
      end;
    end;
    result := {$IFNDEF UNICODE}UTF8Encode{$ENDIF}(lxml.DocumentNode.XML);
  finally
    lxml := nil;
  end;
end;

{ IDataAbstractService: Data Access }

function TDataAbstractService.GetData(const aTableNameArray: StringArray; const aTableRequestInfoArray: TableRequestInfoArray): Binary;
begin
  DAValidateProperty(not AllowDataAccess,Name,err_DataAccessHasBeenDisabledGetData);

  result := nil;
  if not assigned(aTableNameArray) or (aTableNameArray.Count = 0) then exit;

  DAError(assigned(aTableRequestInfoArray) and (aTableNameArray.Count <> aTableRequestInfoArray.Count),
    err_NumberOfItemsPassedToATableNameArrayAndATableRequestInfoArrayD);

  Check(True);

  result := Binary.Create;
  Result.CapacityIncrement := ServiceDataStreamer.BufferSize;
  try
    ServiceDataStreamer.Initialize(result, aiWrite);
    try
      InternalGetData(aTableNameArray,aTableRequestInfoArray, ServiceDataStreamer, False);
    finally
      ServiceDataStreamer.Finalize();
    end;
  except
    FreeAndNIL(result);
    raise;
  end;
end;

procedure TDataAbstractService.InternalGetData_QueryBuilder(aTableName: String;
  aRequestInfo: TableRequestInfo; aStreamer: TDADataStreamer);
var
  lDataset: IDADataset;
  lCount: boolean;
  lqb1: TDAQueryBuilder;
  lRec: TDAServiceExchangeData;

  procedure _WriteQBDataset;
  var
    i: integer;
    ltable: TDADataTable;
    lskipselect: integer;
    lEditableDataset: IDAEditableDataset;
    lf: TDAField;
  begin
    try
      if (woSchema in lRec.lOptions) then DoBeforeGetDatasetSchema(lDataset);
      if (woRows in lRec.lOptions) then DoBeforeGetDatasetData(lDataset, (woSchema in lRec.lOptions), aRequestInfo.MaxRecords);

      if lDataSet.Active and (aRequestInfo.MaxRecords = -1) then begin
        if lDataSet.QueryInterface(IDAEditableDataset,lEditableDataset) = s_ok then
          lEditableDataset.First
        else
          lDataSet.Close;
      end;

      lDataSet.Open();
      if lCount then begin
        i := 0;
        while not lDataset.Eof do begin
          inc(i);
          lDataset.Next;
        end;
        ltable := TDAMemDataTable.Create(nil);
        try
          ltable.LogChanges:=False;
          ltable.RemoteFetchEnabled := False;
          ltable.LogicalName := lDataset.LogicalName;
          lf :=  ltable.Fields.Add;
          lf.Name := 'ColumnALL';
          lf.DataType:= datInteger;
          ltable.Open;
          ltable.Insert;
          ltable.Fields[0].AsInteger := i;
          ltable.Post;
          aStreamer.WriteDataset(ltable, lRec.lOptions, -1,[]);
        finally
          ltable.Free;
        end;
      end
      else begin
        if qboUseSelectSkip in lqb1.Options then begin
          lskipselect :=lqb1.SelectSkip;
          while (lskipselect > 0) and not lDataset.Eof do begin
            dec(lskipselect);
            lDataset.Next;
          end;
        end;
        aStreamer.WriteDataset(lDataset, lRec.lOptions, aRequestInfo.MaxRecords, lRec.lDynSelectFields);
      end;
      if (woRows in lRec.lOptions) and Assigned(fOnAfterGetDatasetData) then fOnAfterGetDatasetData(self, lDataset, (woSchema in lRec.lOptions), aRequestInfo.MaxRecords);
      if (woSchema in lRec.lOptions) and Assigned(fOnAfterGetDatasetSchema) then fOnAfterGetDatasetSchema(self, lDataset);
    finally
      lDataSet := nil;
    end;
  end;

var
  lSQLText: UnicodeString;
  lHandleTransaction: Boolean;
  i: integer;
  lParam: TDAParam;
  lConnection: IDAConnection;
  ds: TDADataset;
  st: TDAStatement;
  lqb: TDAQueryBuilder;
  fld: TDAField;
  lDataTableRef: TDADataTableReference;
  lxml: UnicodeString;
  lFilter: string;
  lFiltered: boolean;
  lActive: boolean;
  lExpTable: TDADataTable;
  lWhereFilter: string;
  lsi: TDASelectItem;
begin
  FillChar(lRec, SizeOf(lRec),0);
  DAValidateProperty(not AllowDataAccess,Name,err_DataAccessHasBeenDisabledGetData);
  DAError(not (aRequestInfo is TableRequestInfoWithQueryBuilder),err_SClassIsNotSupportedHere,[aRequestInfo.ClassName]);
  lRec.lOptions := [woRows];
  if aRequestInfo.IncludeSchema then lRec.lOptions := lRec.lOptions+[woSchema];

  if (fExportedDataTables.Count > 0) and Assigned(fExportedDataTables.FindByName(aTableName)) then begin
    //nothing
  end
  else begin
    Check2;
  end;

  ParseParameters(aRequestInfo.Parameters, @lRec);
  DoValidateDataTableAccess(aTableName, @lRec);
  lqb1 := TableRequestInfoWithQueryBuilder(aRequestInfo).QueryBuilder;
  DAError(lqb1 = nil, err_QueryBuilderMustBeAssigned);

  SetLength(lRec.lDynSelectFields,0);
  if not (qboGenerateSimpleSelect in lqb1.Options) then begin
    DAValidateProperty(not AllowDynamicSelect, Name,err_DynamicSelectSupportHasBeenDisabledGetData);
    SetLength(lRec.lDynSelectFields,lqb1.Select.Count);
    for i := 0 to lqb1.Select.Count-1 do
      lRec.lDynSelectFields[i] := TDASelectItem(lqb1.Select.Items[i]).FieldName;
  end;
  lCount:= False;
  lDataTableRef:=nil;
  if (fExportedDataTables.Count > 0) and Assigned(fExportedDataTables.FindByName(aTableName)) then begin
    lDataTableRef := fExportedDataTables.FindByName(aTableName);
    if assigned(lDataTableRef) then lDataSet := lDataTableRef.Dataset;
  end;
  if lDataSet <> nil then begin
    DAError(not (lDataTableRef.DataTable is TDADataTable),err_TDatasetDescendantsIsNotSupportedAsExportedDataTablesSources);

    lExpTable := TDADataTable(lDataTableRef.DataTable);
    lFilter := lExpTable.Filter;
    lFiltered := lExpTable.Filtered;
    lxml := lExpTable.DynamicWhere.Xml;
    lActive := lExpTable.Active;
    try
      if not lExpTable.Active then
        lExpTable.DynamicWhere.Xml := lqb1.Where.Xml
      else begin
        lWhereFilter :=ConvertDynamicWhereToFilter(lqb1.Where.Expression, lRec.lParamNames, lRec.lParamValues);
        if lWhereFilter <> '' then begin
          if lExpTable.Filtered then begin
            lExpTable.Filter := '('+lExpTable.Filter+') and ('+lWhereFilter+')';
          end
          else begin
            lExpTable.Filter := lWhereFilter;
            if lWhereFilter <> '' then lExpTable.Filtered := True;
          end;
        end;
      end;
      _WriteQBDataset;
    finally
      lExpTable.Active := lActive;
      lExpTable.Filtered := lFiltered;
      lExpTable.Filter := lFilter;
      lExpTable.DynamicWhere.Xml := lxml;
    end;
  end
  else begin
    lConnection:= GetConnectionForObject(aTableName);
    ds := ServiceSchema.FindDataset(aTableName);
    if ds <> nil then begin
      if ds is TDAUnionDataTable then begin
        lCount := qboUseSelectCount in lqb1.Options;
        DAError(lqb1.OrderBy.Count > 0,err_OrderbyIsnTSupportedForUnionDatatables);
        lDataSet := ServiceSchema.NewUnionDataset(
          Connection,
          aTableName,
          lRec.lParamNames,
          lRec.lParamValues,
          lRec.lDynSelectFields,
          lqb1.Where.Xml,
          False,
          False,
          fAllowAllFieldsInDynamicWhere,
          lqb1.OrderBy
          );
      end
      else if ds is TDAJoinDataTable then begin
        raise EDAException.Create('TODO: Joined Data Tables are not implemented in this release, yet.');
      end
      else begin// plain tables
        st := ServiceSchema.FindCommandStatement(lConnection, ds);
        case st.StatementType of
          stAutoSQL: begin
            lqb := lConnection.GetQueryBuilder;
            try
              lqb.Assign(lqb1);
              lqb.Options := lqb.Options - [qboUseSelectSkip];
              if lqb.Where.Expression <> nil then Where_RemapTableNames(lqb.Where.Expression, lqb.MainTable.MasterTable, st.TargetTable);
              for I := 0 to lqb.Select.Count - 1 do begin
                lsi := TDASelectItem(lqb.Select.Items[i]);
                if lsi.TableName = lqb.MainTable.MasterTable then
                  lsi.TableName := st.TargetTable;
              end;

              lqb.MainTable.MasterTable := st.TargetTable;
              lqb.ColumnMapping := st.ColumnMappings;
              lqb.Connection := lConnection;
              lSQLText := lqb.GenerateSelectSQL;
              DoValidateDirectSQLAccess(lConnection, lSQLText, @lRec);
              lDataSet := lConnection.NewDataset(lSQLText,aTableName);
              lDataset.DynamicWhere.Xml := lqb.Where.Xml;
              if not (qboUseSelectCount in lqb1.Options) then begin
                lDataSet.Fields.DataDictionary := ServiceSchema.DataDictionary;
                for I := 0 to lqb1.Select.Count - 1 do begin
                  fld :=  ds.FieldByName(TDASelectItem(lqb1.Select.Items[i]).FieldName);
                  if fld <> nil then
                    lDataset.Fields.Add.AssignField(fld);
                end;
                if lDataset.Fields.Count = 0 then lDataSet.Fields.AssignFieldCollection(ds.Fields);

                for i := 0 to (st.ColumnMappings.Count - 1) do begin
                  fld := lDataset.FindField(st.ColumnMappings[i].DatasetField);
                  if fld <> nil then begin
                    fld.TableField := st.ColumnMappings[i].TableField;
                    fld.SQLOrigin := st.ColumnMappings[i].SQLOrigin;
                  end;
                end;
              end;
              for I := 0 to Length(lRec.lParamNames) - 1 do begin
                lParam := lDataset.Params.Add;
                lParam.Name := lRec.lParamNames[i];
                lParam.Value := lRec.lParamValues[i];
              end;
            finally
             lQb.Free;
            end;
          end;
          stSQL: begin
            lCount := qboUseSelectCount in lqb1.Options;
            lDataSet := ServiceSchema.NewDataset(
              lConnection,
              aTableName,
              lRec.lParamNames,
              lRec.lParamValues,
              lRec.lDynSelectFields,
              lqb1.Where.Xml,
              False,
              '',
              fAllowAllFieldsInDynamicWhere,
              lqb1.OrderBy,
              lrec.lMaxRecords
              );
          end;
        else
          DAError(True,err_UnsupportedStatementType);
        end;
      end;
      lHandleTransaction := not fConnection.InTransaction;
      if lHandleTransaction then DoStartTransaction(fConnection);
      try
        _WriteQBDataset;
        DoCommitTransaction(Connection);
      except
        DoRollbackTransaction(Connection);
        raise;
      end;
    end;
  end;
end;

procedure TDataAbstractService.UninstallScriptProvider;
begin
  if fScriptProvider <> nil then fScriptProvider.Context := nil;
  fScriptContext := nil;
end;

function TDataAbstractService.UnpackDeltas(aDeltaList: IDeltaArray; DeltaStructList: TDADeltaStructList): TDADeltasModes;
var
  i: integer;
  lDeltaName: string;
  lBizProc: TDABusinessProcessor;
  ltabRef: TDADataTableReference;
begin
  result := [];
  if (Length(aDeltaList) = 0) then Exit;
  for i := 0 to Length(aDeltaList) - 1 do begin
    lDeltaName := aDeltaList[i].LogicalName;
    Fix_NET_issue_with_AutoInc_at_Insert(aDeltaList[i]);
    // try to find corresponded ExportedDataTable
    if (ExportedDataTables.Count >0) then begin
      ltabRef := ExportedDataTables.FindByName(lDeltaName);
      if Assigned(ltabRef) then begin
        // for ExportedDataTables , BP=nil
        DeltaStructList.Add(aDeltaList[i], nil);
        Result:=Result+[dumExported];
        Continue;
      end;
    end;
    // plain mode: Find user defined BP or create a new one
    lBizProc := FindUserDefinedBP(lDeltaName,aDeltaList[i].GetDelta.ReducedDelta);
    if lBizProc = nil then lBizProc := CreateBP(lDeltaName);
    DeltaStructList.Add(aDeltaList[i], lBizProc);

    Result:=Result+[dumStandard];
  end;
  if not (dumStandard in Result) then exit; // nothing to process
  Check2; // Connection & ServiceSchema should be assigned

  { Sets the master/detail relationships }
  if (ServiceSchema.Relationships.Count>0) then SetupMasterDetails(DeltaStructList);
end;

function TDataAbstractService.UnpackSimpleDeltas(
  const aDelta: SimpleDeltaArray): IDeltaArray;
var
  i,j,k: integer;
  lDelta: IDADelta;
  lDataset: TDADataset;
  s: string;
  lRow : SimpleDeltaChange;
  lDeltaRow: TDADeltaChange;
  lColumns: array of TDAField;
  ltype : TDAChangeType;
begin
  SetLength(Result,aDelta.Count);
  for i :=  0  to aDelta.Count-1 do begin
    s:={$IFNDEF UNICODE}UTF8ToString{$ENDIF}(aDelta[i].TableName);
    lDataset := ServiceSchema.FindDataset(s);
    if lDataset = nil then ServiceSchema.Datasets.DatasetByName(s); // it will raise proper exception
    DAError(not lDataset.IsPublic,err_SIsNotAccessible, [s]);
    DAError(lDataset.ReadOnly,err_SIsReadOnly, [s]);
    SetLength(lColumns,aDelta[i].Fields.Count);
    lDelta := NewDelta(s);
    Result[i] := lDelta;
    for j := 0 to aDelta[i].Fields.Count-1 do begin
      lColumns[j] := lDataset.Fields.FieldByName({$IFNDEF UNICODE}UTF8ToString{$ENDIF}(aDelta[i].Fields[j]));
      lDelta.AddFieldName(lColumns[j].Name,lColumns[j].DataType);
      if lColumns[j].InPrimaryKey then
        lDelta.AddKeyFieldName(lColumns[j].Name);
    end;
    for j:=0 to aDelta[i].Rows.Count-1 do begin
      lRow:= aDelta[i].Rows[j];
      if lRow.OldValues.Count <> length(lColumns) then begin
        DAError(lRow.Mode <> SimpleDataMode_Insert,err_RowDOfDeltaSHasDOldColumnsButDAreExpected, [j, lDataset.Name, lRow.OldValues.Count, length(lColumns)]);
      end;

      if lRow.NewValues.Count<>length(lColumns)  then  begin
        DAError(lRow.Mode <> SimpleDataMode_Delete,err_RowDOfDeltaSHasDNewColumnsButDAreExpected, [j, lDataset.Name, lRow.NewValues.Count, length(lColumns)]);
      end;

      case lRow.Mode of
        SimpleDataMode_Delete: ltype := ctDelete;
        SimpleDataMode_Insert: ltype := ctInsert;
        SimpleDataMode_Update: ltype := ctUpdate;
      else
        ltype := ctInsert; // prevert warning
        DAError(True,err_UnknownDataModeD,[ord(lRow.Mode)]);
      end; // case
      lDeltaRow:=lDelta.Add(j,ltype);

      for k :=  0  to lDelta.LoggedFieldCount-1 do begin
        lDeltaRow.NewValues[k] := ConvertFromSimple(lRow.NewValues[k], lColumns[k].DataType);
        lDeltaRow.OldValues[k] := ConvertFromSimple(lRow.OldValues[k], lColumns[k].DataType);
      end;
    end;
  end;
end;

function TDataAbstractService.UpdateData(const aDelta: Binary): Binary;
var
  aDeltaList: IDeltaArray;
begin
  DAValidateProperty(not AllowDataAccess,Name,err_DataAccessHasBeenDisabledUpdateData);
  DAValidateProperty(not AllowUpdates,Name,err_DataUpdatesHaveBeenDisabledUpdateData);

  aDeltaList := ReadDeltaFromStream(aDelta);
  try
    InternalUpdateData(aDeltaList, False);
    result := PackDeltas(aDeltaList);
  finally
    SetLength(aDeltaList,0);
  end;
end;

procedure TDataAbstractService.DoValidateDataTableAccess(const aDatasetName: string; const aRec: PDAServiceExchangeData);
var
  lAllow: Boolean;
begin
  lAllow:= True;
  if assigned(fOnGetDatasetDataValidation) then fOnGetDatasetDataValidation(Self, Connection, aDatasetName, aRec^.lParamNames,aRec^.lParamValues, ServiceSchema, lAllow);
  DoScriptProvider_ValidateDataTableAccess(aDatasetName,aRec^.lParamNames,aRec^.lParamValues,lAllow);
  DAError(not lAllow,err_DatasetNotAccessible, [aDatasetName]);
end;

function TDataAbstractService.ExecuteCommand(const aCommandName: string; const aParameterArray: DataParameterArray): Integer;
var
  aOutputParameters: DataParameterArray;
begin
  Result := ExecuteCommandEx(aCommandName,aParameterArray, aOutputParameters);
  aOutputParameters.Free;
end;

{ IDataAbstractService: Direct SQL Access }

function TDataAbstractService.SQLGetDataEx(const aSQLText: string;
  const aIncludeSchema: Boolean; const aMaxRecords: Integer;
  const aDynamicWhereXML: Unicodestring): Binary;
var
  lOptions: TDAWriteOptions;
  lDataSet: IDADataset;
  lSQLText: string;
  lRec: TDAServiceExchangeData;
begin
  DAValidateProperty(not AllowDataAccess,Name,err_DataAccessHasBeenDisabledSQLGetData);
  DAValidateProperty(not AllowExecuteSQL,Name,err_ExecutionOfSQLHasBeenDisabledSQLGetData);
  DAError(assigned(fHETConnection),err_ExecutionOfSQLIsNotSupportedForHETConnections);
  SetupScriptProvider;
  result := nil;
  lSQLText := {$IFNDEF UNICODE}UTF8ToString{$ENDIF}(aSQLText);
  CheckUTF8Decode(aSQLText,lSQLText);
  if lSQLText = '' then exit;

  Check();
  FillChar(lRec, SizeOf(lRec),0);
  DoValidateDirectSQLAccess(Connection, lSQLText, @lRec);
  Result := Binary.Create;
  Result.CapacityIncrement := ServiceDataStreamer.BufferSize;
  try
    Connection;
    DoStartTransaction(fConnection);
    try
      ServiceDataStreamer.Initialize(result, aiWrite);
      try
        lOptions := [woRows];
        if aIncludeSchema then lOptions := lOptions+[woSchema];
        lDataSet := Connection.NewDataset(lSQLText,'SQLResult');
        try
          if aDynamicWhereXML <> '' then lDataSet.DynamicWhere.Expression := lDataSet.DynamicWhere.XMLToExpression(aDynamicWhereXML);
          if (woSchema in lOptions) then DoBeforeGetDatasetSchema(lDataset);
          if (woRows in lOptions) then DoBeforeGetDatasetData(lDataset, (woSchema in lOptions), aMaxRecords);

          lDataSet.Open();

          ServiceDataStreamer.WriteDataset(lDataset, lOptions, aMaxRecords);

          if (woRows in lOptions) and Assigned(fOnAfterGetDatasetData) then fOnAfterGetDatasetData(self, lDataset, (woSchema in lOptions), aMaxRecords);
          if (woSchema in lOptions) and Assigned(fOnAfterGetDatasetSchema) then fOnAfterGetDatasetSchema(self, lDataset);
        finally
          lDataSet := nil;
        end;
      finally
        ServiceDataStreamer.Finalize();
      end;
      DoCommitTransaction(Connection);
    except
      DoRollbackTransaction(Connection);
      raise;
    end;

  except
    FreeAndNIL(result);
    raise;
  end;
end;

function TDataAbstractService.SQLExecuteCommandEx(const aSQLText: string; const aDynamicWhereXML: Unicodestring): Integer;
var
  lSQLText: string;
  lsql: IDASQLCommand;
  lRec: TDAServiceExchangeData;
begin
  DAValidateProperty(not AllowDataAccess,Name,err_DataAccessHasBeenDisabledSQLExecuteCommand);
  DAValidateProperty(not AllowExecuteSQL,Name,err_ExecutionOfSQLHasBeenDisabledSQLExecuteCommand);
  DAError(assigned(fHETConnection),err_ExecutionOfSQLIsnotSupportedForHETConnections);

  Check();
  lSQLText := {$IFNDEF UNICODE}UTF8ToString{$ENDIF}(aSQLText);
  CheckUTF8Decode(aSQLText,lSQLText);
  SetupScriptProvider;
  FillChar(lRec, SizeOf(lRec),0);
  DoValidateDirectSQLAccess(Connection, lSQLText, @lRec);

  Connection;
  DoStartTransaction(fConnection);
  try
    lsql:= Connection.NewCommand(lSQLText, stSQL);
    if aDynamicWhereXML <> '' then lsql.DynamicWhere.Expression := lsql.DynamicWhere.XMLToExpression(aDynamicWhereXML);
    DoScriptProvider_BeforeExecuteCommand(lsql.SQL,'',nil);
    Result := lsql.Execute;
    DoScriptProvider_AfterExecuteCommand(lsql.SQL,'',nil, Result);
    DoCommitTransaction(Connection);
  except
    DoRollbackTransaction(Connection);
    raise;
  end;
end;

{ Properties }

procedure TDataAbstractService.SetExportedDataTables(const Value: TDADataTableReferenceCollection);
begin
  fExportedDataTables.Assign(Value);
end;

procedure TDataAbstractService.SetScriptProvider(
  const Value: IDAScriptProvider);
var
  lna: IDANativeAccess;
begin
  if (csLoading in ComponentState) then begin
    fScriptProvider := Value;
  end
  else
    if fScriptProvider <> Value then begin
      if (fScriptProvider <> nil) and Supports(fScriptProvider,IDANativeAccess,lna) and (lna.Native is TComponent) then
        TComponent(lna.Native).RemoveFreeNotification(Self);
      lna := nil;
      if fScriptProvider <> nil then fScriptProvider.Context := nil;
      fScriptContext := nil;
      fScriptProvider := Value;
      if (fScriptProvider <> nil) and Supports(fScriptProvider,IDANativeAccess,lna) and (lna.Native is TComponent) then
        TComponent(lna.Native).FreeNotification(Self);
      if not (csDesigning in ComponentState) then SetupScriptProvider;
    end;
end;

procedure TDataAbstractService.SetServiceDataStreamer(const Value: TDADataStreamer);
begin
  if fServiceDataStreamer <> Value then begin
    if (fServiceDataStreamer <> nil) then fServiceDataStreamer.RORemoveFreeNotification(Self);
    fServiceDataStreamer := Value;
    if (fServiceDataStreamer <> nil) then fServiceDataStreamer.ROFreeNotification(Self);
  end;
end;

procedure TDataAbstractService.SetServiceSchema(const Value: TDASchema);
begin
  if fServiceSchema <> Value then begin
    if assigned(fServiceSchema) then fServiceSchema.RORemoveFreeNotification(self);
    fServiceSchema := Value;
    if assigned(fServiceSchema) then fServiceSchema.ROFreeNotification(self);
  end;
end;

procedure TDataAbstractService.SetupMasterDetails(DeltaStructList: TDADeltaStructList);
var
  lDetails : TDADatasetRelationshipList;
  i,j: integer;
  lstruct:TDADeltaStruct;
begin
 { Sets the master/detail relationships }
  lDetails := TDADatasetRelationshipList.Create;
  try
    for i := 0 to DeltaStructList.Count-1 do begin
      ServiceSchema.Relationships.GetDetails(DeltaStructList[i].BusinessProcessor.ReferencedDataset, lDetails);
      if (lDetails.Count=0) then Continue;

      { Prepares an array with the references to the detail deltas that will be used later on to adjust
        autoincs, etc. }
      for j := 0 to lDetails.Count-1 do begin
        lStruct := DeltaStructList.FindStruct(lDetails[j].DetailDatasetName);
        if assigned(lStruct) then begin
          DeltaStructList[i].DetailDeltas.Add(lStruct.Delta);
          DeltaStructList[i].Relationships.Add(lDetails[j]);
        end;
      end;
    end;
  finally
    lDetails.Free;
  end;
end;

procedure TDataAbstractService.SetupScriptProvider;
begin
  if assigned(fServiceSchema) and assigned(fScriptProvider) and (fScriptContext = nil) then begin
    fScriptContext := GetScriptContext;
    fScriptProvider.Context := fScriptContext;

    // LOAD
    if (fServiceSchema.BusinessRulesServer.ScriptLanguageStr <> '') and (fServiceSchema.BusinessRulesServer.Script <> '') then begin
      DAError(not fScriptProvider.SupportsLanguage(fServiceSchema.BusinessRulesServer.ScriptLanguageStr),
                         err_ScriptingProviderDoesNotSupportScriptingLanguageS,[fServiceSchema.BusinessRulesServer.ScriptLanguageStr]);
      fScriptProvider.LoadScript(fServiceSchema.BusinessRulesServer.Script);
    end;
  end;
end;

function TDataAbstractService.SimpleGetData(
  const Request: SimpleRequestInfoArray): SimpleDataResultArray;
var
  lTableNameArray: StringArray;
  lTableRequestInfoArray: TableRequestInfoArray;
  i: integer;
  lReq: SimpleRequestInfo;
  lInfoRes: TableRequestInfo;
  lStreamer: TDASimpleDataStreamer;
  lwb: TDAWhereBuilder;
begin
  DAValidateProperty(not AllowDataAccess, Name, err_DataAccessHasBeenDisabledGetData);

  result := nil;
  if Request.Count = 0  then Exit;
  lTableNameArray := StringArray.Create;
  lTableRequestInfoArray := TableRequestInfoArray.Create;
  try
    for I := 0 to Request.Count - 1 do begin
      lReq := Request[i];
      if lReq is SimpleRequestInfoEx then begin
        lInfoRes := TableRequestInfoWithQueryBuilder.Create;
        TableRequestInfoWithQueryBuilder(lInfoRes).QueryBuilder := SimpleRequestInfoEx(lReq).QueryBuilder;
        lTableNameArray.Add({$IFNDEF UNICODE}UTF8Encode{$ENDIF}(SimpleRequestInfoEx(lReq).QueryBuilder.MainTable.MasterTable));
      end
      else if (lReq.Where = '') and (lReq.Table = '') then begin
        lInfoRes := TableRequestInfoV6.Create;
        TableRequestInfoV6(lInfoRes).Sql := {$IFNDEF UNICODE}UTF8ToString{$ENDIF}(lReq.SQL);
        lTableNameArray.Add(lReq.SQL);
      end
      else begin
        lInfoRes := TableRequestInfoV5.Create;
        lTableNameArray.Add(lReq.Table);

        if lReq.Where <> ''  then begin
          lwb := TDAWhereBuilder.Create;
          try
            lwb.Xml := {$IFNDEF UNICODE}UTF8ToString{$ENDIF}(lReq.Where);
            TableRequestInfoV5(lInfoRes).WhereClause := lwb.ExpressionToXmlNode(lwb.Expression);
          finally
            lwb.Free;
          end;
        end;
      end;
      lInfoRes.IncludeSchema := lReq.IncludeSchema or lReq.SimpleMode;
      lInfoRes.MaxRecords := lReq.MaxRecords;
      BuildParameters(lReq, lInfoRes.Parameters);
      lTableRequestInfoArray.Add(lInfoRes);
    end;

    Check(True);
    Result:= SimpleDataResultArray.Create;
    try
      for I := 0 to Request.Count - 1  do begin
        if Request[i].SimpleMode then
          Result.Add(SimpleDataResultEx.Create)
        else
          Result.Add(SimpleDataResult.Create);
      end;
      lStreamer := TDASimpleDataStreamer.Create(nil);
      try
        lStreamer.InitializeWithSimpleData(Result);
        if Assigned(ServiceDataStreamer) then lStreamer.Assign(ServiceDataStreamer);
        try
          InternalGetData(lTableNameArray,lTableRequestInfoArray, lStreamer, False);
        finally
          lStreamer.Finalize();
        end;
      finally
        lStreamer.Free;
      end;
    except
      FreeAndNil(Result);
      raise;
    end;
  finally
    lTableNameArray.Free;
    lTableRequestInfoArray.Free;
  end;
end;

function TDataAbstractService.SimpleUpdateData(
  const aDelta: SimpleDeltaArray): SimpleDeltaArray;
var
  aDeltaList: IDeltaArray;
begin
  DAValidateProperty(not AllowDataAccess, Name, err_DataAccessHasBeenDisabledUpdateData);
  DAValidateProperty(not AllowUpdates   , Name, err_DataUpdatesHaveBeenDisabledUpdateData);
  aDeltaList := UnpackSimpleDeltas(aDelta);
  try
    InternalUpdateData(aDeltaList, False);
    Result := PackSimpleDeltas(aDeltaList);
  finally
    SetLength(aDeltaList,0);
  end;
end;

{ Connections }

function TDataAbstractService.GetConnection: IDAConnection;
var
  lConnectionName: string;
begin
  result := fConnection;
  if assigned(fConnection) then exit;
  if (csDesigning in ComponentState) then exit;

  if AcquireConnection then try

    CheckForConnectionManager;
    lConnectionName := ConnectionName;
    if Assigned(fOnBeforeAcquireConnection) then fOnBeforeAcquireConnection(Self, lConnectionName);

    result := ServiceSchema.ConnectionManager.NewConnection(lConnectionName);
    AssignMacroProcesserEvent(Result);
    Connection := result;
    if Assigned(fOnAfterAcquireConnection) then fOnAfterAcquireConnection(Self, lConnectionName, result);

  except
    on E: Exception do begin
      if Assigned(fOnAcquireConnectionFailure) then fOnAcquireConnectionFailure(Self, lConnectionName, E);
      raise;
    end;
  end;
end;

{$WARN SYMBOL_DEPRECATED OFF}
procedure TDataAbstractService.SetConnection(aConnection: IDAConnection);
begin
  if fConnection <> aConnection then begin
    fConnection := aConnection;
    if not Supports(fConnection, IDAHETConnection, fHETConnection) then fHETConnection := nil;
  end;
end;
{$WARN SYMBOL_DEPRECATED ON}

function TDataAbstractService.GetConnectionForObject(const aName: string): IDAConnection;
begin
  result := Connection; // forces acquisition of Connection
  if assigned(fHETConnection) and (ServiceSchema.UnionDataTables.FindItem(aName) = nil) then begin
    result := fHETConnection.GetConnectionForObject(aName);
    AssignMacroProcesserEvent(Result);
  end;
end;

procedure TDataAbstractService.DoBeforeGetDatasetData(
  const aDataset: IDADataset; const aIncludeSchema: Boolean;
  const aMaxRecords: Integer);
begin
  if Assigned(fOnBeforeGetDatasetData) then fOnBeforeGetDatasetData(Self, aDataset, aIncludeSchema, aMaxRecords);
end;

procedure TDataAbstractService.DoBeforeGetDatasetSchema(const aDataset: IDADataset);
begin
  if Assigned(fOnBeforeGetDatasetSchema) then fOnBeforeGetDatasetSchema(Self, aDataset);
end;

procedure TDataAbstractService.DoCommitTransaction(aConnection: IDAConnection);
begin
  if Assigned(aConnection) and aConnection.InTransaction and
    TriggerTransactionEvent(fOnUpdateDataCommitTransaction) then begin
    DoScriptProvider_BeforeCommit;
    aConnection.CommitTransaction;
    DoScriptProvider_AfterCommit;
  end;
end;

procedure TDataAbstractService.DoOnDeactivate(aClientID: TGUID);
begin
  inherited;
  if (csDesigning in ComponentState) then Exit;
  UninstallScriptProvider;
  ReleaseConnection();
end;

function TDataAbstractService.DoOnUnknownIdentifier(Sender: TObject; const Name,
  OrgName: string; var Value: string): Boolean;
var
  s: string;
  lSessionValueName: string;
  lSessionValue: variant;
  b: boolean;
begin
  Result := False;
  // Is this a session value request?
  if Length(OrgName) > 8 then begin
    s := Copy(OrgName, 1, 8);
    if AnsiSameText(s, 'SESSION_') then begin
      lSessionValueName := Copy(OrgName, 9, Length(OrgName) - 8);
      lSessionValue := self.Session[lSessionValueName];
      Result := not (VarIsNull(lSessionValue) or VarIsEmpty(lSessionValue));
      if Result then Value := VarToStr(lSessionValue);
      Exit;
    end;
  end;

  if Assigned(fOnUnknownMacroVariable) then begin
    if value = '' then Value := Name;
    Result := fOnUnknownMacroVariable(Self,Name, OrgName, Value);
  end;
  b:=DoScriptProvider_UnknownSqlMacroIdentifier(OrgName,Value);
  Result := Result or b;
end;

procedure TDataAbstractService.DoReleaseConnection(var aConnection: IDAConnection);
var
  lConnectionName: string;
  lDefaultConnection: Boolean;
begin
  lDefaultConnection := aConnection = fConnection;
  if assigned(aConnection) then begin
    lConnectionName := aConnection.Name;
    if Assigned(fOnBeforeReleaseConnection) then fOnBeforeReleaseConnection(Self, lConnectionName, aConnection);
    DeAssignMacroProcesserEvent(aConnection);
    aConnection := nil;
    if lDefaultConnection then fHETConnection := nil;
    if Assigned(fOnAfterReleaseConnection) then fOnAfterReleaseConnection(Self, lConnectionName);
  end;
end;

procedure TDataAbstractService.DoRollbackTransaction(aConnection: IDAConnection);
begin
  if Assigned(aConnection) and aConnection.InTransaction and
     TriggerTransactionEvent(fOnUpdateDataRollBackTransaction) then begin
    DoScriptProvider_BeforeRollback;
    aConnection.RollbackTransaction;
    DoScriptProvider_AfterRollback;
  end;
end;

procedure TDataAbstractService.DoScriptProvider_AfterCommit;
begin
  if assigned(fScriptProvider) and fScriptProvider.HasAfterCommit then
    fScriptProvider.AfterCommit;
end;

procedure TDataAbstractService.DoScriptProvider_AfterExecuteCommand(aSQL,
  aCommandName: String; aParameters: DataParameterArray;
  aRowsAffected: integer);
var
  lParam:DataParameterArray;
begin
  if assigned(fScriptProvider) and fScriptProvider.HasAfterExecuteCommand then begin
    if aParameters = nil then lParam := DataParameterArray.Create else lParam := aParameters;
    try
      fScriptProvider.AfterExecuteCommand(aSQL, aCommandName, lParam, aRowsAffected);
    finally
      if aParameters = nil then lParam.Free;
    end;
  end;
end;

procedure TDataAbstractService.DoScriptProvider_AfterGetData(
  const aTableNameArray: StringArray;
  const aTableRequestInfoArray: TableRequestInfoArray);
begin
  if assigned(fScriptProvider) and fScriptProvider.HasAfterGetData then
    fScriptProvider.AfterGetData(aTableNameArray,aTableRequestInfoArray);
end;

procedure TDataAbstractService.DoScriptProvider_AfterProcessDelta(
  aDelta: IDADelta);
begin
  if assigned(fScriptProvider) and fScriptProvider.HasAfterProcessDelta then
    fScriptProvider.AfterProcessDelta(aDelta);
end;

procedure TDataAbstractService.DoScriptProvider_AfterProcessDeltaChange(
  aDelta: IDADelta; aChange: TDADeltaChange; aWasRefreshed: Boolean);
begin
  if assigned(fScriptProvider) and fScriptProvider.HasAfterProcessDeltaChange then
    fScriptProvider.AfterProcessDeltaChange(aDelta,aChange,aWasRefreshed);
end;

procedure TDataAbstractService.DoScriptProvider_AfterRollback;
begin
  if assigned(fScriptProvider) and fScriptProvider.HasAfterRollback then
    fScriptProvider.AfterRollback;
end;

procedure TDataAbstractService.DoScriptProvider_BeforeCommit;
begin
  if assigned(fScriptProvider) and fScriptProvider.HasBeforeCommit then
    fScriptProvider.BeforeCommit;
end;

procedure TDataAbstractService.DoScriptProvider_BeforeExecuteCommand(aSQL,
  aCommandName: String; aParameters: DataParameterArray);
var
  lParam:DataParameterArray;
begin
  if assigned(fScriptProvider) and fScriptProvider.HasBeforeExecuteCommand then begin
    if aParameters = nil then lParam := DataParameterArray.Create else lParam := aParameters;
    try
      fScriptProvider.BeforeExecuteCommand(aSQL, aCommandName, lParam);
    finally
      if aParameters = nil then lParam.Free;
    end;
  end;
end;

procedure TDataAbstractService.DoScriptProvider_BeforeGetData(const aTableNameArray: StringArray; const aTableRequestInfoArray: TableRequestInfoArray);
begin
  if assigned(fScriptProvider) and fScriptProvider.HasBeforeGetData then
    fScriptProvider.BeforeGetData(aTableNameArray,aTableRequestInfoArray);
end;

procedure TDataAbstractService.DoScriptProvider_BeforeProcessDelta(
  aDelta: IDADelta);
begin
  if assigned(fScriptProvider) and fScriptProvider.HasBeforeProcessDelta then
    fScriptProvider.BeforeProcessDelta(aDelta);
end;

procedure TDataAbstractService.DoScriptProvider_BeforeProcessDeltaChange(
  aDelta: IDADelta; aChange: TDADeltaChange; aWasRefreshed: Boolean;
  var aCanRemove: Boolean);
begin
  if assigned(fScriptProvider) and fScriptProvider.HasBeforeProcessDeltaChange then
    fScriptProvider.BeforeProcessDeltaChange(aDelta,aChange,aWasRefreshed,aCanRemove);
end;

procedure TDataAbstractService.DoScriptProvider_BeforeRollback;
begin
  if assigned(fScriptProvider) and fScriptProvider.HasBeforeRollback then
    fScriptProvider.BeforeRollback;
end;

procedure TDataAbstractService.DoScriptProvider_CreateTransaction;
begin
  if assigned(fScriptProvider) and fScriptProvider.HasCreateTransaction then
    fScriptProvider.CreateTransaction;
end;

procedure TDataAbstractService.DoScriptProvider_ProcessError(aDelta: IDADelta;
  aChange: TDADeltaChange; var aCanContinue: Boolean; var aError: Exception);
begin
  if assigned(fScriptProvider) and fScriptProvider.HasProcessError then
    fScriptProvider.ProcessError(aDelta,aChange,aCanContinue,aError);
end;

function TDataAbstractService.DoScriptProvider_UnknownSqlMacroIdentifier(
  aIdentifier: String; var aValue: String): Boolean;
begin
  Result := assigned(fScriptProvider) and fScriptProvider.HasUnknownSqlMacroIdentifier;
  if Result then fScriptProvider.UnknownSqlMacroIdentifier(aIdentifier, aValue);
end;

procedure TDataAbstractService.DoScriptProvider_ValidateCommandAccess(
  aName: String; aParameterNames: array of String;
  aParameterValues: array of Variant; var aAllowed: Boolean);
begin
  if assigned(fScriptProvider) and fScriptProvider.HasValidateCommandAccess then
    fScriptProvider.ValidateCommandAccess(aName,aParameterNames, aParameterValues, aAllowed);
end;

procedure TDataAbstractService.DoScriptProvider_ValidateDataTableAccess(
  aName: String; aParameterNames: array of String;
  aParameterValues: array of Variant; var aAllowed: Boolean);
begin
  if assigned(fScriptProvider) and fScriptProvider.HasValidateDataTableAccess then
    fScriptProvider.ValidateDataTableAccess(aName,aParameterNames, aParameterValues, aAllowed);
end;

procedure TDataAbstractService.DoScriptProvider_ValidateDirectSQLAccess(
  aSQL: String; aParameterNames: array of String;
  aParameterValues: array of variant; var aAllowed: Boolean);
begin
  if assigned(fScriptProvider) and fScriptProvider.HasValidateDirectSQLAccess then
    fScriptProvider.ValidateDirectSQLAccess(aSQL,aParameterNames, aParameterValues, aAllowed);
end;

function TDataAbstractService.DoStartTransaction(var aConnection: IDAConnection): Boolean;
var
  lDefaultConnection: Boolean;
begin
  Result := False;
  lDefaultConnection := aConnection = fConnection;
  if Assigned(aConnection) and  not aConnection.InTransaction then begin
    if TriggerTransactionEvent(fOnUpdateDataBeginTransaction) then begin
      try
        aConnection.BeginTransaction;
      except
        DoReleaseConnection(aConnection);
        if lDefaultConnection then begin
          aConnection := Connection;
          aConnection.BeginTransaction;
        end;
      end;
      Result := aConnection <> nil;
      if Result then DoScriptProvider_CreateTransaction;
    end;
  end;
end;

procedure TDataAbstractService.DoValidateCommandAccess(
  const aConnection: IDAConnection; const aDatasetName: string;
  const aRec: PDAServiceExchangeData);
var
  lAllow: Boolean;
begin
  lAllow:= True;
  if assigned(fOnExecuteCommandValidation) then fOnExecuteCommandValidation(Self, aConnection, aDatasetName, aRec^.lParamNames, aRec^.lParamValues, ServiceSchema, lAllow);
  DoScriptProvider_ValidateCommandAccess(aDatasetName,aRec^.lParamNames,aRec^.lParamValues,lAllow);
  if not lAllow then raise EDADatasetNotAccessible.CreateFmt(err_CommandNotAccessible, [aDatasetName]);
end;

procedure TDataAbstractService.DoValidateDirectSQLAccess(
  const aConnection: IDAConnection; const aSQLText: string;
  const aRec: PDAServiceExchangeData);
var
  lAllowed: boolean;
begin
  lAllowed := True;
  if assigned(fOnSQLValidation) then fOnSQLValidation(Self, aConnection, aSQLText, aRec^.lParamNames , aRec^.lParamValues, lAllowed);
  DoScriptProvider_ValidateDirectSQLAccess(aSQLText,aRec^.lParamNames, aRec^.lParamValues, lAllowed);
  if not lAllowed then raise EDADatasetNotAccessible.Create(err_SQLNotPermitted);
end;

procedure TDataAbstractService.ReleaseConnection;
begin
  DoReleaseConnection(fConnection);
end;

procedure TDataAbstractService.Assign(Source: TPersistent);
var
  lSource: TDataAbstractService;
begin
  inherited;
  if Source is TDataAbstractService then begin
    lSource := TDataAbstractService(Source);

    AcquireConnection := lSource.AcquireConnection;
    AllowDataAccess := lSource.AllowDataAccess;
    AllowDynamicSelect := lSource.AllowDynamicSelect;
    AllowDynamicWhere := lSource.AllowDynamicWhere;
    AllowExecuteCommands := lSource.AllowExecuteCommands;
    AllowExecuteSQL := lSource.AllowExecuteSQL;
    AllowSchemaAccess := lSource.AllowSchemaAccess;
    AllowUpdates := lSource.AllowUpdates;
    AllowWhereSQL := lSource.AllowWhereSQL;
    AutoCreateBusinessProcessors := lSource.AutoCreateBusinessProcessors;
    ConnectionName := lSource.ConnectionName;
    ExportedDataTables := lSource.ExportedDataTables;
    OnAcquireConnectionFailure := lSource.OnAcquireConnectionFailure;
    OnAfterAcquireConnection := lSource.OnAfterAcquireConnection;
    OnAfterExecuteCommand := lSource.OnAfterExecuteCommand;
    OnAfterGetDatasetData := lSource.OnAfterGetDatasetData;
    OnAfterGetDatasetSchema := lSource.OnAfterGetDatasetSchema;
    OnAfterProcessDeltas := lSource.OnAfterProcessDeltas;
    OnAfterReleaseConnection := lSource.OnAfterReleaseConnection;
    OnBeforeAcquireConnection := lSource.OnBeforeAcquireConnection;
    OnBeforeExecuteCommand := lSource.OnBeforeExecuteCommand;
    OnBeforeGetDatasetData := lSource.OnBeforeGetDatasetData;
    OnBeforeGetDatasetSchema := lSource.OnBeforeGetDatasetSchema;
    OnBeforeProcessDeltas := lSource.OnBeforeProcessDeltas;
    OnBeforeReleaseConnection := lSource.OnBeforeReleaseConnection;
    OnBusinessProcessorAutoCreated := lSource.OnBusinessProcessorAutoCreated;
    OnGetSchemaAsXMLEvent := lSource.OnGetSchemaAsXMLEvent;
    OnProcessDeltasError := lSource.OnProcessDeltasError;
    OnUpdateDataBeginTransaction := lSource.OnUpdateDataBeginTransaction;
    OnUpdateDataCommitTransaction := lSource.OnUpdateDataCommitTransaction;
    OnUpdateDataRollBackTransaction := lSource.OnUpdateDataRollBackTransaction;
    OnValidateCommandExecution := lSource.OnValidateCommandExecution;
    OnValidateDatasetAccess := lSource.OnValidateDatasetAccess;
    OnValidateDirectSQLAccess := lSource.OnValidateDirectSQLAccess;
    ProcessDeltasWithoutUpdateRules := lSource.ProcessDeltasWithoutUpdateRules;
    ReturnFullSchema:= lSource.ReturnFullSchema;
    ReturnUpdateFailureDelta := lSource.ReturnUpdateFailureDelta;
    ServiceDataStreamer := lSource.ServiceDataStreamer;
    ServiceSchema := lSource.ServiceSchema;
  end;
end;

procedure TDataAbstractService.AssignMacroProcesserEvent(
  AConnection: IDAConnection);
var
  lmacro: IDAHasMacroProcessor;
begin
  if AConnection.UseMacroProcessor then
    if Supports(AConnection, IDAHasMacroProcessor, lmacro) then begin
      if Assigned(lmacro.GetMacroProcessor) and not Assigned(lmacro.GetMacroProcessor.OnDAServiceUnknownIdentifier) then begin
        lmacro.GetMacroProcessor.OnDAServiceUnknownIdentifier := DoOnUnknownIdentifier;
        fMacroProcessorEventSet := True;
      end;
      lmacro := nil;
    end;
end;

procedure TDataAbstractService.BP_ProcessChanges(aStruct: TDADeltaStruct;
  aChangeTypes: TDAChangeTypes;aSynchronizeAutoIncs: Boolean);
var
  j: integer;
begin
  if aStruct.BusinessProcessor <> nil then begin
    aStruct.BusinessProcessor.Service := Self;
    try
      aStruct.BusinessProcessor.ProcessDelta(GetConnectionForObject(aStruct.BusinessProcessor.ReferencedDataset), aStruct.Delta, aChangeTypes, aStruct);
    finally
      aStruct.BusinessProcessor.Service := nil;
    end;

    if aSynchronizeAutoIncs then
      for j := 0 to (aStruct.DetailDeltas.Count-1) do
        aStruct.BusinessProcessor.SynchronizeAutoIncs(aStruct.Delta, aStruct.DetailDeltas[j], aStruct.Relationships[j]);
  end;
end;

procedure TDataAbstractService.BuildParameters(aReq: SimpleRequestInfo;
  AParameterArray: DataParameterArray);
var
  i: integer;
  lp: DataParameter;
begin
  AParameterArray.Clear;
  for i:=  0  to aReq.Parameters.Count-1  do  begin
    lp := AParameterArray.Add;
    lp.Name := aReq.Parameters[i].Name;
    lp.Value := ConvertFromSimple(aReq.Parameters[i].Value, TSimpleDataTypeMapping[aReq.Parameters[i].DataType]);
  end;
end;

procedure TDataAbstractService.Check(CheckOnlyDataStreamer:Boolean = false);
begin
  if not CheckOnlyDataStreamer then Check2;
  DAValidateProperty(not Assigned(ServiceDataStreamer),Name,err_DataStreamerMustBeAssigned);
end;

function TDataAbstractService.ExecuteCommandEx(const aCommandName: string;
  const aInputParameters: DataParameterArray;
  out aOutputParameters: DataParameterArray): Integer;
var
  lCommandName: string;
begin
  DAValidateProperty(not AllowDataAccess,      Name, err_DataAccessHasBeenDisabledExecuteCommand);
  DAValidateProperty(not AllowExecuteCommands, Name, err_ExecutionOfCommandsHasBeenDisabledExecuteCommand);

  lCommandName:= {$IFNDEF UNICODE}UTF8ToString{$ENDIF}(aCommandName);
  {$IFNDEF UNICODE}
  CheckUTF8Decode(aCommandName,lCommandName);
  {$ENDIF}
  Result := InternalExecuteCommandEx(lCommandName,aInputParameters,aOutputParameters,False);
end;

function TDataAbstractService.GetDatasetScripts(const DatasetNames: string): string;
begin
  Result := InternalGetDatasetScripts(DatasetNames, False);
end;

procedure TDataAbstractService.ExportedDataTables_MergeDelta(ADelta: IDADelta);
var
  i, k, x: integer;
  oldval, newval, val : Variant;
  fld : TDAField;
  pkfields : string;
  pkfields1: array of string;
  insertfields: array of string;
  keyvals, insertvals : array of variant;
  leditable:IDAEditableDataset;
  lDataset: IDADataset;
  pk_array: array of boolean;
  lReducedDelta: Boolean;
begin
  lReducedDelta := ADelta.GetDelta.ReducedDelta;
  // validated in UnpackDeltas
  lDataset:=ExportedDataTables.FindByName(ADelta.LogicalName).Dataset;
  SetLength(pk_array, ADelta.LoggedFieldCount);
  for i := 0 to ADelta.LoggedFieldCount - 1 do
    pk_array[i]:=False;

  for i := 0 to ADelta.KeyFieldCount - 1 do begin
    x := ADelta.IndexOfLoggedField(ADelta.KeyFieldNames[i]);
    if x <> -1 then pk_array[x]:=True;
  end;

  SetLength(pkfields1, ADelta.KeyFieldCount);
  for i := 0 to (ADelta.KeyFieldCount-1) do
    pkfields1[i]:=ADelta.KeyFieldNames[i];
  if ADelta.KeyFieldCount = 0 then begin
    SetLength(pkfields1, ADelta.LoggedFieldCount);
    k:=-1;
    for i := 0 to (ADelta.LoggedFieldCount-1) do begin
      if ADelta.LoggedFieldTypes[i] in [datUnknown, datMemo, datBlob,datWideMemo, datXml] then Continue;
      inc(k);
      pkfields1[k]:=ADelta.LoggedFieldNames[i];
    end;
    SetLength(pkfields1,k+1);
  end;
  SetLength(keyvals, Length(pkfields1));
  pkfields := '';
  For i:=0 to Length(pkfields1) - 1 do
    pkfields:=pkfields+pkfields1[i]+';';
  pkfields := Copy(pkfields, 1, Length(pkfields)-1);

  if (ADelta.Count>0) then begin
    for i := (ADelta.Count-1) downto 0 do begin
      for k := 0 to Length(pkfields1)-1 do begin
        val := ADelta[i].OldValueByName[pkfields1[k]];
        keyvals[k] := val;
      end;
      if lReducedDelta and (ADelta.KeyFieldCount = 0) then begin
        SetLength(pkfields1, ADelta.LoggedFieldCount);
        k:=-1;
        for x := 0 to (ADelta.LoggedFieldCount-1) do begin
          if ADelta.LoggedFieldTypes[x] in [datUnknown, datMemo, datBlob,datWideMemo, datXml] then Continue;
          pkfields:=ADelta.LoggedFieldNames[x];
          oldval:=ADelta[i].OldValueByName[pkfields];
          if ROVariantsEqual(oldval,ADelta[i].NewValueByName[pkfields]) and (VarIsNull(oldval) or (VarIsEmpty(oldval))) then Continue;
          inc(k);
          pkfields1[k]:=ADelta.LoggedFieldNames[x];
        end;
        SetLength(pkfields1,k+1);
        SetLength(keyvals,k+1);
        for k := 0 to Length(pkfields1)-1 do begin
          val := ADelta[i].OldValueByName[pkfields1[k]];
          keyvals[k] := val;
        end;
        pkfields := '';
        For x:=0 to Length(pkfields1) - 1 do
          pkfields:=pkfields+pkfields1[x]+';';
        pkfields := Copy(pkfields, 1, Length(pkfields)-1);
      end;
      if lDataset.QueryInterface(IDAEditableDataset,leditable) <> 0 then exit;
      leditable.Open;
      leditable.First;
      case ADelta[i].ChangeType of
        ctDelete: begin
          // Locates the original record
          if Length(keyvals)=1 then begin
            if not lDataset.Locate(pkfields, keyvals[0], []) then Continue;
          end
          else begin
            if not lDataset.Locate(pkfields, keyvals, []) then Continue;
          end;
          leditable.Delete;
        end;
        ctInsert: begin
          // old values = Unassigned
          // new Values = Null
          SetLength(insertFields, ADelta.LoggedFieldCount);
          SetLength(insertvals, ADelta.LoggedFieldCount);
          for x := 0 to (ADelta.LoggedFieldCount-1) do begin
            insertfields[x] := ADelta.LoggedFieldNames[x];
            insertvals[x] := ADelta[i].NewValueByName[ADelta.LoggedFieldNames[x]];
          end;
          leditable.AddRecord(insertfields,insertvals);
        end;
        ctUpdate: begin
          // Locates the original record
          if Length(keyvals)=1 then begin
            if not lDataset.Locate(pkfields, keyvals[0], []) then Continue;
          end
          else begin
            if not lDataset.Locate(pkfields, keyvals, []) then Continue;
          end;
          leditable.Edit;
          for x := 0 to (ADelta.LoggedFieldCount-1) do begin
            fld := lDataset.FieldByName(ADelta.LoggedFieldNames[x]);
            newval := ADelta[i].NewValueByName[fld.Name];
            oldval := ADelta[i].OldValueByName[fld.Name];
            if lReducedDelta and (ROVariantsEqual(newval, oldval)) then Continue;
            fld.Value:=newval;
          end;
          leditable.Post;
         end;
      end;
      // Removes this merged change
      ADelta.Delete(i);
    end;
  end
end;

function TDataAbstractService.FindUserDefinedBP(const aDeltaName: String;
  const isReducedDelta: Boolean): TDABusinessProcessor;
var
  j: integer;
begin
  { Tries to locate a user-defined business processor }
  for j := 0 to (Self.ComponentCount - 1) do begin
    if (Self.Components[j] is TDABusinessProcessor) then begin
      Result := TDABusinessProcessor(Self.Components[j]);
      if SameText(Result.ReferencedDataset, aDeltaName) and (Result.Schema = fServiceSchema) then begin
        if isReducedDelta then begin
          DAError((Result.InsertCommandName <> '') or
            (Result.DeleteCommandName <> '') or
            (Result.UpdateCommandName <> '') or
            ([poAutoGenerateInsert,poAutoGenerateUpdate,poAutoGenerateDelete]*Result.ProcessorOptions <>[poAutoGenerateInsert,poAutoGenerateUpdate,poAutoGenerateDelete]),
            err_SendReducedDeltaOptionIsIncompatibleWithSSettings,[Result.Name]);
        end;
        Exit;
      end;
    end;
  end;
  Result := nil;
end;

procedure TDataAbstractService.Fix_NET_issue_with_AutoInc_at_Insert(
  aDelta: IDADelta);
var
  lAutoinc:integer;
  i,j: integer;
  lc: TDADeltaChange;
begin
  lAutoinc := -1;
  for i := 0 to aDelta.KeyFieldCount - 1 do begin
    j := aDelta.IndexOfLoggedField(aDelta.KeyFieldNames[i]);
    if j <> -1 then
      if aDelta.LoggedFieldTypes[j] = datAutoInc then begin
        lAutoinc := j;
        Break;
      end;
  end;
  if lAutoinc = -1 then Exit;
  for I := 0 to aDelta.Count - 1 do begin
    lc := aDelta.Changes[i];
    if (lc.ChangeType = ctInsert) then
      if (VarIsEmpty(lc.OldValues[lAutoinc])) then
        lc.OldValues[lAutoinc] := lc.NewValues[lAutoinc] //.NET
      else
        Break;// Delphi: no changes are required
  end;
end;

function TDataAbstractService.ReadDeltaFromStream(const DeltaStream: Binary): IDeltaArray;
var
  i: integer;
  lDeltaName: string;
begin
  SetLength(result,0);
  Check(True);
  // Reads the deltas.
  ServiceDataStreamer.Initialize(DeltaStream, aiReadFromBeginning);
  try
    SetLength(result,ServiceDataStreamer.DeltaCount);
    for i := 0 to (ServiceDataStreamer.DeltaCount - 1) do begin
      lDeltaName := ServiceDataStreamer.DeltaNames[i];
      Result[i] := NewDelta(lDeltaName);
      ServiceDataStreamer.ReadDelta(lDeltaName, Result[i]);
    end;
  finally
    ServiceDataStreamer.Finalize;
  end;
end;

procedure TDataAbstractService.RegisterForDataChangeNotification(
  const aTableName: string);
begin
{ TODO : todo }
end;

procedure TDataAbstractService.UnregisterForDataChangeNotification(
  const aTableName: string);
begin
{ TODO : todo }
end;

function TDataAbstractService.SQLExecuteCommand(const aSQLText: string): Integer;
begin
  Result:= SQLExecuteCommandEx(aSQLText,'');
end;

function TDataAbstractService.SQLGetData(const aSQLText: string; const aIncludeSchema: Boolean; const aMaxRecords: Integer): Binary;
begin
  Result:= SQLGetDataEx(aSQLText, aIncludeSchema, aMaxRecords, '');
end;
{$IFDEF DELPHI10UP}{$ENDREGION}{$ENDIF}

end.
