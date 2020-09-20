unit HisClient_YB;

interface

{
   医保接口

  Written by caowm (remobjects@qq.com)
  2014年10月
}

uses
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  ActnList,
  Dialogs,
  StdCtrls,
  StrUtils,
  Menus,
  DB,
  DateUtils,
  uDACore,
  uDAFields,
  uDAWhere,
  uDADataTable,
  uDAInterfaces,
  uROClasses,
  cxClasses,
  cxGraphics,
  cxDBData,
  cxDBEdit,
  cxLabel,
  cxEdit,
  cxMemo,
  cxMaskEdit,
  cxCalendar,
  cxTextEdit,
  cxRadioGroup,
  cxButtons,
  cxCheckBox,
  cxButtonEdit,
  cxFilter,
  cxGrid,
  cxGridCustomView,
  cxGridCustomTableView,
  cxGridTableView,
  cxGridDBTableView,
  cxGridBandedTableView,
  cxGridDBBandedTableView,
  cxGridCardView,
  cxGridDBCardView,
  cxGridChartView,
  cxGridDBChartView,
  cxDBPivotGrid,
  cxSpinEdit,
  cxCalc,
  cxCustomData,
  cxCustomPivotGrid,
  cxLookAndFeelPainters,
  cxTL,
  cxDBTL,
  dxGDIPlusClasses,
  dxBar,
  dxLayoutControl,
  dxLayoutContainer,
  Intf_IDCard,
  App_Common,
  App_Function,
  App_Class,
  App_DevExpress,
  App_DAModel,
  App_DAView,
  HisClient_Const,
  HisClient_Classes,
  HisClient_System,
  HisClient_Clinic,
  HisClient_Hosp;

const
  iYBParamSize = 1024;

  sYBDLLName = 'HNBridge.dll';
  sDataServiceYB = 'HisService_YB';

  sYBFunReadCard = 'ReadCard';
  sYBFunInsertDataSet = 'InsertDataSet';
  sYBFunInsertRow = 'InsertRow';
  sYBFunSetField = 'SetField';
  sYBFunEndRow = 'EndRow';
  sYBFunEndDataSet = 'EndDataSet';
  sYBFunRun = 'Run';
  sYBFunGetParam = 'GetParam';
  sYBFunLocateDataSet = 'LocateDataSet';
  sYBFunGetFieldValue = 'GetFieldValue';
  sYBFunGetCurrentRow = 'GetCurrentRow';

  sYBFieldJZJLH = 'JZJLH';
  sYBFieldSDYWH = 'SDYWH';
  sYBFieldGMSFHM = 'GMSFHM';
  sYBFieldXTJGDM = 'XTJGDM';
  sYBFieldZYH = 'ZYH';
  sYBFieldZKBH = 'ZKBH';
  sYBFieldMsg = 'Msg';

  sYBParamRecList = 'RecipeIDList';

function Initialize(Ip: PChar; Port: Word; SndBufSize: Integer; RecvBufSize: Integer): Integer; stdcall external sYBDLLName;
function CreateInstace(): Integer; stdcall external sYBDLLName;
function SetParam(pDataHandle: Integer; ParamName: PChar; ParamValue: PChar): Integer; stdcall external sYBDLLName;
function InsertDataSet(pDataHandle: Integer): Integer; stdcall external sYBDLLName;
function InsertRow(pDataHandle: Integer): Integer; stdcall external sYBDLLName;
function SetField(pDataHandle: Integer; FieldName: PChar; FieldValue: PChar): Integer; stdcall external sYBDLLName;
function EndRow(pDataHandle: Integer; RowID: Integer): Integer; stdcall external sYBDLLName;
function EndDataSet(pDataHandle: Integer; DataSetName: PChar): Integer; stdcall external sYBDLLName;
function Run(pDataHandle: Integer): Integer; stdcall external sYBDLLName;
function GetParam(pDataHandle: Integer; ParamName: PChar; ParamValue: PChar; nMaxValueLenth: Integer): Integer; stdcall external sYBDLLName;
function LocateDataSet(pDataHandle: Integer; DataSetName: PChar): Integer; stdcall external sYBDLLName;
function GetRowSize(pDataHandle: Integer): Integer; stdcall external sYBDLLName;
function NextRow(pDataHandle: Integer): Integer; stdcall external sYBDLLName;
function GetCurrentRow(pDataHandle: Integer): Integer; stdcall external sYBDLLName;
function GetColSize(pDataHandle: Integer): Integer; stdcall external sYBDLLName;
function GetFieldValue(pDataHandle: Integer; ParamName: PChar; ParamValue: PChar; nMaxValueLenth: Integer): Integer; stdcall external sYBDLLName;
function DestroyInstance(pDataHandle: Integer): Integer; stdcall external sYBDLLName;
function GetSysMessage(pDataHandle: Integer; pMessage: PChar; nMaxMessage: Integer): Integer; stdcall external sYBDLLName;
function EncryptWithCipher(pDataHandle: Integer; PlainData: PChar; EncryptedData: PChar; nMaxMessage: Integer): Integer; stdcall external sYBDLLName;
function HNReadCardBas(pDataHandle: THANDLE; pCardinfo, pCardId, pGmsfhm, pXm, pXtjgdm: PChar): HRESULT; stdcall external sYBDLLName;
function HNReadByPin(pDataHandle: THANDLE; pCardinfo, pCardId, pGmsfhm, pXm, pXtjgdm: PChar): HRESULT; stdcall external sYBDLLName;
function HNDoDebit(pDataHandle: THANDLE; pCardId, pGmsfhm, pXm, pTradeMoney, pSelfPay, pPlanPay, pJysj, pCardType, pCardInfo: PChar): HRESULT; stdcall external sYBDLLName;

type

  TYBService = class(TCustomDataService)
  private
    FYB4001: TCustomData;
  public

    procedure YBCalc(AHospID: string);
  end;

  TYBCardMode = (cmNone, cmNoPassword, cmPassword, cmWriteBack);

  TYBCardField = array[0..200] of Char;

  // 医保卡记录
  TYBCardRecord = record
    CardInfo: TYBCardField;
    CardId: TYBCardField;
    Gmsfhm: TYBCardField;
    Xm: TYBCardField;
    Xtjgdm: TYBCardField;
  end;

type
  TYBParam = array[0..iYBParamSize] of Char;


  TYBBaseData = class(TCustomData)
  private        
    function GetJZJLH: string;
    function GetSDYWH: string;
    function GetXTJGDM: string;
  public
    procedure PrepareData(); virtual;
    function GetSelfPay(): Double; virtual;
    function GetPlanPay(): Double; virtual;
    
    property JZJLH: string read GetJZJLH;
    property SDYWH: string read GetSDYWH;
    property XTJGDM: string read GetXTJGDM;
  end;

  TYBClinData = class(TYBBaseData)
  private
    FLinkData: TYBClinData;
    FClinID: string;
    FRecIDList: string;
  protected
    procedure SetClinID(const Value: string); virtual;
    procedure SetRecIDList(const Value: string); virtual;
  public
    property LinkData: TYBClinData read FLinkData write FLinkData;
    property ClinID: string read FClinID write SetClinID;
    property RecIDList: string read FRecIDList write SetRecIDList;
  end;

  TYBHospData = class(TYBBaseData)
  private
    FHospID: string;
  protected
    procedure SetHospID(const Value: string); virtual;
  public
    property HospID: string read FHospID write SetHospID;
  end;

  TYB_1002 = class(TYBClinData)
  private
    function GetGRZHYE: Currency;
    function GetGMSFHM: string;
    function GetXM: string;
    function GetXTJGDM: string;
    function GetXB: string;
    function GetSCNY: string;
    function GetDWMC: string;
    function GetTMJE: Currency;
    function GetZKBH: string;
  protected
    procedure DoDataBeforePost(Sender: TDADataTable); override;  
    procedure DoDataAfterPost(Sender: TDADataTable); override;
  public
    constructor Create(AOwner: TComponent);
    procedure OpenByZKBH(const ZKBH: string);

    procedure PrepareData(); override;

    property ZKBH: string read GetZKBH;
    property GMSFHM: string read GetGMSFHM;
    property XM: string read GetXM;
    property XTJGDM: string read GetXTJGDM;
    property XB: string read GetXB;
    property SCNY: string read GetSCNY;
    property DWMC: string read GetDWMC;
    property GRZHYE: Currency read GetGRZHYE;
    property TMJE: Currency read GetTMJE;
  end;

  TYBCore = class(TComponent)
  private
    FInitialized: Boolean;
    FLogined: Boolean;
    FUnitID: string;
    FServerIP: string;
    FServerPort: Word;
    FLoginName: string;
    FLoginPwd: string;
    FJBRQ: string;
    FXTJGDM: string;
    FGMSFHM: string;
    FSaveClinBalanceData: Boolean;
    FSaveHospBalanceData: Boolean;

    FDoneYBCard: Boolean;
    FYBCardRecord: TYBCardRecord;

    FDone10020: Boolean;
    FYB10020Data: TYB_1002;
    FYB90020Data: TYBClinData;
    FYB2003Param: TYBHospData;
    FYB2011Param: TYBHospData;
    FYB5001Param_Clin: TYBBaseData;
    FYB5001Param_Hosp: TYBBaseData;


    FRegisteredClinFeeViews: TStrings;
    FRegisteredHospFeeViews: TStrings;

    FOldAfterCancelHospFeeProc: TNotifyEvent;

    function GetYB10020Data(): TYB_1002;
  protected
    procedure CheckFHZ(YBHandle: THandle);
    procedure CheckResult(YBHandle: THandle; YBResult: HRESULT; YBFunName: string);
    procedure SetCommonParam(YBHandle: THandle; InParam: TYBBaseData);
    function GetCommonParam(ParamName: string): string;

    procedure DoYB(FN: string; InParam, OutParam: TYBBaseData;
      InData, OutData: array of TYBBaseData;
      CardMode: TYBCardMode; NoCard: Boolean);

    procedure ReadCardBas(YBHandle: THandle);
    procedure ReadCardByPin(YBHandle: THandle);
    procedure WriteCard(YBHandle: THandle; SelfPay, PlanPay: Double);

    procedure WriteParam(YBHandle: THandle; ATable: TDADataTable); overload;
    procedure WriteParam(YBHandle: THandle; const ParamTitle, ParamName, ParamValue: string); overload;
    procedure WriteDataTable(YBHandle: THandle; ADataName: string; InParam, ATable: TDADataTable);
    procedure ReadParam(YBHandle: THandle; ATable: TDADataTable);
    procedure ReadDataTable(YBHandle: THandle; ADataName: string; ATable: TDADataTable);

    procedure DoAfterCancelHospFeeProc(Sender: TObject);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy(); override;

    procedure DoInit();
    procedure DoLogin();
    procedure PrepareForNext();

    procedure DoYB10020();
    procedure DoYB90020(JZJLH, SDYWH: string; SelfPay, PlanPay: Double; NoCard: Boolean);
    procedure DoYB20030(const ZYH: string);
    procedure DoYB20110(const ZYH: string);
    procedure DoYB50010_Clin(ClinFeeID: string);
    procedure DoYB50010_Hosp(HospFeeID: string);

    property Initialized: Boolean read FInitialized;
    property Logined: Boolean read FLogined;
    property DoneYBCard: Boolean read FDoneYBCard;
    property CardRecord: TYBCardRecord read FYBCardRecord;
    property Done10020: Boolean read FDone10020;
    property YB10020Data: TYB_1002 read GetYB10020Data;
    property XTJGDM: string read FXTJGDM write FXTJGDM;
    property GMSFHM: string read FGMSFHM write FGMSFHM;
    property UnitID: string read FUnitID;
    property SaveClinBalanceData: Boolean read FSaveClinBalanceData;
    property SaveHospBalanceData: Boolean read FSaveHospBalanceData;
    property RegisteredClinFeeViews: TStrings read FRegisteredClinFeeViews;
    property RegisteredHospFeeViews: TStrings read FRegisteredHospFeeViews;
  end;

  TYB_2001 = class(TYBHospData)
  private
  protected
    procedure DoDataAfterInsert(Sender: TDADataTable); override;
  public
    constructor Create(AOwner: TComponent);
    procedure PrepareData(); override;

    procedure OpenByHospID(HospID: string);
  end;

  TYB_2004_InParam = class(TYBHospData)
  private
  public
    constructor Create(AOwner: TComponent);
    procedure OpenByHospID(AHospID: string);
  end;

  TYB_2004_InData = class(TYBHospData)
  private
  public
    constructor Create(AOwner: TComponent);
    procedure OpenByHospID(AHospID: string);
  end;

  TYB_2004_OutParam = class(TYBHospData)
  private
  protected
    procedure DoDataAfterInsert(Sender: TDADataTable); override;
  public
    constructor Create(AOwner: TComponent);
    procedure OpenByYBID(YBID: Integer);
  end;

  TYB_2010_InParam = class(TYBHospData)
  public
    constructor Create(AOwner: TComponent);
    procedure OpenByHospID(HospID: string);
  end;

  TYB_2010_OutParam = class(TYBHospData)
  public
    constructor Create(AOwner: TComponent);
  end;

  TYB_2011_InParam = class(TYBHospData)
  public
    constructor Create(AOwner: TComponent);  
    procedure OpenByHospID(HospID: string);
  end;

  TYB_Clin_OutData = class(TYBClinData)
  private    
  protected
  public
  end;

  TYB_3001_InParam = class(TYBClinData)
  protected
    procedure SetClinID(const Value: string); override;
  public
    constructor Create(AOwner: TComponent);
    procedure PrepareData(); override;
  end;

  TYB_3001_InData = class(TYBClinData)
  private
  public
    constructor Create(AOwner: TComponent);
    procedure PrepareData(); override;
  end;

  TYB_3001_OutParam = class(TYBClinData)
  private
    function GetYLFYZE: Currency;
    function GetCZFJE: Currency;
    function GetXJZF: Currency;
    function GetYBZHZF: Currency;
    function GetJBYLFDFY: Currency;
  public
    constructor Create(AOwner: TComponent);
    procedure PrepareData(); override;

    property YLFYZE: Currency read GetYLFYZE;
    property JBYLFDFY: Currency read GetJBYLFDFY;
    property XJZF: Currency read GetXJZF;
    property YBZHZF: Currency read GetYBZHZF;
    property CZFJE: Currency read GetCZFJE;
  end;

  TYB_4005_InParam = class(TYBClinData)
  private
  public
    constructor Create(AOwner: TComponent);
    procedure PrepareData(); override;
  end;

  TYB_4005_OutParam = class(TYBClinData)
  private
  protected
    procedure DoDataBeforePost(Sender: TDADataTable); override;
  public
    constructor Create(AOwner: TComponent);
    procedure PrepareData(); override;

    function GetSelfPay(): Double; override;
    function GetPlanPay(): Double; override;
  end;

  TYB_4005_OutData = class(TYBClinData)
  private
  protected
    procedure DoDataAfterInsert(Sender: TDADataTable); override;
  public
    constructor Create(AOwner: TComponent);
    procedure PrepareData(); override;
  end;

  TYB_3002_InParam = class(TYBClinData)
  protected
    procedure SetClinID(const Value: string); override;
  public
    constructor Create(AOwner: TComponent);
    procedure PrepareData(); override;
  end;

  TYB_3002_InData = class(TYBClinData)
  private
  public
    constructor Create(AOwner: TComponent);
    procedure PrepareData(); override;
  end;

  TYB_3002_OutParam = class(TYBClinData)
  private
    function GetYLFYZE: Currency;
    function GetJBYLFDFY: Currency;
  public
    constructor Create(AOwner: TComponent);
    procedure PrepareData(); override;

//    property YLFYZE: Currency read GetYLFYZE;
//    property JBYLFDFY: Currency read GetJBYLFDFY;
  end;

  TYB_4006_InParam = class(TYBClinData)
  private
  public
    constructor Create(AOwner: TComponent);
    procedure PrepareData(); override;
  end;

  TYB_4006_OutParam = class(TYBClinData)
  private
  protected
    procedure DoDataBeforePost(Sender: TDADataTable); override;
  public
    constructor Create(AOwner: TComponent);
    procedure PrepareData(); override;

    function GetSelfPay(): Double; override;
    function GetPlanPay(): Double; override;
  end;

  TYB_4006_OutData = class(TYBClinData)
  private
  protected
    procedure DoDataAfterInsert(Sender: TDADataTable); override;
  public
    constructor Create(AOwner: TComponent);
    procedure PrepareData(); override;
  end;

  TYB_3003_InParam = class(TYBClinData)
  private
    procedure SetClinID(const Value: string); override;
  public
    constructor Create(AOwner: TComponent);
    procedure PrepareData(); override;
  end;

  TYB_3003_InData = class(TYBClinData)
  private
  public
    constructor Create(AOwner: TComponent);
    procedure PrepareData(); override;
  end;

  TYB_3003_OutParam = class(TYBClinData)
  private
  public
    constructor Create(AOwner: TComponent);
    procedure PrepareData(); override;
  end;

  TYB_4007_InParam = class(TYBClinData)
  private
  public
    constructor Create(AOwner: TComponent);
    procedure PrepareData(); override;
  end;

  TYB_4007_OutParam = class(TYBClinData)
  private
  protected
    procedure DoDataBeforePost(Sender: TDADataTable); override;
  public
    constructor Create(AOwner: TComponent);
    procedure PrepareData(); override;

    function GetSelfPay(): Double; override;
    function GetPlanPay(): Double; override;
  end;

  TYB_4007_OutData = class(TYBClinData)
  private
  protected
    procedure DoDataAfterInsert(Sender: TDADataTable); override;
  public
    constructor Create(AOwner: TComponent);
    procedure PrepareData(); override;
  end;

  TYB_3004_InParam = class(TYBClinData)
  private
    procedure SetClinID(const Value: string); override;
  public
    constructor Create(AOwner: TComponent);
    procedure PrepareData(); override;
  end;

  TYB_3004_InData = class(TYBClinData)
  private
  public
    constructor Create(AOwner: TComponent);
    procedure PrepareData(); override;
  end;

  TYB_3004_OutParam = class(TYBClinData)
  private
  public
    constructor Create(AOwner: TComponent);
    procedure PrepareData(); override;
  end;

  TYB_4008_InParam = class(TYBClinData)
  private
  public
    constructor Create(AOwner: TComponent);
    procedure PrepareData(); override;
  end;

  TYB_4008_OutParam = class(TYBClinData)
  private
  protected
    procedure DoDataBeforePost(Sender: TDADataTable); override;
  public
    constructor Create(AOwner: TComponent);
    procedure PrepareData(); override;

    function GetSelfPay(): Double; override;
    function GetPlanPay(): Double; override;
  end;

  TYB_4008_OutData = class(TYBClinData)
  private
  protected
    procedure DoDataAfterInsert(Sender: TDADataTable); override;
  public
    constructor Create(AOwner: TComponent);
    procedure PrepareData(); override;
  end;

  TYB_4009_InParam = class(TYBClinData)
  private
  public
    constructor Create(AOwner: TComponent);
    procedure PrepareData(); override;
  end;

  TYB_4009_OutParam = class(TYBClinData)
  private
  protected
    procedure DoDataBeforePost(Sender: TDADataTable); override;
  public
    constructor Create(AOwner: TComponent);
    procedure PrepareData(); override;

    function GetSelfPay(): Double; override;
    function GetPlanPay(): Double; override;
  end;

  TYB_4009_OutData = class(TYBClinData)
  private
  protected
    procedure DoDataAfterInsert(Sender: TDADataTable); override;
  public
    constructor Create(AOwner: TComponent);
    procedure PrepareData(); override;
  end;

  TYB_4010_InParam = class(TYBClinData)
  private
  public
    constructor Create(AOwner: TComponent);
    procedure PrepareData(); override;
  end;

  TYB_4010_OutParam = class(TYBClinData)
  private
  protected
    procedure DoDataBeforePost(Sender: TDADataTable); override;
  public
    constructor Create(AOwner: TComponent);
    procedure PrepareData(); override;

    function GetSelfPay(): Double; override;
    function GetPlanPay(): Double; override; 
  end;

  TYB_4010_OutData = class(TYBClinData)
  private
  protected
    procedure DoDataAfterInsert(Sender: TDADataTable); override;
  public
    constructor Create(AOwner: TComponent);
    procedure PrepareData(); override;
  end;

  TYB_20050_Balance_InParam = class(TYBHospData)
  protected
  public
    constructor Create(AOwner: TComponent; ALogicalName: string);
    procedure PrepareData(); override;
    procedure PrepareNext();
  end;

  TYB_20050_Balance_OutParam = class(TYBHospData)
  private
  protected
    procedure DoDataBeforePost(Sender: TDADataTable); override;
  public
    constructor Create(AOwner: TComponent; ALogicalName: string);
    procedure PrepareData(); override;
    procedure PrepareNext();

    function GetSumPrice(): Currency; virtual;
  end;

  TYB_40010_Print_InParam = class(TYBHospData)
  protected
  public
    constructor Create(AOwner: TComponent; ALogicalName: string);
    procedure PrepareData(); override;
  end;

  TYB_40010_Print_OutParam = class(TYBHospData)
  protected
    procedure DoDataBeforePost(Sender: TDADataTable); override;
  public
    constructor Create(AOwner: TComponent; ALogicalName: string);
    procedure PrepareData(); override;
    procedure ApplyUpdates(); override;
  end;

  TYB_40010_Print_OutData = class(TYBHospData)
  private
  protected
    procedure DoDataBeforePost(Sender: TDADataTable); override;
  public
    constructor Create(AOwner: TComponent; ALogicalName: string);
    procedure PrepareData(); override;
  end;

  TYB_2005_InParam = class(TYB_20050_Balance_InParam)
  public
    constructor Create(AOwner: TComponent);
  end;

  TYB_2005_OutParam = class(TYB_20050_Balance_OutParam)
  public
    constructor Create(AOwner: TComponent);
    function GetSelfPay(): Double; override;
    function GetPlanPay(): Double; override;
  end;

  TYB_4001_InParam = class(TYB_40010_Print_InParam)
  public
    constructor Create(AOwner: TComponent);
  end;

  TYB_4001_OutParam = class(TYB_40010_Print_OutParam)
  public
    constructor Create(AOwner: TComponent);
  end;

  TYB_4001_OutData = class(TYB_40010_Print_OutData)
  public
    constructor Create(AOwner: TComponent); virtual;
  end;

  TYB_2006_InParam = class(TYB_20050_Balance_InParam)
  public
    constructor Create(AOwner: TComponent);
  end;

  TYB_2006_OutParam = class(TYB_20050_Balance_OutParam)
  public
    constructor Create(AOwner: TComponent);
    function GetSelfPay(): Double; override;
    function GetPlanPay(): Double; override;

    function GetSumPrice(): Currency; override;
  end;

  TYB_4002_InParam = class(TYB_4001_InParam);

  TYB_4002_OutParam = class(TYB_40010_Print_OutParam)
  public
    constructor Create(AOwner: TComponent);
  end;

  TYB_4002_OutData = class(TYB_4001_OutData)
  public
    constructor Create(AOwner: TComponent);
  end;

  TYB_2007_InParam = class(TYB_2006_InParam);

  TYB_2007_OutParam = class(TYB_20050_Balance_OutParam)
  public
    constructor Create(AOwner: TComponent);
    function GetSelfPay(): Double; override;
    function GetPlanPay(): Double; override; 
    function GetSumPrice(): Currency; override;
  end;

  TYB_4003_InParam = class(TYB_4002_InParam);

  TYB_4003_OutParam = class(TYB_40010_Print_OutParam)
  public
    constructor Create(AOwner: TComponent);
  end;

  TYB_4003_OutData = class(TYB_4001_OutData)
  public
    constructor Create(AOwner: TComponent);
  end;

  TYB_2008_InParam = class(TYB_2006_InParam);

  TYB_2008_OutParam = class(TYB_20050_Balance_OutParam)
  public
    constructor Create(AOwner: TComponent); 
    function GetSelfPay(): Double; override;
    function GetPlanPay(): Double; override;  
    function GetSumPrice(): Currency; override;
  end;

  TYB_4004_InParam = class(TYB_4002_InParam);

  TYB_4004_OutParam = class(TYB_40010_Print_OutParam)
  public
    constructor Create(AOwner: TComponent);
  end;

  TYB_4004_OutData = class(TYB_4001_OutData)
  public
    constructor Create(AOwner: TComponent);
  end;

  TcvYBClinMaster = class(TTableGridDataView)
  private      
    FInvoiceEdit: TcxMaskEdit;
    procedure DoDoubleClick(Sender: TObject);
    procedure DoInvoiceIDEvent(Sender: TObject);
  protected
    procedure BuildViewLayout(); override;
  public
    procedure DataQuery(); override;
  end;

  TcvYBClinDetail = class(TTableGridDataView)
  private
  protected
    procedure BuildViewLayout(); override;
  public
    procedure DataQuery(); override;
  end;

  TcvYBHospMaster = class(TTableGridDataView)
  private
    FInvoiceEdit: TcxMaskEdit;
    procedure DoDoubleClick(Sender: TObject);
    procedure DoInvoiceIDEvent(Sender: TObject);
  protected
    procedure BuildViewLayout(); override;
  public
    procedure DataQuery(); override;
  end;
  
  TYB_ClinFee_Core = class;

  TYB_ClinFee_Base = class(TBaseLayoutView)
  private
    BalanceInParam: TYBClinData;
    BalanceInData: TYBClinData;
    BalanceOutParam: TYBClinData;

    PrintInParam: TYBClinData;
    PrintOutParam: TYBClinData;
    PrintOutData: TYBClinData;
  protected
    FBalanceYBNum: string;
    FPrintYBNum: string;
    FClinFeeType: Integer;

    FYBClinCore: TYB_ClinFee_Core;
    FYBMoney: Currency;
    FBalanced: Boolean;

    procedure BuildViewLayout(); override;

    procedure BuildYBData(); virtual;
    procedure DoPrepare(YBClinCore: TYB_ClinFee_Core); virtual;
    procedure DoCalcYBMoney(); virtual;
    procedure PrintCallback(Sender: TObject); virtual;

    procedure DoBalance(); virtual;
    function DoPrint(): Boolean; virtual;
    function CanNoCard(): Boolean; virtual;
  public
    property YBClinCore: TYB_ClinFee_Core read FYBClinCore;
    property YBMoney: Currency read FYBMoney write FYBMoney;
    property Balanced: Boolean read FBalanced write FBalanced;
  end;

  TClinFeeBaseViewYBClass = class of TYB_ClinFee_Base;

  TYB_ClinFee_Core = class(TBaseDialog)
  private
    FYBItem: TdxLayoutItem;
    FCashierView: TClinCashierView;
    FYBCardAction: TAction;
    FBalanceAction: TAction;
    FPrintAction: TAction;

    FRegisteredClinFeeViews: TStrings;
    FClinFeeViewSelectDialog: TSelectDialog;

    FCurClinYBView: TYB_ClinFee_Base;

    FNoCardCheckBox: TcxCheckBox;

    function SelectFeeType: Boolean;
    procedure DoNoCardCheckBoxClick(Sender: TObject);
  private
    procedure DoYBCardAction(Sender: TObject);
    procedure DoYBCardUpdate(Sender: TObject);

    procedure DoBalanceAction(Sender: TObject);
    procedure DoBalanceUpdate(Sender: TObject);

    procedure DoPrintAction(Sender: TObject);
    procedure DoPrintUpdate(Sender: TObject);

    procedure FeeCheck();
  protected
    procedure BuildDialog(); override;
    procedure DoDialogShow(Sender: TObject); override;
    function DoExecute(CommandID: Integer; const Param: array of Variant): Variant; override;
  public
    destructor Destroy(); override;
    property CashierView: TClinCashierView read FCashierView;
  end;

  TYB_ClinFee_Plugin = class(TClinBaseFeePlugin)
  private
    FClinView: TClinCashierView;
    FClinFeeMaster: TcdClinFeeMaster;
  public
    constructor Create(AOwner: TComponent); override;
    function GetPluginName: string; override;
    procedure BuildPluginAction(AClinRecipeView: TClinCashierView); override;

    procedure DoBeforeInFee(AReg: TcdClinReg; AFee: TcdClinFeeMaster); override;
    procedure DoAfterInFee(AReg: TcdClinReg; AFeeID: string); override;

    procedure DoBeforeReturnFee(AFee: TcdClinFeeMaster; AReturnFee: TcdClinFeeMaster); override;
    procedure DoAfterReturnFee(AFee: TcdClinFeeMaster; ANewFeeID: string); override;
  end;

  TYB_ClinFee_4005 = class(TYB_ClinFee_Base)
  private
  protected
    procedure BuildYBData(); override;
    procedure DoCalcYBMoney(); override;
  public
  end;

  TYB_ClinFee_4006 = class(TYB_ClinFee_Base)
  private
  protected
    procedure BuildYBData(); override;
    procedure DoCalcYBMoney(); override;
    function CanNoCard(): Boolean; override;
  public
  end;

  TYB_ClinFee_4007 = class(TYB_ClinFee_Base)
  private
  protected
    procedure BuildYBData(); override;
    procedure DoCalcYBMoney(); override;
  public
  end;

  TYB_ClinFee_4008 = class(TYB_ClinFee_Base)
  private
  protected
    procedure BuildYBData(); override;
    procedure DoCalcYBMoney(); override;
  public
  end;

  TYB_ClinFee_4009 = class(TYB_ClinFee_Base)
  private
  protected
    procedure BuildYBData(); override;  
    procedure DoCalcYBMoney(); override;
    procedure DoPrepare(YBClinCore: TYB_ClinFee_Core); override;
  public
  end;

  TYB_ClinFee_4010 = class(TYB_ClinFee_Base)
  private
  protected
    procedure BuildYBData(); override;
    procedure DoCalcYBMoney(); override;
    procedure DoPrepare(YBClinCore: TYB_ClinFee_Core); override;
  public
  end;

  TYB_Hosp_Reg = class(TBaseDialog)
  private
    FPatientData: TCustomData;
    FPatientType: Integer;
    FHospID: string;
    FYBRegData: TYB_2001;
    FYBRegOutParam: TYBClinData;
    procedure DoYBFakeAction(Sender: TObject);
  protected
    procedure BuildDialog(); override;
    function DoExecute(CommandID: Integer; const Param: array of Variant): Variant; override;
    procedure DoDialogOK(Sender: TObject); override;
  public
  end;

  TOperationYBHospReg = class(TViewOperation)
  private
    procedure DoActionCancelReg(Sender: TObject);
  public
    procedure AfterConstruction(); override;
  end;

  TYB_Hosp_ItemUpload = class(TTableGridDataView)
  private
    FHospID: string;
    F2004InParam: TYB_2004_InParam;
    F2004InData: TYB_2004_InData;
    F2004OutParam: TYB_2004_OutParam;
    FDetailList: TStrings;

    procedure DoActionWholeUpload(Sender: TObject);
    procedure DoActionWholeUploadUpdate(Sender: TObject);
    procedure DoActionSingleUpload(Sender: TObject);
    procedure DoBuildDetailList(ADataTable: TDADataTable; AParam: Variant);
  protected
    procedure BuildViewLayout(); override;
    procedure BuildViewAction(); override;
    function DoExecute(CommandID: Integer; const Param: array of Variant): Variant; override;
  public
    destructor Destroy(); override;
    procedure DataQuery(); override;
  end;

  TOperationYBItemUpload = class(TBaseOperation)
  private
    procedure DoActionXNHUpload(Sender: TObject);
    procedure DoActionYBCalc(Sender: TObject);
  protected
    function DoExecute(CommandID: Integer; const Param: array of Variant): Variant; override;
  public
    procedure AfterConstruction(); override;
  end;

  TYB_Hosp_OutReg = class(TBaseDialog)
  private
    FHospID: string;
    FYBOutRegInParam: TYB_2010_InParam;
    FYBOutRegOutParam: TYB_2010_OutParam;
  protected
    procedure BuildDialog(); override;
    function DoExecute(CommandID: Integer; const Param: array of Variant): Variant; override;
    procedure DoDialogOK(Sender: TObject); override;
  public
  end;

  TOperationYBHospOutReg = class(TViewOperation)
  private
    procedure DoActionCancelOutReg(Sender: TObject);
  public
    procedure AfterConstruction(); override;
  end;


  TYB_HospFee_Base = class;
  TYB_HospFee_BaseClass = class of TYB_HospFee_Base;

  TYB_HospFee_Core = class(TBaseDialog)
  private
    FHospFeeDialog: TcvHospFeeDialog;
    FYBItem: TdxLayoutItem;  
    FYBCardAction: TAction;
    FBalanceAction: TAction;
    FPrintAction: TAction;

    FRegisteredHospFeeViews: TStrings;
    FCurYBHospView: TYB_HospFee_Base;

    FHospID: string;
    FYB2001: TYB_2001;
    FYB2010: TYB_2010_InParam;
    function GetNoCard: Boolean;

  private
    procedure DoYBCardAction(Sender: TObject);
    procedure DoYBCardUpdate(Sender: TObject);

    procedure DoBalanceAction(Sender: TObject);
    procedure DoBalanceUpdate(Sender: TObject);

    procedure DoPrintAction(Sender: TObject);
    procedure DoPrintUpdate(Sender: TObject);
  protected
    procedure BuildDialog(); override;
    procedure DoDialogShow(Sender: TObject); override;
  public
    destructor Destroy(); override;
    function Execute(HospFeeDialog: TcvHospFeeDialog): Boolean;

    property HospID: string read FHospID;
    property HospFeeDialog: TcvHospFeeDialog read FHospFeeDialog;
    property CurYBHospView: TYB_HospFee_Base read FCurYBHospView;
    property NoCard: Boolean read GetNoCard;
  end;

  TYB_HospFee_Base = class(TBaseLayoutView)
  private
    BalanceInParam: TYB_20050_Balance_InParam;
    BalanceOutParam: TYB_20050_Balance_OutParam;
    PrintInParam: TYBHospData;
    PrintOutParam: TYBHospData;
    PrintOutData: TYBHospData;

    function GetSDYWH: string;
    function GetYBSumPrice: Currency;
  protected
    FBalanceYBNum: string;
    FPrintYBNum: string;
    FHospFeeType: Integer;

    FYBMoney: Currency;
    FBalanced: Boolean;

    procedure BuildViewLayout(); override;

    procedure CallYBPrint(); virtual;
    procedure PrintCallback(Sender: TcvHospFeeDialog); virtual;

    procedure BuildYBData(); virtual;
    procedure DoPrepare(); virtual;
    procedure DoBalance(); virtual;
    function DoPrint(): Boolean; virtual;

    procedure DoCalcYBMoney(); virtual;
  public
    property YBSumPrice: Currency read GetYBSumPrice;
    property Balanced: Boolean read FBalanced;
    property YBMoney: Currency read FYBMoney;
    property SDYWH: string read GetSDYWH;
  end;

  TYB_HospFee_4001 = class(TYB_HospFee_Base)
  private
  protected
    procedure BuildYBData(); override;
    procedure DoCalcYBMoney(); override;
  public
  end;

  TYB_HospFee_4002 = class(TYB_HospFee_Base)
  private
  protected
    procedure BuildYBData(); override;
    procedure DoCalcYBMoney(); override;
  public
  end;

  TYB_HospFee_4003 = class(TYB_HospFee_Base)
  private
  protected
    procedure BuildYBData(); override;
    procedure DoCalcYBMoney(); override;
  public
  end;

  TYB_HospFee_4004 = class(TYB_HospFee_Base)
  private
  protected
    procedure BuildYBData(); override;
    procedure DoCalcYBMoney(); override;
  public
  end;

  TcvYBSeverePatient = class(TTableGridDataView)
  private
    procedure DoDoubleClick(Sender: TObject);
    procedure DoReadCard(Sender: TObject);
    procedure DoBeforePost(Sender: TObject);
  protected
    procedure BuildViewLayout(); override;
    procedure BuildViewAction(); override;
  public
    procedure DataQuery(); override;
    procedure DataInsert(); override;
  end;

procedure YBCard2Patient(ACard: TYB_1002; APatient: TDADataTable);
function YBDate2Date(ADate: string): TDateTime;

procedure DefineYBCommonData(ADataContainer: TDataContainer);
procedure OrganizeYBOperations();

function YBHospFeeProc(Sender: TcvHospFeeDialog): Boolean;

var
  YBCore: TYBCore;
  YBService: TYBService;
  YBHospCore: TYB_HospFee_Core;

implementation


function YBHospFeeProc(Sender: TcvHospFeeDialog): Boolean;
begin
  if YBHospCore = nil then
    YBHospCore := TYB_HospFee_Core.Create(Application);
  Result := YBHospCore.Execute(Sender);
end;

procedure DefineYBCommonData(ADataContainer: TDataContainer);
begin
  with ADataContainer do
  begin
    RegisterData(HisConnection, sDataServiceYB, sDataNameYBType, THisData, 0, '');
    RegisterData(HisConnection, sDataServiceYB, sDataNameYBStatType, THisData, 0, '');
    RegisterData(HisConnection, sDataServiceYB, sDataNameYBJZLB, THisData, 0, '');
    RegisterData(HisConnection, sDataServiceYB, 'D_YB_02_RYLB', THisData, 0, '');
    RegisterData(HisConnection, sDataServiceYB, 'D_YB_03_KDJBZ', THisData, 0, '');
    RegisterData(HisConnection, sDataServiceYB, 'D_YB_04_WSBZ', THisData, 0, '');
    RegisterData(HisConnection, sDataServiceYB, 'D_YB_05_JZLB_2001', THisData, 0, '');
    RegisterData(HisConnection, sDataServiceYB, 'D_YB_05_JZLB_3001', THisData, 0, '');
    RegisterData(HisConnection, sDataServiceYB, 'D_YB_05_JZLB_3002', THisData, 0, '');
    RegisterData(HisConnection, sDataServiceYB, 'D_YB_05_JZLB_3003', THisData, 0, '');
    RegisterData(HisConnection, sDataServiceYB, 'D_YB_05_JZLB_3004', THisData, 0, '');
    RegisterData(HisConnection, sDataServiceYB, 'D_YB_06_BFZYZT', THisData, 0, '');
    RegisterData(HisConnection, sDataServiceYB, 'D_YB_07_SYLB', THisData, 0, '');
    RegisterData(HisConnection, sDataServiceYB, 'D_YB_08_BZLB', THisData, 0, '');
    RegisterData(HisConnection, sDataServiceYB, 'D_YB_12_FYJSMS', THisData, 0, '');
    RegisterData(HisConnection, sDataServiceYB, 'D_YB_13_ZYJSLB', THisData, 0, '');
    RegisterData(HisConnection, sDataServiceYB, 'D_YB_14_ZGLB', THisData, 0, '');
    RegisterData(HisConnection, sDataServiceYB, 'D_YB_15_GWYLB', THisData, 0, '');
    RegisterData(HisConnection, sDataServiceYB, 'D_YB_16_CBZT', THisData, 0, '');
  end;
end;

function Operation_YB_ReadCard(Sender: TBaseOperation; AID: Integer;
  const AParam: array of Variant): Variant;
begin
  YBCore.DoYB10020;
  if TObject(Integer(AParam[0])).InheritsFrom(THisPatientDialog) then
    YBCard2Patient(YBCore.YB10020Data, THisPatientDialog(Integer(AParam[0])).Patient.Table)
  else if TObject(Integer(AParam[0])).InheritsFrom(TClinRegView2) then
  begin
    with TClinRegView2(Integer(AParam[0])).RegHelpData do
    begin
      Edit;
      AsString['IDCode'] := YBCore.YB10020Data.GMSFHM;
      AsString['PatientName'] := YBCore.YB10020Data.XM;
      AsString['Sex'] := IfThen(YBCore.YB10020Data.XB = '1', '男', '女');
      AsInteger['Age'] := YearsBetween(Now, StrToDate(YBCore.YB10020Data.SCNY));
    end;
  end;
  Result := Integer(YBCore.YB10020Data);
end;

function Operation_YB_CalcFee(Sender: TBaseOperation; AID: Integer;
  const AParam: array of Variant): Variant;
begin
  YBService.YBCalc(TTableGridDataView(TObject(Integer(AParam[0]))).
    ViewData.AsString[sFieldHospID]);
end;

procedure OrganizeYBOperations();
begin

  with TProcOperation.Create(sOperationIDYBReadCard) do
  begin
    Category := sOperationCategoryClinic;
    Caption := '读医保卡';
    ImageName := 'yb_card';
    Order := 'c05';
    ShortKey := ShortCut(VK_F10, []);
    Flag := iOperationFlag_ClinReg or iOperationFlag_NoMenu or iOperationFlag_NoTree;
    OnExecute := Operation_YB_ReadCard;
  end;

  with TViewOperation.Create(sOperationIDYBClinTakeFee) do
  begin
    Category := sOperationCategoryClinic;
    Caption := '医保收费';
    ImageName := sOperationIDYBClinTakeFee;
    Order := 'c05';
    ShortKey := ShortCut(VK_F12, []);
    Flag := iOperationFlag_ClinFee or iOperationFlag_NoMenu or iOperationFlag_NoTree;
    ViewClass := TYB_ClinFee_Core;
  end;

  with TViewOperation.Create(sOperationIDYBClinMaster) do
  begin
    Category := sOperationCategoryYB;
    Caption := '医保门诊收费查询';
    ImageName := sOperationIDYBClinMaster;
    Access := sAccessYBQuery;
    Order := 'Q01';
    ViewClass := TcvYBClinMaster;
  end;

  with TViewOperation.Create(sOperationIDYBHospMaster) do
  begin
    Category := sOperationCategoryYB;
    Caption := '医保住院收费查询';
    ImageName := sOperationIDYBHospMaster;
    Access := sAccessYBQuery;
    Order := 'Q02';
    ViewClass := TcvYBHospMaster;
  end;

  with TOperationYBHospReg.Create(sOperationIDYBHospReg) do
  begin
    Category := sOperationCategoryYB;
    Caption := '医保住院登记';
    ImageName := sOperationIDYBHospReg;
    Order := 'q05';
    Flag := iOperationFlag_HospInOut or iOperationFlag_NoMenu or iOperationFlag_NoTree;
    ViewClass := TYB_Hosp_Reg;
    CustomAttributes.Add('PluginCategory=YB');
  end;

  with TViewOperation.Create(sOperationIDYBHospItemUpload) do
  begin
    Category := sOperationCategoryYB;
    Caption := '医保上传';
    ImageName := 'upload';
    Order := 'q06';
    Flag := iOperationFlag_HospInOut or iOperationFlag_NoMenu or iOperationFlag_NoTree;
    ViewClass := TYB_Hosp_ItemUpload;
    CustomAttributes.Add('PluginCategory=YB');
  end;

  with TOperationYBItemUpload.Create(sOperationIDYBHospItemUpload2) do
  begin
    Category := sOperationCategoryYB;
    Caption := '医保上传';
    ImageName := 'upload';
    Order := 'q06'; 
    CustomAttributes.Add('PluginCategory=Business3');
    Flag := iOperationFlag_HospPatient or iOperationFlag_NoMenu or iOperationFlag_NoTree;
  end;

  with TOperationYBHospOutReg.Create(sOperationIDYBHospOutReg) do
  begin
    Category := sOperationCategoryYB;
    Caption := '医保出院登记';
    ImageName := sOperationIDYBHospOutReg;
    Order := 'q07';
    Flag := iOperationFlag_HospInOut or iOperationFlag_NoMenu or iOperationFlag_NoTree;
    ViewClass := TYB_Hosp_OutReg; 
    CustomAttributes.Add('PluginCategory=YB');
  end;

  with TProcOperation.Create(sOperationIDYBHospCalcFee) do
  begin
    Category := sOperationCategoryYB;
    Caption := '医保试算';
    ImageName := 'calc';
    Order := 'q08';
    Flag := iOperationFlag_HospInOut or iOperationFlag_NoMenu or iOperationFlag_NoTree;
    OnExecute := Operation_YB_CalcFee;
    CustomAttributes.Add('PluginCategory=YB');
  end;

  with TViewOperation.Create(sOperationIDYBSeverePatient) do
  begin
    Category := sOperationCategoryYB;
    Caption := '医保重症患者';
    ImageName := sOperationIDYBSeverePatient;
    Access := sAccessYBSeverePatient;
    Order := 'Q00';
    ViewClass := TcvYBSeverePatient;
  end;
end;

procedure YBCard2Patient(ACard: TYB_1002; APatient: TDADataTable);
begin
  with APatient do
  begin
    FieldByName('PatientName').AsString := ACard.XM;
    FieldByName('Sex').AsString := IfThen(SameText(ACard.XB, '1'), '男', '女');
    FieldByName('Birthday').AsDateTime := YBDate2Date(ACard.SCNY);
    FieldByName('IDCode').AsString := ACard.GMSFHM;
    FieldByName('YBCode').AsString := ACard.ZKBH;
    FieldByName('WorkUnit').AsString := ACard.DWMC;
  end;
end;

function YBDate2Date(ADate: string): TDateTime;
begin
  Result := StrToDate(ADate);
end;

{ TYBCore }

procedure TYBCore.CheckFHZ(YBHandle: THandle);
const
  sYBRunError = '医保执行出错! '#13#10#13#10'返回值: %s'#13#10'返回消息：%s';
var
  FHZ: array[0..10] of Char;
  MSG: array[0..300] of Char;
begin
  GetParam(YBHandle, 'FHZ', FHZ, 10);
  GetParam(YBHandle, 'MSG', MSG, 300);
  Check(StrToIntDef(FHZ, 0) <> 1, sYBRunError, [FHZ, MSG]);
  AppCore.Logger.Write('医保提示：' + Msg, mtInfo, 0);
  if StrLen(Msg) > 10 then
  begin
    ShowOK('医保提示: ' + MSG);
  end;
end;

procedure TYBCore.CheckResult(YBHandle: THandle; YBResult: HRESULT; YBFunName: string);
const
  sYBCallError = '医保调用(%s)出错!'#13#10#13#10'错误号: %d'#13#10'错误消息: %s';
var
  Msg: array[0..1024] of Char;
begin
  if YBResult <= 0 then
  begin
    GetSysMessage(YBHandle, Msg, 1024);
    raise Exception.CreateFmt(sYBCallError, [YBFunName, YBResult, Msg]);
  end;
end;

constructor TYBCore.Create(AOwner: TComponent);
begin
  inherited;

  FOldAfterCancelHospFeeProc := AfterCancelHospFeeProc;
  AfterCancelHospFeeProc := DoAfterCancelHospFeeProc;

  FRegisteredClinFeeViews := TStringList.Create();
  FRegisteredClinFeeViews.AddObject('医保门诊基本结算', TObject(TYB_ClinFee_4005));
  FRegisteredClinFeeViews.AddObject('医保门诊重症结算', TObject(TYB_ClinFee_4006));
  FRegisteredClinFeeViews.AddObject('医保门诊离休军人结算', TObject(TYB_ClinFee_4007));
  FRegisteredClinFeeViews.AddObject('医保门诊工伤结算', TObject(TYB_ClinFee_4008));
  FRegisteredClinFeeViews.AddObject('医保门诊生育结算', TObject(TYB_ClinFee_4009));
  FRegisteredClinFeeViews.AddObject('医保门诊人工流产结算', TObject(TYB_ClinFee_4010));

  FRegisteredHospFeeViews := TStringList.Create();
  FRegisteredHospFeeViews.AddObject('2005', TObject(TYB_HospFee_4001));
  FRegisteredHospFeeViews.AddObject('2006', TObject(TYB_HospFee_4002));  
  FRegisteredHospFeeViews.AddObject('2007', TObject(TYB_HospFee_4003));
  FRegisteredHospFeeViews.AddObject('2008', TObject(TYB_HospFee_4004));
end;

procedure TYBCore.DoInit;
begin
  if FInitialized then
    Exit;

  FUnitID := SystemService.GetParam('YB.UnitID', '990066');
  FServerIP := SystemService.GetParam('YB.ServerIP', '10.2.120.114');
  FServerPort := StrToInt(SystemService.GetParam('YB.ServerPort', '9090'));
  FLoginName := SystemService.GetParam('YB.LoginName', '990066');
  FLoginPwd := SystemService.GetParam('YB.LoginPwd', '990066');     
  FSaveClinBalanceData := SystemService.GetParam('YB.SaveClinBalanceData', True);
  FSaveHospBalanceData := SystemService.GetParam('YB.SaveHospBalanceData', True);
  Check(Initialize(PChar(FServerIP), FServerPort, 16384, 16384) <> 1, '医保接口初始化出错!');
  FInitialized := True;
  AppCore.Logger.Write('医保接口初始化成功', mtInfo, 0);
end;

procedure TYBCore.DoLogin;
var
  YBHandle: THandle;
begin
  DoInit;
  if FLogined then
    Exit;

  YBHandle := CreateInstace;
  try
    SetParam(YBHandle, 'FN', '1');
    SetParam(YBHandle, 'YYBH', PChar(FUnitID));
    SetParam(YBHandle, 'USERID', PChar(FLoginName));
    SetParam(YBHandle, 'PWD', PChar(FLoginPwd));
    SetParam(YBHandle, 'COMPUTER', PChar(GetLocalName));
    SetParam(YBHandle, 'IP', PChar(GetLocalIP));
    SetParam(YBHandle, 'MAC', PChar(GetNetBIOSAddress));
    //SetParam(YBHandle, 'CLIENTTYPE', 'HIS');
    Run(YBHandle);
    CheckFHZ(YBHandle);
    FLogined := True;
    AppCore.Logger.Write('医保接口登录成功', mtInfo, 0);
  finally
    DestroyInstance(YBHandle);
  end;
end;

procedure TYBCore.DoYB(FN: string; InParam, OutParam: TYBBaseData;
  InData, OutData: array of TYBBaseData; CardMode: TYBCardMode; NoCard: Boolean);
var
  J: Integer;
  YBHandle: THandle;
begin
  DoLogin;
  YBHandle := CreateInstace;
  try
    AppCore.Logger.Write('医保调用开始: ' + FN, mtInfo, 0);

    if NoCard then
      CardMode := cmNone;

    case CardMode of
      cmNoPassword: ReadCardBas(YBHandle);
      cmPassword: ReadCardByPin(YBHandle);
      cmWriteBack: WriteCard(YBHandle, InParam.AsFloat['SelfPay'], InParam.AsFloat['PlanPay']);
    end;

    AppCore.Logger.Write('写参数:', mtInfo, 0);
    SetParam(YBHandle, 'FN', PChar(FN));
    if InParam <> nil then
    begin
      InParam.PrepareData();
      WriteParam(YBHandle, InParam.Table);
    end;
    SetCommonParam(YBHandle, InParam);

    for J := 0 to Length(InData) - 1 do
    begin
      if InData[J] = nil then
        Continue;
      InData[J].PrepareData();
      WriteDataTable(YBHandle, InData[J].CustomAttributes.Values['YBName'], InParam.Table, InData[J].Table);
    end;

    CheckResult(YBHandle, Run(YBHandle), sYBFunRun);

    CheckFHZ(YBHandle);

    if (OutParam <> nil) then
    begin
      OutParam.PrepareData();
      ReadParam(YBHandle, OutParam.Table);
    end;

    for J := 0 to Length(OutData) - 1 do
    begin
      if OutData[J] = nil then
        Continue;
      OutData[J].PrepareData();
      ReadDataTable(YBHandle, OutData[J].CustomAttributes.Values['YBName'], OutData[J].Table);
    end;

    AppCore.Logger.Write('医保调用结束: ' + FN, mtInfo, 0);
  finally
    DestroyInstance(YBHandle);
  end;  
end;

procedure TYBCore.DoYB10020();
begin
  PrepareForNext;
  DoYB('10020', nil, nil, [], [YB10020Data], cmPassword, False);
  FDone10020 := True;
end;

function TYBCore.GetCommonParam(ParamName: string): string;
begin
  Result := '';
  if SameText(ParamName, 'YYBH') then
    Result := FUnitID
  else if SameText(ParamName, 'JBR') then
    Result := HisUser.ID
  else if SameText(ParamName, 'ZKBH') then
    Result := FYBCardRecord.CardId
  else if SameText(ParamName, sYBFieldXTJGDM) then
  begin
    Result := XTJGDM;
    if XTJGDM = '' then
      Result := FYBCardRecord.Xtjgdm;
  end
  else if SameText(ParamName, sYBFieldGMSFHM) then
  begin
    Result := YB10020Data.GMSFHM;
  end;
end;

function TYBCore.GetYB10020Data: TYB_1002;
begin
  if FYB10020Data = nil then
    FYB10020Data := TYB_1002.Create(Self);
  Result := FYB10020Data;
end;

procedure TYBCore.PrepareForNext;
begin
  FDoneYBCard := False;
  FDone10020 := False;
  FGMSFHM := '';
  FXTJGDM := '';
  FillChar(FYBCardRecord, 0, SizeOf(FYBCardRecord));
  YB10020Data.Close;
end;

procedure TYBCore.ReadDataTable(YBHandle: THandle; ADataName: string;
  ATable: TDADataTable);
var
  I, J, Rows, YBResult: Integer;
  FieldValue: TYBParam;
  RowText: string;
begin
  AppCore.Logger.Write('读数据集: ' + ADataName, mtInfo, 0);
  Check(ADataName = '', '没有设置医保数据读取名称');
  YBResult := LocateDataSet(YBHandle, PChar(ADataName));
  CheckResult(YBHandle, YBResult, sYBFunLocateDataSet);
  Rows := GetRowSize(YBHandle);
  for I := 0 to Rows - 1 do
  begin
    if not ATable.Editing then
      ATable.Append;
    RowText := '  ';
    for J := 0 to ATable.FieldCount - 1 do
    begin
      with ATable.Fields[J] do
      begin
        if not SameText(Name, 'RecID') and
          StrToBoolDef(CustomAttributes.Values['YBFlag'], True) then
        begin
          YBResult := GetFieldValue(YBHandle, PChar(Name), FieldValue, iYBParamSize);
          CheckResult(YBHandle, YBResult, sYBFunGetFieldValue);
          if DataType in [datFloat, datCurrency, datDecimal, datSingleFloat] then
            AsFloat := StrToFloatDef(FieldValue, 0)
          else
            AsString := FieldValue;
          RowText := RowText + Format(' %s=%s', [Name, FieldValue]);
        end;
      end;
    end;
    AppCore.Logger.Write(RowText, mtInfo, 0);
    ATable.Post;
    NextRow(YBHandle);
  end;
end;

procedure TYBCore.ReadParam(YBHandle: THandle; ATable: TDADataTable);
var
  I, YBResult: Integer;
  ParamValue: TYBParam;
begin
  AppCore.Logger.Write('读参数: ', mtInfo, 0);
  if not ATable.Editing then
    if ATable.EOF then
      ATable.Append
    else
      ATable.Edit;
  for I := 0 to ATable.FieldCount - 1 do
    with ATable.Fields[I] do
    begin
      if not SameText(Name, 'RecID') and
        StrToBoolDef(CustomAttributes.Values['YBFlag'], True) then
      begin
        YBResult := GetParam(YBHandle, PChar(Name), ParamValue, iYBParamSize);
        CheckResult(YBHandle, YBResult, sYBFunGetParam);
        if DataType in [datFloat, datCurrency, datDecimal, datSingleFloat] then
          AsFloat := StrToFloatDef(ParamValue, 0)
        else
          AsString := ParamValue;
        AppCore.Logger.WriteFmt('  %s[%s]=%s', [DisplayLabel, Name, ParamValue], mtInfo, 0);
      end;
    end;
  ATable.Post;
end;

procedure TYBCore.SetCommonParam(YBHandle: THandle; InParam: TYBBaseData);
var
  Temp: string;
begin
  FJBRQ := FormatDateTime('YYYYMMDD', Date());

  if FYBCardRecord.CardId <> '' then
    WriteParam(YBHandle, '卡号', 'ZKBH', FYBCardRecord.CardId);

  Temp := FYBCardRecord.XM;
  if Temp = '' then
    Temp := FYB10020Data.XM;
  if (Temp <> '') and ((InParam = nil) or (InParam.Table.FindField('XM') = nil)) then
    WriteParam(YBHandle, '姓名', 'XM', Temp);

  Temp := FGMSFHM;
  if Temp = '' then
  begin
    Temp := FYBCardRecord.Gmsfhm;
    if (Temp = '')
      then
      Temp := FYB10020Data.GMSFHM;
  end;
  if (Temp <> '') and ((InParam = nil) or (InParam.Table.FindField('GMSFHM') = nil)) then
    WriteParam(YBHandle, '身份证', sYBFieldGMSFHM, Temp);

  // 无卡传空
  Temp := FXTJGDM;
  if Temp = '' then
    Temp := FYBCardRecord.Xtjgdm;
  if (Temp <> '')
  then
    WriteParam(YBHandle, '机构代码', sYBFieldXTJGDM, Temp);

  WriteParam(YBHandle, '经办人', 'JBR', PChar(HisUser.ID));
  WriteParam(YBHandle, '经办日期', 'JBRQ', PChar(FJBRQ));
  WriteParam(YBHandle, '医院编号', 'YYBH', PChar(FUnitID));
  WriteParam(YBHandle, '客户端', 'CLIENTTYPE', 'his'); // 只能是his???
end;

procedure TYBCore.WriteDataTable(YBHandle: THandle; ADataName: string;
  InParam, ATable: TDADataTable);
var
  I, YBResult: Integer;
  FieldParam, FieldValue: string;
  RowText: string;
  WriteFlagField: string;
begin
  AppCore.Logger.Write('写数据集: ' + ADataName, mtInfo, 0);
  Check(ADataName = '', '没有设置医保数据写入名称');
  YBResult := InsertDataSet(YBHandle);
  CheckResult(YBHandle, YBResult, sYBFunInsertDataSet);
  ATable.First;
  WriteFlagField := ATable.CustomAttributes.Values['YBWriteFlagField'];
  while not ATable.EOF do
  begin
    if (WriteFlagField = '') or ATable.FieldByName(WriteFlagField).AsBoolean then
    begin
      YBResult := InsertRow(YBHandle);
      CheckResult(YBHandle, YBResult, sYBFunInsertRow);
      RowText := '  ';
      for I := 0 to ATable.FieldCount - 1 do
      begin
        with ATable.Fields[I] do
          if not SameText(Name, 'RecID') and
            StrToBoolDef(CustomAttributes.Values['YBFlag'], True) then
          begin
            FieldValue := AsString;
            FieldParam := Trim(CustomAttributes.Values['YBParam']);
            if FieldParam <> '' then
              if InParam.FindField(FieldParam) <> nil then
                FieldValue := InParam.FieldByName(FieldParam).AsString
              else
                FieldValue := GetCommonParam(FieldParam);
            YBResult := SetField(YBHandle, PChar(Name), PChar(FieldValue));
            CheckResult(YBHandle, YBResult, sYBFunSetField);
            RowText := RowText + Format(' %s=%s', [Name, FieldValue]);
          end;
      end;
      AppCore.Logger.Write(RowText, mtInfo, 0);
      YBResult := EndRow(YBHandle, ATable.RecNo);
      CheckResult(YBHandle, YBResult, sYBFunEndRow);
    end;
    ATable.Next;
  end;
  YBResult := EndDataSet(YBHandle, PChar(ADataName));
  CheckResult(YBHandle, YBResult, sYBFunEndDataSet);
end;

procedure TYBCore.WriteParam(YBHandle: THandle; ATable: TDADataTable);
var
  I: Integer;
begin
  if not ATable.EOF then
    for I := 0 to ATable.FieldCount - 1 do
      with ATable.Fields[I] do
      begin
        if not SameText(Name, 'RecID') and
          StrToBoolDef(CustomAttributes.Values['YBFlag'], True) then
        begin
          WriteParam(YBHandle, DisplayLabel, Name, AsString);
        end;
      end;
end;

procedure TYBCore.WriteParam(YBHandle: THandle; const ParamTitle, ParamName,
  ParamValue: string);
begin  
  AppCore.Logger.WriteFmt('  %s[%s]=%s', [ParamTitle, ParamName, ParamValue], mtInfo, 0);
  SetParam(YBHandle, PChar(ParamName), PChar(ParamValue));
end;     

procedure TYBCore.DoYB90020(JZJLH, SDYWH: string; SelfPay, PlanPay: Double; NoCard: Boolean);
begin
  try
    if FYB90020Data = nil then
    begin
      FYB90020Data := TYBClinData.Create(Self, HisConnection, sDataServiceYB, 'YB_90020_InParam');
      FYB90020Data.Open;
      FYB90020Data.LogChanges := False;
    end;

    FYB90020Data.Edit;
    FYB90020Data.AsString[sYBFieldJZJLH] := JZJLH;
    FYB90020Data.AsString[sYBFieldSDYWH] := SDYWH;
    FYB90020Data.AsString['JYRQ'] := FJBRQ;
    FYB90020Data.AsFloat['SelfPay'] := SelfPay;
    FYB90020Data.AsFloat['PlanPay'] := PlanPay;
    FYB90020Data.Save;

    DoYB('90020', FYB90020Data, nil, [], [], cmWriteBack, NoCard);
  except
    on E: Exception do
      AppCore.Logger.Write('交易回写出错：' + E.Message, mtWarning, 0);
  end;
end;

procedure TYBCore.ReadCardBas(YBHandle: THandle);
begin
  AppCore.Logger.Write('无密读卡', mtInfo, 0);

  FillChar(FYBCardRecord, SizeOf(FYBCardRecord), 0);
  with FYBCardRecord do
    if HNReadCardBas(YBHandle, CardInfo, CardId, Gmsfhm, Xm, Xtjgdm) <> 0 then
      raise Exception.Create(CardInfo);

  FDoneYBCard := True;
end;

procedure TYBCore.ReadCardByPin(YBHandle: THandle);
begin
  AppCore.Logger.Write('有密读卡', mtInfo, 0);

  FillChar(FYBCardRecord, SizeOf(FYBCardRecord), 0);
  with FYBCardRecord do
    if HNReadByPin(YBHandle, CardInfo, CardId, Gmsfhm, Xm, Xtjgdm) <> 0 then
      raise Exception.Create(CardInfo);
  
  FDoneYBCard := True;
end;

procedure TYBCore.WriteCard(YBHandle: THandle; SelfPay, PlanPay: Double);
var
  LCardType: TYBCardField;
  LCardInfo: TYBCardField;
  S: string;
begin
  AppCore.Logger.Write('交易读卡', mtInfo, 0);

  with FYBCardRecord do
    if (HNDoDebit(YBHandle, CardId, Gmsfhm, Xm, '0',  //不能传PChar('0')
      PChar(FloatToStr(SelfPay)), PChar(FloatToStr(PlanPay)),
      PChar(FormatDateTime('YYYYMMDDHHNNSS', Now())), LCardType, LCardInfo) <> 0) then
    begin
      raise Exception.Create('写卡失败：' + LCardInfo);
      //AppCore.Logger.Write('写卡失败：' + LCardInfo, mtWarning, 0);
    end;

  FDoneYBCard := True;
end;

destructor TYBCore.Destroy;
begin
  FRegisteredClinFeeViews.Free;
  FRegisteredHospFeeViews.Free;
  inherited;
end;

procedure TYBCore.DoYB20030(const ZYH: string);
begin
  PrepareForNext;

  if FYB2003Param = nil then
    FYB2003Param := TYBHospData.Create(Self, HisConnection, sDataServiceYB, 'YB_2003_InParam');

  FYB2003Param.OpenByParam([sYBFieldZYH], [ZYH]);
  if FYB2003Param.AsString[sYBFieldJZJLH] <> '' then
    DoYB('20030', FYB2003Param, nil, [], [], cmNone, False);
end;

procedure TYBCore.DoYB20110(const ZYH: string);
begin
  PrepareForNext;

  if FYB2011Param = nil then
    FYB2011Param := TYBHospData.Create(Self, HisConnection, sDataServiceYB, 'YB_2011_InParam');
  FYB2011Param.OpenByParam([sYBFieldZYH], [ZYH]);
  DoYB('20110', FYB2011Param, nil, [], [], cmNone, False);
end;

procedure TYBCore.DoYB50010_Clin(ClinFeeID: string);
begin
  PrepareForNext;

  if FYB5001Param_Clin = nil then
    FYB5001Param_Clin := TYBBaseData.Create(Self, HisConnection, sDataServiceYB, 'YB_5001_Clin_InParam');

  FYB5001Param_Clin.OpenByParam(['ClinFeeID'], [ClinFeeID]);

  if not FYB5001Param_Clin.Eof then
    DoYB('50010', FYB5001Param_Clin, nil, [], [], cmPassword, //读卡方式???
      FYB5001Param_Clin.AsString[sYBFieldZKBH] = '')
  else
    AppCore.Logger.Write('门诊医保退费：未找到原始医保收费记录.' + ClinFeeID, mtWarning, 0);
end;

procedure TYBCore.DoYB50010_Hosp(HospFeeID: string);
begin
  PrepareForNext;

  if FYB5001Param_Hosp = nil then
    FYB5001Param_Hosp := TYBBaseData.Create(Self, HisConnection, sDataServiceYB, 'YB_5001_Hosp_InParam');

  FYB5001Param_Hosp.OpenByParam([sFieldHospFeeID], [HospFeeID]);
  
  DoYB('50010', FYB5001Param_Hosp, nil, [], [], cmPassword,
    FYB5001Param_Hosp.AsString[sYBFieldZKBH] = '');
end;

procedure TYBCore.DoAfterCancelHospFeeProc(Sender: TObject);
begin
  with TCustomData(Sender) do
  begin
    if (AsInteger['FeeTypeID'] >= iHospFeeType_YB4001)
       and (AsInteger['FeeTypeID'] < iHospFeeType_XNH) then
      DoYB50010_Hosp(TCustomData(Sender).AsString[sFieldHospFeeID]);
  end;

  if Assigned(FOldAfterCancelHospFeeProc) then
    FOldAfterCancelHospFeeProc(Sender);
end;

{ TYB_1002 }

constructor TYB_1002.Create(AOwner: TComponent);
begin
  inherited Create(AOwner, HisConnection, sDataServiceYB, 'YB_1002_OutData');
  OpenByZKBH('');
end;

procedure TYB_1002.DoDataAfterPost(Sender: TDADataTable);
var
  ExtendOperation: TBaseOperation;
begin
  inherited;
  ExtendOperation := AppCore.Operations.SearchOperation('pas_yb_card');
  if ExtendOperation <> nil then
  begin
    ExtendOperation.Execute(iOperationCommand_Custom + 1, [Integer(Self)]);
  end;
end;

procedure TYB_1002.DoDataBeforePost(Sender: TDADataTable);
begin
  inherited;                         
  AsDateTime['UpdateTime'] := Now;
  Check(AsString[sYBFieldZKBH] <> YBCore.CardRecord.CardId,
    '医保卡号与医保中心不一致，如果是新卡需先激活，请联系医保办.');
end;

function TYB_1002.GetDWMC: string;
begin
  Result := AsString['DWMC'];
end;

function TYB_1002.GetGMSFHM: string;
begin
  Result := AsString[sYBFieldGMSFHM];
end;

function TYB_1002.GetGRZHYE: Currency;
begin
  Result := StrToCurrDef(AsString['GRZHYE'], 0);
end;

function TYB_1002.GetSCNY: string;
begin
  Result := AsString['SCNY'];
end;

function TYB_1002.GetTMJE: Currency;
begin
  Result := AsCurrency['TMKBJE'] - AsCurrency['TMYZFJE']
end;

function TYB_1002.GetXB: string;
begin
  Result := AsString['XB'];
end;

function TYB_1002.GetXM: string;
begin
  Result := AsString['XM'];
end;

function TYB_1002.GetXTJGDM: string;
begin
  Result := AsString[sYBFieldXTJGDM];
end;

function TYB_1002.GetZKBH: string;
begin
  Result := AsString['ZKBH'];
end;

procedure TYB_1002.OpenByZKBH(const ZKBH: string);
begin
  OpenByFieldValue('ZKBH', ZKBH);
end;

procedure TYB_1002.PrepareData();
begin
  OpenByZKBH(YBCore.CardRecord.CardId);
  if Table.EOF then
    Insert
  else
    Edit;
end;

{ TYB_3001_InParam }

constructor TYB_3001_InParam.Create(AOwner: TComponent);
begin
  inherited Create(AOwner, HisConnection, sDataServiceYB, 'YB_3001_InParam');
  LogChanges := False;
  Source.AutoEdit := True;
  ClinID := '';
end;

procedure TYB_3001_InParam.PrepareData();
begin
end;

procedure TYB_3001_InParam.SetClinID(const Value: string);
begin
  FClinID := Value;
  OpenByParam([sFieldClinID], [FClinID]);
end;

{ TYB_3001_InData }

constructor TYB_3001_InData.Create(AOwner: TComponent);
begin
  inherited Create(AOwner, HisConnection, sDataServiceYB, 'YB_3001_InData');
end;

procedure TYB_3001_InData.PrepareData();
begin
  OpenByParam([sYBParamRecList], [RecIDList]);
end;

{ TYB_3001_OutParam }

constructor TYB_3001_OutParam.Create(AOwner: TComponent);
begin
  inherited Create(AOwner, HisConnection, sDataServiceYB, 'YB_3001_OutParam');
  EnableBatchUpdate;
  PrepareData;
end;

function TYB_3001_OutParam.GetCZFJE: Currency;
begin
  Result := Table.FieldByName('CZFJE').AsCurrency;
end;

function TYB_3001_OutParam.GetJBYLFDFY: Currency;
begin
  Result := StrToCurrDef(AsString['JBYLFDFY'], 0);
end;

function TYB_3001_OutParam.GetXJZF: Currency;
begin
  Result := Table.FieldByName('XJZF').AsCurrency;
end;

function TYB_3001_OutParam.GetYBZHZF: Currency;
begin
  Result := StrToCurrDef(AsString['YBZHZF'], 0);
end;

function TYB_3001_OutParam.GetYLFYZE: Currency;
begin
  Result := Table.FieldByName('YLFYZE').AsCurrency;
end;

procedure TYB_3001_OutParam.PrepareData;
begin
  OpenByFieldValue(sFieldYBID, 0);
end;

{ TYB_4005_InParam }

constructor TYB_4005_InParam.Create(AOwner: TComponent);
begin
  inherited Create(AOwner, HisConnection, sDataServiceYB, 'YB_4005_InParam');
  EnableBatchUpdate;
  Open;
end;

procedure TYB_4005_InParam.PrepareData();
begin
  Edit;
  AsString[sYBFieldJZJLH] := FLinkData.JZJLH;
  AsString[sYBFieldSDYWH] := FLinkData.SDYWH;
  AsString['GRZHSYBZ'] := FLinkData.LinkData.AsString['GRZHSYBZ'];
  AsString['SSJE'] := CurrToStr(FLinkData.AsCurrency['YLFYZE'] -
    TYB_ClinFee_Base(Owner).YBMoney);
  Save;
end;

{ TYB_4005_OutParam }

constructor TYB_4005_OutParam.Create(AOwner: TComponent);
begin
  inherited Create(AOwner, HisConnection, sDataServiceYB, 'YB_4005_OutParam');
end;

procedure TYB_4005_OutParam.DoDataBeforePost(Sender: TDADataTable);
var
  JSRQ: string;
begin
  inherited;
  AsString[sYBFieldJZJLH] := FLinkData.JZJLH;
  AsString[sYBFieldSDYWH] := FLinkData.SDYWH;
  AsString[sYBFieldXTJGDM] := FLinkData.XTJGDM;

  // 纠正医保错误: 结算日期为'null'
  JSRQ := Sender.FieldByName('JSRQ').AsString;
  if SameText(JSRQ, 'null') or (Length(JSRQ) < 8) then
    Sender.FieldByName('JSRQ').AsString := FormatDateTime('YYYYMMDD', Date());
end;

function TYB_4005_OutParam.GetPlanPay: Double;
begin
  Result := 0;
end;

function TYB_4005_OutParam.GetSelfPay: Double;
begin
  Result := AsFloat['YLFYZE'];
end;

procedure TYB_4005_OutParam.PrepareData;
begin
  OpenByFieldValue(sFieldYBID, 0);
end;

{ TYB_4005_OutData }

constructor TYB_4005_OutData.Create(AOwner: TComponent);
begin
  inherited Create(AOwner, HisConnection, sDataServiceYB, 'YB_4005_OutData');
end;

procedure TYB_4005_OutData.DoDataAfterInsert(Sender: TDADataTable);
begin
  inherited;
  AsInteger[sFieldYBID] := FLinkData.AsInteger[sFieldYBID];
end;

procedure TYB_4005_OutData.PrepareData();
begin
  OpenByFieldValue(sFieldYBID, 0);
end;

{ TYB_3002_InParam }

constructor TYB_3002_InParam.Create(AOwner: TComponent);
begin
  inherited Create(AOwner, HisConnection, sDataServiceYB, 'YB_3002_InParam');
  LogChanges := False;
  Source.AutoEdit := True;
  ClinID := '';
end;

procedure TYB_3002_InParam.PrepareData();
begin
end;

procedure TYB_3002_InParam.SetClinID(const Value: string);
begin
  FClinID := Value;
  OpenByParam([sFieldClinID], [FClinID]);
end;

{ TYB_3002_InData }

constructor TYB_3002_InData.Create(AOwner: TComponent);
begin
  inherited Create(AOwner, HisConnection, sDataServiceYB, 'YB_3002_InData');
end;

procedure TYB_3002_InData.PrepareData();
begin
  OpenByParam([sYBParamRecList], [RecIDList]);
end;


{ TYB_3002_OutParam }

constructor TYB_3002_OutParam.Create(AOwner: TComponent);
begin
  inherited Create(AOwner, HisConnection, sDataServiceYB, 'YB_3002_OutParam');
  Table.RemoteUpdatesOptions := [];
  PrepareData;
end;

function TYB_3002_OutParam.GetJBYLFDFY: Currency;
begin
  Result := Table.FieldByName('JBYLFDFY').AsCurrency;
end;

function TYB_3002_OutParam.GetYLFYZE: Currency;
begin
  Result := Table.FieldByName('YLFYZE').AsCurrency;
end;

procedure TYB_3002_OutParam.PrepareData;
begin
  OpenByFieldValue(sFieldYBID, 0);
end;

{ TYB_4006_InParam }

constructor TYB_4006_InParam.Create(AOwner: TComponent);
begin
  inherited Create(AOwner, HisConnection, sDataServiceYB, 'YB_4006_InParam');
  Table.RemoteUpdatesOptions := [];
  Open;
end;

procedure TYB_4006_InParam.PrepareData();
begin
  Edit;
  AsString[sYBFieldJZJLH] := FLinkData.JZJLH;
  AsString[sYBFieldSDYWH] := FLinkData.SDYWH;
  AsString['GRZHSYBZ'] := FLinkData.LinkData.AsString['GRZHSYBZ'];
  AsString['SSJE'] := CurrToStr(FLinkData.AsCurrency['YLFYZE'] -
    TYB_ClinFee_Base(Owner).YBMoney);
  Save;
end;

{ TYB_4006_OutParam }

constructor TYB_4006_OutParam.Create(AOwner: TComponent);
begin
  inherited Create(AOwner, HisConnection, sDataServiceYB, 'YB_4006_OutParam');
end;

procedure TYB_4006_OutParam.DoDataBeforePost(Sender: TDADataTable);
begin
  inherited;                           
  AsString[sYBFieldJZJLH] := FLinkData.JZJLH;
  AsString[sYBFieldSDYWH] := FLinkData.SDYWH;  
  AsString[sYBFieldXTJGDM] := FLinkData.XTJGDM;
end;

function TYB_4006_OutParam.GetPlanPay: Double;
begin
  Result := 0;
end;

function TYB_4006_OutParam.GetSelfPay: Double;
begin
  Result := AsFloat['YLFYZE'];
end;

procedure TYB_4006_OutParam.PrepareData;
begin
  OpenByFieldValue(sFieldYBID, 0);
end;

{ TYB_4006_OutData }

constructor TYB_4006_OutData.Create(AOwner: TComponent);
begin
  inherited Create(AOwner, HisConnection, sDataServiceYB, 'YB_4006_OutData');
end;

procedure TYB_4006_OutData.DoDataAfterInsert(Sender: TDADataTable);
begin
  inherited;
  AsInteger[sFieldYBID] := FLinkData.AsInteger[sFieldYBID]
end;

procedure TYB_4006_OutData.PrepareData();
begin
  OpenByFieldValue(sFieldYBID, 0);
end;



{ TYBBaseData }

function TYBBaseData.GetJZJLH: string;
begin
  Result := AsString[sYBFieldJZJLH];
end;

function TYBBaseData.GetPlanPay: Double;
begin
  Result := 0;
end;

function TYBBaseData.GetSDYWH: string;
begin   
  Result := AsString[sYBFieldSDYWH];
end;

function TYBBaseData.GetSelfPay: Double;
begin         
  Result := 0;
end;

function TYBBaseData.GetXTJGDM: string;
begin
  Result := AsString[sYBFieldXTJGDM]
end;

procedure TYBBaseData.PrepareData;
begin

end;

{ TYBClinData }

procedure TYBClinData.SetClinID(const Value: string);
begin
  FClinID := Value;
end;

procedure TYBClinData.SetRecIDList(const Value: string);
begin
  FRecIDList := Value;
end;

{ TYBHospData }


procedure TYBHospData.SetHospID(const Value: string);
begin
  FHospID := Value;
end;

{ TcvYBClinMaster }

procedure TcvYBClinMaster.DataQuery;
begin
  ViewData.OpenByParam(['BeginDate', 'EndDate', 'ParamValue',
     sFieldOfficeID, sFieldOpID],
    [BeginDate, EndDate, FInvoiceEdit.Text,
     HisUser.OfficeID, HisUser.ID]);
end;

procedure TcvYBClinMaster.BuildViewLayout;
begin
  inherited;     
  FInvoiceEdit := TcxMaskEdit.Create(Self);
  SerialIDWrapper.Wrap(FInvoiceEdit).OnSerialID := DoInvoiceIDEvent;

  with ToolBarGroup do
  begin
    with CreateItemForControl(FInvoiceEdit) do
    begin
      AlignVert := avCenter;
      Caption := '号码:';
    end;
  end;

  OnDoubleClickView := DoDoubleClick;
  PeriodGroup.Visible := True;
  SetData(TCustomData.Create(Self, HisConnection, sDataServiceYB, 'YB_ClinMaster'));
end;

procedure TcvYBClinMaster.DoDoubleClick(Sender: TObject);
begin
  AppCore.Operations.SearchOperation(sOperationIDClinFeeQuery).Execute(
    iOperationCommand_ClinFeeID,
    [ViewData.AsString['ClinFeeID']]);
end;

procedure TcvYBClinMaster.DoInvoiceIDEvent(Sender: TObject);
begin
  DataQuery;
end;

{ TcvYBClinDetail }

procedure TcvYBClinDetail.DataQuery;
begin
  ViewData.OpenByList(['JSRQ', 'JSRQ'],
    [FormatDateTime('YYYYMMDD', BeginDate), FormatDateTime('YYYYMMDD', EndDate)],
    [dboGreaterOrEqual, dboLessOrEqual], [dboAnd]);
end;

procedure TcvYBClinDetail.BuildViewLayout;
begin
  inherited;
  PeriodGroup.Visible := True;
  SetData(TCustomData.Create(Self, HisConnection, sDataServiceYB, 'YB_ClinDetail'));
end;

{ TYB_ClinFee_Core }

procedure TYB_ClinFee_Core.BuildDialog;
var
  TempGroup: TdxLayoutGroup;
begin
  inherited;
  FRegisteredClinFeeViews := TStringList.Create;
  FRegisteredClinFeeViews.CommaText := YBCore.RegisteredClinFeeViews.CommaText;

  FClinFeeViewSelectDialog := TSelectDialog.Create(Self);
  FClinFeeViewSelectDialog.Caption := '选择门诊医保收费类型';
  FClinFeeViewSelectDialog.Selections.CommaText := FRegisteredClinFeeViews.CommaText;
  FClinFeeViewSelectDialog.ListBox.ItemHeight := 40;
  FClinFeeViewSelectDialog.ListBox.ListStyle := lbOwnerDrawFixed;

  FNoCardCheckBox := BuildDXCheckBox(Self, '大学生医保(手工录入身份证和姓名)', DoNoCardCheckBoxClick, False, clBlue);
  FNoCardCheckBox.Visible := False;

  ImageName := 'misc\ClinYB.png';
  Caption := '医保收费';
  Width := 1200;
  ViewLayout.FindItem(OKButton).Visible := False;
  CancelButton.Caption := '关闭(&C)';

  FYBCardAction := BuildAction('读医保卡', '', '', DoYBCardUpdate, DoYBCardAction, 0,
    BTN_NOTFLAT or BTN_CANBEFOCUSED or BTN_SHOWCAPTION);
  FBalanceAction := BuildAction('预结算', '', '', DoBalanceUpdate, DoBalanceAction, 0,
    BTN_NOTFLAT or BTN_CANBEFOCUSED or BTN_SHOWCAPTION);
  FPrintAction := BuildAction('准备收费', '', '', DoPrintUpdate, DoPrintAction, 0,
    BTN_NOTFLAT or BTN_CANBEFOCUSED or BTN_SHOWCAPTION);

  BuildLayoutToolBar(ButtonGroup, [FYBCardAction, FBalanceAction, FPrintAction]);
  BottomGroup.CreateItemForControl(FNoCardCheckBox);

  with DialogGroup do
  begin
    TempGroup := CreateGroup();
    TempGroup.Caption := '医保病人信息';

    YBCore.YB10020Data.OpenByZKBH('');
    // 创建参保信息
    DevExpress.BuildFormView(TempGroup, YBCore.YB10020Data);

    FYBItem := CreateItemForControl(nil);
  end;
end;

procedure TYB_ClinFee_Core.DoBalanceAction(Sender: TObject);
begin
  FeeCheck();
  
  FCurClinYBView.DoBalance;
end;

procedure TYB_ClinFee_Core.DoBalanceUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := YBCore.Done10020 or FNoCardCheckBox.Checked;
end;

procedure TYB_ClinFee_Core.DoPrintAction(Sender: TObject);
begin
  if FCurClinYBView.DoPrint then
    ModalResult := mrOK;
end;

procedure TYB_ClinFee_Core.DoPrintUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := FCurClinYBView.Balanced;
end;

procedure TYB_ClinFee_Core.DoDialogShow(Sender: TObject);
begin
  inherited;
  CancelButton.SetFocus;
end;

procedure TYB_ClinFee_Core.DoYBCardAction(Sender: TObject);
begin
  YBCore.DoYB10020;
end;

function TYB_ClinFee_Core.DoExecute(CommandID: Integer;
  const Param: array of Variant): Variant;
begin
  if CommandID = iOperationCommand_Notify then
  begin
    FCashierView := TClinCashierView(Integer(Param[0]));

    Result := False;

    if CashierView.SelectRecipe and SelectFeeType then
    begin
      FNoCardCheckBox.Checked := False;
      FNoCardCheckBox.Visible := FCurClinYBView.CanNoCard;

      YBCore.PrepareForNext;
      FCurClinYBView.DoPrepare(Self);

      ClinicService.RecMasterLock(CashierView.RegData.ClinID, CashierView.RecipeIDList);
      try
        Result := ShowModal = mrOk;
      finally
        if not Result then
          ClinicService.RecMasterUnLock(CashierView.RegData.ClinID, CashierView.RecipeIDList);
      end;

      if Result then
      begin
        CashierView.DoClear;
      end;
    end;
  end;
end;

function TYB_ClinFee_Core.SelectFeeType: Boolean;
begin
  FClinFeeViewSelectDialog.SelectIndex := 0;
  Result := FClinFeeViewSelectDialog.Execute();
  if Result then
  begin
    if FCurClinYBView <> nil then
      FCurClinYBView.Visible := False;

    FCurClinYBView := TYB_ClinFee_Base(FRegisteredClinFeeViews.Objects[FClinFeeViewSelectDialog.SelectIndex]);

    if FCurClinYBView = nil then
    begin
      FCurClinYBView := TClinFeeBaseViewYBClass(YBCore.RegisteredClinFeeViews.Objects[FClinFeeViewSelectDialog.SelectIndex]).Create(Self);
      FRegisteredClinFeeViews.Objects[FClinFeeViewSelectDialog.SelectIndex] := FCurClinYBView;
    end;

    Caption := FRegisteredClinFeeViews[FClinFeeViewSelectDialog.SelectIndex];

    FYBItem.Control := FCurClinYBView;
    FCurClinYBView.Visible := True;
  end;
end;

procedure TYB_ClinFee_Core.DoYBCardUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := not FNoCardCheckBox.Checked;  
end;

destructor TYB_ClinFee_Core.Destroy;
begin
  FRegisteredClinFeeViews.Free;
  inherited;
end;

procedure TYB_ClinFee_Core.DoNoCardCheckBoxClick(Sender: TObject);
begin
  with YBCore do
  begin
    PrepareForNext;
    if FNoCardCheckBox.Checked then
    begin
      YB10020Data.OpenByZKBH('');
      YB10020Data.Insert;
    end
    else
    begin
      YB10020Data.Close;
    end;
  end;
end;

procedure TYB_ClinFee_Core.FeeCheck;
var
  Msg: string;
begin
  if YBCore.Done10020 then
  begin
    with CashierView do
      YBService.DACommand.Execute('Pro_YB_Clin_Check',
        ['Msg', 'ClinID', 'ZKBH', 'RecipeIDList', 'FeeTypeID', sFieldOpID, sFieldOfficeID],
        ['', RegData.ClinID, YBCore.YB10020Data.ZKBH, RecipeIDList,
          FCurClinYBView.FClinFeeType, HisUser.ID, HisUser.OfficeID]);

    Msg := YBService.GetCommandOutputParam('Msg');
    if Msg <> '' then
    begin
      ShowWarning(Msg);
      AppCore.Logger.WriteFmt('门诊医保提示(%s)：%s', 
        [CashierView.RegData.ClinID, Msg], mtInfo, 0);
    end; 
  end;
end;

{ TYB_ClinFee_Base }

procedure TYB_ClinFee_Base.BuildViewLayout;
var
  TempGroup: TdxLayoutGroup;
begin
  inherited;
  BorderStyle := bsNone;
  IsEmbedded := True;

  BuildYBData;

  BalanceOutParam.LinkData := BalanceInParam;
  PrintInParam.LinkData := BalanceOutParam;
  PrintOutParam.LinkData := BalanceOutParam;
  PrintOutData.LinkData := PrintOutParam;

  ClientWidth := StrToIntDef(BalanceInParam.CustomAttributes.Values['FormWidth'], 600);
  ClientHeight := StrToIntDef(BalanceInParam.CustomAttributes.Values['FormHeight'], 400);

  with ViewLayout.Items do
  begin
    TempGroup := CreateGroup();
    DevExpress.BuildFormView(TempGroup, BalanceOutParam);
    TempGroup := TempGroup.CreateGroup;
    with TempGroup do
    begin
      LayoutDirection := ldHorizontal;
      ShowBorder := False;
      DevExpress.BuildFormView(TempGroup, BalanceInParam);
    end;
  end;
end;

procedure TYB_ClinFee_Base.BuildYBData;
begin

end;

function TYB_ClinFee_Base.CanNoCard: Boolean;
begin
  Result := False;
end;

procedure TYB_ClinFee_Base.DoBalance;
begin
  YBCore.GMSFHM := '';
  YBCore.XTJGDM := '';

  YBCore.DoYB(FBalanceYBNum, BalanceInParam, BalanceOutParam, [BalanceInData], [],
    cmPassword,  FYBClinCore.FNoCardCheckBox.Checked);

  YBCore.GMSFHM := YBCore.YB10020Data.GMSFHM;
  YBCore.XTJGDM := BalanceOutParam.AsString[sYBFieldXTJGDM];

  Balanced := True;
end;

procedure TYB_ClinFee_Base.DoCalcYBMoney;
begin
end;

procedure TYB_ClinFee_Base.DoPrepare(YBClinCore: TYB_ClinFee_Core);
begin
  FYBClinCore := YBClinCore;
  FYBMoney := 0;
  FBalanced := False;

  BalanceInParam.ClinID := FYBClinCore.CashierView.RegData.ClinID;
  BalanceOutParam.PrepareData;
  BalanceInData.RecIDList := FYBClinCore.CashierView.RecipeIDList;
end;

function TYB_ClinFee_Base.DoPrint(): Boolean;
begin
  Result := False;
  DoCalcYBMoney;
  with FYBClinCore.CashierView do
    Result := FeeTakeView.Execute(FYBClinCore.FCashierView, FClinFeeType,
      FYBMoney, PrintCallBack);
end;

procedure TYB_ClinFee_Base.PrintCallback(Sender: TObject);
begin
  with FYBClinCore.CashierView.FeeTakeView.FeeData do
  begin
    YBCore.DoYB(FPrintYBNum, PrintInParam, PrintOutParam, [], [PrintOutData],
      cmNoPassword, FYBClinCore.FNoCardCheckBox.Checked);

    if YBCore.SaveClinBalanceData then
      BalanceOutParam.ApplyUpdates();

    YBCore.DoYB90020(
      PrintInParam.JZJLH,
      PrintInParam.SDYWH,
      PrintOutParam.GetSelfPay,
      PrintOutParam.GetPlanPay,
      FYBClinCore.FNoCardCheckBox.Checked);

    YBID := PrintOutParam.AsInteger[sFieldYBID];
    FeeTypeID := FClinFeeType;

    FYBClinCore.CashierView.FeeTakeView.ClinFeeID := ClinicService.FeeTake(
      FYBClinCore.CashierView.RegData.ClinID, FYBClinCore.CashierView.RecipeIDList,
      FYBClinCore.CashierView.FeeTakeView.FeeData);

  end;
end;

{ TYB_ClinFee_4005 }

procedure TYB_ClinFee_4005.BuildYBData;
begin
  FBalanceYBNum := '30010';
  FPrintYBNum := '40050';
  FClinFeeType := iClinFeeType_YB4005;

  BalanceInParam := TYB_3001_InParam.Create(Self);
  BalanceInData := TYB_3001_InData.Create(Self);
  BalanceOutParam := TYB_3001_OutParam.Create(Self);

  PrintInParam := TYB_4005_InParam.Create(Self);
  PrintOutParam := TYB_4005_OutParam.Create(Self);
  PrintOutData := TYB_4005_OutData.Create(Self);
end;

procedure TYB_ClinFee_4005.DoCalcYBMoney;
begin
  FYBMoney := 0;

  with TYB_3001_OutParam(BalanceOutParam) do
  begin
      if BalanceInParam.AsString['GRZHSYBZ'] = '1' then
      begin
        if YBCore.YB10020Data.GRZHYE >= JBYLFDFY then
          FYBMoney := JBYLFDFY
        else
          FYBMoney := YBCore.YB10020Data.GRZHYE;
      end;

    FYBMoney := FYBMoney + YBZHZF;

    if FYBMoney > JBYLFDFY then
      FYBMoney := JBYLFDFY;
  end;
end;

{ TYB_ClinFee_4006 }

procedure TYB_ClinFee_4006.BuildYBData;
begin
  FBalanceYBNum := '30020';
  FPrintYBNum := '40060';
  FClinFeeType := iClinFeeType_YB4006;

  BalanceInParam := TYB_3002_InParam.Create(Self);
  BalanceInData := TYB_3002_InData.Create(Self);
  BalanceOutParam := TYB_3002_OutParam.Create(Self);

  PrintInParam := TYB_4006_InParam.Create(Self);
  PrintOutParam := TYB_4006_OutParam.Create(Self);
  PrintOutData := TYB_4006_OutData.Create(Self);
end;

function TYB_ClinFee_4006.CanNoCard: Boolean;
begin
  Result := True;
end;

procedure TYB_ClinFee_4006.DoCalcYBMoney;
var
  YE, PPrice, CanPrice, Result: Currency;
  F6, F10, F15, F17, F18, F20, F21, F23, F24, F29, F30, F31, F40: Currency;
begin
  FYBMoney := 0;
  
  if BalanceOutParam.EOF then
    Exit;

  YE := YBCore.YB10020Data.GRZHYE;

  with BalanceOutParam.Table do
  begin
    F6 := FieldByName('YLFYZE').AsCurrency;
    F10 := FieldByName('JBYLFDFY').AsCurrency;
    F15 := FieldByName('JBYLTCZF').AsCurrency;
    F17 := FieldByName('JBGWYTCZF').AsCurrency;
    F18 := FieldByName('BCFYZE').AsCurrency;
    F20 := FieldByName('SBPF').AsCurrency;
    F21 := FieldByName('BCGWYBZ').AsCurrency;
    F23 := FieldByName('CZFJE').AsCurrency;
    F24 := FieldByName('GRZHZF').AsCurrency;
    F29 := FieldByName('YYFD').AsCurrency;
    F30 := FieldByName('CFDXJE').AsCurrency;
    F31 := FieldByName('SBBT').AsCurrency;
    F40 := FieldByName('YSFY').AsCurrency;
  end;
  PPrice := F23 + F30;
  CanPrice := F40 - PPrice;

  if (BalanceInParam.AsString['GRZHSYBZ'] = '1') and
    (YE > 0) then
  begin
    if YE >= CanPrice then
      Result := PPrice
    else if YE < CanPrice then
      Result := F40 - YE;
  end
  else
  begin
    Result := F40;
  end;

  FYBMoney := F6 - Result;
end;

{ TYB_2001 }

constructor TYB_2001.Create(AOwner: TComponent);
begin
  inherited Create(AOwner, HisConnection, sDataServiceYB, 'YB_2001');
end;

procedure TYB_2001.DoDataAfterInsert(Sender: TDADataTable);
begin
  inherited;
  AsString['JBR'] := HisUser.ID;
end;

procedure TYB_2001.OpenByHospID(HospID: string);
begin
  OpenByFieldValue(sYBFieldZYH, HospID);
end;

procedure TYB_2001.PrepareData;
begin
  Table.FieldByName(sYBFieldJZJLH).CustomAttributes.Values['YBFlag'] :=
    BoolToStr(AsString[sYBFieldJZJLH] <> '');

  if YBCore.FDoneYBCard then
  begin
    AsString[sYBFieldZKBH] := YBCore.CardRecord.CardId;
    AsString[sYBFieldGMSFHM] := YBCore.CardRecord.Gmsfhm;
  end;
  AsString['YYBH'] := YBCore.UnitID;
end;

{ TYB_Hosp_Reg }

procedure TYB_Hosp_Reg.BuildDialog;
begin
  inherited;
  
  BuildAction('登记为准医保', '', '', nil, DoYBFakeAction, 0, 0);
  BuildLayoutToolBar(BottomGroup, Actions);

  FYBRegData := TYB_2001.Create(Self);
  FYBRegData.EnableBatchUpdate;
  FYBRegData.OpenByHospID('');

  FYBRegOutParam := TYBClinData.Create(Self, HisConnection, sDataServiceYB, 'YB_2001_OutParam');
  FYBRegOutParam.LogChanges := False;
  FYBRegOutParam.Open;

  ImageName := FYBRegData.CustomAttributes.Values['FormImageName'];
  DevExpress.BuildFormView(DialogGroup, FYBRegData);
end;

procedure TYB_Hosp_Reg.DoDialogOK(Sender: TObject);
var
  CardMode: TYBCardMode;
  YBNum: string;
begin
  if ShowYesNo('确定提交医保登记信息吗?') then
  begin
    YBCore.PrepareForNext;

    if FYBRegData.AsString['KDJBZ'] <> '1' then
    begin
      YBCore.DoYB10020;
    end;

    YBService.DACommand.Execute('Pro_YB_2001_BeforeReg',
      [sFieldHospID, sFieldOpID, sYBFieldZKBH, 'IDCode'],
      [FHospID, HisUser.ID, YBCore.YB10020Data.ZKBH, FYBRegData.AsString['GMSFHM']]);

    YBCore.PrepareForNext;

    CardMode := cmPassword;
    if FYBRegData.AsString['KDJBZ'] = '1' then
      CardMode := cmNone;

    if FPatientType = iHospPatientType_YB then
      YBNum := '20020'
    else
      YBNum := '20010';

    YBCore.DoYB(YBNum, FYBRegData, FYBRegOutParam, [], [], CardMode, CardMode = cmNone);

    AppCore.Logger.Write('医保登记成功: ' + FHospID, mtInfo, 1);

    if FPatientType = iHospPatientType_Normal then
    begin
      FYBRegData.AsString[sYBFieldJZJLH] := FYBRegOutParam.AsString[sYBFieldJZJLH];
      FYBRegData.AsString[sYBFieldXTJGDM] := FYBRegOutParam.AsString[sYBFieldXTJGDM];
      FYBRegData.AsString[sYBFieldMsg] := FYBRegOutParam.AsString[sYBFieldMsg];
    end;

    FYBRegData.ApplyUpdates;
    
    FPatientData.EditWithNoLogChanges([sFieldPatientTypeID], [iHospPatientType_YB]);

    ModalResult := mrOk;
  end;
end;

function TYB_Hosp_Reg.DoExecute(CommandID: Integer;
  const Param: array of Variant): Variant;
begin
  Result := inherited DoExecute(CommandID, Param);

  if CommandID = iOperationCommand_Notify then
  begin
    try
      FPatientData := TCustomDataView(Integer(Param[0])).ViewData;
      with FPatientData do
      begin
        if Eof then Exit;

        FPatientType := AsInteger[sFieldPatientTypeID]; 
        FHospID := AsString[sFieldHospID];

        YBService.DACommand.Execute('Pro_YB_2001_Prepare',
          [sFieldHospID, sFieldOpID],
          [FHospID, HisUser.ID]);

        FYBRegData.OpenByHospID(FHospID);
        FYBRegData.Edit;

        Self.ShowModal;
      end;
    finally
    end;
  end;
end;

procedure TYB_Hosp_Reg.DoYBFakeAction(Sender: TObject);
begin
  if ShowYesNo('确定登记为准医保病人吗?') then
  begin
    FYBRegData.Edit;
    FYBRegData.AsString['RYBZ'] := FYBRegData.AsString['RYBZ'] + '准医保';
    FYBRegData.ApplyUpdates;

    FPatientData.EditWithNoLogChanges([sFieldPatientTypeID], [iHospPatientType_YB_Fake]);

    ModalResult := mrOk;
  end;
end;

{ TOperationYBHospReg }

procedure TOperationYBHospReg.AfterConstruction;
begin
  inherited;
  BuildAction('取消医保住院登记', '', nil, DoActionCancelReg, 0);
end;

procedure TOperationYBHospReg.DoActionCancelReg(Sender: TObject);
var
  HospInOutView: TTableGridDataView;
  HospID: string;
begin
  HospInOutView := TTableGridDataView(CustomAttributes.Objects[CustomAttributes.IndexOf(sOperationIDHospPatientInOut)]);
  if (HospInOutView <> nil) and not HospInOutView.ViewData.Eof
    and ShowYesNo('确定要取消医保住院登记信息吗?') then
  begin
    HospID := HospInOutView.ViewData.AsString[sFieldHospID];

    YBCore.DoYB20030(HospID);

    YBService.DACommand.Execute('Pro_YB_2001_Cancel',
      [sYBFieldZYH, sFieldOpID],
      [HospID, HisUser.ID]);

    AppCore.Logger.Write('取消医保住院登记成功: ' + HospID, mtInfo, 1);

    HospInOutView.ViewData.EditWithNoLogChanges([sFieldPatientTypeID], [iHospPatientType_Normal]); 
  end;
end;

{ TYB_3003_InParam }

constructor TYB_3003_InParam.Create(AOwner: TComponent);
begin
  inherited Create(AOwner, HisConnection, sDataServiceYB, 'YB_3003_InParam');
  LogChanges := False;
  Source.AutoEdit := True;
  ClinID := '';
end;

procedure TYB_3003_InParam.PrepareData;
begin
end;

procedure TYB_3003_InParam.SetClinID(const Value: string);
begin
  inherited;
  OpenByParam([sFieldClinID], [ClinID]);
end;

{ TYB_3003_InData }

constructor TYB_3003_InData.Create(AOwner: TComponent);
begin
  inherited Create(AOwner, HisConnection, sDataServiceYB, 'YB_3003_InData');
end;

procedure TYB_3003_InData.PrepareData;
begin
  OpenByParam([sYBParamRecList], [RecIDList]);
end;

{ TYB_3003_OutParam }

constructor TYB_3003_OutParam.Create(AOwner: TComponent);
begin
  inherited Create(AOwner, HisConnection, sDataServiceYB, 'YB_3003_OutParam');
  EnableBatchUpdate;
  PrepareData;
end;

procedure TYB_3003_OutParam.PrepareData;
begin
  OpenByFieldValue(sFieldYBID, 0);
end;

{ TYB_4007_InParam }

constructor TYB_4007_InParam.Create(AOwner: TComponent);
begin
  inherited Create(AOwner, HisConnection, sDataServiceYB, 'YB_4007_InParam');
  LogChanges := False;
  Open;
end;

procedure TYB_4007_InParam.PrepareData;
begin
  Edit;
  AsString[sYBFieldJZJLH] := FLinkData.JZJLH;
  AsString[sYBFieldSDYWH] := FLinkData.SDYWH;
  AsString['SSJE'] := CurrToStr(FLinkData.AsCurrency['LXFYZE'] -
    TYB_ClinFee_Base(Owner).YBMoney);
  Save;
end;

{ TYB_4007_OutParam }

constructor TYB_4007_OutParam.Create(AOwner: TComponent);
begin
  inherited Create(AOwner, HisConnection, sDataServiceYB, 'YB_4007_OutParam');
end;

procedure TYB_4007_OutParam.DoDataBeforePost(Sender: TDADataTable);
begin
  inherited;
  AsString[sYBFieldJZJLH] := FLinkData.JZJLH;
  AsString[sYBFieldSDYWH] := FLinkData.SDYWH;   
  AsString[sYBFieldXTJGDM] := FLinkData.XTJGDM;
end;

function TYB_4007_OutParam.GetPlanPay: Double;
begin
  Result := AsFloat['LXJJZF'];
end;

function TYB_4007_OutParam.GetSelfPay: Double;
begin
  Result := AsFloat['LXGRBLZF'] + AsFloat['LXZFFY'];
end;

procedure TYB_4007_OutParam.PrepareData;
begin
  OpenByFieldValue(sFieldYBID, 0);
end;

{ TYB_4007_OutData }

constructor TYB_4007_OutData.Create(AOwner: TComponent);
begin
  inherited Create(AOwner, HisConnection, sDataServiceYB, 'YB_4007_OutData');
end;

procedure TYB_4007_OutData.DoDataAfterInsert(Sender: TDADataTable);
begin
  inherited;
  AsInteger[sFieldYBID] := FLinkData.AsInteger[sFieldYBID];
end;

procedure TYB_4007_OutData.PrepareData;
begin
  OpenByFieldValue(sFieldYBID, 0);
end;

{ TYB_3004_InParam }

constructor TYB_3004_InParam.Create(AOwner: TComponent);
begin
  inherited Create(AOwner, HisConnection, sDataServiceYB, 'YB_3004_InParam');
  LogChanges := False;
  Source.AutoEdit := True;
  ClinID := '';
end;

procedure TYB_3004_InParam.PrepareData;
begin
end;

procedure TYB_3004_InParam.SetClinID(const Value: string);
begin
  inherited;
  OpenByParam([sFieldClinID], [FClinID]);
end;

{ TYB_3004_InData }

constructor TYB_3004_InData.Create(AOwner: TComponent);
begin
  inherited Create(AOwner, HisConnection, sDataServiceYB, 'YB_3004_InData');
end;

procedure TYB_3004_InData.PrepareData;
begin
  OpenByParam([sYBParamRecList], [RecIDList]);
end;

{ TYB_3004_OutParam }

constructor TYB_3004_OutParam.Create(AOwner: TComponent);
begin
  inherited Create(AOwner, HisConnection, sDataServiceYB, 'YB_3004_OutParam');
  EnableBatchUpdate; //在打印后才提交数据
end;

procedure TYB_3004_OutParam.PrepareData;
begin
  OpenByFieldValue(sFieldYBID, 0);
end;

{ TYB_4008_InParam }

constructor TYB_4008_InParam.Create(AOwner: TComponent);
begin
  inherited Create(AOwner, HisConnection, sDataServiceYB, 'YB_4008_InParam');
  LogChanges := False;
  Open;
end;

procedure TYB_4008_InParam.PrepareData;
begin
  Edit;
  AsString[sYBFieldJZJLH] := FLinkData.JZJLH;
  AsString[sYBFieldSDYWH] := FLinkData.SDYWH;
  AsString['SSJE'] := CurrToStr(FLinkData.AsCurrency['BCFYZE'] -
    TYB_ClinFee_Base(Owner).YBMoney);
  Save;
end;

{ TYB_4008_OutParam }

constructor TYB_4008_OutParam.Create(AOwner: TComponent);
begin
  inherited Create(AOwner, HisConnection, sDataServiceYB, 'YB_4008_OutParam');
end;

procedure TYB_4008_OutParam.DoDataBeforePost(Sender: TDADataTable);
begin
  inherited;
  AsString[sYBFieldJZJLH] := FLinkData.JZJLH;
  AsString[sYBFieldSDYWH] := FLinkData.SDYWH; 
  AsString[sYBFieldXTJGDM] := FLinkData.XTJGDM;
end;

function TYB_4008_OutParam.GetPlanPay: Double;
begin
  Result := AsFloat['GSJJZF'];
end;

function TYB_4008_OutParam.GetSelfPay: Double;
begin
  Result := AsFloat['GSZFFY'];
end;

procedure TYB_4008_OutParam.PrepareData;
begin
  OpenByFieldValue(sFieldYBID, 0);
end;

{ TYB_4008_OutData }

constructor TYB_4008_OutData.Create(AOwner: TComponent);
begin
  inherited Create(AOwner, HisConnection, sDataServiceYB, 'YB_4008_OutData');
end;

procedure TYB_4008_OutData.DoDataAfterInsert(Sender: TDADataTable);
begin
  inherited;
  AsInteger[sFieldYBID] := FLinkData.AsInteger[sFieldYBID]
end;

procedure TYB_4008_OutData.PrepareData;
begin
  OpenByFieldValue(sFieldYBID, 0);
end;

{ TYB_4009_InParam }

constructor TYB_4009_InParam.Create(AOwner: TComponent);
begin
  inherited Create(AOwner, HisConnection, sDataServiceYB, 'YB_4009_InParam');
  LogChanges := False;
  Open;
end;

procedure TYB_4009_InParam.PrepareData;
begin
  Edit;
  AsString[sYBFieldJZJLH] := FLinkData.JZJLH;
  AsString[sYBFieldSDYWH] := FLinkData.SDYWH;
  AsString['SSJE'] :=  CurrToStr(FLinkData.AsCurrency['BCFYZE'] -
    TYB_ClinFee_Base(Owner).YBMoney);
  Save;
end;

{ TYB_4009_OutParam }

constructor TYB_4009_OutParam.Create(AOwner: TComponent);
begin
  inherited Create(AOwner, HisConnection, sDataServiceYB, 'YB_4009_OutParam');
end;

procedure TYB_4009_OutParam.DoDataBeforePost(Sender: TDADataTable);
begin
  inherited;
  AsString[sYBFieldJZJLH] := FLinkData.JZJLH;
  AsString[sYBFieldSDYWH] := FLinkData.SDYWH;   
  AsString[sYBFieldXTJGDM] := FLinkData.XTJGDM;
end;

function TYB_4009_OutParam.GetPlanPay: Double;
begin
  Result := AsFloat['SYJJZF'];
end;

function TYB_4009_OutParam.GetSelfPay: Double;
begin
  Result := AsFloat['SYZFFY'];
end;

procedure TYB_4009_OutParam.PrepareData;
begin
  OpenByFieldValue(sFieldYBID, 0);
end;

{ TYB_4009_OutData }

constructor TYB_4009_OutData.Create(AOwner: TComponent);
begin
  inherited Create(AOwner, HisConnection, sDataServiceYB, 'YB_4009_OutData');
end;

procedure TYB_4009_OutData.DoDataAfterInsert(Sender: TDADataTable);
begin
  inherited;
  AsInteger[sFieldYBID] := FLinkData.AsInteger[sFieldYBID]
end;

procedure TYB_4009_OutData.PrepareData;
begin
  OpenByFieldValue(sFieldYBID, 0);
end;

{ TYB_4010_InParam }

constructor TYB_4010_InParam.Create(AOwner: TComponent);
begin
  inherited Create(AOwner, HisConnection, sDataServiceYB, 'YB_4010_InParam');
  LogChanges := False;
  Open;
end;

procedure TYB_4010_InParam.PrepareData;
begin
  Edit;
  AsString[sYBFieldJZJLH] := FLinkData.JZJLH;
  AsString[sYBFieldSDYWH] := FLinkData.SDYWH;
  AsString['SSJE'] :=  CurrToStr(FLinkData.AsCurrency['BCFYZE'] -
    TYB_ClinFee_Base(Owner).YBMoney);
  Save;
end;

{ TYB_4010_OutParam }

constructor TYB_4010_OutParam.Create(AOwner: TComponent);
begin                                                             
  inherited Create(AOwner, HisConnection, sDataServiceYB, 'YB_4010_OutParam');
end;

procedure TYB_4010_OutParam.DoDataBeforePost(Sender: TDADataTable);
begin
  inherited;
  AsString[sYBFieldJZJLH] := FLinkData.JZJLH;
  AsString[sYBFieldSDYWH] := FLinkData.SDYWH;
  AsString[sYBFieldXTJGDM] := FLinkData.XTJGDM;
end;

function TYB_4010_OutParam.GetPlanPay: Double;
begin
  Result := AsFloat['SYJJZF'];
end;

function TYB_4010_OutParam.GetSelfPay: Double;
begin 
  Result := AsFloat['SYZFFY'];
end;

procedure TYB_4010_OutParam.PrepareData;
begin
  OpenByFieldValue(sFieldYBID, 0);
end;

{ TYB_4010_OutData }

constructor TYB_4010_OutData.Create(AOwner: TComponent);
begin
  inherited Create(AOwner, HisConnection, sDataServiceYB, 'YB_4010_OutData');
end;

procedure TYB_4010_OutData.DoDataAfterInsert(Sender: TDADataTable);
begin
  inherited;     
  AsInteger[sFieldYBID] := FLinkData.AsInteger[sFieldYBID]
end;

procedure TYB_4010_OutData.PrepareData;
begin
  OpenByFieldValue(sFieldYBID, 0);
end;

{ TYB_ClinFee_4007 }

procedure TYB_ClinFee_4007.BuildYBData;
begin
  FBalanceYBNum := '30030';
  FPrintYBNum := '40070';
  FClinFeeType := iClinFeeType_YB4007;

  BalanceInParam := TYB_3003_InParam.Create(Self);
  BalanceInData := TYB_3003_InData.Create(Self);
  BalanceOutParam := TYB_3003_OutParam.Create(Self);

  PrintInParam := TYB_4007_InParam.Create(Self);
  PrintOutParam := TYB_4007_OutParam.Create(Self);
  PrintOutData := TYB_4007_OutData.Create(Self);
end;

procedure TYB_ClinFee_4007.DoCalcYBMoney;
begin
  FYBMoney := BalanceOutParam.AsCurrency['LXTCZF'];
end;

{ TYB_ClinFee_4008 }

procedure TYB_ClinFee_4008.BuildYBData;
begin  
  FBalanceYBNum := '30040';
  FPrintYBNum := '40080';
  FClinFeeType := iClinFeeType_YB4008;

  BalanceInParam := TYB_3004_InParam.Create(Self);
  BalanceInData := TYB_3004_InData.Create(Self);
  BalanceOutParam := TYB_3004_OutParam.Create(Self);

  PrintInParam := TYB_4008_InParam.Create(Self);
  PrintOutParam := TYB_4008_OutParam.Create(Self);
  PrintOutData := TYB_4008_OutData.Create(Self);
end;

procedure TYB_ClinFee_4008.DoCalcYBMoney;
begin
  FYBMoney := BalanceOutParam.AsCurrency['TCZF'];
end;

{ TYB_ClinFee_4009 }

procedure TYB_ClinFee_4009.BuildYBData;
begin
  FBalanceYBNum := '30040';
  FPrintYBNum := '40090';
  FClinFeeType := iClinFeeType_YB4009;

  BalanceInParam := TYB_3004_InParam.Create(Self);
  BalanceInData := TYB_3004_InData.Create(Self);
  BalanceOutParam := TYB_3004_OutParam.Create(Self);

  PrintInParam := TYB_4009_InParam.Create(Self);
  PrintOutParam := TYB_4009_OutParam.Create(Self);
  PrintOutData := TYB_4009_OutData.Create(Self);
end;

procedure TYB_ClinFee_4009.DoCalcYBMoney;
begin
  FYBMoney := BalanceOutParam.AsCurrency['TCZF'];
end;

procedure TYB_ClinFee_4009.DoPrepare(YBClinCore: TYB_ClinFee_Core);
begin
  inherited;
  BalanceInParam.Edit;
  BalanceInParam.AsString['JZLB'] := '43';
end;

{ TYB_ClinFee_4010 }

procedure TYB_ClinFee_4010.BuildYBData;
begin
  FBalanceYBNum := '30040';
  FPrintYBNum := '40100';
  FClinFeeType := iClinFeeType_YB4010;

  BalanceInParam := TYB_3004_InParam.Create(Self);
  BalanceInData := TYB_3004_InData.Create(Self);
  BalanceOutParam := TYB_3004_OutParam.Create(Self);

  PrintInParam := TYB_4010_InParam.Create(Self);
  PrintOutParam := TYB_4010_OutParam.Create(Self);
  PrintOutData := TYB_4010_OutData.Create(Self);
end;

procedure TYB_ClinFee_4010.DoCalcYBMoney;
begin
  FYBMoney := BalanceOutParam.AsCurrency['TCZF'];
end;

procedure TYB_ClinFee_4010.DoPrepare(YBClinCore: TYB_ClinFee_Core);
begin
  inherited;
  BalanceInParam.Edit;
  BalanceInParam.AsString['JZLB'] := '49';
end;

{ TYB_2004_InParam }

constructor TYB_2004_InParam.Create(AOwner: TComponent);
begin
  inherited Create(AOwner, HisConnection, sDataServiceYB, 'YB_2004_InParam');
end;

procedure TYB_2004_InParam.OpenByHospID(AHospID: string);
begin
  OpenByParam([sFieldHospID], [AHospID]);
end;

{ TYB_2004_InData }

constructor TYB_2004_InData.Create(AOwner: TComponent);
begin
  inherited Create(AOwner, HisConnection, sDataServiceYB, 'YB_2004_InData');
end;

procedure TYB_2004_InData.OpenByHospID(AHospID: string);
begin
  OpenByParam([sFieldHospID], [AHospID]);
end;

{ TYB_2004_OutParam }

constructor TYB_2004_OutParam.Create(AOwner: TComponent);
begin
  inherited Create(AOwner, HisConnection, sDataServiceYB, 'YB_2004_OutParam');
end;

procedure TYB_2004_OutParam.DoDataAfterInsert(Sender: TDADataTable);
begin
  inherited;
  AsString['ZYH'] := FHospID;
end;

procedure TYB_2004_OutParam.OpenByYBID(YBID: Integer);
begin
  OpenByFieldValue('YBID', YBID);
end;

{ TYB_Hosp_ItemUpload }

procedure TYB_Hosp_ItemUpload.BuildViewAction;
begin
  inherited;
  BuildAction('开始上传', 'upload', '', DoActionWholeUploadUpdate, DoActionWholeUpload, 0, BTN_SHOWCAPTION);
  // BuildAction('逐个上传', 'upload', '', DoActionWholeUploadUpdate, DoActionSingleUpload, 0, 0);
end;

procedure TYB_Hosp_ItemUpload.BuildViewLayout;
begin
  inherited;
  
  ToolBarGroup.ShowBorder := True;
  FDetailList := TStringList.Create;

  F2004InParam := TYB_2004_InParam.Create(Self);
  F2004InData := TYB_2004_InData.Create(Self);
  F2004InData.EnableBatchUpdate;
  F2004OutParam := TYB_2004_OutParam.Create(Self);

  ViewData := F2004InData;
end;

procedure TYB_Hosp_ItemUpload.DataQuery;
begin
  F2004InData.OpenByHospID(FHospID);  
end;

destructor TYB_Hosp_ItemUpload.Destroy;
begin
  FDetailList.Free;
  inherited;
end;

procedure TYB_Hosp_ItemUpload.DoActionSingleUpload(Sender: TObject);
begin

end;

procedure TYB_Hosp_ItemUpload.DoActionWholeUpload(Sender: TObject);
begin
  YBCore.PrepareForNext;

  F2004OutParam.OpenByYBID(0);
  YBCore.DoYB('20040', F2004InParam, F2004OutParam, [F2004InData], [], cmNone, False);

  AppCore.Logger.WriteFmt('正在更新上传标志(%s)(%s)...',
    [FHospID, F2004OutParam.AsString['PH']], mtInfo, 0);

  FDetailList.Clear;
  FDetailList.Add('<root>');
  EnumDataTable(F2004InData.Table, DoBuildDetailList, 0);
  FDetailList.Add('</root>');

  YBService.DACommand.Execute('Pro_YB_2004_UpdateData',
    ['HospID', 'DetailIDList', 'PH'],
    [FHospID, FDetailList.Text, F2004OutParam.AsString['PH']]);

  AppCore.Logger.Write('医保上传完成|' + FHospID, mtInfo, 1);
  
  DataQuery;
end;

procedure TYB_Hosp_ItemUpload.DoActionWholeUploadUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := F2004InData.Table.Active
    and (F2004InData.RecordCount > 0);
end;

procedure TYB_Hosp_ItemUpload.DoBuildDetailList(ADataTable: TDADataTable;
  AParam: Variant);
begin
  if F2004InData.AsBoolean['UploadSign'] then
  begin
    FDetailList.Add('<id>' + F2004InData.AsString['FeeDetailID'] + '</id>');
  end;
end;

function TYB_Hosp_ItemUpload.DoExecute(CommandID: Integer;
  const Param: array of Variant): Variant;
begin
  Result := inherited DoExecute(CommandID, Param);

  if CommandID = iOperationCommand_Notify then
  begin
    with TCustomDataView(Integer(Param[0])).ViewData do
    begin
      if Eof then Exit;
      
      Check(AsInteger[sFieldPatientTypeID] <> iHospPatientType_YB, '非医保病人.');

      ToolBarGroup.Caption := GetRecordText(CustomAttributes.Values['PatientInfoFields'], '  ');

      FHospID := AsString[sFieldHospID];
      F2004InData.OpenByHospID(FHospID);
      F2004InParam.OpenByHospID(FHospID);
      F2004OutParam.OpenByYBID(0);

      AppCore.MainView.ShowView(Self);
    end;  
  end;
end;

{ TYB_HospFee_Core }

procedure TYB_HospFee_Core.BuildDialog;
var
  TempGroup: TdxLayoutGroup;
begin
  inherited;
  FRegisteredHospFeeViews := TStringList.Create;
  FRegisteredHospFeeViews.CommaText := YBCore.RegisteredHospFeeViews.CommaText;

  FYB2001 := TYB_2001.Create(Self);
  FYB2010 := TYB_2010_InParam.Create(Self);

  ImageName := 'misc\HospYB.png';
  Caption := '住院医保结算';
  Width := 1200;
  ViewLayout.FindItem(OKButton).Visible := False;
  CancelButton.Caption := '关闭(&C)';

  FYBCardAction := BuildAction('读医保卡', '', '', DoYBCardUpdate, DoYBCardAction, 0,
    BTN_NOTFLAT or BTN_CANBEFOCUSED or BTN_SHOWCAPTION);
  FBalanceAction := BuildAction('预结算', '', '', nil, DoBalanceAction, 0,
    BTN_NOTFLAT or BTN_CANBEFOCUSED or BTN_SHOWCAPTION);
  FPrintAction := BuildAction('准备收费', '', '', DoPrintUpdate, DoPrintAction, 0,
    BTN_NOTFLAT or BTN_CANBEFOCUSED or BTN_SHOWCAPTION);

  BuildLayoutToolBar(ButtonGroup, [FYBCardAction, FBalanceAction, FPrintAction]);

  with DialogGroup do
  begin
    TempGroup := CreateGroup();
    TempGroup.Caption := '医保病人信息';
    YBCore.YB10020Data.OpenByZKBH('');
    DevExpress.BuildFormView(TempGroup, YBCore.YB10020Data);

    FYBItem := CreateItemForControl(nil);
  end;
end;

destructor TYB_HospFee_Core.Destroy;
begin
  FRegisteredHospFeeViews.Free;
  inherited;
end;

procedure TYB_HospFee_Core.DoBalanceAction(Sender: TObject);
begin
  FCurYBHospView.DoBalance;
end;

procedure TYB_HospFee_Core.DoBalanceUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := YBCore.Done10020 or NoCard;
end;

procedure TYB_HospFee_Core.DoDialogShow(Sender: TObject);
begin
  inherited;   
end;

procedure TYB_HospFee_Core.DoPrintAction(Sender: TObject);
var
  Msg: string;
begin
  YBService.DACommand.Execute('Pro_YB_Hosp_BeforeFee',
    ['Msg', sFieldOfficeID, sFieldOpID, 'YBSum', sFieldHospID,
      'FeeTypeID', 'BalanceData'],
    ['', HisUser.OfficeID, HisUser.ID, CurYBHospView.YBSumPrice, FHospID,
       CurYBHospView.FHospFeeType,
       DataTable_GetXmlText(CurYBHospView.BalanceOutParam.Table)]);

  Msg := YBService.GetCommandOutputParam('Msg');
  if Msg <> '' then
  begin
    ShowWarning(Msg);
    AppCore.Logger.WriteFmt('住院医保提示(%s)：%s', [FHospID, Msg], mtInfo, 0);
  end;

  if FCurYBHospView.DoPrint then
    ModalResult := mrOK;
end;

procedure TYB_HospFee_Core.DoPrintUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := FCurYBHospView.Balanced;
end;

procedure TYB_HospFee_Core.DoYBCardAction(Sender: TObject);
begin
  YBCore.DoYB10020;
end;

procedure TYB_HospFee_Core.DoYBCardUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := not NoCard;
end;

function TYB_HospFee_Core.Execute(HospFeeDialog: TcvHospFeeDialog): Boolean;
var
  JZLB, YBFunctionID: string;
  ViewIndex: Integer;
begin
  FHospFeeDialog := HospFeeDialog;

  FHospID := FHospFeeDialog.PatientView.PatientData.HospID;
  FYB2001.OpenByHospID(FHospID);
  FYB2010.OpenByHospID(FHospID);
  JZLB := FYB2001.AsString['JZLB'];

  if FCurYBHospView <> nil then
    FCurYBHospView.Visible := False;
  FCurYBHospView := nil;

  with DataContainer.Items['D_YB_05_JZLB_2001'] do
  begin
    Open;
    if Locate('Code', JZLB, []) then
    begin
      YBFunctionID := AsString['FunctionID'];

      ViewIndex := FRegisteredHospFeeViews.IndexOf(YBFunctionID);

      if ViewIndex >= 0 then
      begin
        FCurYBHospView := TYB_HospFee_Base(FRegisteredHospFeeViews.Objects[ViewIndex]);

        if FCurYBHospView = nil then
        begin
          FCurYBHospView := TYB_HospFee_BaseClass(YBCore.RegisteredHospFeeViews.Objects[ViewIndex]).Create(Self);
          FRegisteredHospFeeViews.Objects[ViewIndex] := FCurYBHospView;
        end;

        Caption := FCurYBHospView.Caption;

        FYBItem.Control := FCurYBHospView;
        FCurYBHospView.Visible := True;
      end
      else
        raise Exception.Create('未定义医保结算视图.');
    end
    else
      raise Exception.Create('未找到就诊类别对应医保功能号.');
  end;
  
  YBCore.PrepareForNext;
  FCurYBHospView.DoPrepare();

  Result := inherited Execute();
end;

function TYB_HospFee_Core.GetNoCard: Boolean;
begin
  Result := Trim(FYB2001.AsString[sYBFieldZKBH]) = ''
end;

{ TYB_HospFee_Base }

procedure TYB_HospFee_Base.BuildViewLayout;
var
  TempGroup: TdxLayoutGroup;
begin
  inherited;
  BorderStyle := bsNone;
  IsEmbedded := True;

  BuildYBData;

  ClientWidth := StrToIntDef(BalanceInParam.CustomAttributes.Values['FormWidth'], 600);
  ClientHeight := StrToIntDef(BalanceInParam.CustomAttributes.Values['FormHeight'], 400);

  with ViewLayout.Items do
  begin
    TempGroup := CreateGroup();
    BalanceInParam.PrepareData;
    DevExpress.BuildFormView(TempGroup, BalanceOutParam);
    TempGroup := TempGroup.CreateGroup;
    with TempGroup do
    begin
      LayoutDirection := ldHorizontal;
      ShowBorder := False;
      BalanceInParam.PrepareData;
      DevExpress.BuildFormView(TempGroup, BalanceInParam);
    end;
  end;
end;

procedure TYB_HospFee_Base.BuildYBData;
begin
end;

procedure TYB_HospFee_Base.CallYBPrint;
begin
  YBCore.DoYB(FPrintYBNum, PrintInParam, PrintOutParam, [], [PrintOutData],
    cmNoPassword, YBHospCore.NoCard);

  PrintOutParam.ApplyUpdates;

  if YBCore.SaveHospBalanceData then
    BalanceOutParam.ApplyUpdates;
end;

procedure TYB_HospFee_Base.DoBalance;
begin
  YBCore.DoYB(FBalanceYBNum, BalanceInParam, BalanceOutParam, [],
    [], //[BalanceOutData1, BalanceOutData2],
    cmNone, False);
  FBalanced := True;
end;

procedure TYB_HospFee_Base.DoCalcYBMoney;
begin
end;

procedure TYB_HospFee_Base.DoPrepare();
begin
  FYBMoney := 0;
  FBalanced := False;

  BalanceInParam.PrepareNext;
  BalanceOutParam.PrepareNext;
end;

function TYB_HospFee_Base.DoPrint: Boolean;
begin
  Result := False;
  DoCalcYBMoney;
  with YBHospCore.HospFeeDialog do
    Result := StartFee(FHospFeeType, FYBMoney, 0, PrintCallBack);
end;

function TYB_HospFee_Base.GetSDYWH: string;
begin
  Result := BalanceInParam.AsString[sYBFieldSDYWH];
end;

function TYB_HospFee_Base.GetYBSumPrice: Currency;
begin
  Result := BalanceOutParam.GetSumPrice;
end;

procedure TYB_HospFee_Base.PrintCallback(Sender: TcvHospFeeDialog);
begin
  with Sender do
  begin
    CallYBPrint;

    YBCore.DoYB90020(
      PrintInParam.JZJLH,
      PrintInParam.SDYWH,
      BalanceOutParam.GetSelfPay,
      BalanceOutParam.GetPlanPay,
      YBHospCore.NoCard);

    YBID := PrintOutParam.AsInteger[sFieldYBID];
  end;
end;

{ TYB_2010_InParam }

constructor TYB_2010_InParam.Create(AOwner: TComponent);
begin
  inherited Create(AOwner, HisConnection, sDataServiceYB, 'YB_2010_InParam');
end;

procedure TYB_2010_InParam.OpenByHospID(HospID: string);
begin
  OpenByParam([sYBFieldZYH], [HospID]);
end;

{ TYB_2010_OutParam }

constructor TYB_2010_OutParam.Create(AOwner: TComponent);
begin
  inherited Create(AOwner, HisConnection, sDataServiceYB, 'YB_2010_OutParam');
  LogChanges := False;
end;

{ TYB_2011_InParam }

constructor TYB_2011_InParam.Create(AOwner: TComponent);
begin
  inherited Create(AOwner, HisConnection, sDataServiceYB, 'YB_2011_InParam');
end;

procedure TYB_2011_InParam.OpenByHospID(HospID: string);
begin
  OpenByParam([sYBFieldZYH], [HospID]);
end;


{ TYB_Hosp_OutReg }

procedure TYB_Hosp_OutReg.BuildDialog;
begin
  inherited;

  FYBOutRegInParam := TYB_2010_InParam.Create(Self);
  FYBOutRegInParam.EnableBatchUpdate;
  FYBOutRegInParam.OpenByHospID('');

  ImageName := FYBOutRegInParam.CustomAttributes.Values['FormImageName'];

  FYBOutRegOutParam := TYB_2010_OutParam.Create(Self);
  FYBOutRegOutParam.LogChanges := False;
  FYBOutRegOutParam.Open;

  DevExpress.BuildFormView(DialogGroup, FYBOutRegInParam);
end;

procedure TYB_Hosp_OutReg.DoDialogOK(Sender: TObject);
var
  CardMode: TYBCardMode;
begin
  if ShowYesNo('确定提交医保出院登记信息吗?') then
  begin
    CardMode := cmPassword;
    if FYBOutRegInParam.AsString['ZKBH'] = '' then
      CardMode := cmNone;

    YBCore.DoYB('20100', FYBOutRegInParam, FYBOutRegOutParam, [], [], CardMode, CardMode = cmNone);

    YBService.DACommand.Execute('Pro_YB_2010',
      [sYBFieldZYH, sYBFieldSDYWH, sFieldOpID],
      [FHospID, FYBOutRegOutParam.AsString[sYBFieldSDYWH], HisUser.ID]);

    AppCore.Logger.Write('医保出院登记完成|' + FHospID, mtInfo, 1);

    ModalResult := mrOk;
  end;  
end;

function TYB_Hosp_OutReg.DoExecute(CommandID: Integer;
  const Param: array of Variant): Variant;
begin
  Result := inherited DoExecute(CommandID, Param);

  if CommandID = iOperationCommand_Notify then
  begin
    try
      with TCustomDataView(Integer(Param[0])), ViewData do
      begin
        if Eof then Exit;

        Check(AsInteger[sFieldPatientTypeID] <> iHospPatientType_YB, '非医保病人');

        FHospID := AsString[sFieldHospID];

        YBService.DACommand.Execute('Pro_YB_2010_Prepare',
          [sFieldHospID, sFieldOpID],
          [FHospID, HisUser.ID]);

        FYBOutRegInParam.OpenByHospID(FHospID);

        Check(FYBOutRegInParam.Eof, '未找到医保登记信息');

        FYBOutRegInParam.Edit;

        if Self.ShowModal = mrOk then
        begin
        end;
      end;
    finally

    end;
  end;
end;

{ TOperationYBHospOutReg }

procedure TOperationYBHospOutReg.AfterConstruction;
begin
  inherited;
  BuildAction('取消医保出院登记', '', nil, DoActionCancelOutReg, 0);
end;

procedure TOperationYBHospOutReg.DoActionCancelOutReg(Sender: TObject);
var
  HospInOutView: TTableGridDataView;
  HospID: string;
begin
  HospInOutView := TTableGridDataView(CustomAttributes.Objects[CustomAttributes.IndexOf(sOperationIDHospPatientInOut)]);
  if (HospInOutView <> nil) and not HospInOutView.ViewData.Eof
    and (HospInOutView.ViewData.AsInteger[sFieldPatientTypeID] = iHospPatientType_YB)
    and ShowYesNo('确定取消医保出院登记吗?') then
  begin
    HospID := HospInOutView.ViewData.AsString[sFieldHospID];
    YBCore.DoYB20110(HospID);

    YBService.DACommand.Execute('Pro_YB_2010_Cancel',
      [sYBFieldZYH, sFieldOpID],
      [HospID, HisUser.ID]);

    AppCore.Logger.Write('医保出院登记取消完成: ' + HospID, mtInfo, 1);
  end;
end;

{ TYB_HospFee_4001 }

procedure TYB_HospFee_4001.BuildYBData;
begin
  inherited;
  Caption := '医保住院普通结算';
  FBalanceYBNum := '20050';
  FPrintYBNum := '40010';
  FHospFeeType := iHospFeeType_YB4001;

  BalanceInParam := TYB_2005_InParam.Create(Self);
  BalanceOutParam := TYB_2005_OutParam.Create(Self);

  PrintInParam := TYB_4001_InParam.Create(Self);
  PrintOutParam := TYB_4001_OutParam.Create(Self);
  PrintOutData := TYB_4001_OutData.Create(Self);
end;

procedure TYB_HospFee_4001.DoCalcYBMoney;
var
  YLFYZE, CZFJE, CFDXJE, BCFYGRZF, GRZHYE, GRZHZF: Currency;
begin
  FYBMoney := 0;

  if BalanceOutParam.EOF then Exit;

  GRZHYE := YBCore.YB10020Data.GRZHYE;
  with BalanceOutParam.Table do
  begin
    YLFYZE := FieldByName('YLFYZE').AsCurrency;
    CZFJE := FieldByName('CZFJE').AsCurrency;
    CFDXJE := FieldByName('CFDXJE').AsCurrency;
    BCFYGRZF := FieldByName('BCFYGRZF').AsCurrency;
  end;
  GRZHZF := BCFYGRZF - CZFJE - CFDXJE;

  // 中途结算是否可使用账户?
  if (BalanceInParam.AsString['GRZHSYBZ'] = '1') and (GRZHYE > 0) then
  begin
    if GRZHYE >= GRZHZF then
      BCFYGRZF := BCFYGRZF - GRZHZF
    else
      BCFYGRZF := BCFYGRZF - GRZHYE;
  end;
  FYBMoney := YLFYZE - BCFYGRZF;
end;

{ TYB_HospFee_4002 }

procedure TYB_HospFee_4002.BuildYBData;
begin
  inherited;
  Caption := '医保住院工伤结算';
  FBalanceYBNum := '20060';
  FPrintYBNum := '40020';
  FHospFeeType := iHospFeeType_YB4002;

  BalanceInParam := TYB_2006_InParam.Create(Self);
  BalanceOutParam := TYB_2006_OutParam.Create(Self);

  PrintInParam := TYB_4002_InParam.Create(Self);
  PrintOutParam := TYB_4002_OutParam.Create(Self);
  PrintOutData := TYB_4002_OutData.Create(Self);
end;

procedure TYB_HospFee_4002.DoCalcYBMoney;
begin
  with BalanceOutParam.Table do
  begin
    FYBMoney := FieldByName('GSJJZF').AsCurrency;
  end; 
end;

{ TYB_2005_InParam }

constructor TYB_2005_InParam.Create(AOwner: TComponent);
begin
  inherited Create(AOwner, 'YB_2005_InParam');
end;

{ TYB_2005_OutParam }

constructor TYB_2005_OutParam.Create(AOwner: TComponent);
begin
  inherited Create(AOwner, 'YB_2005_OutParam');
end;

function TYB_2005_OutParam.GetPlanPay: Double;
begin
  Result := AsFloat['BCFYYBZF'];
end;

function TYB_2005_OutParam.GetSelfPay: Double;
begin                           
  Result := AsFloat['BCFYGRZF'];
end;

{ TYB_4001_InParam }

constructor TYB_4001_InParam.Create(AOwner: TComponent);
begin
  inherited Create(AOwner, 'YB_4001_InParam');
end;

{ TYB_4001_OutParam }

constructor TYB_4001_OutParam.Create(AOwner: TComponent);
begin
  inherited Create(AOwner, 'YB_4001_OutParam');
end;

{ TYB_4001_OutData }

constructor TYB_4001_OutData.Create(AOwner: TComponent);
begin
  inherited Create(AOwner, 'YB_4001_OutData');
end;

{ TYB_2006_InParam }

constructor TYB_2006_InParam.Create(AOwner: TComponent);
begin
  inherited Create(AOwner, 'YB_2006_InParam');
end;

{ TYB_2006_OutParam }

constructor TYB_2006_OutParam.Create(AOwner: TComponent);
begin
  inherited Create(AOwner, 'YB_2006_OutParam');
end;

function TYB_2006_OutParam.GetPlanPay: Double;
begin
  Result := AsFloat['GSJJZF'];
end;

function TYB_2006_OutParam.GetSelfPay: Double;
begin
  Result := AsFloat['GSGRZF'] + AsFloat['GSZFFY'];
end;

function TYB_2006_OutParam.GetSumPrice: Currency;
begin
  Result := AsCurrency['GSBCYLFY'];
end;

{ TYB_4002_OutParam }

constructor TYB_4002_OutParam.Create(AOwner: TComponent);
begin
  inherited Create(AOwner, 'YB_4002_OutParam');
end;

{ TYB_4002_OutData }

constructor TYB_4002_OutData.Create(AOwner: TComponent);
begin
  inherited;
  CustomAttributes.Values['YBName'] := 'FPDY_GSZY';
end;

{ TYB_2007_OutParam }

constructor TYB_2007_OutParam.Create(AOwner: TComponent);
begin
  inherited Create(AOwner, 'YB_2007_OutParam');
end;

function TYB_2007_OutParam.GetPlanPay: Double;
begin
  Result := AsFloat['SYJJZF'];
end;

function TYB_2007_OutParam.GetSelfPay: Double;
begin                   
  Result := AsFloat['SYZFFY'];
end;

function TYB_2007_OutParam.GetSumPrice: Currency;
begin
  Result := AsCurrency['SYBCYLFY'];
end;

{ TYB_4003_OutParam }

constructor TYB_4003_OutParam.Create(AOwner: TComponent);
begin
  inherited Create(AOwner, 'YB_4003_OutParam');
end;

{ TYB_4003_OutData }

constructor TYB_4003_OutData.Create(AOwner: TComponent);
begin
  inherited;
  CustomAttributes.Values['YBName'] := 'FPDY_SYZY';
end;

{ TYB_40010_Print_OutParam }

procedure TYB_40010_Print_OutParam.ApplyUpdates;
begin
  inherited;
  // 更新明细数据
  with TYB_HospFee_Base(Owner).PrintOutData do
  begin
    DataTable_UpdateFieldValue(Table, sFieldYBID, Self.AsInteger[sFieldYBID]);
    ApplyUpdates;
  end;
end;

constructor TYB_40010_Print_OutParam.Create(AOwner: TComponent;
  ALogicalName: string);
begin
  inherited Create(AOwner, HisConnection, sDataServiceYB, ALogicalName);
  EnableBatchUpdate;
end;

procedure TYB_40010_Print_OutParam.DoDataBeforePost(Sender: TDADataTable);
begin
  inherited;
  AsString[sFieldHospID] := YBHospCore.HospID;
  AsString[sYBFieldSDYWH] := TYB_HospFee_Base(Owner).SDYWH;
end;

procedure TYB_40010_Print_OutParam.PrepareData;
begin
  OpenByFieldValue(sFieldYBID, 0);
end;

{ TYB_40010_Print_OutData }

constructor TYB_40010_Print_OutData.Create(AOwner: TComponent;
  ALogicalName: string);
begin
  inherited Create(AOwner, HisConnection, sDataServiceYB, ALogicalName);
  EnableBatchUpdate;
end;

procedure TYB_40010_Print_OutData.DoDataBeforePost(Sender: TDADataTable);
begin
  inherited;
  AsInteger[sFieldYBID] := TYB_HospFee_Base(Owner).PrintOutParam.AsInteger[sFieldYBID];
end;

procedure TYB_40010_Print_OutData.PrepareData;
begin
  OpenByFieldValue(sFieldYBID, 0);
end;

{ TYB_20050_Balance_OutParam }

constructor TYB_20050_Balance_OutParam.Create(AOwner: TComponent;
  ALogicalName: string);
begin
  inherited Create(AOwner, HisConnection, sDataServiceYB, ALogicalName);
  EnableBatchUpdate;
end;

procedure TYB_20050_Balance_OutParam.DoDataBeforePost(
  Sender: TDADataTable);
begin
  inherited;
  AsString[sFieldHospID] := YBHospCore.HospID;
  AsString[sYBFieldSDYWH] := TYB_HospFee_Base(Owner).SDYWH;
end;

function TYB_20050_Balance_OutParam.GetSumPrice: Currency;
begin
  Result := AsCurrency['YLFYZE'];
end;

procedure TYB_20050_Balance_OutParam.PrepareData;
begin

end;

procedure TYB_20050_Balance_OutParam.PrepareNext;
begin
  OpenByFieldValue(sFieldYBID, 0);
end;

{ TYB_20050_Balance_InParam }

constructor TYB_20050_Balance_InParam.Create(AOwner: TComponent;
  ALogicalName: string);
begin
  inherited Create(AOwner, HisConnection, sDataServiceYB, ALogicalName);
  LogChanges := False;
  Source.AutoEdit := True;
end;

procedure TYB_20050_Balance_InParam.PrepareData;
begin

end;

procedure TYB_20050_Balance_InParam.PrepareNext;
begin
  OpenByParam(['ZYH'], [YBHospCore.HospID]);
end;

{ TYB_40010_Print_InParam }

constructor TYB_40010_Print_InParam.Create(AOwner: TComponent;
  ALogicalName: string);
begin
  inherited Create(AOwner, HisConnection, sDataServiceYB, ALogicalName);
  EnableBatchUpdate;
end;

procedure TYB_40010_Print_InParam.PrepareData;
begin
  OpenByParam([sYBFieldZYH], [YBHospCore.HospID]);
  Edit;
  if (Table.FindField('GRZHSYBZ') <> nil) and
    (TYB_HospFee_Base(Owner).BalanceInParam.Table.FindField('GRZHSYBZ') <> nil) then
    AsString['GRZHSYBZ'] := TYB_HospFee_Base(Owner).BalanceInParam.AsString['GRZHSYBZ'];
  // AsString['YSK'] := '0';
  AsString['SSJE'] := CurrToStr(TYB_HospFee_Base(Owner).BalanceOutParam.GetSumPrice -
    TYB_HospFee_Base(Owner).YBMoney);
  Save;
end;

{ TYB_2008_OutParam }

constructor TYB_2008_OutParam.Create(AOwner: TComponent);
begin
  inherited Create(AOwner, 'YB_2008_OutParam');
end;

function TYB_2008_OutParam.GetPlanPay: Double;
begin
  Result := AsFloat['LXTCZF'];
end;

function TYB_2008_OutParam.GetSelfPay: Double;
begin                   
  Result := AsFloat['LXGRBLZF'] + AsFloat['LXZFFY'];
end;

function TYB_2008_OutParam.GetSumPrice: Currency;
begin
  Result := AsCurrency['LXFYZE'];
end;

{ TYB_4004_OutParam }

constructor TYB_4004_OutParam.Create(AOwner: TComponent);
begin
  inherited Create(AOwner, 'YB_4004_OutParam')
end;

{ TYB_4004_OutData }

constructor TYB_4004_OutData.Create(AOwner: TComponent);
begin
  inherited;
  CustomAttributes.Values['YBName'] := 'FPDY_LXZY';  
end;

{ TYB_HospFee_4003 }

procedure TYB_HospFee_4003.BuildYBData;
begin
  inherited;
  Caption := '医保住院生育结算';
  FBalanceYBNum := '20070';
  FPrintYBNum := '40030';
  FHospFeeType := iHospFeeType_YB4003;

  BalanceInParam := TYB_2007_InParam.Create(Self);
  BalanceOutParam := TYB_2007_OutParam.Create(Self);

  PrintInParam := TYB_4003_InParam.Create(Self);
  PrintOutParam := TYB_4003_OutParam.Create(Self);
  PrintOutData := TYB_4003_OutData.Create(Self);
end;

procedure TYB_HospFee_4003.DoCalcYBMoney;
begin
  with BalanceOutParam do
  begin
    FYBMoney := AsCurrency['SYJJZF'] + AsCurrency['ZYYLJG'] + AsCurrency['ZYCSYDE'];
  end;
end;

{ TYB_HospFee_4004 }

procedure TYB_HospFee_4004.BuildYBData;
begin
  inherited;
  Caption := '医保住院离休军人结算';
  FBalanceYBNum := '20080';
  FPrintYBNum := '40040';
  FHospFeeType := iHospFeeType_YB4004;

  BalanceInParam := TYB_2008_InParam.Create(Self);
  BalanceOutParam := TYB_2008_OutParam.Create(Self);

  PrintInParam := TYB_4004_InParam.Create(Self);
  PrintOutParam := TYB_4004_OutParam.Create(Self);
  PrintOutData := TYB_4004_OutData.Create(Self);
end;

procedure TYB_HospFee_4004.DoCalcYBMoney;
begin
  with BalanceOutParam do
  begin
    FYBMoney := AsCurrency['LXTCZF'];
  end;
end;

{ TYB_ClinFee_Plugin }

procedure TYB_ClinFee_Plugin.BuildPluginAction(AClinRecipeView: TClinCashierView);
begin   
end;

constructor TYB_ClinFee_Plugin.Create(AOwner: TComponent);
begin
  inherited;
end;

procedure TYB_ClinFee_Plugin.DoAfterInFee(AReg: TcdClinReg;
  AFeeID: string);
begin  

end;

procedure TYB_ClinFee_Plugin.DoAfterReturnFee(AFee: TcdClinFeeMaster;
  ANewFeeID: string);
begin  

end;

procedure TYB_ClinFee_Plugin.DoBeforeInFee(AReg: TcdClinReg;
  AFee: TcdClinFeeMaster);
begin

end;

procedure TYB_ClinFee_Plugin.DoBeforeReturnFee(AFee: TcdClinFeeMaster;
  AReturnFee: TcdClinFeeMaster);
begin
  if AReturnFee.YBMoney > 0 then
    YBCore.DoYB50010_Clin(AFee.ClinFeeID);
end;

function TYB_ClinFee_Plugin.GetPluginName: string;
begin
  Result := 'YB';
end;

{ TcvYBHospMaster }

procedure TcvYBHospMaster.BuildViewLayout;
begin
  inherited;
  FInvoiceEdit := TcxMaskEdit.Create(Self);
  SerialIDWrapper.Wrap(FInvoiceEdit).OnSerialID := DoInvoiceIDEvent;

  with ToolBarGroup do
  begin
    with CreateItemForControl(FInvoiceEdit) do
    begin
      AlignVert := avCenter;
      Caption := '号码:';
    end;
  end;

  OnDoubleClickView := DoDoubleClick;
  PeriodGroup.Visible := True;
  SetData(TCustomData.Create(Self, HisConnection, sDataServiceYB, 'YB_HospMaster'));
end;

procedure TcvYBHospMaster.DataQuery;
begin
  ViewData.OpenByParam(['BeginDate', 'EndDate', 'ParamValue',
     sFieldOfficeID, sFieldOpID],
    [BeginDate, EndDate, FInvoiceEdit.Text,
     HisUser.OfficeID, HisUser.ID]);
end;

procedure TcvYBHospMaster.DoDoubleClick(Sender: TObject);
begin
  AppCore.Operations.SearchOperation(sOperationIDHospFeeMasterQuery).Execute(
    iOperationCommand_HospFeeID,
    [ViewData.AsString['HospFeeID']]);
end;

procedure TcvYBHospMaster.DoInvoiceIDEvent(Sender: TObject);
begin
  DataQuery();
end;

{ TOperationYBItemUpload }

procedure TOperationYBItemUpload.AfterConstruction;
begin
  inherited;  
  BuildAction('农合上传', '', nil, DoActionXNHUpload, 0);  
  BuildAction('医保试算', '', nil, DoActionYBCalc, 0);    
end;

procedure TOperationYBItemUpload.DoActionXNHUpload(Sender: TObject);
var
  HospPatientView: TTableGridDataView;
begin
  HospPatientView := TTableGridDataView(CustomAttributes.Objects[CustomAttributes.IndexOf(sOperationIDHospPatient)]);

  AppCore.Operations.SearchOperation(sOperationIDXNHHospItemUpload).Execute(
    iOperationCommand_Notify, [Integer(HospPatientView)]);
end;

procedure TOperationYBItemUpload.DoActionYBCalc(Sender: TObject);
begin
  YBService.YBCalc(TTableGridDataView(CustomAttributes.Objects[
    CustomAttributes.IndexOf(sOperationIDHospPatient)]).
    ViewData.AsString[sFieldHospID]);
end;

function TOperationYBItemUpload.DoExecute(CommandID: Integer;
  const Param: array of Variant): Variant;
begin
  Result := AppCore.Operations.SearchOperation(sOperationIDYBHospItemUpload).Execute(CommandID, Param);
end;

{ TcvYBSeverePatient }

procedure TcvYBSeverePatient.BuildViewAction;
begin
  inherited;
  BuildAction('读医保卡', 'card', '', nil, DoReadCard, 0, BTN_SHOWCAPTION);
end;

procedure TcvYBSeverePatient.BuildViewLayout;
begin
  inherited;
  OnDoubleClickView := DoDoubleClick;
  SetDataEditing(True);
  ViewData := TCustomData.Create(Self, HisConnection, sDataServiceYB, 'YB_SeverePatient');
  ViewData.OnBeforePost := DoBeforePost;
end;

procedure TcvYBSeverePatient.DataInsert;
begin
  inherited;
  ViewData.AsString['RegOpName'] := HisUser.Name;
end;

procedure TcvYBSeverePatient.DataQuery;
begin
  inherited;
end;

procedure TcvYBSeverePatient.DoBeforePost(Sender: TObject);
begin
  Check(ViewData.AsString['Name'] = '', '请填写姓名');
  Check(ViewData.AsString['SocialCode'] = '', '请填写社保卡号');
  Check(ViewData.AsString['IDCode'] = '', '请填写身份证号');
  Check(ViewData.AsString['BZName'] = '', '请填写病种');    
  Check(ViewData.AsString['Link'] = '', '请填写联系方式');
  Check(ViewData.AsString['Category'] = '', '请填写分类信息');
end;

procedure TcvYBSeverePatient.DoDoubleClick(Sender: TObject);
begin

end;

procedure TcvYBSeverePatient.DoReadCard(Sender: TObject);
begin
  YBCore.DoYB10020;

  if ViewData.Table.State = dsBrowse then
  begin
    Check(ViewData.Locate('SocialCode', YBCore.YB10020Data.AsString[sYBFieldZKBH], []),
      '未找到医保卡号%s', [YBCore.YB10020Data.AsString[sYBFieldZKBH]]);
  end
  else begin
    DataTable_CopyCurrentRecord(YBCore.YB10020Data.Table, ViewData.Table,
      ['XM', 'XB', 'SCNY', 'ZKBH', 'GMSFHM', 'DWMC', 'XTJGDM'],
      ['Name', 'Sex', 'Birth', 'SocialCode', 'IDCode', 'Unit', 'AreaCode']);

    if ViewData.AsString['Sex'] = '1' then
      ViewData.AsString['Sex'] := '男'
    else
      ViewData.AsString['Sex'] := '女';
  end;
end;

{ TYBService }

procedure TYBService.YBCalc(AHospID: string);
begin
  DACommand.Execute('Pro_YB_HospSum_Calc',
    [sFieldHospID], [AHospID]);

  if FYB4001 = nil then
    FYB4001 := TCustomData.Create(Self, HisConnection, sDataServiceYB, 'YB_4001_Calc');

  FYB4001.OpenByFieldValue(sFieldHospID, AHospID);
  DictIME.StartIME(nil, FYB4001, '', '', nil, True);
end;

initialization
  YBCore := TYBCore.Create(nil);
  RegisterHospFeeProc(iHospPatientType_YB, YBHospFeeProc);
  ClinFeePluginManager.RegisterPlugin(TYB_ClinFee_Plugin.Create(nil));

finalization
  FreeAndNil(YBCore);

end.

