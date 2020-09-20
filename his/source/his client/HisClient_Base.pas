unit HisClient_Base;

{
  HIS基础业务模块

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
  Graphics,
  DB,
  Contnrs,
  StrUtils,
  Windows,
  ShellAPI,
  uDACore,
  uDAFields,
  uDAWhere,
  uDAMemDataTable,
  uDAInterfaces,
  uDADataTable,
  uROClasses,
  cxDBData,
  cxDBEdit,
  cxEdit,
  cxCurrencyEdit,
  cxSpinEdit,
  cxTextEdit,
  cxButtons,
  cxCheckBox,
  cxCheckComboBox,
  cxCheckGroup,
  cxButtonEdit,
  cxCalendar,
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
  cxCustomData,
  cxCustomPivotGrid,
  cxTL,
  cxDBTL,
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
  HisClient_Medicine,
  HisClient_System;

type
  TcdBaseStatType = class(THisData)
  private
    function GetStatTypeID(): string;
  protected
    procedure InitTableAfterSchema(ATable: TDAMemDataTable); override;
    procedure DoDataCalcFields(Sender: TDADataTable); override;
    procedure DoDataBeforePost(Sender: TDADataTable); override;
  public
    property StatTypeID: string read GetStatTypeID;
  end;

  TcdBaseRecipeType = class(THisData)
  private
    function GetRecTypeID: string;
    function GetExecOfficeID: string;
    function GetRecType: string;
    function GetRootRecTypeID: string;
  protected
    procedure InitTableAfterSchema(ATable: TDAMemDataTable); override;
    procedure DoDataCalcFields(Sender: TDADataTable); override;
    procedure DoDataBeforePost(Sender: TDADataTable); override;
  public
    constructor Create(AOwner: TComponent);

    procedure OpenAppType();
    procedure OpenMedType();
    procedure OpenClinMedType();
    procedure OpenHospMedType();
    procedure OpenClinAppType();
    procedure OpenHospAppType();

    property RootRecTypeID: string read GetRootRecTypeID;
    property RecTypeID: string read GetRecTypeID;
    property RecType: string read GetRecType;
    property ExecOfficeID: string read GetExecOfficeID;
  end;

  TcdBaseItemInfo = class(THisData)
  private
    FFeeSign: Integer;
    function GetFeeID(): Integer;
    function GetFeeName(): string;
    function GetPrice(): Currency;
    procedure SetPrice(const Value: Currency);
    function GetStatTypeID: string;
  protected
    procedure InitTableAfterSchema(ATable: TDAMemDataTable); override;
    procedure DoDataCalcFields(Sender: TDADataTable); override;
    procedure DoDataBeforePost(Sender: TDADataTable); override;
    procedure DoCalcPrice(Sender: TDACustomField);
  public
    procedure OpenBySign(AFeeSign: Integer);
    property FeeSign: Integer read FFeeSign;
    property FeeID: Integer read GetFeeID;
    property FeeName: string read GetFeeName;
    property StatTypeID: string read GetStatTypeID;
    property Price: Currency read GetPrice write SetPrice;
  end;

  TcdBaseItemYB = class(THisData)
  private
    FFeeID: Integer;
  protected
    procedure DoDataBeforePost(Sender: TDADataTable); override;
  public
    procedure Open(); override;
    procedure OpenByFeeID(AFeeID: Integer);
    property FeeID: Integer read FFeeID;
  end;

  TcdBaseFeeInfo = class(TCustomData)
  public
    constructor Create(AOwner: TComponent; ADataConnection: TDataConnection;
      const AServiceName, ALogicalName: string); override;
    procedure Open(); override;
    procedure DoServerFilter(const AFilterText: string); override;
  end;

  TcdBaseRecipeGroupMaster = class(THisData)
  private
    FUseMode: Integer;
    procedure SetUseMode(const Value: Integer);
  protected
    procedure DoDataAfterInsert(Sender: TDADataTable); override;
    procedure DoDataBeforePost(Sender: TDADataTable); override;
    procedure QueryAfterMasterScroll(); override;
  public
    constructor Create(AOwner: TComponent);

    property UseMode: Integer read FUseMode write SetUseMode;
  end;

  TcdBaseRecipeGroupDetail = class(THisData)
  private
    FUseMode: Integer;
    procedure SetUseMode(const Value: Integer);
  protected
    procedure DoDataCalcFields(Sender: TDADataTable); // override;
    procedure DoDataBeforePost(Sender: TDADataTable); override;
  public
    constructor Create(AOwner: TComponent);

    property UseMode: Integer read FUseMode write SetUseMode;
  end;

  TcdBaseFeeGroupMaster = class(THisData)
  private
    function GetGroupID: Integer;
    function GetGroupName: string;
  public
    constructor Create(AOwner: TComponent);

    function CanEdit(): Boolean; override;
    function CanDelete(): Boolean; override;
    function CanInsert(): Boolean; override;

    property GroupID: Integer read GetGroupID;
    property GroupName: string read GetGroupName;
  end;

  TcdBaseFeeGroupDetail = class(TCustomData)
  private
  protected
    procedure DoDataCalcFields(Sender: TDADataTable); override;
  public
    constructor Create(AOwner: TComponent);

    function CanEdit(): Boolean; override;
    function CanDelete(): Boolean; override;
    function CanInsert(): Boolean; override;

    function GetSelectedDetailIDList(): string;
  end;

  TcdBaseClinFeeItem = class(TCustomData)
  private
    FClinID: string;
    FRecTypeID: string;
    procedure SetRecTypeID(const Value: string);
    procedure SetClinID(const Value: string);
  public
    constructor Create(AOwner: TComponent);
    procedure DoServerFilter(const AFilterText: string); override;
    property ClinID: string read FClinID write SetClinID;
    property RecTypeID: string read FRecTypeID write SetRecTypeID;
  end;

  TcdBaseHospFeeItem = class(TCustomData)
  private
    FHospID: string;
    FAdviceTypeID: Integer;
    procedure SetAdviceTypeID(const Value: Integer);
    procedure SetHospID(const Value: string);
  public
    constructor Create(AOwner: TComponent);
    procedure DoServerFilter(const AFilterText: string); override;
    property HospID: string read FHospID write SetHospID;
    property AdviceTypeID: Integer read FAdviceTypeID write SetAdviceTypeID;
  end;

  TcdClinicRegType = class(THisData)
  private
    function GetDiagPrice: Currency;
    function GetRegPrice: Currency;
    function GetRegTypeID: Integer;
  public
    constructor Create(AOwner: TComponent);
    property RegTypeID: Integer read GetRegTypeID;
    property RegPrice: Currency read GetRegPrice;
    property DiagPrice: Currency read GetDiagPrice;
  end;

  TBaseItemYBView = class(TTableGridDataView)
  private
    FYBData: TcdBaseItemYB;
    FNameItem: TdxLayoutItem;
  protected
    procedure BuildViewAction(); override;
  public
    constructor Create(AOwner: TComponent); override;
    procedure SetFeeID(AFeeID: Integer; const AFeeName: string);
  end;

  TBaseItemXNHView = class(TTableGridDataView)
  private
  protected
  public
    constructor Create(AOwner: TComponent); override;
    procedure DataQuery(); override;
  end;

  TBaseItemInfoView = class(TBandGridDataView)
  private
    FFeeInfo: TcdBaseItemInfo;
    FYBView: TBaseItemYBView;
    FXNHView: TBaseItemXNHView;
    FExtendGroup: TdxLayoutGroup;
    FStockAssignAction: TAction;
    FCurrentStockOffice: string;
    procedure DoActionYB(Sender: TObject);
    procedure DoActionXNH(Sender: TObject);
    procedure DoActionYBNavigate(Sender: TObject;
      NavigateAction: TNavigateAction);
    procedure DoActionStockAssign(Sender: TObject);
    procedure DoEnumMedOffice(ADataTable: TDADataTable; AParam: Variant);
    procedure DoEachSelectedItem(Sender: TObject);
    procedure BuildExtendGroup();
  protected
    procedure InitData(ALogicalName: string; AFeeSign: Integer);
    procedure BuildViewAction(); override;
  public
  end;

  TBaseItemMedicineView = class(TBaseItemInfoView)
  private
  public
    constructor Create(AOwner: TComponent); override;
  end;

  TBaseItemTreatmentView = class(TBaseItemInfoView)
  private
  public
    constructor Create(AOwner: TComponent); override;
  end;

  TBaseItemYBTableView = class(TTableGridDataView)
  private
    procedure InitData(AFeeSign: Integer);
  public
  end;

  TBaseItemMedicineYBTableView = class(TBaseItemYBTableView)
  private
  public
    constructor Create(AOwner: TComponent); override;
  end;

  TBaseItemTreatmentYBTableView = class(TBaseItemYBTableView)
  private
  public
    constructor Create(AOwner: TComponent); override;
  end;

  TBaseFeeGroupView = class(TBaseLayoutView)
  private
    FUseMode: Integer;
    FRecipeType: TcdBaseRecipeType;
    FGroupMaster: TcdBaseFeeGroupMaster;
    FGroupDetail: TcdBaseFeeGroupDetail;
    FRecipeTypeView: TTreeDataView;
    FMasterView: TTableGridDataView;
    FDetailView: TTableGridDataView;

    procedure DoRecipeTypeScroll(Sender: TObject);
  protected
    procedure BuildViewLayout(); override;
  public
    constructor Create(AOwner: TComponent; AUseMode: Integer); reintroduce;
    destructor Destroy(); override;

    function GetMultiSelectCount: Integer;

    property RecipeTypeData: TcdBaseRecipeType read FRecipeType;
    property GroupMasterData: TcdBaseFeeGroupMaster read FGroupMaster;
    property GroupDetailData: TcdBaseFeeGroupDetail read FGroupDetail;
    property RecipeTypeView: TTreeDataView read FRecipeTypeView;
    property GroupMasterView: TTableGridDataView read FMasterView;
    property GroupDetailView: TTableGridDataView read FDetailView;
  end;

  TBaseFeeGroupDialog = class(TBaseDialog)
  private
    FUseMode: Integer;
    FGroupView: TBaseFeeGroupView;
    FExtendSignCheckBox: TcxCheckComboBox;
    FApplyMemoEdit: TcxTextEdit;
    FApplyDate: TcxDateEdit;
    FDateItem: TdxLayoutItem;
    FSelectButton: TcxButton;
    FOnSelectGroup: TNotifyEvent;
    FLastSelectGroup: string;
    function GetGroupDetail: TcdBaseFeeGroupDetail;
    function GetGroupMaster: TcdBaseFeeGroupMaster;
    function GetRecipeType: TcdBaseRecipeType;
    function GetApplyMemo: string;
    function GetCheckDate: TDate;
    procedure DoCheckBeforeSelect();
    procedure DoSelectClick(Sender: TObject);
    function GetExtendSign: Integer;
  protected
    procedure DoDialogOK(Sender: TObject); override;
    procedure BuildDialog; override;
  public
    constructor Create(AOwner: TComponent; AUseMode: Integer);
    destructor Destroy(); override;

    function Execute(): Boolean; override;

    property ExtendSign: Integer read GetExtendSign;
    property RecipeTypeData: TcdBaseRecipeType read GetRecipeType;
    property GroupMasterData: TcdBaseFeeGroupMaster read GetGroupMaster;
    property GroupDetailData: TcdBaseFeeGroupDetail read GetGroupDetail;
    property ApplyMemo: string read GetApplyMemo;
    property CheckDate: TDate read GetCheckDate;
    property OnSelectGroup: TNotifyEvent read FOnSelectGroup
      write FOnSelectGroup;
  end;

  TBaseRecipeGroupView = class(TBaseLayoutView)
  private
    FUseMode: Integer;
    FRecipeType: TcdBaseRecipeType;
    FGroupMaster: TcdBaseRecipeGroupMaster;
    FGroupDetail: TcdBaseRecipeGroupDetail;
    FRecipeTypeView: TTreeDataView;
    FMasterView: TTableGridDataView;
    FDetailView: TTableGridDataView;
    FGroupMasterBookmark: TBookmark;
    procedure DoRecipeTypeScroll(Sender: TObject);
  protected
    procedure BuildViewLayout(); override;
  public
    destructor Destroy(); override;
    constructor Create(AOwner: TComponent; AUseMode: Integer);

    procedure SaveMasterBookmark();
    procedure RestoreMasterBookmark();

    property GroupMasterView: TTableGridDataView read FMasterView;
    property RecipeTypeData: TcdBaseRecipeType read FRecipeType;
    property GroupMasterData: TcdBaseRecipeGroupMaster read FGroupMaster;
    property GroupDetailData: TcdBaseRecipeGroupDetail read FGroupDetail;
  end;

  TBaseRecipeGroupDialog = class(TBaseDialog)
  private
    FUseMode: Integer;
    FEmptyButton: TcxButton;
    FSelectButton: TcxButton;
    FGroupView: TBaseRecipeGroupView;
    FAppendRecipeCheckBox: TcxCheckBox;
    FExtendSignCheckBox: TcxCheckComboBox;
    FOnSelectGroup: TNotifyEvent;
    FLastSelectGroup: string;
    FMemoEdit: TcxTextEdit;
    function GetGroupMaster: TcdBaseRecipeGroupMaster;
    function GetGroupDetail: TcdBaseRecipeGroupDetail;
    function GetRecipeType: TcdBaseRecipeType;
    function GetAppendRecipe: Boolean;
    procedure DoEmptyClick(Sender: TObject);
    procedure DoSelectClick(Sender: TObject);
    procedure DoCheckBeforeSelect();
    function GetExtendSign: Integer;
    function GetRecipeMemo: string;
  protected
    procedure DoDialogOK(Sender: TObject); override;
    procedure BuildDialog; override;
  public
    constructor Create(AOwner: TComponent; AUseMode: Integer);
    destructor Destroy(); override;

    function Execute(): Boolean; override;

    property RecipeMemo: string read GetRecipeMemo;
    property AppendRecipe: Boolean read GetAppendRecipe;
    property ExtendSign: Integer read GetExtendSign;
    property RecipeTypeData: TcdBaseRecipeType read GetRecipeType;
    property GroupMasterView: TBaseRecipeGroupView read FGroupView;
    property GroupMasterData: TcdBaseRecipeGroupMaster read GetGroupMaster;
    property GroupDetailData: TcdBaseRecipeGroupDetail read GetGroupDetail;
    property OnSelectGroup: TNotifyEvent read FOnSelectGroup
      write FOnSelectGroup;
  end;

procedure DefineBaseCommonData(ADataContainer: TDataContainer);
procedure OrganizeBaseOperations();

implementation

procedure DefineBaseCommonData(ADataContainer: TDataContainer);
begin
  with ADataContainer do
  begin
    { 通用 }
    RegisterData(HisConnection, sDataServiceDict, sDataNameDictCertificate,
      THisData, 0, '');
    RegisterData(HisConnection, sDataServiceDict, sDataNameDictMarryState,
      THisData, 0, '');
    RegisterData(HisConnection, sDataServiceDict, sDataNameDictNation,
      THisData, 0, '');
    RegisterData(HisConnection, sDataServiceDict, sDataNameDictNational,
      THisData, 0, '');
    RegisterData(HisConnection, sDataServiceDict, sDataNameDictOccupation,
      THisData, 0, '');
    RegisterData(HisConnection, sDataServiceDict, sDataNameDictPosition,
      THisData, 0, '');
    RegisterData(HisConnection, sDataServiceDict, sDataNameDictProfession,
      THisData, 0, '');
    RegisterData(HisConnection, sDataServiceDict, sDataNameDictProTitle,
      THisData, 0, '');
    RegisterData(HisConnection, sDataServiceDict, sDataNameDictRelation,
      THisData, 0, '');
    RegisterData(HisConnection, sDataServiceDict, sDataNameDictSexType,
      THisData, 0, '');

    { 临床 }
    RegisterData(HisConnection, sDataServiceDict, sDataNameDictBloodType,
      THisData, 0, '');
    RegisterData(HisConnection, sDataServiceDict, sDataNameDictDrugAllergic,
      THisData, 0, '');
    RegisterData(HisConnection, sDataServiceDict, sDataNameDictDrugUse,
      THisData, 0, '');
    RegisterData(HisConnection, sDataServiceDict, sDataNameDictDrugDoseRatio,
      THisData, 0, '');
    RegisterData(HisConnection, sDataServiceDict, sDataNameDictFrequency,
      THisData, 0, '');
    RegisterData(HisConnection, sDataServiceDict, sDataNameDictIllnessState,
      THisData, 0, '');
    RegisterData(HisConnection, sDataServiceDict, sDataNameDictLookAfterLevel,
      THisData, 0, '');
    RegisterData(HisConnection, sDataServiceDict, sDataNameDictSickness,
      THisData, 0, '');
    RegisterData(HisConnection, sDataServiceDict, sDataNameDictICD10,
      THisData, 0, '');
    RegisterData(HisConnection, sDataServiceDict, sDataNameDictOperation,
      THisData, 0, '');
    RegisterData(HisConnection, sDataServiceDict, sDataNameDictAnesthesiaMethod,
      THisData, 0, '');

    { 药品 }
    RegisterData(HisConnection, sDataServiceDict, sDataNameDictMFactory,
      THisData, 0, '');
    RegisterData(HisConnection, sDataServiceDict, sDataNameDictMOrigin,
      THisData, 0, '');
    RegisterData(HisConnection, sDataServiceDict, sDataNameDictMPackageUnit,
      THisData, 0, '');
    RegisterData(HisConnection, sDataServiceDict, sDataNameDictMPlace,
      THisData, 0, '');
    RegisterData(HisConnection, sDataServiceDict, sDataNameDictMProperty,
      THisData, 0, '');
    RegisterData(HisConnection, sDataServiceDict, sDataNameDictMShape,
      THisData, 0, '');
    RegisterData(HisConnection, sDataServiceDict, sDataNameDictMSupply,
      THisData, 0, '');

    { 财务 }
    RegisterData(HisConnection, sDataServiceDict, sDataNameDictAgreementUnit,
      THisData, 0, '');
    RegisterData(HisConnection, sDataServiceDict,
      sDataNameDictAgreementDiscount, TCustomData, 0, '');
    RegisterData(HisConnection, sDataServiceDict, sDataNameDictPayType,
      THisData, 0, '');
    RegisterData(HisConnection, sDataServiceDict, sDataNameDictClinPayType,
      THisData, 0, '');
    RegisterData(HisConnection, sDataServiceDict, sDataNameDictPayTypeHospPay,
      TCustomData, 0, '');
    RegisterData(HisConnection, sDataServiceDict,
      sDataNameDictPayTypeHospBalance, TCustomData, 0, '');
    RegisterData(HisConnection, sDataServiceDict, sDataNameDictIncomeType,
      THisData, 0, '');
    RegisterData(HisConnection, sDataServiceDict, sDataNameDictPatientType,
      THisData, 0, '');

    { 基础数据 }
    RegisterData(HisConnection, sDataServiceBase, sDataNameBaseStatType,
      TcdBaseStatType, 0, '');
    RegisterData(HisConnection, sDataServiceBase, sDataNameBaseRecipeType,
      TcdBaseRecipeType, 0, '');

    RegisterData(HisConnection, sDataServiceBase, sDataNameBaseFeeInfo,
      THisData, 0, '');
    RegisterData(HisConnection, sDataServiceBase, sDataNameBaseFeeMedicine,
      THisData, 0, '');
    RegisterData(HisConnection, sDataServiceBase, sDataNameBaseFeeTreatment,
      THisData, 0, '');
    RegisterData(HisConnection, sDataServiceBase, sDataNameBaseFeeMedicineYB,
      THisData, 0, '');
    RegisterData(HisConnection, sDataServiceBase, sDataNameBaseFeeTreatmentYB,
      THisData, 0, '');
    RegisterData(HisConnection, sDataServiceBase, sDataNameBaseItemInfo,
      THisData, 0, '');

    RegisterData(HisConnection, sDataServiceBase, sDataNameBaseClinFeeItem,
      TcdBaseClinFeeItem, 0, '');
    RegisterData(HisConnection, sDataServiceBase, sDataNameBaseHospFeeItem,
      TcdBaseHospFeeItem, 0, '');

    RegisterData(HisConnection, sDataServiceBase, sDataNameBaseStockInOutType,
      TCustomData, 0, '');
    RegisterData(HisConnection, sDataServiceBase,
      sDataNameBaseStockInOutTypeOffice, TCustomData, 0, '');
    RegisterData(HisConnection, sDataServiceBase, sDataNameBaseStockInOutItem,
      TCustomData, 0, '');

    RegisterData(HisConnection, sDataServiceBase,
      sDataNameBaseRecipeGroupMaster, THisData, 0, '');
    RegisterData(HisConnection, sDataServiceBase,
      sDataNameBaseRecipeGroupDetail, THisData, 0, '');
    RegisterData(HisConnection, sDataServiceBase, sDataNameBaseFeeGroupMaster,
      THisData, 0, '');
    RegisterData(HisConnection, sDataServiceBase, sDataNameBaseFeeGroupDetail,
      THisData, 0, '');
  end;
end;

{ TcdBaseStatType }

procedure TcdBaseStatType.DoDataBeforePost(Sender: TDADataTable);
begin
  inherited;
  if Odd(Length(StatTypeID)) or (Length(StatTypeID) = 0) then
    raise Exception.Create('科目ID必须按2位一级进行编码');
end;

procedure TcdBaseStatType.DoDataCalcFields(Sender: TDADataTable);
begin
  Sender.FieldByName('ParentID').AsString := GetStatTypeParentID(StatTypeID);
end;

function TcdBaseStatType.GetStatTypeID(): string;
begin
  Result := Table.FieldByName('StatTypeID').AsString;
end;

procedure TcdBaseStatType.InitTableAfterSchema(ATable: TDAMemDataTable);
begin
  inherited;
  with ATable.Fields.Add do
  begin
    Name := 'ParentID';
    DataType := datString;
    DisplayLabel := '上级ID';
    Size := 8;
    Index := 0;
    Calculated := True;
    Visible := False;
    CustomAttributes.Text := 'Options.Editing=False';
  end;
end;

{ TcdBaseItemInfo }

procedure TcdBaseItemInfo.DoCalcPrice(Sender: TDACustomField);
begin
  if Table.FieldByName('CRatio').AsCurrency <= 0 then
    Table.FieldByName('CRatio').AsCurrency := 1;

  if Table.FieldByName('HRatio').AsCurrency <= 0 then
    Table.FieldByName('HRatio').AsCurrency := 1;

  if (Table.FieldByName('AddRatio').AsCurrency > 2) then
  begin
    Price := Table.FieldByName('InPrice').AsCurrency +
      Table.FieldByName('AddRatio').AsCurrency;
  end
  else
  begin
    Price := Table.FieldByName('InPrice').AsCurrency *
      Table.FieldByName('AddRatio').AsCurrency;
  end;

  Table.FieldByName('CPrice').AsCurrency := Price / Table.FieldByName('CRatio')
    .AsCurrency;

  Table.FieldByName('HPrice').AsCurrency := Price / Table.FieldByName('HRatio')
    .AsCurrency;
end;

procedure TcdBaseItemInfo.DoDataBeforePost(Sender: TDADataTable);
begin
  inherited;
  if (FFeeSign <> 0) then
    Sender.FieldByName('FeeSign').AsInteger := FFeeSign;
end;

procedure TcdBaseItemInfo.DoDataCalcFields(Sender: TDADataTable);
begin
  with Sender do
  begin
    FieldByName('StTypeID1').AsString := GetStatTypeLevel1(StatTypeID);
    FieldByName('StTypeID2').AsString := GetStatTypeLevel2(StatTypeID);
    FieldByName('StTypeID3').AsString := GetStatTypeLevel3(StatTypeID);
  end;
end;

function TcdBaseItemInfo.GetFeeID: Integer;
begin
  Result := Table.FieldByName('FeeID').AsInteger;
end;

function TcdBaseItemInfo.GetFeeName: string;
begin
  Result := Table.FieldByName('FeeName').AsString;
end;

function TcdBaseItemInfo.GetPrice: Currency;
begin
  Result := Table.FieldByName('Price').AsCurrency;
end;

function TcdBaseItemInfo.GetStatTypeID: string;
begin
  Result := Table.FieldByName('StatTypeID').AsString;
end;

procedure TcdBaseItemInfo.InitTableAfterSchema(ATable: TDAMemDataTable);
var
  TypeField: TDAField;
const
  AttText = 'Properties=LookupComboBox'#13#10'Properties.ListSource=Base_StatType'#13#10
    + 'Properties.ListFieldNames=StatTypeID;StatTypeName'#13#10'Properties.ListFieldIndex=1'#13#10
    + 'IME.DictName=Base_StatType'#13#10'IME.SetValueField=StatTypeID';
begin
  inherited;
  TypeField := ATable.FieldByName('StatTypeID');
  TypeField.Visible := False;
  with ATable.Fields.Add do
  begin
    Name := 'StTypeID1';
    DataType := datString;
    DisplayLabel := '一级科目';
    Size := 6;
    Index := TypeField.Index + 1;
    Calculated := True;
    CustomAttributes.Text := AttText;
    CustomAttributes.Add('BeginsLayer=True');
  end;
  with ATable.Fields.Add do
  begin
    Name := 'StTypeID2';
    DataType := datString;
    DisplayLabel := '二级科目';
    Size := 6;
    Index := TypeField.Index + 2;
    Calculated := True;
    CustomAttributes.Text := AttText;
  end;
  with ATable.Fields.Add do
  begin
    Name := 'StTypeID3';
    DataType := datString;
    DisplayLabel := '三级科目';
    Size := 6;
    Index := TypeField.Index + 3;
    Calculated := True;
    CustomAttributes.Text := AttText;
  end;
  if ATable.Fields.FindField('AddRatio') <> nil then
  begin
    ATable.FieldByName('AddRatio').OnChange := DoCalcPrice;
    ATable.FieldByName('InPrice').OnChange := DoCalcPrice;
    ATable.FieldByName('CRatio').OnChange := DoCalcPrice;
    ATable.FieldByName('HRatio').OnChange := DoCalcPrice;
  end;
end;

procedure TcdBaseItemInfo.OpenBySign(AFeeSign: Integer);
begin
  FFeeSign := AFeeSign;
  OpenByFieldValue('FeeSign', FFeeSign);
end;

procedure TcdBaseItemInfo.SetPrice(const Value: Currency);
begin
  Table.FieldByName('Price').AsCurrency := Value;
end;

{ TcdBaseItemYB }

procedure TcdBaseItemYB.DoDataBeforePost(Sender: TDADataTable);
begin
  inherited;
  if (FFeeID > 0) then
    Sender.FieldByName('FeeID').AsInteger := FFeeID;
end;

procedure TcdBaseItemYB.Open;
begin
  // if not Table.Active then
  // OpenByFeeID(0);
  OpenByFieldValue(sFieldFeeID, MasterKey);
end;

procedure TcdBaseItemYB.OpenByFeeID(AFeeID: Integer);
begin
  FFeeID := AFeeID;
  OpenByFieldValue('FeeID', FFeeID);
end;

{ TcdBaseFeeInfo }

constructor TcdBaseFeeInfo.Create(AOwner: TComponent;
  ADataConnection: TDataConnection; const AServiceName, ALogicalName: string);
begin
  inherited Create(AOwner, ADataConnection, AServiceName, 'Base_FeeInfo');
end;

procedure TcdBaseFeeInfo.DoServerFilter(const AFilterText: string);
begin
  if CreateParam <> '' then
  begin
    OpenByList(['FeeSign', 'IME_PY'], [CreateParam, '%' + AFilterText + '%'],
      [dboEqual, dboLike], [dboAnd]);
  end
  else
    inherited;
end;

procedure TcdBaseFeeInfo.Open;
begin
  if CreateParam <> '' then
  begin
    OpenByFieldValue('FeeSign', CreateParam);
  end
  else
    inherited;
end;

{ TcdBaseRecipeGroupMaster }

constructor TcdBaseRecipeGroupMaster.Create(AOwner: TComponent);
begin
  inherited Create(AOwner, HisConnection, sDataServiceBase,
    sDataNameBaseRecipeGroupMaster);
  AutoSave := True;
end;

procedure TcdBaseRecipeGroupMaster.DoDataAfterInsert(Sender: TDADataTable);
begin
  inherited;
  if HisUser.IsClinOffice or HisUser.IsHospOffice then
  begin
    AsString['OfficeID'] := HisUser.OfficeID;
    AsString['OfficeName'] := HisUser.OfficeName;
  end;
end;

procedure TcdBaseRecipeGroupMaster.DoDataBeforePost(Sender: TDADataTable);
begin
  inherited;
  if HisUser.IsClinOffice or HisUser.IsHospOffice then
  begin
    Check(AsString['OfficeID'] <> HisUser.OfficeID, '科室不允许修改');
  end;
end;

procedure TcdBaseRecipeGroupMaster.QueryAfterMasterScroll;
begin
  if ((FUseMode = 1) and (VarToStr(MasterKey) < sRecipeType_ClinTreat)) or
    (FUseMode = 2) or ((FUseMode = 0) and (HisUser.IsClinOffice or
    HisUser.IsHospOffice)) then
    // 空字符串会被当做Text类型???
    // OpenByList(['OfficeID', 'OfficeID', 'RecTypeID'],
    // [HisUser.OfficeID, '', VarToStr(MasterKey)],
    // [dboEqual, dboEqual, dboEqual], [dboAnd, dboAnd])
    OpenByWhereText
      (Format('(OfficeID=''%s'' or OfficeID='''') and RecTypeID=''%s''',
      [HisUser.OfficeID, VarToStr(MasterKey)]))
  else
    inherited;
end;

procedure TcdBaseRecipeGroupMaster.SetUseMode(const Value: Integer);
begin
  FUseMode := Value;
end;

{ TcdBaseRecipeGroupDetail }

constructor TcdBaseRecipeGroupDetail.Create(AOwner: TComponent);
begin
  inherited Create(AOwner, HisConnection, sDataServiceBase,
    sDataNameBaseRecipeGroupDetail);
  AutoSave := True;
end;

procedure TcdBaseRecipeGroupDetail.DoDataBeforePost(Sender: TDADataTable);
begin
  inherited;
end;

procedure TcdBaseRecipeGroupDetail.DoDataCalcFields(Sender: TDADataTable);
begin
  inherited;
  with Sender do
    FieldByName('SumPrice').AsCurrency := FieldByName('Price').AsCurrency *
      FieldByName('Quan').AsCurrency
end;

procedure TcdBaseRecipeGroupDetail.SetUseMode(const Value: Integer);
begin
  FUseMode := Value;
  ParamValue['UseMode'] := FUseMode;
end;

{ TcdBaseRecipeType }

constructor TcdBaseRecipeType.Create(AOwner: TComponent);
begin
  inherited Create(AOwner, HisConnection, sDataServiceBase,
    sDataNameBaseRecipeType)
end;

procedure TcdBaseRecipeType.DoDataBeforePost(Sender: TDADataTable);
begin
  inherited;
  if Odd(Length(RecTypeID)) or (Length(RecTypeID) = 0) then
    raise Exception.Create('处方类别ID必须按2位一级进行编码');
end;

procedure TcdBaseRecipeType.DoDataCalcFields(Sender: TDADataTable);
begin
  inherited;
  Sender.FieldByName('ParentID').AsString := GetStatTypeParentID(RecTypeID, 2);
end;

function TcdBaseRecipeType.GetExecOfficeID: string;
begin
  Result := Table.FieldByName('ExecOfficeID').AsString;
end;

function TcdBaseRecipeType.GetRecType: string;
begin
  Result := Table.FieldByName('RecType').AsString
end;

function TcdBaseRecipeType.GetRecTypeID: string;
begin
  Result := Table.FieldByName('RecTypeID').AsString;
end;

function TcdBaseRecipeType.GetRootRecTypeID: string;
begin
  Result := Table.FieldByName('RootRecTypeID').AsString;
end;

procedure TcdBaseRecipeType.InitTableAfterSchema(ATable: TDAMemDataTable);
begin
  inherited;
  with ATable.Fields.Add do
  begin
    Name := 'ParentID';
    DataType := datString;
    DisplayLabel := '上级ID';
    Size := 8;
    Index := 0;
    Calculated := True;
    Visible := False;
    CustomAttributes.Text := 'Options.Editing=False';
  end;
end;

procedure TcdBaseRecipeType.OpenAppType;
begin
  OpenByList(['RecTypeID'], [sRecipeType_LIS], [dboGreaterOrEqual], []);
end;

procedure TcdBaseRecipeType.OpenClinAppType;
begin
  OpenByList(['UseArea', 'UseArea', 'RecTypeID'], [iUseArea_All, iUseArea_Clin,
    sRecipeType_LIS], [dboEqual, dboEqual, dboGreaterOrEqual], [dboOr, dboAnd]);
end;

procedure TcdBaseRecipeType.OpenClinMedType;
begin
  OpenByList(['UseArea', 'UseArea', 'RecTypeID'], [iUseArea_All, iUseArea_Clin,
    sRecipeType_LIS], [dboEqual, dboEqual, dboLess], [dboOr, dboAnd]);
end;

procedure TcdBaseRecipeType.OpenHospAppType;
begin
  OpenByList(['UseArea', 'UseArea', 'RecTypeID'], [iUseArea_All, iUseArea_Hosp,
    sRecipeType_LIS], [dboEqual, dboEqual, dboGreaterOrEqual], [dboOr, dboAnd]);
end;

procedure TcdBaseRecipeType.OpenHospMedType;
begin
  OpenByList(['UseArea', 'UseArea', 'RecTypeID'], [iUseArea_All, iUseArea_Hosp,
    sRecipeType_LIS], [dboEqual, dboEqual, dboLess], [dboOr, dboAnd]);
end;

procedure TcdBaseRecipeType.OpenMedType;
begin
  OpenByList(['RecTypeID'], [sRecipeType_LIS], [dboLess], []);
end;

{ TcdClinicRegType }

constructor TcdClinicRegType.Create(AOwner: TComponent);
begin
  inherited Create(AOwner, HisConnection, sDataServiceClin,
    sDataNameClinRegType);
end;

function TcdClinicRegType.GetDiagPrice: Currency;
begin
  Result := Table.FieldByName('DiagPrice').AsCurrency;
end;

function TcdClinicRegType.GetRegPrice: Currency;
begin
  Result := Table.FieldByName('RegPrice').AsCurrency;
end;

function TcdClinicRegType.GetRegTypeID: Integer;
begin
  Result := Table.FieldByName('RegTypeID').AsInteger;
end;

{ TcdBaseFeeGroupMaster }

function TcdBaseFeeGroupMaster.CanDelete: Boolean;
begin
  Result := inherited CanDelete and
    (HisUser.IsAdmin or (MasterData.AsString[sFieldExecOfficeID]
    = HisUser.OfficeID))
end;

function TcdBaseFeeGroupMaster.CanEdit: Boolean;
begin
  Result := inherited CanEdit and
    (HisUser.IsAdmin or (MasterData.AsString[sFieldExecOfficeID]
    = HisUser.OfficeID))
end;

function TcdBaseFeeGroupMaster.CanInsert: Boolean;
begin
  Result := inherited CanInsert and
    (HisUser.IsAdmin or (MasterData.AsString[sFieldExecOfficeID]
    = HisUser.OfficeID))
end;

constructor TcdBaseFeeGroupMaster.Create(AOwner: TComponent);
begin
  inherited Create(AOwner, HisConnection, sDataServiceBase,
    sDataNameBaseFeeGroupMaster);
  AutoSave := True;
end;

function TcdBaseFeeGroupMaster.GetGroupID: Integer;
begin
  Result := Table.FieldByName('GroupID').AsInteger;
end;

function TcdBaseFeeGroupMaster.GetGroupName: string;
begin
  Result := Table.FieldByName('GroupName').AsString;
end;

{ TcdBaseFeeGroupDetail }

function TcdBaseFeeGroupDetail.CanDelete: Boolean;
begin
  Result := inherited CanDelete and MasterData.CanDelete
end;

function TcdBaseFeeGroupDetail.CanEdit: Boolean;
begin
  Result := inherited CanEdit and MasterData.CanEdit
end;

function TcdBaseFeeGroupDetail.CanInsert: Boolean;
begin
  Result := inherited CanInsert and MasterData.CanInsert
end;

constructor TcdBaseFeeGroupDetail.Create(AOwner: TComponent);
begin
  inherited Create(AOwner, HisConnection, sDataServiceBase,
    sDataNameBaseFeeGroupDetail);
  AutoSave := True;
end;

procedure TcdBaseFeeGroupDetail.DoDataCalcFields(Sender: TDADataTable);
begin
  inherited;
  with Sender do
    FieldByName('SumPrice').AsCurrency := FieldByName('Price').AsCurrency *
      FieldByName('Quan').AsCurrency
end;

function TcdBaseFeeGroupDetail.GetSelectedDetailIDList: string;
begin
  Result := DataTable_GetSelectedCommaText(Table, 'DetailID', 'SelectFlag', 1);
end;

{ TcdBaseClinFeeItem }

constructor TcdBaseClinFeeItem.Create(AOwner: TComponent);
begin
  FRecTypeID := sRecipeType_ClinMedX;
  inherited Create(AOwner, HisConnection, sDataServiceBase,
    sDataNameBaseClinFeeItem);
end;

procedure TcdBaseClinFeeItem.DoServerFilter(const AFilterText: string);
begin
  ParamValue['FilterText'] := AFilterText;
  Refresh;
end;

procedure TcdBaseClinFeeItem.SetClinID(const Value: string);
begin
  ParamValue['ClinID'] := Value;
  Close;
end;

procedure TcdBaseClinFeeItem.SetRecTypeID(const Value: string);
begin
  ParamValue['RecTypeID'] := Value;
  ParamValue['FilterText'] := '';
  Close;
end;

{ TcdBaseHospFeeItem }

constructor TcdBaseHospFeeItem.Create(AOwner: TComponent);
begin
  HospID := '';
  FAdviceTypeID := 0;
  inherited Create(AOwner, HisConnection, sDataServiceBase,
    sDataNameBaseHospFeeItem);
end;

procedure TcdBaseHospFeeItem.DoServerFilter(const AFilterText: string);
begin
  ParamValue['FilterText'] := AFilterText;
  Refresh;
end;

procedure TcdBaseHospFeeItem.SetAdviceTypeID(const Value: Integer);
begin
  ParamValue['AdviceTypeID'] := Value;
  ParamValue['FilterText'] := '';
  Close;
end;

procedure TcdBaseHospFeeItem.SetHospID(const Value: string);
begin
  ParamValue['Hosp'] := Value;
  FHospID := Value;
  Close;
end;

procedure OrganizeBaseOperations();
begin
  with TViewOperation.Create(sOperationIDBaseMedicine) do
  begin
    Category := sOperationCategoryBase;
    Caption := '药品信息维护';
    ImageName := sOperationIDBaseMedicine;
    Access := sAccessBaseMedicineFee;
    Order := 'I10';
    ViewClass := TBaseItemMedicineView;
  end;

  with TViewOperation.Create(sOperationIDBaseTreatment) do
  begin
    Category := sOperationCategoryBase;
    Caption := '诊疗项目维护';
    ImageName := sOperationIDBaseTreatment;
    Access := sAccessBaseTreatmentFee;
    Order := 'I20';
    ViewClass := TBaseItemTreatmentView;
  end;

  with TViewOperation.Create(sOperationIDBaseYBMedicine) do
  begin
    Category := sOperationCategoryBase;
    Caption := '医保药品目录维护';
    ImageName := sOperationIDBaseYBMedicine;
    Access := sAccessBaseMedicineFee;
    Order := 'I21';
    ViewClass := TBaseItemMedicineYBTableView;
  end;

  with TViewOperation.Create(sOperationIDBaseYBTreatment) do
  begin
    Category := sOperationCategoryBase;
    Caption := '医保诊疗目录维护';
    ImageName := sOperationIDBaseYBTreatment;
    Access := sAccessBaseTreatmentFee;
    Order := 'I22';
    ViewClass := TBaseItemTreatmentYBTableView;
  end;

  with TViewOperation.Create(sOperationIDBaseFeeGroup) do
  begin
    Category := sOperationCategoryBase;
    Caption := '收费组合项目维护';
    ImageName := sOperationIDBaseFeeGroup;
    Access := sAccessBaseFeeGroup;
    Order := 'I23';
    ViewClass := TBaseFeeGroupView;
  end;

  with TViewOperation.Create(sOperationIDBaseRecipeGroup) do
  begin
    Category := sOperationCategoryBase;
    Caption := '协定处方项目维护';
    ImageName := sOperationIDBaseRecipeGroup;
    Access := sAccessBaseRecipeGroup;
    Order := 'I25';
    ViewClass := TBaseRecipeGroupView;
  end;
  {

    with TViewOperation.Create(sOperationIDBaseSysAdGroup) do
    begin
    Category := sOperationCategoryBase;
    Caption := '组套维护';
    ImageName := 'group';
    Access := sAccessBaseSysAdGroup;
    Order := 'I23';
    ViewClass := TBaseAdviceGroupView;
    end;
  }
end;

{ TBaseItemMedicineView }

constructor TBaseItemMedicineView.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  UseFormForEditing := True;
  InitData(sDataNameBaseItemMedicine, iFeeSign_Medicine);
end;

{ TBaseItemTreatmentView }

constructor TBaseItemTreatmentView.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  InitData(sDataNameBaseItemTreatment, iFeeSign_Treatment);
end;

{ TBaseItemInfoView }

procedure TBaseItemInfoView.InitData(ALogicalName: string; AFeeSign: Integer);
begin
  if (AFeeSign <> iFeeSign_Medicine) then
    SetActionVisible(FStockAssignAction, False);

  EnableMultiSelect;
  SetDataEditing(True);
  FormView.AutoEdit := True;
  FilterEditItem.Visible := True;
  FFeeInfo := TcdBaseItemInfo.Create(Self, HisConnection, sDataServiceBase,
    ALogicalName);
  FFeeInfo.OpenBySign(AFeeSign);
  SetData(FFeeInfo);
end;

procedure TBaseItemInfoView.BuildViewAction;
begin
  inherited;
  OnDoubleClickView := FormViewAction.OnExecute;
  BuildAction('医保对应', '', '', nil, DoActionYB, 0, 0);
  BuildAction('农合对应', '', '', nil, DoActionXNH, 0, 0);
  FStockAssignAction := BuildAction('分配项目到科室库存表', '', '', nil,
    DoActionStockAssign, 0, 0);
  FormViewAction.Visible := True;
end;

procedure TBaseItemInfoView.DoActionYB(Sender: TObject);
begin
  BuildExtendGroup;

  if FYBView = nil then
  begin
    FYBView := TBaseItemYBView.Create(Self);
    // FYBView.Caption := '医保对应';
    // FYBView.Position := poMainFormCenter;
    // FYBView.OnNavigateData := DoActionYBNavigate;
    FYBView.BorderStyle := bsNone;
    FYBView.IsEmbedded := True;
    FYBView.ViewGroup.Caption := FYBView.Caption;
    FYBView.ViewGroup.ShowBorder := True;
    FYBView.Height := 200;
    FYBView.ViewData.BindMaster(ViewData, 'FeeID');

    with FExtendGroup.CreateGroup() do
    begin
      Caption := '医保对应';
      FYBView.Tag := Index;
      with CreateItemForControl(FYBView) do
      begin
        AlignHorz := ahClient;
        AlignVert := avClient;
      end;
    end;
  end;
  FExtendGroup.ItemIndex := FYBView.Tag;
end;

procedure TBaseItemInfoView.DoActionYBNavigate(Sender: TObject;
  NavigateAction: TNavigateAction);
begin
  DoGridNavigate(Sender, NavigateAction);
  FYBView.SetFeeID(FFeeInfo.FeeID, FFeeInfo.FeeName);
end;

procedure TBaseItemInfoView.DoActionStockAssign(Sender: TObject);
var
  MedOffice: TCustomData;
begin
  MedOffice := DataContainer.Items[sDataNameSysMedOffice];
  if DictIME.StartIME(nil, MedOffice, '', '', nil, False) and
    ShowYesNo('确定开始分配吗?') then
  begin
    EnumDataTable(MedOffice.Table, DoEnumMedOffice, '');
    ShowOK('分配完成');
  end;
end;

procedure TBaseItemInfoView.DoEnumMedOffice(ADataTable: TDADataTable;
  AParam: Variant);
begin
  if ADataTable.FieldByName('AssignFlag').AsBoolean then
  begin
    FCurrentStockOffice := ADataTable.FieldByName('OfficeID').AsString;
    ForEachSelected(DoEachSelectedItem);
  end;
end;

procedure TBaseItemInfoView.DoEachSelectedItem(Sender: TObject);
begin
  MedService.StockAssignItem(ViewData.AsInteger['FeeID'], FCurrentStockOffice);
end;

procedure TBaseItemInfoView.DoActionXNH(Sender: TObject);
var
  CurIndex: Integer;
begin
  BuildExtendGroup;
  // CurIndex := FExtendGroup.ItemIndex;

  if FXNHView = nil then
  begin
    FXNHView := TBaseItemXNHView.Create(Self);
    // FXNHView.Caption := '新农合对应';
    // FYBView.Position := poMainFormCenter;
    // FYBView.OnNavigateData := DoActionYBNavigate;
    FXNHView.BorderStyle := bsNone;
    FXNHView.IsEmbedded := True;
    FXNHView.ViewGroup.Caption := FYBView.Caption;
    FXNHView.ViewGroup.ShowBorder := True;
    FXNHView.Height := 200;
    FXNHView.ViewData.BindMaster(ViewData, 'FeeID');

    with FExtendGroup.CreateGroup do
    begin
      Caption := '新农合对应';
      FXNHView.Tag := Index;
      with CreateItemForControl(FXNHView) do
      begin
        AlignHorz := ahClient;
        AlignVert := avClient;
      end;
    end;
  end;

  FExtendGroup.ItemIndex := FXNHView.Tag;
end;

procedure TBaseItemInfoView.BuildExtendGroup;
begin
  if FExtendGroup = nil then
  begin
    ViewGroup.CreateItem(TdxLayoutSplitterItem);
    FExtendGroup := ViewGroup.CreateGroup();
    FExtendGroup.AlignHorz := ahClient;
    FExtendGroup.AlignVert := avClient;
    FExtendGroup.LayoutDirection := ldTabbed;
    FExtendGroup.ShowBorder := False;
  end;
end;

{ TBaseItemYBView }

procedure TBaseItemYBView.BuildViewAction;
begin
  inherited;
  // FirstAction.Visible := True;
  // PriorAction.Visible := True;
  // NextAction.Visible := True;
  // LastAction.Visible := True;
end;

constructor TBaseItemYBView.Create(AOwner: TComponent);
begin
  inherited;
  SetDataEditing(True);
  // 项目名称显示标签
  FNameItem := ToolBarGroup.CreateItemForControl(nil);
  FNameItem.AlignVert := avClient;
  FYBData := TcdBaseItemYB.Create(Self, HisConnection, sDataServiceBase,
    sDataNameBaseItemYB);
  FYBData.AutoSave := True;
  SetData(FYBData);
  AutoEdit := True;
  TableView.OptionsView.GroupByBox := False;
end;

procedure TBaseItemYBView.SetFeeID(AFeeID: Integer; const AFeeName: string);
begin
  FNameItem.Caption := AFeeName;
  FYBData.OpenByFeeID(AFeeID);
end;

{ TBaseItemYBTableView }

procedure TBaseItemYBTableView.InitData(AFeeSign: Integer);
var
  TempData: TCustomData;
  TempName: string;
begin
  SetDataEditing(True);
  FilterEditItem.Visible := True;
  TempName := IfThen(AFeeSign = 1, sDataNameBaseFeeMedicine,
    sDataNameBaseFeeTreatment);
  TempData := TCustomData.Create(Self, HisConnection, sDataServiceBase,
    sDataNameBaseItemYBTable);
  // TempData.Table.FieldByName('FeeName').CustomAttributes.Values['IME.DictName'] := TempName;
  TempData.FieldCustomAttributes['FeeName'].Values['IME.DictName'] := TempName;
  TempData.OpenByFieldValue('FeeSign', AFeeSign);
  ViewData := TempData;
end;

{ TBaseItemMedicineYBTableView }

constructor TBaseItemMedicineYBTableView.Create(AOwner: TComponent);
begin
  inherited;
  InitData(1);
end;

{ TBaseItemTreatmentYBTableView }

constructor TBaseItemTreatmentYBTableView.Create(AOwner: TComponent);
begin
  inherited;
  InitData(2);
end;

{ TBaseFeeGroupView }

constructor TBaseFeeGroupView.Create(AOwner: TComponent; AUseMode: Integer);
begin
  FUseMode := AUseMode;
  inherited Create(AOwner);
end;

procedure TBaseFeeGroupView.BuildViewLayout;
begin
  inherited;
  FRecipeType := TcdBaseRecipeType.Create(Self);
  FGroupMaster := TcdBaseFeeGroupMaster.Create(Self);
  FGroupDetail := TcdBaseFeeGroupDetail.Create(Self);
  FRecipeTypeView := TTreeDataView.Create(Self);
  FMasterView := TTableGridDataView.Create(Self);
  FDetailView := TTableGridDataView.Create(Self);
  FDetailView.InsertAction.ShortCut := ShortCut(VK_F9, []);

  FGroupMaster.BindMaster(FRecipeType, 'RecTypeID');
  FGroupDetail.BindMaster(FGroupMaster, 'GroupID');

  case FUseMode of
    0:
      FRecipeType.OpenAppType;
    1:
      FRecipeType.OpenClinAppType;
    2:
      FRecipeType.OpenHospAppType;
  end;

  with FRecipeTypeView do
  begin
    IsEmbedded := True;
    BorderStyle := bsNone;
    ToolBarGroup.Visible := False;
    ViewData := FRecipeType;
    OnRecordScroll := DoRecipeTypeScroll;
  end;
  FRecipeTypeView.Width := AppCore.IniFile.ReadInteger(ClassName,
    'RecTypeWidth', 120);

  with FMasterView do
  begin
    IsEmbedded := True;
    BorderStyle := bsNone;
    ViewGroup.ShowBorder := True;
    ViewGroup.Caption := '组合列表';
    FilterEditItem.Visible := True;
    ViewData := FGroupMaster;

    if FUseMode = 0 then
    begin
      SetDataEditing(True);
      // AutoEdit := True;
    end;
  end;

  with FDetailView do
  begin
    IsEmbedded := True;
    BorderStyle := bsNone;
    ViewGroup.ShowBorder := True;
    ViewGroup.Caption := '组合明细';
    ViewData := FGroupDetail;

    if FUseMode = 0 then
    begin
      SetDataEditing(True);
      // AutoEdit := True;
    end
    else
    begin
      FGroupDetail.LogChanges := False;
      ToolBarGroup.Visible := False;
      if MultiSelectField <> '' then
      begin
        // AutoEdit := True;
        // SetFieldEditing(['Quan']);
      end;
    end;
  end;

  with ViewLayout.Items do
  begin
    LayoutDirection := ldHorizontal;
    AlignHorz := AlignHorz;
    AlignVert := avClient;

    with CreateItemForControl(FRecipeTypeView) do
    begin
      AlignHorz := ahLeft;
      AlignVert := avClient;
      ShowBorder := False;
    end;

    CreateItem(TdxLayoutSplitterItem);

    with CreateGroup() do
    begin
      ShowBorder := False;
      AlignHorz := ahClient;

      with CreateItemForControl(FMasterView) do
      begin
        AlignVert := avClient;
      end;

      CreateItem(TdxLayoutSplitterItem);

      with CreateItemForControl(FDetailView) do
      begin
        AlignVert := avClient;
      end;
    end;
  end;
end;

destructor TBaseFeeGroupView.Destroy;
begin
  AppCore.IniFile.WriteInteger(ClassName, 'RecTypeWidth',
    FRecipeTypeView.Width);
  inherited;
end;

function TBaseFeeGroupView.GetMultiSelectCount: Integer;
begin
  Result := FDetailView.GetMultiSelectCount();
end;

procedure TBaseFeeGroupView.DoRecipeTypeScroll(Sender: TObject);
begin
  FMasterView.FilterText := '';
end;

{ TBaseRecipeGroupView }

procedure TBaseRecipeGroupView.BuildViewLayout;
begin
  inherited;
  FRecipeType := TcdBaseRecipeType.Create(Self);

  FGroupMaster := TcdBaseRecipeGroupMaster.Create(Self);
  FGroupMaster.UseMode := FUseMode;

  FGroupDetail := TcdBaseRecipeGroupDetail.Create(Self);
  FGroupDetail.UseMode := FUseMode;

  FRecipeTypeView := TTreeDataView.Create(Self);
  FMasterView := TTableGridDataView.Create(Self);
  FDetailView := TTableGridDataView.Create(Self);
  FDetailView.InsertAction.ShortCut := ShortCut(VK_F9, []);

  FGroupMaster.BindMaster(FRecipeType, 'RecTypeID');
  FGroupDetail.BindMaster(FGroupMaster, 'GroupID');

  case FUseMode of
    0:
      if HisUser.IsClinOffice then
        FRecipeType.OpenClinMedType
      else if HisUser.IsHospOffice then
        FRecipeType.OpenHospMedType
      else
        FRecipeType.OpenMedType;
    1:
      FRecipeType.OpenClinMedType;
    2:
      FRecipeType.OpenHospMedType;
  end;

  with FRecipeTypeView do
  begin
    BorderStyle := bsNone;
    ToolBarGroup.Visible := False;
    Width := 300;
    ViewData := FRecipeType;
    OnRecordScroll := DoRecipeTypeScroll;
  end;
  FRecipeTypeView.Width := AppCore.IniFile.ReadInteger(ClassName,
    'RecTypeWidth', 120);

  with FMasterView do
  begin
    BorderStyle := bsNone;
    ViewGroup.ShowBorder := True;
    ViewGroup.Caption := '处方主表';
    FilterEditItem.Visible := True;
    ViewData := FGroupMaster;

    if FUseMode = 0 then
    begin
      SetDataEditing(True);
      AutoEdit := True;
    end;
  end;

  with FDetailView do
  begin
    BorderStyle := bsNone;
    ViewGroup.ShowBorder := True;
    ViewGroup.Caption := '处方明细表';

    if FUseMode = 0 then
    begin
      SetDataEditing(True);
      AutoEdit := True;
      FGroupDetail.FieldByName('SelectFlag').Visible := False;
    end
    else
    begin
      FGroupDetail.LogChanges := False;
      ToolBarGroup.Visible := False;
    end;

    ViewData := FGroupDetail;
  end;

  with ViewLayout.Items do
  begin
    LayoutDirection := ldHorizontal;
    AlignHorz := AlignHorz;
    AlignVert := avClient;

    if FRecipeType.RecordCount > 1 then
    begin
      with CreateItemForControl(FRecipeTypeView) do
      begin
        AlignHorz := ahLeft;
        AlignVert := avClient;
        ShowBorder := False;
      end;

      CreateItem(TdxLayoutSplitterItem);
    end;

    with CreateGroup() do
    begin
      ShowBorder := False;
      AlignHorz := ahClient;

      with CreateItemForControl(FMasterView) do
      begin
        AlignVert := avClient;
      end;

      CreateItem(TdxLayoutSplitterItem);

      with CreateItemForControl(FDetailView) do
      begin
        AlignVert := avClient;
      end;
    end;
  end;

end;

constructor TBaseRecipeGroupView.Create(AOwner: TComponent; AUseMode: Integer);
begin
  FUseMode := AUseMode;
  inherited Create(AOwner);
end;

destructor TBaseRecipeGroupView.Destroy;
begin
  AppCore.IniFile.WriteInteger(ClassName, 'RecTypeWidth',
    FRecipeTypeView.Width);
  inherited;
end;

procedure TBaseRecipeGroupView.DoRecipeTypeScroll(Sender: TObject);
begin
  FMasterView.FilterText := '';
end;

procedure TBaseRecipeGroupView.RestoreMasterBookmark;
begin
  if FGroupMasterBookmark <> nil then
  begin
    FGroupMaster.GotoBookmark(FGroupMasterBookmark);
    FGroupMasterBookmark := nil;
  end;
end;

procedure TBaseRecipeGroupView.SaveMasterBookmark;
begin
  FGroupMasterBookmark := FGroupMaster.GetBookmark;
end;

{ TBaseFeeGroupDialog }

procedure TBaseFeeGroupDialog.BuildDialog;
begin
  inherited;

  FApplyMemoEdit := TcxTextEdit.Create(Self);
  FApplyMemoEdit.Width := 2 * FApplyMemoEdit.Width;

  FApplyDate := TcxDateEdit.Create(Self);
  FApplyDate.Date := Date();

  FGroupView := TBaseFeeGroupView.Create(Self, FUseMode);
  with FGroupView do
  begin
    BorderStyle := bsNone;
    Width := 800;
    Height := 600;
    GroupMasterView.OnDoubleClickView := DoSelectClick;
  end;

  if FUseMode = iUseArea_Clin then
  begin
    Caption := '门诊申请单';

    FExtendSignCheckBox := TcxCheckComboBox.Create(Self);
    DevExpress.BuildPropertiesProperty(FExtendSignCheckBox.Properties,
      FGroupView.GroupMasterData.CustomAttributes, nil);
  end
  else if FUseMode = iUseArea_Hosp then
  begin
    Caption := '住院申请单';

    FExtendSignCheckBox := TcxCheckComboBox.Create(Self);
    FGroupView.GroupMasterData.CustomAttributes.Values['Properties.Items'] :=
      FGroupView.GroupMasterData.CustomAttributes.Values['HospExtendSign'];
    DevExpress.BuildPropertiesProperty(FExtendSignCheckBox.Properties,
      FGroupView.GroupMasterData.CustomAttributes, nil);
  end;

  with DialogGroup do
  begin
    with CreateItemForControl(FGroupView) do
    begin
      AlignHorz := ahClient;
      AlignVert := avClient;
    end;
  end;

  with BottomGroup.CreateItemForControl(FApplyMemoEdit) do
  begin
    Caption := '申请单备注:';
    AlignVert := avCenter;
  end;

  if FUseMode = iUseArea_Clin then
  begin
    with BottomGroup.CreateItemForControl(FExtendSignCheckBox) do
    begin
      AlignHorz := ahLeft;
      AlignVert := avCenter;
      Caption := '处方标志(重症等)';
    end;
  end;

  if FUseMode = iUseArea_Hosp then
  begin
    FDateItem := BottomGroup.CreateItemForControl(FApplyDate);
    FDateItem.Caption := '检查时间:';
    FDateItem.AlignVert := avCenter;

    with BottomGroup.CreateItemForControl(FExtendSignCheckBox) do
    begin
      AlignHorz := ahLeft;
      AlignVert := avCenter;
      Caption := '申请单标志:';
    end;
  end;

  FSelectButton := BuildDXButton(Self, '选择后继续(&C)', DoSelectClick);
  with ButtonGroup.CreateItemForControl(FSelectButton) do
  begin
    Index := 0;
    Visible := False;
  end;

  OKButton.Caption := '选择并关闭(&Q)';
  OKButton.Width := FSelectButton.Width;
  CancelButton.Caption := '关闭(Esc)';
  OKItem.Visible := False;
end;

constructor TBaseFeeGroupDialog.Create(AOwner: TComponent; AUseMode: Integer);
begin
  FUseMode := AUseMode;
  inherited Create(AOwner);
  LayoutAutoSize := False;
  RestoreSize(780, 600);
end;

destructor TBaseFeeGroupDialog.Destroy;
begin
  SaveSize;
  inherited;
end;

procedure TBaseFeeGroupDialog.DoDialogOK(Sender: TObject);
begin
  DoCheckBeforeSelect;
  ModalResult := mrOk;
end;

function TBaseFeeGroupDialog.GetCheckDate: TDate;
begin
  Result := FApplyDate.Date;
end;

function TBaseFeeGroupDialog.GetApplyMemo: string;
begin
  Result := FApplyMemoEdit.Text;
end;

function TBaseFeeGroupDialog.GetGroupDetail: TcdBaseFeeGroupDetail;
begin
  Result := FGroupView.GroupDetailData;
end;

function TBaseFeeGroupDialog.GetGroupMaster: TcdBaseFeeGroupMaster;
begin
  Result := FGroupView.GroupMasterData;
end;

function TBaseFeeGroupDialog.GetRecipeType: TcdBaseRecipeType;
begin
  Result := FGroupView.RecipeTypeData;
end;

function TBaseFeeGroupDialog.Execute: Boolean;
begin
  FGroupView.GroupMasterView.FilterText := '';
  FApplyMemoEdit.Text := '';

  if FUseMode = iUseArea_Clin then
  begin
    FExtendSignCheckBox.Value := 0;
  end;
  Result := inherited Execute;
end;

procedure TBaseFeeGroupDialog.DoSelectClick(Sender: TObject);
begin
  DoCheckBeforeSelect;
  if Assigned(OnSelectGroup) then
    OnSelectGroup(Self);
end;

procedure TBaseFeeGroupDialog.DoCheckBeforeSelect;
var
  ThisGroup: string;
begin
  if Length(FGroupView.RecipeTypeData.RecTypeID) < 4 then
    raise Exception.Create('请选择有效的申请单类型');

  ThisGroup := FGroupView.GroupMasterData.AsString['GroupID'];
  if FLastSelectGroup = ThisGroup then
  begin
    if not ShowYesNo('本次选择与上次相同，确定继续选择吗?', False) then
      Abort;
  end;
  FLastSelectGroup := ThisGroup
end;

function TBaseFeeGroupDialog.GetExtendSign: Integer;
begin
  Result := FExtendSignCheckBox.Value;
end;

{ TBaseRecipeGroupDialog }

procedure TBaseRecipeGroupDialog.BuildDialog;
begin
  inherited;

  FMemoEdit := TcxTextEdit.Create(Self);
  FMemoEdit.Width := 2 * FMemoEdit.Width;

  FGroupView := TBaseRecipeGroupView.Create(Self, FUseMode);
  with FGroupView do
  begin
    BorderStyle := bsNone;
    Width := 800;
    Height := 600;
    GroupMasterView.OnDoubleClickView := DoSelectClick;
  end;

  if FUseMode = iUseArea_Clin then
  begin
    Caption := '门诊处方';
    FAppendRecipeCheckBox := BuildDXCheckBox(Self, '合并到当前处方', nil,
      False, clBlue);

    FExtendSignCheckBox := TcxCheckComboBox.Create(Self);
    DevExpress.BuildPropertiesProperty(FExtendSignCheckBox.Properties,
      FGroupView.GroupMasterData.CustomAttributes, nil);

    with BottomGroup.CreateGroup() do
    begin
      ShowBorder := False;
      AlignHorz := ahClient;
      AlignVert := avClient;
      LayoutDirection := ldHorizontal;

      with CreateItemForControl(FMemoEdit) do
      begin
        Caption := '处方备注:';
        AlignVert := avCenter;
        AlignHorz := ahLeft;
      end;

      with CreateItemForControl(FExtendSignCheckBox) do
      begin
        AlignHorz := ahRight;
        AlignVert := avCenter;
        Caption := '处方标志(重症等)';
      end;

      with CreateItemForControl(FAppendRecipeCheckBox) do
      begin
        AlignHorz := ahRight;
        AlignVert := avCenter;
      end;

      // with CreateItemForControl(nil) do
      // begin
      // Caption := '选择的处方类型与当前处方类型不同时，将自动创建新处方';
      // AlignVert := avCenter;
      // AlignHorz := ahLeft;
      // end;
    end;

    FEmptyButton := BuildDXButton(Self, '空白处方', DoEmptyClick);
    ButtonGroup.CreateItemForControl(FEmptyButton).Index := 1;
  end
  else
  begin
    Caption := '住院协定处方(嘱套)';

  end;

  with DialogGroup do
  begin
    with CreateItemForControl(FGroupView) do
    begin
      AlignHorz := ahClient;
      AlignVert := avClient;
    end;
  end;

  FSelectButton := BuildDXButton(Self, '选择并继续(&C)', DoSelectClick);
  with ButtonGroup.CreateItemForControl(FSelectButton) do
  begin
    Index := 0;
    Visible := False;
  end;

  OKButton.Caption := '选择并关闭(&Q)';
  OKButton.Width := FSelectButton.Width;
  CancelButton.Caption := '关闭(Esc)';
  OKItem.Visible := False;
end;

constructor TBaseRecipeGroupDialog.Create(AOwner: TComponent;
  AUseMode: Integer);
begin
  FUseMode := AUseMode;
  inherited Create(AOwner);
  LayoutAutoSize := False;
  RestoreSize(780, 600);
end;

destructor TBaseRecipeGroupDialog.Destroy;
begin
  SaveSize;
  inherited;
end;

procedure TBaseRecipeGroupDialog.DoCheckBeforeSelect;
var
  ThisGroup: string;
begin
  if Length(FGroupView.RecipeTypeData.RecTypeID) < 4 then
    raise Exception.Create('请选择二级处方类型');

  if FGroupView.GroupMasterData.Eof then
    ThisGroup := ''
  else
    ThisGroup := FGroupView.GroupMasterData.AsString['GroupID'];

  // if (ThisGroup <> '') and (FLastSelectGroup = ThisGroup) then
  // begin
  // if not ShowYesNo('本次选择与上次相同，确定继续选择吗?', False) then
  // Abort;
  // end;

  FLastSelectGroup := ThisGroup
end;

procedure TBaseRecipeGroupDialog.DoDialogOK(Sender: TObject);
begin
  DoCheckBeforeSelect;
  ModalResult := mrOk;
end;

procedure TBaseRecipeGroupDialog.DoEmptyClick(Sender: TObject);
begin
  FAppendRecipeCheckBox.Checked := False;
  FGroupView.SaveMasterBookmark;
  FGroupView.GroupMasterData.Table.Last;
  FGroupView.GroupMasterData.Table.Next;
  DoDialogOK(nil);
end;

procedure TBaseRecipeGroupDialog.DoSelectClick(Sender: TObject);
begin
  DoCheckBeforeSelect;
  if Assigned(OnSelectGroup) then
    OnSelectGroup(Self);
end;

function TBaseRecipeGroupDialog.Execute: Boolean;
begin
  FMemoEdit.Text := '';
  FGroupView.RestoreMasterBookmark;
  FGroupView.GroupMasterView.FilterText := '';
  if FUseMode = iUseArea_Clin then
  begin
    FAppendRecipeCheckBox.Checked := True;
    FExtendSignCheckBox.Value := 0;
  end;
  Result := inherited Execute;
end;

function TBaseRecipeGroupDialog.GetAppendRecipe: Boolean;
begin
  Result := FAppendRecipeCheckBox.Checked;
end;

function TBaseRecipeGroupDialog.GetExtendSign: Integer;
begin
  Result := FExtendSignCheckBox.Value;
end;

function TBaseRecipeGroupDialog.GetGroupDetail: TcdBaseRecipeGroupDetail;
begin
  Result := FGroupView.GroupDetailData;
end;

function TBaseRecipeGroupDialog.GetGroupMaster: TcdBaseRecipeGroupMaster;
begin
  Result := FGroupView.GroupMasterData;
end;

function TBaseRecipeGroupDialog.GetRecipeMemo: string;
begin
  Result := FMemoEdit.Text;
end;

function TBaseRecipeGroupDialog.GetRecipeType: TcdBaseRecipeType;
begin
  Result := FGroupView.RecipeTypeData;
end;

{ TBaseItemXNHView }

constructor TBaseItemXNHView.Create(AOwner: TComponent);
begin
  inherited;
  SetDataEditing(True);
  AutoEdit := True;
  ViewData := TcdBaseItemYB.Create(Self, HisConnection, sDataServiceXNH,
    sDataNameXNHFee);
  ViewData.AutoSave := True;
  TableView.OptionsView.GroupByBox := False;
end;

procedure TBaseItemXNHView.DataQuery;
begin
  ViewData.OpenByFieldValue('FeeID', ViewData.MasterKey);
end;

end.
