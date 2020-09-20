unit HisClient_Hosp;

{
  HIS住院模块

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
  DB,
  Graphics,
  StrUtils,
  Math,
  Contnrs,
  Windows,
  uDACore,
  uDAFields,
  uDAWhere,
  uDAInterfaces,
  uDADataTable,
  uDARemoteCommand,
  DataAbstract4_Intf,
  uROClasses,
  cxGraphics,
  cxDBData,
  cxDBEdit,
  cxLabel,
  cxEdit,
  cxMemo,
  cxMaskEdit,
  cxDropDownEdit,
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
  cxClasses,
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
  HisClient_Base,
  HisClient_Classes;

const
  sNoAdviceToPrint = '没有注射单|%s';
  iOperationCommand_HospPatientFeeDetail = iOperationCommand_Custom + 1;

type
  IVoiceHospPrepay = interface
    ['{CBB8B1A4-AA24-406A-90B5-65EF87864BB2}']
    procedure HospPrepayOpen();
    procedure HospPrepayBegin(PrepayData: TCustomData);
    procedure HospPrepayMoneyChange(PrepayData: TCustomData);
    procedure HospPrepayEnd(PrepayData: TCustomData; Success: Boolean);
  end;

  IVoiceHospFee = interface
    ['{BEA227A1-157D-4EC0-A152-45EEFB047A8D}']
    procedure HospFeeOpen();
    procedure HospFeeBegin(PatientData: TCustomData);
    procedure HospFeeSumMoney(FeeData: TCustomData);
    procedure HospFeeDiscountMoney(FeeData: TCustomData);
    procedure HospFeePrepayMoney(FeeData: TCustomData);
    procedure HospFeePayMoney(FeeData: TCustomData);
    procedure HospFeeGetMoney(FeeData: TCustomData);
    procedure HospFeeEnd(FeeData: TCustomData; Success: Boolean);
  end;

  TcdHospPatient = class;

  THisHospService = class(TCustomDataService)
  private
    FPatientData: TcdHospPatient;
    FOnAdviceCheck: TNotifyEvent;
    FVoiceHospPrepay: IVoiceHospPrepay;
    FVoiceHospFee: IVoiceHospFee;
    function GetPatientData: TcdHospPatient;
  protected
  public
    procedure PrintReg(HospID: string);
    procedure PrintPayment(PayID: string);
    procedure PrintFeeMaster(HospFeeID: string);
    procedure PrintPaymentBalance(BalanceID: Integer);
    procedure PrintFeeBalance(BalanceID: Integer);

    function PatientReg(PatientID: Integer; const PatientTypeID, PatientName,
      Sex, IDCode, Address, Phone, OfficeID, SickName, SickName2, ICD10,
      ClinID: string; Birth: TDateTime): string;
    procedure PatientChangeSign(HospID: string; NewSign: Integer);

    function AdviceExec(AdviceTypeID: Integer; FeeDate: TDate;
      const HospID, AdviceIDList: string): Integer;

    procedure FeeDetailCancel(FeeDetailID: Integer; Reason: string;
      CancelQuan: Currency);

    procedure OfficeChangeApply(HospID, InOfficeID: string);
    procedure OfficeChangeCancel(HospID: string);
    procedure OfficeChangeAccept(HospID: string);

    function ApplyCheck(HospID: string; GroupID: Integer; DetailIDList: string;
      ApplyMemo: string; CheckDate: TDateTime; ApplySign: Integer): Integer;

    function CreditAdjust(HospID, AdjustType, AdjustMemo: string;
      AdjustMoney: Currency): Currency;

    function MedicineExec(DetailIDList, ApplyOfficeID: string;
      BusinessType: Integer): string;

    procedure FeeMasterCheck(AFeeMaster: TCustomData);

    function FeeMasterTake(HospID: string; SumPrice: Currency;
      FeeTypeID: Integer; PrepayIDList, HospFeeIDList: string; PayMode: Integer;
      PayTypeID: string; PayType: string; PayMoney: Currency; BillNum: string;
      Memo: string): string; overload;

    function FeeMasterTake(AFeeMaster: TCustomData): string; overload;

    function FeeMasterCancel(AFeeMaster: TCustomData): string;

    function PaymentBalance(AEndDate: TDateTime): Integer;
    function FeeBalance(AEndDate: TDateTime): Integer;

    property PatientData: TcdHospPatient read GetPatientData;

    property OnAdviceCheck: TNotifyEvent read FOnAdviceCheck
      write FOnAdviceCheck;
    property VoiceHospPrepay: IVoiceHospPrepay read FVoiceHospPrepay
      write FVoiceHospPrepay;
    property VoiceHospFee: IVoiceHospFee read FVoiceHospFee write FVoiceHospFee;

  end;

  TcdHospPatient = class(THisData)
  private
    function GetHospID: string;
    function GetPatientTypeID: Integer;
  protected
    procedure DoDataBeforePost(Sender: TDADataTable); override;
  public
    constructor Create(AOwner: TComponent);
    function CanInsert(): Boolean; override;
    function CanDelete(): Boolean; override;
    function CanEdit(): Boolean; override;

    procedure DoQuery(QueryID: Integer; const Value: string;
      BeginDate, EndDate: TDateTime);
    procedure OpenByHospDate(Value: string; BeginDate, EndDate: TDateTime);
    procedure OpenByOutHospDate(Value: string; BeginDate, EndDate: TDateTime);
    procedure OpenByOfficeID(OfficeID: string; BeginDate, EndDate: TDateTime);
    procedure OpenByValue(Value: string; BeginDate, EndDate: TDateTime);

    property HospID: string read GetHospID;
    property PatientTypeID: Integer read GetPatientTypeID;
  end;

  TcdHospAdvice = class(TCustomData)
  private
    FAdviceTypeID: Integer;
    FShowStopAdvice: Boolean;
    FHospID: string;
    FFeeDate: TDate;
    function GetGroupNum: Integer;
    procedure StopCurrentGroupProc(ADataTable: TDADataTable; AParam: Variant);
  protected
    procedure DoDataAfterInsert(Sender: TDADataTable); override;
    procedure DoDataBeforePost(Sender: TDADataTable); override;
    procedure QueryAfterMasterScroll(); override;
  public
    constructor Create(AOwner: TComponent; ALogicalName: string);
    procedure AssignFieldValue(const AFieldName: string; ASource: TCustomData;
      var ADone: Boolean); override;

    function CanEdit(): Boolean; override;
    function CanDelete(): Boolean; override;
    procedure StopCurrentGroup();
    procedure StopCurrentAdvice();

    property GroupNum: Integer read GetGroupNum;
  end;

  TcdHospAdviceType = class(TCustomData)
  private
  protected
  public
    constructor Create(AOwner: TComponent);
  end;

  TcdHospFeeDetail = class(TCustomData)
  private
  protected
  public
    constructor Create(AOwner: TComponent);
  end;

  TcdHospFeeMaster = class(TCustomData)
  private
  protected
  public
    constructor Create(AOwner: TComponent);

    procedure OpenNormal(HospID: string);
    procedure OpenNotSign(HospID: string);
    procedure OpenByHospFeeID(FeeID: string);
    procedure OpenByHospID(HospID: string);
    procedure OpenNotBalanced(AEndDate: TDateTime; AOpID: string);
    procedure OpenByBalanceID(ABalanceID: Integer);
  end;

  TcdHospPayment = class(TCustomData)
  private
  protected
  public
    constructor Create(AOwner: TComponent);
    procedure OpenNotUsed(HospID: string);
    procedure OpenNotBalanced(AEndDate: TDateTime; AOpID: string);
    procedure OpenByBalanceID(ABalanceID: Integer);
  end;

  TcdHospApplyMaster = class(TCustomData)
  private
  public
    constructor Create(AOwner: TComponent);
  end;

  TcdHospOfficeChange = class(TCustomData)
  private
  protected
  public
    constructor Create(AOwner: TComponent);
    procedure OpenHistory(AHospID: string);
    procedure OpenApply();
  end;

  TcdHospMyOfficeBed = class(TCustomData)
  public
    procedure Open(); override;
  end;

  TcdHospCreditAdjust = class(TCustomData)
  private
  protected
  public
    constructor Create(AOwner: TComponent);
  end;

  TcdHospAdviceCount = class(TCustomData)
  public
    constructor Create(AOwner: TComponent);
    function GetRegularCount(const AHospID: string): Integer;
  end;

  TcdHospAdviceCountTemp = class(TCustomData)
  public
    constructor Create(AOwner: TComponent);
    function GetTempCount(const AHospID: string; ABeginDate: TDateTime)
      : Integer;
  end;

  TcvHospPatient = class(TTableGridDataView)
  private
    FHospIDEdit: TcxMaskEdit;
    FPluginGroup: TdxLayoutGroup;
    FLastPluginCategory: string;
    function GetPatientData: TcdHospPatient;
    procedure DoActionHospID(Sender: TObject);
    procedure DoDoubleClickView(Sender: TObject);
  protected
    procedure BuildViewLayout(); override;
    procedure BuildViewAction(); override;
    function GetPluginFlag(): Integer; override;
    function GetPluginLayoutGroup(AOperation: TBaseOperation)
      : TComponent; override;
  public
    procedure DataQuery(); override;

    property PatientData: TcdHospPatient read GetPatientData;
  end;

  TcvHospAdvice = class(TTableGridDataView)
  private
    FAdviceLogicalName: string;
    FAdviceTypeView: TCardGridDataView;
    FHospID: string;
    FPatientView: TcvHospPatient;
    FMyPatientView: TTableGridDataView;
    function GetAdviceData: TcdHospAdvice;
    procedure BindMyPatientView(PatientView: TcvHospPatient);
    procedure DoOnPatientScroll(Sender: TObject);
  protected
    procedure BuildViewLayout(); override;
    procedure BuildViewAction(); override;
    procedure DoShowView(); override;
    procedure DoHideView(); override;
    function DoExecute(CommandID: Integer; const Param: array of Variant)
      : Variant; override;
  public
    procedure DataQuery(); override;

    property AdviceData: TcdHospAdvice read GetAdviceData;
  end;

  TcvHospAdviceEdit = class(TcvHospAdvice)
  private
    FStopCheckBox: TcxCheckBox;
    FRecipeGroupDialog: TBaseRecipeGroupDialog;
    FTempAdviceData: TCustomData;
    FCopyGroupNum: Integer;

    function GetRecipeGroupDialog(): TBaseRecipeGroupDialog;
    procedure DoCheckBoxClick(Sender: TObject);
    procedure DoActionStopUpdate(Sender: TObject);
    procedure DoActionStop(Sender: TObject);
    procedure DoActionAddGroup(Sender: TObject);
    procedure DoOnSelectRecipeGroup(Sender: TObject);
    procedure DoRecordScroll(Sender: TObject);
    procedure DoActionCopy(Sender: TObject);
    procedure DoActionCopyUpdate(Sender: TObject);
    procedure DoActionPaste(Sender: TObject);
    procedure DoActionPasteUpdate(Sender: TObject);
    procedure DoActionCheck(Sender: TObject);
    procedure DoActionCheckUpdate(Sender: TObject);
    function IsRecordSelected(Source: TDADataTable): Boolean;
    procedure CopyEachSelected(Sender: TObject);
    procedure DoAfterPost(Sender: TObject);
  protected
    procedure BuildViewLayout(); override;
    procedure BuildViewAction(); override;
  public
  end;

  TcvHospAdviceExec = class(TcvHospAdvice)
  private
    procedure DoFeeDateChange(Sender: TObject);
    procedure DoActionExec(Sender: TObject);
  protected
    procedure BuildViewLayout(); override;
    procedure BuildViewAction(); override;
  public
  end;

  TcvHospBaby = class(TTableGridDataView)
  private
    FHospID: string;
    FPatientView: TcvHospPatient;
    procedure DoAfterInsert(Sender: TObject);
    procedure SetPatientView(Value: TcvHospPatient);
  protected
    procedure BuildViewLayout(); override;
  public
    procedure DataQuery(); override;

    property PatientView: TcvHospPatient write SetPatientView;
  end;

  TcvHospDayBusiness = class(TBaseLayoutView)
  private
    FPatientView: TcvHospPatient;
    FAdviceCount: TcdHospAdviceCount;
    FAdviceCountTemp: TcdHospAdviceCountTemp;
    FBeginDateEdit: TcxDateEdit;
    FFeeDateEdit: TcxDateEdit;
    FPreviewCheckBox: TcxCheckBox;

    FCreditData: TCustomData;

    procedure DoActionInjection(Sender: TObject);
    procedure DoActionGlue(Sender: TObject);

    procedure DoPrintInjection(Sender: TObject);
    procedure DoPrintGlue(Sender: TObject);

    procedure DoActionInjectionTemp(Sender: TObject);
    procedure DoActionGlueTemp(Sender: TObject);

    procedure DoPrintInjectionTemp(Sender: TObject);
    procedure DoPrintGlueTemp(Sender: TObject);

    procedure DoActionDayFee(Sender: TObject);
    procedure DoPrintDayFee(Sender: TObject);

    procedure DoActionAdjustCredit(Sender: TObject);

    procedure DoActionOutHospApply(Sender: TObject);
    procedure DoActionInHospAccept(Sender: TObject);

    procedure DoActionApplyQuery(Sender: TObject);
    procedure DoActionFeeDetailQuery(Sender: TObject);
  protected
    procedure BuildViewLayout(); override;
    function DoExecute(CommandID: Integer; const Param: array of Variant)
      : Variant; override;
  public

  end;

  TcvHospMiscBusiness = class(TBaseLayoutView)
  private
    FPatientView: TcvHospPatient;
    FBabyView: TcvHospBaby;
    FFeeStatView: TCustomDataView;
    FPluginGroup: TdxLayoutGroup;

    procedure DoActionFeeStat(Sender: TObject);
    procedure DoActionToClinic(Sender: TObject);
    procedure DoActionBaby(Sender: TObject);
  protected
    procedure BuildViewLayout(); override;
    function DoExecute(CommandID: Integer; const Param: array of Variant)
      : Variant; override;
    function GetPluginFlag(): Integer; override;
    function GetPluginLayoutGroup(AOperation: TBaseOperation)
      : TComponent; override;
  public
  end;

  TcvHospFeeDetail = class(TTableGridDataView)
  private
    FHospIDEdit: TcxMaskEdit;
    FOfficeCheckBox: TcxCheckBox;
    FQueryID: Integer;
    FQueryValue: string;
    procedure DoActionHospID(Sender: TObject);
    procedure DoActionCancelFeeUpdate(Sender: TObject);
    procedure DoActionCancelFee(Sender: TObject);
    procedure DoQuery();
  protected
    procedure BuildViewLayout(); override;
    procedure BuildViewAction(); override;
    function DoExecute(CommandID: Integer; const Param: array of Variant)
      : Variant; override;
  public
    procedure DataQuery(); override;
  end;

  TOperationHospOfficeChange = class(TBaseOperation)
  private
    FOfficeChangeData: TcdHospOfficeChange;
    procedure DoActionApplyChangeOffice(Sender: TObject);
    procedure DoActionCancelChangeOffice(Sender: TObject);
    procedure DoActionReceiveChangeOffice(Sender: TObject);
    procedure DoActionShowChangeRecord(Sender: TObject);
    function GetPluginContainer: TcvHospPatient;
    function GetOfficeChangeData: TcdHospOfficeChange;
  protected
    function DoExecute(CommandID: Integer; const Param: array of Variant)
      : Variant; override;
  public
    procedure AfterConstruction(); override;
    destructor Destroy(); override;

    property PluginContainer: TcvHospPatient read GetPluginContainer;
    property OfficeChangeData: TcdHospOfficeChange read GetOfficeChangeData;
  end;

  TOperationHospApply = class(TBaseOperation)
  private
    FPatientView: TcvHospPatient;
    FFeeGroupDialog: TBaseFeeGroupDialog;
    FApplyList: TStrings;

    procedure DoActionApplyCheck(Sender: TObject);
    procedure DoOnSelectFeeGroup(Sender: TObject);
  protected
    function DoExecute(CommandID: Integer; const Param: array of Variant)
      : Variant; override;
  public
  end;

  TcvHospOfficeMed = class(TTableGridDataView)
  private
  protected
    procedure BuildViewLayout(); override;
  public
    procedure DataQuery(); override;
  end;

  TcvHospMedExec = class(TTableGridDataView)
  private
    FHospOfficeView: TTableGridDataView;
    FBusinessCombo: TcxComboBox;
    FHospIDEdit: TcxMaskEdit;
    FItemList: TStringList;
    FPreviewCheckBox: TcxCheckBox;
    procedure DoOfficeScroll(Sender: TObject);
    procedure DoActionMedExec(Sender: TObject);
    procedure DoBusinessTypeChange(Sender: TObject);
    procedure DoActionHospID(Sender: TObject);
    procedure DoBuildItemList(ADataTable: TDADataTable; AParam: Variant);
  protected
    procedure BuildViewLayout(); override;
    procedure BuildViewAction(); override;
  public
    destructor Destroy(); override;
    procedure DataQuery(); override;
  end;

  TcvHospPatientInOut = class(TTableGridDataView)
  private
    FHospIDEdit: TcxMaskEdit;
    FOfficeData: TCustomData;
    FPluginGroup: TdxLayoutGroup;
    FLastPluginCategory: string;
    function GetPatientData: TcdHospPatient;
    procedure DoActionHospID(Sender: TObject);
    procedure DoOfficeChange(Sender: TDACustomField);
  protected
    procedure BuildViewLayout(); override;
    function DoExecute(CommandID: Integer; const Param: array of Variant)
      : Variant; override;
    function GetPluginFlag(): Integer; override;
    function GetPluginLayoutGroup(AOperation: TBaseOperation)
      : TComponent; override;
  public
    procedure DataQuery(); override;

    property PatientData: TcdHospPatient read GetPatientData;
  end;

  TOperationHospFee = class(TViewOperation)
  private
    FSignDialog: TBaseDialog;
    procedure DoActionSignBill(Sender: TObject);
    procedure DoActionToClinic(Sender: TObject);
    function GetPluginContainer: TcvHospPatientInOut;
  protected
  public
    procedure AfterConstruction(); override;
  end;

  TOperationHospOutCheck = class(TBaseOperation)
  private
    procedure DoActionOutCheck(Sender: TObject);
    procedure DoActionOutReturn(Sender: TObject);
    function GetPluginContainer: TcvHospPatientInOut;
  protected
    function DoExecute(CommandID: Integer; const Param: array of Variant)
      : Variant; override;
  public
    procedure AfterConstruction(); override;
  end;

  TOperationHospInOutQuery = class(TBaseOperation)
  private
    procedure DoActionQueryFeeMaster(Sender: TObject);
    procedure DoActionQueryFeeDetail(Sender: TObject);
    procedure DoActionQueryPrepay(Sender: TObject);
    function GetPluginContainer: TcvHospPatientInOut;
  protected
    function DoExecute(CommandID: Integer; const Param: array of Variant)
      : Variant; override;
  public
    procedure AfterConstruction(); override;
  end;

  TcvHospReg = class(TBaseDialog)
  private
    FHospID: string;
    FRegData: TCustomData;
  protected
    procedure BuildViewLayout(); override;
    function DoExecute(CommandID: Integer; const Param: array of Variant)
      : Variant; override;
    procedure DoDialogOK(Sender: TObject); override;
    function GetPluginFlag(): Integer; override;
    function GetPluginLayoutGroup(AOperation: TBaseOperation)
      : TComponent; override;
  public
    property RegData: TCustomData read FRegData;
  end;

  TcvHospPayment = class(TTableGridDataView)
  private
    FHospIDEdit: TcxMaskEdit;
    procedure DoActionHospID(Sender: TObject);
  protected
    procedure BuildViewLayout(); override;
    function DoExecute(CommandID: Integer; const Param: array of Variant)
      : Variant; override;
  public
    function CanPrint(): Boolean; override;
    procedure DataQuery(); override;
  end;

  TcvHospPaymentAdd = class(TBaseDialog)
  private
    FHospID: string;
    FPayID: string;
    FPrepayData: TCustomData;

    procedure HospPrepayOpen();
    procedure HospPrepayBegin();
    procedure HospPrepayMoneyChange(Sender: TDACustomField);
    procedure HospPrepayEnd(Success: Boolean);
  protected
    procedure BuildViewLayout(); override;
    function DoExecute(CommandID: Integer; const Param: array of Variant)
      : Variant; override;
    procedure DoDialogOK(Sender: TObject); override;
  public
  end;

  TcvHospPaymentBalance = class(TTableGridDataView)
  private
    procedure DoBalanceAction(Sender: TObject);
    procedure DoBalanceActionUpdate(Sender: TObject);
  protected
    procedure BuildViewLayout(); override;
    procedure BuildViewAction(); override;
  public
    procedure DataQuery(); override;
  end;

  TcvHospFeeDialog = class;

  THospFeeProc = function(Sender: TcvHospFeeDialog): Boolean;
  THospFeeCallback = procedure(Sender: TcvHospFeeDialog) of object;

  TcvHospFeeDialog = class(TBaseDialog)
  private
    FPatientView: TcvHospPatientInOut;
    FHospID: string;
    FHospFeeID: string;

    FFeeHelpData: TCustomData;
    FPayData: TcdHospPayment;
    FFeeMasterData: TcdHospFeeMaster;

    FPayView: TTableGridDataView;
    FFeeMasterView: TTableGridDataView;

    FFeeGroup: TdxLayoutGroup;

    FYBID: Integer;
    FXNHID: Integer;
    FFeeCallback: THospFeeCallback;

    procedure DoActionHospFeeTake(Sender: TObject);
    procedure DoCalcPayMoney(Sender: TDADataTable);
    procedure DoFieldChange(Sender: TDACustomField);
    function GetSumPrice: Currency;
    procedure DoFieldDiscountMoneyChange(Sender: TDACustomField);
    procedure DoFieldPrepayMoneyChange(Sender: TDACustomField);
    procedure DoFieldPayMoneyChange(Sender: TDACustomField);
    procedure DoFieldGetMoneyChange(Sender: TDACustomField);
  protected
    procedure BuildDialog(); override;
    function DoExecute(CommandID: Integer; const Param: array of Variant)
      : Variant; override;
    procedure DoDialogOK(Sender: TObject); override;
  public
    function StartFee(AFeeTypeID: Integer; AYBMoney, AXNHMoney: Currency;
      AFeeCallback: THospFeeCallback): Boolean;

    property PatientView: TcvHospPatientInOut read FPatientView;
    property YBID: Integer read FYBID write FYBID;
    property XNHID: Integer read FXNHID write FXNHID;
    property FeeData: TCustomData read FFeeHelpData;
    property SumPrice: Currency read GetSumPrice;
  end;

  TcvHospSignBill = class(TBaseDialog)
  private
    FPatientView: TcvHospPatientInOut;
    FHospID: string;

    FPayData: TcdHospPayment;
    FPayView: TTableGridDataView;

    FFeeMasterData: TcdHospFeeMaster;
    FFeeMasterView: TTableGridDataView;
    FSignBillData: TCustomData;

    procedure DoCalcPayMoney(Sender: TDADataTable);
    procedure DoFeeMasterScroll(Sender: TObject);
    procedure DoFieldChange(Sender: TDACustomField);
  protected
    procedure BuildDialog(); override;
    function DoExecute(CommandID: Integer; const Param: array of Variant)
      : Variant; override;
    procedure DoDialogOK(Sender: TObject); override;
  public
    property PatientView: TcvHospPatientInOut read FPatientView;
  end;

  TcvHospFeeMaster = class(TTableGridDataView)
  private
    FInvoiceEdit: TcxMaskEdit;
    FHospIDEdit: TcxMaskEdit;
    procedure DoDetailAction(Sender: TObject);
    procedure DoInvoiceIDEvent(Sender: TObject);
    procedure DoHospIDEvent(Sender: TObject);
  protected
    procedure BuildViewLayout(); override;
    procedure BuildViewAction(); override;
    function DoExecute(CommandID: Integer; const Param: array of Variant)
      : Variant; override;
  public
    function CanCancel(): Boolean; override;
    procedure DataCancel(); override;
    procedure DataQuery(); override;
  end;

  TcvHospFeeBalance = class(TTableGridDataView)
  private
    procedure DoBalanceAction(Sender: TObject);
    procedure DoBalanceActionUpdate(Sender: TObject);
  protected
    procedure BuildViewLayout(); override;
    procedure BuildViewAction(); override;
  public
    procedure DataQuery(); override;
  end;

  TcvHospApplyView = class(TTableGridDataView)
  private
    FHospIDEdit: TcxMaskEdit;
    FDetailView: TTableGridDataView;
    FDetailData: TcdHospFeeDetail;
    procedure DoHospIDEvent(Sender: TObject);
    procedure DoActionExecute(Sender: TObject);
    procedure DoActionCancel(Sender: TObject);
  protected
    procedure BuildViewLayout(); override;
    procedure BuildViewAction(); override;
    function DoExecute(CommandID: Integer; const Param: array of Variant)
      : Variant; override;
  public
    procedure DataQuery(); override;
  end;

  TcvHospCenter = class(TTableGridDataView)
  private
    FHospIDEdit: TcxMaskEdit;
    function GetPatientData: TcdHospPatient;
    procedure DoActionHospID(Sender: TObject);
    procedure DoDoubleClickView(Sender: TObject);
    procedure DoHospDateAction(Sender: TObject);
    procedure DoOutHospDateAction(Sender: TObject);
  protected
    procedure BuildViewLayout(); override;
    procedure BuildViewAction(); override;
  public
    procedure DataQuery(); override;
    property PatientData: TcdHospPatient read GetPatientData;
  end;

  TcvHospFeeStat = class(TChartGridDataView)
  private
    FHospID: string;
  protected
    procedure BuildViewLayout(); override;
    procedure BuildViewAction(); override;
    function DoExecute(CommandID: Integer; const Param: array of Variant)
      : Variant; override;
  public
    procedure DataQuery(); override;
  end;

  TcdHospOperation = class(TCustomData)
  protected
    procedure DoDataAfterInsert(Sender: TDADataTable); override;
    procedure DoDataAfterEdit(Sender: TDADataTable); override;
  public
    constructor Create(AOwner: TComponent);
    function CanInsert(): Boolean; override;
    function CanDelete(): Boolean; override;
    function CanEdit(): Boolean; override;
  end;

  TcvHospOperation = class(TTableGridDataView)
  private
    FHospID: string;
    FPatientView: TcvHospPatient;
    procedure DoAfterInsert(Sender: TObject);
    procedure SetPatientView(Value: TcvHospPatient);
    procedure DoActionCommit(Sender: TObject);
  protected
    procedure BuildViewLayout(); override;
    procedure BuildViewAction(); override;
    function DoExecute(CommandID: Integer; const Param: array of Variant)
      : Variant; override;
  public
    function CanInsert(): Boolean; override;
    function CanDelete(): Boolean; override;
    function CanEdit(): Boolean; override;
    procedure DataQuery(); override;

    property PatientView: TcvHospPatient read FPatientView write SetPatientView;
  end;

procedure DefineHospCommonData(ADataContainer: TDataContainer);
procedure OrganizeHospOperations();

procedure RegisterHospFeeProc(APatientType: Integer; AFeeProc: THospFeeProc);
function GetHospFeeProc(APatientType: Integer): THospFeeProc;

var
  HospService: THisHospService;
  AfterCancelHospFeeProc: TNotifyEvent;

implementation

var
  HospFeeProcList: TStringList;

procedure RegisterHospFeeProc(APatientType: Integer; AFeeProc: THospFeeProc);
begin
  HospFeeProcList.AddObject(IntToStr(APatientType), TObject(@AFeeProc));
end;

function GetHospFeeProc(APatientType: Integer): THospFeeProc;
var
  I: Integer;
begin
  Result := nil;
  for I := 0 to HospFeeProcList.Count - 1 do
    if APatientType = StrToInt(HospFeeProcList[I]) then
      Result := THospFeeProc(HospFeeProcList.Objects[I]);
end;

procedure DefineHospCommonData(ADataContainer: TDataContainer);
begin
  with ADataContainer do
  begin
    RegisterData(HisConnection, sDataServiceHosp, sDataNameHospAdviceType,
      TCustomData, 0, '');
    RegisterData(HisConnection, sDataServiceHosp, sDataNameHospOfficeBed,
      TCustomData, 0, '');
    RegisterData(HisConnection, sDataServiceHosp, sDataNameHospOfficeBedMy,
      TcdHospMyOfficeBed, 0, '');
  end;
end;

procedure OrganizeHospOperations();
begin
  with TViewOperation.Create(sOperationIDHospPatientInOut) do
  begin
    Category := sOperationCategoryHosp;
    Caption := '入出院管理';
    ImageName := 'hosp_inout';
    Access := sAccessHospInOut;
    Order := 'N01';
    ViewClass := TcvHospPatientInOut;
  end;

  with TOperationHospOutCheck.Create(sOperationIDHospPatientOutCheck) do
  begin
    Category := sOperationCategoryHosp;
    Caption := '审核出院';
    ImageName := 'hosp_out';
    Access := sAccessHospInOut;
    Order := 'N52';
    Flag := iOperationFlag_HospInOut or iOperationFlag_NoMenu or
      iOperationFlag_NoTree;
  end;

  with TOperationHospInOutQuery.Create(sOperationIDHospFeeMasterQuery) do
  begin
    Category := sOperationCategoryHosp;
    Caption := '收费查询';
    ImageName := 'query';
    // Access := sAccessHospInOut;
    Order := 'N51';
    Flag := iOperationFlag_HospInOut or iOperationFlag_NoMenu or
      iOperationFlag_NoTree;
  end;

  with TViewOperation.Create(sOperationIDHospReg) do
  begin
    Category := sOperationCategoryHosp;
    Caption := '入院登记';
    ImageName := 'hosp_reg';
    Access := sAccessHospInOut;
    Order := 'N01';
    Flag := iOperationFlag_HospInOut or iOperationFlag_NoMenu or
      iOperationFlag_NoTree;
    ViewClass := TcvHospReg;
  end;

  with TViewOperation.Create(sOperationIDHospPaymentAdd) do
  begin
    Category := sOperationCategoryHosp;
    Caption := '住院预收';
    ImageName := 'prepay';
    Access := sAccessHospFee;
    Order := 'N02';
    Flag := iOperationFlag_HospInOut or iOperationFlag_NoMenu or
      iOperationFlag_NoTree;
    ViewClass := TcvHospPaymentAdd;
  end;

  with TViewOperation.Create(sOperationIDHospPayment) do
  begin
    Category := sOperationCategoryHosp;
    Caption := '住院预收查询';
    ImageName := 'prepay';
    Access := sAccessHospFee;
    Order := 'N061';
    // Flag := iOperationFlag_HospInOut;
    ViewClass := TcvHospPayment;
  end;

  with TOperationHospFee.Create(sOperationIDHospFeeMasterTake) do
  begin
    Category := sOperationCategoryHosp;
    Caption := '出院结算';
    ImageName := 'hosp_fee';
    Access := sAccessHospFee;
    Order := 'N022';
    Flag := iOperationFlag_HospInOut or iOperationFlag_NoMenu or
      iOperationFlag_NoTree;
    ViewClass := TcvHospFeeDialog;
  end;

  with TViewOperation.Create(sOperationIDHospFeeMasterQuery) do
  begin
    Category := sOperationCategoryHosp;
    Caption := '住院收费查询';
    ImageName := 'hosp_fee';
    Access := sAccessHospQuery;
    Order := 'N06';
    // Flag := iOperationFlag_HospInOut;
    ViewClass := TcvHospFeeMaster;
  end;

  with TViewOperation.Create(sOperationIDHospPatient) do
  begin
    Category := sOperationCategoryHosp;
    Caption := '住院管理';
    ImageName := sOperationIDHospPatient;
    Access := sAccessHospPatient;
    Order := 'N02';
    ViewClass := TcvHospPatient;
  end;

  with TViewOperation.Create(sOperationIDHospOfficeMed) do
  begin
    Category := sOperationCategoryHosp;
    Caption := '待发药品查询';
    ImageName := 'med';
    Access := sAccessHospPatient;
    Order := 'N06';
    ViewClass := TcvHospOfficeMed;
  end;

  with TOperationHospApply.Create(sOperationIDHospApply) do
  begin
    Category := sOperationCategoryHosp;
    Caption := '开申请单';
    ImageName := sOperationIDHospApply;
    Access := sAccessHospCheckApply;
    Order := 'N022';
    Flag := iOperationFlag_HospPatient or iOperationFlag_NoMenu or
      iOperationFlag_NoTree;
  end;

  with TViewOperation.Create(sOperationIDHospAdviceEdit) do
  begin
    Category := sOperationCategoryHosp;
    Caption := '编辑医嘱';
    ImageName := 'advice';
    Access := sAccessHospAdviceEdit;
    Order := 'N020';
    ViewClass := TcvHospAdviceEdit;
    Flag := iOperationFlag_HospPatient or iOperationFlag_NoMenu or
      iOperationFlag_NoTree;
  end;

  with TViewOperation.Create(sOperationIDHospAdviceExec) do
  begin
    Category := sOperationCategoryHosp;
    Caption := '执行医嘱';
    ImageName := 'exec';
    Access := sAccessHospAdviceExec;
    Order := 'N021';
    ViewClass := TcvHospAdviceExec;
    Flag := iOperationFlag_HospPatient or iOperationFlag_NoMenu or
      iOperationFlag_NoTree;
  end;

  with TViewOperation.Create(sOperationIDHospDayBusiness) do
  begin
    Category := sOperationCategoryHosp;
    Caption := '日常事务';
    ImageName := 'hosp_business';
    CustomAttributes.Add('PluginControl=True');
    CustomAttributes.Add('PluginPopup=False');
    CustomAttributes.Add('PluginCategory=Business');
    Access := sAccessHospAdviceExec;
    Order := 'N03';
    ViewClass := TcvHospDayBusiness;
    Flag := iOperationFlag_HospPatient or iOperationFlag_NoMenu or
      iOperationFlag_NoTree;
  end;

  with TViewOperation.Create(sOperationIDHospMiscBusiness) do
  begin
    Category := sOperationCategoryHosp;
    Caption := '其他事务';
    ImageName := 'hosp_business';
    CustomAttributes.Add('PluginControl=True');
    CustomAttributes.Add('PluginPopup=True');
    CustomAttributes.Add('PluginCategory=Business2');
    Access := sAccessHospAdviceExec;
    Order := 'N06';
    ViewClass := TcvHospMiscBusiness;
    Flag := iOperationFlag_HospPatient or iOperationFlag_NoMenu or
      iOperationFlag_NoTree;
  end;

  with TViewOperation.Create(sOperationIDHospFeeDetailQuery) do
  begin
    Category := sOperationCategoryHosp;
    Caption := '住院费用明细';
    ImageName := 'hosp_detail';
    Access := sAccessHospQuery;
    Order := 'N04';
    ViewClass := TcvHospFeeDetail;
    // Flag := iOperationFlag_HospPatient //or iOperationFlag_HospInOut;;
  end;

  with TOperationHospOfficeChange.Create(sOperationIDHospOfficeChange) do
  begin
    Category := sOperationCategoryHosp;
    Caption := '申请转科';
    ImageName := 'hosp_office_change';
    Access := sAccessHospAdviceExec;
    Order := 'N05';
    Flag := iOperationFlag_HospPatient or iOperationFlag_NoMenu or
      iOperationFlag_NoTree;
  end;

  with TViewOperation.Create(sOperationIDHospPaymentBalance) do
  begin
    Category := sOperationCategoryHospFee;
    Caption := '住院预收缴款';
    ImageName := 'hosp_balance';
    Access := sAccessHospFee;
    Order := 'N90';
    ViewClass := TcvHospPaymentBalance;
  end;

  with TViewOperation.Create(sOperationIDHospFeeMasterBalance) do
  begin
    Category := sOperationCategoryHospFee;
    Caption := '住院收费缴款';
    ImageName := 'hosp_balance';
    Access := sAccessHospFee;
    Order := 'N90';
    ViewClass := TcvHospFeeBalance;
  end;

  with TViewOperation.Create(sOperationIDHospMedExec) do
  begin
    Category := sOperationCategoryHosp;
    Caption := '住院发药';
    Access := sAccessMedHospExec;
    ImageName := 'hosp_med';
    Order := 'N07';
    ViewClass := TcvHospMedExec;
  end;

  with TViewOperation.Create(sOperationIDHospApplyQuery) do
  begin
    Category := sOperationCategoryHosp;
    Caption := '住院申请单';
    Access := sAccessHospCheckApply;
    ImageName := 'hosp_apply';
    Order := 'N03';
    ViewClass := TcvHospApplyView;
  end;

  with TViewOperation.Create(sOperationIDHospCenter) do
  begin
    Category := sOperationCategoryHosp;
    Caption := '住院患者';
    ImageName := 'hosp_center';
    Access := sAccessHospCenter;
    Order := 'N00';
    ViewClass := TcvHospCenter;
  end;

  with TViewOperation.Create(sOperationIDHospOperation) do
  begin
    Category := sOperationCategoryHosp;
    Caption := '手术申请';
    Access := sAccessHospCheckApply;
    ImageName := sOperationIDHospOperation;
    Order := 'N08';
    ViewClass := TcvHospOperation;
    // CustomAttributes.Add('PluginCategory=Business');
    Flag := iOperationFlag_HospPatient or iOperationFlag_NoMenu or
      iOperationFlag_NoTree;
  end;
end;

{ THisHospService }

function THisHospService.AdviceExec(AdviceTypeID: Integer; FeeDate: TDate;
  const HospID, AdviceIDList: string): Integer;
begin
  Result := DACommand.Execute('Pro_Hosp_Advice_ExecuteList',
    ['AdviceTypeID', 'FeeDate', sFieldHospID, 'AdviceIDList', 'OfficeID',
    sFieldOpID], [AdviceTypeID, FeeDate, HospID, AdviceIDList, HisUser.OfficeID,
    HisUser.ID]);
  Result := GetCommandOutputParam('Return_Value');
end;

function THisHospService.ApplyCheck(HospID: string; GroupID: Integer;
  DetailIDList, ApplyMemo: string; CheckDate: TDateTime;
  ApplySign: Integer): Integer;
begin
  DACommand.Execute('Pro_Hosp_ApplyMaster_Add', ['ApplyID', sFieldHospID,
    'GroupID', 'DetailIDList', 'ApplyMemo', 'CheckDate', 'OfficeID', sFieldOpID,
    'ApplySign'], [0, HospID, GroupID, DetailIDList, ApplyMemo, CheckDate,
    HisUser.OfficeID, HisUser.ID, ApplySign]);
  Result := GetCommandOutputParam('ApplyID');
end;

function THisHospService.CreditAdjust(HospID, AdjustType, AdjustMemo: string;
  AdjustMoney: Currency): Currency;
begin
  DACommand.Execute('Pro_Hosp_CreditAdjust_Add', [sFieldHospID, 'AdjustType',
    'AdjustMemo', 'AdjustMoney', 'AfterAdjust', 'OfficeID', sFieldOpID],
    [HospID, AdjustType, AdjustMemo, AdjustMoney, 0, HisUser.OfficeID,
    HisUser.ID]);
  Result := GetCommandOutputParam('AfterAdjust');
end;

function THisHospService.FeeBalance(AEndDate: TDateTime): Integer;
begin
  DACommand.Execute('Pro_Hosp_FeeMaster_Balance',
    [sFieldOpID, 'EndDate', 'Memo', 'BalanceID'],
    [HisUser.ID, AEndDate, '', 0]);
  Result := GetCommandOutputParam('BalanceID');
  PrintFeeBalance(Result);
end;

procedure THisHospService.FeeDetailCancel(FeeDetailID: Integer; Reason: string;
  CancelQuan: Currency);
begin
  DACommand.Execute('Pro_Hosp_FeeDetail_Cancel', ['FeeDetailID', 'OfficeID',
    sFieldOpID, 'CancelReason', 'CancelQuan'], [FeeDetailID, HisUser.OfficeID,
    HisUser.ID, Reason, CancelQuan]);
end;

function THisHospService.FeeMasterTake(HospID: string; SumPrice: Currency;
  FeeTypeID: Integer; PrepayIDList, HospFeeIDList: string; PayMode: Integer;
  PayTypeID, PayType: string; PayMoney: Currency;
  BillNum, Memo: string): string;
begin
  DACommand.Execute('Pro_Hosp_FeeMaster_Take', ['HospFeeID', sFieldHospID,
    'SumPrice', 'FeeTypeID', 'PrepayIDList', 'HospFeeIDList', 'PayMode',
    'PayTypeID', 'PayType', 'PayMoney', 'BillNum', 'Memo', sFieldOpID],
    ['', HospID, SumPrice, FeeTypeID, PrepayIDList, HospFeeIDList, PayMode,
    PayTypeID, PayType, PayMoney, BillNum, Memo, HisUser.ID]);
  Result := GetCommandOutputParam('HospFeeID');
end;

procedure THisHospService.FeeMasterCheck(AFeeMaster: TCustomData);
begin
  DACommand.Execute('Pro_Hosp_FeeMaster_Check', ['Xml'],
    [DataTable_GetXmlText(AFeeMaster.Table)]);
end;

function THisHospService.FeeMasterTake(AFeeMaster: TCustomData): string;
begin
  DACommand.Execute('Pro_Hosp_FeeMaster_TakeXml', ['HospFeeID', 'Xml'],
    ['', DataTable_GetXmlText(AFeeMaster.Table)]);

  Result := GetCommandOutputParam('HospFeeID');
end;

function THisHospService.MedicineExec(DetailIDList, ApplyOfficeID: string;
  BusinessType: Integer): string;
begin
  DACommand.Execute('Pro_Hosp_Med_Execute', ['DetailIDList', 'ApplyOfficeID',
    'ExecOfficeID', 'BusinessType', sFieldOpID, 'ApplyID'],
    [DetailIDList, ApplyOfficeID, HisUser.OfficeID, BusinessType,
    HisUser.ID, 0]);

  Result := GetCommandOutputParam('ApplyID');
end;

procedure THisHospService.OfficeChangeAccept(HospID: string);
begin
  DACommand.Execute('Pro_Hosp_OfficeChange_Accept', [sFieldHospID, 'OfficeID',
    sFieldOpID], [HospID, HisUser.OfficeID, HisUser.ID]);
end;

procedure THisHospService.OfficeChangeApply(HospID, InOfficeID: string);
begin
  DACommand.Execute('Pro_Hosp_OfficeChange_Apply', [sFieldHospID, 'InOfficeID',
    sFieldOpID], [HospID, InOfficeID, HisUser.ID]);
end;

procedure THisHospService.OfficeChangeCancel(HospID: string);
begin
  DACommand.Execute('Pro_Hosp_OfficeChange_Cancel', [sFieldHospID, 'OfficeID',
    sFieldOpID], [HospID, HisUser.OfficeID, HisUser.ID]);
end;

procedure THisHospService.PatientChangeSign(HospID: string; NewSign: Integer);
begin
  DACommand.Execute('Pro_Hosp_Patient_ChangeSign', [sFieldHospID, 'NewSign',
    sFieldOpID], [HospID, NewSign, HisUser.ID]);
end;

function THisHospService.PatientReg(PatientID: Integer;
  const PatientTypeID, PatientName, Sex, IDCode, Address, Phone, OfficeID,
  SickName, SickName2, ICD10, ClinID: string; Birth: TDateTime): string;
begin
  DACommand.Execute('Pro_Hosp_Patient_Register',
    ['PatientID', sFieldPatientTypeID, 'PatientName', 'Sex', 'Birth', 'IDCode',
    'Address', 'Phone', 'OfficeID', 'SickName', 'SickName2', 'ICD10', 'ClinID'],
    [PatientID, PatientTypeID, PatientName, Sex, Birth, IDCode, Address, Phone,
    OfficeID, SickName, SickName2, ICD10, ClinID]);
  Result := GetCommandOutputParam(sFieldHospID);
end;

function THisHospService.PaymentBalance(AEndDate: TDateTime): Integer;
begin
  DACommand.Execute('Pro_Hosp_Payment_Balance', [sFieldOpID, 'EndDate', 'Memo',
    'BalanceID'], [HisUser.ID, AEndDate, '', 0]);

  Result := GetCommandOutputParam('BalanceID');

  PrintPaymentBalance(Result);
end;

procedure THisHospService.PrintFeeBalance(BalanceID: Integer);
begin
  PrintReportFromServer('住院收费缴款单.fr3', ['BalanceID'], [BalanceID], nil, True);
end;

procedure THisHospService.PrintFeeMaster(HospFeeID: string);
begin
  PrintReportFromServer('住院普通发票.fr3', ['HospFeeID'], [HospFeeID], nil, False,
    BusinessPrinters.GetBusinessPrinter(sPrinterHospFee));
end;

procedure THisHospService.PrintPayment(PayID: string);
begin
  PrintReportFromServer('住院预收单.fr3', ['PayID'], [PayID], nil, False,
    BusinessPrinters.GetBusinessPrinter(sPrinterHospPay));
end;

procedure THisHospService.PrintPaymentBalance(BalanceID: Integer);
begin
  PrintReportFromServer('住院预收缴款单.fr3', ['BalanceID'], [BalanceID], nil, True);
end;

procedure THisHospService.PrintReg(HospID: string);
begin
  PrintReportFromServer('住院证.fr3', ['HospID'], [HospID]);
end;

function THisHospService.GetPatientData: TcdHospPatient;
begin
  if FPatientData = nil then
    FPatientData := TcdHospPatient.Create(Self);

  Result := FPatientData;
end;

function THisHospService.FeeMasterCancel(AFeeMaster: TCustomData): string;
begin
  AppCore.Logger.Write('正在取消住院收费|' + AFeeMaster.AsString[sFieldHospFeeID],
    mtInfo, 0);

  DACommand.Execute('Pro_Hosp_FeeMaster_Cancel', [sFieldHospFeeID, sFieldOpID],
    [AFeeMaster.AsString[sFieldHospFeeID], HisUser.ID]);

  AppCore.Logger.Write('取消住院收费成功|' + AFeeMaster.AsString[sFieldHospFeeID],
    mtInfo, 1);

  if Assigned(AfterCancelHospFeeProc) then
    AfterCancelHospFeeProc(AFeeMaster);
end;

{ TcdHospPatient }

function TcdHospPatient.CanDelete: Boolean;
begin
  Result := False;
end;

function TcdHospPatient.CanEdit: Boolean;
begin
  Result := inherited CanEdit and
    ((SameText(AsString['OfficeID'], HisUser.OfficeID) and
    (AsInteger['HospSign'] <= iHospSign_Normal)) or HisUser.IsAdmin);
end;

function TcdHospPatient.CanInsert: Boolean;
begin
  Result := False;
end;

constructor TcdHospPatient.Create(AOwner: TComponent);
begin
  inherited Create(AOwner, HisConnection, sDataServiceHosp,
    sDataNameHospPatient);
end;

procedure TcdHospPatient.DoDataBeforePost(Sender: TDADataTable);
begin
  inherited;
  AsString[sFieldOpID] := HisUser.ID;
end;

function TcdHospPatient.GetHospID: string;
begin
  Result := AsString[sFieldHospID];
end;

function TcdHospPatient.GetPatientTypeID: Integer;
begin
  Result := AsInteger[sFieldPatientTypeID];
end;

procedure TcdHospPatient.DoQuery(QueryID: Integer; const Value: string;
  BeginDate, EndDate: TDateTime);
begin
  OpenByParam(['OfficeID', 'OpID', 'QueryID', 'Value', 'BeginDate', 'EndDate'],
    [HisUser.OfficeID, HisUser.ID, QueryID, Value, BeginDate, EndDate]);
end;

procedure TcdHospPatient.OpenByHospDate(Value: string;
  BeginDate, EndDate: TDateTime);
begin
  DoQuery(3, Value, BeginDate, EndDate);
end;

procedure TcdHospPatient.OpenByOfficeID(OfficeID: string;
  BeginDate, EndDate: TDateTime);
begin
  DoQuery(1, OfficeID, BeginDate, EndDate);
end;

procedure TcdHospPatient.OpenByOutHospDate(Value: string;
  BeginDate, EndDate: TDateTime);
begin
  DoQuery(4, Value, BeginDate, EndDate);
end;

procedure TcdHospPatient.OpenByValue(Value: string;
  BeginDate, EndDate: TDateTime);
begin
  DoQuery(2, Value, BeginDate, EndDate);
end;

{ TcdHospAdvice }

procedure TcdHospAdvice.AssignFieldValue(const AFieldName: string;
  ASource: TCustomData; var ADone: Boolean);
begin
  if SameText(AFieldName, 'Dosage') then
  begin
    AsFloat['Dosage'] := ASource.AsFloat['RatioValue'] * AsFloat['UnitDose'];
    ADone := True;
  end;
end;

function TcdHospAdvice.CanDelete: Boolean;
begin
  Result := CanEdit and (AsInteger['ExecDays'] = 0);
end;

function TcdHospAdvice.CanEdit: Boolean;
begin
  Result := inherited CanEdit and not AsBoolean['StopSign'] and
    SameText(AsString[sFieldOfficeID], HisUser.OfficeID);
end;

constructor TcdHospAdvice.Create(AOwner: TComponent; ALogicalName: string);
begin
  inherited Create(AOwner, HisConnection, sDataServiceHosp, ALogicalName);
  FFeeDate := Date();
  FShowStopAdvice := False;
end;

procedure TcdHospAdvice.StopCurrentGroup;
begin
  if GroupNum <> iDefaultGroupNum then
    EnumDataTable(Table, StopCurrentGroupProc, GroupNum)
  else
    StopCurrentAdvice;
end;

procedure TcdHospAdvice.StopCurrentGroupProc(ADataTable: TDADataTable;
  AParam: Variant);
begin
  if GroupNum = AParam then
  begin
    StopCurrentAdvice;
  end;
end;

procedure TcdHospAdvice.DoDataAfterInsert(Sender: TDADataTable);
begin
  inherited;
  AsString[sFieldHospID] := FHospID;
  AsString['DoctorID'] := HisUser.ID;
  AsString['DoctorName'] := HisUser.Name;
  AsString['OfficeID'] := HisUser.OfficeID;
  AsString['OfficeName'] := HisUser.OfficeName;
  if HisUser.IsDoctor then
    AsInteger['AdviceCategory'] := 1;
end;

procedure TcdHospAdvice.DoDataBeforePost(Sender: TDADataTable);
begin
  inherited;
  if Table.FindField('DoctorID') <> nil then
    AsString['DoctorID'] := HisUser.ID;
  if Table.FindField('GroupID') <> nil then
    AsInteger['GroupID'] := AsInteger['GroupNum'] div 10000;
  Check(AsInteger['FeeID'] = 0, '请输入项目名称');
end;

function TcdHospAdvice.GetGroupNum: Integer;
begin
  Result := AsInteger['GroupNum'] div 10000;
end;

procedure TcdHospAdvice.QueryAfterMasterScroll;
begin
  // 编辑医嘱和执行医嘱公用此查询
  Close;
  if Table.Params.Count > 0 then
  begin
    ParamValue['FeeDate'] := FFeeDate;
  end;
  FAdviceTypeID := MasterKey;

  if FHospID = '' then
    FHospID := '0';

  if not FShowStopAdvice then
    OpenByList(['HospID', 'OfficeID', 'AdviceTypeID', 'StopSign'],
      [FHospID, AppCore.User.OfficeID, FAdviceTypeID, 0],
      [dboEqual, dboEqual, dboEqual, dboEqual], [dboAnd, dboAnd, dboAnd])
  else
    OpenByList(['HospID', 'OfficeID', 'AdviceTypeID'],
      [FHospID, AppCore.User.OfficeID, FAdviceTypeID],
      [dboEqual, dboEqual, dboEqual], [dboAnd, dboAnd])
end;

procedure TcdHospAdvice.StopCurrentAdvice;
begin
  Edit;
  AsBoolean['StopSign'] := True;
  AsDateTime['StopDate'] := Now;
  Save;
end;

{ TcdHospAdviceType }

constructor TcdHospAdviceType.Create(AOwner: TComponent);
begin
  inherited Create(AOwner, HisConnection, sDataServiceHosp,
    sDataNameHospAdviceType);
end;

{ TcdHospFeeDetail }

constructor TcdHospFeeDetail.Create(AOwner: TComponent);
begin
  inherited Create(AOwner, HisConnection, sDataServiceHosp,
    sDataNameHospFeeDetail);
  LogChanges := False;
end;

{ TcdHospFeeMaster }

constructor TcdHospFeeMaster.Create(AOwner: TComponent);
begin
  inherited Create(AOwner, HisConnection, sDataServiceHosp,
    sDataNameHospFeeMaster);
end;

procedure TcdHospFeeMaster.OpenByBalanceID(ABalanceID: Integer);
begin
  OpenByFieldValue('BalanceID', ABalanceID);
end;

procedure TcdHospFeeMaster.OpenByHospFeeID(FeeID: string);
begin
  OpenByFieldValue('HospFeeID', FeeID);
end;

procedure TcdHospFeeMaster.OpenByHospID(HospID: string);
begin
  OpenByFieldValue('HospID', HospID);
end;

procedure TcdHospFeeMaster.OpenNormal(HospID: string);
begin
  OpenByList([sFieldHospID, 'FeeSign'], [HospID, iHospFeeSign_Normal],
    [dboEqual, dboEqual], [dboAnd]);
end;

procedure TcdHospFeeMaster.OpenNotBalanced(AEndDate: TDateTime; AOpID: string);
begin
  OpenByList(['BalanceID', 'FeeTime', sFieldOpID], [0, AEndDate, AOpID],
    [dboEqual, dboLessOrEqual, dboEqual], [dboAnd, dboAnd]);
end;

procedure TcdHospFeeMaster.OpenNotSign(HospID: string);
begin
  OpenByList([sFieldHospID, 'FeeSign'], [HospID, iHospFeeSign_NoSign],
    [dboEqual, dboEqual], [dboAnd]);
end;

{ TcdHospPayment }

constructor TcdHospPayment.Create(AOwner: TComponent);
begin
  inherited Create(AOwner, HisConnection, sDataServiceHosp,
    sDataNameHospPayment);
end;

procedure TcdHospPayment.OpenByBalanceID(ABalanceID: Integer);
begin
  OpenByFieldValue('BalanceID', ABalanceID);
end;

procedure TcdHospPayment.OpenNotBalanced(AEndDate: TDateTime; AOpID: string);
begin
  OpenByList(['PayTime', 'BalanceID', sFieldOpID], [AEndDate, 0, AOpID],
    [dboLessOrEqual, dboEqual, dboEqual], [dboAnd, dboAnd]);
end;

procedure TcdHospPayment.OpenNotUsed(HospID: string);
begin
  OpenByList(['HospID', 'HospFeeID'], [HospID, 'X'], [dboEqual, dboEqual],
    [dboAnd]);
end;

{ TcdHospApplyMaster }

constructor TcdHospApplyMaster.Create(AOwner: TComponent);
begin
  inherited Create(AOwner, HisConnection, sDataServiceHosp,
    sDataNameHospApplyMaster);
end;

{ TcdHospOfficeChange }

constructor TcdHospOfficeChange.Create(AOwner: TComponent);
begin
  inherited Create(AOwner, HisConnection, sDataServiceHosp,
    sDataNameHospOfficeChange);
end;

procedure TcdHospOfficeChange.OpenApply;
begin
  OpenByList(['InOfficeID', 'ChangeSign'], [HisUser.OfficeID, 0],
    [dboEqual, dboEqual], [dboAnd]);
end;

procedure TcdHospOfficeChange.OpenHistory(AHospID: string);
begin
  OpenByList([sFieldHospID], [AHospID], [dboEqual], []);
end;

{ TcdHospCreditAdjust }

constructor TcdHospCreditAdjust.Create(AOwner: TComponent);
begin
  inherited Create(AOwner, HisConnection, sDataServiceHosp,
    sDataNameHospCreditAdjust);
end;

{ TcvHospPatient }

procedure TcvHospPatient.BuildViewAction;
begin
  inherited;
end;

procedure TcvHospPatient.BuildViewLayout;
begin
  inherited;

  FHospIDEdit := TcxMaskEdit.Create(Self);
  SerialIDWrapper.Wrap(FHospIDEdit, swmYear, 6).OnSerialID := DoActionHospID;

  with ToolBarGroup do
  begin
    with CreateItemForControl(FHospIDEdit) do
    begin
      Caption := '住院号:';
      AlignVert := avCenter;
    end;
  end;

  Editing := True; // HisUser.HaveAccess(sAccessHospAdviceExec);
  UseFormForEditing := True;

  EnableMultiSelect;
  OnDoubleClickView := DoDoubleClickView;

  ViewData := HospService.PatientData;

  if HisUser.IsAdmin then
    ViewData.CustomAttributes.Values['FormEditFields'] :=
      ViewData.CustomAttributes.Values['AdminFormEditFields'];
end;

procedure TcvHospPatient.DataQuery;
begin
  PatientData.OpenByOfficeID(HisUser.OfficeID, BeginDate, EndDate);
end;

procedure TcvHospPatient.DoActionHospID(Sender: TObject);
begin
  PatientData.OpenByValue(FHospIDEdit.Text, BeginDate, EndDate);
end;

procedure TcvHospPatient.DoDoubleClickView(Sender: TObject);
begin
  PluginManager.DefaultOperation.Execute(iOperationCommand_Notify,
    [Integer(Self)]);
end;

function TcvHospPatient.GetPatientData: TcdHospPatient;
begin
  Result := TcdHospPatient(ViewData);
end;

function TcvHospPatient.GetPluginFlag: Integer;
begin
  Result := iOperationFlag_HospPatient;
end;

function TcvHospPatient.GetPluginLayoutGroup(AOperation: TBaseOperation)
  : TComponent;
var
  CurPluginCategory: string;
begin
  CurPluginCategory := AOperation.CustomAttributes.Values['PluginCategory'];
  if CurPluginCategory <> '' then
  begin
    // 为插件创建不同的栏
    if FPluginGroup = nil then
    begin
      FPluginGroup := ViewGroup.CreateGroup();
      FPluginGroup.Index := ToolBarGroup.Index + 1;
      FPluginGroup.LayoutDirection := ldHorizontal;
      FPluginGroup.ShowBorder := False;
    end;
    Result := FPluginGroup;

    if CurPluginCategory <> FLastPluginCategory then
      FPluginGroup.CreateItem(TdxLayoutSeparatorItem);

    FLastPluginCategory := CurPluginCategory;
  end
  else
    Result := ToolBarGroup;
end;

{ TcvHospReg }

procedure TcvHospReg.BuildViewLayout;
begin
  inherited;

  FRegData := THisData.Create(Self, HisConnection, sDataServiceHosp,
    'Hosp_Patient_Reg');
  FRegData.EnableBatchUpdate;
  FRegData.Source.AutoEdit := True;
  FRegData.OpenByFieldValue('HospID', FHospID);
  FRegData.Insert;
  FRegData.Save;

  ImageName := FRegData.CustomAttributes.Values['FormImageName'];
  DevExpress.BuildFormView(DialogGroup, FRegData);
end;

procedure TcvHospReg.DoDialogOK(Sender: TObject);
begin
  if ShowYesNo('是否提交入院登记信息') then
  begin
    HospService.DACommand.Execute('Pro_Hosp_Patient_Reg',
      [sFieldHospID, sFieldOpID, 'Xml'],
      ['', HisUser.ID, DataTable_GetXmlText(FRegData.Table)]);

    FHospID := HospService.GetCommandOutputParam(sFieldHospID);

    ModalResult := mrOk;

    HospService.PrintReg(FHospID);

    AppCore.Logger.WriteFmt('入院登记成功. 姓名:%s 住院号:%s',
      [RegData.AsString['PatientName'], FHospID], mtInfo, 1);
  end
end;

function TcvHospReg.DoExecute(CommandID: Integer;
  const Param: array of Variant): Variant;
begin
  Result := inherited DoExecute(CommandID, Param);

  FRegData.ClearAllFieldValues;

  if CommandID = iOperationCommand_ClinID then
  begin
    DataContainer.Items[sDataNameClinRegDict].OpenByKeyValue(Param[0]);
    ShowModal();
  end
  else if CommandID = iOperationCommand_Notify then
  begin
    if ShowModal = mrOk then
    begin
      TBaseView(Integer(Param[0])).DoExecute(iOperationCommand_Custom,
        [FHospID]);
    end;
  end;
end;

function TcvHospReg.GetPluginFlag: Integer;
begin
  Result := iOperationFlag_HospReg;
end;

function TcvHospReg.GetPluginLayoutGroup(AOperation: TBaseOperation)
  : TComponent;
begin
  Result := nil;
end;

{ TcvHospAdvice }

procedure TcvHospAdvice.BindMyPatientView(PatientView: TcvHospPatient);
begin
  if FMyPatientView.ViewData = nil then
    with FMyPatientView do
    begin
      FPatientView := PatientView;

      FMyPatientView.ViewData := FPatientView.ViewData;
      FMyPatientView.SetVisibleFields
        (FMyPatientView.ViewData.CustomAttributes.Values
        ['AdviceVisibleFields']);
      FMyPatientView.TableView.OptionsView.GroupByBox := False;
      FMyPatientView.TableView.OptionsView.Indicator := False;
      FMyPatientView.TableView.OptionsView.IndicatorWidth := 0;
      FMyPatientView.TableView.Filtering.Visible := fvNever;
      FMyPatientView.TableView.DataController.Filter.AddItem(nil,
        FMyPatientView.TableView.GetColumnByFieldName('HospSign'), foEqual,
        1, '状态=在院');
      FMyPatientView.TableView.DataController.Filter.Active := True;
    end;
end;

procedure TcvHospAdvice.BuildViewAction;
begin
  inherited;
end;

procedure TcvHospAdvice.BuildViewLayout;
begin
  inherited;

  FAdviceTypeView := TCardGridDataView.Create(Self);
  FAdviceTypeView.ViewData := TcdHospAdviceType.Create(Self);
  FAdviceTypeView.ToolBarGroup.Visible := False;
  FAdviceTypeView.IsEmbedded := True;
  FAdviceTypeView.BorderStyle := bsNone;
  FAdviceTypeView.Width := 250;
  FAdviceTypeView.Height := AppCore.ToolBarImage.ImageList.Height + 2;

  ToolBarGroup.ShowBorder := True;

  with ToolBarGroup.CreateItemForControl(FAdviceTypeView) do
  begin
    Index := 0;
    AlignVert := avCenter;
  end;

  ViewData := TcdHospAdvice.Create(Self, FAdviceLogicalName);
  ViewData.BindMaster(FAdviceTypeView.ViewData, 'AdviceTypeID');

  RecipeGroupWrapper.Wrap(Self);

  FMyPatientView := TTableGridDataView.Create(Self);
  FMyPatientView.IsEmbedded := True;
  FMyPatientView.Width := 160;
  FMyPatientView.BorderStyle := bsNone;
  FMyPatientView.ToolBarGroup.Visible := False;

  with ClientGroup do
  begin
    LayoutDirection := ldHorizontal;

    with CreateItemForControl(FMyPatientView) do
    begin
      AlignVert := avClient;
      Index := 0;
    end;
    CreateItem(TdxLayoutSplitterItem).Index := 1;
  end;
end;

procedure TcvHospAdvice.DataQuery;
begin
  AdviceData.FHospID := FHospID;
  AdviceData.QueryAfterMasterScroll;
end;

function TcvHospAdvice.DoExecute(CommandID: Integer;
  const Param: array of Variant): Variant;
begin
  if CommandID = iOperationCommand_Notify then
  begin
    BindMyPatientView(TcvHospPatient(Integer(Param[0])));
    with FPatientView.ViewData do
    begin
      if Eof then
        Exit;
    end;
    AppCore.MainView.ShowView(Self);
  end;
end;

procedure TcvHospAdvice.DoHideView;
begin
  inherited;
  FMyPatientView.OnRecordScroll := nil;
end;

procedure TcvHospAdvice.DoOnPatientScroll(Sender: TObject);
begin
  if FMyPatientView.ViewData <> nil then
  begin
    FHospID := FMyPatientView.ViewData.AsString[sFieldHospID];
    with FMyPatientView.ViewData do
      ToolBarGroup.Caption :=
        GetRecordText(CustomAttributes.Values['PatientInfoFields'], '  ');
  end
  else
  begin
    FHospID := '';
    ToolBarGroup.Caption := ''
  end;

  DataQuery;
end;

procedure TcvHospAdvice.DoShowView;
begin
  inherited;
  FMyPatientView.OnRecordScroll := DoOnPatientScroll;
  DoOnPatientScroll(nil);
end;

function TcvHospAdvice.GetAdviceData: TcdHospAdvice;
begin
  Result := TcdHospAdvice(ViewData);
end;

{ TcvHospAdviceEdit }

procedure TcvHospAdviceEdit.BuildViewAction;
begin
  inherited;
  BuildAction('复制', 'copy', '复制同组的医嘱', DoActionCopyUpdate, DoActionCopy,
    ShortCut(Ord('C'), [ssCtrl]), BTN_SHOWCAPTION);
  BuildAction('粘贴', 'paste', '粘贴医嘱', DoActionPasteUpdate, DoActionPaste,
    ShortCut(Ord('V'), [ssCtrl]), BTN_SHOWCAPTION);

  BuildAction('嘱套', 'group', '', nil, DoActionAddGroup, 0, BTN_SHOWCAPTION);
  BuildAction('停止', 'stop', '', DoActionStopUpdate, DoActionStop, 0,
    BTN_SHOWCAPTION);

  BuildAction('审核', 'check', '', DoActionCheckUpdate, DoActionCheck, 0,
    BTN_SHOWCAPTION).Visible := Assigned(HospService.OnAdviceCheck);
end;

procedure TcvHospAdviceEdit.BuildViewLayout;
begin
  FAdviceLogicalName := sDataNameHospAdvice;

  inherited;

  FTempAdviceData := TCustomData.Create(Self, HisConnection, sDataServiceHosp,
    'Hosp_AdviceCopy');
  FTempAdviceData.EnableBatchUpdate;
  FTempAdviceData.Open;

  AdviceData.OnAfterPost := DoAfterPost;

  SetDataEditing(True);

  FStopCheckBox := BuildDXCheckBox(Self, '显示停止医嘱', DoCheckBoxClick,
    False, clBlue);
  with ActionGroup.CreateItemForControl(FStopCheckBox) do
  begin
    Index := 0;
    AlignVert := avCenter;
  end;

  OnRecordScroll := DoRecordScroll;
end;

procedure TcvHospAdviceEdit.CopyEachSelected(Sender: TObject);
begin
  FTempAdviceData.Insert;
  DataTable_CopyCurrentRecord(AdviceData.Table, FTempAdviceData.Table);
  FTempAdviceData.Save;
end;

procedure TcvHospAdviceEdit.DoActionAddGroup(Sender: TObject);
begin
  if GetRecipeGroupDialog.Execute then
  begin

  end;
end;

procedure TcvHospAdviceEdit.DoActionCheck(Sender: TObject);
begin
  AdviceData.Save;
  HospService.OnAdviceCheck(ViewData);
end;

procedure TcvHospAdviceEdit.DoActionCheckUpdate(Sender: TObject);
begin

end;

procedure TcvHospAdviceEdit.DoActionCopy(Sender: TObject);
begin
  if not ViewData.Eof then
  begin
    FTempAdviceData.Table.ClearRows(True);
    FCopyGroupNum := AdviceData.GroupNum;
    if TableView.Controller.SelectedRecordCount > 1 then
    begin
      ForEachSelected(CopyEachSelected);
    end
    else if FCopyGroupNum < iDefaultGroupNum then
    begin
      DataTable_CopySelectedData(AdviceData, FTempAdviceData, IsRecordSelected);
    end
    else
    begin
      FTempAdviceData.Insert;
      DataTable_CopyCurrentRecord(AdviceData.Table, FTempAdviceData.Table);
      FTempAdviceData.Save;
    end;
  end;
end;

procedure TcvHospAdviceEdit.DoActionCopyUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := not ViewData.Eof;
end;

procedure TcvHospAdviceEdit.DoActionPaste(Sender: TObject);
begin
  DataTable_CopyAllData(FTempAdviceData, AdviceData);
end;

procedure TcvHospAdviceEdit.DoActionPasteUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := not FTempAdviceData.Eof;
end;

procedure TcvHospAdviceEdit.DoActionStop(Sender: TObject);
begin
  if ShowYesNo('确定停止本组医嘱吗? 停止后将不能再次启用.', True) then
  begin
    AdviceData.StopCurrentGroup;
  end;
end;

procedure TcvHospAdviceEdit.DoActionStopUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := CanEdit;
end;

procedure TcvHospAdviceEdit.DoAfterPost(Sender: TObject);
var
  ReturnValue: Integer;
  ReturnText: string;
begin
  HospService.DACommand.Execute('Pro_Hosp_Advice_Hint',
    ['OfficeID', 'OpID', 'AdviceID', 'Value', 'Hint'],
    [HisUser.OfficeID, HisUser.ID, AdviceData.AsInteger['AdviceID'], '0', '']);

  ReturnValue := HospService.GetCommandOutputParam('Value');
  ReturnText := HospService.GetCommandOutputParam('Hint');
  if ReturnText <> '' then
    AppCore.Logger.Write(ReturnText, mtInfo, ReturnValue);
end;

procedure TcvHospAdviceEdit.DoCheckBoxClick(Sender: TObject);
begin
  AdviceData.FShowStopAdvice := FStopCheckBox.Checked;
  DataQuery;
end;

procedure TcvHospAdviceEdit.DoOnSelectRecipeGroup(Sender: TObject);
begin
  AdviceData.DisableControls;
  try
    DataTable_CopySelectedData(FRecipeGroupDialog.GroupDetailData, AdviceData,
      'SelectFlag');
  finally
    AdviceData.EnableControls;
  end;

  AppCore.Logger.Write('住院协定处方添加完成：' + FRecipeGroupDialog.GroupMasterData.
    AsString['GroupName'], mtInfo, 1);
end;

procedure TcvHospAdviceEdit.DoRecordScroll(Sender: TObject);
begin
  AutoEdit := CanEdit;
end;

function TcvHospAdviceEdit.GetRecipeGroupDialog: TBaseRecipeGroupDialog;
begin
  if (FRecipeGroupDialog = nil) then
  begin
    FRecipeGroupDialog := TBaseRecipeGroupDialog.Create(Self, iUseArea_Hosp);
    FRecipeGroupDialog.OnSelectGroup := DoOnSelectRecipeGroup;
  end;
  Result := FRecipeGroupDialog;
end;

function TcvHospAdviceEdit.IsRecordSelected(Source: TDADataTable): Boolean;
begin
  Result := (AdviceData.GroupNum = FCopyGroupNum)
end;

{ TcvHospAdviceExec }

procedure TcvHospAdviceExec.BuildViewAction;
begin
  BuildAction('执行医嘱', 'exec', '', nil, DoActionExec, 0, BTN_SHOWCAPTION);
  inherited;
  ExportAction.Visible := False;
end;

procedure TcvHospAdviceExec.BuildViewLayout;
begin
  FAdviceLogicalName := 'Hosp_AdviceExec';
  inherited;
  ViewData.LogChanges := False;

  PeriodGroup.Visible := True;
  EndDateItem.Visible := False;
  BeginDateItem.Caption := '记账日期:';
  BeginDateEdit.Properties.OnChange := DoFeeDateChange;

end;

procedure TcvHospAdviceExec.DoActionExec(Sender: TObject);
begin
  if HospService.AdviceExec(AdviceData.FAdviceTypeID, BeginDate, FHospID,
    DataTable_GetSelectedCommaText(ViewData.Table, 'AdviceID', 'SelectFlag', 1)
    ) <> 0 then
    ShowWarning(HospService.GetCommandOutputParam('ReturnText'));
  DataQuery;
end;

procedure TcvHospAdviceExec.DoFeeDateChange(Sender: TObject);
begin
  AdviceData.FFeeDate := BeginDate;
  DataQuery;
end;

{ TcvHospDayBusiness }

procedure TcvHospDayBusiness.BuildViewLayout;
var
  ViewGroup, TempGroup: TdxLayoutGroup;
begin
  inherited;
  IsEmbedded := True;

  FBeginDateEdit := TcxDateEdit.Create(Self);
  FBeginDateEdit.Date := Date();

  FFeeDateEdit := TcxDateEdit.Create(Self);
  FFeeDateEdit.Date := Date() - 1;

  FPreviewCheckBox := BuildDXCheckBox(Self, '打印预览 ', nil, True, clBlue);

  ViewLayout.Align := alNone;
  ViewLayout.Items.AlignHorz := ahLeft;
  ViewLayout.Items.AlignVert := avTop;
  ViewLayout.Parent := Self;

  ViewGroup := ViewLayout.Items.CreateGroup();

  with ViewGroup do
  begin
    ShowBorder := False;
    LayoutDirection := ldHorizontal;

    TempGroup := CreateGroup();
    with TempGroup do
    begin
      LayoutDirection := ldHorizontal;
      ShowBorder := False;

      BuildLayoutToolBar(TempGroup,
        [BuildAction('接收入院', '', '', nil, DoActionInHospAccept, 0, 0),
        BuildAction('申请结算', '', '', nil, DoActionOutHospApply, 0, 0),
        BuildAction('查询申请单', '', '', nil, DoActionApplyQuery, 0, 0),
        BuildAction('查询费用', '', '', nil, DoActionFeeDetailQuery, 0, 0),
        BuildAction('调整额度', '', '', nil, DoActionAdjustCredit, 0, 0)]);
    end;
  end;
  ViewLayout.AutoSize := True;

  FAdviceCount := TcdHospAdviceCount.Create(Self);
  FAdviceCountTemp := TcdHospAdviceCountTemp.Create(Self);
end;

function TcvHospDayBusiness.DoExecute(CommandID: Integer;
  const Param: array of Variant): Variant;
begin
  if CommandID = iOperationCommand_PluginControl then
  begin
    FPatientView := TcvHospPatient(Integer(Param[0]));
    Result := Integer(ViewLayout);
  end
  else if CommandID = iOperationCommand_UnloadPlugin then
  begin
    ViewLayout.Parent := Self;
  end;
end;

procedure TcvHospDayBusiness.DoActionDayFee(Sender: TObject);
begin
  FPatientView.ForEachSelected(DoPrintDayFee);
end;

procedure TcvHospDayBusiness.DoPrintDayFee(Sender: TObject);
begin
  with FPatientView.ViewData do
    PrintReportFromServer('住院一日清单.fr3', [sFieldHospID, 'OfficeName', 'UnitName',
      'FeeDate'], [AsString[sFieldHospID], HisUser.OfficeName, HisUser.UnitName,
      FFeeDateEdit.Date], nil, FPreviewCheckBox.Checked,
      BusinessPrinters.GetBusinessPrinter(sPrinterHospDayFee));
end;

procedure TcvHospDayBusiness.DoActionGlue(Sender: TObject);
begin
  FPatientView.ForEachSelected(DoPrintGlue);
end;

procedure TcvHospDayBusiness.DoActionInjection(Sender: TObject);
begin
  FPatientView.ForEachSelected(DoPrintInjection);
end;

procedure TcvHospDayBusiness.DoPrintGlue(Sender: TObject);
begin
  with FPatientView.ViewData do
    if FAdviceCount.GetRegularCount(AsString[sFieldHospID]) > 0 then
      PrintReportFromServer('住院瓶贴.fr3', [sFieldHospID, 'OfficeName', 'OfficeID',
        'BeginDate', 'AdviceTypeID'], [AsString[sFieldHospID],
        HisUser.OfficeName, HisUser.OfficeID, FBeginDateEdit.Date,
        iHospAdviceType_Regular], nil, FPreviewCheckBox.Checked,
        BusinessPrinters.GetBusinessPrinter(sPrinterGlue))
    else
      AppCore.Logger.WriteFmt(sNoAdviceToPrint, [AsString['PatientName']],
        mtWarning, 0);
end;

procedure TcvHospDayBusiness.DoPrintInjection(Sender: TObject);
begin
  with FPatientView.ViewData do
    if FAdviceCount.GetRegularCount(AsString[sFieldHospID]) > 0 then
      PrintReportFromServer('住院注射单.fr3', [sFieldHospID, 'OfficeName',
        'OfficeID', 'BeginDate', 'AdviceTypeID'],
        [AsString[sFieldHospID], HisUser.OfficeName, HisUser.OfficeID,
        FBeginDateEdit.Date, iHospAdviceType_Regular], nil,
        FPreviewCheckBox.Checked, BusinessPrinters.GetBusinessPrinter
        (sPrinterInjection))
    else
      AppCore.Logger.WriteFmt(sNoAdviceToPrint, [AsString['PatientName']],
        mtWarning, 0);
end;

procedure TcvHospDayBusiness.DoActionGlueTemp(Sender: TObject);
begin
  FPatientView.ForEachSelected(DoPrintGlueTemp);
end;

procedure TcvHospDayBusiness.DoActionInjectionTemp(Sender: TObject);
begin
  FPatientView.ForEachSelected(DoPrintInjectionTemp);
end;

procedure TcvHospDayBusiness.DoPrintGlueTemp(Sender: TObject);
begin
  with FPatientView.ViewData do
    if FAdviceCountTemp.GetTempCount(AsString[sFieldHospID],
      FBeginDateEdit.Date) > 0 then
      PrintReportFromServer('住院瓶贴临时.fr3', [sFieldHospID, 'OfficeName',
        'OfficeID', 'BeginDate'], [AsString[sFieldHospID], HisUser.OfficeName,
        HisUser.OfficeID, FBeginDateEdit.Date], nil, FPreviewCheckBox.Checked,
        BusinessPrinters.GetBusinessPrinter(sPrinterGlue))
    else
      AppCore.Logger.WriteFmt(sNoAdviceToPrint, [AsString['PatientName']],
        mtWarning, 0);
end;

procedure TcvHospDayBusiness.DoPrintInjectionTemp(Sender: TObject);
begin
  with FPatientView.ViewData do
    if FAdviceCountTemp.GetTempCount(AsString[sFieldHospID],
      FBeginDateEdit.Date) > 0 then
      PrintReportFromServer('住院注射单临时.fr3', [sFieldHospID, 'OfficeName',
        'OfficeID', 'BeginDate'], [AsString[sFieldHospID], HisUser.OfficeName,
        HisUser.OfficeID, FBeginDateEdit.Date], nil, FPreviewCheckBox.Checked,
        BusinessPrinters.GetBusinessPrinter(sPrinterInjection))
    else
      AppCore.Logger.WriteFmt(sNoAdviceToPrint, [AsString['PatientName']],
        mtWarning, 0);
end;

procedure TcvHospDayBusiness.DoActionAdjustCredit(Sender: TObject);
var
  CreditMoney: Currency;
begin
  with FPatientView.ViewData do
    if not Eof and SameText(AsString[sFieldOfficeID], HisUser.OfficeID) then
    begin
      if FCreditData = nil then
      begin
        FCreditData := TCustomData.Create(Self, HisConnection, sDataServiceHosp,
          sDataNameHospCreditAdjust);
        FCreditData.MaxRecords := 0;
        FCreditData.LogChanges := False;
        FCreditData.Open;
      end;
      with FCreditData do
      begin
        Insert;
        if EditData(FCreditData) then
        begin
          CreditMoney := HospService.CreditAdjust
            (FPatientView.ViewData.AsString[sFieldHospID],
            AsString['AdjustType'], AsString['Memo'],
            AsCurrency['AdjustMoney']);
          FPatientView.ViewData.EditWithNoLogChanges(['CreditMoney'],
            [CreditMoney]);
          AppCore.Logger.Write('额度调整成功|' + FPatientView.ViewData.AsString
            [sFieldHospID], mtInfo, 1);
        end;
      end;
    end;
end;

procedure TcvHospDayBusiness.DoActionInHospAccept(Sender: TObject);
begin
  with FPatientView.ViewData do
    if not Eof and (SameText(AsString[sFieldOfficeID], HisUser.OfficeID) or
      HisUser.IsAdmin) then
    begin
      HospService.PatientChangeSign(AsString[sFieldHospID], iHospSign_Normal);
      EditWithNoLogChanges(['HospSign'], [iHospSign_Normal]);
      AppCore.Logger.Write(AsString[sFieldHospID] + ' 接收入院完成.', mtInfo, 1);
    end;
end;

procedure TcvHospDayBusiness.DoActionOutHospApply(Sender: TObject);
begin
  with FPatientView.ViewData do
    if not Eof and (SameText(AsString[sFieldOfficeID], HisUser.OfficeID) or
      HisUser.IsAdmin) then
    begin
      HospService.PatientChangeSign(AsString[sFieldHospID], iHospSign_OutApply);
      EditWithNoLogChanges(['HospSign'], [iHospSign_OutApply]);
      AppCore.Logger.Write(AsString[sFieldHospID] + ' 申请出院完成.', mtInfo, 1);
    end;
end;

procedure TcvHospDayBusiness.DoActionFeeDetailQuery(Sender: TObject);
begin
  with FPatientView.ViewData do
    if not Eof then
    begin
      AppCore.Operations.SearchOperation(sOperationIDHospFeeDetailQuery)
        .Execute(iOperationCommand_HospID, [AsString['HospID']]);
    end;
end;

procedure TcvHospDayBusiness.DoActionApplyQuery(Sender: TObject);
begin
  with FPatientView.ViewData do
    if not Eof then
    begin
      AppCore.Operations.SearchOperation(sOperationIDHospApplyQuery)
        .Execute(iOperationCommand_HospID, [AsString['HospID']]);
    end;
end;

{ TcdHospAdviceCount }

constructor TcdHospAdviceCount.Create(AOwner: TComponent);
begin
  inherited Create(AOwner, HisConnection, sDataServiceHosp, 'Hosp_AdviceCount');
end;

function TcdHospAdviceCount.GetRegularCount(const AHospID: string): Integer;
begin
  OpenByParam([sFieldHospID], [AHospID]);
  Result := AsInteger['AdviceCount'];
end;

{ TcdHospAdviceCountTemp }

constructor TcdHospAdviceCountTemp.Create(AOwner: TComponent);
begin
  inherited Create(AOwner, HisConnection, sDataServiceHosp,
    'Hosp_AdviceCountTemp');
end;

function TcdHospAdviceCountTemp.GetTempCount(const AHospID: string;
  ABeginDate: TDateTime): Integer;
begin
  OpenByParam([sFieldHospID, 'BeginDate'], [AHospID, ABeginDate]);
  Result := AsInteger['AdviceCount'];
end;

{ TcvHospFeeDetail }

procedure TcvHospFeeDetail.BuildViewAction;
begin
  inherited;
  BuildAction('冲减费用', '', '', DoActionCancelFeeUpdate, DoActionCancelFee, 0, 0);
end;

procedure TcvHospFeeDetail.BuildViewLayout;
begin
  inherited;

  SetOnlyOneDate;
  PeriodGroup.Visible := True;
  FHospIDEdit := TcxMaskEdit.Create(Self);
  SerialIDWrapper.Wrap(FHospIDEdit, swmYear, 6).OnSerialID := DoActionHospID;

  with ToolBarGroup do
  begin
    CreateItem(TdxLayoutSeparatorItem);
    with CreateItemForControl(FHospIDEdit) do
    begin
      Caption := '住院号:';
      AlignVert := avCenter;
    end;
  end;
  ViewData := TCustomData.Create(Self, HisConnection, sDataServiceHosp,
    'Pro_Hosp_FeeDetail_Query');
end;

procedure TcvHospFeeDetail.DataQuery;
begin
  if FHospIDEdit.Text = '' then
  begin
    FQueryID := 1;
    FQueryValue := '';
    DoQuery();
  end
  else
    DoActionHospID(nil);
end;

procedure TcvHospFeeDetail.DoActionCancelFee(Sender: TObject);
var
  Value: string;
  CancelQuan: Double;
begin
  Value := ViewData.AsString['Quan'];
  if DX_InputQuery('冲减住院费用', '冲减数量', '\d+\.?\d*', Value) then
  begin
    CancelQuan := StrToFloat(Value);
    HospService.FeeDetailCancel(ViewData.AsInteger['FeeDetailID'], '',
      CancelQuan);
    ViewData.EditWithNoLogChanges(['CancelSign'], [1]);
    AppCore.Logger.Write(ViewData.AsString['HospID'] + '费用冲减成功.', mtInfo, 1);
  end;
end;

procedure TcvHospFeeDetail.DoActionCancelFeeUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := not ViewData.Eof and
    (ViewData.AsInteger['CancelSign'] = 0)
end;

procedure TcvHospFeeDetail.DoActionHospID(Sender: TObject);
begin
  FQueryID := 2;
  FQueryValue := FHospIDEdit.Text;
  DoQuery;
end;

function TcvHospFeeDetail.DoExecute(CommandID: Integer;
  const Param: array of Variant): Variant;
begin
  Result := inherited DoExecute(CommandID, Param);

  if CommandID = iOperationCommand_Notify then
  begin
    FHospIDEdit.Text := TTableGridDataView(Integer(Param[0])).ViewData.AsString
      [sFieldHospID];
    DoActionHospID(FHospIDEdit);
    AppCore.MainView.ShowView(Self);
  end
  else if CommandID = iOperationCommand_HospID then
  begin
    FHospIDEdit.Text := Param[0];
    DoActionHospID(nil);
    AppCore.MainView.ShowView(Self);
  end
  else if CommandID = iOperationCommand_HospFeeID then
  begin
    FQueryID := 3;
    FHospIDEdit.Text := Param[0];
    FQueryValue := Param[1];

    DoQuery;
    AppCore.MainView.ShowView(Self);
  end;

end;

procedure TcvHospFeeDetail.DoQuery;
begin
  ViewData.OpenByParam(['OfficeID', 'OpID', 'QueryID', 'Value', 'BeginDate',
    'EndDate'], [HisUser.OfficeID, HisUser.ID, FQueryID, FQueryValue, BeginDate,
    BeginDate]);
end;

{ TOperationHospOfficeChange }

procedure TOperationHospOfficeChange.AfterConstruction;
begin
  inherited;

  BuildAction('接收转科', '', nil, DoActionReceiveChangeOffice, 0);
  BuildAction('转科记录', '', nil, DoActionShowChangeRecord, 0);
  BuildAction('取消转科', '', nil, DoActionCancelChangeOffice, 0);
end;

procedure TOperationHospOfficeChange.DoActionCancelChangeOffice
  (Sender: TObject);
begin
  with PluginContainer.ViewData do
    if not Eof and (AsInteger['HospSign'] = iHospSign_ChangeOffice) and
      SameText(AsString[sFieldOfficeID], HisUser.OfficeID) and
      ShowYesNo('确定取消转科吗?') then
    begin
      HospService.OfficeChangeCancel(AsString[sFieldHospID]);

      ShowOK(sMessageSuccess);
      EditWithNoLogChanges(['HospSign'], [iHospSign_Normal]);
    end;
end;

procedure TOperationHospOfficeChange.DoActionApplyChangeOffice(Sender: TObject);
begin
  with PluginContainer.ViewData do
    if not Eof and (AsInteger['HospSign'] = iHospSign_Normal) and
      SameText(AsString[sFieldOfficeID], HisUser.OfficeID) and
      DictIME.Start(nil, sDataNameSysHospOffice, '', '', nil) and
      ShowYesNo('确定申请转科吗?', False) then
    begin
      HospService.OfficeChangeApply(AsString[sFieldHospID],
        DictIME.DictData.AsString['OfficeID']);
      ShowOK(sMessageSuccess);
      EditWithNoLogChanges(['HospSign'], [iHospSign_ChangeOffice]);
    end;
end;

procedure TOperationHospOfficeChange.DoActionReceiveChangeOffice
  (Sender: TObject);
begin
  OfficeChangeData.OpenApply;

  if DictIME.StartIME(nil, OfficeChangeData, '', '', nil, False) then
  begin
    HospService.OfficeChangeAccept(DictIME.DictData.AsString[sFieldHospID]);
    PluginContainer.DataQuery;
    ShowOK(sMessageSuccess);
  end;
end;

procedure TOperationHospOfficeChange.DoActionShowChangeRecord(Sender: TObject);
begin
  OfficeChangeData.OpenHistory(PluginContainer.ViewData.AsString[sFieldHospID]);
  DictIME.StartIME(nil, OfficeChangeData, '', '', nil, False)
end;

function TOperationHospOfficeChange.DoExecute(CommandID: Integer;
  const Param: array of Variant): Variant;
begin
  Result := inherited DoExecute(CommandID, Param);

  if CommandID = iOperationCommand_Notify then
  begin
    DoActionApplyChangeOffice(nil);
  end;
end;

destructor TOperationHospOfficeChange.Destroy;
begin
  FOfficeChangeData.Free;
  inherited;
end;

function TOperationHospOfficeChange.GetPluginContainer: TcvHospPatient;
begin
  Result := TcvHospPatient(CustomAttributes.Objects
    [CustomAttributes.IndexOf('PluginContainer')]);
end;

function TOperationHospOfficeChange.GetOfficeChangeData: TcdHospOfficeChange;
begin
  if FOfficeChangeData = nil then
  begin
    FOfficeChangeData := TcdHospOfficeChange.Create(nil);
    FOfficeChangeData.LogChanges := False;
  end;
  Result := FOfficeChangeData;
end;

{ TOperationHospApply }

procedure TOperationHospApply.DoActionApplyCheck(Sender: TObject);
begin

  if FFeeGroupDialog = nil then
  begin
    FFeeGroupDialog := TBaseFeeGroupDialog.Create(Application, iUseArea_Hosp);
    FFeeGroupDialog.OnSelectGroup := DoOnSelectFeeGroup;
  end;
  FFeeGroupDialog.Execute();

  if FApplyList.Count > 0 then
    PrintReportFromServer('住院申请单.fr3', ['ApplyID', 'ApplyList'],
      [0, FApplyList.CommaText], nil, True);
end;

function TOperationHospApply.DoExecute(CommandID: Integer;
  const Param: array of Variant): Variant;
begin
  Result := inherited DoExecute(CommandID, Param);

  if FApplyList = nil then
    FApplyList := TStringList.Create;
  FApplyList.Clear;

  if CommandID = iOperationCommand_Notify then
  begin
    FPatientView := TcvHospPatient(Integer(Param[0]));
    if not FPatientView.ViewData.Eof then
    begin
      DoActionApplyCheck(nil);
    end;
  end;
end;

procedure TOperationHospApply.DoOnSelectFeeGroup(Sender: TObject);
var
  ApplyID: Integer;
begin
  if ShowYesNo(Format('确定安排在 %s 给 %s 做检查吗?',
    [DateTimeToStr(FFeeGroupDialog.CheckDate), FPatientView.ViewData.AsString
    ['PatientName']]), False) then
  begin
    AppCore.Logger.Write('正在添加申请单: ' + FFeeGroupDialog.GroupMasterData.AsString
      ['GroupName'], mtInfo, 0);

    ApplyID := HospService.ApplyCheck(FPatientView.ViewData.AsString
      [sFieldHospID], FFeeGroupDialog.GroupMasterData.GroupID,
      FFeeGroupDialog.GroupDetailData.GetSelectedDetailIDList,
      FFeeGroupDialog.ApplyMemo, FFeeGroupDialog.CheckDate,
      FFeeGroupDialog.ExtendSign);

    FApplyList.Add(IntToStr(ApplyID));
    AppCore.Logger.Write('申请单添加完成：' + FFeeGroupDialog.GroupMasterData.AsString
      ['GroupName'], mtInfo, 1);
  end;
end;

{ TcvHospPatientInOut }

procedure TcvHospPatientInOut.BuildViewLayout;
begin
  inherited;

  FHospIDEdit := TcxMaskEdit.Create(Self);
  SerialIDWrapper.Wrap(FHospIDEdit, swmYear, 6).OnSerialID := DoActionHospID;

  with ToolBarGroup do
  begin
    with CreateItemForControl(FHospIDEdit) do
    begin
      Caption := '住院号:';
      AlignVert := avCenter;
    end;
  end;

  FOfficeData := TCustomData.Create(Self, HisConnection, sDataServiceHosp,
    'Hosp_Office_Help');
  FOfficeData.Open;
  FOfficeData.LogChanges := False;
  FOfficeData.Source.AutoEdit := True;
  FOfficeData.FieldByName('OfficeID').OnChange := DoOfficeChange;
  DevExpress.BuildFormView(ToolBarGroup, FOfficeData);

  ViewData := TcdHospPatient.Create(Self);
  ViewData.LogChanges := False;
end;

procedure TcvHospPatientInOut.DataQuery;
begin
  if (FHospIDEdit.Text <> '') then
    PatientData.OpenByValue(FHospIDEdit.Text, BeginDate, EndDate)
  else
    DoOfficeChange(nil)
end;

procedure TcvHospPatientInOut.DoActionHospID(Sender: TObject);
begin
  DataQuery;
end;

function TcvHospPatientInOut.DoExecute(CommandID: Integer;
  const Param: array of Variant): Variant;
begin
  Result := inherited DoExecute(CommandID, Param);

  if CommandID = iOperationCommand_Custom then
  begin
    FHospIDEdit.Text := Param[0];
    DataQuery;
  end;
end;

procedure TcvHospPatientInOut.DoOfficeChange(Sender: TDACustomField);
begin
  PatientData.OpenByOfficeID(FOfficeData.AsString['OfficeID'],
    BeginDate, EndDate);
end;

function TcvHospPatientInOut.GetPatientData: TcdHospPatient;
begin
  Result := TcdHospPatient(ViewData);
end;

function TcvHospPatientInOut.GetPluginFlag: Integer;
begin
  Result := iOperationFlag_HospInOut;
end;

function TcvHospPatientInOut.GetPluginLayoutGroup(AOperation: TBaseOperation)
  : TComponent;
var
  CurPluginCategory: string;
begin
  CurPluginCategory := AOperation.CustomAttributes.Values['PluginCategory'];
  if CurPluginCategory <> '' then
  begin
    if FPluginGroup = nil then
    begin
      FPluginGroup := ViewGroup.CreateGroup();
      FPluginGroup.Index := ToolBarGroup.Index + 1;
      FPluginGroup.LayoutDirection := ldHorizontal;
      FPluginGroup.ShowBorder := False;
    end;
    Result := FPluginGroup;

    if CurPluginCategory <> FLastPluginCategory then
      FPluginGroup.CreateItem(TdxLayoutSeparatorItem);

    FLastPluginCategory := CurPluginCategory;
  end
  else
    Result := ToolBarGroup;
end;

{ TcvHospMedExec }

procedure TcvHospMedExec.BuildViewAction;
begin
  inherited;
  BuildAction('执行业务', 'exec', '', nil, DoActionMedExec, 0, BTN_SHOWCAPTION);
end;

procedure TcvHospMedExec.BuildViewLayout;
begin
  inherited;

  FBusinessCombo := TcxComboBox.Create(Self);
  FBusinessCombo.Properties.DropDownListStyle := lsFixedList;

  FHospIDEdit := TcxMaskEdit.Create(Self);
  SerialIDWrapper.Wrap(FHospIDEdit, swmYear, 6).OnSerialID := DoActionHospID;

  FItemList := TStringList.Create();
  FItemList.Capacity := 10000;

  PeriodGroup.Visible := True;
  BeginDate := Date - 1;
  EndDate := Date + 1;

  FPreviewCheckBox := BuildDXCheckBox(Self, '打印预览 ', nil, True, clBlue);

  FHospOfficeView := TTableGridDataView.Create(Self);
  with FHospOfficeView do
  begin
    ViewData := DataContainer.Items[sDataNameSysHospOffice];
    Width := AppCore.IniFile.ReadInteger(Self.ClassName, 'OfficeWidth', 120);
    BorderStyle := bsNone;
    ViewGroup.Caption := '住院科室';
    ViewGroup.ShowBorder := True;
    ToolBarGroup.Visible := False;
    IsEmbedded := True;
    OnRecordScroll := DoOfficeScroll;
  end;

  if FBusinessCombo.Properties.Items.Count > 1 then
    with PeriodGroup.CreateItemForControl(FBusinessCombo) do
    begin
      Caption := '业务:';
      AlignVert := avCenter;
    end;

  with PeriodGroup.CreateItemForControl(FHospIDEdit) do
  begin
    Caption := '住院号:';
    AlignVert := avCenter;
  end;

  with PeriodGroup.CreateItemForControl(FPreviewCheckBox) do
    AlignVert := avCenter;

  with ViewLayout.Items do
  begin
    LayoutDirection := ldHorizontal;

    with CreateItemForControl(FHospOfficeView) do
    begin
      Index := 0;
      AlignVert := avClient;
    end;

    with CreateItem(TdxLayoutSplitterItem) do
    begin
      Index := 1;
    end;
  end;

  ViewData := TCustomData.Create(Self, HisConnection, sDataServiceHosp,
    'Pro_Hosp_Med_ToExecute');

  FBusinessCombo.Properties.Items.CommaText := ViewData.CustomAttributes.Values
    ['BusinessItems'];
  FBusinessCombo.ItemIndex := 0;
  FBusinessCombo.Properties.OnChange := DoBusinessTypeChange;
end;

procedure TcvHospMedExec.DataQuery;
begin
  ViewData.OpenByParam(['BeginDate', 'EndDate', sFieldHospID, 'BusinessType',
    'ApplyOfficeID', 'ExecOfficeID', sFieldOpID],
    [BeginDate, EndDate, FHospIDEdit.Text, FBusinessCombo.ItemIndex,
    FHospOfficeView.ViewData.AsString[sFieldOfficeID], HisUser.OfficeID,
    HisUser.ID]);
end;

destructor TcvHospMedExec.Destroy;
begin
  FItemList.Free;
  AppCore.IniFile.WriteInteger(Self.ClassName, 'OfficeWidth',
    FHospOfficeView.Width);
  inherited;
end;

procedure TcvHospMedExec.DoActionHospID(Sender: TObject);
begin
  DataQuery();
end;

procedure TcvHospMedExec.DoActionMedExec(Sender: TObject);
var
  ApplyID: string;
begin
  if ShowYesNo('确定要执行当前业务吗?', True) then
  begin
    FItemList.Clear;
    FItemList.Add('<root>');
    EnumDataTable(ViewData.Table, DoBuildItemList, 0);
    FItemList.Add('</root>');

    Check(FItemList.Count < 3, '请选择执行项目');

    ApplyID := HospService.MedicineExec(FItemList.Text,
      FHospOfficeView.ViewData.AsString[sFieldOfficeID],
      FBusinessCombo.ItemIndex);

    AppCore.Logger.Write('业务执行成功.'#13#10'业务单号:' + ApplyID, mtInfo, 1);

    PrintReportFromServer('住院发药单.fr3', ['ApplyID'], [ApplyID], nil,
      FPreviewCheckBox.Checked);

    FHospIDEdit.Text := '';

    DataQuery;
  end;
end;

procedure TcvHospMedExec.DoBuildItemList(ADataTable: TDADataTable;
  AParam: Variant);
begin
  if ViewData.AsBoolean['SelectFlag'] then
  begin
    FItemList.Add('<id>' + ViewData.AsString['FeeDetailID'] + '</id>');
  end;
end;

procedure TcvHospMedExec.DoBusinessTypeChange(Sender: TObject);
begin
  DataQuery;
end;

procedure TcvHospMedExec.DoOfficeScroll(Sender: TObject);
begin
  DataQuery;
end;

{ TcvHospPayment }

procedure TcvHospPayment.BuildViewLayout;
begin
  inherited;

  Printing := True;
  PeriodGroup.Visible := True;

  FHospIDEdit := TcxMaskEdit.Create(Self);
  SerialIDWrapper.Wrap(FHospIDEdit, swmYear, 6).OnSerialID := DoActionHospID;

  with ToolBarGroup do
  begin
    CreateItem(TdxLayoutSeparatorItem);
    with CreateItemForControl(FHospIDEdit) do
    begin
      Caption := '住院号:';
      AlignVert := avCenter;
    end;
  end;

  ViewData := TcdHospPayment.Create(Self);
  ViewData.LogChanges := False;
end;

function TcvHospPayment.CanPrint: Boolean;
begin
  Result := not ViewData.Eof and (ViewData.AsString[sFieldOpID] = HisUser.ID)
end;

procedure TcvHospPayment.DataQuery;
begin
  if FHospIDEdit.Text <> '' then
    ViewData.OpenByFieldValue('HospID', FHospIDEdit.Text)
  else
    ViewData.OpenByBetween('PayID', FormatDateTime('YYYYMMDD', BeginDate),
      FormatDateTime('YYYYMMDD', EndDate + 1));
end;

procedure TcvHospPayment.DoActionHospID(Sender: TObject);
begin
  DataQuery;
end;

function TcvHospPayment.DoExecute(CommandID: Integer;
  const Param: array of Variant): Variant;
begin
  Result := inherited DoExecute(CommandID, Param);

  if CommandID = iOperationCommand_Notify then
  begin
    FHospIDEdit.Text := TTableGridDataView(Integer(Param[0])).ViewData.AsString
      [sFieldHospID];
    DoActionHospID(nil);;
    AppCore.MainView.ShowView(Self);
  end
  else if CommandID = iOperationCommand_HospID then
  begin
    FHospIDEdit.Text := Param[0];
    DoActionHospID(nil);
    AppCore.MainView.ShowView(Self);
  end
  else if CommandID = iOperationCommand_Custom then
  begin
    FormView.ToolBarGroup.Visible := False;
  end
  else if CommandID = iOperationCommand_BalanceID then
  begin
    TcdHospPayment(ViewData).OpenByBalanceID(Param[0]);
    AppCore.MainView.ShowView(Self);
  end;
end;

{ TcvHospPaymentAdd }

procedure TcvHospPaymentAdd.BuildViewLayout;
begin
  inherited;

  FPrepayData := TCustomData.Create(Self, HisConnection, sDataServiceHosp,
    'Hosp_Payment');
  FPrepayData.LogChanges := False;
  FPrepayData.Source.AutoEdit := True;
  FPrepayData.OpenByFieldValue('HospID', FHospID);
  FPrepayData.Insert;
  FPrepayData.Save;
  FPrepayData.FieldByName('PayMoney').OnChange := HospPrepayMoneyChange;

  ImageName := FPrepayData.DialogImage;
  DevExpress.BuildFormView(DialogGroup, FPrepayData);

  HospPrepayOpen();
end;

procedure TcvHospPaymentAdd.DoDialogOK(Sender: TObject);
begin
  if ShowYesNo('是否提交预收信息?') then
  begin

    HospService.DACommand.Execute('Pro_Hosp_Payment_Add',
      ['PayID', sFieldOpID, 'Xml'],
      ['', HisUser.ID, DataTable_GetXmlText(FPrepayData.Table)]);

    FPayID := HospService.GetCommandOutputParam('PayID');

    HospService.PrintPayment(FPayID);

    AppCore.Logger.WriteFmt('预收成功. 预收单号:%s 住院号:%s', [FPayID, FHospID],
      mtInfo, 1);

    ModalResult := mrOk;
  end;
end;

function TcvHospPaymentAdd.DoExecute(CommandID: Integer;
  const Param: array of Variant): Variant;
begin
  Result := inherited DoExecute(CommandID, Param);

  if CommandID = iOperationCommand_Notify then
  begin
    with TTableGridDataView(Integer(Param[0])).ViewData do
    begin
      FHospID := AsString[sFieldHospID];

      if (FHospID <> '') then
      begin
        FPrepayData.ClearAllFieldValues;
        FPrepayData.AsString[sFieldHospID] := FHospID;
        FPrepayData.AsString[sFieldPatientName] := AsString[sFieldPatientName];
        FPrepayData.AsString[sFieldOpID] := HisUser.ID;

        HospPrepayBegin();

        HospPrepayEnd(ShowModal = mrOk);
      end;
    end;
  end;
end;

procedure TcvHospPaymentAdd.HospPrepayBegin;
begin
  if Assigned(HospService.FVoiceHospPrepay) then
    HospService.FVoiceHospPrepay.HospPrepayBegin(FPrepayData);
end;

procedure TcvHospPaymentAdd.HospPrepayEnd(Success: Boolean);
begin
  if Assigned(HospService.FVoiceHospPrepay) then
    HospService.FVoiceHospPrepay.HospPrepayEnd(FPrepayData, Success);
end;

procedure TcvHospPaymentAdd.HospPrepayMoneyChange(Sender: TDACustomField);
begin
  if Assigned(HospService.FVoiceHospPrepay) then
    HospService.FVoiceHospPrepay.HospPrepayMoneyChange(FPrepayData);
end;

procedure TcvHospPaymentAdd.HospPrepayOpen;
begin
  if Assigned(HospService.FVoiceHospPrepay) then
    HospService.FVoiceHospPrepay.HospPrepayOpen();
end;

{ TcvHospFeeDialog }

procedure TcvHospFeeDialog.BuildDialog;
begin
  inherited;

  FFeeHelpData := TCustomData.Create(Self, HisConnection, sDataServiceHosp,
    'Hosp_FeeMaster_Help');
  FFeeHelpData.LogChanges := False;
  FFeeHelpData.Source.AutoEdit := True;
  FFeeHelpData.OpenByParam([sFieldHospID], [FHospID]);
  FFeeHelpData.FieldByName('YBMoney').OnChange := DoFieldChange;
  FFeeHelpData.FieldByName('XNHMoney').OnChange := DoFieldChange;
  FFeeHelpData.FieldByName('DiscountMoney').OnChange :=
    DoFieldDiscountMoneyChange;
  FFeeHelpData.FieldByName('PrepayMoney').OnChange := DoFieldPrepayMoneyChange;
  FFeeHelpData.FieldByName('PayMoney').OnChange := DoFieldPayMoneyChange;
  FFeeHelpData.FieldByName('GetMoney').OnChange := DoFieldGetMoneyChange;

  FPayData := TcdHospPayment.Create(Self);
  FPayData.LogChanges := False;
  FPayData.FieldByName('SelectFlag').Visible := True;
  FPayData.CustomAttributes.Add('MultiSelectField=SelectFlag');
  FPayData.OpenNotUsed('X');

  FPayView := TTableGridDataView.Create(Self);
  FPayView.ToolBarGroup.Visible := False;
  FPayView.BorderStyle := bsNone;
  FPayView.IsEmbedded := True;
  FPayView.ViewGroup.ShowBorder := True;
  FPayView.ViewGroup.Caption := '预收列表';
  FPayView.Height := 200;
  FPayView.ViewData := FPayData;
  FPayData.Table.AfterPost := DoCalcPayMoney;

  FFeeMasterData := TcdHospFeeMaster.Create(Self);
  FFeeMasterData.LogChanges := False;
  FFeeMasterData.FieldByName('SelectFlag').Visible := True;
  FFeeMasterData.CustomAttributes.Add('MultiSelectField=SelectFlag');
  FFeeMasterData.OpenByHospID('X');

  FFeeMasterView := TTableGridDataView.Create(Self);
  FFeeMasterView.ToolBarGroup.Visible := False;
  FFeeMasterView.BorderStyle := bsNone;
  FFeeMasterView.IsEmbedded := True;
  FFeeMasterView.ViewGroup.ShowBorder := True;
  FFeeMasterView.ViewGroup.Caption := '已结算发票列表';
  FFeeMasterView.ViewData := FFeeMasterData;
  FFeeMasterView.Height := 160;

  with DialogGroup do
  begin
    with CreateItemForControl(FFeeMasterView) do
    begin
      AlignVert := avTop;
    end;
    with CreateItemForControl(FPayView) do
    begin
      AlignVert := avTop;
    end;

    FFeeGroup := CreateGroup();
    DevExpress.BuildFormView(FFeeGroup, FFeeHelpData);
  end;

  if HospService.VoiceHospFee <> nil then
    HospService.VoiceHospFee.HospFeeOpen();
end;

procedure TcvHospFeeDialog.DoActionHospFeeTake(Sender: TObject);
var
  GetMoney, ChargeMoney: Double;
begin
  with FFeeHelpData do
  begin
    Edit;
    AsString['PrepayIDList'] := DataTable_GetSelectedCommaText(FPayData.Table,
      'PayID', 'SelectFlag', 1);
    AsString['HospFeeIDList'] := DataTable_GetSelectedCommaText
      (FFeeMasterData.Table, 'HospFeeID', 'SelectFlag', 1);

    if ShowYesNo('确定提交住院结算收费信息吗?', False) then
    begin
      HospService.FeeMasterCheck(FFeeHelpData);
      if Assigned(FFeeCallback) then
        FFeeCallback(Self);

      Edit;
      AsInteger['YBID'] := FYBID;
      AsInteger['XNHID'] := FXNHID;
      FHospFeeID := HospService.FeeMasterTake(FFeeHelpData);
      AppCore.Logger.Write('住院收费成功|住院号=' + FHospID + '|发票号=' + FHospFeeID,
        mtInfo, 1);
      HospService.PrintFeeMaster(FHospFeeID);
      ModalResult := mrOk;
    end;
  end
end;

procedure TcvHospFeeDialog.DoCalcPayMoney(Sender: TDADataTable);
begin
  FFeeHelpData.Edit;

  FFeeHelpData.AsCurrency['PrepayMoney'] :=
    DataTable_GetSelectedSum(FPayData.Table, 'PayMoney', 'SelectFlag', 1);

end;

procedure TcvHospFeeDialog.DoDialogOK;
begin
  DoActionHospFeeTake(nil);
end;

function TcvHospFeeDialog.DoExecute(CommandID: Integer;
  const Param: array of Variant): Variant;
var
  FeeProc: THospFeeProc;
begin
  if CommandID = iOperationCommand_Notify then
  begin
    FPatientView := TcvHospPatientInOut(Integer(Param[0]));
    if FPatientView.PatientData.Eof then
      Exit;

    FHospID := FPatientView.PatientData.HospID;

    // 锁帐
    HospService.PatientChangeSign(FHospID, iHospSign_OutLock);
    try

      with FPatientView do
      begin
        if not ViewData.Eof then
        begin
          FFeeGroup.Caption := ViewData.GetRecordText
            (ViewData.CustomAttributes.Values['PatientInfoFields'], '  ');

          FFeeHelpData.OpenByParam([sFieldHospID], [FHospID]);

          if HospService.VoiceHospFee <> nil then
            HospService.VoiceHospFee.HospFeeBegin(ViewData);

          FeeProc := GetHospFeeProc(FPatientView.PatientData.PatientTypeID);
          if Assigned(FeeProc) then
            Result := FeeProc(Self)
          else
          begin
            Result := StartFee(iHospFeeType_Norm, 0, 0, nil);
          end;
        end;
      end;
    finally
      HospService.PatientChangeSign(FHospID, iHospSign_OutUnlock);
    end;
  end;
end;

procedure TcvHospFeeDialog.DoFieldChange(Sender: TDACustomField);
begin
  FFeeHelpData.AsCurrency['CashMoney'] := FFeeHelpData.AsCurrency['SumPrice'] -
    FFeeHelpData.AsCurrency['DiscountMoney'] - FFeeHelpData.AsCurrency
    ['YBMoney'] - FFeeHelpData.AsCurrency['XNHMoney'] - FFeeHelpData.AsCurrency
    ['PrepayMoney'] - FFeeHelpData.AsCurrency['PayMoney'];

  FFeeHelpData.AsCurrency['ChargeMoney'] := FFeeHelpData.AsCurrency['GetMoney']
    - FFeeHelpData.AsCurrency['CashMoney'];
end;

procedure TcvHospFeeDialog.DoFieldDiscountMoneyChange(Sender: TDACustomField);
begin
  DoFieldChange(Sender);
  if HospService.VoiceHospFee <> nil then
    HospService.VoiceHospFee.HospFeeDiscountMoney(FFeeHelpData);
end;

procedure TcvHospFeeDialog.DoFieldGetMoneyChange(Sender: TDACustomField);
begin
  DoFieldChange(Sender);
  if HospService.VoiceHospFee <> nil then
    HospService.VoiceHospFee.HospFeeGetMoney(FFeeHelpData);
end;

procedure TcvHospFeeDialog.DoFieldPayMoneyChange(Sender: TDACustomField);
begin
  DoFieldChange(Sender);
  if HospService.VoiceHospFee <> nil then
    HospService.VoiceHospFee.HospFeePayMoney(FFeeHelpData);
end;

procedure TcvHospFeeDialog.DoFieldPrepayMoneyChange(Sender: TDACustomField);
begin
  DoFieldChange(Sender);
  if HospService.VoiceHospFee <> nil then
    HospService.VoiceHospFee.HospFeePrepayMoney(FFeeHelpData);
end;

function TcvHospFeeDialog.GetSumPrice: Currency;
begin
  Result := FFeeHelpData.AsCurrency['SumPrice'];
end;

function TcvHospFeeDialog.StartFee(AFeeTypeID: Integer;
  AYBMoney, AXNHMoney: Currency; AFeeCallback: THospFeeCallback): Boolean;
begin
  FYBID := 0;
  FXNHID := 0;
  FFeeCallback := AFeeCallback;

  FFeeHelpData.Edit;
  // FFeeHelpData.AsString[sFieldHospID] := FHospID;
  FFeeHelpData.AsCurrency['YBMoney'] := AYBMoney;
  FFeeHelpData.AsCurrency['XNHMoney'] := AXNHMoney;
  FFeeHelpData.AsString[sFieldOpID] := HisUser.ID;
  FFeeHelpData.AsInteger['FeeTypeID'] := AFeeTypeID;

  FPayData.OpenNotUsed(FHospID);
  FFeeMasterData.OpenNormal(FHospID);

  if HospService.VoiceHospFee <> nil then
    HospService.VoiceHospFee.HospFeeSumMoney(FFeeHelpData);

  Result := Execute();

  if HospService.VoiceHospFee <> nil then
    HospService.VoiceHospFee.HospFeeEnd(FFeeHelpData, Result);
end;

{ TcvHospFeeMaster }

procedure TcvHospFeeMaster.BuildViewAction;
begin
  inherited;
  SetActionVisible(CancelAction, True);
  ResetActionCaption(CancelAction, '取消收费');
end;

procedure TcvHospFeeMaster.BuildViewLayout;
begin
  inherited;

  FInvoiceEdit := TcxMaskEdit.Create(Self);
  SerialIDWrapper.Wrap(FInvoiceEdit).OnSerialID := DoInvoiceIDEvent;

  FHospIDEdit := TcxMaskEdit.Create(Self);
  SerialIDWrapper.Wrap(FHospIDEdit, swmYear, 6).OnSerialID := DoHospIDEvent;

  with ToolBarGroup do
  begin
    CreateItem(TdxLayoutSeparatorItem);

    with CreateItemForControl(FInvoiceEdit) do
    begin
      AlignVert := avCenter;
      Caption := '发票号:';
    end;

    CreateItem(TdxLayoutSeparatorItem);

    with CreateItemForControl(FHospIDEdit) do
    begin
      AlignVert := avCenter;
      Caption := '住院号:';
    end;
  end;

  Printing := True;
  OnDoubleClickView := DoDetailAction;

  PeriodGroup.Visible := True;
  ViewData := TcdHospFeeMaster.Create(Self);
end;

function TcvHospFeeMaster.CanCancel: Boolean;
begin
  Result := (not ViewData.Eof)
  // and ((ViewData.AsString[sFieldOpID] = HisUser.ID)
  // or (HisUser.HaveAccess(sAccessHospFeeCancel)));
end;

procedure TcvHospFeeMaster.DataCancel;
begin
  if ShowYesNo('确定取消住院收费吗?', False) then
  begin
    // AppCore.Logger.Write('正在取消住院收费|' + ViewData.AsString[sFieldHospFeeID], mtInfo, 0);
    //
    // HospService.DACommand.Execute('Pro_Hosp_FeeMaster_Cancel',
    // [sFieldHospFeeID, sFieldOpID],
    // [ViewData.AsString[sFieldHospFeeID], HisUser.ID]);
    //
    // AppCore.Logger.Write('取消住院收费成功|' + ViewData.AsString[sFieldHospFeeID], mtInfo, 1);
    //
    // if Assigned(AfterCancelHospFeeProc) then
    // AfterCancelHospFeeProc(ViewData);
    HospService.FeeMasterCancel(ViewData);
  end;
end;

procedure TcvHospFeeMaster.DataQuery;
begin
  if HisUser.HaveAccess(sAccessHospStat) then
    ViewData.OpenByList(['FeeTime', 'FeeTime'], [BeginDate, EndDate + 1],
      [dboGreaterOrEqual, dboLess], [dboAnd])
  else
    ViewData.OpenByList(['FeeTime', 'FeeTime', 'OpID'],
      [BeginDate, EndDate + 1, HisUser.ID], [dboGreaterOrEqual, dboLess,
      dboEqual], [dboAnd, dboAnd]);
end;

procedure TcvHospFeeMaster.DoDetailAction(Sender: TObject);
begin
  AppCore.Operations.SearchOperation(sOperationIDHospFeeDetailQuery)
    .Execute(iOperationCommand_HospFeeID, [ViewData.AsString['HospID'],
    ViewData.AsString['HospFeeID']]);
end;

function TcvHospFeeMaster.DoExecute(CommandID: Integer;
  const Param: array of Variant): Variant;
begin
  Result := inherited DoExecute(CommandID, Param);

  if CommandID = iOperationCommand_Notify then
  begin
    FHospIDEdit.Text := TTableGridDataView(Integer(Param[0])).ViewData.AsString
      [sFieldHospID];
    DoHospIDEvent(nil);
    AppCore.MainView.ShowView(Self);
  end
  // 按结算号查询
  else if CommandID = iOperationCommand_BalanceID then
  begin
    TcdHospFeeMaster(ViewData).OpenByBalanceID(Param[0]);
    AppCore.MainView.ShowView(Self);
  end
  else if CommandID = iOperationCommand_HospID then
  begin
    FHospIDEdit.Text := Param[0];
    DoHospIDEvent(nil);
    AppCore.MainView.ShowView(Self);
  end
  else if CommandID = iOperationCommand_HospFeeID then
  begin
    TcdHospFeeMaster(ViewData).OpenByHospFeeID(Param[0]);
    AppCore.MainView.ShowView(Self);
  end;
end;

procedure TcvHospFeeMaster.DoHospIDEvent(Sender: TObject);
begin
  TcdHospFeeMaster(ViewData).OpenByHospID(FHospIDEdit.Text);
end;

procedure TcvHospFeeMaster.DoInvoiceIDEvent(Sender: TObject);
begin
  TcdHospFeeMaster(ViewData).OpenByHospFeeID(FInvoiceEdit.Text);
end;

{ TcvHospPaymentBalance }

procedure TcvHospPaymentBalance.DataQuery;
begin
  TcdHospPayment(ViewData).OpenNotBalanced(EndDate + 1, HisUser.ID);
end;

procedure TcvHospPaymentBalance.DoBalanceAction(Sender: TObject);
var
  BalanceID: Integer;
begin
  if ShowYesNo(sBalanceConfirm) then
    try
      BalanceID := HospService.PaymentBalance(EndDate + 1);
      AppCore.Logger.Write('住院预收缴款成功|单号=' + IntToStr(BalanceID), mtInfo, 1);
    finally
      DataQuery;
    end;
end;

procedure TcvHospPaymentBalance.DoBalanceActionUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := ViewData.Table.Active and
    (ViewData.Table.RecordCount > 0);
end;

procedure TcvHospPaymentBalance.BuildViewLayout;
begin
  inherited;
  PeriodGroup.Visible := True;
  BeginDateItem.Visible := False;
  Printing := False;
  ViewData := TcdHospPayment.Create(Self);
end;

procedure TcvHospPaymentBalance.BuildViewAction;
begin
  inherited;
  BuildAction('确定结算', 'verify', '', DoBalanceActionUpdate, DoBalanceAction, 0,
    BTN_SHOWCAPTION);
end;

{ TcvHospFeeBalance }

procedure TcvHospFeeBalance.DataQuery;
begin
  TcdHospFeeMaster(ViewData).OpenNotBalanced(EndDate + 1, HisUser.ID);
end;

procedure TcvHospFeeBalance.DoBalanceAction(Sender: TObject);
var
  BalanceID: Integer;
begin
  if ShowYesNo(sBalanceConfirm) then
    try
      BalanceID := HospService.FeeBalance(EndDate + 1);
      AppCore.Logger.Write('住院收费缴款成功|单号=' + IntToStr(BalanceID), mtInfo, 1);
    finally
      DataQuery;
    end;
end;

procedure TcvHospFeeBalance.DoBalanceActionUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := ViewData.Table.Active and
    (ViewData.Table.RecordCount > 0);
end;

procedure TcvHospFeeBalance.BuildViewLayout;
begin
  inherited;
  PeriodGroup.Visible := True;
  BeginDateItem.Visible := False;
  Printing := False;
  ViewData := TcdHospFeeMaster.Create(Self);
end;

procedure TcvHospFeeBalance.BuildViewAction;
begin
  inherited;
  BuildAction('确定结算', 'verify', '', DoBalanceActionUpdate, DoBalanceAction, 0,
    BTN_SHOWCAPTION);
end;

{ TOperationHospOutCheck }

procedure TOperationHospOutCheck.AfterConstruction;
begin
  inherited;
  BuildAction('出院召回', '', nil, DoActionOutReturn, 0);
end;

procedure TOperationHospOutCheck.DoActionOutCheck(Sender: TObject);
begin
  with GetPluginContainer.ViewData do
    if not Eof and ShowYesNo('确定审核出院?') then
    begin
      HospService.PatientChangeSign(AsString[sFieldHospID], iHospSign_Out);
      EditWithNoLogChanges(['HospSign'], [iHospSign_Out]);
      AppCore.Logger.Write(AsString[sFieldHospID] + ' 审核出院完成.', mtInfo, 1);
    end;
end;

procedure TOperationHospOutCheck.DoActionOutReturn(Sender: TObject);
begin
  with GetPluginContainer.ViewData do
    if not Eof and ShowYesNo('确定召回患者?') then
    begin
      HospService.PatientChangeSign(AsString[sFieldHospID],
        iHospSign_OutReturn);
      EditWithNoLogChanges(['HospSign'], [iHospSign_OutReturn]);
      AppCore.Logger.Write(AsString[sFieldHospID] + ' 出院召回完成.', mtInfo, 1);
    end;
end;

function TOperationHospOutCheck.DoExecute(CommandID: Integer;
  const Param: array of Variant): Variant;
begin
  Result := inherited DoExecute(CommandID, Param);

  if CommandID = iOperationCommand_Notify then
  begin
    DoActionOutCheck(nil);
  end;
end;

function TOperationHospOutCheck.GetPluginContainer: TcvHospPatientInOut;
begin
  Result := TcvHospPatientInOut(CustomAttributes.Objects
    [CustomAttributes.IndexOf('PluginContainer')]);
end;

{ TOperationHospInOutQuery }

procedure TOperationHospInOutQuery.AfterConstruction;
begin
  inherited;
  BuildAction('住院费用明细查询', '', nil, DoActionQueryFeeDetail, 0);
  BuildAction('住院预收查询', '', nil, DoActionQueryPrepay, 0);
end;

procedure TOperationHospInOutQuery.DoActionQueryFeeDetail(Sender: TObject);
begin
  with GetPluginContainer.ViewData do
    if not Eof then
    begin
      AppCore.Operations.SearchOperation(sOperationIDHospFeeDetailQuery)
        .Execute(iOperationCommand_HospID, [AsString['HospID']]);
    end;
end;

procedure TOperationHospInOutQuery.DoActionQueryFeeMaster(Sender: TObject);
begin
  with GetPluginContainer.ViewData do
    if not Eof then
      AppCore.Operations.SearchOperation(sOperationIDHospFeeMasterQuery)
        .Execute(iOperationCommand_HospID, [AsString['HospID']]);
end;

procedure TOperationHospInOutQuery.DoActionQueryPrepay(Sender: TObject);
begin
  with GetPluginContainer.ViewData do
    if not Eof then
      AppCore.Operations.SearchOperation(sOperationIDHospPayment)
        .Execute(iOperationCommand_HospID, [AsString['HospID']]);
end;

function TOperationHospInOutQuery.DoExecute(CommandID: Integer;
  const Param: array of Variant): Variant;
begin
  Result := inherited DoExecute(CommandID, Param);

  if CommandID = iOperationCommand_Notify then
  begin
    DoActionQueryFeeMaster(nil);
  end;
end;

function TOperationHospInOutQuery.GetPluginContainer: TcvHospPatientInOut;
begin
  Result := TcvHospPatientInOut(CustomAttributes.Objects
    [CustomAttributes.IndexOf('PluginContainer')]);
end;

{ TcdHospMyOfficeBed }

procedure TcdHospMyOfficeBed.Open;
begin
  Close();
  Table.ParamByName('OfficeID').AsString := HisUser.OfficeID;
  inherited;
end;

{ TcvHospApplyView }

procedure TcvHospApplyView.BuildViewAction;
begin
  inherited;
  BuildAction('执行', 'exec', '执行申请单', nil, DoActionExecute, 0, BTN_SHOWCAPTION);
  BuildAction('取消', 'cancel', '取消申请单', nil, DoActionCancel, 0, BTN_SHOWCAPTION);
end;

procedure TcvHospApplyView.BuildViewLayout;
begin
  inherited;
  PeriodGroup.Visible := True;
  ViewGroup.ShowBorder := True;
  ViewGroup.Caption := '申请单列表';

  FHospIDEdit := TcxMaskEdit.Create(Self);
  SerialIDWrapper.Wrap(FHospIDEdit, swmYear, 6).OnSerialID := DoHospIDEvent;

  ViewData := TCustomData.Create(Self, HisConnection, sDataServiceHosp,
    'Hosp_ApplyMaster');
  ViewData.LogChanges := False;

  FDetailData := TcdHospFeeDetail.Create(Self);
  FDetailData.BindMaster(ViewData, 'ApplyID');

  FDetailView := TTableGridDataView.Create(Self);
  FDetailView.BorderStyle := bsNone;
  FDetailView.IsEmbedded := True;
  FDetailView.ToolBarGroup.Visible := False;
  FDetailView.ViewGroup.ShowBorder := True;
  FDetailView.ViewGroup.Caption := '申请单明细';
  FDetailView.ViewData := FDetailData;

  with ToolBarGroup do
  begin
    with CreateItemForControl(FHospIDEdit) do
    begin
      Caption := '住院号:';
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

procedure TcvHospApplyView.DataQuery;
begin
  if FHospIDEdit.Text <> '' then
    DoHospIDEvent(nil)
  else if HisUser.HaveAccess(sAccessHospStat) then
    ViewData.OpenByPeriod('ApplyTime', BeginDate, EndDate + 1)
  else
    ViewData.OpenByList(['ApplyOfficeID', 'ExecOfficeID', 'ApplyTime',
      'ApplyTime'], [HisUser.OfficeID, HisUser.OfficeID, BeginDate,
      EndDate + 1], [dboEqual, dboEqual, dboGreaterOrEqual, dboLessOrEqual],
      [dboOr, dboAnd, dboAnd]);
end;

procedure TcvHospApplyView.DoActionCancel(Sender: TObject);
begin
  with ViewData do
    if not Eof and ShowYesNo('确定取消申请单吗?', False) then
    begin
      HospService.DACommand.Execute('Pro_Hosp_ApplyMaster_Cancel',
        ['ApplyID', sFieldOfficeID, sFieldOpID],
        [AsInteger['ApplyID'], HisUser.OfficeID, HisUser.ID]);

      EditWithNoLogChanges(['ExecSign'], [2]);

      AppCore.Logger.Write('申请单取消成功|' + AsString['ApplyID'], mtInfo, 1);
    end;
end;

procedure TcvHospApplyView.DoActionExecute(Sender: TObject);
begin
  with ViewData do
    if not Eof and ShowYesNo('确定执行申请单吗?', False) then
    begin
      HospService.DACommand.Execute('Pro_Hosp_ApplyMaster_Execute',
        ['ApplyID', sFieldOfficeID, sFieldOpID],
        [AsInteger['ApplyID'], HisUser.OfficeID, HisUser.ID]);

      EditWithNoLogChanges(['ExecSign'], [1]);

      AppCore.Logger.Write('申请单执行完成|' + AsString['ApplyID'], mtInfo, 1);
    end;
end;

function TcvHospApplyView.DoExecute(CommandID: Integer;
  const Param: array of Variant): Variant;
begin
  Result := inherited DoExecute(CommandID, Param);

  if CommandID = iOperationCommand_Notify then
  begin
    FHospIDEdit.Text := TTableGridDataView(Integer(Param[0])).ViewData.AsString
      [sFieldHospID];
    DoHospIDEvent(nil);
    AppCore.MainView.ShowView(Self);
  end
  else if CommandID = iOperationCommand_HospID then
  begin
    FHospIDEdit.Text := Param[0];
    DoHospIDEvent(nil);
    AppCore.MainView.ShowView(Self);
  end
end;

procedure TcvHospApplyView.DoHospIDEvent(Sender: TObject);
begin
  ViewData.OpenByFieldValue(sFieldHospID, FHospIDEdit.Text);
end;

{ TcvHospMiscBusiness }

procedure TcvHospMiscBusiness.BuildViewLayout;
var
  ViewGroup, TempGroup: TdxLayoutGroup;
begin
  inherited;

  ViewLayout.Align := alNone;
  ViewLayout.Items.AlignHorz := ahLeft;
  ViewLayout.Items.AlignVert := avTop;
  ViewLayout.Parent := Self;

  ViewGroup := ViewLayout.Items.CreateGroup();

  with ViewGroup do
  begin
    ShowBorder := False;
    LayoutDirection := ldHorizontal;

    TempGroup := CreateGroup();

    with TempGroup do
    begin
      LayoutDirection := ldHorizontal;
      ShowBorder := False;
    end;

    BuildLayoutToolBar(TempGroup, [BuildAction('费用统计', '', '', nil,
      DoActionFeeStat, 0, 0), BuildAction('去门诊', '', '', nil, DoActionToClinic,
      0, 0), BuildAction('母婴登记', '', '', nil, DoActionBaby, 0, 0)]);
  end;

  ViewLayout.AutoSize := True;
end;

procedure TcvHospMiscBusiness.DoActionBaby(Sender: TObject);
begin
  with FPatientView.ViewData do
    if not Eof and (SameText(AsString[sFieldOfficeID], HisUser.OfficeID) or
      HisUser.IsAdmin) then
    begin
      if (FBabyView = nil) then
        FBabyView := TcvHospBaby.Create(Self);

      FBabyView.PatientView := FPatientView;

      FBabyView.ShowModal;
    end;
end;

procedure TcvHospMiscBusiness.DoActionFeeStat(Sender: TObject);
begin
  with FPatientView.ViewData do
    if not Eof then
    begin
      if (FFeeStatView = nil) then
        FFeeStatView := TcvHospFeeStat.Create(Self);

      FFeeStatView.DoExecute(iOperationCommand_HospID, [AsString[sFieldHospID]])
    end;
end;

procedure TcvHospMiscBusiness.DoActionToClinic(Sender: TObject);
begin
  with FPatientView.ViewData do
    if not Eof then
    begin
      AppCore.Operations.SearchOperation(sOperationIDClinCenter)
        .Execute(iOperationCommand_ClinID, [AsString[sFieldClinID]]);
    end;
end;

function TcvHospMiscBusiness.DoExecute(CommandID: Integer;
  const Param: array of Variant): Variant;
begin
  if CommandID = iOperationCommand_PluginControl then
  begin
    FPatientView := TcvHospPatient(Integer(Param[0]));
    Result := Integer(ViewLayout);
  end
  else if CommandID = iOperationCommand_UnloadPlugin then
  begin
    ViewLayout.Parent := Self;
  end;
end;

function TcvHospMiscBusiness.GetPluginFlag: Integer;
begin
  Result := iOperationFlag_HospPatientMisc;
end;

function TcvHospMiscBusiness.GetPluginLayoutGroup(AOperation: TBaseOperation)
  : TComponent;
begin
  if FPluginGroup = nil then
  begin
    FPluginGroup := ViewLayout.Items.CreateGroup();
    FPluginGroup.LayoutDirection := ldHorizontal;
    FPluginGroup.ShowBorder := False;
  end;
  Result := FPluginGroup;
end;

{ TcvHospSignBill }

procedure TcvHospSignBill.BuildDialog;
begin
  inherited;
  Caption := '住院挂账处理';

  FSignBillData := TCustomData.Create(Self, HisConnection, sDataServiceHosp,
    'Hosp_FeeMaster_SignBill');
  FSignBillData.LogChanges := False;
  FSignBillData.Source.AutoEdit := True;
  FSignBillData.Open;
  FSignBillData.FieldByName('PrepayMoney').OnChange := DoFieldChange;
  FSignBillData.FieldByName('BillMoney').OnChange := DoFieldChange;

  FFeeMasterData := TcdHospFeeMaster.Create(Self);
  FFeeMasterData.LogChanges := False;
  FFeeMasterData.OpenByHospID('');
  FFeeMasterData.OnScroll := DoFeeMasterScroll;

  FFeeMasterView := TTableGridDataView.Create(Self);
  FFeeMasterView.ToolBarGroup.Visible := False;
  FFeeMasterView.BorderStyle := bsNone;
  FFeeMasterView.IsEmbedded := True;
  FFeeMasterView.ViewGroup.ShowBorder := True;
  FFeeMasterView.ViewGroup.Caption := '挂账发票';
  FFeeMasterView.ViewData := FFeeMasterData;
  FFeeMasterView.Height := 160;

  FPayData := TcdHospPayment.Create(Self);
  FPayData.LogChanges := False;
  FPayData.FieldByName('SelectFlag').Visible := True;
  FPayData.CustomAttributes.Add('MultiSelectField=SelectFlag');
  FPayData.OpenNotUsed('');

  FPayView := TTableGridDataView.Create(Self);
  FPayView.ToolBarGroup.Visible := False;
  FPayView.BorderStyle := bsNone;
  FPayView.IsEmbedded := True;
  FPayView.ViewGroup.ShowBorder := True;
  FPayView.ViewGroup.Caption := '预收列表';
  FPayView.Height := 200;
  FPayView.ViewData := FPayData;
  FPayData.Table.AfterPost := DoCalcPayMoney;

  with DialogGroup do
  begin
    with CreateItemForControl(FFeeMasterView) do
    begin
      AlignVert := avTop;
    end;

    with CreateItemForControl(FPayView) do
    begin
      AlignVert := avTop;
    end;

    DevExpress.BuildFormView(CreateGroup(), FSignBillData);
  end;
end;

procedure TcvHospSignBill.DoCalcPayMoney(Sender: TDADataTable);
begin
  FSignBillData.Edit;

  FSignBillData.AsCurrency['PrepayMoney'] :=
    DataTable_GetSelectedSum(FPayData.Table, 'PayMoney', 'SelectFlag', 1);
end;

procedure TcvHospSignBill.DoDialogOK(Sender: TObject);
begin
  if ShowYesNo('是否提交挂账处理信息?') then
  begin

    HospService.DACommand.Execute('Pro_Hosp_FeeMaster_SignBill',
      ['PayID', sFieldHospFeeID, sFieldOpID, 'PrepayIDList', 'Xml'],
      ['', FFeeMasterData.AsString[sFieldHospFeeID], HisUser.ID,
      DataTable_GetSelectedCommaText(FPayData.Table, 'PayID', 'SelectFlag', 1),
      DataTable_GetXmlText(FSignBillData.Table)]);

    ModalResult := mrOk;

    AppCore.Logger.WriteFmt('挂账处理成功|发票号码:%s ',
      [FFeeMasterData.AsString[sFieldHospFeeID]], mtInfo, 1);

    HospService.PrintFeeMaster(FFeeMasterData.AsString[sFieldHospFeeID]);

  end;
end;

function TcvHospSignBill.DoExecute(CommandID: Integer;
  const Param: array of Variant): Variant;
begin
  if CommandID = iOperationCommand_Notify then
  begin
    FPatientView := TcvHospPatientInOut(Integer(Param[0]));

    with FPatientView.ViewData do
      if not Eof then
      begin
        FHospID := AsString[sFieldHospID];
        FSignBillData.Refresh;
        FFeeMasterData.OpenNotSign(FHospID);
        FPayData.OpenNotUsed(FHospID);
        ShowModal;
      end;
  end;
end;

procedure TcvHospSignBill.DoFeeMasterScroll(Sender: TObject);
begin
  FSignBillData.Edit;
  FSignBillData.AsCurrency['BillMoney'] := FFeeMasterData.AsCurrency
    ['PayMoney'];
end;

procedure TcvHospSignBill.DoFieldChange(Sender: TDACustomField);
begin
  with FSignBillData do
  begin
    AsCurrency['PayMoney'] := AsCurrency['BillMoney'] - AsCurrency
      ['PrepayMoney'];
  end;
end;

{ TOperationHospFee }

procedure TOperationHospFee.AfterConstruction;
begin
  inherited;
  BuildAction('挂账处理', '', nil, DoActionSignBill, 0);
  BuildAction('去门诊', '', nil, DoActionToClinic, 0);
end;

procedure TOperationHospFee.DoActionSignBill(Sender: TObject);
begin
  if FSignDialog = nil then
    FSignDialog := TcvHospSignBill.Create(Application);

  TcvHospSignBill(FSignDialog).DoExecute(iOperationCommand_Notify,
    [Integer(GetPluginContainer)]);
end;

procedure TOperationHospFee.DoActionToClinic(Sender: TObject);
begin
  with GetPluginContainer.ViewData do
    if not Eof then
    begin
      AppCore.Operations.SearchOperation(sOperationIDClinFee)
        .Execute(iOperationCommand_ClinID, [AsString[sFieldClinID]]);
    end;
end;

function TOperationHospFee.GetPluginContainer: TcvHospPatientInOut;
begin
  Result := TcvHospPatientInOut(CustomAttributes.Objects
    [CustomAttributes.IndexOf('PluginContainer')]);
end;

{ TcvHospOfficeMed }

procedure TcvHospOfficeMed.BuildViewLayout;
var
  Temp: TCustomData;
begin
  inherited;

  PeriodGroup.Visible := True;
  BeginDate := Date - 2;
  EndDate := Date + 2;

  Temp := TCustomData.Create(Self, HisConnection, sDataServiceHosp,
    'Pro_Hosp_Med_ToExecute');
  Temp.FieldByName('SelectFlag').Visible := False;
  Temp.CustomAttributes.Values['MultiSelectField'] := '';
  ViewData := Temp;
end;

procedure TcvHospOfficeMed.DataQuery;
begin
  ViewData.OpenByParam(['BeginDate', 'EndDate', sFieldHospID, 'BusinessType',
    'ApplyOfficeID', 'ExecOfficeID'], [BeginDate, EndDate, '', 5,
    HisUser.OfficeID, '']);
end;

{ TcvHospBaby }

procedure TcvHospBaby.BuildViewLayout;
begin
  inherited;
  Caption := '母婴登记';
  Position := poScreenCenter;
  SetDataEditing(True);

  ViewData := TCustomData.Create(Self, HisConnection, sDataServiceHosp,
    'Hosp_Baby');
  ViewData.OnAfterInsert := DoAfterInsert;
end;

procedure TcvHospBaby.DataQuery;
begin
  ViewData.OpenByFieldValue('HospID', FHospID);
end;

procedure TcvHospBaby.DoAfterInsert(Sender: TObject);
begin
  ViewData.AsString[sFieldHospID] := FHospID;
  ViewData.AsString[sFieldBedID] := FPatientView.ViewData.AsString[sFieldBedID];
  ViewData.AsString['BabyName'] := FPatientView.ViewData.AsString
    ['PatientName'] + '之子';
end;

procedure TcvHospBaby.SetPatientView(Value: TcvHospPatient);
begin
  FPatientView := Value;
  FHospID := FPatientView.ViewData.AsString[sFieldHospID];
  DataQuery;
end;

{ TcvHospCenter }

procedure TcvHospCenter.BuildViewAction;
begin
  inherited;
  QueryAction.Caption := '查询'
end;

procedure TcvHospCenter.BuildViewLayout;
begin
  inherited;

  PeriodGroup.Visible := True;

  BuildLayoutToolBar(PeriodGroup, [BuildAction('按入院日期查', '', '', nil,
    DoHospDateAction, 0, 0), BuildAction('按出院日期查', '', '', nil,
    DoOutHospDateAction, 0, 0)]);

  FHospIDEdit := TcxMaskEdit.Create(Self);
  SerialIDWrapper.Wrap(FHospIDEdit, swmYear, 6).OnSerialID := DoActionHospID;

  with ToolBarGroup do
  begin
    with CreateItemForControl(FHospIDEdit) do
    begin
      Caption := '住院号/姓名:';
      AlignVert := avCenter;
      Index := 1;
    end;
  end;

  EnableMultiSelect;
  OnDoubleClickView := DoDoubleClickView;

  ViewData := TcdHospPatient.Create(Self);
end;

procedure TcvHospCenter.DataQuery;
begin
  PatientData.OpenByValue(FHospIDEdit.Text, BeginDate, EndDate);
end;

procedure TcvHospCenter.DoActionHospID(Sender: TObject);
begin
  DataQuery;
end;

procedure TcvHospCenter.DoDoubleClickView(Sender: TObject);
begin
end;

procedure TcvHospCenter.DoHospDateAction(Sender: TObject);
begin
  PatientData.OpenByHospDate(FHospIDEdit.Text, BeginDate, EndDate + 1);
end;

procedure TcvHospCenter.DoOutHospDateAction(Sender: TObject);
begin
  PatientData.OpenByOutHospDate(FHospIDEdit.Text, BeginDate, EndDate + 1);
end;

function TcvHospCenter.GetPatientData: TcdHospPatient;
begin
  Result := TcdHospPatient(ViewData);
end;

{ TcvHospFeeStat }

procedure TcvHospFeeStat.BuildViewAction;
begin
  CreateCloseAction();
  inherited;
end;

procedure TcvHospFeeStat.BuildViewLayout;
begin
  inherited;
  Caption := '费用统计';
  ToolBarGroup.Visible := False;
  Position := poScreenCenter;
  ViewData := TCustomData.Create(Self, HisConnection, sDataServiceHosp,
    'Hosp_FeeStat');
end;

procedure TcvHospFeeStat.DataQuery;
begin
  ViewData.OpenByFieldValue(sFieldHospID, FHospID);
end;

function TcvHospFeeStat.DoExecute(CommandID: Integer;
  const Param: array of Variant): Variant;
begin
  Result := inherited DoExecute(CommandID, Param);

  if CommandID = iOperationCommand_Notify then
  begin
    FHospID := TTableGridDataView(Integer(Param[0])).ViewData.AsString
      [sFieldHospID];
    DataQuery;
    ShowModal;
  end
  else if CommandID = iOperationCommand_HospID then
  begin
    FHospID := Param[0];
    DataQuery;
    ShowModal;
  end
end;

{ TcdHospOperation }

function TcdHospOperation.CanDelete: Boolean;
begin
  Result := inherited CanDelete() and SameText(AsString['ApplyOpID'],
    HisUser.ID);
end;

function TcdHospOperation.CanEdit: Boolean;
begin
  Result := inherited CanEdit() and SameText(AsString['ApplyOpID'], HisUser.ID);
end;

function TcdHospOperation.CanInsert: Boolean;
begin
  Result := inherited CanInsert();
end;

constructor TcdHospOperation.Create(AOwner: TComponent);
begin
  inherited Create(AOwner, HisConnection, sDataServiceHosp,
    sDataNameHospOperation);
end;

procedure TcdHospOperation.DoDataAfterEdit(Sender: TDADataTable);
begin
  inherited;
  AsString['ApplyOpID'] := HisUser.ID;
  AsString['ApplyOfficeID'] := HisUser.OfficeID;
end;

procedure TcdHospOperation.DoDataAfterInsert(Sender: TDADataTable);
begin
  inherited;
  AsString['DoctorID'] := HisUser.ID;
  AsString['DoctorName'] := HisUser.Name;
  AsString['ApplyOfficeID'] := HisUser.OfficeID;
  AsString['ApplyOfficeName'] := HisUser.OfficeName;
  AsString['ApplyOpID'] := HisUser.ID;
  AsDateTime['ApplyTime'] := Date();
end;

{ TcvHospOperation }

procedure TcvHospOperation.BuildViewAction;
begin
  CreateCloseAction();
  inherited;
  BuildAction('提交申请', 'commit', '', nil, DoActionCommit, 0, BTN_SHOWCAPTION);
end;

procedure TcvHospOperation.BuildViewLayout;
begin
  inherited;

  Caption := '手术登记';
  RestoreSize(Screen.Width div 4 * 3, Height);
  SetDataEditing(True);
  Position := poScreenCenter;

  ViewData := TcdHospOperation.Create(Self);
  ViewData.OnAfterInsert := DoAfterInsert;
end;

function TcvHospOperation.CanDelete: Boolean;
begin
  Result := CanEdit;
end;

function TcvHospOperation.CanEdit: Boolean;
begin
  Result := inherited CanEdit() and (ViewData.AsInteger['OperationSign'] = 0)
end;

function TcvHospOperation.CanInsert: Boolean;
begin
  Result := inherited CanInsert() and (FHospID <> '');
end;

procedure TcvHospOperation.DataQuery;
begin
  ViewData.OpenByFieldValue('HospID', FHospID);
end;

procedure TcvHospOperation.DoActionCommit(Sender: TObject);
begin
  if not ViewData.Eof and ShowYesNo('是否提交手术申请? 提交前请核对，提交后将不能修改!') then
  begin
    HospService.DACommand.Execute('Pro_Hosp_Operation_Submit',
      ['OperationID', sFieldOfficeID, sFieldOpID],
      [ViewData.AsInteger['OperationID'], HisUser.OfficeID, HisUser.ID]);

    ViewData.EditWithNoLogChanges(['OperationSign'], [1]);

    AppCore.Logger.Write('手术申请提交成功', mtInfo, 1);

    PrintReportFromServer('住院手术申请单.fr3', ['OperationID'],
      [ViewData.AsInteger['OperationID']], nil, True);
  end;
end;

procedure TcvHospOperation.DoAfterInsert(Sender: TObject);
begin
  ViewData.AsString[sFieldHospID] := FHospID;
  ViewData.AsString[sFieldBedID] := FPatientView.ViewData.AsString[sFieldBedID];
  ViewData.AsString[sFieldPatientName] := FPatientView.ViewData.AsString
    [sFieldPatientName];
end;

function TcvHospOperation.DoExecute(CommandID: Integer;
  const Param: array of Variant): Variant;
begin
  PatientView := TcvHospPatient(Integer(Param[0]));
  if PatientView.ViewData.Eof then
    Exit;
  ShowModal();
  SaveSize;
end;

procedure TcvHospOperation.SetPatientView(Value: TcvHospPatient);
begin
  FPatientView := Value;
  FHospID := FPatientView.ViewData.AsString[sFieldHospID];
  DataQuery;
end;

initialization

HospFeeProcList := TStringList.Create;

finalization

FreeAndNil(HospFeeProcList);

end.
