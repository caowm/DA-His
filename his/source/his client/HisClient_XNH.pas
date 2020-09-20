unit HisClient_XNH;

interface

{
   新农合接口

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
  HisClient_Hosp;

const
  sXNHDLL = 'LxClient.dll';
  sXNHLogicalName_InHosp = 'XNH_InHosp';

function InitDLL(DataBuffer: PChar):integer; stdcall; external sXNHDLL;
function GetCoopMedCodeByCardID(aOrganID, aCardID: PChar;
          DataBuffer: PChar): Integer; stdcall; external sXNHDLL;
function GetHzPersonInfo(AsOrganID, AsCoopMedCode,
          DataBuffer: PChar):Integer; stdcall; external sXNHDLL;
function GetZzinfo_zz(aGrade, aAreaCode,
          DataBuffer: PChar):Integer; stdcall; external sXNHDLL;
function SaveInHosInfo(AsOrganID, AsCoopMedCode,
          AsExpressionsID, AsPatientName: PChar; AiIDNo: Integer;
          AsIllCode, AsIllName, AInDate, Adke, AdLimitDef, AsDoctorName,
          AsPatientId, AsFlag, AiDiagNo, AsExpenseKind,
          AsLimitIllCode, DataBuffer: PChar): Integer; stdcall; external sXNHDLL;
function DeleteHosInfo(AsOrganID, AsCoopMedCode: PChar;
          AiIDNo, AiDiagNo: Integer;
          DataBuffer: PChar):Integer; stdcall; external sXNHDLL;
function SaveFreeList(AsOrganID, AsCoopMedCode: PChar;
          AiIDNo, AiDiagNo: Integer;
          AsItemCode, AsHosCode, ADInputDate: PChar;
          AfPrice, AfNum, AfFee: Double;
          AsUnit, AsOfficeName, AsDoctor, AsCompound: PChar;
          DataBuffer: PChar): Integer; stdcall; external sXNHDLL;
function DeleteFeeList(AsOrganID, AsCoopMedCode: PChar;
          AiIDNo, AiDiagNo: Integer;
          DataBuffer: PChar): Integer; stdcall; external sXNHDLL;
function ProcessFeeList(AsOrganID, AsCoopMedCode: PChar;
          AiIDNo, AiDiagNo: Integer;
          DataBuffer: PChar): Integer; stdcall; external sXNHDLL;
function PreClearing(AsOrganID, AsCoopMedCode: PChar; AiIDNo, AiDiagNo,
          APreClearFlag, ADayCount: Integer; AOutDate, AJsDate,
          AOutStatus,DataBuffer: PChar): Integer; stdcall; external sXNHDLL;
function GetCalcFee(AsOrganID, AsCoopMedCode: PChar; AiIDNo, AiDiagNo: Integer;
          DataBuffer: PChar): Integer; stdcall; external sXNHDLL;
function CanceCalcFee(AsOrganID, AsCoopMedCode: PChar; AiIDNo, AiDiagNo:Integer;
          DataBuffer:PChar): Integer; stdcall; external sXNHDLL;
function zzSaveInHosInfo(AsOrganID, aAreaCode, AsCoopMedCode, AsExpressionsID: PChar;
          AiIDNo, aTurnID: Integer; AsIllCode, AsIllName, AInDate,
          Adke, AdLimitDef, AsDoctor, AsPatientId, AsExpenseKind,
          AsLimitIllCode, DataBuffer: Pchar): Integer; stdcall; external sXNHDLL;
function zzGetCoopMedCodeByCardID(aOrganID, aAreaCode, aCardID: PChar;
          DataBuffer: PChar): Integer; stdcall; external sXNHDLL;
function zzGetDataBack(AOrganID, aAreaCode, aCoopMedCode: PChar;
          aIDNo, aDiagNo: Integer; aExpressionsId: PChar;
          DataBuffer: PChar): Integer; stdcall; external sXNHDLL;
function zzBack_ClearData(AOrganID, aAreaCode, aCoopMedCode,
          aIDNo, aDiagNo: PChar;
          DataBuffer: PChar): Integer; stdcall; external sXNHDLL;



type
  TXNHService = class(TCustomDataService)
  private
  public
  end;

  TxdPerson = class(TCustomData)
  private
  public
    constructor Create(AOwner: TComponent);
    procedure OpenByKeyValue(OrganID, MedCode, IDNo: string);
  end;

  TxdInHosp = class(TCustomData)
  private
    function GetCoopMedCode: string;
    function GetDiagNo: Integer;
    function GetIDNo: Integer;
    function GetOrganID: string;
    function GetAsOrganID: string;
    function GetAreaCode: string;
    function GetExpressionsID: string;
    function GetIsTurn: Boolean;
    procedure SetCoopMedCode(const Value: string);
    procedure SetIDNo(const Value: Integer);
    function GetGradeID: string;
    function GetCardNum: string;
    function GetIDNoText: string;
  public
    constructor Create(AOwner: TComponent);
    procedure OpenByHospID(HospID: string);

    property AsOrganID: string read GetAsOrganID;
    property OrganID: string read GetOrganID;
    property GradeID: string read GetGradeID;
    property AreaCode: string read GetAreaCode;
    property CardNum: string read GetCardNum;
    property CoopMedCode: string read GetCoopMedCode write SetCoopMedCode;
    property IDNo: Integer read GetIDNo write SetIDNo;
    property IDNoText: string read GetIDNoText;
    property DiagNo: Integer read GetDiagNo;
    property ExpressionsID: string read GetExpressionsID;
    property IsTurn: Boolean read GetIsTurn;
  end;

  TxdOutHosp = class(TCustomData)
  private
  public
    constructor Create(AOwner: TComponent);
    procedure OpenByHospID(HospID: string);
  end;

  TxdOutHospInfo1 = class(TCustomData)
  private
  public
    constructor Create(AOwner: TComponent);
    procedure OpenByHospID(HospID: string);
  end;

  TxdOutHospInfo2 = class(TCustomData)
  private
    FHospID: string;
  protected
    procedure DoDataBeforePost(Sender: TDADataTable); override;
  public
    constructor Create(AOwner: TComponent);
    procedure OpenByHospID(HospID: string);
  end;

  TxdOutHospInfo3 = class(TCustomData)
  private     
    FHospID: string;
  protected
    procedure DoDataBeforePost(Sender: TDADataTable); override;
  public
    constructor Create(AOwner: TComponent);
    procedure OpenByHospID(HospID: string);
  end;

  TXNHCore = class(TComponent)
  private
    FInitialized: Boolean;
    FBuffer: array[0..500] of Char;
    //FXNHPerson: TxdPerson;
    FXNHInHosp2: TxdInHosp;

    FResultList: TStrings;

    FCoopMedCode: string;
    FIDNo: Integer;       
    FPatientName: string;

    function GetXNHInHosp: TxdInHosp;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy(); override;

    procedure Init();
    procedure ClearBuffer();

    procedure TextToData(DataBuffer: PChar; Dest: TCustomData;
      RecordSeparator: string = '$$'; FieldSeparator: Char = '|');
    function DataToText(Source: TCustomData;
      RecordSeparator: string = '$$'; FieldSeparator: Char = '|'): string;

    procedure SetResultList(Buffer: string; FieldSeparator: Char = '|');

    function GetCoopMedCode(OrganID, CardID: string): Boolean;

    function GetZZCoopMedCode(OrganID, AreaCode, CardID: string): Boolean;
    function GetZzInfo(Grade, AreaCode: string): Boolean;

    procedure InHosp_Prepare(HospID: string);
    procedure InHosp_Reg(HospID: string);
    procedure InHosp_Cancel(HospID: string);

    procedure OutHosp_Prepare(HospID: string);
    procedure OutHosp_Cancel(HospID: string);

    procedure OutHosp_WriteBack(AXNHInHosp: TxdInHosp; AHospID: string); 
    procedure OutHosp_WriteBackCancel(AXNHInHosp: TxdInHosp; AHospID: string);

    property Initialized: Boolean read FInitialized;
    property XNHInHosp: TxdInHosp read GetXNHInHosp;

    property ResultList: TStrings read FResultList;
    property CoopMedCode: string read FCoopMedCode;
    property IDNo: Integer read FIDNo;
    property PatientName: string read FPatientName;
  end;

  TXNHHospReg = class(TBaseDialog)
  private
    FPatientType: Integer;
    FHospID: string;
    FXNHInHosp: TxdInHosp;
    FXNHPerson: TxdPerson;
    FZZPerson: TCustomData;
    FHospInOutView: TCustomDataView;
    FILLData: TCustomData;
    FBXGSData: TCustomData;
    procedure DoOrganIDChange(Sender: TDACustomField);
    procedure DoReadPersonAction(Sender: TObject);
    procedure DoXNHRegAction(Sender: TObject);
    procedure DoGetMedCodeAction(Sender: TObject);
    procedure DoReadZZInfoAction(Sender: TObject);
  protected
    procedure BuildDialog(); override;
    function DoExecute(CommandID: Integer; const Param: array of Variant): Variant; override;
    procedure DoDialogOK(Sender: TObject); override;
  public
  end;

  TOperationXNHHospReg = class(TViewOperation)
  private
    procedure DoActionCancelReg(Sender: TObject);
  public
    procedure AfterConstruction(); override;
  end;

  TXNHHospItemUpload = class(TTableGridDataView)
  private
    FHospID: string;
    FBuffer: array[0..400] of Char;
    FUploading: Boolean;
    procedure DoActionWholeUpload(Sender: TObject);
    procedure DoActionWholeUploadUpdate(Sender: TObject);
    procedure DoSingleUpload(ADataTable: TDADataTable; AParam: Variant);
  protected
    procedure BuildViewLayout(); override;
    procedure BuildViewAction(); override;
    function DoExecute(CommandID: Integer; const Param: array of Variant): Variant; override;
  public
    destructor Destroy(); override;
    procedure DataQuery(); override;
  end;

  TXNHHospOutReg = class(TBaseDialog)
  private
    FHospID: string;
    FXNHInHosp: TxdInHosp;
    FXNHOutHosp: TxdOutHosp;
    FBuffer: array[0..3000] of Char;
    FOutInfo1: TxdOutHospInfo1;
    FOutInfo2: TxdOutHospInfo2;
    FOutInfo3: TxdOutHospInfo3;
    
    procedure GetBalanceData();
    procedure OpenByHospID();
  protected
    procedure BuildDialog(); override;
    function DoExecute(CommandID: Integer; const Param: array of Variant): Variant; override;
    procedure DoDialogOK(Sender: TObject); override;
  public
  end;

  TOperationXNHHospOutReg = class(TViewOperation)
  private
    procedure DoActionCancelOutReg(Sender: TObject);
  public
    procedure AfterConstruction(); override;
  end;

  TXNHHospFee = class(TBaseDialog)
  private
    FHospFeeDialog: TcvHospFeeDialog;
    FHospID: string;
    FBalanced: Boolean;
    FOutInfo1: TxdOutHospInfo1;
    FBuffer: array[0..3000] of Char;
    FFeeList: TStrings;
    FBalanceAction: TAction;
    FPrintAction: TAction;
    FXNHMoney: Currency;
  private
    procedure OpenByHospID();
    procedure DoBalanceAction(Sender: TObject);
    procedure DoPrintAction(Sender: TObject);
    procedure DoPrintUpdate(Sender: TObject);
    procedure PrintCallback(Sender: TcvHospFeeDialog);
  protected
    procedure BuildDialog(); override;
  public
    destructor Destroy(); override;
    function Execute(HospFeeDialog: TcvHospFeeDialog): Boolean;

    property HospID: string read FHospID;
    property HospFeeDialog: TcvHospFeeDialog read FHospFeeDialog;
  end;

  TXNHInOutInfo = class(TTableGridDataView)
  private
    procedure DoActionWriteBack(Sender: TObject);
  protected
    procedure BuildViewLayout(); override;
    procedure BuildViewAction(); override;
  public
    procedure DataQuery(); override;
  end;


procedure DefineXNHCommonData(ADataContainer: TDataContainer);
procedure OrganizeXNHOperations();
procedure CheckResult(ReturnCode: Integer; DataBuffer: PChar);
function XNHHospFeeProc(Sender: TcvHospFeeDialog): Boolean;

var
  XNHCore: TXNHCore;
  XNHService: TXNHService;
  XNHHospFee: TXNHHospFee;

implementation

uses
  App_Dev_Toolbar;


function XNHHospFeeProc(Sender: TcvHospFeeDialog): Boolean;
begin
  if XNHHospFee = nil then
    XNHHospFee := TXNHHospFee.Create(Application);
  Result := XNHHospFee.Execute(Sender);
end;

procedure DefineXNHCommonData(ADataContainer: TDataContainer);
begin
  with ADataContainer do
  begin
    RegisterData(HisConnection, sDataServiceXNH, sDataNameXNHArea, THisData, 0, '');
    //RegisterData(HisConnection, sDataServiceXNH, sDataNameXNHBXGS, THisData, 0, '');
    //RegisterData(HisConnection, sDataServiceXNH, sDataNameXNHIllness, THisData, 0, '');
    RegisterData(HisConnection, sDataServiceXNH, sDataNameXNHHospType, THisData, 0, '');
  end;
end;

procedure OrganizeXNHOperations();
begin
  with TOperationXNHHospReg.Create(sOperationIDXNHHospReg) do
  begin
    Category := sOperationCategoryXNH;
    Caption := '农合住院登记';
    ImageName := sOperationIDXNHHospReg;
    Order := 'r05';
    Flag := iOperationFlag_HospInOut or iOperationFlag_NoMenu or iOperationFlag_NoTree;
    ViewClass := TXNHHospReg;
    CustomAttributes.Add('PluginCategory=XNH');
  end;

  with TViewOperation.Create(sOperationIDXNHHospItemUpload) do
  begin
    Category := sOperationCategoryXNH;
    Caption := '农合上传';
    ImageName := sOperationIDXNHHospItemUpload;
    Order := 'r07';
    Flag := iOperationFlag_HospInOut or iOperationFlag_NoMenu or iOperationFlag_NoTree;
    ViewClass := TXNHHospItemUpload;
    CustomAttributes.Add('PluginCategory=XNH');
  end;

  with TOperationXNHHospOutReg.Create(sOperationIDXNHHospOutReg) do
  begin
    Category := sOperationCategoryXNH;
    Caption := '农合出院登记';
    ImageName := sOperationIDXNHHospOutReg;
    Order := 'r09';
    Flag := iOperationFlag_HospInOut or iOperationFlag_NoMenu or iOperationFlag_NoTree;
    ViewClass := TXNHHospOutReg;
    CustomAttributes.Add('PluginCategory=XNH');
  end;
  
  with TViewOperation.Create(sOperationIDXNHInOutInfo) do
  begin
    Category := sOperationCategoryYB;
    Caption := '农合入出院查询';
    ImageName := sOperationIDXNHInOutInfo;
    Access := sAccessYBQuery;
    Order := 'Q03';
    ViewClass := TXNHInOutInfo;
  end;

end;

{ TXNHCore }

procedure CheckResult(ReturnCode: Integer; DataBuffer: PChar);
begin
  if ReturnCode <> 0 then
    raise Exception.Create('新农合调用出错：' + DataBuffer);
end;

procedure TXNHCore.ClearBuffer;
begin   
  FillChar(FBuffer, SizeOf(FBuffer), #0);
end;

constructor TXNHCore.Create(AOwner: TComponent);
begin
  inherited;
  FResultList := TStringList.Create;
end;

function TXNHCore.DataToText(Source: TCustomData; RecordSeparator: string;
  FieldSeparator: Char): string;
var
  Dest: TStrings;
  FieldIndex: Integer;
begin
  Dest := TStringList.Create;
  try
    Dest.Delimiter := FieldSeparator;

    FieldIndex := 0;

    while not Source.Eof do
    begin

      for FieldIndex := 0 to Source.Table.FieldCount - 1 do
      begin
        with Source.Table.Fields[FieldIndex] do
        begin
          if not SameText(Name, 'RecID') and
            StrToBoolDef(CustomAttributes.Values['XNHFlag'], True) then
          begin
            Dest.Add(AsString);
          end;
        end;
      end;
      Dest.Add(RecordSeparator);

      Source.Next;
    end;

    Dest.Add('');

    Result := Dest.DelimitedText;

  finally
    Source.Free;
  end;

end;

destructor TXNHCore.Destroy;
begin
  FResultList.Free;
  inherited;
end;

function TXNHCore.GetCoopMedCode(OrganID, CardID: string): Boolean;
var
  Buffer: array[0..300] of Char;
begin
  Init;

  CheckResult(
    GetCoopMedCodeByCardID(
      PChar(OrganID),
      PChar(CardID),
      Buffer),
    Buffer);

  SetResultList(Buffer);

  AppCore.Logger.Write('读取到农合证号|' + FResultList.Text, mtInfo, 0);

  FCoopMedCode := ResultList[0];
  if ResultList.Count > 1 then
    FIDNo := StrToIntDef(ResultList[1], 1);
  if ResultList.Count > 2 then
    FPatientName := ResultList[2];
  
  Result := True;

end;

function TXNHCore.GetXNHInHosp: TxdInHosp;
begin
  if FXNHInHosp2 = nil then
    FXNHInHosp2 := TxdInHosp.Create(Self);
  Result := FXNHInHosp2;
end;

function TXNHCore.GetZZCoopMedCode(OrganID, AreaCode,
  CardID: string): Boolean;
var
  Buffer: array[0..300] of Char;
begin
  Init;

  CheckResult(
    zzGetCoopMedCodeByCardID(
      PChar(OrganID),
      PChar(AreaCode),
      PChar(CardID),
      Buffer),
    Buffer);

  AppCore.Logger.Write('读取到转诊农合证号|' + Buffer, mtInfo, 0);
  SetResultList(Buffer);


  FCoopMedCode := ResultList[0];
  if ResultList.Count > 1 then
    FIDNo := StrToIntDef(ResultList[1], 1);
  if ResultList.Count > 2 then
    FPatientName := ResultList[2];
  
  Result := True;
end;

function TXNHCore.GetZzInfo(Grade, AreaCode: string): Boolean;
begin

end;

procedure TXNHCore.InHosp_Cancel(HospID: string);
var
  DataBuffer: array[0..100] of Char;
begin
  Init;
  
  XNHInHosp.OpenByHospID(HospID);
  
  with XNHInHosp do
  begin
    if AsString['AiDiagNo'] <> '' then
      CheckResult(DeleteHosInfo(PChar(OrganID),
        PChar(AsString['AsCoopMedCode']),
        AsInteger['AiIDNo'],
        AsInteger['AiDiagNo'],
        DataBuffer),
        DataBuffer);
  end;

  XNHService.DACommand.Execute('Pro_XNH_InHosp_Cancel',
    [sFieldHospID, sFieldOpID],
    [HospID, HisUser.ID]);
end;

procedure TXNHCore.InHosp_Prepare(HospID: string);
begin
  XNHService.DACommand.Execute('Pro_XNH_InHosp_Prepare',
    [sFieldHospID, sFieldOpID],
    [HospID, HisUser.ID]);
end;

procedure TXNHCore.InHosp_Reg(HospID: string);
begin       
  XNHService.DACommand.Execute('Pro_XNH_InHosp_Reg',
    [sFieldHospID, sFieldOpID],
    [HospID, HisUser.ID]);
end;

procedure TXNHCore.Init;
begin
  if FInitialized then Exit;

  ClearBuffer();
  CheckResult(InitDLL(FBuffer), FBuffer);
  FInitialized := True;
  AppCore.Logger.Write('新农合接口初始化成功', mtInfo, 0);
end;

procedure TXNHCore.OutHosp_Cancel(HospID: string);
var
  Buffer: array[0..200] of Char;
begin
  Init;
  
  XNHInHosp.OpenByHospID(HospID);
  Check(XNHInHosp.Eof, '未找到农合病人信息');

  // 不允许取消则报错
  XNHService.DACommand.Execute('Pro_XNH_OutHosp_Cancel',
    [sFieldHospID, sFieldOpID],
    [HospID, '']);

  //先取消回写
  OutHosp_WriteBackCancel(XNHInHosp, HospID);

  AppCore.Logger.Write('正在取消新农合结算|' + HospID, mtInfo, 0);

  CheckResult(
    CanceCalcFee(
      PChar(XNHInHosp.OrganID),
      PChar(XNHInHosp.CoopMedCode),
      XNHInHosp.IDNo,
      XNHInHosp.DiagNo,
      Buffer),
    Buffer);

  // 没有结算的忽略，否则清除结算数据
  XNHService.DACommand.Execute('Pro_XNH_OutHosp_Cancel',
    [sFieldHospID, sFieldOpID],
    [HospID, HisUser.ID]);

end;

procedure TXNHCore.OutHosp_Prepare(HospID: string);
begin
  XNHService.DACommand.Execute('Pro_XNH_OutHosp_Prepare',
    [sFieldHospID, sFieldOpID],
    [HospID, HisUser.ID]);
end;

procedure TXNHCore.OutHosp_WriteBack(AXNHInHosp: TxdInHosp; AHospID: string);
begin
  Init;

  if AXNHInHosp = nil then
  begin
    AXNHInHosp := XNHInHosp;
    AXNHInHosp.OpenByHospID(AHospID);
  end;

  
  with AXNHInHosp do
  begin
    if IsTurn then
    try
      AppCore.Logger.Write('正在回写新农合数据|' + AHospID, mtInfo, 0);

      // 回写数据到当地服务器
      CheckResult(
        zzGetDataBack(
          PChar(OrganID),
          PChar(AreaCode),
          PChar(CoopMedCode),
          IDNo,
          DiagNo,
          PChar(ExpressionsID),
          FBuffer),
        FBuffer);

      AppCore.Logger.Write('新农合数据回写成功|' + AHospID, mtInfo, 0);
    except
      on E: Exception do
      begin
        AppCore.Logger.Write('新农合数据回写失败|' + AHospID + '|' + E.Message, mtWarning, 0);
        ShowWarning('新农合数据回写失败，请通知医保办！您可以继续结算。'#13#10#13#10 + E.Message);
      end;
    end;
  end;
end;

procedure TXNHCore.OutHosp_WriteBackCancel(AXNHInHosp: TxdInHosp;
  AHospID: string);
begin
  Init;

  if AXNHInHosp = nil then
  begin
    AXNHInHosp := XNHInHosp;
    AXNHInHosp.OpenByHospID(AHospID);
  end;

  if AXNHInHosp.IsTurn then
  try
    AppCore.Logger.Write('正在清理新农合回写数据|' + AHospID, mtInfo, 0);

    // 清理已经回写的当地数量
    CheckResult(
      zzBack_ClearData(
        PChar(XNHInHosp.OrganID),
        PChar(XNHInHosp.AreaCode),
        PChar(XNHInHosp.CoopMedCode),
        PChar(XNHInHosp.AsString['AiIDNo']),
        PChar(XNHInHosp.AsString['AiDiagNo']),
        FBuffer),
      FBuffer);

    AppCore.Logger.Write('清理新农合数据成功|' + AHospID, mtInfo, 0);

  except
    on E: Exception do
      AppCore.Logger.Write('清理新农合回写数据失败|' + AHospID + '|' + E.Message, mtWarning, 1);
  end;

end;

procedure TXNHCore.SetResultList(Buffer: string; FieldSeparator: Char);
begin
  FResultList.Clear;
  FResultList.Delimiter := FieldSeparator;
  FResultList.DelimitedText := Buffer;
end;

procedure TXNHCore.TextToData(DataBuffer: PChar; Dest: TCustomData;
  RecordSeparator: string = '$$'; FieldSeparator: Char = '|');
var
  SourceList: TStrings;
  FieldIndex, SourceIndex: Integer;
begin
  SourceList := TStringList.Create;
  try
    SourceList.Delimiter := FieldSeparator;
    SourceList.DelimitedText := DataBuffer;

    SourceIndex := 0;
    FieldIndex := 0;

    while True do
    begin
      if (SourceIndex > SourceList.Count - 1) then
      begin
        Dest.Save;
        Break;
      end
      else if (SourceList[SourceIndex] = RecordSeparator)
        or (FieldIndex > Dest.Table.FieldCount - 1) then
      begin
        Dest.Save;
        FieldIndex := -1;
        Inc(SourceIndex);
        if RecordSeparator = '' then Break;
      end
      else begin         
        if not Dest.Table.Editing then
          Dest.Insert;

        with Dest.Table.Fields[FieldIndex] do
        begin
          if not SameText(Name, 'RecID') and
            StrToBoolDef(CustomAttributes.Values['XNHFlag'], True) then
          begin
              AsString := SourceList[SourceIndex];

            Inc(SourceIndex);
          end;
        end;
      end;

      Inc(FieldIndex);
    end;

  finally
    SourceList.Free;
  end;
end;

{ TXNHHospReg }

procedure TXNHHospReg.BuildDialog;
begin
  inherited;
  BuildAction('获取农合证号', '', '', nil, DoGetMedCodeAction, 0, 0);
  BuildAction('读转诊信息', '', '', nil, DoReadZZInfoAction, 0, 0);
  BuildAction('读病人信息', '', '', nil, DoReadPersonAction, 0, 0);
  BuildAction('登记为准农合', '', '', nil, DoXNHRegAction, 0, 0);
  BuildLayoutToolBar(BottomGroup, Actions);

  FXNHInHosp := TxdInHosp.Create(Self);
  FXNHInHosp.EnableBatchUpdate;
  FXNHInHosp.OpenByHospID('');
  FXNHInHosp.Source.AutoEdit := True;

  FXNHPerson := TxdPerson.Create(Self);
  FXNHPerson.EnableBatchUpdate;
  FXNHPerson.MaxRecords := 0;

  FZZPerson := TCustomData.Create(Self, HisConnection, sDataServiceXNH, 'XNH_ZZInfo');
  FZZPerson.EnableBatchUpdate;
  FZZPerson.MaxRecords := 0;

  ImageName := FXNHInHosp.CustomAttributes.Values['FormImageName'];
  DevExpress.BuildFormView(DialogGroup, FXNHInHosp);

  FILLData := DataContainer.Items[sDataNameXNHIllness];
  FBXGSData := DataContainer.Items[sDataNameXNHBXGS];
  FXNHInHosp.FieldByName('AsOrganID').OnChange := DoOrganIDChange;

end;

procedure TXNHHospReg.DoDialogOK(Sender: TObject);
var
  DataBuffer: array[0..100] of Char;
begin
  with FXNHInHosp do
  begin
    Save;
    
    Check(AsOrganID = '', '请填写农合区号');

    if ShowYesNo('确定提交新农合登记信息吗?') then
    begin

      if IsTurn then
      begin
        //todo: 检查转诊信息和登记信息
        
        CheckResult(
          zzSaveInHosInfo(PChar(OrganID),     
            PChar(AsString['AreaCode']),
            PChar(AsString['AsCoopMedCode']),
            PChar(AsString['AsExpressionsID']),
            AsInteger['AiIDNo'],
            AsInteger['TurnID'],
            PChar(AsString['AsIllCode']),
            PChar(AsString['AsIllName']),
            PChar(AsString['AInDate']),
            PChar(AsString['Adke']),
            PChar(AsString['AdLimitDef']),
            PChar(AsString['AsDoctorName']),
            PChar(AsString['AsPatientID']),
            PChar(AsString['AsExpenseKind']),
            PChar(AsString['AsLimitIllCode']),
            DataBuffer),
          DataBuffer)
      end
      else
      begin
        Check(FXNHPerson.Eof, '市农合请先输入农合证号，然后读取并选择农合病人');

        Check((FXNHPerson.AsString['PersonName'] <> FXNHInHosp.AsString['AsPatientName']),
          '登记姓名与农合姓名不匹配，不能办理农合登记.');

        Check((FXNHPerson.AsString['PersonOrder'] <> FXNHInHosp.AsString['AiIDNo']),
          '填写的个人序号与农合不匹配，请修正.');
        
        CheckResult(
          SaveInHosInfo(PChar(OrganID),
            PChar(AsString['AsCoopMedCode']),
            PChar(AsString['AsExpressionsID']),
            PChar(AsString['AsPatientName']),
            AsInteger['AiIDNo'],
            PChar(AsString['AsIllCode']),
            PChar(AsString['AsIllName']),
            PChar(AsString['AInDate']),
            PChar(AsString['Adke']),
            PChar(AsString['AdLimitDef']),
            PChar(AsString['AsDoctorName']),
            PChar(AsString['AsPatientID']),
            PChar(AsString['AsFlag']),
            PChar(AsString['AiDiagNo']),
            PChar(AsString['AsExpenseKind']),
            PChar(AsString['AsLimitIllCode']),
            DataBuffer),
          DataBuffer);
      end;

      AppCore.Logger.Write('新农合登记成功|' + FHospID + '|就诊号|' + DataBuffer, mtInfo, 1);

      Edit;

      if AsString['AiDiagNo'] = '' then
        AsString['AiDiagNo'] := DataBuffer;

      ApplyUpdates;

      XNHCore.InHosp_Reg(FHospID);

      FHospInOutView.ViewData.EditWithNoLogChanges([sFieldPatientTypeID], [iHospPatientType_XNH]);

      ModalResult := mrOk;
    end;
  end;

end;

function TXNHHospReg.DoExecute(CommandID: Integer;
  const Param: array of Variant): Variant;
begin
  Result := inherited DoExecute(CommandID, Param);

  if CommandID = iOperationCommand_Notify then
  begin
    FHospInOutView := TCustomDataView(Integer(Param[0]));
    with FHospInOutView, ViewData do
    begin  
      if Eof then Exit;

      XNHCore.Init;

      FPatientType := AsInteger[sFieldPatientTypeID];
      FHospID := AsString[sFieldHospID];

      FXNHPerson.Close;
      XNHCore.InHosp_Prepare(FHospID);
      FXNHInHosp.OpenByHospID(FHospID);
      FXNHInHosp.Edit;  
      DoOrganIDChange(nil);
    end;

    ShowModal;
  end;
end;

procedure TXNHHospReg.DoGetMedCodeAction(Sender: TObject);
begin
  FXNHInHosp.Save;
  
  Check(FXNHInHosp.AsOrganID = '', '请先行政区划');
  Check(FXNHInHosp.CardNum = '', '请先填写卡号');

  FXNHInHosp.Edit;

  if FXNHInHosp.IsTurn then
    XNHCore.GetZZCoopMedCode(FXNHInHosp.OrganID, FXNHInHosp.AreaCode, FXNHInHosp.CardNum)
  else
    XNHCore.GetCoopMedCode(FXNHInHosp.OrganID, FXNHInHosp.CardNum);

  FXNHInHosp.CoopMedCode := XNHCore.CoopMedCode;
  FXNHInHosp.IDNo := XNHCore.IDNo;
end;

procedure TXNHHospReg.DoOrganIDChange(Sender: TDACustomField);
begin
  FILLData.Close;
  FBXGSData.Close;

  FILLData.ParamValue['OrganID'] := FXNHInHosp.AsOrganID;
  FBXGSData.ParamValue['OrganID'] := FXNHInHosp.AsOrganID;
end;

procedure TXNHHospReg.DoReadPersonAction(Sender: TObject);
var
  Buffer: array[0..2048] of Char;
begin
  FXNHPerson.OpenByKeyValue('', '', '');
  with FXNHInHosp do
    CheckResult(
      GetHzPersonInfo(PChar(OrganID), PChar(CoopMedCode), Buffer),
      Buffer);

  XNHCore.TextToData(Buffer, FXNHPerson);
  
  AppCore.Logger.Write('读取到农合病人信息|' + Buffer, mtInfo, 0);

  FXNHPerson.Save;

  if DictIME.StartIME(nil, FXNHPerson, '', '', nil, False) then
  begin


  end;
end;

procedure TXNHHospReg.DoReadZZInfoAction(Sender: TObject);
var
  Buffer: array[0..500] of Char;
begin
  FXNHInHosp.Save;
  
  FZZPerson.Table.ClearRows(True);
  FZZPerson.Open;

  with FXNHInHosp do
    CheckResult(
      GetZzinfo_zz(PChar(GradeID), PChar(AsOrganID + '$$' +
        AreaCode + '$$' + CoopMedCode + '$$' + IDNoText), Buffer),
      Buffer);

  AppCore.Logger.Write('转诊信息|' + Buffer, mtInfo, 0);
  XNHCore.TextToData(Buffer, FZZPerson);

  FZZPerson.Save;

  if DictIME.StartIME(nil, FZZPerson, '', '', nil, False) then
  begin
    FXNHInHosp.Edit;
    FXNHInHosp.AsString['TurnID'] := FZZPerson.AsString['TurnID'];  
    FXNHInHosp.AsString['AiIDNo'] := FZZPerson.AsString['AiIDNo'];
  end;
end;

procedure TXNHHospReg.DoXNHRegAction(Sender: TObject);
begin
  Check(FXNHInHosp.AsOrganID = '', '请填写行政区划');
  if ShowYesNo('确定登记为准农合吗?') then
  begin  
    FXNHInHosp.Edit;
    FXNHInHosp.AsString['AsDoctorName'] := FXNHInHosp.AsString['AsDoctorName'] + ' ';
    FXNHInHosp.ApplyUpdates;
    // 保存之后触发登记过程
    XNHCore.InHosp_Reg(FHospID);
    FHospInOutView.ViewData.EditWithNoLogChanges([sFieldPatientTypeID], [iHospPatientType_XNH_Fake]);
    ModalResult := mrOk;
  end;
end;

{ TxdInHosp }

constructor TxdInHosp.Create(AOwner: TComponent);
begin
  inherited Create(AOwner, HisConnection, sDataServiceXNH, 'XNH_InHosp');
  EnableBatchUpdate;
end;

function TxdInHosp.GetAreaCode: string;
begin
  Result := AsString['AreaCode'];
end;

function TxdInHosp.GetAsOrganID: string;
begin
  Result := AsString['AsOrganID'];
end;

function TxdInHosp.GetCardNum: string;
begin
  Result := AsString['CardNum'];
end;

function TxdInHosp.GetCoopMedCode: string;
begin
  Result := AsString['AsCoopMedCode'];
end;

function TxdInHosp.GetDiagNo: Integer;
begin
  Result := AsInteger['AiDiagNo'];
end;

function TxdInHosp.GetExpressionsID: string;
begin
  Result := AsString['AsExpressionsID'];
end;

function TxdInHosp.GetGradeID: string;
var
  Grade: string;
begin
  if GetAsOrganID = '420000' then
    Grade := '1'
  else
    Grade := '2';
  Result := Grade  + '$$' + AsString['YearID'];
end;

function TxdInHosp.GetIDNo: Integer;
begin
  Result := AsInteger['AiIDNo'];
end;

function TxdInHosp.GetIDNoText: string;
begin
  //Result := AsString['AiIDNo'];
  Result := '';  // 专为转诊信息查询用，为空
end;

function TxdInHosp.GetIsTurn: Boolean;
begin
  Result := (AsOrganID = '420000') or (AsOrganID = '420100');
end;

function TxdInHosp.GetOrganID: string;
begin
  Result := AsString['AsOrganID']  + '$$' + AsString['YearID'];
end;

procedure TxdInHosp.OpenByHospID(HospID: string);
begin
  OpenByFieldValue(sFieldHospID, HospID);
end;

procedure TxdInHosp.SetCoopMedCode(const Value: string);
begin
  AsString['AsCoopMedCode'] := Value;
end;

procedure TxdInHosp.SetIDNo(const Value: Integer);
begin
  AsInteger['AiIDNo'] := Value;
end;

{ TxdPerson }

constructor TxdPerson.Create(AOwner: TComponent);
begin
  inherited Create(AOwner, HisConnection, sDataServiceXNH, 'XNH_PersonInfo');
end;

procedure TxdPerson.OpenByKeyValue(OrganID, MedCode, IDNo: string);
begin
  OpenByList(['AreaCode', 'CoopmedCode', 'PersonOrder'],
    [OrganID, MedCode, IDNo],
    [dboEqual, dboEqual, dboEqual],
    [dboAnd, dboAnd]);
end;

{ TOperationXNHHospReg }

procedure TOperationXNHHospReg.AfterConstruction;
begin
  inherited;
  BuildAction('取消新农合住院登记', '', nil, DoActionCancelReg, 0);
end;

procedure TOperationXNHHospReg.DoActionCancelReg(Sender: TObject);
var
  HospInOutView: TTableGridDataView;
  HospID: string;
begin
  HospInOutView := TTableGridDataView(CustomAttributes.Objects[CustomAttributes.IndexOf(sOperationIDHospPatientInOut)]);
  if (HospInOutView <> nil) and not HospInOutView.ViewData.Eof then
  begin
    HospID := HospInOutView.ViewData.AsString[sFieldHospID];

    if ShowYesNo('确定要取消新农合住院登记信息吗?') then
    begin
      XNHCore.InHosp_Cancel(HospID);

      AppCore.Logger.Write('取消新农合住院登记成功: ' + HospID, mtInfo, 1);

      HospInOutView.ViewData.EditWithNoLogChanges([sFieldPatientTypeID], [iHospPatientType_Normal]);
    end;
  end;
end;

{ TXNHHospItemUpload }

procedure TXNHHospItemUpload.BuildViewAction;
begin
  inherited;
  BuildAction('开始上传', 'upload', '', DoActionWholeUploadUpdate, DoActionWholeUpload, 0, BTN_SHOWCAPTION);
end;

procedure TXNHHospItemUpload.BuildViewLayout;
begin
  inherited;

  ToolBarGroup.ShowBorder := True;

  ViewData := TCustomData.Create(Self, HisConnection, sDataServiceXNH, 'Pro_XNH_Upload_GetData');
  ViewData.LogChanges := False;
end;

procedure TXNHHospItemUpload.DataQuery;
begin
  ViewData.OpenByParam([sFieldHospID, sFieldOpID],
    [FHospID, HisUser.ID]);
end;

destructor TXNHHospItemUpload.Destroy;
begin  
  inherited;
end;

procedure TXNHHospItemUpload.DoSingleUpload(ADataTable: TDADataTable; AParam: Variant);
begin
  FillChar(FBuffer, Length(FBuffer), #0);

  with ViewData do
  if AsBoolean['UploadSign'] then
  begin
    // 上传
    CheckResult(
      SaveFreeList(
        PChar(AsString['AsOrganID']),
        PChar(AsString['AsCoopMedCode']),
        AsInteger['AiIDNo'],
        AsInteger['AiDiagNo'],
        PChar(AsString['AsItemCode']),
        PChar(AsString['AsHosCode']),
        PChar(AsString['AdInputDate']),
        AsFloat['AfPrice'],
        AsFloat['AfNum'],
        AsFloat['AfFee'],
        PChar(AsString['AsUnit']),
        PChar(AsString['AsOfficeName']),
        PChar(AsString['AsDoctor']),
        PChar(AsString['AsCompound']),
        FBuffer),
      FBuffer);

    XNHService.DACommand.Execute('Pro_XNH_Upload_UpdateSign',
      [sFieldHospID, 'FeeDetailID', sFieldOpID],
      [FHospID, ViewData.AsInteger['FeeDetailID'], HisUser.ID]);  

    DevStatusBar.ShowProgress(RecordCount, Table.RecNo + 1)
  end;

end;

procedure TXNHHospItemUpload.DoActionWholeUpload(Sender: TObject);
begin
  if FUploading then Exit;

  XNHCore.Init;
  
  try
    FUploading := True;

    with ViewData do
    begin
      XNHService.DACommand.Execute('Pro_XNH_Upload',
        [sFieldHospID, 'DetailIDList', sFieldOpID],
        [FHospID, '', HisUser.ID]);

      CheckResult(
        ProcessFeeList(
          PChar(AsString['AsOrganID']),
          PChar(AsString['AsCoopMedCode']),
          AsInteger['AiIDNo'],
          AsInteger['AiDiagNo'],
          FBuffer),
        FBuffer);

      XNHService.DACommand.Execute('Pro_XNH_Upload_UpdateSign',
        [sFieldHospID, sFieldOpID, 'DetailIDList'],
        [FHospID, HisUser.ID, '']);

    end;

    AppCore.Logger.Write('新农合上传完成|' + FHospID, mtInfo, 1);
  finally
    FUploading := False;
    DevStatusBar.ShowProgress(0, 0); // 隐藏进度条
    DataQuery;
  end;
end;

procedure TXNHHospItemUpload.DoActionWholeUploadUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := ViewData.Table.Active
    and (ViewData.RecordCount > 0);
end;

function TXNHHospItemUpload.DoExecute(CommandID: Integer;
  const Param: array of Variant): Variant;
begin
  Result := inherited DoExecute(CommandID, Param);

  if CommandID = iOperationCommand_Notify then
  begin
    with TCustomDataView(Integer(Param[0])).ViewData do
    begin
      if Eof then Exit;

      Check(AsInteger[sFieldPatientTypeID] <> iHospPatientType_XNH, '非新农合病人.');

      ToolBarGroup.Caption := GetRecordText(CustomAttributes.Values['PatientInfoFields'], '  ');

      FHospID := AsString[sFieldHospID];
      
      DataQuery;

      AppCore.MainView.ShowView(Self);
    end;  
  end;
end;

{ TXNHHospOutReg }

procedure TXNHHospOutReg.BuildDialog;
begin
  inherited;
  FXNHInHosp := TxdInHosp.Create(Self);
  FXNHInHosp.CustomAttributes.Values['FormEditFields'] :=
    FXNHInHosp.CustomAttributes.Values['PreClearingFields'];
  FXNHInHosp.OpenByHospID('');

  FXNHOutHosp := TxdOutHosp.Create(Self);
  FXNHOutHosp.OpenByHospID('');

  FOutInfo1 := TxdOutHospInfo1.Create(Self);
  FOutInfo1.EnableBatchUpdate;

  FOutInfo2 := TxdOutHospInfo2.Create(Self);
  FOutInfo2.EnableBatchUpdate;

  FOutInfo3 := TxdOutHospInfo3.Create(Self);
  FOutInfo3.EnableBatchUpdate;

  DevExpress.BuildFormView(DialogGroup, FXNHInHosp);
  DevExpress.BuildFormView(DialogGroup, FXNHOutHosp);
end;

procedure TXNHHospOutReg.DoDialogOK(Sender: TObject);
begin
  if ShowYesNo('确定提交新农合出院登记信息吗?') then
  begin
    FillChar(FBuffer, Length(FBuffer), #0);

    with FXNHInHosp do
    begin
      AppCore.Logger.Write('正在调用新农合结算|' + FHospID, mtInfo, 0);

      CheckResult(
        PreClearing(
          PChar(OrganID),
          PChar(CoopMedCode),
          IDNo,
          DiagNo,
          AsInteger['APreClearFlag'],
          AsInteger['ADayCount'],
          PChar(AsString['AOutDate']),
          PChar(AsString['AJsDate']),
          PChar(AsString['AOutStatus']),
          FBuffer),
        FBuffer);
    end;   

    AppCore.Logger.Write('新农合结算信息:' + FBuffer, mtInfo, 0);
    FXNHOutHosp.Edit;
    XNHCore.TextToData(FBuffer, FXNHOutHosp, '');

    FXNHInHosp.AsString['OutBuffer'] := FBuffer;
    FXNHOutHosp.ApplyUpdates;
    FXNHInHosp.ApplyUpdates;

    AppCore.Logger.Write('正在获取新农合审批表|' + FHospID, mtInfo, 0);
    GetBalanceData;

    AppCore.Logger.Write('新农合出院登记完成|' + FHospID, mtInfo, 1);

    XNHCore.OutHosp_WriteBack(FXNHInHosp, FHospID);

    ModalResult := mrOk;
  end;

end;

function TXNHHospOutReg.DoExecute(CommandID: Integer;
  const Param: array of Variant): Variant;
begin
  Result := inherited DoExecute(CommandID, Param);

  if CommandID = iOperationCommand_Notify then
  with TCustomDataView(Integer(Param[0])), ViewData do
  begin
    if Eof then Exit;

    Check(AsInteger[sFieldPatientTypeID] <> iHospPatientType_XNH, '非新农合病人');

    FHospID := AsString[sFieldHospID];

    XNHCore.Init;

    XNHService.DACommand.Execute('Pro_XNH_OutHosp_Prepare',
      [sFieldHospID, sFieldOpID],
      [FHospID, HisUser.ID]);

    FXNHInHosp.OpenByHospID(FHospID);

    FXNHOutHosp.OpenByHospID(FHospID);

    Check(FXNHInHosp.Eof, '未找到新农合登记信息');

    FXNHInHosp.Edit;

    if Self.ShowModal = mrOk then
    begin
    end;
  end;

end;

procedure TXNHHospOutReg.GetBalanceData;
var
  Temp: string;
  Index: Integer;
begin
  OpenByHospID;
  
  FillChar(FBuffer, Length(FBuffer), #0);

  with XNHCore.XNHInHosp do
    CheckResult(
      GetCalcFee(
        PChar(OrganID),
        PChar(CoopMedCode),
        IDNo,
        DiagNo,
        FBuffer),
      FBuffer);

  AppCore.Logger.Write('农合结算数据|' + FBuffer, mtInfo, 0);

  Index := Pos('$$', FBuffer);
  Temp := Copy(FBuffer, 1, Index - 2);
  AppCore.Logger.Write('农合结算数据1|' + Temp, mtInfo, 0);
  if not FOutInfo1.Eof then
    FOutInfo1.Edit;
  XNHCore.TextToData(PChar(Temp), FOutInfo1, '$$', '|');
  FOutInfo1.Save;

  Temp := Copy(FBuffer, Index + 4, PosEx('$$', FBuffer, Index + 2) - Index - 4);
  Temp := StringReplace(Temp, '##', '|##|', [rfReplaceAll]); 
  AppCore.Logger.Write('农合结算数据2|' + Temp, mtInfo, 0);
  XNHCore.TextToData(PChar(Temp), FOutInfo2, '##', '|');

  Index := PosEx('$$', FBuffer, Index + 2);
  Temp := Copy(FBuffer, Index + 4, Length(FBuffer));
  Temp := StringReplace(Temp, '@@', '|', [rfReplaceAll]);
  Temp := StringReplace(Temp, '##', '|##|', [rfReplaceAll]);
  AppCore.Logger.Write('农合结算数据3|' + Temp, mtInfo, 0);
  XNHCore.TextToData(PChar(Temp), FOutInfo3, '##', '|');

  FOutInfo1.ApplyUpdates;
  FOutInfo2.ApplyUpdates;
  FOutInfo3.ApplyUpdates;
end;

procedure TXNHHospOutReg.OpenByHospID;
begin
  FOutInfo1.OpenByHospID(FHospID);
  FOutInfo2.OpenByHospID(FHospID);
  FOutInfo3.OpenByHospID(FHospID);
end;

{ TOperationXNHHospOutReg }

procedure TOperationXNHHospOutReg.AfterConstruction;
begin
  inherited;
  BuildAction('取消农合出院登记', '', nil, DoActionCancelOutReg, 0);
end;

procedure TOperationXNHHospOutReg.DoActionCancelOutReg(Sender: TObject);
var
  HospInOutView: TTableGridDataView;
  HospID: string;
begin
  HospInOutView := TTableGridDataView(CustomAttributes.Objects[CustomAttributes.IndexOf(sOperationIDHospPatientInOut)]);
  if (HospInOutView <> nil) and not HospInOutView.ViewData.Eof
    and (HospInOutView.ViewData.AsInteger[sFieldPatientTypeID] = iHospPatientType_XNH)
    and ShowYesNo('确定取消新农合出院登记吗?') then
  begin
    HospID := HospInOutView.ViewData.AsString[sFieldHospID];
    XNHCore.OutHosp_Cancel(HospID);

    AppCore.Logger.Write('新农合出院登记取消完成|' + HospID, mtInfo, 1);
  end;

end;

{ TxdOutHosp }

constructor TxdOutHosp.Create(AOwner: TComponent);
begin
  inherited Create(AOwner, HisConnection, sDataServiceXNH, 'XNH_OutHosp');
  EnableBatchUpdate;
end;

procedure TxdOutHosp.OpenByHospID(HospID: string);
begin
  OpenByFieldValue('HospID', HospID);
end;

{ TXNHHospFee }

procedure TXNHHospFee.BuildDialog;
var
  TempGroup: TdxLayoutGroup;
begin
  inherited;

  FFeeList := TStringList.Create;

  FOutInfo1 := TxdOutHospInfo1.Create(Self);
  FOutInfo1.EnableBatchUpdate;

  OpenByHospID;

  ImageName := 'misc\HospXNH.png';
  Caption := '新农合住院结算';
  Width := 1200;
  ViewLayout.FindItem(OKButton).Visible := False;
  CancelButton.Caption := '关闭(&C)';

  FBalanceAction := BuildAction('读取结算信息', '', '', nil, DoBalanceAction, 0,
    BTN_NOTFLAT or BTN_CANBEFOCUSED or BTN_SHOWCAPTION);
  FPrintAction := BuildAction('准备收费', '', '', DoPrintUpdate, DoPrintAction, 0,
    BTN_NOTFLAT or BTN_CANBEFOCUSED or BTN_SHOWCAPTION);

  BuildLayoutToolBar(ButtonGroup, [FBalanceAction, FPrintAction]);

  DevExpress.BuildFormView(DialogGroup, FOutInfo1);
end;

destructor TXNHHospFee.Destroy;
begin
  FFeeList.Free;
  inherited;
end;

procedure TXNHHospFee.DoBalanceAction(Sender: TObject);
begin
  OpenByHospID();
  FBalanced := True;
end;

procedure TXNHHospFee.DoPrintAction(Sender: TObject);
var
  Msg: string;
begin
  XNHService.DACommand.Execute('Pro_XNH_HospFee_Before',
    ['Msg', sFieldOfficeID, sFieldOpID, sFieldHospID],
    ['', HisUser.OfficeID, HisUser.ID, FHospID]);

  Msg := XNHService.GetCommandOutputParam('Msg');
  if Msg <> '' then
  begin
    ShowWarning(Msg);
    AppCore.Logger.WriteFmt('新农合提示(%s)：%s', [FHospID, Msg], mtInfo, 0);
  end;

  FXNHMoney := FOutInfo1.AsFloat['Holder18']
    + FOutInfo1.AsFloat['Holder21']
    + FOutInfo1.AsFloat['Price'];
    
  if FHospFeeDialog.StartFee(iHospFeeType_XNH, 0, FXNHMoney, PrintCallBack) then
    ModalResult := mrOk;
end;

procedure TXNHHospFee.DoPrintUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := FBalanced;
end;

function TXNHHospFee.Execute(HospFeeDialog: TcvHospFeeDialog): Boolean;
begin
  FHospFeeDialog := HospFeeDialog;
  FHospID := FHospFeeDialog.PatientView.PatientData.HospID;
  FBalanced := False;

  XNHService.DACommand.Execute('Pro_XNH_HospFee_Prepare',
    [sFieldHospID, sFieldOpID],
    [FHospID, HisUser.ID]);
    
  OpenByHospID();

  XNHCore.XNHInHosp.OpenByHospID(FHospID);
  
  Result := inherited Execute();
end;

procedure TXNHHospFee.OpenByHospID;
begin  
  FOutInfo1.OpenByHospID(FHospID);
end;

procedure TXNHHospFee.PrintCallback(Sender: TcvHospFeeDialog);
begin
  with Sender do
  begin
    XNHID := 0;
  end;
end;

{ TxdOutHospInfo1 }

constructor TxdOutHospInfo1.Create(AOwner: TComponent);
begin
  inherited Create(AOwner, HisConnection, sDataServiceXNH, 'XNH_OutHospInfo1');
end;

procedure TxdOutHospInfo1.OpenByHospID(HospID: string);
begin
  OpenByFieldValue('HospID', HospID);
end;

{ TxdOutHospInfo2 }

constructor TxdOutHospInfo2.Create(AOwner: TComponent);
begin
  inherited Create(AOwner, HisConnection, sDataServiceXNH, 'XNH_OutHospInfo2');
end;

procedure TxdOutHospInfo2.DoDataBeforePost(Sender: TDADataTable);
begin
  inherited;
  AsString['HospID'] := FHospID;
end;

procedure TxdOutHospInfo2.OpenByHospID(HospID: string);
begin
  FHospID := HospID;
  OpenByFieldValue('HospID', HospID);
end;

{ TxdOutHospInfo3 }

constructor TxdOutHospInfo3.Create(AOwner: TComponent);
begin
  inherited Create(AOwner, HisConnection, sDataServiceXNH, 'XNH_OutHospInfo3');
end;

procedure TxdOutHospInfo3.DoDataBeforePost(Sender: TDADataTable);
begin
  inherited;
  AsString['HospID'] := FHospID;
end;

procedure TxdOutHospInfo3.OpenByHospID(HospID: string);
begin
  FHospID := HospID;
  OpenByFieldValue('HospID', HospID);
end;

{ TXNHInOutInfo }

procedure TXNHInOutInfo.BuildViewAction;
begin
  inherited;
  BuildAction('手动回写', '', '', nil, DoActionWriteBack, 0, BTN_SHOWCAPTION);
end;

procedure TXNHInOutInfo.BuildViewLayout;
begin
  inherited;       
  PeriodGroup.Visible := True;
  SetData(TCustomData.Create(Self, HisConnection, sDataServiceXNH, 'XNH_InOutInfo'));
end;

procedure TXNHInOutInfo.DataQuery;
begin
  ViewData.OpenByList(['AInDate', 'AInDate'],
    [BeginDate, EndDate + 1],
    [dboGreaterOrEqual, dboLess], [dboAnd]);
end;

procedure TXNHInOutInfo.DoActionWriteBack(Sender: TObject);
begin
  if not ViewData.Eof then
    XNHCore.OutHosp_WriteBack(nil, ViewData.AsString[sFieldHospID]);
end;

initialization
  XNHCore := TXNHCore.Create(nil);
  RegisterHospFeeProc(iHospPatientType_XNH, XNHHospFeeProc);

finalization
  FreeAndNil(XNHCore);

end.
