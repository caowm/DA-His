unit HisClient_Medicine;

{
  HIS药品模块

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
  uDAWhere,
  uDAFields,
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
  HisClient_Classes;

type

  TMedInOutOperation = class;

  THisMedService = class(TCustomDataService)
  public
    function InOutSubmit(const AInOutID: string): Integer;
    procedure InOutAccept(const AInOutID: string);
    function InOutReceive(const AInOutID: string): Integer;
    procedure InOutPrint(const AInOutID, AReportName: string);
    procedure StockAssignItem(AFeeID: Integer; AOfficeID: string);
    function StockSnap(AParam: string): Integer;
  end;

  TcdMedInOutType = class(TCustomData)
  private
  public
    constructor Create(AOwner: TComponent); reintroduce;
  end;

  TcdMedInOutTypeOffice = class(TCustomData)
  private
  public
    constructor Create(AOwner: TComponent); reintroduce;

    procedure OpenByOffice(AOfficeID: string);
  end;

  TcdMedInOutMaster = class(TCustomData)
  private
    FOperation: TMedInOutOperation;
    function GetInOutState: Integer;
    procedure SetInOutState(const Value: Integer);
    function GetAcceptOfficeID: string;
    function GetApplyOfficeID: string;
    procedure SetAcceptOfficeID(const Value: string);
    procedure SetApplyOfficeID(const Value: string);
    function GetInOutID: string;
    function GetApplyOpID: string;
    procedure SetApplyOpID(const Value: string);
  protected
    procedure DoDataAfterInsert(Sender: TDADataTable); override;
  public
    constructor Create(AOwner: TComponent; AOperation: TMedInOutOperation);
      reintroduce;

    function CanInsert(): Boolean; override;
    function CanEdit(): Boolean; override;
    function CanDelete(): Boolean; override;

    procedure OpenCurrentInOutType(ABeginDate, AEndDate: TDateTime);

    property InOutID: string read GetInOutID;
    property InOutState: Integer read GetInOutState write SetInOutState;
    property ApplyOfficeID: string read GetApplyOfficeID write SetApplyOfficeID;
    property ApplyOpID: string read GetApplyOpID write SetApplyOpID;
    property AcceptOfficeID: string read GetAcceptOfficeID
      write SetAcceptOfficeID;
  end;

  TcdMedInOutDetail = class(TCustomData)
  private
    function GetInOutMaster: TcdMedInOutMaster;
  protected
    procedure DoDataBeforePost(Sender: TDADataTable); override;
    procedure DoDataAfterPost(Sender: TDADataTable); override;
    procedure DoFieldChangePlanQuan(Sender: TDACustomField);
  public
    constructor Create(AOwner: TComponent; AOperation: TMedInOutOperation);
      reintroduce;

    procedure Open(); override;
    procedure QueryAfterMasterScroll(); override;

    function CanInsert(): Boolean; override;
    function CanEdit(): Boolean; override;
    function CanDelete(): Boolean; override;

    property InOutMaster: TcdMedInOutMaster read GetInOutMaster;
  end;

  TcdMedStock = class(TCustomData)
  private
  protected
    procedure DoDataBeforePost(Sender: TDADataTable); override;
  public
    constructor Create(AOwner: TComponent); reintroduce;

    procedure OpenMyStock();
  end;

  TcdMedCheckMaster = class(TCustomData)
  private
  public
    constructor Create(AOwner: TComponent); reintroduce;
  end;

  TcdMedChecDetail = class(TCustomData)
  private
  public
    constructor Create(AOwner: TComponent); reintroduce;
  end;

  TcvMedInOutMaster = class(TTableGridDataView)
  private
    FOperation: TMedInOutOperation;
    FInOutMaster: TcdMedInOutMaster;
    FInOutDetail: TcdMedInOutDetail;
    FSubmitAction: TAction;
    FAcceptAction: TAction;
    FReceiveAction: TAction;
    procedure SetInOutOperation(AOperation: TMedInOutOperation);
    procedure DoActionSubmitUpdate(Sender: TObject);
    procedure DoActionSubmitExecute(Sender: TObject);
    procedure DoActionAcceptUpdate(Sender: TObject);
    procedure DoActionAcceptExecute(Sender: TObject);
    procedure DoActionReceiveUpdate(Sender: TObject);
    procedure DoActionReceiveExecute(Sender: TObject);
  protected
    procedure BuildViewAction(); override;
  public
    constructor Create(AOwner: TComponent); override;
    procedure DataQuery(); override;
    procedure DataPrint(); override;
  end;

  TcvMedInOutDetail = class(TTableGridDataView)
  private
    FInOutDetail: TcdMedInOutDetail;
    procedure SetInOutOperation(AOperation: TMedInOutOperation);
  protected
    procedure BuildViewAction(); override;
  public
    constructor Create(AOwner: TComponent); override;
  end;

  TcvMedInOutView = class(TBaseLayoutView)
  private
    FMasterView: TcvMedInOutMaster;
    FDetailView: TcvMedInOutDetail;
  protected
    procedure BuildViewLayout(); override;
    procedure SetOperation(const Value: TBaseOperation); override;
  public

  end;

  TMedInOutOperation = class(TViewOperation)
  private
    FSchemaTable: string;
    FInOutSign: Integer;
    FAcceptOfficeName: string;
    FAcceptOfficeID: string;
    FInOutTypeID: string;
    FInOutName: string;
    FReportName: string;
    function GetIsApply: Boolean;
    function GetIsAcceptor: Boolean;
  protected
    function GetViewClass(): TBaseViewClass; override;
  public
    property InOutTypeID: string read FInOutTypeID write FInOutTypeID;
    property InOutName: string read FInOutName write FInOutName;
    property InOutSign: Integer read FInOutSign write FInOutSign;
    property AcceptOfficeID: string read FAcceptOfficeID write FAcceptOfficeID;
    property AcceptOfficeName: string read FAcceptOfficeName
      write FAcceptOfficeName;
    property SchemaTable: string read FSchemaTable write FSchemaTable;
    property ReportName: string read FReportName write FReportName;
    property IsApply: Boolean read GetIsApply; // 是否为申请业务
    property IsAcceptor: Boolean read GetIsAcceptor; // 是否申请单的接收科室
  end;

  TcvMedStock = class(TTableGridDataView)
  private
    procedure DoActionSnap(Sender: TObject);
  protected
    function GetPluginFlag(): Integer; override;
    procedure BuildViewAction(); override;
  public
    constructor Create(AOwner: TComponent); override;
    procedure DataQuery(); override;
  end;

  TcvMedCheckMaster = class(TTableGridDataView)
  private
    procedure DoActionCheckDetail(Sender: TObject);
    procedure DoActionCheckBatch(Sender: TObject);
  protected
    procedure DoDoubleClickView(Sender: TObject);
    procedure BuildViewAction(); override;
  public
    constructor Create(AOwner: TComponent); override;
    procedure DataQuery(); override;
  end;

  TcvMedCheckDetail = class(TTableGridDataView)
  protected
    FCheckID: Integer;
    function DoExecute(CommandID: Integer; const Param: array of Variant)
      : Variant; override;
  public
    constructor Create(AOwner: TComponent); override;
    procedure DataQuery(); override;
  end;

  TcvMedCheckBatch = class(TTableGridDataView)
  protected
    FCheckID: Integer;
    function DoExecute(CommandID: Integer; const Param: array of Variant)
      : Variant; override;
  public
    constructor Create(AOwner: TComponent); override;
    procedure DataQuery(); override;
  end;

procedure OrganizeMedicineOperation();
procedure LoadMedicineInOutOperation();

var
  MedService: THisMedService;

implementation

procedure OrganizeMedicineOperation();
begin
  with TViewOperation.Create(sOperationIDMedStock) do
  begin
    Category := sOperationCategoryMedicine;
    Caption := '库存信息';
    Access := sAccessMedStock;
    ImageName := 'med_stock';
    Order := 'P031';
    ViewClass := TcvMedStock;
  end;

  with TViewOperation.Create(sOperationIDMedCheckMaster) do
  begin
    Category := sOperationCategoryMedicine;
    Caption := '库存结转信息';
    Access := sAccessMedStock;
    ImageName := 'med_check';
    Order := 'P032';
    ViewClass := TcvMedCheckMaster;
  end;

  with TViewOperation.Create(sOperationIDMedCheckDetail) do
  begin
    Category := sOperationCategoryMedicine;
    Caption := '库存结转明细';
    Access := sAccessMedStock;
    ImageName := 'med_check_detail';
    Order := 'P033';
    ViewClass := TcvMedCheckDetail;
    Flag := iOperationFlag_NoMenu or iOperationFlag_NoTree;
  end;

  with TViewOperation.Create(sOperationIDMedCheckBatch) do
  begin
    Category := sOperationCategoryMedicine;
    Caption := '库存结转批次';
    Access := sAccessMedStock;
    ImageName := 'med_check_batch';
    Order := 'P034';
    ViewClass := TcvMedCheckBatch;
    Flag := iOperationFlag_NoMenu or iOperationFlag_NoTree;
  end;
end;

procedure LoadMedicineInOutOperation();
var
  InOutTypeOffice: TcdMedInOutTypeOffice;
begin
  AppCore.Logger.Write('正在加载出入库业务操作...', mtDebug, 0);
  // 确认用户的科室后调用此过程
  InOutTypeOffice := TcdMedInOutTypeOffice.Create(nil);
  try
    with InOutTypeOffice do
    begin
      OpenByOffice(HisUser.OfficeID);
      while not Eof do
      begin
        with TMedInOutOperation.Create('MedInOut_' + AsString['InOutTypeID']) do
        begin
          InOutTypeID := AsString['InOutTypeID'];
          InOutName := AsString['InOutName'];
          InOutSign := AsInteger['InOutSign'];
          AcceptOfficeID := AsString['AcceptOfficeID'];
          AcceptOfficeName := AsString['AcceptOfficeName'];
          SchemaTable := AsString['SchemaTable'];
          Access := AsString['Access'];
          Order := AsString['OrderNum'];
          ImageName := AsString['ImageName'];
          ReportName := AsString['ReportName'];

          Caption := InOutName;

          if IsApply then
          begin
            Category := '药品,申请单';
          end
          else
            Category := '药品,出入库';
        end;

        Next;
      end;
    end;
  finally
    InOutTypeOffice.Free;
  end;
end;

{ TcdMedInOutMaster }

function TcdMedInOutMaster.CanDelete: Boolean;
begin
  Result := inherited CanDelete and SameText(AsString['ApplyOpID'], HisUser.ID)
    and (InOutState = iMedInOutState_Editing)
end;

function TcdMedInOutMaster.CanEdit: Boolean;
begin
  Result := inherited CanEdit and SameText(AsString['ApplyOpID'], HisUser.ID)
    and (InOutState = iMedInOutState_Editing)
end;

function TcdMedInOutMaster.CanInsert: Boolean;
begin
  Result := inherited CanInsert and not FOperation.IsAcceptor
end;

constructor TcdMedInOutMaster.Create(AOwner: TComponent;
  AOperation: TMedInOutOperation);
begin
  FOperation := AOperation;
  inherited Create(AOwner, HisConnection, sDataServiceMedicine,
    'Med_InOut_' + AOperation.SchemaTable + 'Master');
end;

procedure TcdMedInOutMaster.DoDataAfterInsert(Sender: TDADataTable);
begin
  inherited;
  AsInteger['InOutState'] := 0;
  AsString['InOutTypeID'] := FOperation.InOutTypeID;
  AsString['InOutName'] := FOperation.InOutName;
  AsInteger['InOutSign'] := FOperation.InOutSign;

  AsString['ApplyOpID'] := HisUser.ID;
  AsString['ApplyOpName'] := HisUser.Name;
  AsString['ApplyOfficeID'] := HisUser.OfficeID;
  if Sender.FindField('ApplyOfficeName') <> nil then
    AsString['ApplyOfficeName'] := HisUser.OfficeName;

  if Sender.FindField('AcceptOfficeID') <> nil then
  begin
    AsString['AcceptOfficeID'] := FOperation.AcceptOfficeID;
    AsString['AcceptOfficeName'] := FOperation.AcceptOfficeName;
  end;
end;

function TcdMedInOutMaster.GetAcceptOfficeID: string;
begin
  Result := AsString['AcceptOfficeID'];
end;

function TcdMedInOutMaster.GetApplyOfficeID: string;
begin
  Result := AsString['ApplyOfficeID'];
end;

function TcdMedInOutMaster.GetApplyOpID: string;
begin
  Result := AsString['ApplyOpID'];
end;

function TcdMedInOutMaster.GetInOutID: string;
begin
  Result := AsString['InOutID'];
end;

function TcdMedInOutMaster.GetInOutState: Integer;
begin
  Result := AsInteger['InOutState'];
end;

procedure TcdMedInOutMaster.OpenCurrentInOutType(ABeginDate,
  AEndDate: TDateTime);
begin
  if FOperation.IsApply and FOperation.IsAcceptor then
    OpenByList(['InOutTypeID', 'AcceptTime', 'AcceptTime'],
      [FOperation.InOutTypeID, ABeginDate, AEndDate + 1],
      [dboEqual, dboGreaterOrEqual, dboLess], [dboAnd, dboAnd])
  else
    OpenByList(['InOutTypeID', 'ApplyOfficeID', 'AcceptTime', 'AcceptTime'],
      [FOperation.InOutTypeID, HisUser.OfficeID, ABeginDate, AEndDate + 1],
      [dboEqual, dboEqual, dboGreaterOrEqual, dboLess],
      [dboAnd, dboAnd, dboAnd])
end;

procedure TcdMedInOutMaster.SetAcceptOfficeID(const Value: string);
begin
  AsString['AcceptOfficeID'] := Value;
end;

procedure TcdMedInOutMaster.SetApplyOfficeID(const Value: string);
begin
  AsString['ApplyOfficeID'] := Value;
end;

procedure TcdMedInOutMaster.SetApplyOpID(const Value: string);
begin
  AsString['ApplyOpID'] := Value;
end;

procedure TcdMedInOutMaster.SetInOutState(const Value: Integer);
begin
  AsInteger['InOutState'] := Value;
end;

{ TcdMedInOutDetail }

function TcdMedInOutDetail.CanDelete: Boolean;
begin
  Result := inherited CanDelete and (InOutMaster <> nil) and
    (InOutMaster.InOutState = iMedInOutState_Editing) and
    SameText(InOutMaster.ApplyOpID, HisUser.ID);
end;

function TcdMedInOutDetail.CanEdit: Boolean;
begin
  Result := inherited CanEdit and (InOutMaster <> nil) and
    ((SameText(InOutMaster.ApplyOpID, HisUser.ID)) or
    ((InOutMaster.InOutState = iMedInOutState_Applying) and
    InOutMaster.FOperation.IsAcceptor));
end;

function TcdMedInOutDetail.CanInsert: Boolean;
begin
  Result := inherited CanInsert and (InOutMaster <> nil) and
    (InOutMaster.InOutState = iMedInOutState_Editing) and
    SameText(InOutMaster.ApplyOpID, HisUser.ID);
end;

constructor TcdMedInOutDetail.Create(AOwner: TComponent;
  AOperation: TMedInOutOperation);
begin
  // 注意Shema中的命名规则: Med_InOut_ + xxxxx + Master
  inherited Create(AOwner, HisConnection, sDataServiceMedicine,
    'Med_InOut_' + AOperation.SchemaTable + 'Detail');

  if AOperation.IsApply then
  begin
    Table.FieldByName('PlanQuan').OnChange := DoFieldChangePlanQuan;

    if AOperation.IsAcceptor then
    begin
      Table.FieldByName('PlanQuan').CustomAttributes.Add
        ('Options.Editing=False');
      Table.FieldByName('FeeName').CustomAttributes.Add('Options.Editing=False')
    end
    else
    begin
      Table.FieldByName('Quan').CustomAttributes.Add('Options.Editing=False')
    end;
  end;
end;

procedure TcdMedInOutDetail.DoDataAfterPost(Sender: TDADataTable);
var
  HintFlag: Integer;
  HintText: string;
begin
  inherited;
  MedService.DACommand.Execute('Pro_Med_InOutDetail_Hint',
    ['DetailID', 'HintFlag', 'HintText'], [AsInteger['DetailID'], 0, '']);
  HintFlag := MedService.GetCommandOutputParam('HintFlag');
  HintText := MedService.GetCommandOutputParam('HintText');
  if HintText <> '' then
  begin
    ShowWarning(HintText);
    AppCore.Logger.Write(HintText, mtInfo, HintFlag);
  end;
end;

procedure TcdMedInOutDetail.DoDataBeforePost(Sender: TDADataTable);
begin
  inherited;
  AsCurrency['SumPrice'] := AsFloat['Quan'] * AsFloat['Price'];

  if Table.FindField('InMoney') <> nil then
    AsCurrency['InMoney'] := AsFloat['Quan'] * AsFloat['InPrice']
end;

procedure TcdMedInOutDetail.DoFieldChangePlanQuan(Sender: TDACustomField);
begin
  AsFloat['Quan'] := AsFloat['PlanQuan'];
end;

function TcdMedInOutDetail.GetInOutMaster: TcdMedInOutMaster;
begin
  Result := TcdMedInOutMaster(MasterData);
end;

procedure TcdMedInOutDetail.Open;
begin
  OpenByFieldValue('InOutID', MasterKey);
end;

procedure TcdMedInOutDetail.QueryAfterMasterScroll;
begin
  if Table.Params.Count > 0 then
  begin
    OpenByParam(['InOutID', 'OfficeID', 'OpID'],
      [VarToStr(MasterKey), HisUser.OfficeID, HisUser.ID]);
  end
  else
    inherited;
end;

{ TcdMedStock }

constructor TcdMedStock.Create(AOwner: TComponent);
begin
  inherited Create(AOwner, HisConnection, sDataServiceMedicine,
    sDataNameMedStock);
end;

procedure TcdMedStock.DoDataBeforePost(Sender: TDADataTable);
begin
  inherited;
  AsString['OfficeID'] := HisUser.OfficeID;
end;

procedure TcdMedStock.OpenMyStock;
begin
  OpenByFieldValue('OfficeID', HisUser.OfficeID);
end;

{ TcdMedCheckMaster }

constructor TcdMedCheckMaster.Create(AOwner: TComponent);
begin
  inherited Create(AOwner, HisConnection, sDataServiceMedicine,
    sDataNameMedCheckMaster);
end;

{ TcdMedChecDetail }

constructor TcdMedChecDetail.Create(AOwner: TComponent);
begin
  inherited Create(AOwner, HisConnection, sDataServiceMedicine,
    sDataNameMedCheckDetail);
end;

{ TcdMedInOutType }

constructor TcdMedInOutType.Create(AOwner: TComponent);
begin
  inherited Create(AOwner, HisConnection, sDataServiceMedicine,
    sDataNameBaseStockInOutType);
end;

{ TcdMedInOutTypeOffice }

constructor TcdMedInOutTypeOffice.Create(AOwner: TComponent);
begin
  inherited Create(AOwner, HisConnection, sDataServiceBase,
    'Base_StockInOutOffice');
end;

procedure TcdMedInOutTypeOffice.OpenByOffice(AOfficeID: string);
begin
  OpenByParam(['OfficeID'], [AOfficeID]);
end;

{ TcvMedInOutMaster }

procedure TcvMedInOutMaster.BuildViewAction;
begin
  inherited;
  FSubmitAction := BuildAction('提交申请', 'sumbit', '', DoActionSubmitUpdate,
    DoActionSubmitExecute, 0, 0);
  FAcceptAction := BuildAction('接收申请', 'accept', '', DoActionAcceptUpdate,
    DoActionAcceptExecute, 0, 0);
  FReceiveAction := BuildAction('签收', 'receive', '', DoActionReceiveUpdate,
    DoActionReceiveExecute, 0, 0);
end;

constructor TcvMedInOutMaster.Create(AOwner: TComponent);
begin
  inherited;
  DeleteAction.ShortCut := 0;
  EditAction.ShortCut := 0;

  SetDataEditing(True);
  Printing := True;
  PeriodGroup.Visible := True;
  // BeginDate := Date - 2;
  ViewGroup.ShowBorder := True;
  ViewGroup.Caption := '业务单列表';
end;

procedure TcvMedInOutMaster.DataPrint;
begin
  inherited;
end;

procedure TcvMedInOutMaster.DataQuery;
begin
  FInOutMaster.OpenCurrentInOutType(BeginDate, EndDate);
end;

procedure TcvMedInOutMaster.DoActionAcceptExecute(Sender: TObject);
begin
  if not ShowYesNo('确定接收执行' + FInOutMaster.InOutID + '申请单吗？' +
    #13#10#13#10'系统将执行出入库操作，并且无法撤销，请仔细核对。') then
    Exit;

  FInOutDetail.Save;

  MedService.InOutAccept(FInOutMaster.InOutID);
  FInOutMaster.EditWithNoLogChanges(['InOutState'], [iMedInOutState_Finished]);

  AppCore.Logger.WriteFmt('出入库申请单执行成功|%s', [FInOutMaster.InOutID], mtInfo, 1);
end;

procedure TcvMedInOutMaster.DoActionAcceptUpdate(Sender: TObject);
begin
  FAcceptAction.Enabled := (FInOutMaster <> nil) and FOperation.IsAcceptor and
    not FInOutMaster.Eof and not(FInOutMaster.Table.State in [dsInsert, dsEdit])
    and (FInOutMaster.AsInteger['InOutState'] = iMedInOutState_Applying);
end;

procedure TcvMedInOutMaster.DoActionReceiveExecute(Sender: TObject);
begin
  if not ShowYesNo('确定签收吗？') then
    Exit;

  FInOutMaster.EditWithNoLogChanges(['InOutState', 'ReceiveOpID',
    'ReceiveTime'], [MedService.InOutReceive(FInOutMaster.InOutID),
    HisUser.ID, Date()]);

  AppCore.Logger.WriteFmt('出入库申请单签收成功|%s', [FInOutMaster.InOutID], mtInfo, 1);
end;

procedure TcvMedInOutMaster.DoActionReceiveUpdate(Sender: TObject);
begin
  FReceiveAction.Enabled := (FInOutMaster <> nil) and not FInOutMaster.Eof and
    SameText(FInOutMaster.ApplyOfficeID, HisUser.OfficeID) and
    (FInOutMaster.AsInteger['InOutState'] = iMedInOutState_Finished);
end;

procedure TcvMedInOutMaster.DoActionSubmitExecute(Sender: TObject);
begin
  if (FOperation.AcceptOfficeID <> '') then
  begin
    if not ShowYesNo('确定提交' + FInOutMaster.InOutID + '申请单吗？' +
      #13#10#13#10'提交后将不能修改数据，请仔细核对.') then
      Exit
  end
  else
  begin
    if not ShowYesNo('确定提交' + FInOutMaster.InOutID + '出入库业务吗？' +
      #13#10#13#10'系统将执行出入库操作，并且无法撤销，请仔细核对.') then
      Exit;
  end;

  FInOutDetail.Save;

  FInOutMaster.EditWithNoLogChanges(['InOutState'],
    [MedService.InOutSubmit(FInOutMaster.InOutID)]);

  AppCore.Logger.WriteFmt('出入库申请单提交成功|%s', [FInOutMaster.InOutID], mtInfo, 1);
end;

procedure TcvMedInOutMaster.DoActionSubmitUpdate(Sender: TObject);
begin
  FSubmitAction.Enabled := (FInOutMaster <> nil) and FInOutMaster.CanEdit and
    (FInOutMaster.AsInteger['InOutState'] = iMedInOutState_Editing);
end;

procedure TcvMedInOutMaster.SetInOutOperation(AOperation: TMedInOutOperation);
begin
  FOperation := AOperation;
  Caption := FOperation.Caption;
  ViewGroup.Caption := FOperation.InOutName + '列表';
  if (FOperation.AcceptOfficeID = '') then
  begin
    ResetActionCaption(FSubmitAction, '提交业务');
    SetActionVisible(FAcceptAction, False);
    SetActionVisible(FReceiveAction, False);
  end
  else
  begin
    ViewGroup.Caption := '申请单列表';
  end;
  FInOutMaster := TcdMedInOutMaster.Create(Self, AOperation);
  ViewData := FInOutMaster;
end;

{ TcvMedInOutDetail }

procedure TcvMedInOutDetail.BuildViewAction;
begin
  inherited;
  InsertAction.ShortCut := ShortCut(VK_F9, []);
end;

constructor TcvMedInOutDetail.Create(AOwner: TComponent);
begin
  inherited;
  SetDataEditing(True);
  ViewGroup.ShowBorder := True;
  ViewGroup.Caption := '明细信息';
end;

procedure TcvMedInOutDetail.SetInOutOperation(AOperation: TMedInOutOperation);
begin
  FInOutDetail := TcdMedInOutDetail.Create(Self, AOperation);
  ViewData := FInOutDetail;
end;

{ TcvMedInOutView }

procedure TcvMedInOutView.BuildViewLayout;
begin
  FMasterView := TcvMedInOutMaster.Create(Self);
  FMasterView.BorderStyle := bsNone;
  FMasterView.IsEmbedded := True;

  FDetailView := TcvMedInOutDetail.Create(Self);
  FDetailView.BorderStyle := bsNone;
  FDetailView.IsEmbedded := True;

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

procedure TcvMedInOutView.SetOperation(const Value: TBaseOperation);
begin
  inherited;
  FMasterView.SetInOutOperation(TMedInOutOperation(Value));
  FDetailView.SetInOutOperation(TMedInOutOperation(Value));
  FDetailView.FInOutDetail.BindMaster(FMasterView.FInOutMaster, 'InOutID');
  FMasterView.FInOutDetail := FDetailView.FInOutDetail;
end;

{ TMedInOutOperation }

function TMedInOutOperation.GetIsAcceptor: Boolean;
begin
  Result := SameText(FAcceptOfficeID, HisUser.OfficeID);
end;

function TMedInOutOperation.GetIsApply: Boolean;
begin
  Result := AcceptOfficeID <> '';
end;

function TMedInOutOperation.GetViewClass: TBaseViewClass;
begin
  Result := TcvMedInOutView;
end;

{ THisMedService }

procedure THisMedService.InOutAccept(const AInOutID: string);
begin
  DACommand.Execute('Pro_Med_InOut_Accept', ['InOutID', 'OpID', 'OfficeID'],
    [AInOutID, HisUser.ID, HisUser.OfficeID]);
end;

procedure THisMedService.InOutPrint(const AInOutID, AReportName: string);
begin
  Check((AReportName = ''), '此出入库业务没有设置打印报表.');

  PrintReportFromServer(AReportName, ['InOutID', 'UnitName'],
    [AInOutID, HisUser.UnitName]);
end;

function THisMedService.InOutReceive(const AInOutID: string): Integer;
begin
  DACommand.Execute('Pro_Med_InOut_Receive', ['InOutID', 'OpID', 'OfficeID',
    'NewState'], [AInOutID, HisUser.ID, HisUser.OfficeID, 0]);
  Result := GetCommandOutputParam('NewState');
end;

function THisMedService.InOutSubmit(const AInOutID: string): Integer;
begin
  DACommand.Execute('Pro_Med_InOut_Submit', ['InOutID', 'OpID', 'OfficeID',
    'NewState'], [AInOutID, HisUser.ID, HisUser.OfficeID, 0]);
  Result := GetCommandOutputParam('NewState');
end;

procedure THisMedService.StockAssignItem(AFeeID: Integer; AOfficeID: string);
begin
  DACommand.Execute('Pro_Med_Stock_AssignItem', ['FeeID', 'OfficeID', 'OpID'],
    [AFeeID, AOfficeID, HisUser.ID]);
end;

function THisMedService.StockSnap(AParam: string): Integer;
begin
  // 结转库存
  DACommand.Execute('Pro_Med_Stock_Snap', ['CheckID', 'OpID', 'OfficeID',
    'Param'], [0, HisUser.ID, HisUser.OfficeID, AParam]);
  Result := GetCommandOutputParam('CheckID');
end;

{ TcvMedStock }

procedure TcvMedStock.BuildViewAction;
begin
  inherited;
  BuildAction('结转库存', 'snap', '', nil, DoActionSnap, 0, BTN_SHOWCAPTION);
end;

constructor TcvMedStock.Create(AOwner: TComponent);
begin
  inherited;
  ViewData := TcdMedStock.Create(Self);
  SetDataEditing(True);
  FilterEditItem.Visible := True;
end;

procedure TcvMedStock.DataQuery;
begin
  TcdMedStock(ViewData).OpenMyStock;
end;

procedure TcvMedStock.DoActionSnap(Sender: TObject);
var
  CheckID: Integer;
begin
  if ShowYesNo('库存结转之后将无法撤销，确定结转库存吗？', False) then
  begin
    AppCore.Logger.Write('开始结转库存', mtInfo, 0);
    CheckID := MedService.StockSnap('');
    AppCore.Logger.WriteFmt('结转成功|%d', [CheckID], mtInfo, 1);

    DataQuery;
  end;
end;

function TcvMedStock.GetPluginFlag: Integer;
begin
  Result := iOperationFlag_MedStock;
end;

{ TcvMedCheckMaster }

procedure TcvMedCheckMaster.BuildViewAction;
begin
  inherited;
  BuildAction('查询结转明细', '', '', nil, DoActionCheckDetail, 0, BTN_SHOWCAPTION);
  BuildAction('查询结转批次', '', '', nil, DoActionCheckBatch, 0, BTN_SHOWCAPTION);
end;

constructor TcvMedCheckMaster.Create(AOwner: TComponent);
begin
  inherited;
  PeriodGroup.Visible := True;
  OnDoubleClickView := DoDoubleClickView;
  ViewData := TCustomData.Create(Self, HisConnection, sDataServiceMedicine,
    'Med_CheckMaster');
end;

procedure TcvMedCheckMaster.DataQuery;
begin
  ViewData.OpenByList(['CheckTime', 'CheckTime', 'OfficeID'],
    [BeginDate, EndDate + 1, HisUser.OfficeID], [dboGreaterOrEqual, dboLess,
    dboEqual], [dboAnd, dboAnd]);
end;

procedure TcvMedCheckMaster.DoActionCheckBatch(Sender: TObject);
begin
  AppCore.Operations.SearchOperation(sOperationIDMedCheckBatch)
    .Execute(iOperationCommand_Notify, [ViewData.AsInteger['CheckID']]);
end;

procedure TcvMedCheckMaster.DoActionCheckDetail(Sender: TObject);
begin
  DoDoubleClickView(Sender);
end;

procedure TcvMedCheckMaster.DoDoubleClickView(Sender: TObject);
begin
  AppCore.Operations.SearchOperation(sOperationIDMedCheckDetail)
    .Execute(iOperationCommand_Notify, [ViewData.AsInteger['CheckID']]);
end;

{ TcvMedCheckDetail }

constructor TcvMedCheckDetail.Create(AOwner: TComponent);
begin
  inherited;
  Editing := True;
  ViewData := TCustomData.Create(Self, HisConnection, sDataServiceMedicine,
    'Med_CheckDetail');
end;

procedure TcvMedCheckDetail.DataQuery;
begin
  ViewData.OpenByFieldValue('CheckID', FCheckID);
end;

function TcvMedCheckDetail.DoExecute(CommandID: Integer;
  const Param: array of Variant): Variant;
begin
  Result := inherited DoExecute(CommandID, Param);

  if CommandID = iOperationCommand_Notify then
  begin
    FCheckID := Param[0];
    DataQuery;
    AppCore.MainView.ShowView(Self);
  end
end;

{ TcvMedCheckBatch }

constructor TcvMedCheckBatch.Create(AOwner: TComponent);
begin
  inherited;
  ViewData := TCustomData.Create(Self, HisConnection, sDataServiceMedicine,
    'Med_CheckBatch');
end;

procedure TcvMedCheckBatch.DataQuery;
begin
  ViewData.OpenByFieldValue('CheckID', FCheckID);
end;

function TcvMedCheckBatch.DoExecute(CommandID: Integer;
  const Param: array of Variant): Variant;
begin
  Result := inherited DoExecute(CommandID, Param);

  if CommandID = iOperationCommand_Notify then
  begin
    FCheckID := Param[0];
    DataQuery;
    AppCore.MainView.ShowView(Self);
  end
end;

end.
