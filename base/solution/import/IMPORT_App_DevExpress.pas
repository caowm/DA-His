unit IMPORT_App_DevExpress;
interface
uses
  SysUtils,
  Classes,
  Graphics,
  Forms,
  DB,
  Controls,
  Variants,
  Math,
  ImgList,
  Windows,
  Dialogs,
  StdCtrls,
  TypInfo,
  Types,
  StrUtils,
  App_Common,
  App_Function,
  App_DAModel,
  uDADataTable,
  uDAInterfaces,
  cxGraphics,
  cxImage,
  cxStyles,
  cxLookAndFeels,
  cxControls,
  cxLookAndFeelPainters,
  cxDBEditRepository,
  cxExtEditRepositoryItems,
  cxEditRepositoryItems,
  cxEdit,
  cxCalc,
  cxSpinEdit,
  cxMemo,
  cxDBEdit,
  cxDBLookupComboBox,
  cxDBLabel,
  cxHyperLinkEdit,
  cxDBProgressBar,
  cxDBColorComboBox,
  cxDBFontNameComboBox,
  cxDBCheckComboBox,
  cxDBCheckGroup,
  cxDBCheckListBox,
  cxDBRichEdit,
  dxDBColorEdit,
  cxDBShellComboBox,
  cxGridExportLink,
  cxGrid,
  cxGridCustomView,
  cxGridCustomTableView,
  cxGridTableView,
  cxGridDBTableView,
  cxGridDBCardView,
  cxGridBandedTableView,
  cxGridDBBandedTableView,
  cxClasses,
  cxGridCardView,
  cxCustomPivotGrid,
  cxDBPivotGrid,
  cxExportPivotGridLink,
  cxTL,
  cxDBTL,
  cxTLExportLink,
  cxGridCustomPopupMenu,
  cxGridPopupMenu,
  cxShellEditRepositoryItems,
  dxLayoutLookAndFeels,
  dxLayoutContainer,
  cxCustomData,
  cxDataStorage,
  cxDBData,
  cxDropDownEdit,
  cxGridChartView,
  cxGridDBChartView,
  cxCheckBox,
  cxCheckComboBox,
  cxCheckGroup,
  cxRadioGroup,
  cxCurrencyEdit,
  cxMaskEdit,
  cxTextEdit,
  cxCalendar,
  cxImageComboBox,
  dxGDIPlusAPI,
  dxSkinscxPCPainter,
  dxBar,
  dxCore,
  dxStatusBar,
  cxLocalization,
  cxFilter,
  cxData,
  cxButtonEdit,
  dxSkinsForm,
  cxNavigator,
  cxGridCustomLayoutView,
  App_DevExpress,
  PaxCompiler,
  PaxRegister;
procedure RegisterIMPORT_App_DevExpress;
implementation
function TDevExpressModule_GetBarManager(Self:TDevExpressModule):TdxBarManager;
begin
  result := Self.BarManager;
end;
procedure TDevExpressModule_PutBarManager(Self:TDevExpressModule;const Value: TdxBarManager);
begin
  Self.BarManager := Value;
end;
function TDevExpressModule_GetNumColumnWidth(Self:TDevExpressModule):Integer;
begin
  result := Self.NumColumnWidth;
end;
procedure TDevExpressModule_PutNumColumnWidth(Self:TDevExpressModule;const Value: Integer);
begin
  Self.NumColumnWidth := Value;
end;
function TDevExpressModule_GetTextColumnWidth(Self:TDevExpressModule):Integer;
begin
  result := Self.TextColumnWidth;
end;
procedure TDevExpressModule_PutTextColumnWidth(Self:TDevExpressModule;const Value: Integer);
begin
  Self.TextColumnWidth := Value;
end;
function TDevExpressModule_GetOddRowColor(Self:TDevExpressModule):TColor;
begin
  result := Self.OddRowColor;
end;
procedure TDevExpressModule_PutOddRowColor(Self:TDevExpressModule;const Value: TColor);
begin
  Self.OddRowColor := Value;
end;
function TDevExpressModule_GetEvenRowColor(Self:TDevExpressModule):TColor;
begin
  result := Self.EvenRowColor;
end;
procedure TDevExpressModule_PutEvenRowColor(Self:TDevExpressModule;const Value: TColor);
begin
  Self.EvenRowColor := Value;
end;
function TDevExpressModule_GetGridStyle(Self:TDevExpressModule):Integer;
begin
  result := Self.GridStyle;
end;
procedure TDevExpressModule_PutGridStyle(Self:TDevExpressModule;const Value: Integer);
begin
  Self.GridStyle := Value;
end;
function TDevExpressModule_GetDefaultIME(Self:TDevExpressModule):string;
begin
  result := Self.DefaultIME;
end;
procedure TDevExpressModule_PutDefaultIME(Self:TDevExpressModule;const Value: string);
begin
  Self.DefaultIME := Value;
end;
procedure RegisterIMPORT_App_DevExpress;
var G, H: Integer;
begin
  H := RegisterNamespace(0, 'App_DevExpress');
  RegisterConstant(H, 'iDefaultDataRowHeight', 26);
  RegisterConstant(H, 'iIndicatorWidth', 48);
  RegisterConstant(H, 'iNumColumnWidth', 60);
  RegisterConstant(H, 'iTextColumnWidth', 80);
  // Begin of class TDevExpressModule
  G := RegisterClassType(H, TDevExpressModule);
  RegisterHeader(G, 
       'procedure DataModuleCreate(Sender: TObject);',
       @TDevExpressModule.DataModuleCreate);
  RegisterHeader(G, 
       'procedure DataModuleDestroy(Sender: TObject);',
       @TDevExpressModule.DataModuleDestroy);
  RegisterHeader(G, 
       'procedure ExportGrid(AGrid: TcxGrid; ShowDialog: Boolean = True; const DefaultFileName: string = '''');',
       @TDevExpressModule.ExportGrid);
  RegisterHeader(G, 
       'procedure ExportPivot(APivot: TcxCustomPivotGrid);',
       @TDevExpressModule.ExportPivot);
  RegisterHeader(G, 
       'procedure ExportTreeList(ATreeList: TcxCustomTreeList);',
       @TDevExpressModule.ExportTreeList);
  RegisterHeader(G, 
       'procedure FillSkinNames(List: TStrings);',
       @TDevExpressModule.FillSkinNames);
  RegisterHeader(G, 
       'procedure SetSkinIndex(AIndex: Integer);',
       @TDevExpressModule.SetSkinIndex);
  RegisterHeader(G, 
       'function GetSkinIndex(): Integer;',
       @TDevExpressModule.GetSkinIndex);
  RegisterHeader(G,
       'procedure SetStyle(Index: integer);',
       @TDevExpressModule.SetStyle);
  RegisterHeader(G, 
       'function GetGridStyle: TcxGridTableViewStyles;',
       @TDevExpressModule.GetGridStyle);
  RegisterHeader(G, 
       'function GetBandStyle: TcxGridBandedTableViewStyles;',
       @TDevExpressModule.GetBandStyle);
  RegisterHeader(G, 
       'function GetCardStyle: TcxGridCardViewStyles;',
       @TDevExpressModule.GetCardStyle);
  RegisterHeader(G, 
       'function GetPivotStyle: TcxPivotGridStyles;',
       @TDevExpressModule.GetPivotStyle);
  RegisterHeader(G, 
       'function GetTreeStyle: TcxTreeListStyles;',
       @TDevExpressModule.GetTreeStyle);
  RegisterHeader(G, 
       'function GetStyle(const StyleName: string): TcxCustomStyle;',
       @TDevExpressModule.GetStyle);
  RegisterHeader(G, 
       'procedure RegisterGridStyleListener(AListener: TcxCustomGridTableView);',
       @TDevExpressModule.RegisterGridStyleListener);
  RegisterHeader(G, 
       'procedure UnRegisterGridStyleListener(AListener: TcxCustomGridTableView);',
       @TDevExpressModule.UnRegisterGridStyleListener);
  RegisterHeader(G, 
       'procedure RegisterTreeStyleListener(AListener: TcxCustomTreeList);',
       @TDevExpressModule.RegisterTreeStyleListener);
  RegisterHeader(G, 
       'procedure UnRegisterTreeStyleListener(AListener: TcxCustomTreeList);',
       @TDevExpressModule.UnRegisterTreeStyleListener);
  RegisterHeader(G, 
       'procedure RegisterPivotStyleListener(AListener: TcxCustomPivotGrid);',
       @TDevExpressModule.RegisterPivotStyleListener);
  RegisterHeader(G, 
       'procedure UnRegisterPivotStyleListener(AListener: TcxCustomPivotGrid);',
       @TDevExpressModule.UnRegisterPivotStyleListener);
  RegisterHeader(G, 
       'procedure cxTableViewCustomDrawIndicatorCell(      Sender: TcxGridTableView; ACanvas: TcxCanvas;      AViewInfo: TcxCustomGridIndicatorItemViewInfo; var ADone: Boolean);',
       @TDevExpressModule.cxTableViewCustomDrawIndicatorCell);
  RegisterHeader(G, 
       'procedure cxTableViewCustomDrawCell(      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);',
       @TDevExpressModule.cxTableViewCustomDrawCell);
  RegisterHeader(G, 
       'function GetRepositoryItem(const EditType: string): TcxEditRepositoryItem;',
       @TDevExpressModule.GetRepositoryItem);
  RegisterHeader(G, 
       'function GetProperties(const EditType: string): TcxCustomEditProperties;',
       @TDevExpressModule.GetProperties);
  RegisterHeader(G, 
       'function GetPropertiesClass(const EditType: string): TcxCustomEditPropertiesClass;',
       @TDevExpressModule.GetPropertiesClass);
  RegisterHeader(G, 
       'function GetDBControlClass(const EditType: string): TcxCustomEditClass;',
       @TDevExpressModule.GetDBControlClass);
  RegisterHeader(G, 
       'procedure BuildTableView(TableView: TcxGridDBTableView; DataSource: TDADataSource);',
       @TDevExpressModule.BuildTableView);
  RegisterHeader(G, 
       'procedure BuildGridColumns(TableView: TcxGridDBTableView; DataSource: TDADataSource);',
       @TDevExpressModule.BuildGridColumns);
  RegisterHeader(G, 
       'procedure BuildGridColumn(Column: TcxGridColumn; DAField: TDAField; DataSource: TDADataSource);',
       @TDevExpressModule.BuildGridColumn);
  RegisterHeader(G,
       'procedure BuildProperties(AColumn: TComponent; EditProperties: TcxCustomEditProperties;      DAField: TDaField; DataSource: TDADataSource);',
       @TDevExpressModule.BuildProperties);
  RegisterHeader(G, 
       'procedure BuildPropertiesProperty(EditProperties: TcxCustomEditProperties; CustomAttributes: TStrings; DAField: TDAField);',
       @TDevExpressModule.BuildPropertiesProperty);
  RegisterHeader(G, 
       'procedure BuildTreeView(TreeView: TcxDBTreeList; DataSource: TDADataSource);',
       @TDevExpressModule.BuildTreeView);
  RegisterHeader(G, 
       'procedure BuildTreeColumns(TreeView: TcxDBTreeList; DataSource: TDADataSource);',
       @TDevExpressModule.BuildTreeColumns);
  RegisterHeader(G, 
       'procedure BuildBandView(BandView: TcxGridDBBandedTableView; DataSource: TDADataSource);',
       @TDevExpressModule.BuildBandView);
  RegisterHeader(G, 
       'procedure BuildBandColumns(BandView: TcxGridDBBandedTableView; DataSource: TDADataSource);',
       @TDevExpressModule.BuildBandColumns);
  RegisterHeader(G, 
       'procedure BuildChartView(ChartView: TcxGridDBChartView; DataSource: TDADataSource);',
       @TDevExpressModule.BuildChartView);
  RegisterHeader(G, 
       'procedure BuildCardView(CardView: TcxGridDBCardView; DataSource: TDADataSource);',
       @TDevExpressModule.BuildCardView);
  RegisterHeader(G, 
       'procedure BuildCardRows(CardView: TcxGridDBCardView; DataSource: TDADataSource);',
       @TDevExpressModule.BuildCardRows);
  RegisterHeader(G, 
       'procedure BuildCardRow(CardRow: TcxGridDBCardViewRow; DAField: TDAField;      CardView: TcxGridDBCardView; DataSource: TDADataSource);',
       @TDevExpressModule.BuildCardRow);
  RegisterHeader(G, 
       'procedure BuildPivotGrid(PivotGrid: TcxDBPivotGrid; DataSource: TDADataSource);',
       @TDevExpressModule.BuildPivotGrid);
  RegisterHeader(G, 
       'procedure BuildFormView(AGroup: TdxlayoutGroup; ACustomData: TCustomData);',
       @TDevExpressModule.BuildFormView);
  RegisterHeader(G, 
       'procedure BuildFormView2(AGroup: TdxlayoutGroup; ADataSource: TDADataSource;      AFields: array of string; AControlWidth: Integer; ACaptionAlignTop: Boolean);',
       @TDevExpressModule.BuildFormView2);
  RegisterHeader(G, 
       'function BuildFormEditor(ADataSource: TDADataSource; ADAField: TDAField;      AOwner: TComponent; AEditorWidth: Integer): TcxCustomEdit;',
       @TDevExpressModule.BuildFormEditor);
  RegisterHeader(G, 
       'function FindDBControl(ARoot: TComponent; const AFieldName: string): TcxCustomEdit;',
       @TDevExpressModule.FindDBControl);
  RegisterFakeHeader(G, 
       'function TDevExpressModule_GetBarManager:TdxBarManager;',
       @TDevExpressModule_GetBarManager);
  RegisterFakeHeader(G, 
       'procedure TDevExpressModule_PutBarManager(const Value: TdxBarManager);',
       @TDevExpressModule_PutBarManager);
  RegisterProperty(G, 
       'property BarManager:TdxBarManager read TDevExpressModule_GetBarManager write TDevExpressModule_PutBarManager;');
  RegisterFakeHeader(G, 
       'function TDevExpressModule_GetNumColumnWidth:Integer;',
       @TDevExpressModule_GetNumColumnWidth);
  RegisterFakeHeader(G, 
       'procedure TDevExpressModule_PutNumColumnWidth(const Value: Integer);',
       @TDevExpressModule_PutNumColumnWidth);
  RegisterProperty(G, 
       'property NumColumnWidth:Integer read TDevExpressModule_GetNumColumnWidth write TDevExpressModule_PutNumColumnWidth;');
  RegisterFakeHeader(G, 
       'function TDevExpressModule_GetTextColumnWidth:Integer;',
       @TDevExpressModule_GetTextColumnWidth);
  RegisterFakeHeader(G, 
       'procedure TDevExpressModule_PutTextColumnWidth(const Value: Integer);',
       @TDevExpressModule_PutTextColumnWidth);
  RegisterProperty(G, 
       'property TextColumnWidth:Integer read TDevExpressModule_GetTextColumnWidth write TDevExpressModule_PutTextColumnWidth;');
  RegisterFakeHeader(G, 
       'function TDevExpressModule_GetOddRowColor:TColor;',
       @TDevExpressModule_GetOddRowColor);
  RegisterFakeHeader(G, 
       'procedure TDevExpressModule_PutOddRowColor(const Value: TColor);',
       @TDevExpressModule_PutOddRowColor);
  RegisterProperty(G, 
       'property OddRowColor:TColor read TDevExpressModule_GetOddRowColor write TDevExpressModule_PutOddRowColor;');
  RegisterFakeHeader(G, 
       'function TDevExpressModule_GetEvenRowColor:TColor;',
       @TDevExpressModule_GetEvenRowColor);
  RegisterFakeHeader(G, 
       'procedure TDevExpressModule_PutEvenRowColor(const Value: TColor);',
       @TDevExpressModule_PutEvenRowColor);
  RegisterProperty(G, 
       'property EvenRowColor:TColor read TDevExpressModule_GetEvenRowColor write TDevExpressModule_PutEvenRowColor;');
  RegisterFakeHeader(G, 
       'function TDevExpressModule_GetGridStyle:Integer;',
       @TDevExpressModule_GetGridStyle);
  RegisterFakeHeader(G,
       'procedure TDevExpressModule_PutGridStyle(const Value: Integer);',
       @TDevExpressModule_PutGridStyle);
  RegisterProperty(G, 
       'property GridStyle:Integer read TDevExpressModule_GetGridStyle write TDevExpressModule_PutGridStyle;');
  RegisterFakeHeader(G, 
       'function TDevExpressModule_GetDefaultIME:string;',
       @TDevExpressModule_GetDefaultIME);
  RegisterFakeHeader(G, 
       'procedure TDevExpressModule_PutDefaultIME(const Value: string);',
       @TDevExpressModule_PutDefaultIME);
  RegisterProperty(G, 
       'property DefaultIME:string read TDevExpressModule_GetDefaultIME write TDevExpressModule_PutDefaultIME;');
  RegisterHeader(G,
       'constructor Create(AOwner: TComponent); virtual;',
       @TDevExpressModule.Create);
  // End of class TDevExpressModule
  RegisterVariable(H, 'DevExpress: TDevExpressModule;',@DevExpress);
end;
initialization
  RegisterIMPORT_App_DevExpress;
end.

