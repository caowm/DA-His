unit HisClient_TestForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Contnrs, Dialogs, App_Common, uDAClasses, uROClasses, uDASupportClasses,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, dxLayoutcxEditAdapters, dxLayoutContainer,
  cxCheckListBox, cxTextEdit, dxLayoutControl, dxLayoutControlAdapters,
  Menus, StdCtrls, cxButtons, cxCustomData, cxStyles, cxTL,
  cxTLdxBarBuiltInMenu, cxInplaceContainer, cxFilter, cxData,
  cxDataStorage, DB, cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  cxGridBandedTableView, cxGridDBBandedTableView, cxGridChartView,
  cxGridDBChartView, cxGridCardView, cxGridDBCardView,
  cxGridCustomLayoutView, cxMaskEdit, cxDBTL, cxTLData,
  cxGridCustomPopupMenu, cxGridPopupMenu, cxFontNameComboBox,
  cxDBFontNameComboBox, cxDropDownEdit, cxColorComboBox, cxDBColorComboBox,
  cxTrackBar, cxDBTrackBar, cxProgressBar, cxDBProgressBar, cxLabel,
  cxDBLabel, cxGroupBox, cxCheckGroup, cxDBCheckGroup, dxColorEdit,
  dxDBColorEdit, uROClient, uDAScriptingProvider, uDADataTable,
  uDAMemDataTable, cxCurrencyEdit, cxCalc, cxSpinEdit, cxButtonEdit,
  ActnList, cxDBLookupComboBox, cxMemo, cxLookupEdit, cxDBLookupEdit,
  ComCtrls, dxCore, cxDateUtils, cxCalendar, Buttons, Grids, cxRadioGroup,
  cxImage, cxDBEdit;

type
  TTestForm1 = class(TBaseView)
    dxLayoutControl1Group_Root: TdxLayoutGroup;
    dxLayoutControl1: TdxLayoutControl;
    TableView: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    dxLayoutControl1Group2: TdxLayoutGroup;
    TableViewColumn1: TcxGridDBColumn;
    TableViewColumn2: TcxGridDBColumn;
    cxGrid1Level2: TcxGridLevel;
    cxGrid1DBBandedTableView1: TcxGridDBBandedTableView;
    cxGrid1DBBandedTableView1Column1: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1Column2: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1Column3: TcxGridDBBandedColumn;
    cxGrid1Level3: TcxGridLevel;
    cxGrid1DBChartView1: TcxGridDBChartView;
    cxGrid1DBChartView1Series1: TcxGridDBChartSeries;
    cxGrid1DBChartView1DataGroup1: TcxGridDBChartDataGroup;
    cxGrid1Level4: TcxGridLevel;
    cxGrid1DBCardView1: TcxGridDBCardView;
    cxGrid1DBCardView1Row1: TcxGridDBCardViewRow;
    cxGrid1DBCardView1Row2: TcxGridDBCardViewRow;
    cxGrid1DBCardView1Row3: TcxGridDBCardViewRow;
    cxGrid1DBCardView1Row4: TcxGridDBCardViewRow;
    cxGrid1DBCardView1Row5: TcxGridDBCardViewRow;
    dxLayoutControl1Item1: TdxLayoutItem;
    dxLayoutControl1Item2: TdxLayoutItem;
    ParamGrid: TStringGrid;
    dxLayoutControl1Group1: TdxLayoutGroup;
    PrintBtn: TBitBtn;
    dxLayoutControl1Item4: TdxLayoutItem;
    ReportEdit: TEdit;
    dxLayoutControl1Item5: TdxLayoutItem;
    dxLayoutControl1Group3: TdxLayoutGroup;
    Button1: TButton;
    dxLayoutControl1Item6: TdxLayoutItem;
    Button2: TButton;
    dxLayoutControl1Item7: TdxLayoutItem;
    dxLayoutControl1Group4: TdxLayoutGroup;
    cxPopupEdit1: TcxPopupEdit;
    dxLayoutControl1Item3: TdxLayoutItem;
    cxGrid1DBBandedTableView1Column4: TcxGridDBBandedColumn;
    cxDBPopupEdit1: TcxDBPopupEdit;
    dxLayoutControl1Item8: TdxLayoutItem;
    cxDBTextEdit1: TcxDBTextEdit;
    dxLayoutControl1Item9: TdxLayoutItem;
    Button3: TButton;
    dxLayoutControl1Item10: TdxLayoutItem;
    Button4: TButton;
    dxLayoutControl1Item11: TdxLayoutItem;
    dxLayoutControl1Group5: TdxLayoutGroup;
    procedure PrintBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure TableViewColumn1PropertiesPopup(Sender: TObject);
    procedure cxPopupEdit1PropertiesCloseQuery(Sender: TObject;
      var CanClose: Boolean);
    procedure cxPopupEdit1PropertiesCloseUp(Sender: TObject);
    procedure cxPopupEdit1PropertiesInitPopup(Sender: TObject);
    procedure cxPopupEdit1PropertiesPopup(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
    FID: Integer;
    FOperationList: TObjectList;
  public
    { Public declarations }
  end;

  TServiceCollection = class;

  TServiceManager = class(TDAStreamableComponent)
  private
    FServices: TServiceCollection;
    FLogAction: Boolean;
  protected

  public
    constructor Create(aOwner: TComponent); override;
    destructor Destroy(); override;
  published
    property Services: TServiceCollection read FServices;
    property LogAction: Boolean read FLogAction write FLogAction;
  end;

  TServiceCollection = class(TSearcheableCollection)
  private
  public
    constructor Create(AOwner: TPersistent);
  end;

  TServiceItem = class(TCollectionItem)
  private
    FName: string;
    FConnectionName: string;
    FSchemaName: string;
  public
    constructor Create(Collection: TCollection); override;
  published
    property Name: string read FName write FName;
    property SchemaName: string read FSchemaName write FSchemaName;
    property ConnectionName: string read FConnectionName write FConnectionName;
  end;

  function TestOperationProc(Sender: TBaseOperation; CommandID: Integer;
    const Param: array of Variant): Variant;
  
var
    P: PChar;
implementation

uses
  App_DevExpress, App_DAView, App_Function, HisClient_Const, HisClient_Classes;

{$R *.dfm}

function TestOperationProc(Sender: TBaseOperation; CommandID: Integer;
  const Param: array of Variant): Variant;
begin
  AppCore.Logger.Write('Test Operation: ' + FloatToStr(Random * 1000));
end;

procedure TTestForm1.PrintBtnClick(Sender: TObject);
var
  NameArr, ValueArr: array of Variant;
  I: Integer;
begin
  SetLength(NameArr, 15);
  SetLength(ValueArr, 15);
  I := 1;
  while (I <= 15) and (Trim(ParamGrid.Cells[0, I]) <> '') do
  begin
    NameArr[I - 1] := ParamGrid.Cells[0, I];
    ValueArr[I - 1] := ParamGrid.Cells[1, I];
    Inc(I);
  end;
  SetLength(NameArr, I - 1);
  SetLength(ValueArr, I - 1);
  PrintReportFromServer(ReportEdit.Text, NameArr, ValueArr, True);
end;

procedure TTestForm1.FormCreate(Sender: TObject);
begin
  ParamGrid.Cells[0, 0] := '参数名';
  ParamGrid.Cells[1, 0] := '参数值';
  FOperationList := TObjectList.Create(False);
end;

{ TServiceCollection }

constructor TServiceCollection.Create(AOwner: TPersistent);
begin
  inherited Create(AOwner, TServiceItem);
end;

{ TServiceItem }

constructor TServiceItem.Create(Collection: TCollection);
begin
  inherited;

end;

{ TServiceManager }

constructor TServiceManager.Create(aOwner: TComponent);
begin
  inherited;
  FServices := TServiceCollection.Create(Self);
end;

destructor TServiceManager.Destroy;
begin
  fServices.Free;
  inherited;
end;

procedure TTestForm1.Button1Click(Sender: TObject);
var
  ServiceMgr: TServiceManager;
begin
  ServiceMgr := TServiceManager.Create(Self);
  try
    with TServiceItem(ServiceMgr.Services.Add) do
    begin
      Name := 'TJService';
      ConnectionName := 'TJDB';
      SchemaName := 'TJ.daSchema';
    end;

    with TServiceItem(ServiceMgr.Services.Add) do
    begin
      Name := 'LisSService';
      ConnectionName := 'LisDB';
      SchemaName := 'Lis.daSchema';
    end;
    ServiceMgr.SaveToFile(AppCore.TempPath + 'services.xml');
  finally
    ServiceMgr.Free;
  end;
end;

procedure TTestForm1.Button2Click(Sender: TObject);
var
  ServiceMgr: TServiceManager;
begin
  ServiceMgr := TServiceManager.Create(Self);
  try
    ServiceMgr.LoadFromFile(AppCore.TempPath + 'Services.xml');
    ServiceMgr.SaveToFile(AppCore.TempPath + 'services2.xml');
  finally
    ServiceMgr.Free;
  end;
end;

procedure TTestForm1.TableViewColumn1PropertiesPopup(Sender: TObject);
begin
//
end;

procedure TTestForm1.cxPopupEdit1PropertiesCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  AppCore.Logger.Write('CloseQuery');
end;

procedure TTestForm1.cxPopupEdit1PropertiesCloseUp(Sender: TObject);
begin
  AppCore.Logger.Write('CloseUp');
end;

procedure TTestForm1.cxPopupEdit1PropertiesInitPopup(Sender: TObject);
begin
  AppCore.Logger.Write('InitPopup');
end;

procedure TTestForm1.cxPopupEdit1PropertiesPopup(Sender: TObject);
begin
 AppCore.Logger.Write('Popup');
end;

procedure TTestForm1.Button4Click(Sender: TObject);
var
  I, J: Integer;
  Operation: TProcOperation;
begin
  Randomize;
  for I := 0 to 100 do
  begin
    J := Round(Random * AppCore.Operations.Count);
    // 随机创建Operation
    Inc(FID);
    Operation := TProcOperation.Create('Test' + IntToStr(FID));
    with Operation do
    begin
      //Category := AppCore.Operations[J].Category + ',' + AppCore.Operations[J].Caption;
      Category := '动态目录';
      Caption := '测试' + IntToStr(FID);
      OnExecute := TestOperationProc;
      Flag := iOperationFlag_NoMenu;
      State := osCreating;
    end;
    FOperationList.Add(Operation);
  end;
end;

procedure TTestForm1.Button3Click(Sender: TObject);
var
  I, J: Integer;
begin
  Randomize;
  for I := 0 to 50 do
  begin
    if FOperationList.Count > 0 then
    begin
      J := Trunc(Random * FOperationList.Count);
      TBaseOperation(FOperationList[J]).State := osRemoving;
      FOperationList[J].Free;
      FOperationList.Delete(J);
    end;
  end;
end;

initialization

  with TViewOperation.Create('{0E722EE6-AD32-4D17-854F-F315F4F32631}') do
  begin
    ViewClass := TTestForm1;
    Caption := '测试窗体';
    Category := '系统';
    Flag := iOperationFlag_NoTree;
    ShortKey := ShortCut(Ord('T'), [ssCtrl]);
    Order := 'FF';
    Access := '10';
  end;

end.
