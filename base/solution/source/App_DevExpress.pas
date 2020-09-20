unit App_DevExpress;

{
  DevExpress库

  Written by caowm (remobjects@qq.com)
  2014年9月
}

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
  uDAFields,
  uDAWhere,
  uDACore,
  uDASchemaClasses,
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
  // 皮肤用到的Unit，不要皮肤时删除SkinController
  dxGDIPlusAPI,
  dxSkinscxPCPainter,
  dxBar,
  dxCore,
  dxStatusBar,
  {由Organizer来加入所需皮肤
    dxSkinsdxBarPainter,
    dxSkinsdxStatusBarPainter,
    dxSkinBlue,
    dxSkinMcSkin,
    dxSkinLiquidSky,
    //  dxSkinBlack,
    //  dxSkinOffice2010Blue,
    //  dxSkinOffice2010Silver,
    //  dxSkinOffice2010Black,
    //  dxSkinOffice2007Green,
    //  dxSkinWhiteprint,
    //  dxSkinDevExpressDarkStyle,
    //  dxSkinHighContrast,
    //  dxSkinSeven,
    //  dxSkinDarkRoom,
    dxSkinDarkSide,
    dxSkinLilian,
    dxSkiniMaginary,
    dxSkinValentine,
    //  dxSkinTheAsphaltWorld,
    //  dxSkinsForm,
    // 皮肤结束
  }
  cxLocalization,
  cxFilter,
  cxData,
  cxButtonEdit,
  dxSkinsForm,
  cxNavigator,
  cxGridCustomLayoutView, dxBarBuiltInMenu,
  cxDataControllerConditionalFormattingRulesManagerDialog;

const
  iDefaultDataRowHeight = 0;
  iIndicatorWidth = 48;
  iNumColumnWidth = 60;
  iTextColumnWidth = 80;

  // DevExpress编辑控件
  DBEditorClasses: array [0 .. 26] of TcxCustomEditClass = (TcxDBPopupEdit,
    TcxDBCheckBox, TcxDBImageComboBox, TcxDBMemo, TcxDBComboBox, TcxDBDateEdit,
    TcxDBLookupComboBox, TcxDBSpinEdit, TcxDBButtonEdit, TcxDBMaskEdit,
    TcxDBCalcEdit, TcxDBCurrencyEdit, TcxDBCheckComboBox, TcxDBImage,
    TcxDBBlobEdit, TcxDBHyperLinkEdit, TcxDBColorComboBox, TcxDBLabel,
    TcxDBFontNameComboBox, TcxDBRichEdit, TdxDBColorEdit, TcxDBRadioGroup,
    TcxDBProgressBar, TcxDBTimeEdit, TcxDBShellComboBox, TcxDBTextEdit,
    TcxDBCheckGroup);

  // 对应控件的名称，注意要和DBEditorClasses一致
  DBEditorNames: array [0 .. 26] of string = ('PopupEdit', 'CheckBox',
    'ImageComboBox', 'Memo', 'ComboBox', 'DateEdit', 'LookupComboBox',
    'SpinEdit', 'ButtonEdit', 'MaskEdit', 'CalcEdit', 'CurrencyEdit',
    'CheckComboBox', 'Image', 'BlobEdit', 'HyperLinkEdit', 'ColorComboBox',
    'Label', 'FontNameComboBox', 'RichEdit', 'ColorEdit', 'RadioGroup',
    'ProgressBar', 'TimeEdit', 'ShellComboBox', 'TextEdit', 'CheckGroup');

type
  TOnGetLookupSouce = function(const ALogicalName: string)
    : TDADataSource of object;
  TOnBuildTableView = procedure(ATableView: TcxCustomGridTableView) of object;
  TOnBuildTreeView = procedure(ATreeView: TcxDBTreeList) of object;

  // 创建表格列、数据控件时调用
  TOnWrapProperties = procedure(AColumn: TComponent;
    AProperties: TcxCustomEditProperties; AField: TDAField;
    ADataSource: TDADataSource; ACustomAttributes: TStrings = nil) of object;

  TDevExpressModule = class(TDataModule)
    cxEditRepository: TcxEditRepository;
    cxEditCheckBox: TcxEditRepositoryCheckBoxItem;
    cxEditCurrencyEdit: TcxEditRepositoryCurrencyItem;
    cxEditDateEdit: TcxEditRepositoryDateItem;
    cxEditSpinEdit: TcxEditRepositorySpinItem;
    cxEditTextEdit: TcxEditRepositoryTextItem;
    cxEditTimeEdit: TcxEditRepositoryTimeItem;
    cxEditCalcEdit: TcxEditRepositoryCalcItem;
    cxEditImageComboBox: TcxEditRepositoryImageComboBoxItem;
    cxEditMemo: TcxEditRepositoryMemoItem;
    cxEditColorComboBox: TcxEditRepositoryColorComboBox;
    cxEditMaskEdit: TcxEditRepositoryMaskItem;
    cxEditBlobEdit: TcxEditRepositoryBlobItem;
    cxEditImage: TcxEditRepositoryImageItem;
    cxEditRichEdit: TcxEditRepositoryRichItem;
    cxEditLookupComboBox: TcxEditRepositoryLookupComboBoxItem;
    cxLookAndFeel: TcxLookAndFeelController;
    ExportDialog: TSaveDialog;
    cxStyleRepository: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    cxStyle6: TcxStyle;
    cxStyle7: TcxStyle;
    cxStyle8: TcxStyle;
    cxStyle9: TcxStyle;
    cxStyle10: TcxStyle;
    cxStyle11: TcxStyle;
    cxStyle12: TcxStyle;
    cxStyle13: TcxStyle;
    cxStyle14: TcxStyle;
    cxStyle15: TcxStyle;
    cxStyle16: TcxStyle;
    cxStyle17: TcxStyle;
    cxStyle18: TcxStyle;
    cxStyle19: TcxStyle;
    cxStyle20: TcxStyle;
    cxStyle21: TcxStyle;
    cxStyle22: TcxStyle;
    cxStyle23: TcxStyle;
    cxStyle24: TcxStyle;
    cxStyle25: TcxStyle;
    cxStyle26: TcxStyle;
    cxStyle27: TcxStyle;
    cxStyle28: TcxStyle;
    cxStyle29: TcxStyle;
    cxStyle30: TcxStyle;
    cxStyle31: TcxStyle;
    cxStyle32: TcxStyle;
    cxStyle33: TcxStyle;
    cxStyle34: TcxStyle;
    cxStyle35: TcxStyle;
    cxStyle36: TcxStyle;
    cxStyle37: TcxStyle;
    cxStyle38: TcxStyle;
    cxStyle39: TcxStyle;
    cxStyle40: TcxStyle;
    cxStyle41: TcxStyle;
    cxStyle42: TcxStyle;
    cxStyle43: TcxStyle;
    cxStyle44: TcxStyle;
    cxStyle45: TcxStyle;
    cxStyle46: TcxStyle;
    cxStyle47: TcxStyle;
    cxStyle48: TcxStyle;
    cxStyle49: TcxStyle;
    cxStyle50: TcxStyle;
    cxStyle51: TcxStyle;
    cxStyle52: TcxStyle;
    cxStyle53: TcxStyle;
    cxStyle54: TcxStyle;
    cxStyle55: TcxStyle;
    cxStyle56: TcxStyle;
    cxStyle57: TcxStyle;
    cxStyle58: TcxStyle;
    cxStyle59: TcxStyle;
    cxStyle60: TcxStyle;
    cxStyle61: TcxStyle;
    cxStyle62: TcxStyle;
    cxStyle63: TcxStyle;
    cxStyle64: TcxStyle;
    cxStyle65: TcxStyle;
    cxStyle66: TcxStyle;
    cxStyle67: TcxStyle;
    cxStyle68: TcxStyle;
    cxStyle69: TcxStyle;
    cxStyle70: TcxStyle;
    cxStyle71: TcxStyle;
    cxStyle72: TcxStyle;
    cxStyle73: TcxStyle;
    cxStyle74: TcxStyle;
    cxStyle75: TcxStyle;
    cxStyle76: TcxStyle;
    cxStyle77: TcxStyle;
    cxStyle78: TcxStyle;
    cxStyle79: TcxStyle;
    cxStyle80: TcxStyle;
    cxStyle81: TcxStyle;
    cxStyle82: TcxStyle;
    cxStyle83: TcxStyle;
    cxStyle84: TcxStyle;
    cxStyle85: TcxStyle;
    cxStyle86: TcxStyle;
    cxStyle87: TcxStyle;
    cxStyle88: TcxStyle;
    cxStyle89: TcxStyle;
    cxStyle90: TcxStyle;
    cxStyle91: TcxStyle;
    cxStyle92: TcxStyle;
    cxStyle93: TcxStyle;
    cxStyle94: TcxStyle;
    cxStyle95: TcxStyle;
    cxStyle96: TcxStyle;
    cxStyle97: TcxStyle;
    cxStyle98: TcxStyle;
    cxStyle99: TcxStyle;
    cxStyle100: TcxStyle;
    cxStyle101: TcxStyle;
    cxStyle102: TcxStyle;
    cxStyle103: TcxStyle;
    cxStyle104: TcxStyle;
    cxStyle105: TcxStyle;
    cxStyle106: TcxStyle;
    cxStyle107: TcxStyle;
    cxStyle108: TcxStyle;
    cxStyle109: TcxStyle;
    cxStyle110: TcxStyle;
    cxStyle111: TcxStyle;
    cxStyle112: TcxStyle;
    cxStyle113: TcxStyle;
    cxStyle114: TcxStyle;
    cxStyle115: TcxStyle;
    cxStyle116: TcxStyle;
    cxStyle117: TcxStyle;
    cxStyle118: TcxStyle;
    cxStyle119: TcxStyle;
    cxStyle120: TcxStyle;
    cxStyle121: TcxStyle;
    cxStyle122: TcxStyle;
    cxStyle123: TcxStyle;
    cxStyle124: TcxStyle;
    cxStyle125: TcxStyle;
    cxStyle126: TcxStyle;
    cxStyle127: TcxStyle;
    cxStyle128: TcxStyle;
    cxStyle129: TcxStyle;
    cxStyle130: TcxStyle;
    cxStyle131: TcxStyle;
    cxStyle132: TcxStyle;
    cxStyle133: TcxStyle;
    cxStyle134: TcxStyle;
    cxStyle135: TcxStyle;
    cxStyle136: TcxStyle;
    cxStyle137: TcxStyle;
    cxStyle138: TcxStyle;
    cxStyle139: TcxStyle;
    cxStyle140: TcxStyle;
    cxStyle141: TcxStyle;
    cxStyle142: TcxStyle;
    cxStyle143: TcxStyle;
    cxStyle144: TcxStyle;
    cxStyle145: TcxStyle;
    cxStyle146: TcxStyle;
    cxStyle147: TcxStyle;
    cxStyle148: TcxStyle;
    cxStyle149: TcxStyle;
    cxStyle150: TcxStyle;
    cxStyle151: TcxStyle;
    cxStyle152: TcxStyle;
    cxStyle153: TcxStyle;
    cxStyle154: TcxStyle;
    cxStyle155: TcxStyle;
    cxStyle156: TcxStyle;
    cxStyle157: TcxStyle;
    cxStyle158: TcxStyle;
    cxStyle159: TcxStyle;
    cxStyle160: TcxStyle;
    cxStyle161: TcxStyle;
    cxStyle162: TcxStyle;
    cxStyle163: TcxStyle;
    cxStyle164: TcxStyle;
    cxStyle165: TcxStyle;
    cxStyle166: TcxStyle;
    cxStyle167: TcxStyle;
    cxStyle168: TcxStyle;
    cxStyle169: TcxStyle;
    cxStyle170: TcxStyle;
    cxStyle171: TcxStyle;
    cxStyle172: TcxStyle;
    cxStyle173: TcxStyle;
    cxStyle174: TcxStyle;
    cxStyle175: TcxStyle;
    cxStyle176: TcxStyle;
    cxStyle177: TcxStyle;
    cxStyle178: TcxStyle;
    cxStyle179: TcxStyle;
    cxStyle180: TcxStyle;
    cxStyle181: TcxStyle;
    cxStyle182: TcxStyle;
    cxStyle183: TcxStyle;
    cxStyle184: TcxStyle;
    cxStyle185: TcxStyle;
    cxStyle186: TcxStyle;
    cxStyle187: TcxStyle;
    cxStyle188: TcxStyle;
    cxStyle189: TcxStyle;
    cxStyle190: TcxStyle;
    cxStyle191: TcxStyle;
    cxStyle192: TcxStyle;
    cxStyle193: TcxStyle;
    cxStyle194: TcxStyle;
    cxStyle195: TcxStyle;
    cxStyle196: TcxStyle;
    cxStyle197: TcxStyle;
    cxStyle198: TcxStyle;
    cxStyle199: TcxStyle;
    cxStyle200: TcxStyle;
    cxStyle201: TcxStyle;
    cxStyle202: TcxStyle;
    cxStyle203: TcxStyle;
    cxStyle204: TcxStyle;
    cxStyle205: TcxStyle;
    GridDevExpress: TcxGridTableViewStyleSheet;
    GridRose: TcxGridTableViewStyleSheet;
    GridPumpkinlarge: TcxGridTableViewStyleSheet;
    BandDevExpress: TcxGridBandedTableViewStyleSheet;
    BandRose: TcxGridBandedTableViewStyleSheet;
    BandPumpkinlarge: TcxGridBandedTableViewStyleSheet;
    CardDevExpress: TcxGridCardViewStyleSheet;
    CardRose: TcxGridCardViewStyleSheet;
    CardPumpkinlarge: TcxGridCardViewStyleSheet;
    GridSpruce: TcxGridTableViewStyleSheet;
    BandSpruce: TcxGridBandedTableViewStyleSheet;
    CardSpruce: TcxGridCardViewStyleSheet;
    PivotRose: TcxPivotGridStyleSheet;
    PivotSpruce: TcxPivotGridStyleSheet;
    PivotPumpkinlarge: TcxPivotGridStyleSheet;
    PivotDevExpress: TcxPivotGridStyleSheet;
    TreeDevExpress: TcxTreeListStyleSheet;
    TreePumpkinLarge: TcxTreeListStyleSheet;
    TreeRose: TcxTreeListStyleSheet;
    TreeSpruce: TcxTreeListStyleSheet;
    dxLayoutLook: TdxLayoutLookAndFeelList;
    cxEditButtonEdit: TcxEditRepositoryButtonItem;
    cxEditCheckComboBox: TcxEditRepositoryCheckComboBox;
    cxEditComboBox: TcxEditRepositoryComboBoxItem;
    cxEditHyperLinkEdit: TcxEditRepositoryHyperLinkItem;
    cxEditFontNameComboBox: TcxEditRepositoryFontNameComboBox;
    cxEditLabel: TcxEditRepositoryLabel;
    cxEditProgressBar: TcxEditRepositoryProgressBar;
    cxEditRadioGroup: TcxEditRepositoryRadioGroupItem;
    cxEditShellComboBox: TcxEditRepositoryShellComboBoxItem;
    GridPopupMenu: TcxGridPopupMenu;
    EditStyleController: TcxDefaultEditStyleController;
    ViewRepository: TcxGridViewRepository;
    dxLayoutFeelToolbar: TdxLayoutCxLookAndFeel;
    cxLocalizer: TcxLocalizer;
    dxSkinController: TdxSkinController;
    dxLayoutWebFeel: TdxLayoutWebLookAndFeel;
    dxLayoutPage: TdxLayoutSkinLookAndFeel;
    cxEditPopupEdit: TcxEditRepositoryPopupItem;
    dxLayoutDialog: TdxLayoutSkinLookAndFeel;
    cxEditColorEdit: TcxEditRepositoryColorEdit;
    dxLayoutPageEmbed: TdxLayoutSkinLookAndFeel;
    ViewRepositoryTableView1: TcxGridTableView;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    FStyle: Integer; // 对应StyleSheet中四种风格
    FOddColor, FEvenColor: TColor; // 双色
    FNumColumnWidth, FTextColumnWidth: Integer; // 数字、字符列默认宽度
    FGridStyleListeners: TList;
    FTreeStyleListeners: TList;
    FPivotStyleListeners: TList;
    FOnGetLookupSource: TOnGetLookupSouce;
    FOnBuildTableView: TOnBuildTableView;
    FOnBuildTreeView: TOnBuildTreeView;
    FOnWrapPropperties: TOnWrapProperties;
    FSkinIndex: Integer;
    FBarManager: TdxBarManager;
    FDefaultIME: string;

    procedure StyleChanged();
    function GetBarManager(): TdxBarManager;
    procedure DoTableViewMouseWheel(Sender: TObject; Shift: TShiftState;
      WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
    procedure DoTableViewGetProperties(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AProperties: TcxCustomEditProperties);
  protected
    procedure Notification(AComponent: TComponent;
      Operation: Classes.TOperation); override;
  public
    procedure ExportGrid(AGrid: TcxGrid; ShowDialog: Boolean = True;
      const DefaultFileName: string = '');
    procedure ExportPivot(APivot: TcxCustomPivotGrid);
    procedure ExportTreeList(ATreeList: TcxCustomTreeList);

    procedure FillSkinNames(List: TStrings);
    procedure SetSkinIndex(AIndex: Integer);
    function GetSkinIndex(): Integer;

    procedure SetStyle(Index: Integer);
    function GetGridStyle: TcxGridTableViewStyles;
    function GetBandStyle: TcxGridBandedTableViewStyles;
    function GetCardStyle: TcxGridCardViewStyles;
    function GetPivotStyle: TcxPivotGridStyles;
    function GetTreeStyle: TcxTreeListStyles;
    function GetStyle(const StyleName: string): TcxCustomStyle;

    procedure RegisterGridStyleListener(AListener: TcxCustomGridTableView);
    procedure UnRegisterGridStyleListener(AListener: TcxCustomGridTableView);

    procedure RegisterTreeStyleListener(AListener: TcxCustomTreeList);
    procedure UnRegisterTreeStyleListener(AListener: TcxCustomTreeList);

    procedure RegisterPivotStyleListener(AListener: TcxCustomPivotGrid);
    procedure UnRegisterPivotStyleListener(AListener: TcxCustomPivotGrid);

    procedure cxTableViewCustomDrawIndicatorCell(Sender: TcxGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxCustomGridIndicatorItemViewInfo;
      var ADone: Boolean);
    procedure cxTableViewCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);

    procedure SetcxLookupProperties(DBColumn: TcxCustomGridTableItem;
      DataSource: TDataSource; const KeyFieldNames, ListFieldNames: string;
      ListFieldIndex, ListFieldIndex2: Integer); overload;
    procedure SetcxLookupProperties(Properties: TcxLookupComboBoxProperties;
      DataSource: TDataSource; const KeyFieldNames, ListFieldNames: string;
      ListFieldIndex, ListFieldIndex2: Integer); overload;

    // EditType=Blob,Button,Calc,CheckBox,CheckComboBox,CheckGroup,Color,...
    function GetRepositoryItem(const EditType: string): TcxEditRepositoryItem;
    function GetProperties(const EditType: string): TcxCustomEditProperties;
    function GetPropertiesClass(const EditType: string)
      : TcxCustomEditPropertiesClass;
    function GetDBControlClass(const EditType: string): TcxCustomEditClass;

    // 使用DataTable的Schema初始化TableView
    procedure BuildTableView(TableView: TcxGridDBTableView;
      DataSource: TDADataSource);
    procedure BuildGridColumns(TableView: TcxGridDBTableView;
      DataSource: TDADataSource);
    procedure BuildGridColumn(Column: TcxGridColumn; DAField: TDAField;
      DataSource: TDADataSource);
    procedure BuildProperties(AColumn: TComponent;
      EditProperties: TcxCustomEditProperties; DAField: TDAField;
      DataSource: TDADataSource);
    procedure BuildPropertiesProperty(EditProperties: TcxCustomEditProperties;
      CustomAttributes: TStrings; DAField: TDAField);

    procedure BuildTreeView(TreeView: TcxDBTreeList; DataSource: TDADataSource);
    procedure BuildTreeColumns(TreeView: TcxDBTreeList;
      DataSource: TDADataSource);

    procedure BuildBandView(BandView: TcxGridDBBandedTableView;
      DataSource: TDADataSource);
    procedure BuildBandColumns(BandView: TcxGridDBBandedTableView;
      DataSource: TDADataSource);

    procedure BuildChartView(ChartView: TcxGridDBChartView;
      DataSource: TDADataSource);

    procedure BuildCardView(CardView: TcxGridDBCardView;
      DataSource: TDADataSource);
    procedure BuildCardRows(CardView: TcxGridDBCardView;
      DataSource: TDADataSource);
    procedure BuildCardRow(CardRow: TcxGridDBCardViewRow; DAField: TDAField;
      CardView: TcxGridDBCardView; DataSource: TDADataSource);

    procedure BuildPivotGrid(PivotGrid: TcxDBPivotGrid;
      DataSource: TDADataSource);

    procedure BuildFormView(AGroup: TdxlayoutGroup; ACustomData: TCustomData);
    procedure BuildFormView2(AGroup: TdxlayoutGroup; ADataSource: TDADataSource;
      AFields: array of string; AControlWidth: Integer;
      ACaptionAlignTop: Boolean);
    function BuildFormEditor(ADataSource: TDADataSource; ADAField: TDAField;
      AOwner: TComponent; AEditorWidth: Integer): TcxCustomEdit;

    function FindDBControl(ARoot: TComponent; const AFieldName: string)
      : TcxCustomEdit;

    property BarManager: TdxBarManager read GetBarManager write FBarManager;
    property NumColumnWidth: Integer read FNumColumnWidth write FNumColumnWidth;
    property TextColumnWidth: Integer read FTextColumnWidth
      write FTextColumnWidth;
    property OddRowColor: TColor read FOddColor write FOddColor;
    property EvenRowColor: TColor read FEvenColor write FEvenColor;
    property GridStyle: Integer read FStyle write SetStyle;
    property OnGetLookupSource: TOnGetLookupSouce read FOnGetLookupSource
      write FOnGetLookupSource;
    property OnBuildTableView: TOnBuildTableView read FOnBuildTableView
      write FOnBuildTableView;
    property OnBuildTreeView: TOnBuildTreeView read FOnBuildTreeView
      write FOnBuildTreeView;
    property OnWrapProperties: TOnWrapProperties read FOnWrapPropperties
      write FOnWrapPropperties;
    property DefaultIME: string read FDefaultIME write FDefaultIME;
  end;

var
  DevExpress: TDevExpressModule;

implementation

{$R *.dfm}
{$R DevExpress.res} // DevExpress汉化资源

const
  cDevSection = 'DevExpress';

type
  TcxCustomEditAccess = class(TcxCustomEdit);

  { TDevExpressModule }

procedure TDevExpressModule.cxTableViewCustomDrawCell
  (Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  if (not AViewInfo.GridRecord.Selected) then
    case AViewInfo.GridRecord.Index mod 2 of
      1:
        ACanvas.Brush.Color := FOddColor;
    else
      ACanvas.Brush.Color := FEvenColor;
    end;
end;

procedure TDevExpressModule.cxTableViewCustomDrawIndicatorCell
  (Sender: TcxGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxCustomGridIndicatorItemViewInfo; var ADone: Boolean);
var
  AIndicatorViewInfo: TcxGridIndicatorRowItemViewInfo;
  ATextRect: TRect;
begin
  // Draw the num indicator
  if not(AViewInfo is TcxGridIndicatorRowItemViewInfo) then
    Exit;
  ATextRect := AViewInfo.ContentBounds;
  AIndicatorViewInfo := AViewInfo as TcxGridIndicatorRowItemViewInfo;
  InflateRect(ATextRect, 2, 1);
  if AIndicatorViewInfo.GridRecord.Selected then
  begin
    ACanvas.Font.Color := clRed;
    // ACanvas.Font.Style := [fsBold];
  end;
  Sender.LookAndFeelPainter.DrawHeader(ACanvas, AViewInfo.ContentBounds,
    ATextRect, [], cxBordersAll, cxbsNormal, taCenter, vaCenter, False, False,
    IntToStr(AIndicatorViewInfo.GridRecord.Index + 1), ACanvas.Font,
    ACanvas.Font.Color, ACanvas.Brush.Color);
  ADone := True;
end;

procedure TDevExpressModule.ExportGrid(AGrid: TcxGrid;
  ShowDialog: Boolean = True; const DefaultFileName: string = '');
begin
  // todo: TcxGridDBBandedTableView表头不能超过2层，否则报错???
  if (DefaultFileName = '') or ShowDialog then
  begin
    if DefaultFileName = '' then
      ExportDialog.FileName := AGrid.ActiveLevel.Caption
    else
      ExportDialog.FileName := DefaultFileName;
    with ExportDialog do
      if Execute then
      begin
        case ExportDialog.FilterIndex of
          1:
            ExportGridToExcel(FileName, AGrid, False, True, True);
          2:
            ExportGridToText(FileName, AGrid, True);
          3:
            ExportGridToHTML(FileName, AGrid, True);
          4:
            ExportGridToXML(FileName, AGrid, True);
        end;
      end;
  end
  else
    ExportGridToExcel(DefaultFileName, AGrid, True, True, True);
end;

procedure TDevExpressModule.ExportPivot(APivot: TcxCustomPivotGrid);
begin
  // ExportDialog.FileName := AGrid.ActiveLevel.Caption;
  with ExportDialog do
    if Execute then
    begin
      case ExportDialog.FilterIndex of
        1:
          cxExportPivotGridToExcel(FileName, APivot, False, False);
        2:
          cxExportPivotGridToText(FileName, APivot);
        3:
          cxExportPivotGridToHTML(FileName, APivot, False);
        4:
          cxExportPivotGridToXML(FileName, APivot, False);
      end;
    end;
end;

procedure TDevExpressModule.ExportTreeList(ATreeList: TcxCustomTreeList);
begin
  with ExportDialog do
    if Execute then
    begin
      case ExportDialog.FilterIndex of
        1:
          cxExportTLToExcel(FileName, ATreeList);
        2:
          cxExportTLToText(FileName, ATreeList);
        3:
          cxExportTLToHTML(FileName, ATreeList);
        4:
          cxExportTLToXML(FileName, ATreeList);
      end;
    end;
end;

function TDevExpressModule.GetBandStyle: TcxGridBandedTableViewStyles;
begin
  case FStyle of
    0:
      Result := BandDevExpress.Styles;
    1:
      Result := BandRose.Styles;
    2:
      Result := BandPumpkinlarge.Styles;
    3:
      Result := BandSpruce.Styles;
  else
    Result := nil;
  end;
end;

function TDevExpressModule.GetCardStyle: TcxGridCardViewStyles;
begin
  case FStyle of
    0:
      Result := CardDevExpress.Styles;
    1:
      Result := CardRose.Styles;
    2:
      Result := CardPumpkinlarge.Styles;
    3:
      Result := CardSpruce.Styles;
  else
    Result := nil;
  end;
end;

function TDevExpressModule.GetGridStyle: TcxGridTableViewStyles;
begin
  case FStyle of
    0:
      Result := GridDevExpress.Styles;
    1:
      Result := GridRose.Styles;
    2:
      Result := GridPumpkinlarge.Styles;
    3:
      Result := GridSpruce.Styles;
  else
    Result := nil;
  end;
end;

function TDevExpressModule.GetPivotStyle: TcxPivotGridStyles;
begin
  case FStyle of
    0:
      Result := PivotDevExpress.Styles;
    1:
      Result := PivotRose.Styles;
    2:
      Result := PivotPumpkinlarge.Styles;
    3:
      Result := PivotSpruce.Styles;
  else
    Result := nil;
  end;
end;

function TDevExpressModule.GetTreeStyle: TcxTreeListStyles;
begin
  case FStyle of
    0:
      Result := TreeDevExpress.Styles;
    1:
      Result := TreeRose.Styles;
    2:
      Result := TreePumpkinLarge.Styles;
    3:
      Result := TreeSpruce.Styles;
  else
    Result := nil;
  end;
end;

procedure TDevExpressModule.RegisterGridStyleListener
  (AListener: TcxCustomGridTableView);
begin
  if FGridStyleListeners.IndexOf(AListener) = -1 then
  begin
    AListener.Styles := GetGridStyle();
    FGridStyleListeners.Add(AListener);
    AListener.FreeNotification(Self);
  end;
end;

procedure TDevExpressModule.SetcxLookupProperties
  (Properties: TcxLookupComboBoxProperties; DataSource: TDataSource;
  const KeyFieldNames, ListFieldNames: string;
  ListFieldIndex, ListFieldIndex2: Integer);
begin
  Properties.DropDownAutoSize := True;

  Properties.KeyFieldNames := KeyFieldNames;
  Properties.ListFieldNames := ListFieldNames;
  Properties.ListFieldIndex := ListFieldIndex;
  // Properties.ListFieldIndex2 := ListFieldIndex2;
  Properties.ListSource := DataSource;
  Properties.DropDownSizeable := True;
end;

procedure TDevExpressModule.SetcxLookupProperties
  (DBColumn: TcxCustomGridTableItem; DataSource: TDataSource;
  const KeyFieldNames, ListFieldNames: string;
  ListFieldIndex, ListFieldIndex2: Integer);
begin
  DBColumn.PropertiesClass := TcxLookupComboBoxProperties;
  SetcxLookupProperties(TcxLookupComboBoxProperties(DBColumn.Properties),
    DataSource, KeyFieldNames, ListFieldNames, ListFieldIndex, ListFieldIndex2);
end;

procedure TDevExpressModule.SetStyle(Index: Integer);
begin
  if FStyle <> Index then
  begin
    FStyle := Index;
    StyleChanged();
  end;
end;

procedure TDevExpressModule.StyleChanged;
var
  I: Integer;
begin
  for I := FGridStyleListeners.Count - 1 downto 0 do
    try
      TcxCustomGridTableView(FGridStyleListeners[I]).Styles.ResetStyles;
      TcxCustomGridTableView(FGridStyleListeners[I]).Styles := GetGridStyle;
    except
      // 忽略已经释放，但没有注销的监听者
      FGridStyleListeners.Delete(I);
    end;

  for I := FTreeStyleListeners.Count - 1 downto 0 do
    try
      // TcxCustomTreeList(FGridStyleListeners[I]).Styles.ResetStyles;
      TcxCustomTreeList(FTreeStyleListeners[I]).Styles := GetTreeStyle;
    except
      // 忽略已经释放，但没有注销的监听者
      FTreeStyleListeners.Delete(I);
    end;

  for I := FPivotStyleListeners.Count - 1 downto 0 do
    try
      TcxCustomPivotGrid(FGridStyleListeners[I]).Styles.ResetStyles;
      TcxCustomPivotGrid(FPivotStyleListeners[I]).Styles := GetPivotStyle;
    except
      // 忽略已经释放，但没有注销的监听者
      FPivotStyleListeners.Delete(I);
    end;
end;

procedure TDevExpressModule.UnRegisterGridStyleListener
  (AListener: TcxCustomGridTableView);
begin
  if FGridStyleListeners.IndexOf(AListener) > -1 then
    FGridStyleListeners.Remove(AListener);
  AListener.Styles := GetGridStyle;
end;

procedure TDevExpressModule.DataModuleCreate(Sender: TObject);
begin
  // 设置语言
  // 直接指定Languages中的Index
  cxLocalizer.LanguageIndex := 0;

  // 或者直接指定language的名称，没有方法用LocaleID来指定，可以自定义此方法
  // 名称在不同的系统里面不同，不能使用
  // cxLocalizer.Language := '中文(简体，中国)';     //Win7是这个名称

  FGridStyleListeners := TList.Create;
  FTreeStyleListeners := TList.Create;
  FPivotStyleListeners := TList.Create;

  FNumColumnWidth := iNumColumnWidth;
  FTextColumnWidth := iTextColumnWidth;

  with AppCore.IniFile do
  begin
    EditStyleController.Style.Font.Size :=
      ReadInteger(cDevSection, 'FontSize', 10);
    EditStyleController.Style.Font.Name :=
      ReadString(cDevSection, 'FontName', '宋体');
    EditStyleController.Style.Font.Color :=
      ReadInteger(cDevSection, 'FontColor', clWindowText);
    EditStyleController.StyleFocused.Color :=
      ReadInteger(cDevSection, 'FocusedColor',
      EditStyleController.StyleFocused.Color);

    FOddColor := ReadInteger(cDevSection, 'OddRowColor', $00B0B0FF);
    FEvenColor := ReadInteger(cDevSection, 'EvenRowColor', clWhite);
    GridStyle := ReadInteger(cDevSection, 'GridStyle', -1);

    FSkinIndex := ReadInteger(cDevSection, 'SkinIndex', 99);
    SetSkinIndex(FSkinIndex);

    FDefaultIME := ReadString(cDevSection, 'DefaultIME', '');
    if ((FDefaultIME = '') or (Screen.Imes.IndexOf(FDefaultIME) < 0)) and
      (Screen.Imes.Count > 0) then
      FDefaultIME := Screen.Imes[0];
  end;
end;

procedure TDevExpressModule.DataModuleDestroy(Sender: TObject);
begin
  try
    // OnDestroy在component的子组件释放前调用，所以在Notifcation中要判断
    // FGridStyleListeners的值
    FreeAndNil(FGridStyleListeners);
    FreeAndNil(FTreeStyleListeners);
    FreeAndNil(FPivotStyleListeners);

    with AppCore.IniFile do
    begin
      WriteInteger(cDevSection, 'SkinIndex', FSkinIndex);

      WriteInteger(cDevSection, 'GridStyle', GridStyle);
      WriteInteger(cDevSection, 'FontSize',
        EditStyleController.Style.Font.Size);
      WriteString(cDevSection, 'FontName', EditStyleController.Style.Font.Name);
      WriteInteger(cDevSection, 'FontColor',
        EditStyleController.Style.Font.Color);
      // WriteInteger(cDevSection, 'FocusedColor', EditStyleController.StyleFocused.Color);

      WriteString(cDevSection, 'DefaultIME', FDefaultIME);
    end;
  except
    on E: Exception do
      AppCore.Logger.Write(E.Message, mtInfo, 0);
  end;
end;

procedure TDevExpressModule.BuildTableView(TableView: TcxGridDBTableView;
  DataSource: TDADataSource);
var
  Value: string;
  Attr: TStrings;
  DataTable: TDADataTable;
begin
  Assert(DataSource <> nil);
  Assert(DataSource.DataTable <> nil);

  // RegisterGridStyleListener(TableView);

  // 确保DataTable的Schema可用
  DataTable := DataSource.DataTable;
  Attr := DataTable.CustomAttributes;
  with TableView do
  begin
    BeginUpdate;
    try
      OnMouseWheel := DoTableViewMouseWheel;
      ClearItems;
      DataController.Summary.DefaultGroupSummaryItems.Clear;
      // FilterBox.Visible := fvNonEmpty;

      // 不区分大小写对筛选性能有一点影响
      DataController.Filter.Options := DataController.Filter.Options +
        [fcoCaseInsensitive];
      OptionsCustomize.ColumnHidingOnGrouping := False;
      OptionsCustomize.ColumnsQuickCustomization := True;
      OptionsCustomize.DataRowSizing := True;
      OptionsCustomize.ColumnFiltering := True;
      OptionsData.Deleting := False;
      OptionsData.Inserting := False;
      OptionsData.Editing := DataSource.AutoEdit;

      // OptionsSelection.MultiSelect := True;
      // OptionsSelection.HideSelection := False;
      // OptionsSelection.InvertSelect := True;

      OptionsView.GroupByBox := True;
      OptionsView.GroupSummaryLayout := gslAlignWithColumnsAndDistribute;
      OptionsView.Indicator := True;
      OptionsView.IndicatorWidth := iIndicatorWidth;
      OptionsView.DataRowHeight := iDefaultDataRowHeight;
      // OptionsView.GroupFooters := gfVisibleWhenExpanded;
      // OptionsView.ShowEditButtons := gsebForFocusedRecord;
      // OptionsView.Navigator := False;
      // OptionsView.HeaderHeight := iDefaultDataRowHeight;
      // OptionsView.GroupRowHeight := iDefaultDataRowHeight;

      OptionsBehavior.NavigatorHints := True;
      OptionsBehavior.GoToNextCellOnEnter := True;
      OptionsBehavior.FocusCellOnCycle := True;
      OptionsBehavior.FocusFirstCellOnNewRecord := True;
      OptionsBehavior.BestFitMaxRecordCount := 50;

      DataController.DataSource := DataSource;
      OnCustomDrawIndicatorCell := cxTableViewCustomDrawIndicatorCell;
      Styles := GetGridStyle;

      DataController.CreateAllItems;
      DataController.KeyFieldNames := Attr.Values['KeyFieldNames'];

      Value := Attr.Values['OptionsData.Editing'];
      if Value <> '' then
        OptionsData.Editing := StrToBoolDef(Value, False);

      Value := Attr.Values['OptionsData.Deleting'];
      if Value <> '' then
        OptionsData.Deleting := StrToBoolDef(Value, False);

      Value := Attr.Values['OptionsData.Inserting'];
      if Value <> '' then
        OptionsData.Inserting := StrToBoolDef(Value, False);

      Value := Attr.Values['OptionsView.GroupByBox'];
      if Value <> '' then
        OptionsView.GroupByBox := StrToBoolDef(Value, False);

      Value := Attr.Values['OptionsView.ShowEditButtons'];
      if Value <> '' then
        OptionsView.ShowEditButtons := TcxGridShowEditButtons
          (GetEnumValue(TypeInfo(TcxGridShowEditButtons), Value));

      Value := Attr.Values['OptionsView.IndicatorWidth'];
      if Value <> '' then
        OptionsView.IndicatorWidth := StrToIntDef(Value, iIndicatorWidth);

      Value := Attr.Values['OptionsView.DataRowHeight'];
      if Value <> '' then
        OptionsView.DataRowHeight := StrToIntDef(Value, iDefaultDataRowHeight);

      Value := Attr.Values['OptionsView.CellAutoHeight'];
      if Value <> '' then
        OptionsView.CellAutoHeight := StrToBoolDef(Value, False);

      Value := Attr.Values['OptionsView.Footer'];
      if Value <> '' then
        OptionsView.Footer := StrToBoolDef(Value, False);

      Value := Attr.Values['OptionsSelection.MultiSelect'];
      if Value <> '' then
        OptionsSelection.MultiSelect := StrToBoolDef(Value, False);

      Value := Attr.Values['OptionsCustomize.ColumnSorting'];
      if Value <> '' then
        OptionsCustomize.ColumnSorting := StrToBoolDef(Value, True);

      Value := Attr.Values['BackgroundBitmaps'];
      if Value <> '' then
        BackgroundBitmaps.Background.Assign(AppCore.ImageCenter.Get(Value));

      // Value := Attr.Values['Preview.Column'];
      // if Value <> '' then
      // begin
      // Preview.Visible := True;
      // Preview.Column := GetColumnByFieldName(Value);
      // end;

      BuildGridColumns(TableView, DataSource);

      if Assigned(FOnBuildTableView) then
        FOnBuildTableView(TableView);
    finally
      EndUpdate;
    end;
  end;
end;

procedure TDevExpressModule.BuildGridColumns(TableView: TcxGridDBTableView;
  DataSource: TDADataSource);
var
  I: Integer;
  Column: TcxGridDBColumn;
  DataTable: TDADataTable;
begin
  DataTable := DataSource.DataTable;
  for I := 0 to DataTable.FieldCount - 1 do
  begin
    Column := TableView.GetColumnByFieldName(DataTable.Fields[I].Name);
    if Column <> nil then
      BuildGridColumn(Column, DataTable.Fields[I], DataSource);
  end;
end;

function TDevExpressModule.GetRepositoryItem(const EditType: string)
  : TcxEditRepositoryItem;
begin
  Result := cxEditRepository.ItemByName('cxEdit' + EditType)
end;

function TDevExpressModule.GetProperties(const EditType: string)
  : TcxCustomEditProperties;
var
  RepositoryItem: TcxEditRepositoryItem;
begin
  Result := cxEditTextEdit.Properties;
  if EditType <> '' then
  begin
    RepositoryItem := GetRepositoryItem(EditType);
    if RepositoryItem <> nil then
      Result := RepositoryItem.Properties
  end
end;

function TDevExpressModule.GetPropertiesClass(const EditType: string)
  : TcxCustomEditPropertiesClass;
var
  RepositoryItem: TcxEditRepositoryItem;
begin
  Result := TcxTextEditProperties;
  if EditType <> '' then
  begin
    RepositoryItem := GetRepositoryItem(EditType);
    if RepositoryItem <> nil then
      Result := RepositoryItem.GetEditPropertiesClass
  end;
end;

function TDevExpressModule.GetDBControlClass(const EditType: string)
  : TcxCustomEditClass;
var
  I: Integer;
begin
  Result := TcxDBTextEdit;
  if EditType = '' then
    Exit;

  for I := 0 to High(DBEditorClasses) do
    if SameText(EditType, DBEditorNames[I]) then
    begin
      Result := DBEditorClasses[I];
      Break;
    end;
end;

procedure TDevExpressModule.Notification(AComponent: TComponent;
  Operation: Classes.TOperation);
begin
  if not(csDestroying in ComponentState) and (Operation = opRemove) then
  begin
    if (FGridStyleListeners <> nil) and
      (FGridStyleListeners.IndexOf(AComponent) > -1) then
      FGridStyleListeners.Remove(AComponent)
    else if (FTreeStyleListeners <> nil) and
      (FTreeStyleListeners.IndexOf(AComponent) > -1) then
      FTreeStyleListeners.Remove(AComponent)
    else if (FPivotStyleListeners <> nil) and
      (FPivotStyleListeners.IndexOf(AComponent) > -1) then
      FPivotStyleListeners.Remove(AComponent)
  end;
  inherited;
end;

procedure TDevExpressModule.BuildBandColumns(BandView: TcxGridDBBandedTableView;
  DataSource: TDADataSource);
var
  I, CurBand: Integer;
  Value: Variant;
  Attr: TStrings;
  Column: TcxGridDBBandedColumn;
  DataTable: TDADataTable;
begin
  CurBand := -1; // 当前Band索引
  DataTable := DataSource.DataTable;
  for I := 0 to DataTable.FieldCount - 1 do
  begin
    Attr := DataTable.Fields[I].CustomAttributes;
    Column := TcxGridDBBandedColumn(BandView.DataController.GetItemByFieldName
      (DataTable.Fields[I].Name));
    if Column = nil then
      Continue;

    BuildGridColumn(Column, DataTable.Fields[I], DataSource);

    Value := Attr.Values['BandCaption'];
    if Value <> '' then
      with BandView.Bands.Add do
      begin
        CurBand := Index;
        Caption := Value
      end;

    Column.Position.BandIndex := CurBand;

    if CurBand = 0 then
      BandView.Bands[0].FixedKind := fkLeft;

    Value := Attr.Values['Position.ColIndex'];
    if Value <> '' then
      Column.Position.ColIndex := StrToIntDef(Value, 0);

    Value := Attr.Values['Position.LineCount'];
    if Value <> '' then
      Column.Position.LineCount := StrToIntDef(Value, 1);

    Value := Attr.Values['Position.RowIndex'];
    if Value <> '' then
      Column.Position.RowIndex := StrToIntDef(Value, 0);

  end;
end;

procedure TDevExpressModule.BuildBandView(BandView: TcxGridDBBandedTableView;
  DataSource: TDADataSource);
var
  Value: Variant;
  Attr: TStrings;
begin
  Assert(DataSource <> nil);
  Assert(DataSource.DataTable <> nil);

  // RegisterGridStyleListener(BandView);

  Attr := DataSource.DataTable.CustomAttributes;
  with BandView do
  begin
    BeginUpdate;
    try
      OnMouseWheel := DoTableViewMouseWheel;
      ClearItems;
      Bands.Clear;
      Styles := GetBandStyle();

      DataController.DataSource := DataSource;
      DataController.CreateAllItems; // 没有创建RecID列，与TableView有区别
      DataController.Filter.Options := DataController.Filter.Options +
        [fcoCaseInsensitive];
      OnCustomDrawIndicatorCell := cxTableViewCustomDrawIndicatorCell;

      OptionsView.Indicator := True;
      OptionsView.IndicatorWidth := iIndicatorWidth;
      OptionsView.GroupByBox := True;
      // OptionsView.ShowEditButtons := gsebForFocusedRecord;
      OptionsCustomize.ColumnHidingOnGrouping := False;
      OptionsCustomize.ColumnsQuickCustomization := True;
      OptionsCustomize.BandsQuickCustomization := True;
      OptionsCustomize.DataRowSizing := True;

      OptionsData.Deleting := False;
      OptionsData.Inserting := False;
      OptionsData.Editing := DataSource.AutoEdit;

      OptionsBehavior.NavigatorHints := True;
      OptionsBehavior.GoToNextCellOnEnter := True;
      OptionsBehavior.FocusCellOnCycle := True;
      OptionsBehavior.FocusFirstCellOnNewRecord := True;
      OptionsBehavior.BestFitMaxRecordCount := 50;

      DataController.KeyFieldNames := Attr.Values['KeyFieldNames'];

      Value := Attr.Values['OptionsData.Editing'];
      if Value <> '' then
        OptionsData.Editing := StrToBoolDef(Value, False);

      Value := Attr.Values['OptionsData.Deleting'];
      if Value <> '' then
        OptionsData.Deleting := StrToBoolDef(Value, False);

      Value := Attr.Values['OptionsData.Inserting'];
      if Value <> '' then
        OptionsData.Inserting := StrToBoolDef(Value, False);

      Value := Attr.Values['OptionsView.GroupByBox'];
      if Value <> '' then
        OptionsView.GroupByBox := StrToBoolDef(Value, False);

      Value := Attr.Values['OptionsView.ShowEditButtons'];
      if Value <> '' then
        OptionsView.ShowEditButtons := TcxGridShowEditButtons
          (GetEnumValue(TypeInfo(TcxGridShowEditButtons), Value));

      Value := Attr.Values['OptionsView.IndicatorWidth'];
      if Value <> '' then
        OptionsView.IndicatorWidth := StrToIntDef(Value, iIndicatorWidth);

      Value := Attr.Values['OptionsView.DataRowHeight'];
      if Value <> '' then
        OptionsView.DataRowHeight := StrToIntDef(Value, iDefaultDataRowHeight);

      Value := Attr.Values['OptionsView.CellAutoHeight'];
      if Value <> '' then
        OptionsView.CellAutoHeight := StrToBoolDef(Value, False);

      Value := Attr.Values['OptionsView.Footer'];
      if Value <> '' then
        OptionsView.Footer := StrToBoolDef(Value, False);

      Value := Attr.Values['OptionsSelection.MultiSelect'];
      if Value <> '' then
        OptionsSelection.MultiSelect := StrToBoolDef(Value, False);

      Value := Attr.Values['BackgroundBitmaps'];
      if Value <> '' then
        BackgroundBitmaps.Background.Assign(AppCore.ImageCenter.Get(Value));

      // Value := Attr.Values['Preview.Column'];
      // if Value <> '' then
      // begin
      // Preview.Visible := True;
      // Preview.Column := GetColumnByFieldName(Value);
      // end;

      BuildBandColumns(BandView, DataSource);

      if Assigned(FOnBuildTableView) then
        FOnBuildTableView(BandView);

    finally
      BandView.EndUpdate;
    end;
  end;
end;

procedure TDevExpressModule.BuildTreeColumns(TreeView: TcxDBTreeList;
  DataSource: TDADataSource);
var
  I: Integer;
  Value: Variant;
  Attr: TStrings;
  Column: TcxTreeListColumn;
  DataTable: TDADataTable;
begin
  DataTable := DataSource.DataTable;
  for I := 0 to DataTable.FieldCount - 1 do
  begin
    Attr := DataTable.Fields[I].CustomAttributes;

    Column := TcxTreeListColumn
      (TreeView.ColumnByName(DataTable.Fields[I].Name));
    if Column = nil then
      Exit;

    Column.Caption.AlignHorz := taCenter;

    // GridView和TreeView的宽度单位不统一。
    // GridView的DisplayWidth是字符个数, TreeView是像素

    if DataTable.Fields[I].DisplayWidth <= 0 then
    begin
      if DataTable.Fields[I].DataType in [datDateTime, datFloat, datCurrency,
        datAutoInc, datInteger, datLargeInt, datBoolean, datDecimal,
        datCardinal, datLargeAutoInc, datByte, datShortInt, datWord,
        datSmallInt, datLargeUInt, datSingleFloat] then
        Column.Width := FNumColumnWidth
      else
        Column.Width := FTextColumnWidth;
    end
    else
      Column.Width := DataTable.Fields[I].DisplayWidth * 10;

    Value := Attr.Values['Properties'];
    // if Value <> '' then
    begin
      Column.PropertiesClass := GetPropertiesClass(Value);
      Column.Properties := GetProperties(Value);
    end;

    Value := Attr.Values['Options.Editing'];
    if Value <> '' then
    begin
      Column.Options.Editing := StrToBoolDef(Value, False);
      Column.Options.Focusing := Column.Options.Editing;
    end;

    {
      Value := Attr.Values['Options.Focusing'];
      if Value <> '' then
      Column.Options.Focusing := StrToBoolDef(Value, False);
    }
    Value := Attr.Values['Styles.Content'];
    if Value <> '' then
    begin
      Column.Styles.Content := TcxStyle(GetStyle(Value));
    end;

    Value := Attr.Values['Styles.Footer'];
    if Value <> '' then
    begin
      Column.Styles.Footer := TcxStyle(GetStyle(Value));
    end;

    // TcxSummaryKind = (skNone, skSum, skMin, skMax, skCount, skAverage);
    Value := Attr.Values['Summary.FooterKind'];
    if Value <> '' then
      with Column.Summary.FooterSummaryItems.Add do
      begin
        Kind := TcxSummaryKind(GetEnumValue(TypeInfo(TcxSummaryKind), Value));

        Value := Attr.Values['Summary.FooterFormat'];
        if Value <> '' then
          Format := Value;
      end;

    Value := Attr.Values['Summary.GroupFooterKind'];
    if Value <> '' then
      with Column.Summary.GroupFooterSummaryItems.Add do
      begin
        Kind := TcxSummaryKind(GetEnumValue(TypeInfo(TcxSummaryKind), Value));

        Value := Attr.Values['Summary.GroupFooterFormat'];
        if Value <> '' then
          Format := Value;
      end;

    BuildProperties(Column, Column.Properties, DataTable.Fields[I], DataSource);
  end;
end;

procedure TDevExpressModule.BuildTreeView(TreeView: TcxDBTreeList;
  DataSource: TDADataSource);
var
  Value: string;
  Attr: TStrings;
  DataTable: TDADataTable;
begin
  Assert(DataSource <> nil);
  Assert(DataSource.DataTable <> nil);

  // RegisterTreeStyleListener(TreeView);
  DataTable := DataSource.DataTable;
  Attr := DataTable.CustomAttributes;
  with TreeView do
  begin
    BeginUpdate;
    try
      DeleteAllColumns;

      DataController.DataSource := DataSource;
      DataController.Filter.Options := DataController.Filter.Options +
        [fcoCaseInsensitive];

      Styles := GetTreeStyle();
      DataController.KeyField := Attr.Values['KeyFieldNames'];
      DataController.ParentField := Attr.Values['ParentField'];
      OptionsData.Editing := DataSource.AutoEdit;
      OptionsData.Deleting := False;
      OptionsData.Inserting := False;
      OptionsSelection.HideSelection := False;
      OptionsCustomizing.RowSizing := True;
      OptionsCustomizing.ColumnsQuickCustomization := True;
      OptionsBehavior.FocusCellOnCycle := True;
      OptionsBehavior.GoToNextCellOnEnter := True;
      OptionsView.IndicatorWidth := iIndicatorWidth div 2;
      OptionsView.Indicator := True;
      OptionsView.ShowRoot := True;
      // DefaultRowHeight := iDefaultDataRowHeight;
      // OptionsSelection.CellSelect := False;
      OptionsView.SimpleCustomizeBox := True;

      Value := Attr.Values['OptionsView.Footer'];
      if Value <> '' then
        OptionsView.Footer := StrToBoolDef(Value, False);

      Value := Attr.Values['OptionsView.ColumnAutoWidth'];
      if Value <> '' then
        OptionsView.ColumnAutoWidth := StrToBoolDef(Value, False);

      Value := Attr.Values['OptionsView.CellAutoHeight'];
      if Value <> '' then
        OptionsView.CellAutoHeight := StrToBoolDef(Value, False);

      PopupMenus.GroupFooterMenu.UseBuiltInMenu := True;
      PopupMenus.FooterMenu.UseBuiltInMenu := True;
      PopupMenus.ColumnHeaderMenu.UseBuiltInMenu := True;

      DataController.CreateAllItems;
      BuildTreeColumns(TreeView, DataSource);

      if Assigned(FOnBuildTreeView) then
        FOnBuildTreeView(TreeView);

    finally
      TreeView.EndUpdate;
    end;
  end;
end;

procedure TDevExpressModule.BuildChartView(ChartView: TcxGridDBChartView;
  DataSource: TDADataSource);
var
  I: Integer;
  Value: Variant;
  Attr: TStrings;
begin
  Assert(DataSource <> nil);
  Assert(DataSource.DataTable <> nil);

  with ChartView, DataSource.DataTable do
  begin
    BeginUpdate();
    try
      ClearSeries;
      ClearDataGroups;
      DataController.DataSource := DataSource;

      ToolBox.CustomizeButton := True;
      ToolBox.DiagramSelector := True;
      ToolBox.Border := tbNone;
      DiagramPie.Values.CaptionItems := [pdvciPercentage];
      DiagramPie.Values.CaptionPosition := pdvcpOutsideEnd;

      DiagramBar.AxisValue.MinMaxValues := mmvAuto;
      DiagramColumn.AxisValue.MinMaxValues := mmvAuto;
      DiagramArea.AxisValue.MinMaxValues := mmvAuto;
      DiagramStackedArea.AxisValue.MinMaxValues := mmvAuto;
      DiagramStackedColumn.AxisValue.MinMaxValues := mmvAuto;
      DiagramStackedBar.AxisValue.MinMaxValues := mmvAuto;
      DiagramLine.AxisValue.MinMaxValues := mmvAuto;
      DiagramLine.Values.MarkerStyle := cmsCircle;

      Value := Trim(CustomAttributes.Values['ChartActiveDiagram']);
      if Value <> '' then
        ActiveDiagram := TcxGridChartDiagram(GetObjectProp(ChartView, Value,
          TcxGridChartDiagram));

      ChartView.OptionsView.CategoriesPerPage :=
        StrToIntDef(CustomAttributes.Values['ChartCategoriesPerPage'], 200);

      for I := 0 to FieldCount - 1 do
      begin
        Attr := Fields[I].CustomAttributes;
        Value := Attr.Values['ChartSeries.GroupSummaryKind'];
        if (Value <> '') then
        begin
          with CreateSeries do
          begin
            DataBinding.FieldName := Fields[I].Name;
            // TcxSummaryKind = (skNone, skSum, skMin, skMax, skCount, skAverage);
            GroupSummaryKind :=
              TcxSummaryKind(GetEnumValue(TypeInfo(TcxSummaryKind), Value));
            Value := Attr.Values['ChartSeries.Visible'];
            Visible := (Value = '') or Value;
          end;
        end;

        Value := Attr.Values['ChartDataGroup.Visible'];
        if (Value <> '') then
          with CreateDataGroup do
          begin
            DataBinding.FieldName := Fields[I].Name;
            Visible := Value;
            Value := Attr.Values['ChartDataGroup.DataLevel'];
            if (Value <> '') then
              DataLevel := Value;
          end;
      end;
    finally
      EndUpdate;
    end;
  end;
end;

procedure TDevExpressModule.BuildPivotGrid(PivotGrid: TcxDBPivotGrid;
  DataSource: TDADataSource);
var
  I: Integer;
  Area: string;
  SummaryType: string;
  Attr: TStrings;
begin
  Assert(DataSource <> nil);
  Assert(DataSource.DataTable <> nil);

  // RegisterPivotStyleListener(PivotGrid);

  PivotGrid.BeginUpdate;
  try
    PivotGrid.DeleteAllFields;
    PivotGrid.DataController.DataSource := DataSource;
    PivotGrid.Styles := GetPivotStyle;
    PivotGrid.DataController.KeyFieldNames :=
      DataSource.DataTable.CustomAttributes.Values['KeyFieldNames'];
    PivotGrid.CreateAllFields;
    PivotGrid.Fields[0].Visible := False;

    // set field area and summary type
    for I := 0 to DataSource.DataTable.FieldCount - 1 do
    begin
      Attr := DataSource.DataTable.Fields[I].CustomAttributes;
      Area := Attr.Values['PivotArea'];
      SummaryType := Attr.Values['PivotSummaryType'];
      if Area = '' then
        Area := 'faFilter';
      if SummaryType = '' then
        SummaryType := 'stSum';
      {
        TcxPivotGridFieldArea = (faColumn, faRow, faFilter, faData);

        TcxPivotGridSummaryType = (stCount, stSum, stMin, stMax, stAverage,
        stStdDev, stStdDevP, stVariance, stVarianceP, stCustom);
      }
      PivotGrid.Fields[I + 1].Visible := DataSource.DataTable.Fields[I].Visible;
      PivotGrid.Fields[I + 1].Area :=
        TcxPivotGridFieldArea
        (GetEnumValue(TypeInfo(TcxPivotGridFieldArea), Area));
      PivotGrid.Fields[I + 1].SummaryType :=
        TcxPivotGridSummaryType(GetEnumValue(TypeInfo(TcxPivotGridSummaryType),
        SummaryType));
    end;
  finally
    PivotGrid.EndUpdate;
  end;
end;

procedure TDevExpressModule.BuildPropertiesProperty(EditProperties
  : TcxCustomEditProperties; CustomAttributes: TStrings; DAField: TDAField);
var
  List: TStringList;
  J: Integer;
  Attr: string;
  FileImages: TFileImageList;

  procedure BuildImageComboBoxItem(AItems: TcxImageComboBoxItems;
    const AText: string; AImages: TFileImageList);
  var
    TextList: TStrings;
  begin
    TextList := TStringList.Create;
    try
      TextList.CommaText := AText;
      with AItems.Add do
      begin
        if TextList.Count > 0 then
          ImageIndex := AImages.IndexOf(TextList[0]);
        if TextList.Count > 1 then
          Description := TextList[1];
        if TextList.Count > 2 then
          Value := TextList[2];
      end;
    finally
      TextList.Free;
    end;
  end;

  procedure BuildEditButtonItem(AButtons: TcxEditButtons; AText: string;
    AImages: TFileImageList);
  var
    TextList: TStrings;
  begin
    TextList := TStringList.Create;
    try
      TextList.CommaText := AText;
      with AButtons.Add do
      begin
        Kind := bkText; // bkGlyph;  // 不能同时显示图标和文本???
        if (TextList.Count > 0) and (AImages <> nil) then
          ImageIndex := AImages.IndexOf(TextList[0]);
        if TextList.Count > 1 then
        begin
          Caption := TextList[1];
          Hint := Caption;
        end;
      end;
    finally
      TextList.Free;
    end;
  end;

begin

  EditProperties.ReadOnly := not StrToBoolDef
    (CustomAttributes.Values['Options.Editing'], True);
  EditProperties.ImmediatePost :=
    StrToBoolDef(CustomAttributes.Values['Properties.ImmediatePost'], False);

  // 设置输入法
  if EditProperties.InheritsFrom(TcxCustomTextEditProperties) then
  begin
    with TcxCustomTextEditProperties(EditProperties) do
    begin
      Attr := CustomAttributes.Values['Properties.ImeMode'];
      if Attr <> '' then
      begin
        ImeMode := TImeMode(GetEnumValue(TypeInfo(TImeMode), Attr));

        if ImeMode = imOpen then
          ImeName := FDefaultIME;
      end;
    end
  end;

  if EditProperties.InheritsFrom(TcxTextEditProperties) then
    with TcxTextEditProperties(EditProperties) do
    begin
      Attr := CustomAttributes.Values['Properties.EchoMode'];
      if Attr <> '' then
        EchoMode := TcxEditEchoMode
          (GetEnumValue(TypeInfo(TcxEditEchoMode), Attr));
      Attr := CustomAttributes.Values['Properties.PasswordChar'];
      if Length(Attr) > 0 then
        PasswordChar := Attr[1];
      // Attr := DAField.CustomAttributes.Values['Properties.CharCase'];
      LookupItems.Delimiter := ';';
      LookupItems.DelimitedText := CustomAttributes.Values
        ['Properties.LookupItems'];
    end
  else if EditProperties.InheritsFrom(TcxCheckBoxProperties) then
    with TcxCheckBoxProperties(EditProperties) do
    begin
      if DAField.DataType in [datInteger, datLargeInt, datByte, datShortInt,
        datWord, datSmallInt, datCardinal, datLargeUInt] then
      begin
        // 设置数值型字段的布尔值
        ValueChecked := 1;
        ValueUnChecked := 0;
      end
    end
  else if EditProperties.InheritsFrom(TcxCurrencyEditProperties) then
    with TcxCurrencyEditProperties(EditProperties) do
    begin
      DisplayFormat := CustomAttributes.Values['Properties.DisplayFormat'];
      if DisplayFormat = '' then
        DisplayFormat := '0.00';
      // DAField.DisplayFormat; Schema中直接设置DisplayFormat后，字段显示不正常
      EditFormat := DisplayFormat;
      DecimalPlaces :=
        StrToIntDef(CustomAttributes.Values['Properties.DecimalPlaces'], 2);
      Attr := CustomAttributes.Values['Properties.MaxValue'];
      if Attr <> '' then
        MaxValue := StrToIntDef(Attr, 0);
      Attr := CustomAttributes.Values['Properties.MinValue'];
      if Attr <> '' then
        MinValue := StrToIntDef(Attr, 0);
    end
  else if EditProperties.InheritsFrom(TcxImageComboBoxProperties) then
    with TcxImageComboBoxProperties(EditProperties), CustomAttributes do
    begin
      Items.Clear;
      ShowDescriptions :=
        StrToBoolDef(Values['Properties.ShowDescriptions'], True);
      {
        Properties.Images.Width=24
        Properties.Images.Height=16
        Properties.Items=ImageName, Description, Value; ImageName, Description, Value;...
      }
      {
        FileImages := TFileImageList.Create(Column, AppCore.ImagePath, '', sDefaultImageName,
        StrToIntDef(Values['Properties.Images.Width'], 16),
        StrToIntDef(Values['Properties.Images.Height'], 16));
      }
      FileImages := AppCore.SmallImage;

      Images := FileImages.ImageList;
      List := TStringList.Create;
      try
        List.Delimiter := ';';
        List.DelimitedText := Values['Properties.ImageItems'];
        while List.Count > 0 do
        begin
          BuildImageComboBoxItem(Items, List[0], FileImages);
          List.Delete(0);
        end;
      finally
        List.Free;
      end;
    end
  else if EditProperties.InheritsFrom(TcxDateEditProperties) then
    with TcxDateEditProperties(EditProperties), CustomAttributes do
    begin
      SaveTime := StrToBoolDef(Values['Properties.SaveTime'], False);
      ShowTime := SaveTime;
      if SaveTime then
      begin
        // InputKind :=
        Kind := ckDateTime;
      end;
    end
  else if EditProperties.InheritsFrom(TcxPopupEditProperties) then
    with TcxPopupEditProperties(EditProperties) do
    begin
      // PopupClientEdge := True;
      // ReadOnly := True;  // 防止清除数据，但显示为灰色
    end
  else if EditProperties.InheritsFrom(TcxComboBoxProperties) then
    with TcxComboBoxProperties(EditProperties) do
    begin
      ImmediateDropDownWhenActivated := True;
      Items.Delimiter := ';';
      Items.DelimitedText := CustomAttributes.Values['Properties.Items'];
      Attr := CustomAttributes.Values['Properties.DropDownListStyle'];
      if Attr <> '' then
        DropDownListStyle := TcxEditDropDownListStyle
          (GetEnumValue(TypeInfo(TcxEditDropDownListStyle), Attr));
    end
  else if EditProperties.InheritsFrom(TcxLookupComboBoxProperties) then
    with TcxLookupComboBoxProperties(EditProperties) do
    begin
      DropDownAutoSize := True;
      DropDownSizeable := True;
      // ImmediateDropDownWhenActivated := True;
      ListFieldNames := CustomAttributes.Values['Properties.ListFieldNames'];
      ListFieldIndex :=
        StrToIntDef(CustomAttributes.Values['Properties.ListFieldIndex'], 0);
      if Assigned(FOnGetLookupSource) then
      begin
        if Assigned(FOnGetLookupSource) then
        begin
          ListSource := FOnGetLookupSource
            (CustomAttributes.Values['Properties.ListSource']);
          if ListSource <> nil then
            KeyFieldNames := TDADataSource(ListSource)
              .DataTable.CustomAttributes.Values['KeyFieldNames'];
        end;
      end;
    end
  else if EditProperties.InheritsFrom(TcxButtonEditProperties) then
    with TcxButtonEditProperties(EditProperties), CustomAttributes do
    begin
      Attr := CustomAttributes.Values['Properties.ViewStyle'];
      if Attr <> '' then
        ViewStyle := TcxTextEditViewStyle
          (GetEnumValue(TypeInfo(TcxTextEditViewStyle), Attr));

      {
        FileImages := TFileImageList.Create(Column, AppCore.ImagePath, '', sDefaultImageName,
        StrToIntDef(Values['Properties.Images.Width'], 16),
        StrToIntDef(Values['Properties.Images.Height'], 16));
      }
      FileImages := AppCore.SmallImage;

      Images := FileImages.ImageList;

      List := TStringList.Create;
      try
        List.Delimiter := ';';
        List.DelimitedText := Values['Properties.Buttons'];
        Buttons.Clear;
        while List.Count > 0 do
        begin
          BuildEditButtonItem(Buttons, List[0], FileImages);
          List.Delete(0);
        end;
      finally
        List.Free;
      end;
    end
  else if EditProperties.InheritsFrom(TcxHyperLinkEditProperties) then
    with TcxHyperLinkEditProperties(EditProperties), CustomAttributes do
    begin
      SingleClick := True;
    end
  else if EditProperties.InheritsFrom(TcxMaskEditProperties) then
    with TcxMaskEditProperties(EditProperties) do
    begin
      MaskKind := emkRegExprEx;
      EditMask := CustomAttributes.Values['Properties.EditMask'];
    end
  else if EditProperties.InheritsFrom(TcxCalcEditProperties) then
    with TcxCalcEditProperties(EditProperties) do
    begin
      DisplayFormat := CustomAttributes.Values['Properties.DisplayFormat'];
    end
  else if EditProperties.InheritsFrom(TcxSpinEditProperties) then
    with TcxSpinEditProperties(EditProperties) do
    begin
      // if DAField.DataType in [datFloat, datCurrency, datDecimal, datSingleFloat] then
      ValueType := vtFloat;
      // else
      // ValueType := vtInt;
      DisplayFormat := CustomAttributes.Values['Properties.DisplayFormat'];
      // if DisplayFormat = '' then DisplayFormat := '0.00';
      EditFormat := DisplayFormat;
      Attr := CustomAttributes.Values['Properties.MaxValue'];
      if Attr <> '' then
        MaxValue := StrToIntDef(Attr, 0);
      Attr := CustomAttributes.Values['Properties.MinValue'];
      if Attr <> '' then
        MinValue := StrToIntDef(Attr, 0);
    end
  else if EditProperties.InheritsFrom(TcxMemoProperties) then
    with TcxMemoProperties(EditProperties) do
    begin
      VisibleLineCount := 0;
      Attr := CustomAttributes.Values['Properties.VisibleLineCount'];
      if Attr <> '' then
        VisibleLineCount := StrToIntDef(Attr, 2);
      Attr := CustomAttributes.Values['Properties.ScrollBars'];
      if Attr <> '' then
        ScrollBars := TcxScrollStyle
          (GetEnumValue(TypeInfo(TcxScrollStyle), Attr))
      else
        ScrollBars := ssVertical;
    end
  else if EditProperties.InheritsFrom(TcxCheckComboBoxProperties) then
    with TcxCheckComboBoxProperties(EditProperties) do
    begin
      Items.Clear;
      List := TStringList.Create;
      try
        List.Delimiter := ';';
        List.DelimitedText := CustomAttributes.Values['Properties.Items'];
        for J := 0 to List.Count - 1 do
          Items.AddCheckItem(List[J]);
      finally
        FreeAndNil(List);
      end;
    end
  else if EditProperties.InheritsFrom(TcxCheckGroupProperties) then
    with TcxCheckGroupProperties(EditProperties) do
    begin
      Items.Clear;
      Columns := StrToIntDef(CustomAttributes.Values['Properties.Columns'], 1);
      EditValueFormat := cvfInteger; // 此种格式最方便
      List := TStringList.Create;
      try
        List.Delimiter := ';';
        List.DelimitedText := CustomAttributes.Values['Properties.Items'];
        for J := 0 to List.Count - 1 do
          Items.Add.Caption := List[J];
      finally
        FreeAndNil(List);
      end;
    end
  else if EditProperties.InheritsFrom(TcxRadioGroupProperties) then
    with TcxRadioGroupProperties(EditProperties) do
    begin
      Items.Clear;
      Columns := StrToIntDef(CustomAttributes.Values['Properties.Columns'], 1);
      List := TStringList.Create;
      try
        List.Delimiter := ';';
        List.DelimitedText := CustomAttributes.Values['Properties.Items'];
        for J := 0 to List.Count - 1 do
          with Items.Add do
          begin
            Caption := List.Text[J];
            Value := List.ValueFromIndex[J];
          end;
      finally
        FreeAndNil(List);
      end;
    end
  else if EditProperties.InheritsFrom(TcxImageProperties) then
    with TcxImageProperties(EditProperties) do
    begin
      GraphicClassName := 'TdxSmartImage';
    end;
end;

procedure TDevExpressModule.BuildProperties(AColumn: TComponent;
  EditProperties: TcxCustomEditProperties; DAField: TDAField;
  DataSource: TDADataSource);
begin
  if EditProperties = nil then
    Exit;
  Assert(DAField <> nil);

  BuildPropertiesProperty(EditProperties, DAField.CustomAttributes, DAField);

  if Assigned(FOnWrapPropperties) then
    FOnWrapPropperties(AColumn, EditProperties, DAField, DataSource);
end;

procedure TDevExpressModule.BuildGridColumn(Column: TcxGridColumn;
  DAField: TDAField; DataSource: TDADataSource);
var
  Attr: TStrings;
  Value: string;
  CommonPropertiesCount: Integer;
begin
  Assert(Column <> nil);
  Assert(DAField <> nil);

  try
    Attr := DAField.CustomAttributes;

    Column.HeaderAlignmentHorz := taCenter;
    Column.HeaderAlignmentVert := vaCenter;

    if DAField.DisplayWidth <= 0 then
    begin
      if DAField.DataType in [datDateTime, datFloat, datCurrency, datAutoInc,
        datInteger, datLargeInt, datBoolean, datDecimal, datCardinal,
        datLargeAutoInc, datByte, datShortInt, datWord, datSmallInt,
        datLargeUInt, datSingleFloat] then
        Column.Width := FNumColumnWidth
      else
        Column.Width := FTextColumnWidth
    end;

    // 优化数度! 注意这里!!! 小心代码被屏蔽!!!
    CommonPropertiesCount := Attr.Count;
    if CommonPropertiesCount = 0 then
      Exit;

    Value := Attr.Values['MultiEditorField'];
    if Value <> '' then
    begin
      Column.Tag := Integer(TcxGridDBTableView(Column.GridView)
        .GetColumnByFieldName(Value));
      if Column.Tag <> 0 then
        Column.OnGetPropertiesForEdit := DoTableViewGetProperties;
      Exit;
    end;

    Value := Attr.Values['Properties'];
    Column.PropertiesClass := GetPropertiesClass(Value);
    Column.Properties := GetProperties(Value);
    if Value <> '' then
    begin
      Dec(CommonPropertiesCount);
    end;

    Value := Attr.Values['Options.Editing'];
    if Value <> '' then
    begin
      Column.Options.Editing := StrToBoolDef(Value, False);
      Column.Options.Focusing := Column.Options.Editing;
      Dec(CommonPropertiesCount);
    end;

    BuildProperties(Column, Column.Properties, DAField, DataSource);

    // 优化数度! 注意这里!!! 小心代码被屏蔽!!!
    if CommonPropertiesCount <= 0 then
      Exit;

    Value := Attr.Values['Options.Focusing'];
    if Value <> '' then
    begin
      Column.Options.Focusing := StrToBoolDef(Value, True);
    end;

    Value := Attr.Values['Styles.Content'];
    if Value <> '' then
    begin
      Column.Styles.Content := TcxStyle(GetStyle(Value));
    end;

    Value := Attr.Values['Styles.Footer'];
    if Value <> '' then
    begin
      Column.Styles.Footer := TcxStyle(GetStyle(Value));
    end;

    {
      Value := Attr.Values['Options.CellMerging'];
      if Value <> '' then
      begin
      Column.Options.CellMerging := StrToBoolDef(Value, False);
      end;

      Value := Attr.Values['Options.Focusing'];
      if Value <> '' then
      Column.Options.Focusing := StrToBoolDef(Value, False);
    }

    Value := Attr.Values['GroupIndex'];
    if Value <> '' then
      Column.GroupIndex := StrToIntDef(Value, 0);

    // TcxSummaryKind = (skNone, skSum, skMin, skMax, skCount, skAverage);
    Value := Attr.Values['Summary.FooterKind'];
    if Value <> '' then
      Column.Summary.FooterKind :=
        TcxSummaryKind(GetEnumValue(TypeInfo(TcxSummaryKind), Value));

    Value := Attr.Values['Summary.FooterFormat'];
    if Value <> '' then
      Column.Summary.FooterFormat := Value;

    Value := Attr.Values['Summary.GroupFooterKind'];
    if Value <> '' then
    begin
      Column.Summary.GroupFooterKind :=
        TcxSummaryKind(GetEnumValue(TypeInfo(TcxSummaryKind), Value));
      Column.Summary.GroupKind := Column.Summary.GroupFooterKind;
    end;

    Value := Attr.Values['Summary.GroupFooterFormat'];
    if Value <> '' then
    begin
      Column.Summary.GroupFooterFormat := Value;
      Column.Summary.GroupFormat := Value
    end;

  except
    on E: Exception do
      AppCore.Logger.Write('(BuildGridColumn)' + E.Message, mtError, 0)
  end;
end;

procedure TDevExpressModule.FillSkinNames(List: TStrings);
var
  I: Integer;
begin
  List.Clear;
  List.Add('Flat');
  List.Add('Standard');
  List.Add('UltraFlat');
  List.Add('Office11');
  List.Add('本机风格');
  for I := 0 to cxLookAndFeelPaintersManager.Count - 1 do
    if cxLookAndFeelPaintersManager.Items[I].LookAndFeelStyle = lfsSkin then
      List.Add(cxLookAndFeelPaintersManager.Items[I].LookAndFeelName);
end;

function TDevExpressModule.GetSkinIndex: Integer;
begin
  Result := FSkinIndex;
end;

procedure TDevExpressModule.SetSkinIndex(AIndex: Integer);
var
  SkinList: TStrings;
begin
  if AIndex < 0 then
    AIndex := 0;
  FSkinIndex := AIndex;
  dxSkinController.BeginUpdate;
  try
    case AIndex of
      0 .. 3:
        begin
          dxSkinController.UseSkins := False;
          dxSkinController.NativeStyle := False;
          dxSkinController.Kind := TcxLookAndFeelKind(AIndex);
        end;
      4:
        begin
          dxSkinController.UseSkins := False;
          dxSkinController.NativeStyle := True;
        end;
    else
      begin
        SkinList := TStringList.Create;
        try
          FillSkinNames(SkinList);
          if FSkinIndex >= SkinList.Count then
            FSkinIndex := SkinList.Count - 1;
          dxSkinController.NativeStyle := False;
          dxSkinController.UseSkins := True;
          dxSkinController.SkinName := SkinList.Strings[FSkinIndex];
        finally
          SkinList.Free;
        end;
      end;
    end;
  finally
    dxSkinController.EndUpdate;
  end;
end;

function TDevExpressModule.GetBarManager: TdxBarManager;
begin
  Result := FBarManager;
  if FBarManager = nil then
    raise Exception.Create('BarManager还没有赋值.');
  // BarManagery应由DevMain来赋值
end;

procedure TDevExpressModule.BuildCardView(CardView: TcxGridDBCardView;
  DataSource: TDADataSource);
var
  Value: string;
  Attr: TStrings;
begin
  // RegisterGridStyleListener(CardView);

  Attr := DataSource.DataTable.CustomAttributes;
  with CardView do
  begin
    BeginUpdate;
    try
      ClearItems;
      DataController.DataSource := DataSource;
      Styles := GetCardStyle;

      DataController.Filter.Options := DataController.Filter.Options +
        [fcoCaseInsensitive];
      OptionsData.Editing := DataSource.AutoEdit;
      OptionsData.Deleting := False;
      OptionsData.Inserting := False;
      LayoutDirection := cxGridCardView.ldVertical;
      OptionsBehavior.GoToNextCellOnEnter := True;
      OptionsBehavior.FocusFirstCellOnNewRecord := True;
      OptionsCustomize.LayeredRows := True;
      OptionsCustomize.RowMoving := True;
      OptionsCustomize.RowFiltering := False;
      // OptionsView.CardAutoWidth := True;
      OptionsView.SeparatorWidth := 2;
      OptionsView.CardIndent := 2;
      // OptionsView.CaptionWidth := 4;
      OptionsView.CellAutoHeight := True;
      // OptionsSelection.HideFocusRectOnExit := False;

      Value := Attr.Values['OptionsData.Editing'];
      if Value <> '' then
        OptionsData.Editing := StrToBoolDef(Value, False);

      Value := Attr.Values['OptionsData.Deleting'];
      if Value <> '' then
        OptionsData.Deleting := StrToBoolDef(Value, False);

      Value := Attr.Values['OptionsData.Inserting'];
      if Value <> '' then
        OptionsData.Inserting := StrToBoolDef(Value, False);

      Value := Attr.Values['RowLayout'];
      if Value <> '' then
        RowLayout := TcxGridCardViewRowLayout(StrToIntDef(Value, 0));

      Value := Attr.Values['OptionsView.CardWidth'];
      if Value <> '' then
        OptionsView.CardWidth := StrToIntDef(Value, 300);

      Value := Attr.Values['OptionsView.CardBorderWidth'];
      if Value <> '' then
        OptionsView.CardBorderWidth := StrToIntDef(Value, 0);

      Value := Attr.Values['OptionsView.SeparatorWidth'];
      if Value <> '' then
        OptionsView.SeparatorWidth := StrToIntDef(Value, 2);

      Value := Attr.Values['OptionsView.CaptionWidth'];
      if Value <> '' then
        OptionsView.CaptionWidth := StrToIntDef(Value, 5);

      Value := Attr.Values['OptionsView.ShowEditButtons'];
      if Value <> '' then
        OptionsView.ShowEditButtons := TcxGridShowEditButtons
          (GetEnumValue(TypeInfo(TcxGridShowEditButtons), Value));

      Value := Attr.Values['OptionsSelection.MultiSelect'];
      if Value <> '' then
        OptionsSelection.MultiSelect := StrToBoolDef(Value, False);

      Value := Attr.Values['BackgroundBitmaps'];
      if Value <> '' then
        BackgroundBitmaps.Background.Assign(AppCore.ImageCenter.Get(Value));

      DataController.CreateAllItems;
      DataController.KeyFieldNames := Attr.Values['KeyFieldNames'];

      BuildCardRows(CardView, DataSource);

      if Assigned(FOnBuildTableView) then
        FOnBuildTableView(CardView);
    finally
      EndUpdate;
    end;
  end;
end;

procedure TDevExpressModule.BuildCardRows(CardView: TcxGridDBCardView;
  DataSource: TDADataSource);
var
  I: Integer;
  CardRow: TcxGridDBCardViewRow;
  DataTable: TDADataTable;
begin
  DataTable := DataSource.DataTable;
  for I := 0 to DataTable.FieldCount - 1 do
  begin
    CardRow := CardView.GetRowByFieldName(DataTable.Fields[I].Name);
    if CardRow <> nil then
      BuildCardRow(CardRow, DataTable.Fields[I], CardView, DataSource);
  end;
end;

procedure TDevExpressModule.BuildCardRow(CardRow: TcxGridDBCardViewRow;
  DAField: TDAField; CardView: TcxGridDBCardView; DataSource: TDADataSource);
var
  Attr: TStrings;
  Value: string;
  DataTable: TDADataTable;
begin
  Assert(CardRow <> nil);
  Assert(DAField <> nil);

  DataTable := DataSource.DataTable;
  try
    Attr := DAField.CustomAttributes;

    CardRow.Position.BeginsLayer := False;

    Value := Attr.Values['Properties'];
    // Value <> '' then
    begin
      CardRow.PropertiesClass := GetPropertiesClass(Value);
      CardRow.Properties := GetProperties(Value);
    end;

    CardRow.Position.Width := CardRow.DataBinding.Field.DisplayWidth;

    Value := Attr.Values['Options.Editing'];
    if Value <> '' then
    begin
      CardRow.Options.Editing := StrToBoolDef(Value, False);
      CardRow.Options.Focusing := CardRow.Options.Editing;
    end;

    // 如果定义了Category则生成一个类别CardRow
    Value := Trim(Attr.Values['BandCaption']);
    if Value <> '' then
      with CardView.CreateRow do
      begin
        Kind := rkCategory;
        Caption := Value;
        Index := CardRow.Index;
        Position.BeginsLayer := True;
        CardRow.Position.BeginsLayer := True; // 定义了Band则默认视为换行
        Expanded := True;
        Options.Editing := False;
        Options.Filtering := False;
      end;

    Value := Attr.Values['BeginsLayer'];
    if Value <> '' then
      CardRow.Position.BeginsLayer := StrToBoolDef(Value, False);

    Value := Attr.Values['Position.LineCount'];
    if Value <> '' then
      CardRow.Position.LineCount := StrToIntDef(Value, 2);

    BuildProperties(CardRow, CardRow.Properties, DAField, DataSource);
  except
    on E: Exception do
      AppCore.Logger.Write('(BuildCardRow)' + E.Message, mtError, 0)
  end;

end;

{ 选取可见的字段进行表单创建 }

procedure TDevExpressModule.BuildFormView(AGroup: TdxlayoutGroup;
  ACustomData: TCustomData);
var
  I, J: Integer;
  VisibleFields: TStringDynArray;
  FormEditFields: string;
  FormControlWidth: Integer;
  CaptionAlignTop: Boolean;
begin

  with ACustomData.Table do
  begin
    FormEditFields := CustomAttributes.Values['FormEditFields'];
    FormControlWidth :=
      StrToIntDef(CustomAttributes.Values['FormControlWidth'], 0);
    CaptionAlignTop := False;

    if FormEditFields <> '' then
      VisibleFields := DelimitedTextToArray(FormEditFields)
    else
    begin
      // 分配足够的空间
      SetLength(VisibleFields, FieldCount);
      J := 0;
      for I := 0 to FieldCount - 1 do
      begin
        if Fields[I].Visible then
        begin
          VisibleFields[J] := Fields[I].Name;
          Inc(J);
        end;
      end;
      // 分配实际的空间
      SetLength(VisibleFields, J);
    end;
  end;
  BuildFormView2(AGroup, ACustomData.Source, VisibleFields, FormControlWidth,
    CaptionAlignTop);
end;

{ 根据选取字段进行表单创建 }

procedure TDevExpressModule.BuildFormView2(AGroup: TdxlayoutGroup;
  ADataSource: TDADataSource; AFields: array of string; AControlWidth: Integer;
  ACaptionAlignTop: Boolean);
var
  I: Integer;
  Editor: TcxCustomEdit;
  BandGroup: TdxlayoutGroup;
  EditorGroup: TdxlayoutGroup;
  Value: Variant;
  DefaultBeginsLayer: Boolean;
  DAField: TDAField;
begin
  EditorGroup := nil;

  DefaultBeginsLayer :=
    StrToBoolDef(ADataSource.DataTable.CustomAttributes.Values
    ['DefaultBeginsLayer'], True);
  if AControlWidth <= 0 then
    AControlWidth := StrToIntDef(ADataSource.DataTable.CustomAttributes.Values
      ['FormControlWidth'], 0);

  for I := 0 to Length(AFields) - 1 do
  begin
    DAField := ADataSource.DataTable.FieldByName(AFields[I]);

    Value := DAField.CustomAttributes.Values['BandCaption'];
    if Value <> '' then
    begin
      BandGroup := AGroup.CreateGroup();
      BandGroup.Caption := Value;
      // BandGroup.ButtonOptions.ShowExpandButton := True;
      EditorGroup := nil;
    end;

    Value := DAField.CustomAttributes.Values['BeginsLayer'];
    if (EditorGroup = nil) or StrToBoolDef(Value, DefaultBeginsLayer) then
    begin
      if BandGroup <> nil then
        EditorGroup := BandGroup.CreateGroup()
      else
        EditorGroup := AGroup.CreateGroup();

      EditorGroup.ShowBorder := False;
      EditorGroup.LayoutDirection := ldHorizontal;
      // EditorGroup.ItemControlAreaAlignment := catAuto;
    end;

    Editor := BuildFormEditor(ADataSource, DAField, AGroup, AControlWidth);

    with EditorGroup.CreateItemForControl(Editor) do
    begin
      Caption := DAField.DisplayLabel + ':';
      if StrToBoolDef(DAField.CustomAttributes.Values['AlignHorz'], False) then
        AlignHorz := ahClient;
      AlignVert := avCenter;
      // CaptionOptions.AlignVert := tavTop;
      if ACaptionAlignTop then
        CaptionOptions.Layout := clTop;
    end;
    // if Assigned(FOnWrapControl) then FOnWrapControl(Editor, Fields[I]);
  end;
end;

function TDevExpressModule.BuildFormEditor(ADataSource: TDADataSource;
  ADAField: TDAField; AOwner: TComponent; AEditorWidth: Integer): TcxCustomEdit;
var
  Att: string;
  CommonPropertiesCount: Integer;
begin
  CommonPropertiesCount := ADAField.CustomAttributes.Count;

  Att := ADAField.CustomAttributes.Values['Properties'];
  if Att <> '' then
    Dec(CommonPropertiesCount);

  Result := GetDBControlClass(Att).Create(AOwner);
  with TcxDBEditDataBinding(TcxCustomEditAccess(Result).DataBinding) do
  begin
    DataSource := ADataSource;
    DataField := ADAField.Name;
  end;

  // 设置控件宽度
  Att := ADAField.CustomAttributes.Values['ControlWidth'];
  if Att <> '' then
    Result.Width := StrToIntDef(Att, Round(TextColumnWidth * 1.8))
  else
    Result.Width := IfThen(AEditorWidth <= 0, Round(TextColumnWidth * 1.8),
      AEditorWidth);

  if Result.InheritsFrom(TcxCustomCheckBox) then
    TcxCustomCheckBox(Result).Transparent := True;

  Att := ADAField.CustomAttributes.Values['Options.Editing'];
  if Att <> '' then
  begin
    Result.TabStop := StrToBoolDef(Att, False);
    Dec(CommonPropertiesCount);
  end;

  BuildProperties(Result, Result.ActiveProperties, ADAField, ADataSource);

  // 优化速度! 注意这里!!! 小心代码被屏蔽!!!
  if CommonPropertiesCount <= 0 then
    Exit;

  Att := ADAField.CustomAttributes.Values['Options.Focusing'];
  if Att <> '' then
  begin
    Result.TabStop := StrToBoolDef(Att, True);
  end;

  Att := ADAField.CustomAttributes.Values['Style.Color'];
  if Att <> '' then
  begin
    Result.Style.Color := StringToColor(Att);
  end;

  Att := ADAField.CustomAttributes.Values['Style.TextColor'];
  if Att <> '' then
  begin
    Result.Style.TextColor := StringToColor(Att);
  end;

  Att := ADAField.CustomAttributes.Values['Style.TextStyle.fsBold'];
  if (Att <> '') and StrToBoolDef(Att, False) then
  begin
    Result.Style.TextStyle := Result.Style.TextStyle + [fsBold];
  end;

  Att := ADAField.CustomAttributes.Values['Style.Font.Size'];
  if (Att <> '') then
  begin
    Result.Style.Font.Size := StrToIntDef(Att, 14);
  end;

  Att := ADAField.CustomAttributes.Values['Style.Font.Name'];
  if (Att <> '') then
  begin
    Result.Style.Font.Name := Att;
  end;

end;

procedure TDevExpressModule.RegisterPivotStyleListener
  (AListener: TcxCustomPivotGrid);
begin
  if FPivotStyleListeners.IndexOf(AListener) = -1 then
  begin
    AListener.Styles := GetPivotStyle();
    FPivotStyleListeners.Add(AListener);
    AListener.FreeNotification(Self);
  end;
end;

procedure TDevExpressModule.RegisterTreeStyleListener
  (AListener: TcxCustomTreeList);
begin
  if FTreeStyleListeners.IndexOf(AListener) = -1 then
  begin
    AListener.Styles := GetTreeStyle();
    FTreeStyleListeners.Add(AListener);
    AListener.FreeNotification(Self);
  end;
end;

procedure TDevExpressModule.UnRegisterPivotStyleListener
  (AListener: TcxCustomPivotGrid);
begin
  if FPivotStyleListeners.IndexOf(AListener) > -1 then
    FPivotStyleListeners.Remove(AListener);
  // AListener.Styles := nil;
end;

procedure TDevExpressModule.UnRegisterTreeStyleListener
  (AListener: TcxCustomTreeList);
begin
  if FTreeStyleListeners.IndexOf(AListener) > -1 then
    FGridStyleListeners.Remove(AListener);
  // AListener.Styles := nil;
end;

{ 按Ctrl或Shift键做水平滚动 }

procedure TDevExpressModule.DoTableViewMouseWheel(Sender: TObject;
  Shift: TShiftState; WheelDelta: Integer; MousePos: TPoint;
  var Handled: Boolean);
var
  ScrollCode: TScrollCode;
begin
  if [ssShift, ssCtrl] * Shift <> [] then
  begin
    if ssShift in Shift then
    begin
      if WheelDelta > 0 then
        ScrollCode := scPageUp
      else
        ScrollCode := scPageDown;
    end
    else
    begin
      if WheelDelta > 0 then
        ScrollCode := scLineUp
      else
        ScrollCode := scLineDown;
    end;
    TcxGridSite(Sender).GridView.Controller.Scroll(sbHorizontal, ScrollCode,
      WheelDelta);
    Handled := True;
  end;
end;

function TDevExpressModule.GetStyle(const StyleName: string): TcxCustomStyle;
var
  I: Integer;
begin
  Result := nil;
  for I := 0 to cxStyleRepository.Count - 1 do
    if SameText(StyleName, cxStyleRepository.Items[I].Name) then
    begin
      Result := cxStyleRepository.Items[I];
      Break;
    end;
end;

procedure TDevExpressModule.DoTableViewGetProperties
  (Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AProperties: TcxCustomEditProperties);
var
  PropertyAttributes: TStrings;
  PropertiesColumn: TcxGridDBColumn;
  DataSource: TDADataSource;
begin
  PropertiesColumn := TcxGridDBColumn(Sender.Tag);
  DataSource := TDADataSource(TcxGridDBTableView(PropertiesColumn.GridView)
    .DataController.DataSource);
  PropertyAttributes := TStringList.Create;
  try
    PropertyAttributes.Text := VarToStr(ARecord.Values[PropertiesColumn.Index]);
    AProperties := GetProperties(PropertyAttributes.Values['Properties']);

    if (AProperties <> nil) then
    begin
      BuildPropertiesProperty(AProperties, PropertyAttributes,
        DataSource.DataTable.FieldByName(TcxGridDBColumn(Sender)
        .DataBinding.FieldName));

      if Assigned(FOnWrapPropperties) then
      begin
        FOnWrapPropperties(Sender, AProperties,
          DataSource.DataTable.FieldByName(TcxGridDBColumn(Sender)
          .DataBinding.FieldName), DataSource, PropertyAttributes);
      end;
    end;
  except
  end;
  PropertyAttributes.Free;
end;

function TDevExpressModule.FindDBControl(ARoot: TComponent;
  const AFieldName: string): TcxCustomEdit;
var
  I: Integer;
  DBProp: TcxDBEditDataBinding;
begin
  Result := nil;
  for I := 0 to ARoot.ComponentCount - 1 do
  begin
    DBProp := TcxDBEditDataBinding(GetObjectProp(ARoot.Components[I],
      'DataBinding', TcxDBEditDataBinding));

    if (DBProp <> nil) and SameText(DBProp.DataField, AFieldName) and
      ARoot.Components[I].InheritsFrom(TcxCustomEdit) then
      Result := TcxCustomEdit(ARoot.Components[I])
    else
      Result := FindDBControl(ARoot.Components[I], AFieldName);
  end;
end;

initialization

DevExpress := TDevExpressModule.Create(Application);

end.
