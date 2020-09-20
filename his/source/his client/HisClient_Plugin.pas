unit HisClient_Plugin;

{
  HIS插件

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
  App_Common,
  App_DAModel,
  App_DAView,
  App_Class,
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
  dxBar,
  dxLayoutControl,
  dxLayoutContainer,
  uROClasses,
  HisClient_Base,
  HisClient_Clinic,
  HisClient_Const,
  HisClient_Classes;

const
  sPluginNameTJ = 'TJ';
  sDataServiceTJ = 'IdeaService_TJ';
  sDataServiceFG = 'IdeaService_FGHis';

type

  { 门诊收费体检插件 }
  TClinTJFeePlugin = class(TClinBaseFeePlugin)
  private
    FClinView: TClinCashierView;
    FTJData: TCustomData;
    FClinFeeMaster: TcdClinFeeMaster;
  public
    constructor Create(AOwner: TComponent); override;
    function GetPluginName: string; override;
    procedure BuildPluginAction(AClinRecipeView: TClinCashierView); override;

    procedure DoBeforeInFee(AReg: TcdClinReg; AFee: TcdClinFeeMaster); override;
    procedure DoAfterInFee(AReg: TcdClinReg; AFeeID: string); override;

    procedure DoBeforeReturnFee(AFee: TcdClinFeeMaster;
      AReturnFee: TcdClinFeeMaster); override;
    procedure DoAfterReturnFee(AFee: TcdClinFeeMaster;
      ANewFeeID: string); override;
  end;

  TOperationTJReg = class(TBaseOperation)
  private
    FTJData: TCustomData;
  protected
    function DoExecute(CommandID: Integer; const Param: array of Variant)
      : Variant; override;
  public
    destructor Destroy(); override;
  end;

procedure OrganizePluginOperations();

implementation

uses
  App_FastReport;

procedure OrganizePluginOperations();
begin
end;

{ TClinTJFeePlugin }

procedure TClinTJFeePlugin.BuildPluginAction(AClinRecipeView: TClinCashierView);
begin
  FClinView := AClinRecipeView;
end;

constructor TClinTJFeePlugin.Create(AOwner: TComponent);
begin
  inherited;
  FTJData := TCustomData.Create(Self, HisConnection, sDataServiceTJ,
    'VIEW_HIS_TJDJB');
  FClinFeeMaster := TcdClinFeeMaster.Create(Self);
end;

procedure TClinTJFeePlugin.DoAfterInFee(AReg: TcdClinReg; AFeeID: string);
begin
  if not SameText(PluginName, AReg.SystemCode) then
    Exit;

  with HisConnection.GetDataService(sDataServiceClin) do
  begin
    DACommand.Execute('Pro_TJ_Fee_Take', ['ClinID', 'FeeID', 'OpID'],
      [AReg.ClinID, AFeeID, HisUser.ID]);
  end;

  AppCore.Logger.Write('体检接口收费完成', mtInfo, 0);
end;

procedure TClinTJFeePlugin.DoAfterReturnFee(AFee: TcdClinFeeMaster;
  ANewFeeID: string);
begin
  if not SameText(PluginName, AFee.SystemCode) then
    Exit;

  with HisConnection.GetDataService(sDataServiceClin) do
  begin
    DACommand.Execute('Pro_TJ_Fee_Return', ['FeeID', 'NewID', 'OpID'],
      [AFee.ClinFeeID, ANewFeeID, HisUser.ID]);
  end;

  AppCore.Logger.Write('体检接口退费完成', mtInfo, 0);
end;

procedure TClinTJFeePlugin.DoBeforeInFee(AReg: TcdClinReg;
  AFee: TcdClinFeeMaster);
begin
  if not SameText(PluginName, AReg.SystemCode) then
    Exit;

  with HisConnection.GetDataService(sDataServiceTJ) do
  begin
    DACommand.Execute('PRO_HIS_DJLSH_CollectFees', ['djlsh', 'price'],
      [AReg.InterfaceID, AFee.SumPrice]);
  end;

  AppCore.Logger.WriteFmt('体检单%s, 收费金额%0.2f, 接口执行成功',
    [AReg.InterfaceID, AFee.SumPrice], mtInfo, 0);
end;

procedure TClinTJFeePlugin.DoBeforeReturnFee(AFee: TcdClinFeeMaster;
  AReturnFee: TcdClinFeeMaster);
begin
  if not SameText(PluginName, AFee.SystemCode) then
    Exit;

  with HisConnection.GetDataService(sDataServiceTJ) do
  begin
    DACommand.Execute('PRO_HIS_DJLSH_Returns', ['djlsh', 'price'],
      [AFee.InterfaceID, AReturnFee.SumPrice]);
  end;

  AppCore.Logger.WriteFmt('体检单%s, 退费金额%0.2f, 接口执行成功',
    [AFee.InterfaceID, AReturnFee.SumPrice], mtInfo, 0);
end;

function TClinTJFeePlugin.GetPluginName: string;
begin
  Result := sPluginNameTJ;
end;

{ TOperationTJReg }

destructor TOperationTJReg.Destroy;
begin
  FTJData.Free;
  inherited;
end;

function TOperationTJReg.DoExecute(CommandID: Integer;
  const Param: array of Variant): Variant;
var
  TJNum: string;
  EventSource: TObject;
begin
  Result := inherited DoExecute(CommandID, Param);

  if CommandID = iOperationCommand_Notify then
  begin
    if DX_InputQuery('体检单输入', '请扫描体检单条码:', '', TJNum) then
    begin
      if FTJData = nil then
        FTJData := TCustomData.Create(nil, HisConnection, sDataServiceTJ,
          'VIEW_HIS_TJDJB');

      FTJData.OpenByFieldValue('djlsh', TJNum);

      Check(FTJData.Table.RecordCount = 0, '体检单无效');

      with HisConnection.GetDataService(sDataServiceClin), FTJData do
      begin
        DACommand.Execute('Pro_TJ_Reg', [sFieldClinID, 'TJ_ID', 'TJ_Price',
          'TJ_Name', 'TJ_Sex', 'TJ_Birth', 'TJ_IDCode', 'OpID'],
          ['', AsString['djlsh'], AsCurrency['jg'], AsString['xm'],
          Ord(AsString['xb'][1]), AsDateTime['csnyr'], AsString['sfzh'],
          HisUser.ID]);

        EventSource := TObject(Integer(Param[0]));
        if EventSource is TClinCenterView then
          TClinCenterView(EventSource).ClinRegPatient.OpenByNum
            (GetCommandOutputParam(sFieldClinID))
        else
          TClinCashierView(EventSource)
            .TakeClinID(GetCommandOutputParam(sFieldClinID));
      end;
    end;
  end;
end;

initialization

ClinFeePluginManager.RegisterPlugin(TClinTJFeePlugin.Create(nil));

end.
