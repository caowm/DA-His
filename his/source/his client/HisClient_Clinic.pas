unit HisClient_Clinic;

{
  HIS门诊模块

  Written by caowm (remobjects@qq.com)
  2014年10月
}

interface

uses
  SysUtils,
  Classes,
  Forms,
  Messages,
  Menus,
  Controls,
  Variants,
  ActnList,
  StdCtrls,
  DateUtils,
  DB,
  Graphics,
  StrUtils,
  Math,
  Contnrs,
  Windows,
  uDACore,
  uDAFields,
  uDAWhere,
  uDADataTable,
  uDAMemDataTable,
  uRORemoteService,
  uDARemoteDataAdapter,
  uDAInterfaces,
  uDARemoteCommand,
  DataAbstract4_Intf,
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
  cxCurrencyEdit,
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
  App_Function,
  App_Common,
  App_FastReport,
  App_DevExpress,
  App_Class,
  App_DAModel,
  App_DAView,
  Intf_IDCard,
  Intf_RFCard,
  HisClient_Const,
  HisClient_Classes,
  HisClient_Base,
  HisClient_System;

type

  IVoiceClinReg = interface
    ['{65D23F80-C2BD-467B-852D-9AE058DEFAA8}']
    procedure ClinRegOpen();
    procedure ClinRegBegin();
    procedure ClinRegNameChange(RegData: TCustomData);
    procedure ClinRegPriceChange(RegData: TCustomData);
    procedure ClinRegEnd(RegData: TCustomData);
  end;

  IVoiceClinFee = interface
    ['{267FFE35-465E-4F91-AEFF-B3428EB66AF4}']
    procedure ClinFeeOpen();
    procedure ClinFeeBegin(RegData: TCustomData);
    procedure ClinFeeSumMoney(FeeData: TCustomData);
    procedure ClinFeePOSMoney(FeeData: TCustomData);
    procedure ClinFeeETCMoney(FeeData: TCustomData);
    procedure ClinFeeGetMoney(FeeData: TCustomData);
    procedure ClinFeeEnd(FeeData: TCustomData);
  end;

  TcdClinFeeMaster = class;

  THisClinService = class(TCustomDataService)
  private
    FOnRecipeCheck: TNotifyEvent;
    FVoiceClinReg: IVoiceClinReg;
    FVoiceClinFee: IVoiceClinFee;
  public
    function HookClinID(const AClinID: string; AQueryFlag: Integer = 0): string;

    function Reg(ARegPrice, ADiagPrice, ACasePrice, ASumPrice: Currency;
      ARegTypeID, APatientID: Integer;
      const ADoctorID, AOfficeID: string): string;

    procedure RegReturn(const AClinID: string);

    function RegBalance(AEndDate: TDateTime): Integer;

    procedure RecMasterLock(const AClinID, ARecipeIDList: string);

    procedure RecMasterUnLock(const AClinID, ARecipeIDList: string);

    function CalcRecipePrice(const AClinID, ARecipeIDList: string): Currency;

    function CalcDiscount(const AClinID, ARecipeIDList, ACardNum: string;
      AFeeTypeID: Integer): Currency;

    function CalcReturnPrice(const AClinFeeID: string): Currency;

    function CalcReturnDiscount(const AClinFeeID: string): Currency;

    procedure FeeTakeCheck(const AClinID, ARecipeIDList: string;
      AFeeMaster: TcdClinFeeMaster);

    function FeeTake(const AClinID, ARecipeIDList: string;
      AFeeMaster: TcdClinFeeMaster): string;

    function FeeReturnApply(const AClinFeeID: string;
      AWholeReturn: Integer): string;

    procedure FeeReturnCheck(const AClinFeeID: string;
      AReturnFeeMaster: TcdClinFeeMaster);

    function FeeReturn(const AClinFeeID: string;
      AReturnFeeMaster: TcdClinFeeMaster): string;

    function FeeBalance(AEndDate: TDateTime): Integer;

    procedure ExecRecipe(RecipeID: Integer);

    procedure WriteRecipeDrugCheck(RecipeID: Integer; CheckSign: Integer);

    procedure PrintFee(const AClinFeeID: string);

    procedure PrintFeeBalance(ABalanceID: Integer);

    procedure PrintRecipe(ARecipeID: Integer);

    procedure PrintReg(AClinID: string);

    procedure PrintRegBalance(ABalanceID: Integer);

    procedure FeeBalanceCheck(ABalanceID: Integer);

    procedure FeeBalanceCancel(ABalanceID: Integer);

    property OnRecipeCheck: TNotifyEvent read FOnRecipeCheck
      write FOnRecipeCheck;
    property VoiceClinReg: IVoiceClinReg read FVoiceClinReg write FVoiceClinReg;
    property VoiceClinFee: IVoiceClinFee read FVoiceClinFee write FVoiceClinFee;
  end;

  TClinRecordView = class;

  TcdClinRegPatient = class(TCustomData)
  private
    function GetClinID: string;
    function GetDoctorID: string;
    function GetInterfaceID: string;
    function GetMemo: string;
    function GetOfficeID: string;
    function GetPatientName: string;
    function GetPID: Integer;
    function GetRegSign: Integer;
    function GetRegTime: TDateTime;
    function GetRegTypeID: Integer;
    function GetSumPrice: Currency;
    function GetSystemCode: string;
  protected
    procedure DoDataBeforePost(Sender: TDADataTable); override;
  public
    constructor Create(AOwner: TComponent);

    function CanEdit(): Boolean; override;
    function CanInsert(): Boolean; override;
    function CanDelete(): Boolean; override;

    procedure OpenRegPatient(AOfficeID, ANum: string; AQueryFlag: Integer = 0);
    procedure OpenByOfficeID(AOfficeID: string);
    procedure OpenByNum(ANum: string);
    procedure OpenHistory(AClinID: string);

    property ClinID: string read GetClinID;
    property RegTime: TDateTime read GetRegTime;
    property PID: Integer read GetPID;
    property PatientName: string read GetPatientName;
    property RegSign: Integer read GetRegSign;
    property OfficeID: string read GetOfficeID;
    property DoctorID: string read GetDoctorID;
    property RegTypeID: Integer read GetRegTypeID;
    property SumPrice: Currency read GetSumPrice;
    property SystemCode: string read GetSystemCode;
    property InterfaceID: string read GetInterfaceID;
    property Memo: string read GetMemo;

  end;

  TcdClinReg = class(TCustomData)
  private
    function GetClinID: string;
    function GetRegOffice: string;
    function GetRegTime: TDateTime;
    function GetInterfaceID: string;
    function GetSystemCode: string;
    function GetMemo: string;
    function GetPatientName: string;
    function GetDiagPrice: Currency;
    function GetRegPrice: Currency;
    function GetRegTypeID: Integer;
    procedure SetRegOffice(const Value: string);
    procedure SetRegPrice(const Value: Currency);
    procedure SetRegTypeID(const Value: Integer);
    procedure SetDiagPrice(const Value: Currency);
    function GetDoctor: string;
    procedure SetDoctor(const Value: string);
    function GetCasePrice: Currency;
    procedure SetCasePrice(const Value: Currency);
    function GetSumPrice: Currency;
    procedure SetSumPrice(const Value: Currency);
    function GetPID: Integer;
    procedure SetPID(const Value: Integer);
    function GetRegSign: Integer;
    procedure SetClinID(const Value: string);
    function GetICD10: string;
    function GetSickName: string;
  public
    constructor Create(AOwner: TComponent);
    procedure Open(); override;
    procedure OpenNotBalanced(AEndDate: TDateTime; AOpID: string);
    procedure OpenByPeriod(ABeginDate, AEndDate: TDateTime);
    procedure OpenByValidID(AClinID: string);
    procedure OpenByRecipeID(ARecipeID: string);
    procedure OpenByBalanceID(ABalanceID: Integer);

    property ClinID: string read GetClinID write SetClinID;
    property RegTime: TDateTime read GetRegTime;
    property PID: Integer read GetPID write SetPID;
    property PatientName: string read GetPatientName;
    property RegSign: Integer read GetRegSign;
    property OfficeID: string read GetRegOffice write SetRegOffice;
    property DoctorID: string read GetDoctor write SetDoctor;
    property RegTypeID: Integer read GetRegTypeID write SetRegTypeID;
    property RegPrice: Currency read GetRegPrice write SetRegPrice;
    property DiagPrice: Currency read GetDiagPrice write SetDiagPrice;
    property CasePrice: Currency read GetCasePrice write SetCasePrice;
    property SumPrice: Currency read GetSumPrice write SetSumPrice;
    property SystemCode: string read GetSystemCode;
    property InterfaceID: string read GetInterfaceID;
    property Memo: string read GetMemo;
    property SickName: string read GetSickName;
    property ICD10: string read GetICD10;
  end;

  TcdRecMaster = class(TCustomData)
  private
    FClinID: string;
    FQueryFlag: Integer;
    function GetExecOfficeID: string;
    function GetRecTypeID: string;
    function GetCountOpID: string;
    function GetIsMedicine: Boolean;
    function GetRecType: string;
    function GetDoctorID: string;
    function GetOfficeID: string;
    function GetRootRecTypeID: string;
    function GetDoctorName: string;
    function GetOfficeName: string;
    procedure SetExecOfficeID(const Value: string);
    procedure SetRecTypeID(const Value: string);
    procedure SetClinID(const Value: string);
    procedure SetRecType(const Value: string);
    procedure SetDoctorID(const Value: string);
    procedure SetOfficeID(const Value: string);
    procedure SetRootRecTypeID(const Value: string);
    procedure SetDoctorName(const Value: string);
    procedure SetOfficeName(const Value: string);
    function GetCheckSign: Integer;
    procedure SetCheckSign(const Value: Integer);
  protected
    procedure DoDataBeforePost(Sender: TDADataTable); override;
  public
    constructor Create(AOwner: TComponent;
      const ADataName: string = sDataNameClinRecMaster);

    procedure Open(); override;
    function CanEdit(): Boolean; override;
    function CanInsert(): Boolean; override;
    function CanDelete(): Boolean; override;

    property CurrentClinID: string read FClinID write SetClinID;
    property QueryFlag: Integer read FQueryFlag write FQueryFlag;
    property IsMedicine: Boolean read GetIsMedicine;
    property RootRecTypeID: string read GetRootRecTypeID write SetRootRecTypeID;
    property RecTypeID: string read GetRecTypeID write SetRecTypeID;
    property RecType: string read GetRecType write SetRecType;
    property OfficeID: string read GetOfficeID write SetOfficeID;
    property OfficeName: string read GetOfficeName write SetOfficeName;
    property DoctorID: string read GetDoctorID write SetDoctorID;
    property DoctorName: string read GetDoctorName write SetDoctorName;
    property ExecOfficeID: string read GetExecOfficeID write SetExecOfficeID;
    property CountOpID: string read GetCountOpID;
    property CheckSign: Integer read GetCheckSign write SetCheckSign;
  end;

  TcdRecDetail = class(TCustomData)
  private
    function GetFrequency: string;
    procedure SetFrequency(const Value: string);
    function GetDrugUse: string;
    procedure SetDrugUse(const Value: string);
    function GetRecipeID: Integer;
    function GetRecMaster: TcdRecMaster;
    function GetGroupNum: Integer;
    procedure SetGroupNum(const Value: Integer);
  protected
    procedure DoDataBeforePost(Sender: TDADataTable); override;
    procedure QueryAfterMasterScroll(); override;
  public
    constructor Create(AOwner: TComponent;
      const ADataName: string = sDataNameClinRecDetail);
    procedure AssignFieldValue(const AFieldName: string; ASource: TCustomData;
      var ADone: Boolean); override;

    function CanEdit(): Boolean; override;
    function CanInsert(): Boolean; override;
    function CanDelete(): Boolean; override;
    procedure Open(); override;
    procedure AdjustDayCount(NewDayCount: Integer);

    property RecMaster: TcdRecMaster read GetRecMaster;
    property RecipeID: Integer read GetRecipeID;
    property Frequency: string read GetFrequency write SetFrequency;
    property DrugUse: string read GetDrugUse write SetDrugUse;
    property GroupNum: Integer read GetGroupNum write SetGroupNum;
  end;

  TcdClinFeeMaster = class(TCustomData)
  private
    FReturnFlag: Boolean;
    FPOSMoneyChange: TNotifyEvent;
    FGetMoneyChange: TNotifyEvent;
    FETCMoneyChange: TNotifyEvent;
    function GetFeeID: string;
    function GetFeeSign: Integer;
    function GetOldFeeID: string;
    function GetSumPrice: Currency;
    function GetCashMoney: Currency;
    function GetPosMoney: Currency;
    function GetYBMoney: Currency;
    function GetETCMoney1: Currency;
    function GetGetMoney: Currency;
    function GetChargeMoney: Currency;
    function GetInterfaceID: string;
    function GetSystemCode: string;
    function GetFeeTime: TDateTime;
    function GetPatientName: string;
    function GetFeeType: Integer;
    function GetETCCode1: string;
    function GetETCType1: string;
    function GetETCCode2: string;
    function GetETCMoney2: Currency;
    function GetETCType2: string;
    function GetFeeTypeID: Integer;
    function GetYBID: Integer;
    procedure SetSumPrice(const Value: Currency);
    procedure SetCashMoney(const Value: Currency);
    procedure SetYBMoney(const Value: Currency);
    procedure SetPosMoney(const Value: Currency);
    procedure SetETCMoney1(const Value: Currency);
    procedure SetGetMoney(const Value: Currency);
    procedure SetETCCode1(const Value: string);
    procedure SetETCType1(const Value: string);
    procedure SetChargeMoney(const Value: Currency);
    procedure SetETCCode2(const Value: string);
    procedure SetETCMoney2(const Value: Currency);
    procedure SetETCType2(const Value: string);
    procedure SetFeeTypeID(const Value: Integer);
    procedure SetYBID(const Value: Integer);
    function GetReturnSign: Integer;
    function GetDiscount: Currency;
    procedure SetDiscount(const Value: Currency);
  protected
    procedure InitTableAfterSchema(ATable: TDAMemDataTable); override;
    procedure DoFieldChange(Sender: TDACustomField);
    procedure DoFieldGetMoneyChange(Sender: TDACustomField);
    procedure DoFieldPOSMoneyChange(Sender: TDACustomField);
    procedure DoFieldETCMoneyChange(Sender: TDACustomField);
  public
    constructor Create(AOwner: TComponent;
      const ALogicalName: string = sDataNameClinFeeMaster);
    procedure OpenByFeeID(AClinFeeID: string);
    procedure OpenNotBalanced(AEndDate: TDateTime; AOpID: string);
    procedure OpenByPeriod(ABeginDate, AEndDate: TDateTime);
    procedure OpenByBalanceID(ABalanceID: Integer);
    procedure OpenByYBID(AYBID: Integer);

    property PatientName: string read GetPatientName;
    property FeeTime: TDateTime read GetFeeTime;
    property ClinFeeID: string read GetFeeID;
    property FeeSign: Integer read GetFeeSign;
    property ReturnSign: Integer read GetReturnSign;
    property OldClinFeeID: string read GetOldFeeID;
    property FeeTypeID: Integer read GetFeeTypeID write SetFeeTypeID;
    property YBID: Integer read GetYBID write SetYBID;
    property SumPrice: Currency read GetSumPrice write SetSumPrice; // 应收
    property CashMoney: Currency read GetCashMoney write SetCashMoney; // 收现
    property YBMoney: Currency read GetYBMoney write SetYBMoney; // 收医保
    property PosMoney: Currency read GetPosMoney write SetPosMoney; // 收Pos
    property DiscountMoney: Currency read GetDiscount write SetDiscount;
    property ETCMoney1: Currency read GetETCMoney1 write SetETCMoney1; // 收其他
    property ETCType1: string read GetETCType1 write SetETCType1; // 收其他
    property ETCCode1: string read GetETCCode1 write SetETCCode1; //
    property ETCMoney2: Currency read GetETCMoney2 write SetETCMoney2; // 收其他
    property ETCType2: string read GetETCType2 write SetETCType2; // 收其他
    property ETCCode2: string read GetETCCode2 write SetETCCode2; //
    property GetMoney: Currency read GetGetMoney write SetGetMoney; // 收款
    property ChargeMoney: Currency read GetChargeMoney write SetChargeMoney;
    // 找零
    property FeeType: Integer read GetFeeType;
    property SystemCode: string read GetSystemCode;
    property InterfaceID: string read GetInterfaceID;
    property OnPOSMoneyChange: TNotifyEvent read FPOSMoneyChange
      write FPOSMoneyChange;
    property OnETCMoneyChange: TNotifyEvent read FETCMoneyChange
      write FETCMoneyChange;
    property OnGetMoneyChange: TNotifyEvent read FGetMoneyChange
      write FGetMoneyChange;
  end;

  TcdClinFeeDetail = class(TCustomData)
  private
  public
    constructor Create(AOwner: TComponent);
    procedure OpenByFeeID(AClinFeeID: string);
    procedure OpenByPeriod(ABeginDate, AEndDate: TDateTime);
  end;

  TcdClinPatient = class(THisData)
  private
    function GetPID: Integer;
    function GetICCode: string;
  protected
    procedure DoDataAfterInsert(Sender: TDADataTable); override;
    procedure DoDataBeforePost(Sender: TDADataTable); override;
  public
    constructor Create(AOwner: TComponent);
    procedure OpenByID(AID: Integer);
    property PID: Integer read GetPID;
    property ICCode: string read GetICCode;
  end;

  THisICCard = class
  private
    FData: TcdClinPatient;
    FControlBits: string;
    FCardAuthMode: Integer;
    FCardNormalPwd: string;
    FCardIDPwd: string;
    FCardIDBlockNumber: Integer;
    FCardCodeBlockNumber: Integer;
    function GetPatient: TcdClinPatient;
  public
    constructor Create();
    destructor Destroy(); override;
    function GetRandomCode(): string;
    procedure CheckCard();
    procedure WriteCard(AID: Integer; ACode: string);
    function ReadCard(): Integer;
    function ClearCard(): Integer;

    property Patient: TcdClinPatient read GetPatient;
  end;

  TClinCenterView = class(TTableGridDataView)
  private
    FClinIDEdit: TcxMaskEdit;
    FRecordView: TClinRecordView;
    function GetClinRegPatient: TcdClinRegPatient;
    procedure DoActionQueryAll(Sender: TObject);
    procedure DoActionQueryOffice(Sender: TObject);
    procedure DoActionQueryHistory(Sender: TObject);
    procedure DoActionUpdateHistory(Sender: TObject);
    procedure DoActionQueryRecord(Sender: TObject);
    procedure DoActionUpdateRecord(Sender: TObject);
    procedure DoClinIDEvent(Sender: TObject);
    procedure DoDoubleClickCell(Sender: TObject);
  protected
    procedure BuildViewLayout(); override;
    procedure BuildViewAction(); override;
    function DoExecute(CommandID: Integer; const Param: array of Variant)
      : Variant; override;
    function GetPluginFlag(): Integer; override;
  public
    procedure DataQuery(); override;
    procedure DataEdit(); override;
    property ClinRegPatient: TcdClinRegPatient read GetClinRegPatient;
  end;

  TClinRegView = class(TBaseLayoutView)
  private
    FOfficeData: TCustomData;
    FRegTypeData: TcdClinicRegType;
    FRegData: TcdClinReg;
    FOfficeView: TTableGridDataView;
    FRegTypeView: TTableGridDataView;

    FPatientGroup: TdxLayoutGroup;
    FRegGroup: TdxLayoutGroup;
    FPatientMemo: TcxMemo;

    procedure RefreshPatientMemo();

    procedure DoRegTypeScroll(Sender: TObject);
    procedure DoActionRegister(Sender: TObject);
    procedure DoActionReadCard(Sender: TObject);
    procedure DoActionReturnCard(Sender: TObject);
    procedure DoActionCreateCard(Sender: TObject);
    procedure DoActionUnRegister(Sender: TObject);
  protected
    procedure BuildViewLayout(); override;
  public
    destructor Destroy(); override;
  end;

  TClinRegQueryView = class(TTableGridDataView)
  private
    FRegData: TcdClinReg;
  protected
    function DoExecute(CommandID: Integer; const Param: array of Variant)
      : Variant; override;
  public
    constructor Create(AOwner: TComponent); override;
    function CanPrint(): Boolean; override;
    procedure DataQuery(); override;
  end;

  TClinRegBalanceView = class(TTableGridDataView)
  private
    procedure DoBalanceAction(Sender: TObject);
    procedure DoBalanceActionUpdate(Sender: TObject);
  protected
    procedure BuildViewLayout(); override;
    procedure BuildViewAction(); override;
  public
    procedure DataQuery(); override;
  end;

  TClinRecSelectDialog = class(TCheckListDialog)
  private
    FClinID: string;
    FPriceEdit: TcxCurrencyEdit;
    procedure DoCheckListChange(Sender: TObject);
  protected
    procedure BuildDialog; override;
  public
    function Execute(AClinID: string): Boolean;
  end;

  TClinRecDetailView = class;

  TClinRecMasterView = class(TTableGridDataView)
  private
    FRecMaster: TcdRecMaster;
    FRecDetail: TcdRecDetail;
    FRecDetailView: TClinRecDetailView;
    FClinRecType: TcdBaseRecipeType;
    FClinFeeItemData: TcdBaseClinFeeItem;
    FClinDoctor: TCustomData;
    FFeeGroupDialog: TBaseFeeGroupDialog;
    FRecipeGroupDialog: TBaseRecipeGroupDialog;
    procedure DoActionAddAppType(Sender: TObject);
    procedure DoActionAddAppTypeUpdate(Sender: TObject);
    procedure DoActionCheck(Sender: TObject);
    procedure DoActionCheckUpdate(Sender: TObject);
    procedure DoOnSelectFeeGroup(Sender: TObject);
    procedure DoOnSelectRecipeGroup(Sender: TObject);
    procedure DoRecordScroll(Sender: TObject);
    function GetFeeGroupDialog(): TBaseFeeGroupDialog;
    function GetRecipeGroupDialog(): TBaseRecipeGroupDialog;
    function LocateDoctor(): Boolean;
  protected
    procedure BuildViewAction(); override;
  public
    constructor Create(AOwner: TComponent);
    procedure DataInsert(); override;
    procedure DataPrint(); override;
    property RecMasterData: TcdRecMaster read FRecMaster;
    property RecDetailData: TcdRecDetail read FRecDetail write FRecDetail;
  end;

  TClinRecDetailView = class(TTableGridDataView)
  private
    FRecDetail: TcdRecDetail;
    FDayCount: Integer;
  protected
    procedure BuildViewAction(); override;
    procedure DoActionAdjustDayUpdate(Sender: TObject);
    procedure DoActionAdjustDayCount(Sender: TObject);
    procedure DoAdjustDayCount(Sender: TObject);
  public
    constructor Create(AOwner: TComponent);
    procedure AutoGroup();
    property RecDetailData: TcdRecDetail read FRecDetail;
  end;

  TClinDoctorStation = class(TBaseLayoutView)
  private
    FRegData: TcdClinReg;
    FPatientLabel: TcxLabel;
    FMasterView: TClinRecMasterView;
    FDetailView: TClinRecDetailView;
    FPatientGroup: TdxLayoutGroup;
  protected
    procedure BuildViewLayout(); override;
    function DoExecute(CommandID: Integer; const Param: array of Variant)
      : Variant; override;
  public
    destructor Destroy(); override;

    procedure TakeClinID(const AClinID: string); virtual;
    procedure TakePatient(ClinRegPatient: TcdClinRegPatient);

    property RegData: TcdClinReg read FRegData;
    property MasterView: TClinRecMasterView read FMasterView;
    property DetailView: TClinRecDetailView read FDetailView;
    property PatientGroup: TdxLayoutGroup read FPatientGroup;
  end;

  TClinFeeTakeDialog = class;

  TClinCashierView = class(TClinDoctorStation)
  private
    FClinIDEdit: TcxMaskEdit;
    FRecipeIDList: string;
    FFeeAction: TAction;
    FRecSelectDialog: TClinRecSelectDialog;
    FFeeTakeDialog: TClinFeeTakeDialog;

    procedure DoActionFeeTake(Sender: TObject);
    procedure DoActionFeeTakeUpdate(Sender: TObject);
    function GetFeeTakeView: TClinFeeTakeDialog;
    procedure DoClinIDEvent(Sender: TObject);
  protected
    procedure BuildViewLayout(); override;
    function GetPluginFlag(): Integer; override;
    function GetPluginLayoutGroup(AOperation: TBaseOperation)
      : TComponent; override;
    procedure TakeClinID(const AClinID: string); override;
  public
    function SelectRecipe(): Boolean;
    procedure DoClear();

    property RecipeIDList: string read FRecipeIDList;
    property FeeTakeView: TClinFeeTakeDialog read GetFeeTakeView;
  end;

  TClinFeeTakeDialog = class(TBaseDialog)
  private
    FCashierView: TClinCashierView;
    FFeeMasterData: TcdClinFeeMaster;
    FClinFeeID: string;
    FOnTakeFee: TNotifyEvent;
    FClinFeeExtendOperation: TBaseOperation;
  protected
    procedure BuildDialog(); override;
    procedure DoDialogOK(Sender: TObject); override;
    procedure TakeFee();
    procedure CallExtendOperation(CommandID: Integer);
    procedure DoFeeNormal();
    procedure DoFeeTakeCheck();
    procedure DoFeeExtend(Sender: TObject);
    procedure DoFieldETCType1Change(Sender: TDACustomField);
    procedure DoFieldETCCode1Change(Sender: TDACustomField);
    procedure DoFieldETCType2Change(Sender: TDACustomField);
    procedure DoFieldETCCode2Change(Sender: TDACustomField);
    procedure DoFieldPOSMoneyChange(Sender: TObject);
    procedure DoFieldETCMoneyChange(Sender: TObject);
    procedure DoFieldGetMoneyChange(Sender: TObject);
  public
    function Execute(ACashierView: TClinCashierView; AFeeTypeID: Integer;
      YBMoney: Currency; AOnTakeFee: TNotifyEvent): Boolean;

    property FeeData: TcdClinFeeMaster read FFeeMasterData;
    property ClinFeeID: string read FClinFeeID write FClinFeeID;
  end;

  { 门诊退费对话框 }
  TClinFeeReturnDialog = class(TBaseDialog)
  private
    FFeeMasterData: TcdClinFeeMaster;
    FClinFeeID: string;
    FOnReturnFee: TNotifyEvent;
  protected
    procedure BuildDialog(); override;
    procedure DoDialogOK(Sender: TObject); override;
    procedure DoFeeReturnCheck();
  public
    function Execute(const AClinFeeID: string;
      AOnReturnFee: TNotifyEvent): Boolean;

    property ReturnFee: TcdClinFeeMaster read FFeeMasterData;
    property ClinFeeID: string read FClinFeeID write FClinFeeID;
  end;

  TClinBaseFeePlugin = class(TComponent)
  private
  public
    function GetPluginName: string; virtual; abstract;
    procedure BuildPluginAction(AClinRecipeView: TClinCashierView);
      virtual; abstract;

    procedure DoBeforeInFee(AReg: TcdClinReg; AFee: TcdClinFeeMaster);
      virtual; abstract;
    procedure DoAfterInFee(AReg: TcdClinReg; AClinFeeID: string);
      virtual; abstract;

    procedure DoBeforeReturnFee(AFee: TcdClinFeeMaster;
      AReturnFee: TcdClinFeeMaster); virtual; abstract;
    procedure DoAfterReturnFee(AFee: TcdClinFeeMaster; ANewFeeID: string);
      virtual; abstract;

    property PluginName: string read GetPluginName;
  end;

  TClinFeePluginManager = class
  private
    FPlugins: TObjectList;
  public
    constructor Create();
    destructor Destroy(); override;
    procedure RegisterPlugin(APlugin: TClinBaseFeePlugin);
    function FindPlugin(AName: string): TClinBaseFeePlugin;

    procedure BuildPluginAction(AClinView: TClinCashierView);

    procedure DoBeforeInFee(AReg: TcdClinReg; AFee: TcdClinFeeMaster);
    procedure DoAfterInFee(AReg: TcdClinReg; AClinFeeID: string);

    procedure DoBeforeReturnFee(AFee: TcdClinFeeMaster;
      AReturnFee: TcdClinFeeMaster);
    procedure DoAfterReturnFee(AFee: TcdClinFeeMaster; ANewFeeID: string);
  end;

  TClinFeeReturnView = class(TTableGridDataView)
  private
    FSumPrice: Currency;
    FNewFeeID: string;
    FFeeMasterData: TcdClinFeeMaster;
    FFeeMasterView: TTableGridDataView;
    FInvoiceIDEdit: TcxMaskEdit;
    FReturnApplyDialog: TCheckBoxDialog;
    FFeeReturnDialog: TClinFeeReturnDialog;

    procedure DoCloseAll();
    procedure DoReturnAction(Sender: TObject);
    procedure DoReturnActionUpdate(Sender: TObject);
    procedure DoInvoiceID(Sender: TObject);
    procedure DoDataBeforePost(Sender: TDADataTable);
    procedure DoReturnFee(Sender: TObject);
  protected
    procedure BuildViewLayout(); override;
  public
    procedure DataQuery(); override;
    function CanEdit(): Boolean; override;
  end;

  TClinFeeQueryView = class(TTableGridDataView)
  private
    FDetailAction: TAction;
    FInvoiceEdit: TcxMaskEdit;
    procedure DoDetailAction(Sender: TObject);
    procedure DoDetailUpdate(Sender: TObject);
    procedure DoInvoiceIDEvent(Sender: TObject);
  protected
    function DoExecute(CommandID: Integer; const Param: array of Variant)
      : Variant; override;
    procedure BuildViewAction(); override;
    procedure BuildViewLayout(); override;
  public
    function CanPrint(): Boolean; override;

    procedure DataQuery(); override;
  end;

  TClinFeeBalanceView = class(TTableGridDataView)
  private
    procedure DoBalanceAction(Sender: TObject);
    procedure DoBalanceActionUpdate(Sender: TObject);
  protected
    procedure BuildViewLayout(); override;
    procedure BuildViewAction(); override;
  public
    procedure DataQuery(); override;
  end;

  TClinFeeDetailQueryView = class(TTableGridDataView)
  private
    FInvoiceEdit: TcxMaskEdit;
    procedure DoInvoiceIDEvent(Sender: TObject);
  protected
    function DoExecute(CommandID: Integer; const Param: array of Variant)
      : Variant; override;
    procedure BuildViewLayout(); override;
  public
    procedure DataQuery(); override;
  end;

  THisPatientDialog = class(TBaseDialog)
  private
    FPatient: TcdClinPatient;
    FIDAction: TAction;
    FWriteCard: Boolean;
    procedure DoReadIDAction(Sender: TObject);
  protected
    procedure DoDialogOK(Sender: TObject); override;
    procedure BuildDialog; override;
    function GetPluginFlag(): Integer; override;
  public
    function Execute(): Boolean; override;
    destructor Destroy(); override;
    property Patient: TcdClinPatient read FPatient;
  end;

  TClinRecCheckView = class(TTableGridDataView)
  private
    FRecCheckData: TCustomData;
    FRecipeID: Integer;
    FClinID: string;
  protected
    procedure BuildViewLayout(); override;
  public
    function CanInsert(): Boolean; override;
    function CanEdit(): Boolean; override;
    function CanDelete(): Boolean; override;
    procedure DataQuery(); override;
    procedure DataInsert(); override;

    procedure OpenByRecipe(ARecipeData: TCustomData);
  end;

  TClinRecExecView = class(TTableGridDataView)
  private
    FClinIDEdit: TcxMaskEdit;
    FDetailView: TClinRecDetailView;
    FRecCheckView: TClinRecCheckView;
    procedure DoActionExecUpdate(Sender: TObject);
    procedure DoActionExec(Sender: TObject);
    procedure DoActionCheckUpdate(Sender: TObject);
    procedure DoActionCheckResult(Sender: TObject);
    procedure DoClinIDEvent(Sender: TObject);
  protected
    procedure BuildViewLayout(); override;
    procedure BuildViewAction(); override;
  public
    procedure DataQuery(); override;
  end;

  TClinRecordView = class(TTableGridDataView)
  private
    FClinID: string;
    FDetailView: TClinRecDetailView;
    FLISResult: TCustomData;
    FPACSResult: TCustomData;
    FCheckResult: TCustomData;
    procedure DoActionCheckUpdate(Sender: TObject);
    procedure DoActionCheckResult(Sender: TObject);
    procedure DoActionLIS(Sender: TObject);
    procedure DoActionPACS(Sender: TObject);
    procedure DoClinIDEvent(Sender: TObject; AClinID: string);
  protected
    procedure BuildViewLayout(); override;
    procedure BuildViewAction(); override;
  public
    procedure DataQuery(); override;
    procedure OpenByClinID(AClinID: string);

    procedure ShowClinID(AClinID: string);
  end;

  TFeeBalanceCheckView = class(TTableGridDataView)
  private
    procedure DoActionCheck(Sender: TObject);
    procedure DoActionCheckUpdate(Sender: TObject);
    procedure DoActionCancel(Sender: TObject);
    procedure DoActionCancelUpdate(Sender: TObject);
    procedure DoDoubleClick(Sender: TObject);
    procedure DoActionQueryByCheckTime(Sender: TObject);
  protected
    procedure BuildViewLayout(); override;
    procedure BuildViewAction(); override;
  public
    function CanPrint(): Boolean; override;
    function CanEdit(): Boolean; override;
    procedure DataQuery(); override;
  end;

  TClinRegView2 = class(TBaseDialog)
  private
    FIDAction: TAction;
    FClinID: string;
    FRegHelpData: TCustomData;
    procedure DoCalcRegData(Sender: TObject);
    procedure DoReadIDAction(Sender: TObject);
    procedure DoActionUnRegister(Sender: TObject);
    procedure DoActionEditReg(Sender: TObject);
    procedure DoSumPriceChange(Sender: TDACustomField);
    procedure DoPatientNameChange(Sender: TDACustomField);
    { IVoiceClinReg }
    procedure ClinRegOpen();
    procedure ClinRegBegin();
    procedure ClinRegNameChange();
    procedure ClinRegPriceChange();
    procedure ClinRegEnd();
  protected
    procedure BuildDialog; override;
    procedure DoDialogOK(Sender: TObject); override;
    procedure DoDialogCancel(Sender: TObject); override;
    function GetPluginFlag(): Integer; override;
  public
    procedure DoClear();
    property RegHelpData: TCustomData read FRegHelpData;
  end;

function PatientDialog(): THisPatientDialog;

procedure IDCard2Patient(AID: TIdentity; APatient: TDADataTable);

procedure DefineClinicCommonData(ADataContainer: TDataContainer);
procedure OrganizeClinicOperations();

var
  ClinicCard: THisICCard;
  ClinicService: THisClinService;
  ClinFeePluginManager: TClinFeePluginManager;

implementation

var
  FPatientDialog: THisPatientDialog;

  { THisClinService }

function THisClinService.FeeBalance(AEndDate: TDateTime): Integer;
begin
  { 计算门诊发票金额 }
  DACommand.Execute('Pro_Clin_Fee_Balance', [sFieldOpID, 'EndDate', 'Memo',
    'BalanceID'], [HisUser.ID, AEndDate, '', 0]);
  Result := GetCommandOutputParam('BalanceID');

  PrintFeeBalance(Result);
end;

function THisClinService.CalcRecipePrice(const AClinID, ARecipeIDList: string)
  : Currency;
begin
  DACommand.Execute('Pro_Clin_Fee_CalcRecipePrice',
    [sFieldClinID, 'RecipeIDList', 'SumPrice'], [AClinID, ARecipeIDList, 0]);

  Result := GetCommandOutputParam('SumPrice');
end;

function THisClinService.FeeTake(const AClinID, ARecipeIDList: string;
  AFeeMaster: TcdClinFeeMaster): string;
begin
  with AFeeMaster do
    DACommand.Execute('Pro_Clin_Fee_Take', ['ClinFeeID', sFieldClinID,
      'RecipeIDList', 'OpID', 'FeeTypeID', 'YBID', 'SumPrice', 'CashMoney',
      'YBMoney', 'PosMoney', 'DiscountMoney', 'ETCMoney1', 'ETCMoney2',
      'GetMoney', 'ChargeMoney', 'ETCType1', 'ETCCode1', 'ETCType2',
      'ETCCode2'], ['', AClinID, ARecipeIDList, HisUser.ID, FeeTypeID, YBID,
      SumPrice, CashMoney, YBMoney, PosMoney, DiscountMoney, ETCMoney1,
      ETCMoney2, GetMoney, ChargeMoney, ETCType1, ETCCode1, ETCType2,
      ETCCode2]);
  Result := GetCommandOutputParam('ClinFeeID');
end;

procedure THisClinService.FeeReturnCheck(const AClinFeeID: string;
  AReturnFeeMaster: TcdClinFeeMaster);
begin
  with AReturnFeeMaster do
    DACommand.Execute('Pro_Clin_Fee_ReturnCheck',
      ['OldFeeID', 'SumPrice', 'DiscountMoney', 'CashMoney', 'YBMoney',
      'PosMoney', 'ETCMoney1', 'ETCMoney2', 'ETCType1', 'ETCCode1', 'ETCType2',
      'ETCCode2'], [AClinFeeID, SumPrice, DiscountMoney, CashMoney, YBMoney,
      PosMoney, ETCMoney1, ETCMoney2, ETCType1, ETCCode1, ETCType2, ETCCode2]);
end;

function THisClinService.FeeReturn(const AClinFeeID: string;
  AReturnFeeMaster: TcdClinFeeMaster): string;
begin
  with AReturnFeeMaster do
    DACommand.Execute('Pro_Clin_Fee_Return', ['NewFeeID', 'OldFeeID',
      sFieldOpID, 'SumPrice', 'DiscountMoney', 'CashMoney', 'YBMoney',
      'PosMoney', 'ETCMoney1', 'ETCMoney2', 'ETCType1', 'ETCCode1', 'ETCType2',
      'ETCCode2', 'GetMoney', 'ChargeMoney'], ['', AClinFeeID, HisUser.ID,
      SumPrice, DiscountMoney, CashMoney, YBMoney, PosMoney, ETCMoney1,
      ETCMoney2, ETCType1, ETCCode1, ETCType2, ETCCode2, GetMoney,
      ChargeMoney]);

  Result := GetCommandOutputParam('NewFeeID');
end;

function THisClinService.FeeReturnApply(const AClinFeeID: string;
  AWholeReturn: Integer): string;
begin
  DACommand.Execute('Pro_Clin_Fee_ReturnApply', ['ClinFeeID', 'WholeReturn',
    sFieldOpID], [AClinFeeID, AWholeReturn, HisUser.ID]);
end;

procedure THisClinService.PrintFee(const AClinFeeID: string);
begin
  PrintReportFromServer('门诊普通发票.fr3', ['ClinFeeID'], [AClinFeeID], nil, False,
    BusinessPrinters.GetBusinessPrinter(sPrinterInvoice));
end;

procedure THisClinService.RecMasterLock(const AClinID, ARecipeIDList: string);
begin

  DACommand.Execute('Pro_Clin_RecMaster_Lock', [sFieldClinID, 'RecipeIDList'],
    [AClinID, ARecipeIDList]);
end;

procedure THisClinService.RecMasterUnLock(const AClinID, ARecipeIDList: string);
begin
  DACommand.Execute('Pro_Clin_RecMaster_UnLock', [sFieldClinID, 'RecipeIDList'],
    [AClinID, ARecipeIDList]);
end;

function THisClinService.RegBalance(AEndDate: TDateTime): Integer;
begin
  DACommand.Execute('Pro_Clin_Reg_Balance', [sFieldOpID, 'EndDate', 'Memo',
    'BalanceID'], [HisUser.ID, AEndDate, '', 0]);
  Result := GetCommandOutputParam('BalanceID');
  PrintRegBalance(Result);
end;

function THisClinService.Reg(ARegPrice, ADiagPrice, ACasePrice,
  ASumPrice: Currency; ARegTypeID, APatientID: Integer;
  const ADoctorID, AOfficeID: string): string;
begin
  DACommand.Execute('Pro_Clin_Reg_Add', [sFieldClinID, 'RegPrice', 'DiagPrice',
    'CasePrice', 'SumPrice', sFieldOpID, 'RegTypeID', 'DoctorID', 'OfficeID',
    'PatientID'], ['', ARegPrice, ADiagPrice, ACasePrice, ASumPrice, HisUser.ID,
    ARegTypeID, ADoctorID, AOfficeID, APatientID]);
  Result := GetCommandOutputParam(sFieldClinID);
end;

procedure THisClinService.RegReturn(const AClinID: string);
begin
  DACommand.Execute('Pro_Clin_Reg_Return', [sFieldClinID, sFieldOpID],
    [AClinID, HisUser.ID]);
end;

procedure THisClinService.ExecRecipe(RecipeID: Integer);
begin
  DACommand.Execute('Pro_Clin_RecMaster_Execute',
    ['RecipeID', 'OfficeID', sFieldOpID], [RecipeID, HisUser.OfficeID,
    HisUser.ID])
end;

procedure THisClinService.PrintRecipe(ARecipeID: Integer);
begin
  PrintReportFromServer('门诊处方单.fr3', ['RecipeID'], [ARecipeID]);
end;

procedure THisClinService.FeeTakeCheck(const AClinID, ARecipeIDList: string;
  AFeeMaster: TcdClinFeeMaster);
begin
  with AFeeMaster do
    DACommand.Execute('Pro_Clin_Fee_TakeCheck', [sFieldClinID, 'RecipeIDList',
      sFieldOpID, 'FeeTypeID', 'YBID', 'SumPrice', 'CashMoney', 'DiscountMoney',
      'YBMoney', 'PosMoney', 'ETCMoney1', 'ETCMoney2', 'GetMoney',
      'ChargeMoney', 'ETCType1', 'ETCCode1', 'ETCType2', 'ETCCode2'],
      [AClinID, ARecipeIDList, HisUser.ID, FeeTypeID, YBID, SumPrice, CashMoney,
      DiscountMoney, YBMoney, PosMoney, ETCMoney1, ETCMoney2, GetMoney,
      ChargeMoney, ETCType1, ETCCode1, ETCType2, ETCCode2]);
end;

function THisClinService.CalcReturnPrice(const AClinFeeID: string): Currency;
begin
  DACommand.Execute('Pro_Clin_Fee_CalcReturnPrice', ['ClinFeeID', 'SumPrice'],
    [AClinFeeID, 0]);

  Result := GetCommandOutputParam('SumPrice');
end;

procedure THisClinService.PrintReg(AClinID: string);
begin
  PrintReportFromServer('门诊挂号单.fr3', [sFieldClinID], [AClinID], nil, False,
    BusinessPrinters.GetBusinessPrinter(sPrinterClinReg));
end;

procedure THisClinService.PrintRegBalance(ABalanceID: Integer);
begin
  PrintReportFromServer('门诊挂号缴款单.fr3', ['BalanceID'], [ABalanceID], nil, True);
end;

procedure THisClinService.PrintFeeBalance(ABalanceID: Integer);
begin
  PrintReportFromServer('门诊收费缴款单.fr3', ['BalanceID'], [ABalanceID], nil, True);
end;

procedure THisClinService.FeeBalanceCheck(ABalanceID: Integer);
begin
  DACommand.Execute('Pro_Fee_Balance_Check', ['BalanceID', sFieldOpID],
    [ABalanceID, HisUser.ID]);
end;

procedure THisClinService.FeeBalanceCancel(ABalanceID: Integer);
begin
  DACommand.Execute('Pro_Fee_Balance_Cancel', ['BalanceID', sFieldOpID],
    [ABalanceID, HisUser.ID]);
end;

function THisClinService.CalcDiscount(const AClinID, ARecipeIDList,
  ACardNum: string; AFeeTypeID: Integer): Currency;
begin
  DACommand.Execute('Pro_Clin_Fee_CalcDiscount', [sFieldClinID, 'RecipeIDList',
    'CardNum', 'FeeTypeID', 'Discount'], [AClinID, ARecipeIDList, ACardNum,
    AFeeTypeID, 0]);

  Result := GetCommandOutputParam('Discount');
end;

function THisClinService.CalcReturnDiscount(const AClinFeeID: string): Currency;
begin
  DACommand.Execute('Pro_Clin_Fee_CalcReturnDiscount',
    ['ClinFeeID', 'DiscountMoney'], [AClinFeeID, 0]);

  Result := GetCommandOutputParam('DiscountMoney');
end;

function THisClinService.HookClinID(const AClinID: string;
  AQueryFlag: Integer): string;
begin
  DACommand.Execute('Pro_Clin_Hook_ClinID', [sFieldOfficeID, sFieldOpID,
    'QueryFlag', sFieldClinID], [HisUser.OfficeID, HisUser.ID, AQueryFlag,
    AClinID]);

  Result := GetCommandOutputParam(sFieldClinID);
end;

procedure THisClinService.WriteRecipeDrugCheck(RecipeID, CheckSign: Integer);
begin
  DACommand.Execute('Pro_Clin_RecMaster_DrugCheck', [sFieldOfficeID, sFieldOpID,
    sFieldRecipeID, 'CheckSign'], [HisUser.OfficeID, HisUser.ID, RecipeID,
    CheckSign]);
end;

{ TcdClinReg }

constructor TcdClinReg.Create(AOwner: TComponent);
begin
  inherited Create(AOwner, HisConnection, sDataServiceClin, sDataNameClinReg);
end;

function TcdClinReg.GetClinID: string;
begin
  Result := Table.FieldByName(sFieldClinID).AsString;
end;

function TcdClinReg.GetDiagPrice: Currency;
begin
  Result := Table.FieldByName('DiagPrice').AsCurrency;
end;

function TcdClinReg.GetInterfaceID: string;
begin
  Result := Table.FieldByName('InterfaceID').AsString;
end;

function TcdClinReg.GetPatientName: string;
begin
  Result := Table.FieldByName('PatientName').AsString;
end;

function TcdClinReg.GetRegOffice: string;
begin
  Result := Table.FieldByName('ClinOfficeID').AsString;
end;

function TcdClinReg.GetRegPrice: Currency;
begin
  Result := Table.FieldByName('RegPrice').AsCurrency;
end;

function TcdClinReg.GetRegTime: TDateTime;
begin
  Result := Table.FieldByName('RegDate').AsDateTime;
end;

function TcdClinReg.GetRegTypeID: Integer;
begin
  Result := Table.FieldByName('RegTypeID').AsInteger;
end;

function TcdClinReg.GetSystemCode: string;
begin
  Result := Table.FieldByName('SystemCode').AsString;
end;

function TcdClinReg.GetMemo: string;
begin
  Result := Table.FieldByName('Memo').AsString;
end;

procedure TcdClinReg.OpenByPeriod(ABeginDate, AEndDate: TDateTime);
begin
  inherited OpenByPeriod('RegDate', ABeginDate, AEndDate);
end;

procedure TcdClinReg.OpenByValidID(AClinID: string);
begin
  OpenByList([sFieldClinID, 'RegSign'], [AClinID, 0], [dboEqual, dboEqual],
    [dboAnd]);
end;

procedure TcdClinReg.OpenNotBalanced(AEndDate: TDateTime; AOpID: string);
begin
  OpenByList(['RegDate', 'BalanceID', sFieldOpID], [AEndDate, 0, AOpID],
    [dboLessOrEqual, dboEqual, dboEqual], [dboAnd, dboAnd]);
end;

procedure TcdClinReg.SetRegOffice(const Value: string);
begin
  Table.FieldByName('ClinOfficeID').AsString := Value;
end;

procedure TcdClinReg.SetRegPrice(const Value: Currency);
begin
  Table.FieldByName('RegPrice').AsCurrency := Value;
end;

procedure TcdClinReg.SetRegTypeID(const Value: Integer);
begin
  Table.FieldByName('RegTypeID').AsInteger := Value;
end;

procedure TcdClinReg.SetDiagPrice(const Value: Currency);
begin
  Table.FieldByName('DiagPrice').AsCurrency := Value;
end;

function TcdClinReg.GetDoctor: string;
begin
  Result := Table.FieldByName('ClinDoctorID').AsString
end;

procedure TcdClinReg.SetDoctor(const Value: string);
begin
  Table.FieldByName('ClinDoctorID').AsString := Value;
end;

function TcdClinReg.GetCasePrice: Currency;
begin
  Result := Table.FieldByName('CasePrice').AsCurrency;
end;

procedure TcdClinReg.SetCasePrice(const Value: Currency);
begin
  Table.FieldByName('CasePrice').AsCurrency := Value;
end;

function TcdClinReg.GetSumPrice: Currency;
begin
  Result := Table.FieldByName('SumPrice').AsCurrency;
end;

procedure TcdClinReg.SetSumPrice(const Value: Currency);
begin
  Table.FieldByName('SumPrice').AsCurrency := Value;
end;

function TcdClinReg.GetPID: Integer;
begin
  Result := Table.FieldByName('PID').AsInteger;
end;

procedure TcdClinReg.SetPID(const Value: Integer);
begin
  Table.FieldByName('PID').AsInteger := Value;
end;

procedure TcdClinReg.Open;
begin
  OpenByValidID('_');
end;

function TcdClinReg.GetRegSign: Integer;
begin
  Result := Table.FieldByName('RegSign').AsInteger;
end;

procedure TcdClinReg.SetClinID(const Value: string);
begin
  AsString[sFieldClinID] := Value;
end;

function TcdClinReg.GetICD10: string;
begin
  Result := AsString['ICD10'];
end;

function TcdClinReg.GetSickName: string;
begin
  Result := AsString['SickName'];
end;

procedure TcdClinReg.OpenByRecipeID(ARecipeID: string);
begin
  OpenByWhereText('ClinID=(select ClinID from Clin_RecMaster where ItemApplyID='
    + QuotedStr(ARecipeID) + ')');
end;

procedure TcdClinReg.OpenByBalanceID(ABalanceID: Integer);
begin
  OpenByFieldValue('BalanceID', ABalanceID);
end;

{ TcdRecMaster }

function TcdRecMaster.CanInsert: Boolean;
begin
  Result := (FClinID <> '') and inherited CanInsert;
end;

constructor TcdRecMaster.Create(AOwner: TComponent; const ADataName: string);
begin
  inherited Create(AOwner, HisConnection, sDataServiceClin, ADataName);
end;

procedure TcdRecMaster.DoDataBeforePost(Sender: TDADataTable);
begin
  with Sender do
  begin
    AsString[sFieldClinID] := FClinID;
    AsString['CountOpID'] := HisUser.ID;
  end;
  inherited;
end;

procedure TcdRecMaster.Open;
begin
  if ParamCount = 0 then
    OpenByList([sFieldClinID, 'RecSign'], [FClinID, 0],
      [dboEqual, dboEqual], [dboAnd])
  else
    OpenByParam([sFieldOfficeID, sFieldOpID, 'QueryFlag', sFieldClinID],
      [HisUser.OfficeID, HisUser.ID, FQueryFlag, FClinID]);
end;

function TcdRecMaster.GetExecOfficeID: string;
begin
  Result := Table.FieldByName('ExecOfficeID').AsString;
end;

function TcdRecMaster.GetRecTypeID: string;
begin
  Result := Table.FieldByName('RecTypeID').AsString;
end;

procedure TcdRecMaster.SetExecOfficeID(const Value: string);
begin
  Table.FieldByName('ExecOfficeID').AsString := Value;
end;

procedure TcdRecMaster.SetRecTypeID(const Value: string);
begin
  Table.FieldByName('RecTypeID').AsString := Value;
end;

procedure TcdRecMaster.SetClinID(const Value: string);
begin
  FClinID := Value;
  Refresh;
end;

function TcdRecMaster.CanEdit: Boolean;
begin
  Result := False;
end;

function TcdRecMaster.CanDelete: Boolean;
begin
  Result := (inherited CanDelete) and
    (SameText(CountOpID, HisUser.ID) or HisUser.IsAdmin);
end;

function TcdRecMaster.GetCountOpID: string;
begin
  Result := Table.FieldByName('CountOpID').AsString;
end;

function TcdRecMaster.GetIsMedicine: Boolean;
begin
  Result := (LeftStr(RecTypeID, 2) = sRecipeType_ClinMedX) or
    (LeftStr(RecTypeID, 2) = sRecipeType_ClinMedZ);
end;

function TcdRecMaster.GetRecType: string;
begin
  Result := Table.FieldByName('RecType').AsString;
end;

procedure TcdRecMaster.SetRecType(const Value: string);
begin
  Table.FieldByName('RecType').AsString := Value;
end;

function TcdRecMaster.GetDoctorID: string;
begin
  Result := FieldByName('DoctorID').AsString;
end;

function TcdRecMaster.GetOfficeID: string;
begin
  Result := FieldByName('OfficeID').AsString;
end;

procedure TcdRecMaster.SetDoctorID(const Value: string);
begin
  FieldByName('DoctorID').AsString := Value;
end;

procedure TcdRecMaster.SetOfficeID(const Value: string);
begin
  FieldByName('OfficeID').AsString := Value;
end;

function TcdRecMaster.GetRootRecTypeID: string;
begin
  Result := FieldByName('RootRecTypeID').AsString;
end;

procedure TcdRecMaster.SetRootRecTypeID(const Value: string);
begin
  FieldByName('RootRecTypeID').AsString := Value;
end;

function TcdRecMaster.GetDoctorName: string;
begin
  Result := FieldByName('DoctorName').AsString;
end;

function TcdRecMaster.GetOfficeName: string;
begin
  Result := FieldByName('OfficeName').AsString;
end;

procedure TcdRecMaster.SetDoctorName(const Value: string);
begin
  FieldByName('DoctorName').AsString := Value;
end;

procedure TcdRecMaster.SetOfficeName(const Value: string);
begin
  FieldByName('OfficeName').AsString := Value;
end;

function TcdRecMaster.GetCheckSign: Integer;
begin
  Result := AsInteger['CheckSign'];
end;

procedure TcdRecMaster.SetCheckSign(const Value: Integer);
begin
  EditWithNoLogChanges(['CheckSign'], [Value]);
end;

{ TcdRecDetail }

procedure TcdRecDetail.AdjustDayCount(NewDayCount: Integer);
begin

end;

procedure TcdRecDetail.AssignFieldValue(const AFieldName: string;
  ASource: TCustomData; var ADone: Boolean);
begin
  if SameText(AFieldName, 'Dosage') then
  begin
    AsFloat['Dosage'] := ASource.AsFloat['RatioValue'] * AsFloat['UnitDose'];
    ADone := True;
  end;
end;

function TcdRecDetail.CanDelete: Boolean;
begin
  Result := (inherited CanDelete) and (RecMaster <> nil) and
    RecMaster.CanDelete and (RecMaster.RecTypeID < sRecipeType_LIS)
end;

function TcdRecDetail.CanEdit: Boolean;
begin
  Result := (inherited CanEdit) and (RecMaster <> nil) and
    SameText(RecMaster.CountOpID, HisUser.ID) and
    (RecMaster.RecTypeID < sRecipeType_LIS)
end;

function TcdRecDetail.CanInsert: Boolean;
begin
  Result := (inherited CanInsert()) and (RecMaster <> nil) and
    SameText(RecMaster.CountOpID, HisUser.ID) and
    (RecMaster.RecTypeID < sRecipeType_LIS)
end;

constructor TcdRecDetail.Create(AOwner: TComponent; const ADataName: string);
begin
  inherited Create(AOwner, HisConnection, sDataServiceClin, ADataName);
  AutoSave := True;
end;

procedure TcdRecDetail.DoDataBeforePost(Sender: TDADataTable);
var
  OldCount, NewCount: Variant;
begin
  inherited;

  Check(RecipeID <= 0, '未绑定到处方主表');
  Check(AsString['FeeName'] = '', '请输入项目名称');
  Check(AsFloat['Quan'] <= 0, '请输入数量');

  OldCount := GetVarInteger(OldValue['DayCount']);
  if OldCount <= 0 then
    OldCount := 1;

  NewCount := GetVarInteger(AsVariant['DayCount']);
  if NewCount > 0 then
    AsFloat['Quan'] := AsFloat['Quan'] * NewCount / OldCount;
end;

function TcdRecDetail.GetDrugUse: string;
begin
  Result := Table.FieldByName('DrugUse').AsString;
end;

function TcdRecDetail.GetFrequency: string;
begin
  Result := Table.FieldByName('Frequency').AsString;
end;

function TcdRecDetail.GetGroupNum: Integer;
begin
  Result := Table.FieldByName('GroupNum').AsInteger
end;

function TcdRecDetail.GetRecipeID: Integer;
begin
  Result := Table.FieldByName(sFieldRecipeID).AsInteger;
end;

function TcdRecDetail.GetRecMaster: TcdRecMaster;
begin
  if (MasterData <> nil) and MasterData.InheritsFrom(TcdRecMaster) then
    Result := TcdRecMaster(MasterData)
  else
    Result := nil;
end;

procedure TcdRecDetail.Open;
var
  ID: Integer;
begin
  ID := StrToIntDef(VarToStr(MasterKey), -1);

  if ParamCount = 0 then
    OpenByFieldValue(sFieldRecipeID, ID)
  else
    OpenByParam([sFieldRecipeID], [ID]);
end;

procedure TcdRecDetail.QueryAfterMasterScroll;
begin
  Open;
end;

procedure TcdRecDetail.SetDrugUse(const Value: string);
begin
  Table.FieldByName('DrugUse').AsString := Value;
end;

procedure TcdRecDetail.SetFrequency(const Value: string);
begin
  Table.FieldByName('Frequency').AsString := Value;
end;

procedure TcdRecDetail.SetGroupNum(const Value: Integer);
begin
  Table.FieldByName('GroupNum').AsInteger := Value;
end;

{ TcdClinFeeMaster }

constructor TcdClinFeeMaster.Create(AOwner: TComponent;
  const ALogicalName: string);
begin
  inherited Create(AOwner, HisConnection, sDataServiceClin, ALogicalName);
end;

procedure TcdClinFeeMaster.DoFieldChange(Sender: TDACustomField);
begin
  CashMoney := SumPrice - DiscountMoney - YBMoney - PosMoney - ETCMoney1 -
    ETCMoney2;
  if FReturnFlag then
    ChargeMoney := CashMoney + GetMoney
  else
    ChargeMoney := GetMoney - CashMoney;
end;

function TcdClinFeeMaster.GetYBMoney: Currency;
begin
  Result := Table.FieldByName('YBMoney').AsCurrency;
end;

function TcdClinFeeMaster.GetSumPrice: Currency;
begin
  Result := Table.FieldByName('SumPrice').AsCurrency;
end;

function TcdClinFeeMaster.GetChargeMoney: Currency;
begin
  Result := Table.FieldByName('ChargeMoney').AsCurrency;
end;

function TcdClinFeeMaster.GetCashMoney: Currency;
begin
  Result := Table.FieldByName('CashMoney').AsCurrency;
end;

function TcdClinFeeMaster.GetFeeID: string;
begin
  if Table.EOF then
    Result := ''
  else
    Result := AsString['ClinFeeID'];
end;

function TcdClinFeeMaster.GetFeeSign: Integer;
begin
  if Table.EOF then
    Result := 0
  else
    Result := Table.FieldByName('FeeSign').AsInteger;
end;

function TcdClinFeeMaster.GetFeeTime: TDateTime;
begin
  Result := Table.FieldByName('FeeTime').AsDateTime;
end;

function TcdClinFeeMaster.GetFeeType: Integer;
begin
  Result := AsInteger['FeeTypeID'];
end;

function TcdClinFeeMaster.GetGetMoney: Currency;
begin
  Result := Table.FieldByName('GetMoney').AsCurrency;
end;

function TcdClinFeeMaster.GetInterfaceID: string;
begin
  Result := Table.FieldByName('InterfaceID').AsString;
end;

function TcdClinFeeMaster.GetOldFeeID: string;
begin
  if Table.EOF then
    Result := ' '
  else
    Result := AsString['OldClinFeeID'];
end;

function TcdClinFeeMaster.GetPatientName: string;
begin
  Result := Table.FieldByName('PatientName').AsString;
end;

function TcdClinFeeMaster.GetPosMoney: Currency;
begin
  Result := Table.FieldByName('PosMoney').AsCurrency;
end;

function TcdClinFeeMaster.GetSystemCode: string;
begin
  Result := Table.FieldByName('SystemCode').AsString;
end;

procedure TcdClinFeeMaster.InitTableAfterSchema(ATable: TDAMemDataTable);
begin
  inherited;
  FReturnFlag := StrToBoolDef(CustomAttributes.Values['ReturnFlag'], False);
  LogChanges := False;
  Table.FieldByName('SumPrice').OnChange := DoFieldChange;
  Table.FieldByName('YBMoney').OnChange := DoFieldChange;
  Table.FieldByName('PosMoney').OnChange := DoFieldPOSMoneyChange;
  Table.FieldByName('DiscountMoney').OnChange := DoFieldChange;
  Table.FieldByName('ETCMoney1').OnChange := DoFieldETCMoneyChange;
  Table.FieldByName('ETCMoney2').OnChange := DoFieldETCMoneyChange;
  Table.FieldByName('GetMoney').OnChange := DoFieldGetMoneyChange;
end;

procedure TcdClinFeeMaster.OpenByFeeID(AClinFeeID: string);
begin
  OpenByFieldValue('ClinFeeID', AClinFeeID);
end;

procedure TcdClinFeeMaster.OpenByPeriod(ABeginDate, AEndDate: TDateTime);
begin
  if HisUser.HaveAccess(sAccessClinStat) then
    OpenByList(['ClinFeeID', 'ClinFeeID'],
      [FormatDateTime('YYYYMMDD', ABeginDate), FormatDateTime('YYYYMMDD',
      AEndDate + 1)], [dboGreaterOrEqual, dboLessOrEqual], [dboAnd])
  else
    OpenByList(['ClinFeeID', 'ClinFeeID', 'OpID'],
      [FormatDateTime('YYYYMMDD', ABeginDate), FormatDateTime('YYYYMMDD',
      AEndDate + 1), HisUser.ID], [dboGreaterOrEqual, dboLessOrEqual, dboEqual],
      [dboAnd, dboAnd]);
end;

procedure TcdClinFeeMaster.OpenNotBalanced(AEndDate: TDateTime; AOpID: string);
begin
  OpenByList(['ClinFeeID', 'BalanceID', sFieldOpID],
    [FormatDateTime('YYYYMMDD', AEndDate + 1), 0, AOpID],
    [dboLessOrEqual, dboEqual, dboEqual], [dboAnd, dboAnd]);
end;

procedure TcdClinFeeMaster.SetYBMoney(const Value: Currency);
begin
  Table.FieldByName('YBMoney').AsCurrency := Value;
end;

procedure TcdClinFeeMaster.SetSumPrice(const Value: Currency);
begin
  Table.FieldByName('SumPrice').AsCurrency := Value;
end;

procedure TcdClinFeeMaster.SetCashMoney(const Value: Currency);
begin
  Table.FieldByName('CashMoney').AsCurrency := Value;
end;

procedure TcdClinFeeMaster.SetGetMoney(const Value: Currency);
begin
  Table.FieldByName('GetMoney').AsCurrency := Value;
end;

procedure TcdClinFeeMaster.SetPosMoney(const Value: Currency);
begin
  Table.FieldByName('PosMoney').AsCurrency := Value;
end;

function TcdClinFeeMaster.GetETCCode1: string;
begin
  Result := Table.FieldByName('ETCCode1').AsString
end;

function TcdClinFeeMaster.GetETCMoney1: Currency;
begin
  Result := Table.FieldByName('ETCMoney1').AsCurrency
end;

procedure TcdClinFeeMaster.SetChargeMoney(const Value: Currency);
begin
  AsCurrency['ChargeMoney'] := Value;
end;

function TcdClinFeeMaster.GetETCType1: string;
begin
  Result := AsString['ETCType1'];
end;

procedure TcdClinFeeMaster.SetETCCode1(const Value: string);
begin
  AsString['ETCCode1'] := Value;
end;

procedure TcdClinFeeMaster.SetETCMoney1(const Value: Currency);
begin
  AsCurrency['ETCMoney1'] := Value;
end;

procedure TcdClinFeeMaster.SetETCType1(const Value: string);
begin
  AsString['ETCType1'] := Value;
end;

function TcdClinFeeMaster.GetETCCode2: string;
begin
  Result := AsString['ETCCode2'];
end;

function TcdClinFeeMaster.GetETCMoney2: Currency;
begin
  Result := AsCurrency['ETCMoney2'];
end;

function TcdClinFeeMaster.GetETCType2: string;
begin
  Result := AsString['ETCType2'];
end;

procedure TcdClinFeeMaster.SetETCCode2(const Value: string);
begin
  AsString['ETCCode2'] := Value;
end;

procedure TcdClinFeeMaster.SetETCMoney2(const Value: Currency);
begin
  AsCurrency['ETCMoney2'] := Value;
end;

procedure TcdClinFeeMaster.SetETCType2(const Value: string);
begin
  AsString['ETCType2'] := Value;
end;

function TcdClinFeeMaster.GetFeeTypeID: Integer;
begin
  Result := AsInteger['FeeTypeID'];
end;

function TcdClinFeeMaster.GetYBID: Integer;
begin
  Result := AsInteger['YBID'];
end;

procedure TcdClinFeeMaster.SetFeeTypeID(const Value: Integer);
begin
  AsInteger['FeeTypeID'] := Value;
end;

procedure TcdClinFeeMaster.SetYBID(const Value: Integer);
begin
  AsInteger['YBID'] := Value;
end;

function TcdClinFeeMaster.GetReturnSign: Integer;
begin
  Result := AsInteger['ReturnSign'];
end;

function TcdClinFeeMaster.GetDiscount: Currency;
begin
  Result := AsCurrency['DiscountMoney'];
end;

procedure TcdClinFeeMaster.SetDiscount(const Value: Currency);
begin
  AsCurrency['DiscountMoney'] := Value;
end;

procedure TcdClinFeeMaster.OpenByBalanceID(ABalanceID: Integer);
begin
  OpenByFieldValue('BalanceID', ABalanceID);
end;

procedure TcdClinFeeMaster.OpenByYBID(AYBID: Integer);
begin
  OpenByFieldValue('YBID', AYBID);
end;

procedure TcdClinFeeMaster.DoFieldETCMoneyChange(Sender: TDACustomField);
begin
  DoFieldChange(Sender);
  if Assigned(OnETCMoneyChange) then
    OnETCMoneyChange(Sender);
end;

procedure TcdClinFeeMaster.DoFieldGetMoneyChange(Sender: TDACustomField);
begin
  DoFieldChange(Sender);
  if Assigned(OnGetMoneyChange) then
    OnGetMoneyChange(Sender);
end;

procedure TcdClinFeeMaster.DoFieldPOSMoneyChange(Sender: TDACustomField);
begin
  DoFieldChange(Sender);
  if Assigned(OnPOSMoneyChange) then
    OnPOSMoneyChange(Sender);
end;

{ TcdClinFeeDetail }

constructor TcdClinFeeDetail.Create(AOwner: TComponent);
begin
  inherited Create(AOwner, HisConnection, sDataServiceClin,
    sDataNameClinFeeDetail);
end;

procedure TcdClinFeeDetail.OpenByFeeID(AClinFeeID: string);
begin
  OpenByFieldValue('ClinFeeID', AClinFeeID);
end;

procedure TcdClinFeeDetail.OpenByPeriod(ABeginDate, AEndDate: TDateTime);
begin
  if HisUser.HaveAccess(sAccessClinStat) then
    OpenByBetween('ClinFeeID', FormatDateTime('YYYYMMDD', ABeginDate),
      FormatDateTime('YYYYMMDD', AEndDate + 1))
  else if HisUser.IsClinOffice then
    OpenByList(['ClinFeeID', 'ClinFeeID', 'OfficeID'],
      [FormatDateTime('YYYYMMDD', ABeginDate), FormatDateTime('YYYYMMDD',
      AEndDate + 1), HisUser.OfficeID], [dboGreaterOrEqual, dboLessOrEqual,
      dboEqual], [dboAnd])
  else if HisUser.IsTechOffice then
    OpenByList(['ClinFeeID', 'ClinFeeID', 'ExecOfficeID'],
      [FormatDateTime('YYYYMMDD', ABeginDate), FormatDateTime('YYYYMMDD',
      AEndDate + 1), HisUser.OfficeID], [dboGreaterOrEqual, dboLessOrEqual,
      dboEqual], [dboAnd])
  else
    OpenByList(['ClinFeeID', 'ClinFeeID', 'CountOpID'],
      [FormatDateTime('YYYYMMDD', ABeginDate), FormatDateTime('YYYYMMDD',
      AEndDate + 1), HisUser.OfficeID], [dboGreaterOrEqual, dboLessOrEqual,
      dboEqual], [dboAnd])
end;

{ TcdClinPatient }

constructor TcdClinPatient.Create(AOwner: TComponent);
begin
  inherited Create(AOwner, HisConnection, sDataServiceClin,
    sDataNameClinPatient);
end;

procedure TcdClinPatient.DoDataAfterInsert(Sender: TDADataTable);
begin
  inherited;
  Sender.FieldByName('ICCode').AsString := ClinicCard.GetRandomCode;
  Sender.FieldByName('Birthday').AsDateTime := Date;
end;

procedure TcdClinPatient.DoDataBeforePost(Sender: TDADataTable);
begin
  inherited;
  Check(Trim(AsString['PatientName']) = '', '请输入姓名');
end;

function TcdClinPatient.GetICCode: string;
begin
  Result := Table.FieldByName('ICCode').AsString;
end;

function TcdClinPatient.GetPID: Integer;
begin
  Result := Table.FieldByName('PID').AsInteger;
end;

procedure TcdClinPatient.OpenByID(AID: Integer);
begin
  OpenByFieldValue('PID', AID);
end;

{ THisICCard }

procedure THisICCard.CheckCard;
begin
  with RFReader do
  begin
    Authentication_Key_Hex(FCardAuthMode, FCardIDBlockNumber, FCardNormalPwd);
    Authentication_Key_Hex(FCardAuthMode, FCardCodeBlockNumber, FCardNormalPwd);
  end;
end;

function THisICCard.ClearCard: Integer;
begin
  try
    Result := ReadCard;
    with RFReader do
    begin
      Authentication_Key_Hex(FCardAuthMode, FCardIDBlockNumber, FCardIDPwd);
      Write(FCardIDBlockNumber, '0000000000000000');
      Write_Hex(3, FCardNormalPwd + FControlBits + FCardNormalPwd);

      Authentication_Key(FCardAuthMode, FCardCodeBlockNumber,
        RightStr(FData.ICCode, 6));
      Write_Hex(FCardCodeBlockNumber, FCardNormalPwd + FControlBits +
        FCardNormalPwd);

      FData.Edit;
      FData.Table.FieldByName('StopSign').AsInteger := 1;
      FData.Save;
    end;
  finally
    FData.Close;
  end;
end;

constructor THisICCard.Create;
begin
  FControlBits := 'FF078069';
  FCardNormalPwd := 'FFFFFFFFFFFF';
  FCardAuthMode := 4;
  FCardIDPwd := 'A7269DBE415F';
  FCardIDBlockNumber := 1;
  FCardCodeBlockNumber := 7;
end;

destructor THisICCard.Destroy;
begin
  FreeAndNil(FData);
  inherited;
end;

function THisICCard.GetPatient: TcdClinPatient;
begin
  if FData = nil then
    FData := TcdClinPatient.Create(nil);
  Result := FData;
end;

function THisICCard.GetRandomCode: string;
var
  I: Integer;
begin
  Randomize;
  SetLength(Result, 6);
  for I := 1 to Length(Result) do
    Result[I] := Chr(Random(Ord('z') - Ord('!')) + Ord('!'));
end;

function THisICCard.ReadCard: Integer;
begin
  with RFReader do
  begin
    Authentication_Key_Hex(FCardAuthMode, FCardIDBlockNumber, FCardIDPwd);
    Result := StrToInt(Read(FCardIDBlockNumber));

    try
      FData.OpenByID(Result);
      Check(FData.Table.RecordCount = 0, '查无此卡!');
      Check(FData.Table.FieldByName('StopSign').AsInteger <> 0, '此卡已停用');

      Authentication_Key(FCardAuthMode, FCardCodeBlockNumber,
        LeftStr(FData.ICCode, 6));
    except
      FData.Close;
      raise;
    end;
  end;
end;

procedure THisICCard.WriteCard(AID: Integer; ACode: string);
begin
  with RFReader do
  begin
    Authentication_Key_Hex(FCardAuthMode, FCardIDBlockNumber, FCardNormalPwd);
    Write(FCardIDBlockNumber, RightStr('0000000000000000' + IntToStr(AID), 16));
    // 修改密码
    Authentication_Key_Hex(FCardAuthMode, 3, FCardNormalPwd);
    Write_Hex(3, FCardIDPwd + FControlBits + FCardIDPwd);

    ACode := StringToHex(ACode);
    Authentication_Key_Hex(FCardAuthMode, FCardCodeBlockNumber, FCardNormalPwd);
    Write_Hex(FCardCodeBlockNumber, RightStr(ACode, 12) + FControlBits +
      RightStr(ACode, 12));
  end;
end;

{ TcdClinRegPatient }

function TcdClinRegPatient.CanDelete: Boolean;
begin
  Result := False;
end;

function TcdClinRegPatient.CanEdit: Boolean;
begin
  Result := inherited CanEdit()
  // and SameText(OfficeID, HisUser.OfficeID)
    and (HisUser.IsDoctor or HisUser.IsAdmin or
    HisUser.HaveAccess(sAccessClinDoctor))
  // and ((DoctorID = '') or (DoctorID = HisUser.ID))
    and (AsInteger['CanEdit'] = 1);
end;

function TcdClinRegPatient.CanInsert: Boolean;
begin
  Result := False;
end;

constructor TcdClinRegPatient.Create(AOwner: TComponent);
begin
  inherited Create(AOwner, HisConnection, sDataServiceClin,
    sDataNameClinCenter);
end;

procedure TcdClinRegPatient.DoDataBeforePost(Sender: TDADataTable);
begin
  inherited;
  if FieldByName('SickName').Value <> FieldByName('SickName').OldValue then
    AsString['ClinDoctorID'] := HisUser.ID;
end;

function TcdClinRegPatient.GetClinID: string;
begin
  Result := Table.FieldByName(sFieldClinID).AsString;
end;

function TcdClinRegPatient.GetDoctorID: string;
begin
  Result := Table.FieldByName('ClinDoctorID').AsString;
end;

function TcdClinRegPatient.GetInterfaceID: string;
begin
  Result := Table.FieldByName('InterfaceID').AsString;
end;

function TcdClinRegPatient.GetMemo: string;
begin
  Result := Table.FieldByName('Memo').AsString;
end;

function TcdClinRegPatient.GetOfficeID: string;
begin
  Result := Table.FieldByName('ClinOfficeID').AsString;
end;

function TcdClinRegPatient.GetPatientName: string;
begin
  Result := Table.FieldByName('PatientName').AsString;
end;

function TcdClinRegPatient.GetPID: Integer;
begin
  Result := Table.FieldByName('PID').AsInteger;
end;

function TcdClinRegPatient.GetRegSign: Integer;
begin
  Result := Table.FieldByName('RegSign').AsInteger;
end;

function TcdClinRegPatient.GetRegTime: TDateTime;
begin
  Result := Table.FieldByName('RegTime').AsDateTime;
end;

function TcdClinRegPatient.GetRegTypeID: Integer;
begin
  Result := Table.FieldByName('RegType').AsInteger;
end;

function TcdClinRegPatient.GetSumPrice: Currency;
begin
  Result := Table.FieldByName('SumPrice').AsCurrency;
end;

function TcdClinRegPatient.GetSystemCode: string;
begin
  Result := Table.FieldByName('SystemCode').AsString;
end;

procedure TcdClinRegPatient.OpenByNum(ANum: string);
begin
  OpenRegPatient('', ANum, 0);
end;

procedure TcdClinRegPatient.OpenByOfficeID(AOfficeID: string);
begin
  OpenRegPatient(AOfficeID, '', 0);
end;

procedure TcdClinRegPatient.OpenHistory(AClinID: string);
begin
  OpenRegPatient('', AClinID, 1);
end;

procedure TcdClinRegPatient.OpenRegPatient(AOfficeID, ANum: string;
  AQueryFlag: Integer);
begin
  OpenByParam(['OfficeID', 'Num', 'QueryFlag'], [AOfficeID, ANum, AQueryFlag]);
end;

function PatientDialog(): THisPatientDialog;
begin
  if FPatientDialog = nil then
    FPatientDialog := THisPatientDialog.Create(Application);
  Result := FPatientDialog;
end;

procedure IDCard2Patient(AID: TIdentity; APatient: TDADataTable);
begin
  with APatient do
  begin
    FieldByName('PatientName').AsString := AID.Name;
    FieldByName('Sex').AsString := AID.Sex;
    FieldByName('Birthday').AsDateTime := AID.Birthday;
    FieldByName('Nation').Value := AID.Nation;
    FieldByName('IDCode').AsString := AID.ID;
    FieldByName('Address').AsString := AID.Address;
  end;
end;

function CreateICCard(Sender: TBaseOperation; CommandID: Integer;
  const Param: array of Variant): Variant;
begin
  Result := PatientDialog.Execute;
end;

function ClearICCard(Sender: TBaseOperation; CommandID: Integer;
  const Param: array of Variant): Variant;
begin
  if ShowYesNo('把IC放在读卡器上，点确定退卡') then
  begin
    Result := ClinicCard.ClearCard;
    ShowOK('退卡成功');
  end;
end;

procedure DefineClinicCommonData(ADataContainer: TDataContainer);
begin
  with ADataContainer do
  begin
    RegisterData(HisConnection, sDataServiceClin, sDataNameClinRegType,
      TcdClinicRegType, 0, '');
    RegisterData(HisConnection, sDataServiceClin, sDataNameClinRegDict,
      TCustomData, 0, '');
  end;
end;

procedure OrganizeClinicOperations();
begin
  with TProcOperation.Create(sOperationIDClinICCard) do
  begin
    Category := sOperationCategoryClinic;
    Caption := '登记办卡';
    ImageName := 'card';
    // Access := sAccessOutICCard;
    Order := 'M001';
    OnExecute := CreateICCard;
    Visible := False;
  end;

  with TProcOperation.Create(sOperationIDClinClearCard) do
  begin
    Category := sOperationCategoryClinic;
    Caption := '退卡';
    ImageName := 'return';
    // Access := sAccessOutICCard;
    Order := 'M002';
    OnExecute := ClearICCard;
    Visible := False;
  end;

  // with TViewOperation.Create(sOperationIDClinReg) do
  // begin
  // Category := sOperationCategoryClinic;
  // Caption := '门诊挂号';
  // ImageName := 'star';
  // Access := sAccessClinReg;
  // Order := 'M01';
  // ViewClass := TClinRegView;
  // end;

  with TViewOperation.Create(sOperationIDClinReg2) do
  begin
    Category := sOperationCategoryClinic;
    Caption := '门诊挂号';
    ImageName := 'star';
    Access := sAccessClinReg;
    Order := 'M01';
    ViewClass := TClinRegView2;
  end;

  with TViewOperation.Create(sOperationIDClinCenter) do
  begin
    Category := sOperationCategoryClinic;
    Caption := '门诊患者';
    ImageName := 'clin';
    Access := sAccessClinPatient;
    Order := 'M02';
    // ShortKey := ShortCut(VK_F4, []);
    ViewClass := TClinCenterView;
  end;

  with TViewOperation.Create(sOperationIDClinRecipe) do
  begin
    Category := sOperationCategoryClinic;
    Caption := '门诊医生';
    ImageName := 'doctor';
    Access := sAccessClinDoctor;
    Order := 'M021';
    Visible := False;
    ViewClass := TClinDoctorStation;
    Flag := iOperationFlag_ClinPatient or iOperationFlag_NoMenu or
      iOperationFlag_NoTree;
  end;

  with TViewOperation.Create(sOperationIDClinFee) do
  begin
    Category := sOperationCategoryClinic;
    Caption := '门诊收费';
    ImageName := 'yen';
    Access := sAccessClinFee;
    Order := 'M022';
    ViewClass := TClinCashierView;
    Flag := iOperationFlag_ClinPatient;
    // or iOperationFlag_NoMenu or iOperationFlag_NoTree;
  end;

  with TViewOperation.Create(sOperationIDClinRecipeExec) do
  begin
    Category := sOperationCategoryClinic;
    Caption := '执行处方';
    Access := sAccessClinExec;
    ImageName := sOperationIDClinRecipeExec;
    Order := 'M023';
    ViewClass := TClinRecExecView;
  end;

  with TViewOperation.Create(sOperationIDClinRegQuery) do
  begin
    Category := sOperationCategoryClinic;
    Caption := '挂号查询';
    ImageName := 'reg_query';
    Access := sAccessClinQuery;
    Order := 'M030';
    ViewClass := TClinRegQueryView;
  end;

  with TViewOperation.Create(sOperationIDClinFeeQuery) do
  begin
    Category := sOperationCategoryClinic;
    Caption := '门诊收费查询';
    ImageName := sOperationIDClinFeeQuery;
    Access := sAccessClinQuery;
    Order := 'M031';
    ViewClass := TClinFeeQueryView;
  end;

  with TViewOperation.Create(sOperationIDClinFeeDetailQry) do
  begin
    Category := sOperationCategoryClinic;
    Caption := '门诊项目明细查询';
    ImageName := sOperationIDClinFeeDetailQry;
    Access := sAccessClinQuery;
    Order := 'M032';
    ViewClass := TClinFeeDetailQueryView;
  end;

  with TViewOperation.Create(sOperationIDClinFeeReturn) do
  begin
    Category := sOperationCategoryClinic;
    Caption := '门诊退费';
    ImageName := sOperationIDClinFeeReturn;
    Access := sAccessClinQuery;
    Order := 'M025';
    ViewClass := TClinFeeReturnView;
  end;

  with TViewOperation.Create(sOperationIDClinRegBalance) do
  begin
    Category := sOperationCategoryClinFee;
    Caption := '挂号缴款';
    ImageName := 'balance';
    Access := sAccessClinReg;
    Order := 'Q01';
    ViewClass := TClinRegBalanceView;
  end;

  with TViewOperation.Create(sOperationIDClinFeeBalance) do
  begin
    Category := sOperationCategoryClinFee;
    Caption := '门诊收费缴款';
    ImageName := 'fee_query';
    Access := sAccessClinFee;
    Order := 'Q02';
    ViewClass := TClinFeeBalanceView;
  end;

  with TViewOperation.Create(sOperationIDFeeBalanceCheck) do
  begin
    Category := sOperationCategoryFee;
    Caption := '结算审核';
    ImageName := sOperationIDFeeBalanceCheck;
    Access := sAccessFeeBalance;
    Order := 'Q10';
    ViewClass := TFeeBalanceCheckView;
  end;

end;

{ TClinRegView }

procedure TClinRegView.BuildViewLayout;
var
  Temp: TdxLayoutGroup;
begin
  inherited;

  FPatientMemo := TcxMemo.Create(Self);
  FPatientMemo.Properties.ReadOnly := True;

  FOfficeData := TCustomData.Create(Self, HisConnection, sDataServiceSystem,
    sDataNameSysClinOffice);
  FOfficeData.Open;

  FRegTypeData := TcdClinicRegType.Create(Self);
  FRegTypeData.FieldCustomAttributes['RegType'].Add('Options.Editing=False');
  FRegTypeData.OpenByList(['StopSign'], [0], [dboEqual], []);

  FRegData := TcdClinReg.Create(Self);
  FRegData.LogChanges := False;
  FRegData.OpenByKeyValue('00');
  FRegData.Insert;

  BuildAction('读IC卡', 'card', '', nil, DoActionReadCard, ShortCut(VK_F6, []),
    BTN_SHOWCAPTION);
  BuildAction('退卡', 'return', '', nil, DoActionReturnCard, ShortCut(VK_F7, []),
    BTN_SHOWCAPTION);
  BuildAction('办卡登记', 'book', '', nil, DoActionCreateCard, ShortCut(VK_F8, []),
    BTN_SHOWCAPTION);
  BuildAction('退号', 'sign out', '', nil, DoActionUnRegister, 0,
    BTN_SHOWCAPTION);
  BuildAction('挂号', 'sign in', '', nil, DoActionRegister, ShortCut(VK_F9, []),
    BTN_SHOWCAPTION);

  FOfficeView := TTableGridDataView.Create(Self);
  with FOfficeView do
  begin
    BorderStyle := bsNone;
    IsEmbedded := True;
    ViewGroup.Caption := '挂号科室';
    ViewGroup.ShowBorder := True;
    FilterEditItem.Visible := True;
    Width := 300;
    ViewData := FOfficeData;
  end;

  FRegTypeView := TTableGridDataView.Create(Self);
  with FRegTypeView do
  begin
    BorderStyle := bsNone;
    IsEmbedded := True;
    ViewGroup.Caption := '号别';
    ViewGroup.ShowBorder := True;
    Width := 200;
    ViewData := FRegTypeData;
  end;

  with ViewLayout.Items do
  begin
    LayoutDirection := ldHorizontal;

    with CreateItemForControl(FOfficeView) do
    begin
      CaptionOptions.Visible := False;
      AlignVert := avClient;
    end;

    CreateItem(TdxLayoutSplitterItem);

    with CreateItemForControl(FRegTypeView) do
    begin
      CaptionOptions.Visible := False;
      AlignVert := avClient;
    end;

    CreateItem(TdxLayoutSplitterItem);

    with CreateGroup() do
    begin
      ShowBorder := False;
      FPatientGroup := CreateGroup();
      with FPatientGroup do
      begin
        // ShowBorder := False;
        // ClinicCard.Patient.Table.CustomAttributes.Values['DefaultBeginsLayer'] := 'True';
        // DevExpress.BuildFormView(FPatientGroup, ClinicCard.Patient.Source);
        Caption := '患者信息';
        CreateItemForControl(FPatientMemo);
      end;
      Temp := CreateGroup();
      Temp.LayoutDirection := ldHorizontal;
      Temp.ShowBorder := False;
      BuildLayoutToolBar(Temp, [TAction(ViewActions[0]),
        TAction(ViewActions[1]), TAction(ViewActions[2])]);

      FRegGroup := CreateGroup();
      with FRegGroup do
      begin
        Caption := '挂号收费';
        DevExpress.BuildFormView(FRegGroup, FRegData);
      end;
      Temp := CreateGroup();
      Temp.LayoutDirection := ldHorizontal;
      Temp.ShowBorder := False;
      BuildLayoutToolBar(Temp, [TAction(ViewActions[3]),
        TAction(ViewActions[4])]);
    end;
  end;

  FOfficeView.Width := AppCore.IniFile.ReadInteger(ClassName,
    'OfficeWidth', 400);
  FRegTypeView.Width := AppCore.IniFile.ReadInteger(ClassName,
    'RegTypeWidth', 200);

  FRegTypeData.OnScroll := DoRegTypeScroll;
  FRegTypeData.EnableScroll;
end;

destructor TClinRegView.Destroy;
begin
  AppCore.IniFile.WriteInteger(ClassName, 'OfficeWidth', FOfficeView.Width);
  AppCore.IniFile.WriteInteger(ClassName, 'RegTypeWidth', FRegTypeView.Width);
  inherited;
end;

procedure TClinRegView.DoActionCreateCard(Sender: TObject);
begin
  if AppCore.Operations.SearchOperation(sOperationIDClinICCard).Execute(0, [])
  then
  begin
    ClinicCard.Patient.OpenByID(PatientDialog.Patient.PID);
    RefreshPatientMemo;
  end;
end;

procedure TClinRegView.DoActionReadCard(Sender: TObject);
begin
  ClinicCard.ReadCard;

end;

procedure TClinRegView.DoActionRegister(Sender: TObject);
begin
  ViewLayout.SetFocus;

  with FRegData do
  begin
    Check(not ClinicCard.Patient.Table.Active, '请先办卡登记或读取IC卡信息');

    ClinID := ClinicService.Reg(RegPrice, DiagPrice, CasePrice, SumPrice,
      FRegTypeData.RegTypeID, ClinicCard.Patient.PID, DoctorID,
      FOfficeData.AsString['OfficeID']);

    ClinicService.PrintReg(ClinID);

    AppCore.Logger.Write('门诊挂号成功|门诊号=' + ClinID, mtInfo, 1);

    PID := 0;
    CasePrice := 0;
    ClinicCard.Patient.Close;

    RefreshPatientMemo;
  end;
end;

procedure TClinRegView.DoActionReturnCard(Sender: TObject);
begin
  AppCore.Operations.SearchOperation(sOperationIDClinClearCard).Execute(0, []);
end;

procedure TClinRegView.DoActionUnRegister(Sender: TObject);
var
  ClinID: string;
begin
  if InputClinID('门诊退号', ClinID) then
  begin
    ClinicService.RegReturn(ClinID);
    ShowOK('退号成功');
  end;
end;

procedure TClinRegView.DoRegTypeScroll(Sender: TObject);
begin
  if not FRegTypeData.EOF then
  begin
    with FRegData do
    begin
      RegPrice := FRegTypeData.RegPrice;
      DiagPrice := FRegTypeData.DiagPrice;
      SumPrice := CasePrice + RegPrice + DiagPrice;
    end;
  end;
end;

procedure TClinRegView.RefreshPatientMemo;
begin
  with ClinicCard.Patient do
    FPatientMemo.Text :=
      GetRecordText(CustomAttributes.Values['PatientInfoFields'], #13#10);
end;

{ TClinRegQueryView }

function TClinRegQueryView.CanPrint: Boolean;
begin
  // Result := inherited CanPrint() and
  // (SameText(FRegData.AsString[sFieldOpID], HisUser.ID) or HisUser.IsAdmin);
  Result := True;
end;

constructor TClinRegQueryView.Create(AOwner: TComponent);
begin
  inherited;
  FRegData := TcdClinReg.Create(Self);
  PeriodGroup.Visible := True;
  DataQuery;
  SetData(FRegData);
end;

procedure TClinRegQueryView.DataQuery;
begin
  FRegData.OpenByPeriod(BeginDate, EndDate + 1);
end;

function TClinRegQueryView.DoExecute(CommandID: Integer;
  const Param: array of Variant): Variant;
begin
  if CommandID = iOperationCommand_BalanceID then
  begin
    FRegData.OpenByBalanceID(Param[0]);
  end;

  AppCore.MainView.ShowView(Self);
end;

{ TClinRegBalanceView }

procedure TClinRegBalanceView.DataQuery;
begin
  TcdClinReg(ViewData).OpenNotBalanced(EndDate + 1, HisUser.ID);
end;

procedure TClinRegBalanceView.DoBalanceAction(Sender: TObject);
begin
  if ShowYesNo(sBalanceConfirm) then
    try
      ClinicService.RegBalance(EndDate + 1);
      AppCore.Logger.Write('门诊挂号结算成功|' + HisUser.Name, mtInfo, 1);
    finally
      DataQuery;
    end;
end;

procedure TClinRegBalanceView.DoBalanceActionUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := ViewData.Table.Active and
    (ViewData.Table.RecordCount > 0);
end;

procedure TClinRegBalanceView.BuildViewLayout;
begin
  inherited;
  PeriodGroup.Visible := True;
  BeginDateItem.Visible := False;
  Printing := False;
  ViewData := TcdClinReg.Create(Self);
end;

procedure TClinRegBalanceView.BuildViewAction;
begin
  inherited;
  BuildAction('确定结算', 'verify', '', DoBalanceActionUpdate, DoBalanceAction, 0,
    BTN_SHOWCAPTION);
end;

{ TClinCashierView }

procedure TClinCashierView.DoActionFeeTake(Sender: TObject);
var
  Result: Boolean;
begin
  if SelectRecipe then
  begin
    ClinicService.RecMasterLock(RegData.ClinID, RecipeIDList);
    try
      Result := FeeTakeView.Execute(Self, iClinFeeType_Norm, 0, nil);
    finally
      if not Result then
        ClinicService.RecMasterUnLock(RegData.ClinID, RecipeIDList);
    end;
    if Result then
      DoClear();
  end;
end;

procedure TClinCashierView.DoActionFeeTakeUpdate(Sender: TObject);
begin
  // TAction(Sender).Enabled := (MasterView.ViewData.RecordCount > 0) and
  // (DetailView.ViewData.RecordCount > 0)
end;

procedure TClinCashierView.BuildViewLayout;
begin
  inherited;

  FFeeAction := BuildAction('普通收费', 'yen', '', DoActionFeeTakeUpdate,
    DoActionFeeTake, ShortCut(VK_F11, []), BTN_SHOWCAPTION);

  ClinFeePluginManager.BuildPluginAction(Self);

  BuildLayoutToolBar(MasterView.ToolBarGroup, ViewActions);

  FClinIDEdit := TcxMaskEdit.Create(Self);
  SerialIDWrapper.Wrap(FClinIDEdit).OnSerialID := DoClinIDEvent;

  with MasterView.ToolBarGroup.CreateItemForControl(FClinIDEdit) do
  begin
    Caption := '门诊号';
    AlignVert := avCenter;
  end;

  MasterView.RecMasterData.QueryFlag := 3;

  if ClinicService.VoiceClinFee <> nil then
    ClinicService.VoiceClinFee.ClinFeeOpen();
end;

function TClinCashierView.GetFeeTakeView: TClinFeeTakeDialog;
begin
  if FFeeTakeDialog = nil then
  begin
    FFeeTakeDialog := TClinFeeTakeDialog.Create(Self);
  end;
  Result := FFeeTakeDialog;
end;

function TClinCashierView.SelectRecipe: Boolean;
begin
  if FRecSelectDialog = nil then
  begin
    FRecSelectDialog := TClinRecSelectDialog.Create(Self);
    FRecSelectDialog.Height := 480;
    FRecSelectDialog.Width := 600;
  end;
  // 选择收费处方
  MasterView.ExtractNameAndKeyValue('RecType,SumPrice', 'RecipeID',
    FRecSelectDialog.CheckStrings);
  Result := FRecSelectDialog.Execute(FRegData.ClinID);
  FRecipeIDList := FRecSelectDialog.GetCheckedValue();
end;

procedure TClinCashierView.DoClinIDEvent(Sender: TObject);
begin
  FClinIDEdit.Text := ClinicService.HookClinID(FClinIDEdit.Text, 3);
  TakeClinID(FClinIDEdit.Text);
end;

procedure TClinCashierView.DoClear;
begin
  TakeClinID('');
  FClinIDEdit.Text := '';
  FClinIDEdit.SetFocus;
end;

function TClinCashierView.GetPluginFlag: Integer;
begin
  Result := iOperationFlag_ClinFee;
end;

function TClinCashierView.GetPluginLayoutGroup(AOperation: TBaseOperation)
  : TComponent;
begin
  Result := MasterView.ToolBarGroup;
end;

procedure TClinCashierView.TakeClinID(const AClinID: string);
begin
  inherited;

  if ClinicService.VoiceClinFee <> nil then
    ClinicService.VoiceClinFee.ClinFeeBegin(FRegData);
end;

{ TClinFeeTakeDialog }

procedure TClinFeeTakeDialog.BuildDialog;
begin
  inherited;
  ImageName := 'misc\ClinFee.png';
  Caption := '门诊收费';
  FClinFeeExtendOperation := AppCore.Operations.SearchOperation
    ('pas_clin_fee_extend');
  if FClinFeeExtendOperation <> nil then
    BuildAction(FClinFeeExtendOperation.Caption, 'clin_fee_extend', '', nil,
      DoFeeExtend, 0, BTN_SHOWCAPTION);

  FFeeMasterData := TcdClinFeeMaster.Create(Self);
  FFeeMasterData.Table.MaxRecords := 0;
  FFeeMasterData.LogChanges := False;
  FFeeMasterData.Open;
  // FFeeMasterData.FieldByName('ETCType1').OnChange := DoFieldETCType1Change;
  // FFeeMasterData.FieldByName('ETCCode1').OnChange := DoFieldETCCode1Change;
  // FFeeMasterData.FieldByName('ETCType2').OnChange := DoFieldETCType2Change;
  // FFeeMasterData.FieldByName('ETCCode2').OnChange := DoFieldETCCode2Change;
  FFeeMasterData.OnPOSMoneyChange := DoFieldPOSMoneyChange;
  FFeeMasterData.OnETCMoneyChange := DoFieldETCMoneyChange;
  FFeeMasterData.OnGetMoneyChange := DoFieldGetMoneyChange;

  DialogGroup.Caption := '收费信息';
  DialogGroup.ShowBorder := True;

  BuildLayoutToolBar(BottomGroup, Actions);
  DevExpress.BuildFormView(DialogGroup, FFeeMasterData);
end;

procedure TClinFeeTakeDialog.DoFeeNormal;
begin
  FClinFeeID := ClinicService.FeeTake(FCashierView.RegData.ClinID,
    FCashierView.RecipeIDList, FFeeMasterData);
end;

procedure TClinFeeTakeDialog.DoDialogOK(Sender: TObject);
begin
  TakeFee;
end;

function TClinFeeTakeDialog.Execute(ACashierView: TClinCashierView;
  AFeeTypeID: Integer; YBMoney: Currency; AOnTakeFee: TNotifyEvent): Boolean;
begin
  FCashierView := ACashierView;
  FFeeMasterData.Insert;
  FFeeMasterData.FeeTypeID := AFeeTypeID;
  FFeeMasterData.YBMoney := YBMoney;
  FOnTakeFee := AOnTakeFee;
  try
    FFeeMasterData.SumPrice := ClinicService.CalcRecipePrice
      (FCashierView.RegData.ClinID, FCashierView.RecipeIDList);

    FFeeMasterData.DiscountMoney := ClinicService.CalcDiscount
      (FCashierView.RegData.ClinID, FCashierView.RecipeIDList, '', AFeeTypeID);

    FFeeMasterData.GetMoney := 0;

    if ClinicService.VoiceClinFee <> nil then
      ClinicService.VoiceClinFee.ClinFeeSumMoney(FFeeMasterData);

    Result := inherited Execute();

    if ClinicService.VoiceClinFee <> nil then
      ClinicService.VoiceClinFee.ClinFeeEnd(FFeeMasterData);

  finally
    FFeeMasterData.Cancel;
  end;
end;

procedure TClinFeeTakeDialog.DoFeeTakeCheck;
begin
  ClinicService.FeeTakeCheck(FCashierView.RegData.ClinID,
    FCashierView.RecipeIDList, FFeeMasterData);
end;

procedure TClinFeeTakeDialog.TakeFee;
begin
  AppCore.Logger.Write('门诊收费开始...', mtInfo, 0);

  DoFeeTakeCheck;
  ClinFeePluginManager.DoBeforeInFee(FCashierView.RegData, FFeeMasterData);

  if Assigned(FOnTakeFee) then
    FOnTakeFee(Self)
  else
    DoFeeNormal;

  AppCore.Logger.Write('门诊收费成功|' + FClinFeeID +
    // #13#10'总额：' + FFeeMasterData.AsString['SumPrice'] +
    #13#10'收款：' + FFeeMasterData.AsString['GetMoney'] + #13#10'找零：' +
    FFeeMasterData.AsString['ChargeMoney'], mtInfo, 1);

  // 打印发票
  ClinicService.PrintFee(FClinFeeID);
  ClinFeePluginManager.DoAfterInFee(FCashierView.RegData, FClinFeeID);
  AppCore.Logger.Write('门诊收费完成.', mtInfo, 0);

  ModalResult := mrOk;
end;

procedure TClinFeeTakeDialog.CallExtendOperation(CommandID: Integer);
begin
  if FClinFeeExtendOperation <> nil then
    FClinFeeExtendOperation.Execute(CommandID, [Integer(FFeeMasterData),
      Integer(FCashierView.RegData), FCashierView.RecipeIDList]);
end;

procedure TClinFeeTakeDialog.DoFieldETCCode1Change(Sender: TDACustomField);
begin
  CallExtendOperation(iOperationCommand_Custom + 2);
end;

procedure TClinFeeTakeDialog.DoFieldETCType1Change(Sender: TDACustomField);
begin
  CallExtendOperation(iOperationCommand_Custom + 1);
end;

procedure TClinFeeTakeDialog.DoFieldETCCode2Change(Sender: TDACustomField);
begin
  CallExtendOperation(iOperationCommand_Custom + 4);
end;

procedure TClinFeeTakeDialog.DoFieldETCType2Change(Sender: TDACustomField);
begin
  CallExtendOperation(iOperationCommand_Custom + 3);
end;

procedure TClinFeeTakeDialog.DoFeeExtend(Sender: TObject);
begin
  FClinFeeExtendOperation.Execute(iOperationCommand_Notify,
    [Integer(FFeeMasterData), Integer(FCashierView.RegData),
    FCashierView.RecipeIDList]);
end;

procedure TClinFeeTakeDialog.DoFieldETCMoneyChange(Sender: TObject);
begin
  if ClinicService.VoiceClinFee <> nil then
    ClinicService.VoiceClinFee.ClinFeeETCMoney(FFeeMasterData);
end;

procedure TClinFeeTakeDialog.DoFieldGetMoneyChange(Sender: TObject);
begin
  if ClinicService.VoiceClinFee <> nil then
    ClinicService.VoiceClinFee.ClinFeeGetMoney(FFeeMasterData);
end;

procedure TClinFeeTakeDialog.DoFieldPOSMoneyChange(Sender: TObject);
begin
  if ClinicService.VoiceClinFee <> nil then
    ClinicService.VoiceClinFee.ClinFeePOSMoney(FFeeMasterData);
end;

{ TClinFeeReturnView }

procedure TClinFeeReturnView.DataQuery;
begin
  ViewData.OpenByFieldValue('ClinFeeID', FFeeMasterData.ClinFeeID);
end;

procedure TClinFeeReturnView.BuildViewLayout;
begin
  inherited;

  FFeeMasterData := TcdClinFeeMaster.Create(Self);
  FFeeMasterData.OpenByFeeID('');

  FFeeReturnDialog := TClinFeeReturnDialog.Create(Self);

  FInvoiceIDEdit := TcxMaskEdit.Create(Self);
  SerialIDWrapper.Wrap(FInvoiceIDEdit).OnSerialID := DoInvoiceID;

  FFeeMasterView := TTableGridDataView.Create(Self);
  with FFeeMasterView do
  begin
    ViewData := FFeeMasterData;
    BorderStyle := bsNone;
    Height := 130;
    ToolBarGroup.Visible := False;
    ViewGroup.Caption := '原发票信息';
    ViewGroup.ShowBorder := True;
    TableView.OptionsView.GroupByBox := False;
    TableView.OptionsView.Footer := False;
    Parent := Self;
    Align := alBottom;
    Visible := True;
  end;

  if HisUser.HaveAccess(sAccessClinFee) then
    BuildLayoutToolBar(ActionGroup,
      [BuildAction('准备退费', 'yen', '', DoReturnActionUpdate, DoReturnAction, 0,
      BTN_SHOWCAPTION)]);

  with ToolBarGroup do
  begin
    // Caption := sLayoutGroupOperation;
    with CreateItemForControl(FInvoiceIDEdit) do
    begin
      Caption := '退费发票号:';
      AlignVert := avCenter;
      Index := 0;
    end;

    with CreateItemForControl(nil) do
    begin
      Caption := '(在下面表格中填写退费数量)';
      AlignVert := avCenter;
      AlignHorz := ahRight;
    end;
  end;

  ViewData := TCustomData.Create(Self, HisConnection, sDataServiceClin,
    'Clin_FeeDetail_Return');
  ViewData.Table.BeforePost := DoDataBeforePost;

  Exporting := False;
  // AutoEdit := True;
  SetDataEditing(True);
  Deleting := False;
  Inserting := False;
end;

procedure TClinFeeReturnView.DoCloseAll;
begin
  FFeeMasterData.Close;
  ViewData.Close;
  // FInvoiceIDEdit.SetFocus;
end;

procedure TClinFeeReturnView.DoInvoiceID(Sender: TObject);
begin
  DoCloseAll;
  FFeeMasterData.OpenByFeeID(FInvoiceIDEdit.Text);

  {
    if FReturnApplyDialog = nil then
    begin
    FReturnApplyDialog := TCheckBoxDialog.Create(Self);
    FReturnApplyDialog.Caption := '申请退费';
    FReturnApplyDialog.CheckBox.Caption := '申请全退';
    end;
    FReturnApplyDialog.Checked := True;
    if FReturnApplyDialog.Execute then
    begin
    ClinicService.FeeReturnApply(FFeeMasterData.ClinFeeID,
    IfThen(FReturnApplyDialog.Checked, 1, 0));
    DataQuery;
    end;
  }
  ClinicService.FeeReturnApply(FFeeMasterData.ClinFeeID, 0);
  DataQuery;
end;

procedure TClinFeeReturnView.DoReturnAction(Sender: TObject);
begin
  ViewData.Save;
  FSumPrice := ClinicService.CalcReturnPrice(FFeeMasterData.ClinFeeID);

  Check(FSumPrice = 0, '请输入退费数量');

  FFeeReturnDialog.Execute(FFeeMasterData.ClinFeeID, DoReturnFee);
end;

procedure TClinFeeReturnView.DoReturnActionUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := not FFeeMasterData.Table.EOF and
    not ViewData.Table.EOF;
end;

procedure TClinFeeReturnView.DoDataBeforePost(Sender: TDADataTable);
begin
  ViewData.AsString['ExecOpID'] := HisUser.ID;
  ViewData.AsCurrency['SumPrice'] := ViewData.AsCurrency['ReturnQuan'] *
    ViewData.AsCurrency['CPrice'];
end;

procedure TClinFeeReturnView.DoReturnFee(Sender: TObject);
begin
  AppCore.Logger.Write('门诊退费开始...', mtInfo, 0);

  ClinFeePluginManager.DoBeforeReturnFee(FFeeMasterData,
    FFeeReturnDialog.ReturnFee);

  FNewFeeID := ClinicService.FeeReturn(FFeeMasterData.ClinFeeID,
    FFeeReturnDialog.ReturnFee);

  AppCore.Logger.Write('门诊退费成功, 新发票ID: ' + FNewFeeID, mtInfo, 0);

  ClinFeePluginManager.DoAfterReturnFee(FFeeMasterData, FNewFeeID);

  AppCore.Logger.Write('门诊退费完成.', mtInfo, 0);

  if FNewFeeID <> '' then
    ClinicService.PrintFee(FNewFeeID);

  AppCore.Logger.Write('门诊退费成功', mtInfo, 1);

  DoCloseAll;
  FInvoiceIDEdit.Text := '';
end;

function TClinFeeReturnView.CanEdit: Boolean;
begin
  Result := (inherited CanEdit()) and
    (HisUser.IsAdmin or (ViewData.AsString['ExecOfficeID'] = HisUser.OfficeID));
end;

{ TClinFeeQueryView }

procedure TClinFeeQueryView.BuildViewAction;
begin
  inherited;
  FDetailAction := BuildAction('查看明细', 'details', '', DoDetailUpdate,
    DoDetailAction, 0, BTN_SHOWCAPTION);
end;

function TClinFeeQueryView.CanPrint: Boolean;
begin
  Result := inherited CanPrint()
  // and (TcdClinFeeMaster(ViewData).FeeSign = 1)
  // and SameText(ViewData.AsString[sFieldOpID], HisUser.ID);
end;

procedure TClinFeeQueryView.DataQuery;
begin
  TcdClinFeeMaster(ViewData).OpenByPeriod(BeginDate, EndDate)
end;

procedure TClinFeeQueryView.BuildViewLayout;
begin
  inherited;
  FInvoiceEdit := TcxMaskEdit.Create(Self);
  SerialIDWrapper.Wrap(FInvoiceEdit).OnSerialID := DoInvoiceIDEvent;

  with ToolBarGroup do
  begin
    CreateItem(TdxLayoutSeparatorItem);

    with CreateItemForControl(FInvoiceEdit) do
    begin
      AlignVert := avCenter;
      Caption := '发票号:';
    end;
  end;

  Printing := True;
  OnDoubleClickView := DoDetailAction;

  PeriodGroup.Visible := True;
  SetData(TcdClinFeeMaster.Create(Self));
end;

procedure TClinFeeQueryView.DoDetailAction(Sender: TObject);
begin
  AppCore.Operations.SearchOperation(sOperationIDClinFeeDetailQry)
    .Execute(iOperationCommand_ClinFeeID, [ViewData.AsString['ClinFeeID']]);
end;

procedure TClinFeeQueryView.DoDetailUpdate(Sender: TObject);
begin
  FDetailAction.Enabled := not ViewData.Table.EOF;
end;

function TClinFeeQueryView.DoExecute(CommandID: Integer;
  const Param: array of Variant): Variant;
begin
  // 按结算号查询
  if CommandID = iOperationCommand_BalanceID then
  begin
    TcdClinFeeMaster(ViewData).OpenByBalanceID(Param[0]);
  end
  else if CommandID = iOperationCommand_ClinFeeID then
  begin
    TcdClinFeeMaster(ViewData).OpenByFeeID(Param[0]);
  end;

  AppCore.MainView.ShowView(Self);
end;

procedure TClinFeeQueryView.DoInvoiceIDEvent(Sender: TObject);
begin
  TcdClinFeeMaster(ViewData).OpenByFeeID(FInvoiceEdit.Text);
end;

{ TClinFeeBalanceView }

procedure TClinFeeBalanceView.DataQuery;
begin
  TcdClinFeeMaster(ViewData).OpenNotBalanced(EndDate + 1, HisUser.ID);
end;

procedure TClinFeeBalanceView.DoBalanceAction(Sender: TObject);
begin
  if ShowYesNo(sBalanceConfirm) then
    try
      ClinicService.FeeBalance(EndDate + 1);
      AppCore.Logger.Write('门诊收费结算成功|' + HisUser.Name, mtInfo, 1);
    finally
      DataQuery;
    end;
end;

procedure TClinFeeBalanceView.DoBalanceActionUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := ViewData.Table.Active and
    (ViewData.Table.RecordCount > 0);
end;

procedure TClinFeeBalanceView.BuildViewLayout;
begin
  inherited;
  PeriodGroup.Visible := True;
  BeginDateItem.Visible := False;
  Printing := False;
  ViewData := TcdClinFeeMaster.Create(Self);
end;

procedure TClinFeeBalanceView.BuildViewAction;
begin
  inherited;
  BuildAction('确定结算', 'verify', '', DoBalanceActionUpdate, DoBalanceAction, 0,
    BTN_SHOWCAPTION);
end;

{ TClinFeeDetailQueryView }

procedure TClinFeeDetailQueryView.BuildViewLayout;
begin
  FInvoiceEdit := TcxMaskEdit.Create(Self);
  SerialIDWrapper.Wrap(FInvoiceEdit).OnSerialID := DoInvoiceIDEvent;

  inherited;

  SetOnlyOneDate;

  with ToolBarGroup do
  begin
    CreateItem(TdxLayoutSeparatorItem);

    with CreateItemForControl(FInvoiceEdit) do
    begin
      AlignVert := avCenter;
      Caption := '发票号:';
    end;
  end;

  ViewData := TcdClinFeeDetail.Create(Self);
end;

procedure TClinFeeDetailQueryView.DataQuery;
begin
  TcdClinFeeDetail(ViewData).OpenByPeriod(BeginDate, BeginDate)
end;

function TClinFeeDetailQueryView.DoExecute(CommandID: Integer;
  const Param: array of Variant): Variant;
begin
  if CommandID = iOperationCommand_ClinFeeID then
  begin
    FInvoiceEdit.Text := Param[0];
    DoInvoiceIDEvent(FInvoiceEdit);
  end;

  AppCore.MainView.ShowView(Self);
end;

procedure TClinFeeDetailQueryView.DoInvoiceIDEvent(Sender: TObject);
begin
  TcdClinFeeDetail(ViewData).OpenByFeeID(FInvoiceEdit.Text);
end;

{ TClinRecSelectDialog }

procedure TClinRecSelectDialog.BuildDialog;
begin
  inherited;
  OKButton.Default := True;
  Caption := '选择处方';
  FPriceEdit := TcxCurrencyEdit.Create(Self);
  ItemHeight := 30;
  with FPriceEdit do
  begin
    Properties.Alignment.Horz := taRightJustify;
    Properties.ReadOnly := True;
    TabStop := False;
    Style.Font.Size := 30;
    Style.Font.Color := clBlue;
    Properties.DecimalPlaces := 2;
    Properties.DisplayFormat := '#,##0.00';
  end;
  DialogGroup.CreateItemForControl(FPriceEdit).Caption := '总金额:';
end;

procedure TClinRecSelectDialog.DoCheckListChange(Sender: TObject);
begin
  FPriceEdit.Value := ClinicService.CalcRecipePrice(FClinID, GetCheckedValue);
end;

function TClinRecSelectDialog.Execute(AClinID: string): Boolean;
begin
  CheckListBox.OnEditValueChanged := nil;
  FClinID := AClinID;
  BuildCheckListBox();
  DoCheckListChange(nil);
  CheckListBox.OnEditValueChanged := DoCheckListChange;
  Result := ShowModal = mrOk;
end;

{ TClinFeePluginManager }

procedure TClinFeePluginManager.BuildPluginAction(AClinView: TClinCashierView);
var
  I: Integer;
begin
  for I := 0 to FPlugins.Count - 1 do
    TClinBaseFeePlugin(FPlugins[I]).BuildPluginAction(AClinView);
end;

constructor TClinFeePluginManager.Create;
begin
  FPlugins := TObjectList.Create(True);
end;

destructor TClinFeePluginManager.Destroy;
begin
  FreeAndNil(FPlugins);
  inherited;
end;

procedure TClinFeePluginManager.DoAfterInFee(AReg: TcdClinReg;
  AClinFeeID: string);
var
  I: Integer;
begin
  for I := 0 to FPlugins.Count - 1 do
    TClinBaseFeePlugin(FPlugins[I]).DoAfterInFee(AReg, AClinFeeID);
end;

procedure TClinFeePluginManager.DoAfterReturnFee(AFee: TcdClinFeeMaster;
  ANewFeeID: string);
var
  I: Integer;
begin
  for I := 0 to FPlugins.Count - 1 do
    TClinBaseFeePlugin(FPlugins[I]).DoAfterReturnFee(AFee, ANewFeeID);
end;

procedure TClinFeePluginManager.DoBeforeInFee(AReg: TcdClinReg;
  AFee: TcdClinFeeMaster);
var
  I: Integer;
begin
  for I := 0 to FPlugins.Count - 1 do
    TClinBaseFeePlugin(FPlugins[I]).DoBeforeInFee(AReg, AFee);
end;

procedure TClinFeePluginManager.DoBeforeReturnFee(AFee: TcdClinFeeMaster;
  AReturnFee: TcdClinFeeMaster);
var
  I: Integer;
begin
  for I := 0 to FPlugins.Count - 1 do
    TClinBaseFeePlugin(FPlugins[I]).DoBeforeReturnFee(AFee, AReturnFee);
end;

function TClinFeePluginManager.FindPlugin(AName: string): TClinBaseFeePlugin;
var
  I: Integer;
begin
  Result := nil;
  for I := 0 to FPlugins.Count - 1 do
    with TClinBaseFeePlugin(FPlugins[I]) do
    begin
      if SameText(PluginName, AName) then
      begin
        Result := TClinBaseFeePlugin(FPlugins[I]);
        Break;
      end;
    end;
end;

procedure TClinFeePluginManager.RegisterPlugin(APlugin: TClinBaseFeePlugin);
begin
  FPlugins.Add(APlugin);
end;

{ THisPatientDialog }

procedure THisPatientDialog.BuildDialog;
begin
  inherited;

  ImageName := 'misc\PatientReg.png';
  Caption := '患者办卡登记';
  Width := 940;
  Height := 350;

  FPatient := TcdClinPatient.Create(Self);

  FIDAction := BuildAction('读身份证', '', '', nil, DoReadIDAction, 0, 0);
  BuildLayoutToolBar(BottomGroup, Actions);

  FPatient.OpenByID(-1);
  DevExpress.BuildFormView(DialogGroup, FPatient);
  FWriteCard := SystemService.GetParam('Sys.WriteCard', True);
end;

destructor THisPatientDialog.Destroy;
begin
  FreeAndNil(FPatient);
  inherited;
end;

procedure THisPatientDialog.DoDialogOK(Sender: TObject);
begin
  if FWriteCard then
    ClinicCard.CheckCard;
  FPatient.Save;
  if FWriteCard then
    ClinicCard.WriteCard(FPatient.PID, FPatient.ICCode);
  ShowOK('办卡成功!');
  ModalResult := mrOk;
end;

function THisPatientDialog.Execute: Boolean;
begin
  FPatient.OpenByID(-1);
  FPatient.Insert;
  Result := ShowModal = mrOk;
  if not Result then
  begin
    FPatient.Cancel;
    if FPatient.Table.RecordCount > 0 then
      FPatient.Delete;
    FPatient.Close;
  end;
end;

procedure THisPatientDialog.DoReadIDAction(Sender: TObject);
begin
  if IDReader.ReadCard then
  begin
    FPatient.Edit;
    IDCard2Patient(IDReader.Identity, FPatient.Table);
  end;
end;

function THisPatientDialog.GetPluginFlag: Integer;
begin
  Result := iOperationFlag_ClinReg;
end;

{ TClinCenterView }

procedure TClinCenterView.BuildViewAction;
begin
  BuildAction('全部在院', 'clin_all', '所有在院患者', nil, DoActionQueryAll, 0,
    BTN_SHOWCAPTION or BTN_NOTOOLBAR);
  BuildAction('本科在院', 'clin_self', '本科在院患者', nil, DoActionQueryOffice, 0,
    BTN_SHOWCAPTION);
  BuildAction('挂号历史', 'clin_reg', '查询历史挂号信息', DoActionUpdateHistory,
    DoActionQueryHistory, 0, BTN_SHOWCAPTION or BTN_NOTOOLBAR);
  BuildAction('就诊记录', 'clin_history', '查询就诊信息', DoActionUpdateRecord,
    DoActionQueryRecord, 0, BTN_SHOWCAPTION);
  inherited;
  QueryAction.Visible := False;
  ExportAction.Visible := False;
  EditAction.Caption := '写诊断';
end;

procedure TClinCenterView.DataQuery;
begin
  DoActionQueryOffice(nil);
end;

procedure TClinCenterView.DoActionQueryAll(Sender: TObject);
begin
  ClinRegPatient.OpenRegPatient('', '', 0);
end;

procedure TClinCenterView.DoActionQueryOffice(Sender: TObject);
begin
  ClinRegPatient.OpenByOfficeID(HisUser.OfficeID);
end;

procedure TClinCenterView.DoClinIDEvent(Sender: TObject);
begin
  ClinRegPatient.OpenByNum(FClinIDEdit.Text);
end;

procedure TClinCenterView.DoDoubleClickCell(Sender: TObject);
begin
  if (ClinRegPatient.AsString['SickName'] = '') and EditAction.Enabled then
    EditAction.Execute
  else
    PluginManager.DefaultOperation.Execute(iOperationCommand_Notify,
      [Integer(Self)]);
end;

function TClinCenterView.GetClinRegPatient: TcdClinRegPatient;
begin
  Result := TcdClinRegPatient(ViewData);
end;

procedure TClinCenterView.BuildViewLayout;
begin
  inherited;

  Editing := True;
  OnDoubleClickView := DoDoubleClickCell;

  FClinIDEdit := TcxMaskEdit.Create(Self);
  SerialIDWrapper.Wrap(FClinIDEdit).OnSerialID := DoClinIDEvent;

  with ToolBarGroup do
  begin
    with CreateItemForControl(FClinIDEdit) do
    begin
      Caption := '门诊号:';
      // AlignHorz := ahLeft;
      AlignVert := avCenter;
    end;
  end;

  ViewData := TcdClinRegPatient.Create(Self);

  UseFormForEditing := True;
end;

procedure TClinCenterView.DoActionQueryHistory(Sender: TObject);
begin
  ClinRegPatient.OpenHistory(ClinRegPatient.ClinID);
end;

procedure TClinCenterView.DoActionUpdateHistory(Sender: TObject);
begin
  TAction(Sender).Enabled := not ViewData.EOF;
end;

procedure TClinCenterView.DoActionQueryRecord(Sender: TObject);
begin
  if FRecordView = nil then
  begin
    FRecordView := TClinRecordView.Create(Self);
  end;
  FRecordView.ShowClinID(ClinRegPatient.ClinID);
end;

procedure TClinCenterView.DoActionUpdateRecord(Sender: TObject);
begin
  TAction(Sender).Enabled := not ViewData.EOF;
end;

procedure TClinCenterView.DataEdit;
begin
  inherited;
  if FormView.ModalResult = mrOk then
  begin
    if // (ViewData.AsString['HospID'] <> '') and
      (ViewData.AsString['HospOfficeID'] <> '') then
    begin
      AppCore.Operations.SearchOperation(sOperationIDHospReg)
        .Execute(iOperationCommand_ClinID, [ViewData.AsString[sFieldClinID]])
    end
    else
      PluginManager.DefaultOperation.Execute(iOperationCommand_Notify,
        [Integer(Self)]);
  end;
end;

function TClinCenterView.DoExecute(CommandID: Integer;
  const Param: array of Variant): Variant;
begin
  Result := inherited DoExecute(CommandID, Param);

  if CommandID = iOperationCommand_ClinID then
  begin
    FClinIDEdit.Text := Param[0];
    DoClinIDEvent(FClinIDEdit);
    AppCore.MainView.ShowView(Self);
  end;
end;

function TClinCenterView.GetPluginFlag: Integer;
begin
  Result := iOperationFlag_ClinPatient;
end;

{ TClinRecMasterView }

procedure TClinRecMasterView.BuildViewAction;
begin
  inherited;
  // Printing := True;
  ExportAction.Visible := False;

  Deleting := True;

  InsertAction.Caption := '开处方(F6)';
  InsertAction.Tag := BTN_SHOWCAPTION;
  InsertAction.ShortCut := ShortCut(VK_F6, []);
  Inserting := HisUser.IsDoctor or HisUser.IsAdmin;
  // or HisUser.HaveAccess(sAccessClinDoctor);
  // InsertAction.Visible := HisUser.IsDoctor;
  InsertAction.ImageIndex := AppCore.ToolBarImage.IndexOf('clin_med');

  DeleteAction.Caption := '删除';
  DeleteAction.ShortCut := 0;
  DeleteAction.Tag := BTN_SHOWCAPTION;

  BuildAction('开申请单', 'clin_app', '', DoActionAddAppTypeUpdate,
    DoActionAddAppType, ShortCut(VK_F7, []), BTN_SHOWCAPTION).Visible :=
    InsertAction.Visible;

  BuildAction('审核', 'check', '', DoActionCheckUpdate, DoActionCheck, 0,
    BTN_SHOWCAPTION).Visible := InsertAction.Visible;
end;

constructor TClinRecMasterView.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ViewGroup.Caption := '处方列表';
  ViewGroup.ShowBorder := True;

  // FRecMaster := TcdRecMaster.Create(Self);
  FRecMaster := TcdRecMaster.Create(Self, sDataNameClinRecMasterProc);
  ViewData := FRecMaster;

  FClinRecType := TcdBaseRecipeType.Create(Self);
  FClinRecType.OpenClinMedType; // 用于选择门诊药品处方类型

  FClinDoctor := DataContainer.Items[sDataNameSysClinDoctor];
  FClinDoctor.Open;

  FClinFeeItemData := TcdBaseClinFeeItem
    (DataContainer.Items[sDataNameBaseClinFeeItem]);
  OnRecordScroll := DoRecordScroll;
end;

procedure TClinRecMasterView.DataInsert;
begin
  if LocateDoctor and GetRecipeGroupDialog.Execute then
  begin
    DoOnSelectRecipeGroup(nil);
  end;
end;

procedure TClinRecMasterView.DataPrint;
begin
  FRecDetail.Save;
  inherited;
end;

procedure TClinRecMasterView.DoActionAddAppType(Sender: TObject);
begin
  if LocateDoctor and GetFeeGroupDialog.Execute then
  begin
    DoOnSelectFeeGroup(nil);
  end;
end;

procedure TClinRecMasterView.DoActionAddAppTypeUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := InsertAction.Enabled;
end;

procedure TClinRecMasterView.DoActionCheck(Sender: TObject);
begin
  FRecDetail.Save;
  if Assigned(ClinicService.OnRecipeCheck) then
    ClinicService.OnRecipeCheck(ViewData)
  else
  begin
    ClinicService.WriteRecipeDrugCheck(RecMasterData.AsInteger[sFieldRecipeID], 1);
    RecMasterData.CheckSign := 1;
  end;
end;

procedure TClinRecMasterView.DoActionCheckUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := InsertAction.Enabled;
end;

procedure TClinRecMasterView.DoOnSelectFeeGroup(Sender: TObject);
begin
  with GetFeeGroupDialog do
    try
      AppCore.Logger.Write('正在添加申请单: ' + GroupMasterData.AsString['GroupName'],
        mtInfo, 0);
      FRecMaster.Insert;
      DataTable_CopyCurrentRecord(RecipeTypeData.Table, FRecMaster.Table);
      DataTable_CopyCurrentRecord(FClinDoctor.Table, FRecMaster.Table);
      DataTable_CopyCurrentRecord(GroupMasterData.Table, FRecMaster.Table);
      FRecMaster.AsString['ApplyMemo'] := ApplyMemo;
      FRecMaster.AsInteger['ExtendSign'] := ExtendSign;
      FRecMaster.Save;

      TableView.DataController.SyncSelectionFocusedRecord;

      DataTable_CopySelectedData(GroupDetailData, FRecDetail, 'SelectFlag');
      AppCore.Logger.Write('申请单添加完成：' + GroupMasterData.AsString['GroupName'],
        mtInfo, 1);
    except
      FRecMaster.Cancel;
      raise;
    end;
end;

procedure TClinRecMasterView.DoOnSelectRecipeGroup(Sender: TObject);
begin
  AppCore.Logger.Write('正在添加门诊协定处方：' + FRecipeGroupDialog.GroupMasterData.
    AsString['GroupName'], mtInfo, 0);
  try
    if not FRecipeGroupDialog.AppendRecipe or FRecMaster.EOF or
      (FRecMaster.RecTypeID <> FRecipeGroupDialog.RecipeTypeData.RecTypeID) or
      (FClinDoctor.AsString['DoctorID'] <> FRecMaster.AsString['DoctorID']) then
    begin
      FRecMaster.Insert;

      DataTable_CopyCurrentRecord(FRecipeGroupDialog.RecipeTypeData.Table,
        FRecMaster.Table);
      DataTable_CopyCurrentRecord(FClinDoctor.Table, FRecMaster.Table);

      FRecMaster.AsInteger['ExtendSign'] := FRecipeGroupDialog.ExtendSign;
      FRecMaster.AsString['ApplyMemo'] := FRecipeGroupDialog.RecipeMemo;

      FRecMaster.Save;
      // TableView.DataController.Groups.FullExpand;
    end
    else
      Check(not SameText(FRecMaster.AsString['CountOpID'], HisUser.ID),
        '此处方不允许当前用户修改');
  except
    FRecMaster.Cancel;
    raise;
  end;

  TableView.DataController.SyncSelectionFocusedRecord;
  FRecDetail.DisableControls;
  try
    // DataTable_CopyAllData(FRecipeGroupDialog.GroupDetailData, FRecDetail);
    DataTable_CopySelectedData(FRecipeGroupDialog.GroupDetailData, FRecDetail,
      'SelectFlag');
  finally
    FRecDetail.EnableControls;
  end;
  // FRecDetailView.AutoGroup;

  AppCore.Logger.Write('门诊协定处方添加完成：' + FRecipeGroupDialog.GroupMasterData.
    AsString['GroupName'], mtInfo, 1);
end;

procedure TClinRecMasterView.DoRecordScroll(Sender: TObject);
begin
  // 设置门诊项目筛选的处方类型
  FClinFeeItemData.ClinID := FRecMaster.CurrentClinID;
  FClinFeeItemData.RecTypeID := FRecMaster.RecTypeID;

  FRecDetailView.AutoEdit := (FRecMaster.CountOpID = HisUser.ID) and
    (FRecMaster.RecTypeID < sRecipeType_LIS);
end;

function TClinRecMasterView.GetFeeGroupDialog: TBaseFeeGroupDialog;
begin
  if FFeeGroupDialog = nil then
  begin
    FFeeGroupDialog := TBaseFeeGroupDialog.Create(Self, iUseArea_Clin);
    FFeeGroupDialog.OnSelectGroup := DoOnSelectFeeGroup;
  end;
  Result := FFeeGroupDialog;
end;

function TClinRecMasterView.GetRecipeGroupDialog: TBaseRecipeGroupDialog;
begin
  if FRecipeGroupDialog = nil then
  begin
    FRecipeGroupDialog := TBaseRecipeGroupDialog.Create(Self, iUseArea_Clin);
    FRecipeGroupDialog.OnSelectGroup := DoOnSelectRecipeGroup;
  end;
  Result := FRecipeGroupDialog;
end;

function TClinRecMasterView.LocateDoctor: Boolean;
begin
  Result := FClinDoctor.Table.Locate('OfficeID;DoctorID',
    VarArrayOf([HisUser.OfficeID, HisUser.ID]), []) or
    DictIME.StartIME(nil, FClinDoctor, '', '', nil, False)
end;

{ TClinRecDetailView }

procedure TClinRecDetailView.AutoGroup;
var
  WrapInfo: TRecipeGroupWrapInfo;
begin
  // 自动成组
  WrapInfo := TRecipeGroupWrapInfo(RecipeGroupWrapper.FindWrapInfo(Self));
  if WrapInfo <> nil then
    WrapInfo.DoActionAutoGroup(Self);
end;

procedure TClinRecDetailView.BuildViewAction;
begin
  inherited;
  ResetActionCaption(InsertAction, '新增项目(F8)');
  InsertAction.ShortCut := ShortCut(VK_F8, []);

  BuildAction('调整天数(F9)', 'clin_days', '', DoActionAdjustDayUpdate,
    DoActionAdjustDayCount, ShortCut(VK_F9, []), 0);
end;

constructor TClinRecDetailView.Create(AOwner: TComponent);
begin
  FRecDetail := TcdRecDetail.Create(Self, sDataNameClinRecDetailProc);
  inherited Create(AOwner);

  ViewGroup.Caption := '处方内容';
  ViewGroup.ShowBorder := True;

  ViewData := FRecDetail;

  RecipeGroupWrapper.Wrap(Self);

  SetActionVisible(ExportAction, False);
  SetDataEditing(True);
end;

procedure TClinRecDetailView.DoActionAdjustDayCount(Sender: TObject);
var
  Value: string;
begin
  Value := '1';
  if DX_InputQuery('调整处方天数', '请输入天数', '\d*', Value) then
  begin
    FDayCount := StrToInt(Value);
    Check((FDayCount <= 0) or (FDayCount > 15), '天数要在1-15之间');

    ForEachSelected(DoAdjustDayCount);
  end;
end;

procedure TClinRecDetailView.DoActionAdjustDayUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := EditAction.Enabled;
end;

procedure TClinRecDetailView.DoAdjustDayCount(Sender: TObject);
begin
  with FRecDetail do
  begin
    Edit;
    AsInteger['DayCount'] := FDayCount;
    Save;
  end;
end;

{ TClinDoctorStation }

procedure TClinDoctorStation.BuildViewLayout;
begin
  FRegData := TcdClinReg.Create(Self);
  inherited;

  FMasterView := TClinRecMasterView.Create(Self);
  with FMasterView do
  begin
    IsEmbedded := True;
    BorderStyle := bsNone;
  end;
  FMasterView.Height := AppCore.IniFile.ReadInteger(ClassName,
    'MasterHeight', 300);
  FMasterView.RecMasterData.QueryFlag := 2;

  FDetailView := TClinRecDetailView.Create(Self);
  with FDetailView do
  begin
    IsEmbedded := True;
    BorderStyle := bsNone;
    RecDetailData.BindMaster(FMasterView.RecMasterData, sFieldRecipeID);
  end;

  FMasterView.RecDetailData := FDetailView.RecDetailData;
  FMasterView.FRecDetailView := FDetailView;

  with ViewLayout.Items do
  begin
    AlignHorz := ahClient;
    AlignVert := avClient;

    with CreateItemForControl(FMasterView) do
    begin
      AlignHorz := ahClient;
      AlignVert := avClient;
    end;

    CreateItem(TdxLayoutSplitterItem);

    with CreateItemForControl(FDetailView) do
    begin
      AlignHorz := ahClient;
      AlignVert := avClient;
    end;
  end;
end;

destructor TClinDoctorStation.Destroy;
begin
  AppCore.IniFile.ReadInteger(ClassName, 'MasterHeight', FMasterView.Height);
  inherited;
end;

function TClinDoctorStation.DoExecute(CommandID: Integer;
  const Param: array of Variant): Variant;
begin
  Result := inherited DoExecute(CommandID, Param);

  if CommandID = iOperationCommand_Notify then
  begin
    with TClinCenterView(Integer(Param[0])).ClinRegPatient do
    begin
      if EOF then
        Exit;
      TakeClinID(ClinID);
    end;
  end
  else if CommandID = iOperationCommand_ClinID then
  begin
    TakeClinID(Param[0]);
  end;
  AppCore.MainView.ShowView(Self);
end;

procedure TClinDoctorStation.TakeClinID(const AClinID: string);
begin
  if Length(AClinID) = 12 then
    FRegData.OpenByValidID(AClinID)
  else
    FRegData.OpenByRecipeID(AClinID);
  FMasterView.ViewGroup.Caption := FRegData.GetRecordText
    (FRegData.CustomAttributes.Values['PatientInfoFields'], '  ');
  FMasterView.RecMasterData.CurrentClinID := FRegData.ClinID;
  FMasterView.DataController.Groups.FullExpand;
end;

procedure TClinDoctorStation.TakePatient(ClinRegPatient: TcdClinRegPatient);
begin
  TakeClinID(ClinRegPatient.ClinID);
end;

{ TClinRecExecView }

procedure TClinRecExecView.BuildViewAction;
begin
  inherited;
  BuildAction('处治记录', 'clin_check', '患者处治记录', DoActionCheckUpdate,
    DoActionCheckResult, 0, BTN_SHOWCAPTION);
  BuildAction('执行处方', 'clin_exec', '', DoActionExecUpdate, DoActionExec, 0,
    BTN_SHOWCAPTION);
end;

procedure TClinRecExecView.BuildViewLayout;
begin
  inherited;
  ViewGroup.ShowBorder := True;
  ViewGroup.Caption := '处方列表';

  FClinIDEdit := TcxMaskEdit.Create(Self);
  SerialIDWrapper.Wrap(FClinIDEdit).OnSerialID := DoClinIDEvent;

  ViewData := TCustomData.Create(Self, HisConnection, sDataServiceClin,
    'Pro_Clin_RecMaster_ToExecute');
  ViewData.LogChanges := False;

  FDetailView := TClinRecDetailView.Create(Self);
  FDetailView.BorderStyle := bsNone;
  FDetailView.IsEmbedded := True;
  FDetailView.ToolBarGroup.Visible := False;
  FDetailView.ViewData.BindMaster(ViewData, sFieldRecipeID);
  // ViewData.TriggerScroll;

  with ToolBarGroup do
  begin
    with CreateItemForControl(FClinIDEdit) do
    begin
      Caption := '门诊号:';
      AlignVert := avCenter;
    end;
  end;

  with ViewLayout.Items do
  begin
    CreateItem(TdxLayoutSplitterItem);

    with CreateItemForControl(FDetailView) do
    begin
      AlignHorz := ahClient;
      AlignVert := avClient;
    end;
  end;
end;

procedure TClinRecExecView.DataQuery;
begin
  ViewData.OpenByParam(['OfficeID', 'Num'],
    [HisUser.OfficeID, FClinIDEdit.Text]);
end;

procedure TClinRecExecView.DoActionExec(Sender: TObject);
begin
  ClinicService.ExecRecipe(ViewData.AsInteger[sFieldRecipeID]);
  ViewData.Edit;
  ViewData.AsBoolean['ExecSign'] := True;
  ViewData.Save;
  AppCore.Logger.Write('处方执行成功|' + ViewData.AsString[sFieldRecipeID] + '|' +
    ViewData.AsString['PatientName'], mtInfo, 1);
end;

procedure TClinRecExecView.DoActionExecUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := not ViewData.EOF and not ViewData.AsBoolean
    ['ExecSign'] and SameText(ViewData.AsString['ExecOfficeID'],
    HisUser.OfficeID);
end;

procedure TClinRecExecView.DoActionCheckResult(Sender: TObject);
begin
  if FRecCheckView = nil then
  begin
    FRecCheckView := TClinRecCheckView.Create(Self);
  end;
  FRecCheckView.OpenByRecipe(ViewData);
  FRecCheckView.ShowModal;
end;

procedure TClinRecExecView.DoClinIDEvent(Sender: TObject);
begin
  DataQuery;
end;

procedure TClinRecExecView.DoActionCheckUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := not ViewData.EOF
end;

{ TClinFeeReturnDialog }

procedure TClinFeeReturnDialog.BuildDialog;
begin
  inherited;
  ImageName := 'misc\ReturnFee.png';
  Caption := '门诊退费';
  FFeeMasterData := TcdClinFeeMaster.Create(Self, sDataNameClinFeeMasterReturn);
  FFeeMasterData.Table.MaxRecords := 0;
  FFeeMasterData.LogChanges := False;
  FFeeMasterData.Open;

  DialogGroup.Caption := '退费信息';
  DialogGroup.ShowBorder := True;

  DevExpress.BuildFormView(DialogGroup, FFeeMasterData);
end;

procedure TClinFeeReturnDialog.DoDialogOK(Sender: TObject);
begin
  DoFeeReturnCheck;
  if Assigned(FOnReturnFee) then
    FOnReturnFee(Self);
  ModalResult := mrOk;
end;

procedure TClinFeeReturnDialog.DoFeeReturnCheck;
begin
  ClinicService.FeeReturnCheck(FClinFeeID, FFeeMasterData);
end;

function TClinFeeReturnDialog.Execute(const AClinFeeID: string;
  AOnReturnFee: TNotifyEvent): Boolean;
begin
  FClinFeeID := AClinFeeID;
  FFeeMasterData.Insert;
  FOnReturnFee := AOnReturnFee;
  try
    FFeeMasterData.SumPrice := ClinicService.CalcReturnPrice(AClinFeeID);

    FFeeMasterData.DiscountMoney := ClinicService.CalcReturnDiscount
      (AClinFeeID);

    FFeeMasterData.YBMoney := 0;
    FFeeMasterData.GetMoney := 0;

    Result := inherited Execute();
  finally
    FFeeMasterData.Cancel;
  end;
end;

{ TFeeBalanceCheckView }

procedure TFeeBalanceCheckView.BuildViewAction;
begin
  inherited;
  QueryAction.Caption := '按缴款时间查询';
  BuildAction('按审核时间查询', 'query', '', nil, DoActionQueryByCheckTime, 0,
    BTN_SHOWCAPTION);
  BuildAction('查看明细', 'details', '', nil, DoDoubleClick, 0, BTN_SHOWCAPTION);
  BuildAction('取消结算', 'cancel', '', DoActionCancelUpdate, DoActionCancel, 0,
    BTN_SHOWCAPTION);
  BuildAction('审核', 'check', '', DoActionCheckUpdate, DoActionCheck, 0,
    BTN_SHOWCAPTION);
end;

procedure TFeeBalanceCheckView.BuildViewLayout;
begin
  inherited;
  BeginDate := Date() - 2;
  PeriodGroup.Visible := True;
  SetDataEditing(True);
  Deleting := False;
  Inserting := False;
  ViewData := TCustomData.Create(Self, HisConnection, sDataServiceClin,
    sDataNameFeeBalance);
  // ViewData.LogChanges := False;
  OnDoubleClickView := DoDoubleClick;
end;

function TFeeBalanceCheckView.CanPrint: Boolean;
begin
  Result := inherited CanPrint()
  // and (HisUser.HaveAccess(sAccessFeeBalanceCheck)
  // or SameText(ViewData.AsString['BalanceOpID'], HisUser.ID));
end;

procedure TFeeBalanceCheckView.DataQuery;
begin
  if HisUser.HaveAccess(sAccessFeeBalanceCheck) then
    ViewData.OpenByPeriod('BalanceTime', BeginDate, EndDate + 1)
  else
    ViewData.OpenByList(['BalanceTime', 'BalanceTime', 'BalanceOpID'],
      [BeginDate, EndDate + 1, HisUser.ID], [dboGreaterOrEqual, dboLessOrEqual,
      dboEqual], [dboAnd, dboAnd]);
end;

procedure TFeeBalanceCheckView.DoActionCancelUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := not ViewData.EOF and not ViewData.AsBoolean
    ['CheckSign'] and SameText(ViewData.AsString['BalanceOpID'], HisUser.ID);
end;

procedure TFeeBalanceCheckView.DoActionCancel(Sender: TObject);
begin
  if ShowYesNo('确定取消结算吗?') then
  begin
    ClinicService.FeeBalanceCancel(ViewData.AsInteger['BalanceID']);
    DataQuery;
    ShowOK(sMessageSuccess);
  end;
end;

procedure TFeeBalanceCheckView.DoActionCheck(Sender: TObject);
begin
  if ShowYesNo('确定审核通过吗?') then
  begin
    ClinicService.FeeBalanceCheck(ViewData.AsInteger['BalanceID']);
    ViewData.Edit;
    ViewData.AsInteger['CheckSign'] := 1;
    ViewData.AsString['CheckOpID'] := HisUser.ID;
    ViewData.AsDateTime['CheckTime'] := Now;
    ViewData.Save;
    AppCore.Logger.Write('缴款审核成功|' + ViewData.AsString['BalanceID'], mtInfo, 1);
  end;
end;

procedure TFeeBalanceCheckView.DoActionCheckUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := not ViewData.EOF and not ViewData.AsBoolean
    ['CheckSign'] and HisUser.HaveAccess(sAccessFeeBalanceCheck);
end;

procedure TFeeBalanceCheckView.DoDoubleClick(Sender: TObject);
var
  BalanceType: Integer;
const
  OperationArray: array [iFeeBalanceType_ClinReg .. iFeeBalanceType_HospFee]
    of string = (sOperationIDClinRegQuery, sOperationIDClinFeeQuery,
    sOperationIDHospPayment, sOperationIDHospFeeMasterQuery);
begin
  if ViewData.EOF then
    Exit;

  BalanceType := ViewData.AsInteger['BalanceTypeID'];

  AppCore.Operations.SearchOperation(OperationArray[BalanceType])
    .Execute(iOperationCommand_BalanceID, [ViewData.AsInteger['BalanceID']]);
end;

procedure TFeeBalanceCheckView.DoActionQueryByCheckTime(Sender: TObject);
begin
  if HisUser.HaveAccess(sAccessFeeBalanceCheck) then
    ViewData.OpenByPeriod('CheckTime', BeginDate, EndDate + 1)
  else
    ViewData.OpenByList(['CheckTime', 'CheckTime', 'BalanceOpID'],
      [BeginDate, EndDate + 1, HisUser.ID], [dboGreaterOrEqual, dboLessOrEqual,
      dboEqual], [dboAnd, dboAnd]);
end;

function TFeeBalanceCheckView.CanEdit: Boolean;
begin
  Result := inherited CanEdit() and HisUser.HaveAccess(sAccessFeeBalanceCheck);
end;

{ TClinRecordView }

procedure TClinRecordView.BuildViewAction;
begin
  CreateCloseAction();
  inherited;
  BuildAction('LIS结果', 'LIS', '查看LIS检验结果', nil, DoActionLIS, 0,
    BTN_SHOWCAPTION);
  BuildAction('PACS结果', 'PACS', '查看PACS检查结果', nil, DoActionPACS, 0,
    BTN_SHOWCAPTION);
  BuildAction('处治记录', 'clin_check', '查看处治检查记录', nil, DoActionCheckResult, 0,
    BTN_SHOWCAPTION);
end;

procedure TClinRecordView.BuildViewLayout;
begin
  inherited;
  Caption := '就诊记录';
  Position := poScreenCenter;
  RestoreSize(800, 760);
  ViewGroup.ShowBorder := True;
  ViewGroup.Caption := '处方列表';

  ViewData := TcdRecMaster.Create(Self);
  ViewData.LogChanges := False;

  FDetailView := TClinRecDetailView.Create(Self);
  FDetailView.BorderStyle := bsNone;
  FDetailView.IsEmbedded := True;
  FDetailView.ToolBarGroup.Visible := False;
  FDetailView.Height := 200;
  FDetailView.ViewData.BindMaster(ViewData, 'RecipeID');
  // ViewData.TriggerScroll;

  with ViewLayout.Items do
  begin
    CreateItem(TdxLayoutSplitterItem);

    with CreateItemForControl(FDetailView) do
    begin
      AlignHorz := ahClient;
      AlignVert := avClient;
    end;
  end;

  FLISResult := TCustomData.Create(Self, HisConnection, sDataServiceClin,
    'Clin_RecCheck_LIS');
  FPACSResult := TCustomData.Create(Self, HisConnection, sDataServiceClin,
    'Clin_RecCheck_PACS');
  FCheckResult := TCustomData.Create(Self, HisConnection, sDataServiceClin,
    'Clin_RecCheck');
end;

procedure TClinRecordView.DataQuery;
begin
  OpenByClinID(FClinID);
end;

procedure TClinRecordView.DoActionLIS(Sender: TObject);
begin
  FLISResult.OpenByFieldValue(sFieldPatientID, ViewData.AsString[sFieldClinID]);
  DictIME.StartIME(nil, FLISResult, '', '', nil, True);
end;

procedure TClinRecordView.DoActionPACS(Sender: TObject);
begin
  FPACSResult.OpenByFieldValue('ItemApplyID', ViewData.AsString['ItemApplyID']);
  DictIME.StartIME(nil, FPACSResult, '', '', nil, True);
end;

procedure TClinRecordView.DoActionCheckResult(Sender: TObject);
begin
  FCheckResult.OpenByFieldValue('RecipeID', ViewData.AsInteger['RecipeID']);
  DictIME.StartIME(nil, FCheckResult, '', '', nil, True);
end;

procedure TClinRecordView.DoActionCheckUpdate(Sender: TObject);
begin

end;

procedure TClinRecordView.DoClinIDEvent(Sender: TObject; AClinID: string);
begin

end;

procedure TClinRecordView.OpenByClinID(AClinID: string);
begin
  ViewData.OpenByFieldValue(sFieldClinID, AClinID);
end;

procedure TClinRecordView.ShowClinID(AClinID: string);
begin
  FClinID := AClinID;
  DataQuery;
  ShowModal();
  SaveSize();
end;

{ TClinRecCheckView }

procedure TClinRecCheckView.BuildViewLayout;
begin
  CreateCloseAction();
  inherited;
  Caption := '处治结果';
  Position := poScreenCenter;
  SetDataEditing(True);
  UseFormForEditing := True;
  ViewData := TCustomData.Create(Self, HisConnection, sDataServiceClin,
    'Clin_RecCheck');
end;

function TClinRecCheckView.CanDelete: Boolean;
begin
  Result := inherited CanDelete and SameText(ViewData.AsString['CheckOpID'],
    HisUser.ID)
end;

function TClinRecCheckView.CanEdit: Boolean;
begin
  Result := inherited CanEdit and SameText(ViewData.AsString['CheckOpID'],
    HisUser.ID)
end;

function TClinRecCheckView.CanInsert: Boolean;
begin
  Result := inherited CanInsert and (FRecCheckData <> nil) and
    not FRecCheckData.EOF;
end;

procedure TClinRecCheckView.DataInsert;
begin
  ViewData.Insert;
  ViewData.AsString['CheckOpID'] := HisUser.ID;
  ViewData.AsInteger['RecipeID'] := FRecipeID;
  ViewData.AsDateTime['CheckTime'] := Now();
  DataEdit;
end;

procedure TClinRecCheckView.DataQuery();
begin
  ViewData.OpenByWhereText
    ('RecipeID in (select RecipeID from Clin_RecMaster where ClinID=' +
    QuotedStr(FClinID) + ')');
end;

procedure TClinRecCheckView.OpenByRecipe(ARecipeData: TCustomData);
begin
  FRecipeID := ARecipeData.AsInteger['RecipeID'];
  FClinID := ARecipeData.AsString[sFieldClinID];
  DataQuery();
end;

{ TClinRegView2 }

procedure TClinRegView2.BuildDialog;
begin
  inherited;

  CancelButton.Cancel := False;
  BuildAction('门诊退号', 'clin_reg_return', '', nil, DoActionUnRegister, 0,
    BTN_SHOWCAPTION);
  BuildAction('修改挂号', 'clin_reg_edit', '', nil, DoActionEditReg, 0,
    BTN_SHOWCAPTION);
  FIDAction := BuildAction('读身份证', '', '', nil, DoReadIDAction, 0, 0);
  BuildLayoutToolBar(BottomGroup, Actions);

  FRegHelpData := TCustomData.Create(Self, HisConnection, sDataServiceClin,
    'Clin_Reg_Help');
  FRegHelpData.OnCalcFields := DoCalcRegData;
  FRegHelpData.LogChanges := False;
  FRegHelpData.Source.AutoEdit := True;
  FRegHelpData.Open;

  ImageName := FRegHelpData.CustomAttributes.Values['FormImageName'];
  DevExpress.BuildFormView(DialogGroup, FRegHelpData);

  FRegHelpData.FieldByName('RegType').OnChange := DoSumPriceChange;
  FRegHelpData.FieldByName('PatientName').OnChange := DoPatientNameChange;

  ClinRegOpen;
  ClinRegBegin;
end;

procedure TClinRegView2.ClinRegBegin;
begin
  if Assigned(ClinicService.VoiceClinReg) then
    ClinicService.VoiceClinReg.ClinRegBegin();
end;

procedure TClinRegView2.ClinRegEnd;
begin
  if Assigned(ClinicService.VoiceClinReg) then
    ClinicService.VoiceClinReg.ClinRegEnd(FRegHelpData);
end;

procedure TClinRegView2.ClinRegNameChange;
begin
  if Assigned(ClinicService.VoiceClinReg) then
    ClinicService.VoiceClinReg.ClinRegNameChange(FRegHelpData);
end;

procedure TClinRegView2.ClinRegOpen;
begin
  if Assigned(ClinicService.VoiceClinReg) then
    ClinicService.VoiceClinReg.ClinRegOpen();
end;

procedure TClinRegView2.ClinRegPriceChange;
begin
  if Assigned(ClinicService.VoiceClinReg) then
    ClinicService.VoiceClinReg.ClinRegPriceChange(FRegHelpData);
end;

procedure TClinRegView2.DoActionEditReg(Sender: TObject);
var
  ClinID: string;
begin
  if InputClinID('修改挂号信息', ClinID) then
  begin
    ClinicService.DACommand.Execute('Pro_Clin_Reg_Edit',
      [sFieldClinID, sFieldOpID, 'Xml'], [ClinID, HisUser.ID,
      UTF8ToString(DataTable_GetXmlText(FRegHelpData.Table))]);

    AppCore.Logger.Write('挂号信息修改成功|门诊号=' + ClinID, mtInfo, 1);

    DoClear;
  end;
end;

procedure TClinRegView2.DoActionUnRegister(Sender: TObject);
var
  ClinID: string;
begin
  if InputClinID('门诊退号', ClinID) then
  begin
    ClinicService.RegReturn(ClinID);
    AppCore.Logger.Write('门诊退号成功|门诊号=' + ClinID, mtInfo, 1);
  end;
end;

procedure TClinRegView2.DoCalcRegData(Sender: TObject);
begin
  with TCustomData(Sender) do
    AsCurrency['SumPrice'] := AsCurrency['RegPrice'] + AsCurrency['DiagPrice'];
end;

procedure TClinRegView2.DoClear;
begin
  // FRegHelpData.Refresh;
  FRegHelpData.ClearAllFieldValues;
  FocusFirstControl;
end;

procedure TClinRegView2.DoDialogCancel(Sender: TObject);
begin
  DoClear;
  ClinRegBegin;
end;

procedure TClinRegView2.DoDialogOK(Sender: TObject);
begin
  // if ShowYesNo('确定挂号吗?') then
  begin
    ClinicService.DACommand.Execute('Pro_Clin_Reg', [sFieldClinID, sFieldOpID,
      'Xml'], ['', HisUser.ID, DataTable_GetXmlText(FRegHelpData.Table)]);

    FClinID := ClinicService.GetCommandOutputParam(sFieldClinID);

    ClinicService.PrintReg(FClinID);

    AppCore.Logger.Write('挂号成功. 门诊号: ' + FClinID + ' 姓名: ' +
      FRegHelpData.AsString['PatientName'], mtInfo, 1);

    ClinRegEnd;

    DoClear;

    ClinRegBegin;
  end;
end;

procedure TClinRegView2.DoPatientNameChange(Sender: TDACustomField);
begin
  ClinRegNameChange;
end;

procedure TClinRegView2.DoReadIDAction(Sender: TObject);
begin
  if IDReader.ReadCard then
  begin
    FRegHelpData.Edit;
    FRegHelpData.AsString['IDCode'] := IDReader.Identity.ID;
    FRegHelpData.AsString['PatientName'] := IDReader.Identity.Name;
    FRegHelpData.AsString['Sex'] := IDReader.Identity.Sex;
    FRegHelpData.AsInteger['Age'] :=
      YearsBetween(Now, IDReader.Identity.Birthday);
  end;
end;

procedure TClinRegView2.DoSumPriceChange(Sender: TDACustomField);
begin
  ClinRegPriceChange;
end;

function TClinRegView2.GetPluginFlag: Integer;
begin
  Result := iOperationFlag_ClinReg;
end;

initialization

ClinicCard := THisICCard.Create;
ClinFeePluginManager := TClinFeePluginManager.Create;

finalization

FreeAndNil(ClinicCard);
FreeAndNil(ClinFeePluginManager);

end.
