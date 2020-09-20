unit HisClient_Classes;

{
  HIS核心模块

  Written by caowm (remobjects@qq.com)
  2014年10月
}

interface

uses
  SysUtils,
  Classes,
  Forms,
  Menus,
  Controls,
  Variants,
  ActnList,
  Graphics,
  DB,
  Contnrs,
  DateUtils,
  StrUtils,
  Windows,
  Math,
  ShellAPI,
  cxCustomData,
  cxEdit,
  cxMaskEdit,
  cxTextEdit,
  cxCalendar,
  cxGrid,
  cxGridCustomView,
  cxGridCustomTableView,
  cxGridTableView,
  cxGridDBTableView,
  cxGridChartView,
  cxGridDBChartView,
  cxClasses,
  cxGraphics,
  cxCustomPivotGrid,
  cxTL,
  dxBar,
  dxGDIPlusClasses,
  dxLayoutControl,
  dxLayoutContainer,
  uROTypes,
  uROClient,
  uROClasses,
  uDACore,
  uDADataTable,
  uDAInterfaces,
  DataAbstract4_Intf,
  App_Function,
  App_Common,
  App_DevExpress,
  App_Dev_Toolbar,
  App_FastReport,
  App_Class,
  App_DAModel,
  App_DAView,
  App_LoginForm,
  App_DevOptions,
  HisClient_Const,
  HisLibrary_Intf;

const
  sPinYinFieldName = 'IME_PY';
  sPinYinFieldName2 = 'IME_PY2';
  sDeleteDataConfirm = '确定删除数据吗?';
  sBalanceConfirm = '确定结算吗?';
  sWrapperSerialID = 'SerialID';
  sWrapperRecipeGroup = 'RecipeGroup';
  iDefaultGroupNum = 99;
  sHisFieldGroupNum = 'GroupNum';

type

  THisData = class(TCustomData)
  private
  protected
    function HaveEditAccess(): Boolean;
    procedure DoDataBeforePost(Sender: TDADataTable); override;
  public
    function CanEdit(): Boolean; override;
    function CanInsert(): Boolean; override;
    function CanDelete(): Boolean; override;
  end;

  THisUser = class(TUser)
  private
    FRecSign: Integer;
    FOfficeUse: string;
    function GetIsDoctor: Boolean;
    function GetIsClinOffice: Boolean;
    function GetIsHospOffice: Boolean;
    function GetIsMedOffice: Boolean;
    function GetIsTechOffice: Boolean;
    function GetIsAdminOffice: Boolean;
  protected
    procedure DoAfterLogin(LoginStrings: TStrings); override;
  public
    property OfficeUse: string read FOfficeUse write FOfficeUse;
    property IsDoctor: Boolean read GetIsDoctor;
    property IsClinOffice: Boolean read GetIsClinOffice;
    property IsHospOffice: Boolean read GetIsHospOffice;
    property IsMedOffice: Boolean read GetIsMedOffice;
    property IsTechOffice: Boolean Read GetIsTechOffice;
    property IsAdminOffice: Boolean read GetIsAdminOffice;
  end;

  THisBaseOrganizer = class(TComponent)
  private
    FPrintParamData: TCustomData;
    procedure SelectMyOffice();
    procedure SetStatusBar();
    function GetPrintParamData: TCustomData;
  protected
    FAppObserver: TObserver;
    FWorkerObserver: TObserver;
    FAppStatusIndex, FWorkerStatusIndex: Integer;

    procedure DoAppEvent(Sender: TObject); virtual;
    procedure DoWorkerEvent(Sender: TObject); virtual;
    procedure DoAfterLogin(); virtual;
    procedure DoBeforeLogin(); virtual;

    procedure DefineCommonData; virtual;
    procedure OrganizeOperations; virtual;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy(); override;

    property PrintParamData: TCustomData read GetPrintParamData;
  end;

  TSerialIDWrapMode = (swmNone, swmYear, swmYearMonth, swmYearMonthDay);

  TSerialIDEvent = procedure(Sender: TObject; AID: string) of object;

  TSerialIDWrapInfo = class(TWrapInfo)
  private
    FOnSerialID: TNotifyEvent;
    FIDLength: Integer;
    FSerialLength: Integer;
    FHeaderLength: Integer;
    FHeaderFmtString: string;
    FWrapMode: TSerialIDWrapMode;
    function GetHeader(): string;
    function IncHeader(AHeader: string): string;
    function DecHeader(AHeader: string): string;
    procedure OnTextEditKeyPress(Sender: TObject; var Key: Char);
    procedure OnTextEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TrigSerialIDEvent(Sender: TcxCustomTextEdit);
    procedure DoClearButton(Sender: TObject; AButtonIndex: Integer);
  public
    procedure Wrap(); override;
    procedure UnWrap(); override;
    function CompleteID(AID: string): string;
    function DecSerialID(AID: string): string;
    function IncSerialID(AID: string): string;
    property SerialLength: Integer read FSerialLength;
    property IDLength: Integer read FIDLength write FIDLength;
    property WrapMode: TSerialIDWrapMode read FWrapMode write FWrapMode;
    property OnSerialID: TNotifyEvent read FOnSerialID write FOnSerialID;
  end;

  TSerialIDWrapper = class(TControlWrapper)
  private
  protected
    function FindWrapInfo(ATarget: TComponent): TSerialIDWrapInfo;
    function GetWrapInfoClass(): TWrapInfoClass; override;
  public
    function Wrap(ATarget: TComponent;
      AWrapMode: TSerialIDWrapMode = swmYearMonthDay; AIDLength: Integer = 4)
      : TSerialIDWrapInfo;
    procedure ValidateTextEdit(ATextEdit: TcxCustomTextEdit);
  end;

  TRecipeGroupWrapInfo = class(TWrapInfo)
  private
    FCurGroupNum, FCurGroupCount, FCurGroupIndex, FMaxGroupNum: Integer;
    FGroupActionIndex: Integer;

    FTableView: TTableGridDataView;
    FGroupFlags: TBits;

    function GetAvailableGroupNum(): Integer;
    procedure SetGroupFlag(ADataTable: TDADataTable; AParam: Variant);
    function GetMaxGroupNum(): Integer;
    procedure SetMaxGroupNum(ADataTable: TDADataTable; AParam: Variant);
    procedure SelectUnGroupRecord(ARowIndex: Integer; ARowInfo: TcxRowInfo);

    procedure SetGroupNum(AGroupNum: Integer; AGroupCount: Integer);
    procedure DoSetGroupNum(Sender: TObject);

    procedure GroupNumDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);

    procedure BuildGroupNumAction;
  public
    procedure Wrap(); override;
    procedure UnWrap(); override;

    procedure DoActionAutoGroup(Sender: TObject);
    procedure DoActionGroup(Sender: TObject);
    procedure DoActionGroupUpdate(Sender: TObject);
  end;

  TRecipeGroupWrapper = class(TControlWrapper)
  private
  protected
    function GetWrapInfoClass(): TWrapInfoClass; override;
  public
    function Wrap(ATarget: TTableGridDataView): TRecipeGroupWrapInfo;
  end;

  TcdBaseChargeMoney = class(TCustomData)
  private
    function GetGetMoney: Double;
    procedure SetGetMoney(const Value: Double);
    function GetPrice: Double;
    procedure SetPrice(const Value: Double);
    function GetChargeMoney: Double;
    procedure SetChargeMoney(const Value: Double);
  protected
    procedure DoDataCalcFields(Sender: TDADataTable); override;
  public
    constructor Create(AOwner: TComponent);
    property Price: Double read GetPrice write SetPrice;
    property GetMoney: Double read GetGetMoney write SetGetMoney;
    property ChargeMoney: Double read GetChargeMoney write SetChargeMoney;
  end;

  TcvBaseChargMoney = class(TBaseDialog)
  private
    FChargeData: TcdBaseChargeMoney;
  protected
    procedure BuildDialog(); override;
  published
    property ChargeData: TcdBaseChargeMoney read FChargeData;
  end;

function ShowChargeDialog(APrice: Double;
  var AGetMoney, AChargeMoney: Double): Boolean;

procedure PrintReportFromServer(const ReportName: string;
  const ParamNames: array of Variant; const ParamValues: array of Variant;
  AParamData: TCustomData = nil; APreview: Boolean = False;
  APrinter: string = '');

procedure PrintCustomData(Sender: TCustomData; ShowPrintDialog: Boolean);

procedure CopyArray(const Source: array of Variant; Dest: StringArray);

function GetFieldMaxValue(const ATableName, AFieldName: string): Variant;

function GetStatTypeParentID(AType: string; LevelLength: Integer = 2): string;
function GetStatTypeLevel1(AType: string; LevelLength: Integer = 2): string;
function GetStatTypeLevel2(AType: string; LevelLength: Integer = 4): string;
function GetStatTypeLevel3(AType: string; LevelLength: Integer = 6): string;
function InputClinID(const ATitle: string; var AClinID: string): Boolean;
function InputHospID(const ATitle: string; var AHospID: string): Boolean;

var
  HisConnection: TDataConnection;
  HisUser: THisUser;
  SerialIDWrapper: TSerialIDWrapper;
  RecipeGroupWrapper: TRecipeGroupWrapper;
  HisOrganizer: THisBaseOrganizer;

implementation

var
  FClinIDDialog: TTextDialog;
  FHospIDDialog: TTextDialog;
  FChargeDialog: TcvBaseChargMoney;

function Function_InputClinID(const AParam: array of Variant): Variant;
var
  LClinID: string;
begin
  if InputClinID(AParam[0], LClinID) then
    Result := LClinID
  else
    Result := '';
end;

function Function_InputHospID(const AParam: array of Variant): Variant;
var
  LHospID: string;
begin
  if InputClinID(AParam[0], LHospID) then
    Result := LHospID
  else
    Result := '';
end;

procedure RegisterHisFunction();
begin
  AppCore.Functions.Register(iFunctionID_InputClinID, Function_InputClinID);
  AppCore.Functions.Register(iFunctionID_InputHospID, Function_InputHospID);
end;

function ShowChargeDialog(APrice: Double;
  var AGetMoney, AChargeMoney: Double): Boolean;
begin
  if FChargeDialog = nil then
    FChargeDialog := TcvBaseChargMoney.Create(Application);
  FChargeDialog.ChargeData.Price := APrice;
  FChargeDialog.ChargeData.GetMoney := 0;
  Result := FChargeDialog.Execute;
  if Result then
  begin
    AGetMoney := FChargeDialog.ChargeData.GetMoney;
    AChargeMoney := FChargeDialog.ChargeData.ChargeMoney;
  end
end;

function InputClinID(const ATitle: string; var AClinID: string): Boolean;
begin
  if FClinIDDialog = nil then
  begin
    FClinIDDialog := TTextDialog.Create(Application);
    with FClinIDDialog do
    begin
      OKButton.Default := False;
      EditItem.Caption := '门诊号';
      SerialIDWrapper.Wrap(MaskEdit);
    end;
  end;
  FClinIDDialog.Caption := ATitle;
  FClinIDDialog.Text := '';
  Result := FClinIDDialog.Execute;
  if Result then
    SerialIDWrapper.ValidateTextEdit(FClinIDDialog.MaskEdit);
  if Result then
    AClinID := FClinIDDialog.Text;
end;

function InputHospID(const ATitle: string; var AHospID: string): Boolean;
begin
  if FHospIDDialog = nil then
  begin
    FHospIDDialog := TTextDialog.Create(Application);
    with FHospIDDialog do
    begin
      OKButton.Default := False;
      EditItem.Caption := '住院号';
      SerialIDWrapper.Wrap(MaskEdit, swmYear, 6);
    end;
  end;
  FHospIDDialog.Caption := ATitle;
  FHospIDDialog.Text := '';
  Result := FHospIDDialog.Execute;
  if Result then
    SerialIDWrapper.ValidateTextEdit(FHospIDDialog.MaskEdit);
  if Result then
    AHospID := FHospIDDialog.Text;
end;

procedure CopyArray(const Source: array of Variant; Dest: StringArray);
var
  I: Integer;
begin
  for I := 0 to Length(Source) - 1 do
    Dest.Add(Source[I]);
end;

function GetStatTypeParentID(AType: string; LevelLength: Integer): string;
begin
  if Length(AType) >= LevelLength then
    Result := LeftStr(AType, Length(AType) - LevelLength)
  else
    Result := '';
end;

function GetStatTypeLevel1(AType: string; LevelLength: Integer = 2): string;
begin
  if Length(AType) >= LevelLength then
    Result := LeftStr(AType, LevelLength)
  else
    Result := '';
end;

function GetStatTypeLevel2(AType: string; LevelLength: Integer = 4): string;
begin
  if Length(AType) >= LevelLength then
    Result := LeftStr(AType, LevelLength)
  else
    Result := '';
end;

function GetStatTypeLevel3(AType: string; LevelLength: Integer = 6): string;
begin
  if Length(AType) >= LevelLength then
    Result := LeftStr(AType, LevelLength)
  else
    Result := '';
end;

procedure PrintReportFromServer(const ReportName: string;
  const ParamNames: array of Variant; const ParamValues: array of Variant;
  AParamData: TCustomData = nil; APreview: Boolean = False;
  APrinter: string = '');
var
  NameArray, ValueArray: StringArray;
  Result: Binary;

  procedure AppendParamData();
  var
    ParamValue: string;
  begin
    if AParamData = nil then
      Exit;

    AParamData.First;
    while not AParamData.Eof do
    begin
      NameArray.Add(AParamData.AsString['ParamName']);
      ParamValue := AParamData.AsString['ParamValue'];
      if Pos('Properties=DateEdit', AParamData.AsString['ParamEditor']) > 0 then
        ValueArray.Add(StandardizeLocalDate(ParamValue))
      else
        ValueArray.Add(ParamValue);
      AParamData.Next;
    end;
  end;

begin
  try
    NameArray := StringArray.Create;
    ValueArray := StringArray.Create;
    try
      AppCore.Logger.Write('正在打印' + ReportName, mtInfo, 0);
      CopyArray(ParamNames, NameArray);
      CopyArray(ParamValues, ValueArray);

      AppendParamData;

      Result := (HisConnection.ROService as IHisService_Report)
        .PrintReport(ReportName, NameArray, ValueArray, 0);
      try
        Result.Position := 0;
        FastReport.PrintStream(Result, ReportName, APreview, APrinter);
      finally
        Result.Free;
      end;
    finally
      NameArray.Free;
      ValueArray.Free;
    end;
  except
    on E: Exception do
      ShowWarning(E.Message);
  end;
end;

procedure PrintCustomData(Sender: TCustomData; ShowPrintDialog: Boolean);
var
  LReportNames: TStrings;
  LReportName: string;
  LPreview: Boolean;
  LPrinterName: string;
  LAccess: string;
begin
  LReportName := '';
  LPreview := True;

  with Sender do
  begin
    if ReporterTypeField = '' then
    begin
      with ReporterDialog do
      begin
        if ShowPrintDialog then
        begin
          PrintParamData := HisOrganizer.PrintParamData;

          if Selections.Text <> ReporterNames.Text then
          begin
            Selections.Assign(ReporterNames);
            SelectIndex := 0;
          end;

          if not Execute() then
            Abort;
        end;
        LReportName := ReporterName;
        LPreview := PrintPreview;
        LPrinterName := PrinterName;
      end
    end
    else
      LReportName := ReporterNames.Values[AsString[ReporterTypeField]];

    PrintReportFromServer(LReportName, [KeyFieldNames, 'UserID', 'UserName',
      'OfficeID', 'OfficeName', 'UnitID', 'UnitName'],
      [KeyValue, HisUser.ID, HisUser.Name, HisUser.OfficeID, HisUser.OfficeName,
      HisUser.UnitID, HisUser.UnitName], HisOrganizer.PrintParamData, LPreview,
      LPrinterName);
  end;
end;

function GetFieldMaxValue(const ATableName, AFieldName: string): Variant;
begin
  Result := (HisConnection.ROService as IHisService_System)
    .GetFieldMaxValue(ATableName, AFieldName);
  if VarIsNull(Result) then
    Result := 0;
end;

procedure SetFieldPY(Sender: TObject; ADataTable: TDADataTable;
  AParam: Variant);
begin
  ADataTable.Edit;
  ADataTable.FieldByName(AParam).Value := ADataTable.FieldByName(AParam).Value;
  ADataTable.Post;
end;

procedure SetTablePY(ADictName: string);
var
  Dict: TCustomData;
begin
  Dict := DataContainer[ADictName];
  Dict.Open;
  Check(Dict.Table.CustomAttributes.Values['ChineseField'] = '', '没有设置中文字段名');
  EnumDataTable(Dict.Table, TDataTableEnumProc(MakeMethod(@SetFieldPY)),
    Dict.Table.CustomAttributes.Values['ChineseField']);
end;

function Operation_SetTablePY(Sender: TBaseOperation; AID: Integer;
  const AParam: array of Variant): Variant;
var
  DictName: string;
begin
  if DX_InputQuery('重设字典拼音码(注意：已有的拼音不变)', '字典名(数据逻辑名): ', '', DictName) then
    SetTablePY(DictName);
end;

function Opeation_ChangeWorkerPassword(Sender: TBaseOperation; AID: Integer;
  const AParam: array of Variant): Variant;
begin
  TChangePasswordForm.ChangePass(HisUser.DoChangePassword);
end;

function Operation_DefaultPrinter(Sender: TBaseOperation; AID: Integer;
  const AParam: array of Variant): Variant;
begin
  FastReport.SetupPrinter;
end;

function Operation_BusinessPrinter(Sender: TBaseOperation; AID: Integer;
  const AParam: array of Variant): Variant;
begin
  with TBusinessPrinterDialog.Create(nil, BusinessPrinters) do
  begin
    Execute();
    Free;
  end;
end;

function Operation_OperateView(Sender: TBaseOperation; AID: Integer;
  const AParam: array of Variant): Variant;
begin
  case Integer(Sender.Data) of
    1:
      AppCore.MainView.PreviousView;
    2:
      AppCore.MainView.NextView;
    3:
      AppCore.MainView.CloseView;
  end;
end;

function Operation_SoftUpdate(Sender: TBaseOperation; AID: Integer;
  const AParam: array of Variant): Variant;
begin
  AppCore.Functions.Execute(iFunctionID_UpdateApp, []);
end;

{ THisBaseOrganizer }

constructor THisBaseOrganizer.Create(AOwner: TComponent);
begin
  inherited;

  AppCore.Config.ReadSectionValues(sTargetListSection,
    HisConnection.TargetList);
  HisConnection.TargetIndex := AppCore.IniFile.ReadInteger(sAppSection,
    'TargetIndex', 0);

  DevExpress.OnGetLookupSource := DataContainer.GetSource;
  BusinessPrinters.RegisterBusinessPrinter(sPrinterClinReg);
  BusinessPrinters.RegisterBusinessPrinter(sPrinterInvoice);
  BusinessPrinters.RegisterBusinessPrinter(sPrinterHospPay);
  BusinessPrinters.RegisterBusinessPrinter(sPrinterHospFee);
  BusinessPrinters.RegisterBusinessPrinter(sPrinterGlue);
  BusinessPrinters.RegisterBusinessPrinter(sPrinterInjection);
  BusinessPrinters.RegisterBusinessPrinter(sPrinterHospDayFee);

  FWorkerStatusIndex := DevStatusBar.AddBar(0);
  FAppStatusIndex := DevStatusBar.AddBar(0);
  FAppObserver := TObserver.Create(DoAppEvent);
  AppCore.StateSubject.Attach(FAppObserver);
  FWorkerObserver := TObserver.Create(DoWorkerEvent);
  HisUser.LoginSubject.Attach(FWorkerObserver);

  DefineCommonData;
  OrganizeOperations;
end;

{ 定义公共数据 }

procedure THisBaseOrganizer.DefineCommonData;
begin

end;

destructor THisBaseOrganizer.Destroy;
begin
  AppCore.IniFile.WriteInteger(sAppSection, 'TargetIndex',
    HisConnection.TargetIndex);
  FreeAndNil(FAppObserver);
  FreeAndNil(FWorkerObserver);
  inherited;
end;

procedure THisBaseOrganizer.DoAfterLogin;
begin
  FastReport.frxReport.PreviewOptions.AllowEdit :=
    HisUser.HaveAccess(sAccessSysReportEdit);
  SetStatusBar;
end;

procedure THisBaseOrganizer.DoAppEvent(Sender: TObject);
begin
  case AppCore.State of
    asBeginning:
      begin
        SelectMyOffice;
        SetStatusBar;
      end;
  end;
end;

procedure THisBaseOrganizer.DoBeforeLogin;
begin

end;

procedure THisBaseOrganizer.DoWorkerEvent(Sender: TObject);
begin
  if HisUser.IsLogined then
    DoAfterLogin
  else
    DoBeforeLogin;
end;

{ 定义公共业务 }

function THisBaseOrganizer.GetPrintParamData: TCustomData;
var
  DefaultValue: string;
begin
  if FPrintParamData = nil then
  begin
    FPrintParamData := TCustomData.Create(Self, HisConnection,
      sDataServiceSystem, 'Misc_PrintParam');
    FPrintParamData.LogChanges := False;
    FPrintParamData.Open;
    // FPrintParamData.Source.AutoEdit := True;

    FPrintParamData.First;
    while not FPrintParamData.Eof do
    begin
      DefaultValue := FPrintParamData.AsString['DefaultValue'];
      if DefaultValue <> '' then
      begin
        FPrintParamData.Edit;
        FPrintParamData.AsString['ParamValue'] :=
          FastReport.Evaluate(DefaultValue);
        FPrintParamData.Save;
      end;
      FPrintParamData.Next;
    end;
  end;

  Result := FPrintParamData;
end;

procedure THisBaseOrganizer.OrganizeOperations;
begin
  with TViewOperation.Create(sOperationIDLog) do
  begin
    Category := sOperationCategorySys;
    Caption := '运行记录';
    ImageName := 'log';
    Order := 'C10';
    Flag := iOperationFlag_NoTree;
    ShortKey := ShortCut(Word('L'), [ssCtrl]);
    ViewClass := TLogView;
  end;

  with TProcOperation.Create(sOperationIDChangePwd) do
  begin
    Category := sOperationCategorySys;
    Caption := '修改密码';
    ImageName := 'key';
    Order := 'C30';
    Flag := iOperationFlag_NoTree;
    OnExecute := Opeation_ChangeWorkerPassword;
  end;

  with TProcOperation.Create(sOperationIDBusinessPrinter) do
  begin
    Category := sOperationCategorySys;
    Caption := '选择打印机';
    ImageName := 'select';
    Order := 'C43';
    Flag := iOperationFlag_NoTree;
    OnExecute := Operation_BusinessPrinter;
  end;

  with TViewOperation.Create(sOperationIDDictManage) do
  begin
    Category := sOperationCategorySys;
    Caption := '字典维护';
    ImageName := 'dict';
    Order := 'C50';
    Flag := iOperationFlag_NoTree;
    ShortKey := ShortCut(Ord('B'), [ssCtrl]);
    ViewClass := TDictManageView;
    Access := sAccessSysDict;
  end;

  with TProcOperation.Create(sOperationIDDictSetPY) do
  begin
    Category := sOperationCategorySys;
    Caption := '重设字典拼音码';
    ImageName := 'tools';
    Order := 'C51';
    Flag := iOperationFlag_NoTree;
    OnExecute := Operation_SetTablePY;
    Access := sAccessSysDict;
  end;

  with TProcOperation.Create(sOperationIDPrevView) do
  begin
    Category := sOperationCategoryView;
    Caption := '上个视图';
    ImageName := sOperationIDPrevView;
    Order := 'F10';
    Flag := iOperationFlag_NoTree;
    ShortKey := ShortCut(VK_LEFT, [ssCtrl]);
    Data := TObject(1);
    OnExecute := Operation_OperateView;
  end;

  with TProcOperation.Create(sOperationIDNextView) do
  begin
    Category := sOperationCategoryView;
    Caption := '下个视图';
    ImageName := sOperationIDNextView;
    Order := 'F12';
    Flag := iOperationFlag_NoTree;
    ShortKey := ShortCut(VK_RIGHT, [ssCtrl]);
    Data := TObject(2);
    OnExecute := Operation_OperateView;
  end;

  with TProcOperation.Create(sOperationIDCloseView) do
  begin
    Category := sOperationCategoryView;
    Caption := '关闭视图';
    ImageName := sOperationIDCloseView;
    Order := 'F13';
    Flag := iOperationFlag_NoTree;
    ShortKey := ShortCut(Ord('Q'), [ssAlt]);
    Data := TObject(3);
    OnExecute := Operation_OperateView;
  end;

  with TViewOperation.Create(sOperationIDStyle) do
  begin
    Category := sOperationCategoryView;
    Caption := '风格设置';
    ImageName := 'tiles';
    Order := 'F20';
    Flag := iOperationFlag_NoTree;
    ViewClass := TOptionSetForm;
  end;

  with TProcOperation.Create(sOperationIDSoftUpdate) do
  begin
    Category := sOperationCategoryHelp;
    Caption := '软件升级';
    ImageName := 'help';
    Order := 'z10';
    Flag := iOperationFlag_NoTree;
    OnExecute := Operation_SoftUpdate;
  end;

end;

procedure THisBaseOrganizer.SelectMyOffice;
var
  MyOffice: TCustomData;
begin
  MyOffice := TCustomData.Create(nil, HisConnection, sDataServiceSystem,
    'Sys_MyOffice');
  try
    MyOffice.OpenByParam([sFieldOpID], [HisUser.ID]);
    if (MyOffice.RecordCount > 1) and DictIME.StartIME(nil, MyOffice, '', '',
      nil, False) then
    begin
      HisUser.OfficeID := MyOffice.AsString['OfficeID'];
      HisUser.OfficeName := MyOffice.AsString['OfficeName'];
      HisUser.OfficeUse := MyOffice.AsString['OfficeUse'];
      (HisConnection.ROService as IHisService_System)
        .SelectOffice(HisUser.OfficeID, HisUser.OfficeName, HisUser.OfficeUse);
    end;
  finally
    MyOffice.Free
  end;
end;

procedure THisBaseOrganizer.SetStatusBar;
begin
  DevStatusBar.BarText[FWorkerStatusIndex] :=
    Format('%s[%s] %s[%s]', [HisUser.Name, HisUser.ID, HisUser.OfficeName,
    HisUser.OfficeID]);
  DevStatusBar.BarText[FAppStatusIndex] :=
    Format('软件ID:%s 版本号:%s', [AppCore.ID, AppCore.Version]);
end;

{ TSerialIDWrapper }

procedure TSerialIDWrapper.ValidateTextEdit(ATextEdit: TcxCustomTextEdit);
begin
  Check(Length(ATextEdit.Text) <> FindWrapInfo(ATextEdit).FSerialLength,
    '请输入%d位长的流水号', [FindWrapInfo(ATextEdit).FSerialLength]);
end;

function TSerialIDWrapper.Wrap(ATarget: TComponent;
  AWrapMode: TSerialIDWrapMode = swmYearMonthDay; AIDLength: Integer = 4)
  : TSerialIDWrapInfo;
begin
  Check(not(ATarget is TcxMaskEdit), '控件必须从是TcxMaskEdit');
  Result := TSerialIDWrapInfo(inherited Wrap(ATarget));
  Result.WrapMode := AWrapMode;
  Result.IDLength := AIDLength;
  Result.Wrap;
end;

procedure CreateWrapper();
begin
  SerialIDWrapper := TSerialIDWrapper.Create(nil);
  SerialIDWrapper.Name := sWrapperSerialID;
  RecipeGroupWrapper := TRecipeGroupWrapper.Create(nil);
  RecipeGroupWrapper.Name := sWrapperRecipeGroup;
end;

procedure FreeWrapper();
begin
  FreeAndNil(SerialIDWrapper);
  FreeAndNil(RecipeGroupWrapper);
end;

function TSerialIDWrapper.GetWrapInfoClass: TWrapInfoClass;
begin
  Result := TSerialIDWrapInfo;
end;

function TSerialIDWrapper.FindWrapInfo(ATarget: TComponent): TSerialIDWrapInfo;
begin
  Result := TSerialIDWrapInfo(inherited FindWrapInfo(ATarget));
end;

{ THisData }

function THisData.CanDelete: Boolean;
begin
  Result := inherited CanDelete and HaveEditAccess;
end;

function THisData.CanEdit: Boolean;
begin
  Result := inherited CanEdit and HaveEditAccess;
end;

function THisData.CanInsert: Boolean;
begin
  Result := inherited CanInsert and HaveEditAccess;
end;

procedure THisData.DoDataBeforePost(Sender: TDADataTable);
var
  S1, S2: string;
begin
  inherited;

  with Sender do
  begin
    S1 := CustomAttributes.Values['ChineseField'];
    if (S1 <> '') and (FindField(sPinYinFieldName) <> nil) then
      if ((State in [dsInsert]) and (FieldByName(sPinYinFieldName)
        .AsString = '')) or
        ((State in [dsEdit]) and (FieldByName(sPinYinFieldName)
        .Value = FieldByName(sPinYinFieldName).OldValue) and
        ((FieldByName(S1).Value <> FieldByName(S1).OldValue)) or
        (FieldByName(sPinYinFieldName).AsString = '')) then
      begin
        FieldByName(sPinYinFieldName).AsString :=
          GetPyHeadOfHzs(PChar(FieldByName(S1).AsString));
      end;

    S1 := CustomAttributes.Values['ChineseField2'];
    if (S1 <> '') and (FindField(sPinYinFieldName2) <> nil) then
      if ((State in [dsInsert]) and (FieldByName(sPinYinFieldName2)
        .AsString = '')) or
        ((State in [dsEdit]) and (FieldByName(sPinYinFieldName2)
        .Value = FieldByName(sPinYinFieldName2).OldValue)) then
        FieldByName(sPinYinFieldName2).AsString :=
          GetPyHeadOfHzs(PChar(FieldByName(S1).AsString));

    S1 := CustomAttributes.Values['KeyFieldNames'];
    if (S1 <> '') and (FindField(S1) <> nil) and
      (FieldByName(S1).DataType in [datInteger, datLargeInt]) and
      (State in [dsInsert]) and (FieldByName(S1).AsInteger <= 0) then
    begin
      S2 := Sender.CustomAttributes.Values['TargetTable'];
      FieldByName(S1).AsInteger :=
        GetFieldMaxValue(IfThen(S2 = '', Sender.LogicalName, S2), S1) + 1;
    end;
  end;
end;

function THisData.HaveEditAccess: Boolean;
begin
  Result := HisUser.HaveAccess(Access);
end;

{ TSerialIDWrapInfo }

function TSerialIDWrapInfo.CompleteID(AID: string): string;
begin
  if (Length(AID) > 0) and (StrToIntDef(AID, -1) < 0) then
    Result := AID
  else if (Length(AID) <= FIDLength) and (Length(AID) > 0) then
    Result := GetHeader + RightStr('0000000000' + AID, FIDLength)
  else if (Length(AID) = 0) then
    Abort
  else
    Result := AID;
end;

function TSerialIDWrapInfo.DecHeader(AHeader: string): string;
var
  Y, M, D: Word;
  HeaderDate: TDateTime;
begin
  if Length(AHeader) < FHeaderLength then
    AHeader := AHeader + RightStr('00010101', FHeaderLength - Length(AHeader));

  if FHeaderLength = 4 then
  begin
    Y := StrToInt(MidStr(AHeader, 1, 4)) - 1;
    M := 1;
    D := 1;
    HeaderDate := EncodeDate(Y, M, D);
  end
  else if FHeaderLength = 6 then
  begin
    Y := StrToInt(MidStr(AHeader, 1, 4));
    M := StrToInt(MidStr(AHeader, 5, 2));
    if M <= 1 then
    begin
      M := 12;
      Y := Y - 1;
    end
    else
    begin
      M := M - 1;
    end;
    HeaderDate := EncodeDate(Y, M, 1);
  end
  else if FHeaderLength = 8 then
  begin
    Y := StrToInt(MidStr(AHeader, 1, 4));
    M := StrToInt(MidStr(AHeader, 5, 2));
    D := StrToInt(MidStr(AHeader, 7, 2));
    HeaderDate := EncodeDate(Y, M, D) - 1;
  end;

  Result := FormatDateTime(FHeaderFmtString, HeaderDate);
end;

function TSerialIDWrapInfo.DecSerialID(AID: string): string;
begin
  Result := CompleteID(AID);
  if Length(Result) = FSerialLength then
    Result := DecHeader(LeftStr(AID, FHeaderLength)) + RightStr(AID, FIDLength);
end;

procedure TSerialIDWrapInfo.DoClearButton(Sender: TObject;
  AButtonIndex: Integer);
begin
  TcxMaskEdit(Target).Text := '';
end;

function TSerialIDWrapInfo.GetHeader: string;
begin
  Result := FormatDateTime(FHeaderFmtString, Date());
end;

function TSerialIDWrapInfo.IncHeader(AHeader: string): string;
var
  Y, M, D: Word;
  HeaderDate: TDateTime;
begin
  if Length(AHeader) < FHeaderLength then
    AHeader := AHeader + RightStr('00011231', FHeaderLength - Length(AHeader));
  if FHeaderLength = 4 then
  begin
    Y := StrToInt(MidStr(AHeader, 1, 4)) + 1;
    M := 1;
    D := 1;
    HeaderDate := EncodeDate(Y, M, D);
  end
  else if FHeaderLength = 6 then
  begin
    Y := StrToInt(MidStr(AHeader, 1, 4));
    M := StrToInt(MidStr(AHeader, 5, 2));
    if M >= 12 then
    begin
      M := 1;
      Y := Y + 1;
    end
    else
    begin
      M := M + 1;
    end;
    HeaderDate := EncodeDate(Y, M, 1);
  end
  else if FHeaderLength = 8 then
  begin
    Y := StrToInt(MidStr(AHeader, 1, 4));
    M := StrToInt(MidStr(AHeader, 5, 2));
    D := StrToInt(MidStr(AHeader, 7, 2));
    HeaderDate := EncodeDate(Y, M, D) + 1;
  end;

  Result := LeftStr(FormatDateTime(FHeaderFmtString, HeaderDate),
    FHeaderLength);
end;

function TSerialIDWrapInfo.IncSerialID(AID: string): string;
begin
  Result := CompleteID(AID);
  if Length(Result) = FSerialLength then
    Result := IncHeader(LeftStr(AID, FHeaderLength)) + RightStr(AID, FIDLength);
end;

procedure TSerialIDWrapInfo.OnTextEditKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  EditText: string;
begin
  EditText := TcxCustomTextEdit(Sender).Text;
  case Key of
    VK_UP:
      begin
        TcxCustomTextEdit(Sender).Text := IncSerialID(EditText);
        TcxCustomTextEdit(Sender).SelStart := Length(TcxTextEdit(Sender).Text);
      end;
    VK_DOWN:
      begin
        TcxCustomTextEdit(Sender).Text := DecSerialID(EditText);
        TcxCustomTextEdit(Sender).SelStart := Length(TcxTextEdit(Sender).Text);
      end;
  end;
end;

procedure TSerialIDWrapInfo.OnTextEditKeyPress(Sender: TObject; var Key: Char);
var
  EditText: string;
begin
  EditText := TcxCustomTextEdit(Sender).Text;
  case Ord(Key) of
    VK_RETURN:
      begin
        TcxCustomTextEdit(Sender).Text := CompleteID(EditText);
        TcxCustomTextEdit(Sender).SelStart := Length(TcxTextEdit(Sender).Text);
        TrigSerialIDEvent(TcxCustomTextEdit(Sender));
      end;
  end;
end;

procedure TSerialIDWrapInfo.TrigSerialIDEvent(Sender: TcxCustomTextEdit);
begin
  if Assigned(OnSerialID) then
    OnSerialID(Sender);
end;

procedure TSerialIDWrapInfo.UnWrap;
begin
  inherited;

  with TcxTextEdit(Target) do
  begin
    OnKeyDown := nil;
    OnKeyPress := nil;
  end;
end;

procedure TSerialIDWrapInfo.Wrap;
const
  iHeaderLength: array [TSerialIDWrapMode] of Integer = (0, 4, 6, 8);
  sHeaderFmtString: array [TSerialIDWrapMode] of string = ('', 'YYYY', 'YYYYMM',
    'YYYYMMDD');
begin
  inherited;
  FSerialLength := iHeaderLength[FWrapMode] + FIDLength;
  FHeaderLength := iHeaderLength[FWrapMode];
  FHeaderFmtString := sHeaderFmtString[FWrapMode];
  with TcxMaskEdit(Target) do
  begin
    OnKeyDown := OnTextEditKeyDown;
    OnKeyPress := OnTextEditKeyPress;
    Properties.ValidateOnEnter := False;
    Properties.MaxLength := 32;
    Properties.ClearKey := ShortCut(VK_DELETE, []);

    with Properties.Buttons.Add do
    begin
      Kind := bkText;
      Caption := '×';
    end;

    Properties.OnButtonClick := DoClearButton;
  end;
end;

{ THisUser }

procedure THisUser.DoAfterLogin(LoginStrings: TStrings);
begin
  inherited;
  FRecSign := StrToIntDef(LoginStrings.Values['RecSign'], 0);
  OfficeUse := LoginStrings.Values['OfficeUse'];
end;

function THisUser.GetIsAdminOffice: Boolean;
begin
  Result := SameText(OfficeUse, sOfficeUsage_Admin);
end;

function THisUser.GetIsClinOffice: Boolean;
begin
  Result := SameText(OfficeUse, sOfficeUsage_Clin);
end;

function THisUser.GetIsDoctor: Boolean;
begin
  Result := FRecSign > 0;
end;

function THisUser.GetIsHospOffice: Boolean;
begin
  Result := SameText(OfficeUse, sOfficeUsage_Hosp);
end;

function THisUser.GetIsMedOffice: Boolean;
begin
  Result := LeftStr(OfficeUse, 1) = sOfficeUsage_Med;
end;

function THisUser.GetIsTechOffice: Boolean;
begin
  Result := LeftStr(OfficeID, 2) = '03';
end;

{ TRecipeGroupWrapInfo }

procedure TRecipeGroupWrapInfo.BuildGroupNumAction;
begin
  with FTableView do
  begin
    FGroupActionIndex := BuildAction('自动分组', '', '', DoActionGroupUpdate,
      DoActionAutoGroup, ShortCut(VK_F12, []), BTN_SHOWCAPTION).Index;
    BuildAction('不分组', '', '', DoActionGroupUpdate, DoActionGroup,
      ShortCut(Ord('0'), [ssCtrl]), BTN_SHOWCAPTION);
    BuildAction('分组1', '', '', DoActionGroupUpdate, DoActionGroup,
      ShortCut(Ord('1'), [ssCtrl]), BTN_NOTOOLBAR);
    BuildAction('分组2', '', '', DoActionGroupUpdate, DoActionGroup,
      ShortCut(Ord('2'), [ssCtrl]), BTN_NOTOOLBAR);
    BuildAction('分组3', '', '', DoActionGroupUpdate, DoActionGroup,
      ShortCut(Ord('3'), [ssCtrl]), BTN_NOTOOLBAR);
    BuildAction('分组4', '', '', DoActionGroupUpdate, DoActionGroup,
      ShortCut(Ord('4'), [ssCtrl]), BTN_NOTOOLBAR);
    BuildAction('分组5', '', '', DoActionGroupUpdate, DoActionGroup,
      ShortCut(Ord('5'), [ssCtrl]), BTN_NOTOOLBAR);
    BuildAction('分组6', '', '', DoActionGroupUpdate, DoActionGroup,
      ShortCut(Ord('6'), [ssCtrl]), BTN_NOTOOLBAR);
    BuildAction('分组7', '', '', DoActionGroupUpdate, DoActionGroup,
      ShortCut(Ord('7'), [ssCtrl]), BTN_NOTOOLBAR);
    BuildAction('分组8', '', '', DoActionGroupUpdate, DoActionGroup,
      ShortCut(Ord('8'), [ssCtrl]), BTN_NOTOOLBAR);
    BuildAction('分组9', '', '', DoActionGroupUpdate, DoActionGroup,
      ShortCut(Ord('9'), [ssCtrl]), BTN_NOTOOLBAR);
    BuildAction('分组10', '', '', DoActionGroupUpdate, DoActionGroup, 0,
      BTN_NOTOOLBAR);
    BuildAction('分组11', '', '', DoActionGroupUpdate, DoActionGroup, 0,
      BTN_NOTOOLBAR);
    BuildAction('分组12', '', '', DoActionGroupUpdate, DoActionGroup, 0,
      BTN_NOTOOLBAR);
    BuildAction('分组13', '', '', DoActionGroupUpdate, DoActionGroup, 0,
      BTN_NOTOOLBAR);
    BuildAction('分组14', '', '', DoActionGroupUpdate, DoActionGroup, 0,
      BTN_NOTOOLBAR);
    BuildAction('分组15', '', '', DoActionGroupUpdate, DoActionGroup, 0,
      BTN_NOTOOLBAR);
    BuildAction('分组16', '', '', DoActionGroupUpdate, DoActionGroup, 0,
      BTN_NOTOOLBAR);
    BuildAction('分组17', '', '', DoActionGroupUpdate, DoActionGroup, 0,
      BTN_NOTOOLBAR);
    BuildAction('分组18', '', '', DoActionGroupUpdate, DoActionGroup, 0,
      BTN_NOTOOLBAR);
    BuildAction('分组19', '', '', DoActionGroupUpdate, DoActionGroup, 0,
      BTN_NOTOOLBAR);
    BuildAction('分组20', '', '', DoActionGroupUpdate, DoActionGroup, 0,
      BTN_NOTOOLBAR);

    BuildLayoutDropDownButton(ActionGroup.CreateItemForControl(nil),
      [TAction(ViewActions[FGroupActionIndex]),
      TAction(ViewActions[FGroupActionIndex + 1]),
      TAction(ViewActions[FGroupActionIndex + 2]),
      TAction(ViewActions[FGroupActionIndex + 3]),
      TAction(ViewActions[FGroupActionIndex + 4]),
      TAction(ViewActions[FGroupActionIndex + 5]),
      TAction(ViewActions[FGroupActionIndex + 6]),
      TAction(ViewActions[FGroupActionIndex + 7]),
      TAction(ViewActions[FGroupActionIndex + 8]),
      TAction(ViewActions[FGroupActionIndex + 9]),
      TAction(ViewActions[FGroupActionIndex + 10]),
      TAction(ViewActions[FGroupActionIndex + 11]),
      TAction(ViewActions[FGroupActionIndex + 12]),
      TAction(ViewActions[FGroupActionIndex + 13]),
      TAction(ViewActions[FGroupActionIndex + 14]),
      TAction(ViewActions[FGroupActionIndex + 15]),
      TAction(ViewActions[FGroupActionIndex + 16]),
      TAction(ViewActions[FGroupActionIndex + 17]),
      TAction(ViewActions[FGroupActionIndex + 18]),
      TAction(ViewActions[FGroupActionIndex + 19]),
      TAction(ViewActions[FGroupActionIndex + 20]),
      TAction(ViewActions[FGroupActionIndex + 21])], 0);
  end;
end;

procedure TRecipeGroupWrapInfo.DoActionGroup(Sender: TObject);
begin
  SetGroupNum(StrToIntDef(MidStr(TAction(Sender).Caption, 3, 3),
    iDefaultGroupNum), FTableView.DataController.GetSelectedCount());
end;

procedure TRecipeGroupWrapInfo.SetGroupNum(AGroupNum: Integer;
  AGroupCount: Integer);
begin
  FCurGroupNum := AGroupNum;
  FCurGroupCount := AGroupCount;
  FCurGroupIndex := 1;
  // 解决自动排序问题
  FTableView.ViewData.Table.AutoSortRecords := False;
  FTableView.ForEachSelected(DoSetGroupNum);
  FTableView.ViewData.Table.AutoSortRecords := True;
end;

procedure TRecipeGroupWrapInfo.DoActionGroupUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := FTableView.CanEdit;
end;

procedure TRecipeGroupWrapInfo.DoSetGroupNum(Sender: TObject);
begin
  with FTableView do
    if CanEdit then
    begin
      DataEdit;
      if (FCurGroupNum = 0) or (FCurGroupNum >= iDefaultGroupNum) then
        ViewData.AsInteger[sHisFieldGroupNum] := iDefaultGroupNum * 10000
      else
        ViewData.AsInteger[sHisFieldGroupNum] := FCurGroupNum * 10000 +
          FCurGroupCount * 100 + FCurGroupIndex;
      DataSave;
      Inc(FCurGroupIndex);
    end
end;

procedure TRecipeGroupWrapInfo.GroupNumDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
var
  GroupNum, GroupCount, GroupIndex: Integer;
  LineShape: Integer;
  R: TRect;
  gp: TdxGPGraphics;
begin
  ADone := True;

  R := AViewInfo.Bounds;
  ACanvas.FillRect(R, clWhite);

  GroupNum := AViewInfo.Value;
  if (GroupNum div 10000 = 0) or (GroupNum div 10000 >= iDefaultGroupNum) then
    Exit;

  GroupCount := GroupNum div 100 mod 100;
  GroupIndex := GroupNum mod 100;

  if (GroupIndex = 1) and (GroupIndex = GroupCount) then
    LineShape := 3
  else if (GroupIndex = 1) then
    LineShape := 0
  else if (GroupIndex = GroupCount) then
    LineShape := 2
  else
    LineShape := 1;

  if GroupIndex = 1 then
  begin
    Dec(R.Right, 12);
    ACanvas.Font.Color := clRed;
    ACanvas.Brush.Color := clWhite;
    ACanvas.DrawTexT(IntToStr(GroupNum div 10000), R, taCenter, vaCenter,
      False, False);
    Inc(R.Right, 12);
  end;

  ACanvas.Pen.Color := clBlue;

  gp := dxGpBeginPaint(ACanvas.Handle, AViewInfo.Bounds);
  gp.SmoothingMode := smAntiAlias;

  case LineShape of
    0:
      begin
        ACanvas.MoveTo(R.Right, (R.Top + R.Bottom) div 2);
        ACanvas.LineTo((R.Left + R.Right) div 2, (R.Top + R.Bottom) div 2);
        ACanvas.LineTo((R.Left + R.Right) div 2, R.Bottom);

        gp.Ellipse(Rect(R.Right - 7, (R.Top + R.Bottom) div 2 - 3, R.Right - 1,
          (R.Top + R.Bottom) div 2 + 3), clBlue, clBlue);
      end;
    1:
      begin
        ACanvas.MoveTo((R.Left + R.Right) div 2, R.Top);
        ACanvas.LineTo((R.Left + R.Right) div 2, R.Bottom);
      end;
    2:
      begin
        ACanvas.MoveTo((R.Left + R.Right) div 2, R.Top);
        ACanvas.LineTo((R.Left + R.Right) div 2, (R.Top + R.Bottom) div 2);
        ACanvas.LineTo(R.Right, (R.Top + R.Bottom) div 2);

        gp.Ellipse(Rect(R.Right - 7, (R.Top + R.Bottom) div 2 - 3, R.Right - 1,
          (R.Top + R.Bottom) div 2 + 3), clBlue, clBlue);
      end;
    3:
      begin
        gp.Line(R.Right - 4, R.Top + (R.Bottom - R.Top) div 4,
          (R.Left + R.Right) div 2, (R.Top + R.Bottom) div 2, clBlue);

        gp.Line((R.Left + R.Right) div 2, (R.Top + R.Bottom) div 2, R.Right - 4,
          R.Top + (R.Bottom - R.Top) div 4 * 3, clBlue);

        gp.Ellipse(Rect(R.Right - 7, R.Top + (R.Bottom - R.Top) div 4 - 3,
          R.Right - 1, R.Top + (R.Bottom - R.Top) div 4 + 3), clBlue, clBlue);

        gp.Ellipse(Rect(R.Right - 7, R.Top + (R.Bottom - R.Top) div 4 * 3 - 3,
          R.Right - 1, R.Top + (R.Bottom - R.Top) div 4 * 3 + 3),
          clBlue, clBlue);
      end;
  end;
  dxGpEndPaint(gp);
end;

procedure TRecipeGroupWrapInfo.UnWrap;
begin
  inherited;

end;

procedure TRecipeGroupWrapInfo.Wrap;
begin
  inherited;
  FTableView := TTableGridDataView(Target);
  FTableView.GridPopupMenu.Grid := nil;
  if StrToBoolDef(FTableView.ViewData.CustomAttributes.Values
    ['CreateGroupAction'], True) then
    BuildGroupNumAction;
  FTableView.TableView.GetColumnByFieldName(sHisFieldGroupNum).OnCustomDrawCell
    := GroupNumDrawCell;
end;

procedure TRecipeGroupWrapInfo.DoActionAutoGroup(Sender: TObject);
begin
  FCurGroupNum := GetMaxGroupNum() + 1;
  FTableView.TableView.DataController.ClearSelection;
  FTableView.TableView.DataController.ForEachRow(False, SelectUnGroupRecord);
  SetGroupNum(FCurGroupNum,
    FTableView.TableView.DataController.GetSelectedCount);
end;

function TRecipeGroupWrapInfo.GetAvailableGroupNum: Integer;
begin
  FGroupFlags := TBits.Create;
  try
    FCurGroupNum := 0;
    FCurGroupCount := 0;
    FGroupFlags.Size := iDefaultGroupNum;
    FGroupFlags.Bits[0] := True;
    EnumDataTable(FTableView.ViewData.Table, SetGroupFlag, Null);
    Result := FGroupFlags.OpenBit;
    FCurGroupNum := Result;
  finally
    FGroupFlags.Free;
  end;
end;

procedure TRecipeGroupWrapInfo.SetGroupFlag(ADataTable: TDADataTable;
  AParam: Variant);
var
  GroupNum: Integer;
begin
  GroupNum := ADataTable.FieldByName(sHisFieldGroupNum).AsInteger div 10000;
  FGroupFlags.Bits[GroupNum] := True;
end;

procedure TRecipeGroupWrapInfo.SelectUnGroupRecord(ARowIndex: Integer;
  ARowInfo: TcxRowInfo);
begin
  with FTableView.TableView do
  begin
    if DataController.Values[ARowIndex, GetColumnByFieldName(sHisFieldGroupNum).
      Index] div 10000 = iDefaultGroupNum then
    begin
      Controller.FocusedRowIndex := ARowIndex;
      Controller.FocusedRow.Selected := True
    end
  end;
end;

function TRecipeGroupWrapInfo.GetMaxGroupNum: Integer;
begin
  FMaxGroupNum := 0;
  EnumDataTable(FTableView.ViewData.Table, SetMaxGroupNum, Null);
  Result := FMaxGroupNum;
end;

procedure TRecipeGroupWrapInfo.SetMaxGroupNum(ADataTable: TDADataTable;
  AParam: Variant);
var
  GroupNum: Integer;
begin
  GroupNum := ADataTable.FieldByName(sHisFieldGroupNum).AsInteger div 10000;
  if GroupNum < iDefaultGroupNum then
    FMaxGroupNum := Max(FMaxGroupNum, GroupNum);
end;

{ TRecipeGroupWrapper }

function TRecipeGroupWrapper.GetWrapInfoClass: TWrapInfoClass;
begin
  Result := TRecipeGroupWrapInfo;
end;

function TRecipeGroupWrapper.Wrap(ATarget: TTableGridDataView)
  : TRecipeGroupWrapInfo;
begin
  Result := TRecipeGroupWrapInfo(inherited Wrap(ATarget));
  Result.Wrap;
end;

{ TcdBaseChargeMoney }

constructor TcdBaseChargeMoney.Create(AOwner: TComponent);
begin
  inherited Create(AOwner, HisConnection, sDataServiceBase, 'Base_ChargeMoney');
  LogChanges := False;
end;

procedure TcdBaseChargeMoney.DoDataCalcFields(Sender: TDADataTable);
begin
  ChargeMoney := GetMoney - Price;
end;

function TcdBaseChargeMoney.GetGetMoney: Double;
begin
  Result := AsFloat['GetMoney'];
end;

procedure TcdBaseChargeMoney.SetGetMoney(const Value: Double);
begin
  AsFloat['GetMoney'] := Value;
end;

function TcdBaseChargeMoney.GetPrice: Double;
begin
  Result := AsFloat['Price'];
end;

procedure TcdBaseChargeMoney.SetPrice(const Value: Double);
begin
  AsFloat['Price'] := Value;
end;

function TcdBaseChargeMoney.GetChargeMoney: Double;
begin
  Result := AsFloat['ChargeMoney'];
end;

procedure TcdBaseChargeMoney.SetChargeMoney(const Value: Double);
begin
  AsFloat['ChargeMoney'] := Value;
end;

{ TcvBaseChargMoney }

procedure TcvBaseChargMoney.BuildDialog;
begin
  inherited;
  Caption := '收款找零';
  FChargeData := TcdBaseChargeMoney.Create(Self);
  FChargeData.Open;
  DevExpress.BuildFormView(DialogGroup, FChargeData);
  FChargeData.Edit;
end;

initialization

RegisterHisFunction();
CustomDataPrintProc := PrintCustomData;
DevStatusBar := TDevStatusBar.Create(Application);
DevAlertWindow := TDevAlertWindow.Create(Application);
// 登录的时候管理TargetUrl
HisConnection := TDataConnection.Create(nil, 'supertcp://127.0.0.1:9900/bin',
  AppCore.Config.ReadString(sAppSection, 'DAStreamer', 'BIN'));
HisConnection.LoginServiceName := sRemoteServiceLogin;
HisConnection.SystemServiceName := sDataServiceSystem;
DataConnection := HisConnection;

HisUser := THisUser.Create(HisConnection);
CreateWrapper;

finalization

FreeAndNil(HisUser);
FreeAndNil(HisConnection);
FreeWrapper;

end.
