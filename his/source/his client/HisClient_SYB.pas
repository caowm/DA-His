unit HisClient_SYB;

{
  省医保模块

  Written by caowm (remobjects@qq.com)
  2014年10月
}

interface

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
  ComObj,
  DateUtils,
  uDACore,
  uDAFields,
  uDAWhere,
  uDADataTable,
  uDAInterfaces,
  uROClasses,
  uROXMLIntf,
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
  sJYBH_GetPatient = '01';
  sJYBH_RegisterIn = '02';
  sJYBH_CancelIn = '09';
  sJYBH_UploadSingleFee = '03';
  sJYBH_UploadMultiFee = '12';
  sJYBH_CancelUpload = '10';
  sJYBH_RegisterOut = '04';
  sJYBH_CancelOut = '05';
  sJYBH_BalanceSimulate = '06';
  sJYBH_BalanceFee = '07';
  sJYBH_CancelBalance = '11';

type

  TSYBService = class(TCustomDataService)
  private
  public
  end;

  TSYBData = class(TCustomData)
  public
    procedure Prepare(Doc: IXMLDocument); overload; virtual;
  end;

  TSYBPatientData = class(TSYBData)
  public
    procedure Prepare(Doc: IXMLDocument); override;
  end;

  TSYBBalanceData = class(TSYBData)
  public
    constructor Create(AOwner: TComponent); reintroduce;
    procedure OpenForBalance(HospID: string);
    procedure OpenBalanced(HospID: string);
  end;

  TSYBManager = class(TComponent)
  private
    FAreaCode: string;
    FCityCode: string;
    FHospCode: string;
    FHospName: string;
    FInitialized: Boolean;
    FYHObj: Variant;

    FHospID: string;
    FJYBH: string;
    FJYLSH: string;
    FJYYZM: string;
    FAppCode: Integer;
    FAppMsg: string;

    FPatient_Input: TSYBData;
    FPatient_Output: TSYBData;
  protected
    procedure Init();
    procedure CheckAppCode();
    function InDataToXml(InParam, InData: TSYBData): string;
    procedure XmlToOutData(Xml: string; OutData: TSYBData;
      RecordNodeName: string = '');
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy(); override;

    procedure Call(const HospID, JYBH: string;
      InParam, InData, OutData: TSYBData);
    procedure Confirm();
    procedure Cancel();
    procedure GetUncertaintyTrade(JYBH: string; OutData: TSYBData);
    function GetPatient(HospID, yab003, aac002, akc020: string): TSYBData;

    property HospID: string read FHospID;
    property JYBH: string read FJYBH;
    property JYLSH: string read FJYLSH write FJYLSH;
    property JYYZM: string read FJYYZM write FJYYZM;
    property AppCode: Integer read FAppCode;
    property AppMsg: string read FAppMsg;

    property PatientData: TSYBData read FPatient_Output;
  end;

  TSYBHospRegDialog = class(TBaseDialog)
  private
    FPatientData: TCustomData;
    FPatientType: Integer;
    FHospID: string;
    FRegInput: TSYBData;
    FRegOutput: TSYBData;
    procedure DoSYBFakeAction(Sender: TObject);
  protected
    procedure BuildDialog(); override;
    function DoExecute(CommandID: Integer; const Param: array of Variant)
      : Variant; override;
    procedure DoDialogOK(Sender: TObject); override;
  public
  end;

  TOperationSYBHospReg = class(TViewOperation)
  private
    procedure DoActionCancelReg(Sender: TObject);
  public
    procedure AfterConstruction(); override;
  end;

  TSYBHospUploadView = class(TTableGridDataView)
  private
    FHospID: string;
    FInputParam: TSYBData;
    FInputData: TSYBData;
    FDetailList: TStrings;
    procedure DoActionWholeUpload(Sender: TObject);
    procedure DoActionWholeUploadUpdate(Sender: TObject);
    procedure DoActionSingleUpload(Sender: TObject);
    procedure DoBuildDetailList(ADataTable: TDADataTable; AParam: Variant);
  protected
    procedure BuildViewLayout(); override;
    procedure BuildViewAction(); override;
    function DoExecute(CommandID: Integer; const Param: array of Variant)
      : Variant; override;
  public
    destructor Destroy(); override;
    procedure DataQuery(); override;
  end;

  TOperationSYBHospUpload = class(TViewOperation)
  private
    procedure DoActionCancel(Sender: TObject);
  public
    procedure AfterConstruction(); override;
  end;

  TSYBHospRegOutDialog = class(TBaseDialog)
  private
    FHospID: string;
    FRegOutInput: TSYBData;
    FBalanceInput: TSYBData;
    FBalanceOutput: TSYBBalanceData;
    procedure OpenByHospID();
  protected
    procedure BuildDialog(); override;
    function DoExecute(CommandID: Integer; const Param: array of Variant)
      : Variant; override;
    procedure DoDialogOK(Sender: TObject); override;
  public
  end;

  TOperationSYBHospRegOut = class(TViewOperation)
  private
    procedure DoActionCancelRegOut(Sender: TObject);
  public
    procedure AfterConstruction(); override;
  end;

  { 出院结算 }
  TSYBHospFeeDialog = class(TBaseDialog)
  private
    FHospFeeDialog: TcvHospFeeDialog;
    FHospID: string;
    FBalanceData: TSYBBalanceData;
    FPrintAction: TAction;
    FSYBMoney: Currency;
    procedure OpenByHospID();
    procedure DoPrintAction(Sender: TObject);
    procedure DoPrintUpdate(Sender: TObject);
    procedure PrintCallback(Sender: TcvHospFeeDialog);
  protected
    procedure BuildDialog(); override;
  public
    function Execute(HospFeeDialog: TcvHospFeeDialog): Boolean;
  end;

  TSYBUncertainTradeView = class(TTableGridDataView)
  private
    procedure DoActionCancel(Sender: TObject);
    procedure DoActionCancelUpdate(Sender: TObject);
  protected
    procedure BuildViewLayout(); override;
    procedure BuildViewAction(); override;
  public
    procedure DataQuery(); override;
  end;

  TSYBHospBalanceView = class(TTableGridDataView)
  private
    FInvoiceEdit: TcxMaskEdit;
    procedure DoDoubleClick(Sender: TObject);
    procedure DoInvoiceIDEvent(Sender: TObject);
  protected
    procedure BuildViewLayout(); override;
  public
    procedure DataQuery(); override;
  end;

function SYBMgr: TSYBManager;
procedure DefineSYBCommonData(ADataContainer: TDataContainer);
procedure OrganizeSYBOperations();

var
  SYBService: TSYBService;

implementation

var
  SYBMgr__: TSYBManager;
  SYBHospFeeDialog: TSYBHospFeeDialog;

function SYBMgr: TSYBManager;
begin
  if SYBMgr__ = nil then
    SYBMgr__ := TSYBManager.Create(nil);
  Result := SYBMgr__;
end;

function SYBHospFeeProc(Sender: TcvHospFeeDialog): Boolean;
begin
  if SYBHospFeeDialog = nil then
    SYBHospFeeDialog := TSYBHospFeeDialog.Create(Application);
  Result := SYBHospFeeDialog.Execute(Sender);
end;

procedure DefineSYBCommonData(ADataContainer: TDataContainer);
begin
  with ADataContainer do
  begin
    RegisterData(HisConnection, sDataServiceSYB, 'aab019', THisData, 0, '');
    RegisterData(HisConnection, sDataServiceSYB, 'aab020', THisData, 0, '');
    RegisterData(HisConnection, sDataServiceSYB, 'aab021', THisData, 0, '');
    RegisterData(HisConnection, sDataServiceSYB, 'aac004', THisData, 0, '');
    RegisterData(HisConnection, sDataServiceSYB, 'aac020', THisData, 0, '');
    RegisterData(HisConnection, sDataServiceSYB, 'aac031', THisData, 0, '');
    RegisterData(HisConnection, sDataServiceSYB, 'aka065', THisData, 0, '');
    RegisterData(HisConnection, sDataServiceSYB, 'aka111', THisData, 0, '');
    RegisterData(HisConnection, sDataServiceSYB, 'aka130', THisData, 0, '');
    RegisterData(HisConnection, sDataServiceSYB, 'akc021', THisData, 0, '');
    RegisterData(HisConnection, sDataServiceSYB, 'akc195', THisData, 0, '');
    RegisterData(HisConnection, sDataServiceSYB, 'akc300', THisData, 0, '');
    RegisterData(HisConnection, sDataServiceSYB, 'yab300', THisData, 0, '');
    RegisterData(HisConnection, sDataServiceSYB, 'yab600', THisData, 0, '');
    RegisterData(HisConnection, sDataServiceSYB, 'ykc023', THisData, 0, '');
    RegisterData(HisConnection, sDataServiceSYB, 'ykc668', THisData, 0, '');
    RegisterData(HisConnection, sDataServiceSYB, 'ykc673', THisData, 0, '');
    RegisterData(HisConnection, sDataServiceSYB, 'ykc675', THisData, 0, '');
    RegisterData(HisConnection, sDataServiceSYB, 'ykc681', THisData, 0, '');
    RegisterData(HisConnection, sDataServiceSYB, 'ykc687', THisData, 0, '');
    RegisterData(HisConnection, sDataServiceSYB, 'ykc688', THisData, 0, '');
    RegisterData(HisConnection, sDataServiceSYB, 'ykc702', THisData, 0, '');
    RegisterData(HisConnection, sDataServiceSYB, 'syb_icd10', THisData, 0, '');
  end;
end;

procedure yh_interface_test();
var
  yhobj: Variant;
  Xml: string;
  AppCode: Integer;
  AppMsg: string;
begin
  yhobj := CreateOleObject('yinhai.yhhbydyl.interface');
  Xml := LeftStr(' ', 0);
  yhobj.yh_interface_init(Xml, AppCode, AppMsg);
  Check(AppCode < 0, AppMsg);
  yhobj := unassigned;

  AppCore.Logger.Write('省医保接口测试成功', mtInfo, 1);
end;

function Operation_SYB_Test(Sender: TBaseOperation; AID: Integer;
  const AParam: array of Variant): Variant;
begin
  yh_interface_test();
end;

procedure OrganizeSYBOperations();
begin
  with TProcOperation.Create('yh_interface_init') do
  begin
    Category := sOperationCategoryHelp;
    Caption := '省医保接口测试';
    Order := 'z05';
    Flag := iOperationFlag_NoTree;
    OnExecute := Operation_SYB_Test;
  end;

  with TOperationSYBHospReg.Create(sOperationIDSYBHospReg) do
  begin
    Category := sOperationCategorySYB;
    Caption := '省医保登记';
    ImageName := sOperationIDSYBHospReg;
    Order := 'y25';
    Flag := iOperationFlag_HospInOut or iOperationFlag_NoMenu or
      iOperationFlag_NoTree;
    ViewClass := TSYBHospRegDialog;
    CustomAttributes.Add('PluginCategory=SYB');
  end;

  with TOperationSYBHospUpload.Create(sOperationIDSYBHospUpload) do
  begin
    Category := sOperationCategorySYB;
    Caption := '省医保上传';
    ImageName := 'upload';
    Order := 'y26';
    Flag := iOperationFlag_HospInOut or iOperationFlag_NoMenu or
      iOperationFlag_NoTree;
    ViewClass := TSYBHospUploadView;
    CustomAttributes.Add('PluginCategory=SYB');
  end;

  with TOperationSYBHospRegOut.Create(sOperationIDSYBHospRegOut) do
  begin
    Category := sOperationCategorySYB;
    Caption := '省医保出院登记';
    ImageName := sOperationIDSYBHospRegOut;
    Order := 'y27';
    Flag := iOperationFlag_HospInOut or iOperationFlag_NoMenu or
      iOperationFlag_NoTree;
    ViewClass := TSYBHospRegOutDialog;
    CustomAttributes.Add('PluginCategory=SYB');
  end;

  // with TViewOperation.Create(sOperationIDSYBHospUncertainTrade) do
  // begin
  // Category := sOperationCategoryYB;
  // Caption := '省医保不确定交易';
  // ImageName := sOperationIDSYBHospUncertainTrade;
  // Order := 'y28';
  // Access := sAccessSysMaintain;
  // //Flag := iOperationFlag_HospInOut;
  // ViewClass := TSYBUncertainTradeView;
  // end;

  with TViewOperation.Create(sOperationIDSYBHospBalanceQuery) do
  begin
    Category := sOperationCategoryYB;
    Caption := '省医保住院结算查询';
    ImageName := sOperationIDSYBHospBalanceQuery;
    Access := sAccessYBQuery;
    Order := 'Q08';
    ViewClass := TSYBHospBalanceView;
  end;

end;

{ TSYBPatientData }

procedure TSYBPatientData.Prepare(Doc: IXMLDocument);
begin
  OpenByFieldValue('akc020', Doc.DocumentNode.GetNodeValue('akc020', ''));
end;

{ TSYBManager }

procedure TSYBManager.Call(const HospID, JYBH: string;
  InParam, InData, OutData: TSYBData);
var
  in_xml, out_xml: string;
begin
  FHospID := HospID;
  FJYBH := JYBH;
  FJYLSH := '';
  FJYYZM := '';
  FAppCode := 0;
  FAppMsg := '';
  in_xml := InDataToXml(InParam, InData);
  AppCore.Logger.WriteFmt('省医保调用开始|住院号=%s|交易编号=%s|输入=%s',
    [FHospID, JYBH, in_xml], mtInfo, 0);
  FYHObj.yh_interface_call(JYBH, in_xml, FJYLSH, FJYYZM, out_xml,
    FAppCode, FAppMsg);
  CheckAppCode();
  AppCore.Logger.WriteFmt('省医保调用结束|住院号=%s|交易编号=%s|交易流水号=%s|交易验证码=%s|输出=%s',
    [FHospID, JYBH, FJYLSH, FJYYZM, out_xml], mtInfo, 0);
  XmlToOutData(out_xml, OutData);
end;

procedure TSYBManager.Cancel;
begin
  if FJYLSH <> '' then
    FYHObj.yh_interface_cancel(FJYLSH, FAppCode, FAppMsg);
end;

procedure TSYBManager.CheckAppCode;
begin
  Check(FAppCode < 0, '省医保调用出错(交易编号=%s 交易返回值=%d): %s',
    [FJYBH, FAppCode, FAppMsg]);
end;

procedure TSYBManager.Confirm;
begin
  if FJYLSH <> '' then
    FYHObj.yh_interface_confirm(FJYLSH, FJYYZM, FAppCode, FAppMsg);
end;

constructor TSYBManager.Create(AOwner: TComponent);
begin
  inherited;
  Init;
end;

destructor TSYBManager.Destroy;
begin
  if FInitialized then
  begin
    FYHObj := unassigned;
  end;
  inherited;
end;

function TSYBManager.GetPatient(HospID, yab003, aac002, akc020: string)
  : TSYBData;
begin
  if FPatient_Output = nil then
  begin
    FPatient_Output := TSYBPatientData.Create(Self, HisConnection,
      sDataServiceSYB, 'syb_patient_output');
    // FPatient_Output.MaxRecords := 0;
    FPatient_Output.EnableBatchUpdate;
    FPatient_Input := TSYBData.Create(Self, HisConnection, sDataServiceSYB,
      'syb_patient_input');
    FPatient_Input.EnableBatchUpdate;
  end;
  FPatient_Input.OpenByParam([sFieldHospID], [HospID]);
  if (aac002 <> '') and (akc020 <> '') then
    akc020 := '';
  FPatient_Input.EditWithNoLogChanges(['yab003', 'aac002', 'akc020'],
    [yab003, aac002, akc020]);
  // FPatient_Output.Refresh;

  Call(HospID, sJYBH_GetPatient, FPatient_Input, nil, FPatient_Output);

  FPatient_Output.ApplyUpdates;
  Result := FPatient_Output;
end;

procedure TSYBManager.GetUncertaintyTrade(JYBH: string; OutData: TSYBData);
var
  out_xml: string;
begin
  FJYBH := JYBH;
  FYHObj.yh_interface_getuncertaintytrade(FJYBH, out_xml, FAppCode, FAppMsg);
  AppCore.Logger.WriteFmt('省医保不确定交易|%s', [out_xml], mtInfo, 0);
  XmlToOutData(out_xml, OutData, 'row');
end;

function TSYBManager.InDataToXml(InParam, InData: TSYBData): string;
var
  I: Integer;
  XmlList: TStrings;
begin
  XmlList := TStringList.Create;
  try
    XmlList.Add('<?xml version="1.0" encoding="GBK" standalone="yes"?>');
    XmlList.Add('<input>');

    if not InParam.Eof then
      for I := 0 to InParam.Table.FieldCount - 1 do
      begin
        with InParam.Table.Fields[I] do
          if not SameText(Name, 'RecID') and
            StrToBoolDef(CustomAttributes.Values['SYBFlag'], True) then
          begin
            XmlList.Add('  <' + Name + '>' + StrToXML(AsString) + '</' +
              Name + '>');
          end;
      end;

    if (InData <> nil) and (InData.RecordCount > 0) then
    begin
      XmlList.Add('  <data>');

      InData.First;
      while not InData.Eof do
      begin
        XmlList.Add('    <row>');
        for I := 0 to InData.Table.FieldCount - 1 do
        begin
          with InData.Table.Fields[I] do
            if not SameText(Name, 'RecID') and
              StrToBoolDef(CustomAttributes.Values['SYBFlag'], True) then
            begin
              XmlList.Add('      <' + Name + '>' + StrToXML(AsString) + '</' +
                Name + '>');
            end;
        end;
        XmlList.Add('    </row>');
        InData.Next;
      end;

      XmlList.Add('  </data>');
    end;

    XmlList.Add('</input>');
    Result := XmlList.Text;
  finally
    XmlList.Free;
  end;
end;

procedure TSYBManager.Init;
begin
  if FYHObj = unassigned then
    FYHObj := CreateOleObject('yinhai.yhhbydyl.interface');

  if not FInitialized then
  begin
    FYHObj.yh_interface_init(' ', FAppCode, FAppMsg);
    CheckAppCode;

    FAreaCode := SystemService.GetParam('SYB.AreaCode', '000000');
    FCityCode := SystemService.GetParam('SYB.CityCode', '000000');
    FHospCode := SystemService.GetParam('SYB.HospCode', '000000');
    FHospName := SystemService.GetParam('SYB.HospName', 'XXXXXX');

    FInitialized := True;
    AppCore.Logger.Write('省医保初始化成功', mtInfo, 0);
  end;

end;

procedure TSYBManager.XmlToOutData(Xml: string; OutData: TSYBData;
  RecordNodeName: string);
var
  Doc: IXMLDocument;
  R: Integer;
  NodeList: IXMLNodeList;
  NodeValue: Variant;

  procedure ReadOneRecord(Node: IXMLNode; AppendRecord: Boolean = False);
  var
    I: Integer;
  begin
    if AppendRecord then
      OutData.Insert
    else if not OutData.Table.Editing then
      if OutData.Eof then
        OutData.Insert
      else
        OutData.Edit;

    for I := 0 to OutData.Table.FieldCount - 1 do
      with OutData.Table.Fields[I] do
      begin
        if not SameText(Name, 'RecID') and
          StrToBoolDef(CustomAttributes.Values['SYBFlag'], True) then
        begin
          NodeValue := Node.GetNodeValue(Name, '');
          if NodeValue <> '' then
          begin
            if DataType in [datFloat, datCurrency, datDecimal, datSingleFloat]
            then
              AsFloat := StrToFloatDef(NodeValue, 0)
            else
              AsString := NodeValue;
          end;
        end;
      end;

    OutData.Save;
  end;

begin
  if (Xml = '') or (OutData = nil) then
    Exit;

  Doc := NewROXmlDocument;
  Doc.New();
  Doc.Xml := Xml;

  OutData.Prepare(Doc);

  if RecordNodeName <> '' then
  begin
    NodeList := Doc.DocumentNode.GetNodesByName(RecordNodeName);
    for R := 0 to NodeList.Count - 1 do
      ReadOneRecord(NodeList[R], True);
  end
  else
    ReadOneRecord(Doc.DocumentNode);
end;

{ TSYBData }

procedure TSYBData.Prepare(Doc: IXMLDocument);
begin
  // do nothing;
end;

{ TSYBHospRegDialog }

procedure TSYBHospRegDialog.BuildDialog;
begin
  inherited;

  BuildAction('登记为省准医保', '', '', nil, DoSYBFakeAction, 0, 0);
  BuildLayoutToolBar(BottomGroup, Actions);

  FRegInput := TSYBData.Create(Self, HisConnection, sDataServiceSYB,
    'syb_regin_input');
  FRegInput.EnableBatchUpdate;
  FRegInput.OpenByFieldValue(sFieldHospID, '');

  FRegOutput := TSYBData.Create(Self, HisConnection, sDataServiceSYB,
    'syb_regin_output');
  FRegOutput.EnableBatchUpdate;
  FRegOutput.OpenByFieldValue(sFieldHospID, '');

  ImageName := FRegInput.CustomAttributes.Values['FormImageName'];
  DevExpress.BuildFormView(DialogGroup, FRegInput);
  DialogGroup.CreateItem(TdxLayoutSplitterItem);
  DevExpress.BuildFormView(DialogGroup, FRegOutput);
end;

procedure TSYBHospRegDialog.DoDialogOK(Sender: TObject);
begin
  if ShowYesNo('省医保：确定提交登记信息吗?') then
  begin
    SYBService.DACommand.Execute('Pro_SYB_Reg_Before',
      [sFieldHospID, sFieldOpID, 'akc020', 'aac001', 'aac002'],
      [FHospID, HisUser.ID, FRegInput.AsString['akc020'],
      FRegInput.AsString['aac001'], FRegInput.AsString['aac002']]);

    // if (FRegInput.AsString['akc020'] = '')
    // or (FRegInput.AsString['aac001'] = '') then
    with SYBMgr.GetPatient(FHospID, FRegInput.AsString['yab003'],
      FRegInput.AsString['aac002'], FRegInput.AsString['akc020']) do
    begin
      FRegInput.AsString['akc020'] := AsString['akc020'];
      FRegInput.AsString['aac002'] := AsString['aac002'];
      FRegInput.AsString['aac001'] := AsString['aac001'];
    end;

    SYBMgr.Call(FHospID, sJYBH_RegisterIn, FRegInput, nil, FRegOutput);

    if FPatientType = iHospPatientType_Normal then
    begin
      FRegInput.AsString['akc190'] := FRegOutput.AsString['akc190'];
    end;

    FRegInput.ApplyUpdates;
    FRegOutput.ApplyUpdates;

    FPatientData.EditWithNoLogChanges([sFieldPatientTypeID],
      [iHospPatientType_SYB]);

    ShowOK('省医保登记成功');
    ModalResult := mrOk;
  end;

end;

function TSYBHospRegDialog.DoExecute(CommandID: Integer;
  const Param: array of Variant): Variant;
begin
  Result := inherited DoExecute(CommandID, Param);

  if CommandID = iOperationCommand_Notify then
  begin
    try
      FPatientData := TCustomDataView(Integer(Param[0])).ViewData;
      // 赋值
      with FPatientData do
      begin
        if Eof then
          Exit;

        FPatientType := AsInteger[sFieldPatientTypeID];
        FHospID := AsString[sFieldHospID];

        SYBService.DACommand.Execute('Pro_SYB_Reg_Prepare',
          [sFieldHospID, sFieldOpID], [FHospID, HisUser.ID]);

        FRegInput.OpenByFieldValue(sFieldHospID, FHospID);
        FRegOutput.OpenByFieldValue(sFieldHospID, FHospID);

        FRegInput.Edit;

        Self.ShowModal;
      end;
    finally
    end;
  end;
end;

procedure TSYBHospRegDialog.DoSYBFakeAction(Sender: TObject);
begin
  if ShowYesNo('确定登记为省准医保病人吗?') then
  begin
    FRegInput.Edit;
    FRegInput.AsString['aae011'] := HisUser.ID;
    FRegInput.AsString['aae037'] :=
      FormatDateTime('YYYY-MM-DD hh:mm:ss', Now());
    FRegInput.AsString['aae013'] := FRegInput.AsString['aae013'] + ' ';
    FRegInput.ApplyUpdates;

    FPatientData.EditWithNoLogChanges([sFieldPatientTypeID],
      [iHospPatientType_SYB_Fake]);

    ModalResult := mrOk;
  end;
end;

{ TOperationSYBHospReg }

procedure TOperationSYBHospReg.AfterConstruction;
begin
  inherited;
  BuildAction('取消省医保登记', '', nil, DoActionCancelReg, 0);
end;

procedure TOperationSYBHospReg.DoActionCancelReg(Sender: TObject);
var
  HospInOutView: TTableGridDataView;
  HospID: string;
  PatientTypeID: Integer;
  CancelInput: TSYBData;
  akc190: string;
  procedure DoCancel();
  begin
    SYBService.DACommand.Execute('Pro_SYB_RegCancel_After',
      [sFieldHospID, sFieldOpID, 'akc190'], [HospID, HisUser.ID, akc190]);
  end;

begin
  HospInOutView := TTableGridDataView(CustomAttributes.Objects
    [CustomAttributes.IndexOf(sOperationIDHospPatientInOut)]);
  if (HospInOutView <> nil) and not HospInOutView.ViewData.Eof and
    ShowYesNo('省医保：确定取消登记吗?') then
  begin
    HospID := HospInOutView.ViewData.AsString[sFieldHospID];

    CancelInput := TSYBData.Create(nil, HisConnection, sDataServiceSYB,
      'syb_reg_cancel');
    try
      SYBService.DACommand.Execute('Pro_SYB_RegCancel_Before',
        [sFieldHospID, sFieldOpID], [HospID, HisUser.ID]);

      CancelInput.OpenByParam([sFieldHospID], [HospID]);
      akc190 := CancelInput.AsString['akc190'];

      if akc190 <> '' then
      begin
        SYBMgr.Call(HospID, sJYBH_CancelIn, CancelInput, nil, nil);
        try
          DoCancel;
        except
          SYBMgr.Cancel;
          raise;
        end;
        SYBMgr.Confirm;
      end
      else
        DoCancel;

    finally
      CancelInput.Free;
    end;

    AppCore.Logger.Write('省医保取消登记成功|' + HospID, mtInfo, 1);

    HospInOutView.ViewData.EditWithNoLogChanges([sFieldPatientTypeID],
      [iHospPatientType_Normal]);
  end;
end;

{ TSYBHospUploadView }

procedure TSYBHospUploadView.BuildViewAction;
begin
  inherited;
  // BuildAction('开始上传', 'upload', '', DoActionWholeUploadUpdate, DoActionWholeUpload, 0, BTN_SHOWCAPTION);
  BuildAction('逐个上传', 'upload', '', DoActionWholeUploadUpdate,
    DoActionSingleUpload, 0, BTN_SHOWCAPTION);
end;

procedure TSYBHospUploadView.BuildViewLayout;
begin
  inherited;

  ToolBarGroup.ShowBorder := True;
  FDetailList := TStringList.Create;

  FInputParam := TSYBData.Create(Self, HisConnection, sDataServiceSYB,
    'syb_upload_input');
  FInputData := TSYBData.Create(Self, HisConnection, sDataServiceSYB,
    'syb_upload_getdata');
  FInputData.EnableBatchUpdate;
  ViewData := FInputData;
end;

procedure TSYBHospUploadView.DataQuery;
begin
  FInputData.OpenByParam([sFieldHospID, sFieldOpID], [FHospID, HisUser.ID]);
end;

destructor TSYBHospUploadView.Destroy;
begin
  FDetailList.Free;
  inherited;
end;

procedure TSYBHospUploadView.DoActionSingleUpload(Sender: TObject);
begin
  // 逐条上传费用
  FInputData.First;
  if not FInputData.Eof then
    AppCore.Logger.WriteFmt('正在上传省医保费用明细(%s)...', [FHospID], mtInfo, 0);
  while not FInputData.Eof do
  begin
    if FInputData.AsBoolean['UploadSign'] then
    begin
      SYBMgr.Call(FHospID, sJYBH_UploadSingleFee, FInputData, nil, nil);

      SYBService.DACommand.Execute('Pro_SYB_Upload_UpdateSingle',
        ['HospID', 'DetailID', sFieldOpID],
        [FHospID, ViewData.AsInteger['ykc610'], HisUser.ID]);
    end;
    FInputData.Next;
  end;

  DataQuery;
end;

procedure TSYBHospUploadView.DoActionWholeUpload(Sender: TObject);
begin
  AppCore.Logger.WriteFmt('正在上传省医保费用明细(%s)...', [FHospID], mtInfo, 0);
  FInputParam.OpenByParam([sFieldHospID], [FHospID]);
  SYBMgr.Call(FHospID, sJYBH_UploadMultiFee, FInputParam, FInputData, nil);

  AppCore.Logger.WriteFmt('正在更新省医保上传标志(%s)...', [FHospID], mtInfo, 0);
  FDetailList.Clear;
  FDetailList.Add('<root>');
  EnumDataTable(FInputData.Table, DoBuildDetailList, 0);
  FDetailList.Add('</root>');

  SYBService.DACommand.Execute('Pro_SYB_Upload_UpdateWhole',
    ['HospID', 'DetailIDList', sFieldOpID], [FHospID, FDetailList.Text,
    HisUser.ID]);

  AppCore.Logger.Write('省医保上传完成|' + FHospID, mtInfo, 1);

  DataQuery;
end;

procedure TSYBHospUploadView.DoActionWholeUploadUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := FInputData.Table.Active and
    (FInputData.RecordCount > 0);
end;

procedure TSYBHospUploadView.DoBuildDetailList(ADataTable: TDADataTable;
  AParam: Variant);
begin
  if FInputData.AsBoolean['UploadSign'] then
  begin
    FDetailList.Add('<id>' + FInputData.AsString['ykc610'] + '</id>');
  end;
end;

function TSYBHospUploadView.DoExecute(CommandID: Integer;
  const Param: array of Variant): Variant;
begin
  Result := inherited DoExecute(CommandID, Param);

  if CommandID = iOperationCommand_Notify then
  begin
    with TCustomDataView(Integer(Param[0])).ViewData do
    begin
      if Eof then
        Exit;

      Check(AsInteger[sFieldPatientTypeID] <> iHospPatientType_SYB, '非省医保病人.');

      ToolBarGroup.Caption :=
        GetRecordText(CustomAttributes.Values['PatientInfoFields'], '  ');

      FHospID := AsString[sFieldHospID];
      DataQuery();

      AppCore.MainView.ShowView(Self);
    end;
  end;
end;

{ TOperationSYBHospUpload }

procedure TOperationSYBHospUpload.AfterConstruction;
begin
  inherited;
  BuildAction('取消省医保上传', '', nil, DoActionCancel, 0);
end;

procedure TOperationSYBHospUpload.DoActionCancel(Sender: TObject);
var
  HospInOutView: TTableGridDataView;
  HospID: string;
  PatientTypeID: Integer;
  CancelInput: TSYBData;
begin
  HospInOutView := TTableGridDataView(CustomAttributes.Objects
    [CustomAttributes.IndexOf(sOperationIDHospPatientInOut)]);
  if (HospInOutView <> nil) and not HospInOutView.ViewData.Eof and
    ShowYesNo('省医保：确定取消项目上传吗?') then
  begin
    HospID := HospInOutView.ViewData.AsString[sFieldHospID];

    CancelInput := TSYBData.Create(nil, HisConnection, sDataServiceSYB,
      'syb_upload_cancel');
    try
      CancelInput.OpenByParam([sFieldHospID], [HospID]);

      SYBMgr.Call(HospID, sJYBH_CancelUpload, CancelInput, nil, nil);
      try
        SYBService.DACommand.Execute('Pro_SYB_Upload_Cancel',
          [sFieldHospID, sFieldOpID], [HospID, HisUser.ID]);
      except
        SYBMgr.Cancel;
        raise;
      end;
      SYBMgr.Confirm;

    finally
      CancelInput.Free;
    end;

    AppCore.Logger.Write('取消省医保项目上传成功|' + HospID, mtInfo, 1);
  end;
end;

{ TSYBBalanceData }

constructor TSYBBalanceData.Create(AOwner: TComponent);
begin
  inherited Create(AOwner, HisConnection, sDataServiceSYB, 'syb_balance');
end;

procedure TSYBBalanceData.OpenBalanced(HospID: string);
begin
  OpenByList(['HospID', 'balance_sign', 'ykc618'], [HospID, 0, ''],
    [dboEqual, dboEqual, dboNotEqual], [dboAnd, dboAnd]);
end;

procedure TSYBBalanceData.OpenForBalance(HospID: string);
begin
  OpenByList(['HospID', 'balance_sign', 'ykc618'], [HospID, 0, ''],
    [dboEqual, dboEqual, dboEqual], [dboAnd, dboAnd]);
end;

{ TSYBHospRegOutDialog }

procedure TSYBHospRegOutDialog.BuildDialog;
begin
  inherited;

  FRegOutInput := TSYBData.Create(Self, HisConnection, sDataServiceSYB,
    'syb_regout_input');
  FBalanceInput := TSYBData.Create(Self, HisConnection, sDataServiceSYB,
    'syb_balance_input');
  FBalanceOutput := TSYBBalanceData.Create(Self);

  FRegOutInput.EnableBatchUpdate;
  FBalanceInput.EnableBatchUpdate;
  FBalanceOutput.EnableBatchUpdate;

  OpenByHospID;

  ImageName := FRegOutInput.CustomAttributes.Values['FormImageName'];
  DevExpress.BuildFormView(DialogGroup, FRegOutInput);
  DevExpress.BuildFormView(DialogGroup, FBalanceInput);
end;

procedure TSYBHospRegOutDialog.DoDialogOK(Sender: TObject);
begin
  if ShowYesNo('省医保：确定提交出院登记结算信息吗?') then
  begin
    SYBService.DACommand.Execute('Pro_SYB_RegOut_Before',
      [sFieldHospID, sFieldOpID], [FHospID, HisUser.ID]);

    SYBMgr.Call(FHospID, sJYBH_RegisterOut, FRegOutInput, nil, nil);
    AppCore.Logger.Write('省医保出院登记完成|' + FHospID, mtInfo, 1);
    FRegOutInput.ApplyUpdates;

    // 出院登记之后
    SYBService.DACommand.Execute('Pro_SYB_RegOut_After',
      [sFieldHospID, sFieldOpID], [FHospID, HisUser.ID]);

    SYBMgr.Call(FHospID, sJYBH_BalanceFee, FBalanceInput, nil, FBalanceOutput);
    AppCore.Logger.Write('省医保出院结算完成|' + FHospID, mtInfo, 1);
    FBalanceInput.ApplyUpdates;
    FBalanceOutput.ApplyUpdates;

    SYBService.DACommand.Execute('Pro_SYB_Balance_After',
      [sFieldHospID, sFieldOpID, 'balance_id'],
      [FHospID, HisUser.ID, FBalanceInput.AsInteger['balance_id']]);

    ShowOK('省医保出院登记完成');

    ModalResult := mrOk;
  end;
end;

function TSYBHospRegOutDialog.DoExecute(CommandID: Integer;
  const Param: array of Variant): Variant;
begin
  Result := inherited DoExecute(CommandID, Param);

  if CommandID = iOperationCommand_Notify then
    with TCustomDataView(Integer(Param[0])), ViewData do
    begin
      if Eof then
        Exit;
      FHospID := AsString[sFieldHospID];
      Check(AsInteger[sFieldPatientTypeID] <> iHospPatientType_SYB, '非省医保病人');

      SYBService.DACommand.Execute('Pro_SYB_RegOut_Prepare',
        [sFieldHospID, sFieldOpID], [FHospID, HisUser.ID]);

      OpenByHospID;
      FRegOutInput.Edit;
      FBalanceInput.Edit;

      if Self.ShowModal = mrOk then
      begin
        // DataQuery; do nothing;
      end;
    end;
end;

procedure TSYBHospRegOutDialog.OpenByHospID;
begin
  FRegOutInput.OpenByParam([sFieldHospID], [FHospID]);
  FBalanceInput.OpenByParam([sFieldHospID], [FHospID]);
  FBalanceOutput.OpenForBalance(FHospID);
end;

{ TOperationSYBHospRegOut }

procedure TOperationSYBHospRegOut.AfterConstruction;
begin
  inherited;
  BuildAction('取消省医保出院登记', '', nil, DoActionCancelRegOut, 0);
end;

procedure TOperationSYBHospRegOut.DoActionCancelRegOut(Sender: TObject);
var
  HospInOutView: TTableGridDataView;
  HospID: string;
  BalanceID: Integer;
  RegOutCancelInput: TSYBData;
  BalanceCancelInput: TSYBData;
begin
  HospInOutView := TTableGridDataView(CustomAttributes.Objects
    [CustomAttributes.IndexOf(sOperationIDHospPatientInOut)]);
  if (HospInOutView <> nil) and not HospInOutView.ViewData.Eof and
    (HospInOutView.ViewData.AsInteger[sFieldPatientTypeID]
    = iHospPatientType_SYB) and ShowYesNo('省医保：确定取消出院登记吗?') then
  begin
    HospID := HospInOutView.ViewData.AsString[sFieldHospID];

    SYBService.DACommand.Execute('Pro_SYB_RegOutCancel_Before',
      [sFieldHospID, sFieldOpID], [HospID, HisUser.ID]);

    BalanceCancelInput := TSYBData.Create(nil, HisConnection, sDataServiceSYB,
      'syb_balance_cancel');
    RegOutCancelInput := TSYBData.Create(nil, HisConnection, sDataServiceSYB,
      'syb_regout_cancel');
    try
      BalanceID := 0;

      BalanceCancelInput.OpenByParam([sFieldHospID], [HospID]);
      if not BalanceCancelInput.Eof then
      begin
        BalanceID := BalanceCancelInput.AsInteger['balance_id'];
        SYBMgr.Call(HospID, sJYBH_CancelBalance, BalanceCancelInput, nil, nil);
        SYBMgr.Confirm;
        AppCore.Logger.Write('省医保出院结算取消完成|' + HospID, mtInfo, 1);

        SYBService.DACommand.Execute('Pro_SYB_BalanceCancel_After',
          [sFieldHospID, sFieldOpID, 'balance_id'],
          [HospID, HisUser.ID, BalanceID]);
      end;

      RegOutCancelInput.OpenByParam([sFieldHospID], [HospID]);
      if not RegOutCancelInput.Eof then
      begin
        SYBMgr.Call(HospID, sJYBH_CancelOut, RegOutCancelInput, nil, nil);
        SYBMgr.Confirm;
        AppCore.Logger.Write('省医保出院登记取消完成|' + HospID, mtInfo, 1);

        SYBService.DACommand.Execute('Pro_SYB_RegOutCancel_After',
          [sFieldHospID, sFieldOpID], [HospID, HisUser.ID]);
      end;

    finally
      BalanceCancelInput.Free;
      RegOutCancelInput.Free;
    end;
  end;
end;

{ TSYBHospFeeDialog }

procedure TSYBHospFeeDialog.BuildDialog;
begin
  inherited;
  Caption := '省医保住院结算';
  FBalanceData := TSYBBalanceData.Create(Self);
  OpenByHospID;
  ImageName := FBalanceData.CustomAttributes.Values['FormImageName'];
  DevExpress.BuildFormView(DialogGroup, FBalanceData);

  ViewLayout.FindItem(OKButton).Visible := False;
  CancelButton.Caption := '关闭(&C)';

  FPrintAction := BuildAction('准备收费', '', '', DoPrintUpdate, DoPrintAction, 0,
    BTN_NOTFLAT or BTN_CANBEFOCUSED or BTN_SHOWCAPTION);

  BuildLayoutToolBar(ButtonGroup, [FPrintAction]);
end;

procedure TSYBHospFeeDialog.DoPrintAction(Sender: TObject);
var
  Msg: string;
begin
  SYBService.DACommand.Execute('Pro_SYB_HospFee_Before',
    ['Msg', sFieldOfficeID, sFieldOpID, sFieldHospID],
    ['', HisUser.OfficeID, HisUser.ID, FHospID]);

  Msg := SYBService.GetCommandOutputParam('Msg');
  if Msg <> '' then
  begin
    ShowWarning(Msg);
    AppCore.Logger.WriteFmt('省医保提示(%s)：%s', [FHospID, Msg], mtInfo, 0);
  end;

  FSYBMoney := FBalanceData.AsFloat['akc227'] - FBalanceData.AsFloat['ykc624'];

  if FHospFeeDialog.StartFee(iHospFeeType_SYB, FSYBMoney, 0, PrintCallback) then
    ModalResult := mrOk;
end;

procedure TSYBHospFeeDialog.DoPrintUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := not FBalanceData.Eof;
end;

function TSYBHospFeeDialog.Execute(HospFeeDialog: TcvHospFeeDialog): Boolean;
begin
  FHospFeeDialog := HospFeeDialog;
  FHospID := FHospFeeDialog.PatientView.PatientData.HospID;
  OpenByHospID();

  Result := inherited Execute();
end;

procedure TSYBHospFeeDialog.OpenByHospID;
begin
  FBalanceData.OpenBalanced(FHospID);
  Check((FHospID <> '') and (FBalanceData.Eof), '省医保：未找到结算信息');
end;

procedure TSYBHospFeeDialog.PrintCallback(Sender: TcvHospFeeDialog);
begin
  with Sender do
  begin
    YBID := FBalanceData.AsInteger['balance_id'];
  end;
end;

{ TSYBUncertainTradeView }

procedure TSYBUncertainTradeView.BuildViewAction;
begin
  inherited;
  BuildAction('取消交易', 'cancel', '', DoActionCancelUpdate, DoActionCancel, 0,
    BTN_SHOWCAPTION);
end;

procedure TSYBUncertainTradeView.BuildViewLayout;
begin
  inherited;
  ViewData := TSYBData.Create(Self, HisConnection, sDataServiceSYB,
    'syb_uncertain_trade');
  ViewData.EnableBatchUpdate;
end;

procedure TSYBUncertainTradeView.DataQuery;
begin
  if not ViewData.Table.Active then
    inherited
  else
  begin
    inherited;
    SYBMgr.GetUncertaintyTrade('', TSYBData(ViewData));
  end;
end;

procedure TSYBUncertainTradeView.DoActionCancel(Sender: TObject);
begin
  SYBMgr.FJYLSH := ViewData.AsString['yke014'];
  SYBMgr.Cancel;
  ViewData.Delete;
end;

procedure TSYBUncertainTradeView.DoActionCancelUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := not ViewData.Eof;
end;

{ TSYBHospBalanceView }

procedure TSYBHospBalanceView.BuildViewLayout;
begin
  inherited;
  FInvoiceEdit := TcxMaskEdit.Create(Self);
  SerialIDWrapper.Wrap(FInvoiceEdit).OnSerialID := DoInvoiceIDEvent;
  // with ToolBarGroup do
  // begin
  // with CreateItemForControl(FInvoiceEdit) do
  // begin
  // AlignVert := avCenter;
  // Caption := '号码:';
  // end;
  // end;

  OnDoubleClickView := DoDoubleClick;
  PeriodGroup.Visible := True;
  ViewData := TCustomData.Create(Self, HisConnection, sDataServiceSYB,
    'syb_balance');
end;

procedure TSYBHospBalanceView.DataQuery;
begin
  ViewData.OpenByBetween('aae036', FormatDateTime('YYYY-MM-DD', BeginDate),
    FormatDateTime('YYYY-MM-DD', EndDate));
end;

procedure TSYBHospBalanceView.DoDoubleClick(Sender: TObject);
begin
  AppCore.Operations.SearchOperation(sOperationIDHospFeeMasterQuery)
    .Execute(iOperationCommand_HospFeeID, [ViewData.AsString['HospFeeID']]);
end;

procedure TSYBHospBalanceView.DoInvoiceIDEvent(Sender: TObject);
begin

end;

initialization

RegisterHospFeeProc(iHospPatientType_SYB, SYBHospFeeProc);

finalization

SYBMgr__.Free;

end.
