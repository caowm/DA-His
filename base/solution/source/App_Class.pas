unit App_Class;

{
  使用第3方组件构建的通用类库

  Written by caowm (remobjects@qq.com)
  2014年9月
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
  ActnList,
  StdCtrls,
  StrUtils,
  Forms,
  DB,
  Dialogs,
  Contnrs,
  TypInfo,
  ExtCtrls,
  Menus,
  frxPrinter,
  IdHTTP,
  jpeg,
  GR32,
  GR32_Image,
  GR32_Layers,
  App_Common,
  App_Function,
  App_DevExpress,
  App_DAModel,
  uROClasses,
  uDADataTable,
  uDAInterfaces,
  cxGraphics,
  cxStyles,
  cxLookAndFeels,
  cxControls,
  cxCalendar,
  cxLookAndFeelPainters,
  cxDBEditRepository,
  cxExtEditRepositoryItems,
  cxEditRepositoryItems,
  cxEdit,
  cxImage,
  cxDBLookupComboBox,
  cxCalc,
  cxCheckListBox,
  cxSpinEdit,
  cxGridExportLink,
  cxGrid,
  cxGridCustomView,
  cxGridCustomTableView,
  cxGridTableView,
  cxGridDBTableView,
  cxGridBandedTableView,
  cxGridDBBandedTableView,
  cxGridDBCardView,
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
  cxLabel,
  cxButtons,
  cxListBox,
  cxPCdxBarPopupMenu,
  cxProgressBar,
  dxLayoutContainer,
  dxLayoutControl,
  dxLayoutCommon,
  dxGDIPlusAPI,
  dxGDIPlusClasses,
  dxCore,
  dxBar;

const
  sIconArrowLeft = 'left.ico';
  sIconArrowRight = 'right.ico';

  sDefaultPrinter = '默认打印机';

const
  sInterfaceSection = 'InterfaceSection';
  sPrinterSection = 'BusinessPrinters';
  sReporterPrinterSection = 'ReporterPrinter';

type

  {
    进度窗体

    1. 没有采用回调设计，显示进度条窗体时自动使能前面的窗体
  }
  TProgressForm = class(TForm)
  private
    FFormLayout: TdxLayoutControl;
    FHintItem: TdxLayoutItem;
    FProgressBar: TcxProgressBar;
    FCancelButton: TcxButton;
    FCanceled: Boolean;
    FActiveForm: TCustomForm;
    procedure CancelButtonClickEvent(Sender: TObject);
    procedure FormShowEvent(Sender: TObject);
  public
    constructor Create(AOwner: TComponent); override;
    procedure BeginProgress();
    procedure EndProgress();
    procedure SetHintLabel(const ACaption: string);
    procedure SetHintFmt(const AFormat: string; AParam: array of const);
    procedure SetProgress(AMax, APosition: Integer);
    procedure SetCancelButtonVisible(AVisible: Boolean);
    property Canceled: Boolean read FCanceled;
  end;

  TBrowseImageAction = (baNextImage, baPreviousImage, baRefreshImage);
  TBrowseImageEvent = procedure(Sender: TObject; AAction: TBrowseImageAction;
    ABitmap: TBitmap32) of object;

  {
    图片浏览窗体
  }
  TImageBrowseForm = class(TForm)
  private
    FLayout: TdxLayoutControl;
    FToolBarGroup: TdxLayoutGroup;
    FImgView: TImgView32;
    FOnBrowseEvent: TBrowseImageEvent;
    FActions: TActionList;
    FOnChange: TNotifyEvent;

    procedure OnFormKeyDownEvent(Sedner: TObject; var Key: Word;
      Shift: TShiftState);
    procedure OnImgViewClickEvent(Sender: TObject);
    procedure OnImgViewMouseMoveEvent(Sender: TObject; Shift: TShiftState;
      X, Y: Integer; Layer: TCustomLayer);
    procedure OnImgViewMouseWheel(Sender: TObject; Shift: TShiftState;
      WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
    procedure OnImgViewPaintStage(Sender: TObject; Buffer: TBitmap32;
      StageNum: Cardinal);
    procedure NotifyChange();

    procedure BuildActions();
    procedure BrowsePriorActionExecuteEvent(Sender: TObject);
    procedure BrowseNextActionExecuteEvent(Sender: TObject);
    procedure RefreshActionExecuteEvent(Sender: TObject);
    procedure ZoomOutActionExecuteEvent(Sender: TObject);
    procedure ZoomInActionExecuteEvent(Sender: TObject);
    procedure OriginalSizeActionExecuteEvent(Sender: TObject);
    procedure FitControlActionExecuteEvent(Sender: TObject);
    procedure Rotate90ActionExecuteEvent(Sender: TObject);
    procedure Rotate180ActionExecuteEvent(Sender: TObject);
    procedure Rotate270ActionExecuteEvent(Sender: TObject);
  public
    class procedure BrowseImage(AOnBrowseEvent: TBrowseImageEvent);

    constructor Create(AOwner: TComponent); override;
    destructor Destroy(); override;
    procedure BrowseNext();
    procedure BrowsePrior();
    procedure RefreshImage();
    procedure ScaleImage(ADelta: Integer);
    procedure Clear();
    property ImgView: TImgView32 read FImgView;
    property OnBrowseEvent: TBrowseImageEvent read FOnBrowseEvent
      write FOnBrowseEvent;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
  end;

  {
    光标管理器

    光标管理器记录光标名称和光标索引的关系, 补充Screen在光标管理中的功能.
  }
  TFileCursorList = class
  private
    FCursorPath: string;
    FLoadedCursor: TStrings;
  public
    constructor Create(const ACursorPath: string);
    destructor Destroy(); override;
    function IndexOf(const ACursorName: string): Integer;
  end;

  { 带布局控件的基础视图 }
  TBaseLayoutView = class(TBaseView)
  private
    FIsEmbedded: Boolean; // 是否嵌入在其他视图中
    FLayout: TdxLayoutControl;
    procedure SetIsEmbedded(const Value: Boolean);
  protected
    procedure BuildViewLayout(); virtual;
    function GetPluginManager(): TBaseViewPluginManager; override;

  public
    procedure DoInitView(); override;
    procedure FocusFirstControl();
    procedure FocusNextControl();

    property ViewLayout: TdxLayoutControl read FLayout;
    property IsEmbedded: Boolean read FIsEmbedded write SetIsEmbedded;
  end;

  TBaseLayoutViewPluginManager = class(TBaseViewPluginManager)
  private
    FPluginGroup: TdxLayoutGroup;
  public
    procedure PluginOperation(AOperation: TBaseOperation); override;

    property PluginGroup: TdxLayoutGroup read FPluginGroup write FPluginGroup;
  end;

  {
    基础对话框

    默认情况下根据内容自动调整窗体的大小
  }
  TBaseDialog = class(TBaseLayoutView)
  private
    FImage: TImage;
    FOKButton: TcxButton;
    FCancelButton: TcxButton;
    FImageItem: TdxLayoutItem;
    FOKItem: TdxLayoutItem;
    FCancelItem: TdxLayoutItem;
    FDialogGroup: TdxLayoutGroup;
    FBottomGroup: TdxLayoutGroup;
    FButtonGroup: TdxLayoutGroup;
    FInOKButton: Boolean;
    procedure SetDialogImage(AName: string);
    procedure DoFormShow(Sender: TObject);
    procedure DoOKClick(Sender: TObject);
    procedure DoCancelClick(Sender: TObject);
    procedure DoFormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure SetLayoutAutoSize(const Value: Boolean);
    function GetActions: TActionList;
  protected
    procedure BuildViewLayout(); override;
    function GetPluginLayoutGroup(AOperation: TBaseOperation)
      : TComponent; override;
  public

    function Execute(): Boolean; virtual;
    procedure DoDialogOK(Sender: TObject); virtual;
    procedure DoDialogCancel(Sender: TObject); virtual;
    procedure DoDialogShow(Sender: TObject); virtual;
    procedure BuildDialog; virtual;

    property Actions: TActionList read GetActions;
    property LayoutAutoSize: Boolean write SetLayoutAutoSize;
    property Image: TImage read FImage;
    property ImageName: string write SetDialogImage;
    property OKButton: TcxButton read FOKButton;
    property CancelButton: TcxButton read FCancelButton;
    property DialogGroup: TdxLayoutGroup read FDialogGroup;
    property BottomGroup: TdxLayoutGroup read FBottomGroup;
    property ButtonGroup: TdxLayoutGroup read FButtonGroup;
    property ImageItem: TdxLayoutItem read FImageItem;
    property OKItem: TdxLayoutItem read FOKItem;
    property CancelItem: TdxLayoutItem read FCancelItem;
  end;

  {
    单选选择对话框
  }
  TSelectDialog = class(TBaseDialog)
  private
    FListBox: TcxListBox;
    procedure SetSelections(Value: TStrings);
    function GetSelectIndex(): Integer;
    procedure SetSelectIndex(const Value: Integer);
    function GetSelections: TStrings;
  protected
    procedure BuildDialog; override;
  public
    property Selections: TStrings read GetSelections;
    property SelectIndex: Integer read GetSelectIndex write SetSelectIndex;
    property ListBox: TcxListBox read FListBox;
  end;

  {
    文本输入对话框
  }
  TTextDialog = class(TBaseDialog)
  private
    FMaskEdit: TcxMaskEdit;
    FEditItem: TdxLayoutItem;
  protected
    procedure BuildDialog; override;
    function GetText(): string;
    procedure SetText(AValue: string);
  public
    property EditItem: TdxLayoutItem read FEditItem;
    property MaskEdit: TcxMaskEdit read FMaskEdit;
    property Text: string read GetText write SetText;
  end;

  {
    日期选择对话框
  }
  TDateEditDialog = class(TBaseDialog)
  private
    FDateEdit: TcxDateEdit;
    FDateItem: TdxLayoutItem;
  protected
    procedure BuildDialog; override;
  public
    property DateEdit: TcxDateEdit read FDateEdit;
    property DateItem: TdxLayoutItem read FDateItem;
  end;

  {
    复选框对话框
  }
  TCheckBoxDialog = class(TBaseDialog)
  private
    FCheckBox: TcxCheckBox;
    function GetChecked: Boolean;
    procedure WriteChecked(const Value: Boolean);
  protected
    procedure BuildDialog; override;
  public
    property CheckBox: TcxCheckBox read FCheckBox;
    property Checked: Boolean read GetChecked write WriteChecked;
  end;

  {
    多项选择对话框
    调用前设置CheckStrings的名值对, 完成后调用GetCheckedValue
  }
  TCheckListDialog = class(TBaseDialog)
  private
    FCheckListBox: TcxCheckListBox;
    FStrings: TStrings;
    procedure SetItemHeight(const Value: Integer);
  protected
    procedure BuildDialog; override;
    procedure DoDialogOK(Sender: TObject); override;
    procedure BuildCheckListBox();
  public
    destructor Destroy(); override;
    function Execute(): Boolean; override;
    function GetCheckedValue(ADelimiter: Char = ','): string;
    property CheckStrings: TStrings read FStrings;
    property CheckListBox: TcxCheckListBox read FCheckListBox;
    property ItemHeight: Integer write SetItemHeight;
  end;

  { 业务打印机 }

  TBusinessPrinters = class(TObject)
  private
    FPrinters: TStringList;
  public
    constructor Create();
    destructor Destroy(); override;

    procedure RegisterBusinessPrinter(BusinessName: string);
    function GetBusinessPrinter(BusinessName: string): string;

    property Printers: TStringList read FPrinters;
  end;

  {
    业务-打印机选择视图

    维护业务名称和打印机名称配对关系
  }

  TBusinessPrinterDialog = class(TBaseDialog)
  private
    FPrinters: TBusinessPrinters;
  protected
    procedure BuildDialog; override;
  public
    constructor Create(AOwner: TComponent; APrinters: TBusinessPrinters);
    function Execute(): Boolean; override;
  end;

  TControlWrapper = class;

  {
    被包装组件的信息
    继承类可添加特定属性
  }
  TWrapInfo = class
  private
    FWrapper: TControlWrapper;
    FTarget: TComponent;
  protected
  public
    constructor Create(ATarget: TComponent); virtual;
    destructor Destroy(); override;
    property Target: TComponent read FTarget;
    property Wrapper: TControlWrapper read FWrapper;

    procedure Wrap(); virtual;
    procedure UnWrap(); virtual;
  end;

  TWrapInfoClass = class of TWrapInfo;

  {
    基础包装器

    包装后的控件具备定制的特性；
    可反复包装(每次包装的设置不同，达到不同效果)；
    接管传入的包装信息
  }
  TControlWrapper = class(TComponent)
  private
    FWrappedControls: TObjectList;
  protected
    procedure Notification(AComponent: TComponent;
      Operation: Classes.TOperation); override;

    function FindWrappedControl(ATarget: TComponent): Integer;
    function GetWrapInfoClass(): TWrapInfoClass; virtual;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy(); override;

    function FindWrapInfo(ATarget: TComponent): TWrapInfo;

    function Wrap(ATarget: TComponent): TWrapInfo; virtual;
    procedure AddWrap(AWrapInfo: TWrapInfo);
    procedure UnWrap(ATarget: TComponent); virtual;

    property WrapInfoClass: TWrapInfoClass read GetWrapInfoClass;
  end;

  {
    TWrapperManager = class
    private
    FWrapperList: TObjectList;
    public
    constructor Create();
    destructor Destroy(); override;

    procedure RegisterWrapper(AWrapper: TControlWrapper);

    end;
  }

  { TcxGridTableView表格操作菜单包装器 }
  TTableViewPopupMenuWrapper = class
  private
    procedure GroupBoxEvent(Sender: TObject);
    procedure FooterEvent(Sender: TObject);
    procedure BestWidthEvent(Sender: TObject);
    procedure AllBestWidthEvent(Sender: TObject);
    procedure FooterSummaryEvent(Sender: TObject);
    procedure FooterCountEvent(Sender: TObject);
    procedure FooterMaxEvent(Sender: TObject);
    procedure FooterMinEvent(Sender: TObject);
    procedure FooterAvgEvent(Sender: TObject);
    procedure FooterNoneEvent(Sender: TObject);
    procedure AlignLeftEvent(Sender: TObject);
    procedure AlignRightEvent(Sender: TObject);
    procedure AlignCenterEvent(Sender: TObject);
    procedure SortAscendEvent(Sender: TObject);
    procedure SortDescendEvent(Sender: TObject);
    procedure SortNoneEvent(Sender: TObject);
  public
    procedure WrapTableView(ATableView: TcxCustomGridTableView;
      APopupMenu: TdxBarPopupMenu);
  end;

  TColorNodes = array of Variant;
  TColorArray = array of TColor;

  {
    表格自定义颜色绘制包装信息

    颜色节点：------- 0 ------- 1 -------- 2 --- 3 ---
    颜色值：  $FFFFFF   $FF0000   $00FF00    $0000FF
    颜色节点和颜色值必须一致

    颜色节点即某个字段可能的值，可以是整数、小数、字符串
    类型是整数和小数时，用<=进行比较，且必须按从小到大排序
    类型是字符串时，用=进行比较

    在重新BuildTableView, BuildBandView, BuildTreeView应重新Wrap
  }
  TTableColorWrapInfo = class(TWrapInfo)
  private
    FColorNodes: TColorNodes;
    FColors: TColorArray;
    FDataTable: TDADataTable;
    FColorField: string;
    FTableColumn: TcxCustomGridTableItem; // TcxGridColumn;
    // FCardRow: TcxGridCardViewRow;
    FTreeColumn: TcxTreeListColumn;
    procedure DoCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure DoCustomDrawTreeCell(Sender: TcxCustomTreeList;
      ACanvas: TcxCanvas; AViewInfo: TcxTreeListEditCellViewInfo;
      var ADone: Boolean);
  public
    procedure Wrap(); override;
    procedure UnWrap(); override;

    property DataTable: TDADataTable read FDataTable;
    property ColorField: string read FColorField;
    property ColorNodes: TColorNodes read FColorNodes write FColorNodes;
    property Colors: TColorArray read FColors write FColors;
  end;

  {
    TcxGridTableView表格自定义背景颜色包装器

    按某个字段的值取得对应的颜色
    TcxGridTableView.DataController.DataSource必须是TDADataSource
    可包装TcxGridDBTableView, TcxGridDBBandedTableView,TcxDBTreeList三种数据视图
  }
  TTableViewColorWrapper = class(TControlWrapper)
  private
    FOldOnBuildTableView: TOnBuildTableView;
    FOldOnBuildTreeView: TOnBuildTreeView;
  protected
    procedure InternalWrap(AWrapInfo: TWrapInfo);
    function GetWrapInfoClass(): TWrapInfoClass; override;

    procedure DoBuildTableView(ATableView: TcxCustomGridTableView);
    procedure DoBuildTreeView(ATreeView: TcxDBTreeList);
  public
    constructor Create(AOwner: TComponent); override;
    function Wrap(ATarget: TComponent): TWrapInfo; override;
  end;

  THttpDownloadThread = class(TThread)
  private
    FUrl: string;
    FFileName: string;
    FProgressHandle: HWND;
    procedure GetFile(Url: string;
      Stream: TStream { ; ReceiveProgress: TclSocketProgressEvent } );
    procedure OnReceiveProgress(Sender: TObject;
      ABytesProceed, ATotalBytes: Integer);
    procedure SetPercent(Percent: Double);
  protected
    procedure Execute; override;
  public
    constructor Create(Url, FileName: string; PrograssHandle: HWND);
  end;

  { 打印选择对话框 }
  TReporterSelectDialog = class(TSelectDialog)
  private
    FPreviewCheckBox: TcxCheckBox;
    FPrintersCombo: TcxComboBox;
    FParamItem: TdxLayoutItem;
    FParamView: TControl; // TTableGridDataView;
    FParamData: TCustomData;

    function GetPreview: Boolean;
    procedure SetPreview(const Value: Boolean);
    function GetPrinterName: string;
    procedure SetPrinterName(const Value: string);
    function GetReporterName: string;
    procedure DoListBoxClick(Sender: TObject);
    procedure SetPrintParamData(const Value: TCustomData);
  protected
    procedure BuildDialog; override;
  public
    function Execute(): Boolean; override;
    property ReporterName: string read GetReporterName;
    property PrintPreview: Boolean read GetPreview write SetPreview;
    property PrinterName: string read GetPrinterName write SetPrinterName;
    property PrintParamData: TCustomData read FParamData
      write SetPrintParamData;
  end;

procedure Bitmap32ToJpg(ABitmap32: TBitmap32; const AFileName: string;
  AQuality: Integer; AHorzRes, AVertRes: Integer);

// function DownloadImage(const URL: string; ImageType: TGraphicClass = nil): TBitMap;
function DownloadImage(const Url: string): TdxGPImage;

procedure BuildLayoutToolBar(AGroup: TdxLayoutGroup;
  AActions: TActionList); overload;

procedure BuildLayoutToolBar(AGroup: TdxLayoutGroup;
  AActions: array of TAction); overload;

function BuildLayoutButton(AItem: TdxLayoutItem; AAction: TAction): TcxButton;

function BuildLayoutDropDownButton(AItem: TdxLayoutItem;
  AActions: array of TAction; AFlag: Integer): TcxButton;

procedure BuildDropDownButton(AButton: TcxButton; AActions: array of TAction);

function BuildLayoutDropDownOperation(AItem: TdxLayoutItem;
  AOperation: TBaseOperation; AOwner: TBaseView): TOperationAction;

procedure BuildBarPopupMenu(AOwner: TComponent; APopupMenu: TdxBarPopupMenu;
  AActions: TActionList; const ASubMenuCaption: string); overload;

procedure BuildBarPopupMenu(AOwner: TComponent; APopupMenu: TdxBarPopupMenu;
  AActions: array of TAction; const ASubMenuCaption: string); overload;

procedure CreateBarPopupMenuSeparator(AOwner: TComponent;
  ALinks: TdxBarItemLinks; ACaption: string);

function CreateBarManager(AOwner: TForm): TdxBarManager;

function CreateBar(ABarManager: TdxBarManager; const ACaption: string): TdxBar;

procedure BuildDevToolBar(ABar: TdxBar; AActions: TActionList;
  AFlag: Integer); overload;

procedure BuildDevToolBar(ABar: TdxBar; AActions: array of TAction;
  AFlag: Integer); overload;

function BuildAction(AOwner: TActionList; ACaption, AImageName, AHint: string;
  AOnUpdate, AOnExecute: TNotifyEvent; AShortCut: TShortCut = 0;
  ATag: Integer = 0; AVisible: Boolean = True): TAction;

function BuildDXButton(AOwner: TComponent; ACaption: string;
  AOnClick: TNotifyEvent): TcxButton;

function BuildDXCheckBox(AOwner: TComponent; ACaption: string;
  AOnClick: TNotifyEvent; AChecked: Boolean; AColor: TColor): TcxCheckBox;

function DX_InputQuery(const ACaption, APrompt, AEditMask: string;
  var Value: string): Boolean;

function DX_SelectQuery(const ACaption: string; ASource: TStrings;
  var Index: Integer): Boolean;

function ProgressForm(): TProgressForm;

function ReporterDialog: TReporterSelectDialog;

procedure ExpandTreeView(Node: TcxTreeListNode; ExpandLevel: Integer = 1);

var
  CursorList: TFileCursorList;
  TableViewPopupMenuWrapper: TTableViewPopupMenuWrapper;
  TableViewColorWrapper: TTableViewColorWrapper;
  BusinessPrinters: TBusinessPrinters;

implementation

uses App_DAView;

var
  TextDialog: TTextDialog;
  SelectDialog: TSelectDialog;
  FProgressForm: TProgressForm;
  FReporterDialog: TReporterSelectDialog;

procedure ExpandTreeView(Node: TcxTreeListNode; ExpandLevel: Integer);
var
  I: Integer;
begin
  for I := 0 to Node.Count - 1 do
  begin
    Node[I].Expand(False);
    if ExpandLevel > 1 then
      ExpandTreeView(Node[I], ExpandLevel - 1);
  end;
end;

function ReporterDialog: TReporterSelectDialog;
begin
  if FReporterDialog = nil then
    FReporterDialog := TReporterSelectDialog.Create(Application);
  Result := FReporterDialog;
end;

type
  TcxCheckListBoxHack = class(TcxCheckListBox);

function ProgressForm(): TProgressForm;
begin
  if FProgressForm = nil then
    FProgressForm := TProgressForm.Create(Application);
  Result := FProgressForm;
end;

{ 显示单选择对话框 }

function DX_SelectQuery(const ACaption: string; ASource: TStrings;
  var Index: Integer): Boolean;
begin
  if SelectDialog = nil then
  begin
    SelectDialog := TSelectDialog.Create(Application);
    SelectDialog.LayoutAutoSize := False;
  end;
  SelectDialog.Selections.Assign(ASource);
  SelectDialog.SelectIndex := 0;
  SelectDialog.Caption := ACaption;
  Result := SelectDialog.Execute;
  Index := SelectDialog.SelectIndex;
end;

{ 显示文本输入对话框 }

function DX_InputQuery(const ACaption, APrompt, AEditMask: string;
  var Value: string): Boolean;
begin
  if TextDialog = nil then
    TextDialog := TTextDialog.Create(Application);
  with TextDialog do
  begin
    Caption := ACaption;
    EditItem.Caption := APrompt;
    Text := Value;
    MaskEdit.Properties.EditMask := AEditMask;
    Result := Execute;
    if Result then
      Value := Text;
  end;
end;

{ 创建TAction }

function BuildAction(AOwner: TActionList; ACaption, AImageName, AHint: string;
  AOnUpdate, AOnExecute: TNotifyEvent; AShortCut: TShortCut = 0;
  ATag: Integer = 0; AVisible: Boolean = True): TAction;
begin
  Result := TAction.Create(AOwner);
  with Result do
  begin
    ActionList := AOwner;
    Caption := ACaption;
    if AHint = '' then
      Hint := ACaption
    else
      Hint := AHint;
    ImageIndex := AppCore.ToolBarImage.IndexOf(AImageName);
    OnUpdate := AOnUpdate;
    OnExecute := AOnExecute;
    ShortCut := AShortCut;
    Tag := ATag;
    Visible := AVisible;
  end;
end;

{ 创建TcxButton }

function BuildDXButton(AOwner: TComponent; ACaption: string;
  AOnClick: TNotifyEvent): TcxButton;
var
  CaptionWidth: Integer;
begin
  Result := TcxButton.Create(AOwner);

  if AppCore.MainView <> nil then
    CaptionWidth := Round(TForm(AppCore.MainView)
      .Canvas.TextWidth(ACaption) * 1.3)
  else
    CaptionWidth := 0;

  with Result do
  begin
    if Width < CaptionWidth then
      Width := CaptionWidth;
    if AOwner.InheritsFrom(TWinControl) then
      Parent := TWinControl(AOwner);
    ParentFont := True;
    Caption := ACaption;
    OnClick := AOnClick;
    Height := AppCore.ToolBarImage.ImageList.Height + 8;
  end;
end;

{ 创建CheckBox控件 }

function BuildDXCheckBox(AOwner: TComponent; ACaption: string;
  AOnClick: TNotifyEvent; AChecked: Boolean; AColor: TColor): TcxCheckBox;
begin
  Result := TcxCheckBox.Create(AOwner);
  with Result do
  begin
    ParentFont := True;
    Caption := ACaption;
    Transparent := True;
    Checked := AChecked;
    // AutoSize := True;
    if AOwner.InheritsFrom(TForm) then
    begin
      Parent := TWinControl(AOwner);
      // TextWidth计算不正确?  直接取主窗体的Canvas
      Width := Round(TForm(AppCore.MainView).Canvas.TextWidth(ACaption) * 1.5);
    end;
    // AutoSize := True; // 不起作用?
    OnClick := AOnClick;
    if AColor <> clNone then
      Style.TextColor := AColor;
  end;
end;

{ 创建BarManager }

function CreateBarManager(AOwner: TForm): TdxBarManager;
begin
  Result := TdxBarManager.Create(AOwner);
  Result.Style := DevExpress.BarManager.Style;
  Result.MenuAnimations := DevExpress.BarManager.MenuAnimations;
  // 不能用ImageOptions.Assign???
  Result.ImageOptions.StretchGlyphs := False;
  Result.Images := DevExpress.BarManager.Images;
end;

function CreateBar(ABarManager: TdxBarManager; const ACaption: string): TdxBar;
begin
  Result := ABarManager.AddToolBar();
  Result.Caption := ACaption;
  Result.AllowCustomizing := False;
  Result.AllowClose := False;
  Result.ShowMark := False;
end;

{ 根据Action创建工具栏 }

procedure BuildDevToolBar(ABar: TdxBar; AActions: TActionList; AFlag: Integer);
var
  ActionArray: array of TAction;
  I: Integer;
begin
  SetLength(ActionArray, AActions.ActionCount);
  for I := Low(ActionArray) to High(ActionArray) do
    ActionArray[I] := TAction(AActions[I]);
  BuildDevToolBar(ABar, ActionArray, AFlag);
end;

{ 根据Action创建工具栏 }

procedure BuildDevToolBar(ABar: TdxBar; AActions: array of TAction;
  AFlag: Integer);
var
  I: Integer;
  Button: TdxBarButton;
begin
  Assert(ABar <> nil);

  for I := Low(AActions) to High(AActions) do
  begin
    if (not TAction(AActions[I]).Visible) then
      Continue;

    Button := TdxBarButton.Create(ABar.BarManager);
    Button.Action := AActions[I];
    Button.ButtonStyle := bsDefault;
    if AActions[I].ImageIndex < 0 then
      Button.PaintStyle := psCaption
    else if ((AFlag and BTN_SHOWCAPTION) <> 0) then
      Button.PaintStyle := psCaptionGlyph;
    ABar.ItemLinks.Add(Button);
  end;
end;

{ 创建分隔条菜单 }

procedure CreateBarPopupMenuSeparator(AOwner: TComponent;
  ALinks: TdxBarItemLinks; ACaption: string);
var
  Separator: TdxBarSeparator;
begin
  if ALinks.Count = 0 then
    Exit;
  Separator := TdxBarSeparator.Create(AOwner);
  Separator.Caption := ACaption;
  Separator.ShowCaption := False;
  ALinks.Add(Separator);
end;

{ 根据TActionList创建快捷菜单 }

procedure BuildBarPopupMenu(AOwner: TComponent; APopupMenu: TdxBarPopupMenu;
  AActions: TActionList; const ASubMenuCaption: string);
var
  ActionArray: array of TAction;
  I, K: Integer;
begin
  SetLength(ActionArray, AActions.ActionCount);
  K := 0;
  for I := Low(ActionArray) to High(ActionArray) do
  begin
    if (TAction(AActions[I]).Tag and BTN_NOPOPUPMENU <> 0) then
      Continue;
    ActionArray[K] := TAction(AActions[I]);
    Inc(K);
  end;
  SetLength(ActionArray, K);
  BuildBarPopupMenu(AOwner, APopupMenu, ActionArray, ASubMenuCaption);
end;

procedure BuildBarPopupMenu(AOwner: TComponent; APopupMenu: TdxBarPopupMenu;
  AActions: array of TAction; const ASubMenuCaption: string);
var
  I: Integer;
  Button: TdxBarButton;
  SubMenu: TdxBarSubItem;
  Links: TdxBarItemLinks;
begin
  Assert(APopupMenu <> nil);
  Assert(APopupMenu.BarManager <> nil);

  if ASubMenuCaption <> '' then
  begin
    SubMenu := TdxBarSubItem.Create(AOwner);
    SubMenu.Caption := ASubMenuCaption;
    APopupMenu.ItemLinks.Add(SubMenu);
    Links := SubMenu.ItemLinks;
  end
  else
  begin
    Links := APopupMenu.ItemLinks;
    CreateBarPopupMenuSeparator(AOwner, Links, '');
  end;

  for I := Low(AActions) to High(AActions) do
  begin
    Button := TdxBarButton.Create(AOwner);
    Button.Action := AActions[I];
    Links.Add(Button);
  end;
end;

{ 把Bitmap32转换为Jpg格式，并且指定品质和分辨率，单位是DPI }

procedure Bitmap32ToJpg(ABitmap32: TBitmap32; const AFileName: string;
  AQuality: Integer; AHorzRes, AVertRes: Integer);
var
  Bitmap: TBitmap;
  Jpg: TJpegImage;
begin
  Bitmap := TBitmap.Create;
  Jpg := TJpegImage.Create;
  try
    Bitmap.Assign(ABitmap32);
    Jpg.Assign(Bitmap);
    Jpg.CompressionQuality := AQuality;
    Jpg.Compress;
    Jpg.SaveToFile(AFileName);
    if (AHorzRes > 72) and (AVertRes > 72) then
      SetJpgResolution(AFileName, AHorzRes, AVertRes);
  finally
    FreeAndNil(Bitmap);
    FreeAndNil(Jpg);
  end;
end;

{ 用TdxLayoutControl创建ToolBar; }

procedure BuildLayoutToolBar(AGroup: TdxLayoutGroup; AActions: TActionList);
var
  I: Integer;
  ActionArray: array of TAction;
begin
  SetLength(ActionArray, AActions.ActionCount);
  for I := Low(ActionArray) to High(ActionArray) do
    ActionArray[I] := TAction(AActions[I]);
  BuildLayoutToolBar(AGroup, ActionArray);
end;

procedure BuildLayoutToolBar(AGroup: TdxLayoutGroup;
  AActions: array of TAction); overload;
var
  I: Integer;
begin
  with AGroup do
  begin
    // LookAndFeel := DevExpress.dxLayoutFeelToolbar;
  end;

  for I := Low(AActions) to High(AActions) do
  begin
    {
      // 类别不同时添加分隔项
      if (I > 0) and (AActions[I].Category <> AActions[I - 1].Category) then
      begin
      AGroup.CreateItem(TdxLayoutSeparatorItem);
      end;
    }
    // LayoutItem的可见性由Action决定，但如论如何都会创建LayoutItem
    if (AActions[I].Tag and BTN_NOTOOLBAR = 0) then
      BuildLayoutButton(AGroup.CreateItemForControl(nil), AActions[I]);
  end;
end;

function BuildLayoutButton(AItem: TdxLayoutItem; AAction: TAction): TcxButton;
var
  AFlag: Integer;
begin
  AFlag := AAction.Tag;

  Result := TcxButton.Create(AItem.Owner);
  // Result.ParentFont := True;
  AItem.Control := Result;
  AItem.Visible := AAction.Visible;
  AItem.Tag := Integer(AAction);

  with Result do
  begin
    if AAction.Hint = '' then
      AAction.Hint := AAction.Caption;

    Action := AAction;

    if AAction.ActionList <> nil then
      Height := AAction.ActionList.Images.Height + 8;

    SpeedButtonOptions.Flat := (AFlag and BTN_NOTFLAT) = 0;
    SpeedButtonOptions.AllowAllUp := True;
    SpeedButtonOptions.CanBeFocused := (AFlag and BTN_CANBEFOCUSED) <> 0;
    SpeedButtonOptions.Transparent := (AFlag and BTN_NOTTRANSPARENT) = 0;
    SpeedButtonOptions.GroupIndex := AAction.GroupIndex; // 大于0时Down才有效
    SpeedButtonOptions.Down := AAction.Checked;

    // 不显示标题，并且图标存在时
    if ((AFlag and BTN_SHOWCAPTION) = 0) and (AAction.ImageIndex > -1) then
    begin
      Caption := '';
      Width := AAction.ActionList.Images.Width + 12;
    end
    else
    begin
      // TdxLayoutControl的Canvas.Font会变???
      // TdxLayoutControl(Parent).Canvas.Font := TdxLayoutControl(Parent).Font;
      // Width := TdxLayoutControl(Parent).Canvas.TextWidth(AAction.Caption) + 6;
      Width := GetTextWidth(AAction.Caption, TdxLayoutControl(Parent).Font) + 6;
      if (AAction.ImageIndex > -1) then
        Width := Width + AAction.ActionList.Images.Width + 4;
    end;
  end;
end;

function BuildLayoutDropDownButton(AItem: TdxLayoutItem;
  AActions: array of TAction; AFlag: Integer): TcxButton;
begin
  Assert(Length(AActions) > 0);
  Result := BuildLayoutButton(AItem, AActions[0]);
  if Length(AActions) > 1 then
  begin
    Result.Width := Result.Width + 16;
    BuildDropDownButton(Result, AActions);
  end;
end;

procedure BuildDropDownButton(AButton: TcxButton; AActions: array of TAction);
var
  I: Integer;
  Popup: TPopupMenu;
  Item: TMenuItem;
begin
  Assert(Length(AActions) > 0);

  Popup := TPopupMenu.Create(AButton.Owner);
  Popup.Images := AActions[0].ActionList.Images;
  Popup.AutoHotkeys := maManual;

  if AButton.Action = nil then
  begin
    AButton.Action := AActions[0];
  end;
  AButton.Kind := cxbkDropDownButton;
  AButton.DropDownMenu := Popup;

  for I := Low(AActions) + 1 to High(AActions) do
  begin
    Item := TMenuItem.Create(Popup.Owner);
    Item.Action := AActions[I];
    Popup.Items.Add(Item);
  end;
end;

{ 根据TBaseOperation和它的的Actions创建一个下拉按钮 }

function BuildLayoutDropDownOperation(AItem: TdxLayoutItem;
  AOperation: TBaseOperation; AOwner: TBaseView): TOperationAction;
var
  I: Integer;
  ActionArray: array of TAction;
begin
  Result := AOperation.GetOperationAction(AOwner);
  SetLength(ActionArray, AOperation.Actions.ActionCount + 1);
  ActionArray[0] := Result;
  for I := Low(ActionArray) to High(ActionArray) - 1 do
    ActionArray[I + 1] := TAction(AOperation.Actions[I]);

  BuildLayoutDropDownButton(AItem, ActionArray, 0);
end;

{ 下载图片 }

function DownloadImage(const Url: string): TdxGPImage;
var
  HTTP: TIdHttp;
  Stream: TStream;
begin
  HTTP := TIdHttp.Create(nil);
  Stream := TMemoryStream.Create;
  try
    Result := TdxGIFImage.Create;
    HTTP.Get(Url, Stream);
    try
      Stream.Position := 0;
      Result.LoadFromStream(Stream);
    except
      Result.Free;
      Result := nil;
      // raise;
    end
  finally
    Stream.Free;
    HTTP.Free;
  end
end;

{
  图片下载的原始版本：
  function DownloadImage(const URL: string; ImageType: TGraphicClass = nil): TBitMap;
  var
  HTTP: TIdHttp;
  Stream: TStream;
  IMG: TGraphic;
  STR: AnsiString;
  begin
  HTTP := TIdHttp.Create(nil);
  try
  Stream := TMemoryStream.Create;
  try
  HTTP.Get(URL, Stream);
  if not Assigned(ImageType) then
  begin
  Stream.Position := 0;
  SetLength(STR, 5);
  Stream.Read(STR[1], LENGTH(STR));
  if COPY(STR, 1, 2) = 'BM' then
  ImageType := TBitMap
  else if COPY(STR, 1, 3) = 'GIF' then
  ImageType := TGIFImage
  else if COPY(STR, 2, 3) = 'PNG' then
  ImageType := TPngObject
  else if (ORD(STR[1]) = $FF) and (ORD(STR[2]) = $D8) then
  ImageType := TJPEGImage
  end;
  if not Assigned(ImageType) then
  raise EInvalidImage.Create('Unrecognized file format!');
  IMG := ImageType.Create;
  try
  Stream.Position := 0;
  IMG.LoadFromStream(Stream);
  Result := TBitMap.Create;
  try
  Result.Assign(IMG)
  except
  Result.Free;
  raise
  end
  finally
  IMG.Free
  end
  finally
  Stream.Free
  end
  finally
  HTTP.Free
  end
  end;
}

{ TControlWrapper }

constructor TControlWrapper.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FWrappedControls := TObjectList.Create(True);
end;

destructor TControlWrapper.Destroy;
begin
  FreeAndNil(FWrappedControls);
  inherited;
end;

function TControlWrapper.FindWrapInfo(ATarget: TComponent): TWrapInfo;
var
  Index: Integer;
begin
  Result := nil;
  Index := FindWrappedControl(ATarget);
  if Index > -1 then
    Result := TWrapInfo(FWrappedControls[Index]);
end;

function TControlWrapper.FindWrappedControl(ATarget: TComponent): Integer;
var
  I: Integer;
begin
  Result := -1;
  for I := 0 to FWrappedControls.Count - 1 do
  begin
    if TWrapInfo(FWrappedControls[I]).Target = ATarget then
    begin
      Result := I;
      Exit;
    end;
  end;
end;

{
  活动顺序：
  入口点1   ATarget.Free ->
  TControlWrapper.Notification ->
  入口点2   TControlWrapper.Unwrap ->
  TControlWrapper.FWrappedControls.Delete ->
  TWrapInfo.Destroy ->
  TControlWrapper.InternalUnwrap

}

procedure TControlWrapper.UnWrap(ATarget: TComponent);
var
  I: Integer;
begin
  I := FindWrappedControl(ATarget);
  if I > -1 then
  begin
    FWrappedControls.Delete(I); // 造成TWrapInfo释放
  end;
end;

{ 可以手动创建包装信息，然后再进行包装 }

procedure TControlWrapper.AddWrap(AWrapInfo: TWrapInfo);
begin
  // 先取消包装，达到重新包装的目的(每次包装的设置不同)
  UnWrap(AWrapInfo.Target);
  AWrapInfo.FWrapper := Self;
  FWrappedControls.Add(AWrapInfo);
  AWrapInfo.Target.FreeNotification(Self);
end;

function TControlWrapper.Wrap(ATarget: TComponent): TWrapInfo;
begin
  Result := WrapInfoClass.Create(ATarget);
  AddWrap(Result);
end;

procedure TControlWrapper.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  if not(csDestroying in ComponentState) and (Operation = opRemove) and
    (FWrappedControls <> nil) then
    UnWrap(AComponent);
  inherited;
end;

function TControlWrapper.GetWrapInfoClass: TWrapInfoClass;
begin
  Result := TWrapInfo;
end;

{ TWrapInfo }

constructor TWrapInfo.Create(ATarget: TComponent);
begin
  FTarget := ATarget;
end;

destructor TWrapInfo.Destroy;
begin
  UnWrap();
  inherited;
end;

procedure TWrapInfo.UnWrap;
begin

end;

{ 在准备好之后再调用 }

procedure TWrapInfo.Wrap;
begin

end;

{ TProgressForm }

procedure TProgressForm.BeginProgress;
begin
  FActiveForm := Screen.ActiveForm;
  if FActiveForm <> nil then
    FActiveForm.Enabled := False;

  FHintItem.CaptionOptions.Text := '请等待...';
  FProgressBar.Position := 0;
  FCancelButton.Visible := True;
  FCanceled := False;

  Show;
end;

procedure TProgressForm.CancelButtonClickEvent(Sender: TObject);
begin
  FCanceled := True;
end;

constructor TProgressForm.Create(AOwner: TComponent);
begin
  CreateNew(AOwner);
  Caption := '进度指示器';
  Font.Size := 10;
  BorderIcons := [];
  BorderStyle := bsSizeable;
  FormStyle := fsStayOnTop;
  Position := poMainFormCenter;
  ClientWidth := 320;
  OnShow := FormShowEvent;

  FProgressBar := TcxProgressBar.Create(Self);
  FCancelButton := TcxButton.Create(Self);
  FCancelButton.Caption := '取消';
  FCancelButton.OnClick := CancelButtonClickEvent;

  FFormLayout := TdxLayoutControl.Create(Self);
  with FFormLayout do
  begin
    Align := alTop;
    AutoSize := True;
    Items.LayoutDirection := ldVertical;
    Items.AlignVert := avTop;
    Items.AlignHorz := ahClient;
    Parent := Self;
    LookAndFeel := DevExpress.dxLayoutDialog;
  end;

  with FFormLayout.Items.CreateGroup() do
  begin
    LayoutDirection := ldVertical;
    FHintItem := TdxLayoutItem(CreateItem());
    FHintItem.CaptionOptions.AlignVert := dxLayoutCommon.tavCenter;
    // FHintItem.Height := 32;
    CreateItemForControl(FProgressBar);
    CreateItemForControl(FCancelButton).AlignHorz := ahCenter;
  end;
end;

procedure TProgressForm.EndProgress;
begin
  if FActiveForm <> nil then
    FActiveForm.Enabled := True;
  Close();
end;

procedure TProgressForm.FormShowEvent(Sender: TObject);
begin
  ClientHeight := FFormLayout.Height + 8;
end;

procedure TProgressForm.SetCancelButtonVisible(AVisible: Boolean);
begin
  FCancelButton.Visible := AVisible;
end;

procedure TProgressForm.SetHintFmt(const AFormat: string;
  AParam: array of const);
begin
  FHintItem.CaptionOptions.Text := Format(AFormat, AParam);
  Application.ProcessMessages;
end;

procedure TProgressForm.SetHintLabel(const ACaption: string);
begin
  FHintItem.CaptionOptions.Text := ACaption;
  Application.ProcessMessages;
end;

procedure TProgressForm.SetProgress(AMax, APosition: Integer);
begin
  FProgressBar.Properties.Max := AMax;
  FProgressBar.Position := APosition;
  Application.ProcessMessages;
end;

{ TBrowseImageForm }

class procedure TImageBrowseForm.BrowseImage(AOnBrowseEvent: TBrowseImageEvent);
begin
  with TImageBrowseForm.Create(nil) do
    try
      OnBrowseEvent := AOnBrowseEvent;
      RefreshImage;
      ShowModal;
    finally
      Free;
    end;
end;

procedure TImageBrowseForm.BrowseNext;
begin
  if Assigned(FOnBrowseEvent) then
  begin
    FOnBrowseEvent(FImgView, baNextImage, FImgView.Bitmap);
  end;
end;

procedure TImageBrowseForm.BrowseNextActionExecuteEvent(Sender: TObject);
begin
  BrowseNext;
end;

procedure TImageBrowseForm.BrowsePrior;
begin
  if Assigned(FOnBrowseEvent) then
  begin
    FOnBrowseEvent(FImgView, baPreviousImage, FImgView.Bitmap)
  end;
end;

procedure TImageBrowseForm.BrowsePriorActionExecuteEvent(Sender: TObject);
begin
  BrowsePrior;
end;

procedure TImageBrowseForm.BuildActions;
var
  Rotate90, Rotate180, RotateMinus90: TAction;
begin
  FToolBarGroup := FLayout.Items.CreateGroup();
  FToolBarGroup.LayoutDirection := ldHorizontal;

  FActions := TActionList.Create(Self);
  FActions.Images := AppCore.ToolBarImage.ImageList;
  with TAction.Create(Self) do
  begin
    Caption := '上一张';
    OnExecute := BrowsePriorActionExecuteEvent;
    ActionList := FActions;
    ImageIndex := AppCore.ToolBarImage.IndexOf('prior');
  end;
  with TAction.Create(Self) do
  begin
    Caption := '下一张';
    OnExecute := BrowseNextActionExecuteEvent;
    ActionList := FActions;
    ImageIndex := AppCore.ToolBarImage.IndexOf('next');
  end;
  with TAction.Create(Self) do
  begin
    Caption := '刷新';
    OnExecute := RefreshActionExecuteEvent;
    ActionList := FActions;
    ImageIndex := AppCore.ToolBarImage.IndexOf('refresh');
  end;

  BuildLayoutToolBar(FToolBarGroup, FActions);

  with TAction.Create(Self) do
  begin
    Caption := '适合宽度';
    OnExecute := FitControlActionExecuteEvent;
    ActionList := FActions;
    ImageIndex := AppCore.ToolBarImage.IndexOf('fit_width');
  end;

  with TAction.Create(Self) do
  begin
    Caption := '100%';
    OnExecute := OriginalSizeActionExecuteEvent;
    ActionList := FActions;
    ImageIndex := AppCore.ToolBarImage.IndexOf('query');
  end;

  with TAction.Create(Self) do
  begin
    Caption := '放大';
    OnExecute := ZoomOutActionExecuteEvent;
    ActionList := FActions;
    ImageIndex := AppCore.ToolBarImage.IndexOf('zoomin');
  end;

  with TAction.Create(Self) do
  begin
    Caption := '缩小';
    OnExecute := ZoomInActionExecuteEvent;
    ActionList := FActions;
    ImageIndex := AppCore.ToolBarImage.IndexOf('zoomout');
  end;

  BuildLayoutDropDownButton(FToolBarGroup.CreateItemForControl(nil),
    [TAction(FActions[3]), TAction(FActions[4]), TAction(FActions[5]),
    TAction(FActions[6])], 0);

  Rotate90 := TAction.Create(Self);
  with Rotate90 do
  begin
    Caption := '向右90';
    OnExecute := Rotate270ActionExecuteEvent;
    ActionList := FActions;
    ImageIndex := AppCore.ToolBarImage.IndexOf('rotate_ccw');
  end;

  Rotate180 := TAction.Create(Self);
  with Rotate180 do
  begin
    Caption := '旋转180°';
    OnExecute := Rotate180ActionExecuteEvent;
    ActionList := FActions;
    // ImageIndex := AppCore.ToolBarImage.IndexOf('rotate_180');
  end;

  RotateMinus90 := TAction.Create(Self);
  with RotateMinus90 do
  begin
    Caption := '向左90';
    OnExecute := Rotate90ActionExecuteEvent;
    ActionList := FActions;
    ImageIndex := AppCore.ToolBarImage.IndexOf('rotate_cw');
  end;

  BuildLayoutDropDownButton(FToolBarGroup.CreateItemForControl(nil),
    [Rotate180, Rotate90, RotateMinus90], 0)
end;

constructor TImageBrowseForm.Create(AOwner: TComponent);
begin
  CreateNew(AOwner);

  KeyPreview := True;
  Caption := '图片浏览器';
  Position := poMainFormCenter;
  Width := AppCore.IniFile.ReadInteger(sInterfaceSection,
    'ImageBrowseFormWidth', 960);
  Height := AppCore.IniFile.ReadInteger(sInterfaceSection,
    'ImageBrowseFormHeight', 800);

  // FBarManager := CreateBarManager(Self);
  FLayout := TdxLayoutControl.Create(Self);
  FLayout.Parent := Self;
  FLayout.LookAndFeel := DevExpress.dxLayoutPage;
  FLayout.Align := alClient;
  FLayout.Items.AlignHorz := ahClient;
  FLayout.Items.AlignVert := avClient;

  FImgView := TImgView32.Create(Self);
  FImgView.TabStop := True;
  FImgView.Align := alClient;
  FImgView.Parent := Self;
  FImgView.OnClick := OnImgViewClickEvent;
  FImgView.OnMouseMove := OnImgViewMouseMoveEvent;
  FImgView.OnKeyDown := OnFormKeyDownEvent;
  FImgView.OnMouseWheel := OnImgViewMouseWheel;
  FImgView.OnPaintStage := OnImgViewPaintStage;
  with FImgView.PaintStages[0]^ do
  begin
    if Stage = PST_CLEAR_BACKGND then
      Stage := PST_CUSTOM;
  end;

  BuildActions;

  with FLayout.Items.CreateItemForControl(FImgView) do
  begin
    AlignHorz := ahClient;
    AlignVert := avClient;
  end;
end;

destructor TImageBrowseForm.Destroy;
begin
  AppCore.IniFile.WriteInteger(sInterfaceSection,
    'ImageBrowseFormWidth', Width);
  AppCore.IniFile.WriteInteger(sInterfaceSection,
    'ImageBrowseFormHeight', Height);
  inherited;
end;

procedure TImageBrowseForm.FitControlActionExecuteEvent(Sender: TObject);
begin
  {
    var
    RatioH, RatioV: Extended;
    // 自适应窗口大小
    RatioH := FImgView.Bitmap.Width / FImgView.Width;
    RatioV := FImgView.Bitmap.Height / FImgView.Height;
    if RatioH > RatioV then
    begin
    FImgView.Scale := 1 / RatioH
    end
    else
    FImgView.Scale := 1 / RatioV;
  }
  // 自适应窗口宽度
  if FImgView.Bitmap.Width > 0 then
    FImgView.Scale := FImgView.Width / FImgView.Bitmap.Width
end;

procedure TImageBrowseForm.OnFormKeyDownEvent(Sedner: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_ESCAPE:
      if Parent = nil then
        Close;
    VK_SPACE:
      FImgView.Scale := 1;
    VK_ADD, VK_PRIOR:
      ScaleImage(1);
    VK_SUBTRACT, VK_NEXT:
      ScaleImage(-1);
    VK_LEFT:
      BrowsePrior; // todo: 需设置控件的属性：需要方向按键
    VK_RIGHT:
      BrowseNext;
    VK_UP:
      FImgView.Scroll(0, 10);
    VK_DOWN:
      FImgView.Scroll(0, -10);
  end;
end;

procedure TImageBrowseForm.OnImgViewClickEvent(Sender: TObject);
var
  P: TPoint;
begin
  P := FImgView.ScreenToClient(Mouse.CursorPos);

  if (P.X < FImgView.Width div 3) then
    BrowsePrior
  else if (P.X > FImgView.Width * 2 div 3) then
    BrowseNext;
end;

procedure TImageBrowseForm.OnImgViewMouseMoveEvent(Sender: TObject;
  Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
begin
  if (X < FImgView.Width div 3) then
    FImgView.Cursor := CursorList.IndexOf(sIconArrowLeft)
  else if (X > FImgView.Width * 2 div 3) then
    FImgView.Cursor := CursorList.IndexOf(sIconArrowRight)
  else
    FImgView.Cursor := 0;
end;

procedure TImageBrowseForm.OnImgViewMouseWheel(Sender: TObject;
  Shift: TShiftState; WheelDelta: Integer; MousePos: TPoint;
  var Handled: Boolean);
begin
  if (ssCtrl in Shift) then
  begin
    ScaleImage(WheelDelta);
  end
  else if (ssShift in Shift) then
    FImgView.Scroll(-WheelDelta, 0)
  else
    FImgView.Scroll(0, -WheelDelta);
  Handled := True;
end;

procedure TImageBrowseForm.OriginalSizeActionExecuteEvent(Sender: TObject);
begin
  FImgView.Scale := 1;
end;

procedure TImageBrowseForm.RefreshActionExecuteEvent(Sender: TObject);
begin
  RefreshImage;
end;

procedure TImageBrowseForm.RefreshImage;
begin
  if Assigned(FOnBrowseEvent) then
    FOnBrowseEvent(FImgView, baRefreshImage, FImgView.Bitmap);
end;

procedure TImageBrowseForm.Rotate180ActionExecuteEvent(Sender: TObject);
begin
  FImgView.Bitmap.Rotate180();
  NotifyChange;
end;

procedure TImageBrowseForm.Rotate90ActionExecuteEvent(Sender: TObject);
begin
  FImgView.Bitmap.Rotate90();
  NotifyChange;
end;

procedure TImageBrowseForm.Rotate270ActionExecuteEvent(Sender: TObject);
begin
  FImgView.Bitmap.Rotate270();
  NotifyChange;
end;

procedure TImageBrowseForm.ScaleImage(ADelta: Integer);
begin
  if ADelta > 0 then
    FImgView.Scale := FImgView.Scale * 1.1
  else
    FImgView.Scale := FImgView.Scale * 0.9
end;

{ TFileCursorList }

constructor TFileCursorList.Create(const ACursorPath: string);
begin
  FCursorPath := ACursorPath;
  FLoadedCursor := TStringList.Create;
end;

destructor TFileCursorList.Destroy;
begin
  FreeAndNil(FLoadedCursor);
  inherited;
end;

function TFileCursorList.IndexOf(const ACursorName: string): Integer;
var
  Handle: HICON;
begin
  Result := FLoadedCursor.IndexOf(ACursorName) + 1; // 索引从1开始
  if (Result < 1) and FileExists(FCursorPath + ACursorName) then
  begin
    Handle := LoadCursorFromFile(PChar(FCursorPath + ACursorName));
    Result := FLoadedCursor.Add(ACursorName) + 1;
    Screen.Cursors[Result] := Handle;
  end;
end;

procedure TImageBrowseForm.ZoomInActionExecuteEvent(Sender: TObject);
begin
  ScaleImage(-1);
end;

procedure TImageBrowseForm.ZoomOutActionExecuteEvent(Sender: TObject);
begin
  ScaleImage(1)
end;

procedure TImageBrowseForm.NotifyChange;
begin
  if Assigned(FOnChange) and (FImgView.Bitmap.Width > 0) and
    (FImgView.Bitmap.Height > 0) then
    FOnChange(FImgView);
end;

procedure TImageBrowseForm.OnImgViewPaintStage(Sender: TObject;
  Buffer: TBitmap32; StageNum: Cardinal);
const // 0..1
  Colors: array [Boolean] of TColor32 = ($FFFFFFFF, $FFB0B0B0);
var
  R: TRect;
  I, J: Integer;
  OddY: Integer;
  TilesHorz, TilesVert: Integer;
  TileX, TileY: Integer;
  TileHeight, TileWidth: Integer;
begin
  TileHeight := 13;
  TileWidth := 13;

  TilesHorz := Buffer.Width div TileWidth;
  TilesVert := Buffer.Height div TileHeight;
  TileY := 0;

  for J := 0 to TilesVert do
  begin
    TileX := 0;
    OddY := J and $1;
    for I := 0 to TilesHorz do
    begin
      R.Left := TileX;
      R.Top := TileY;
      R.Right := TileX + TileWidth;
      R.Bottom := TileY + TileHeight;
      Buffer.FillRectS(R, Colors[I and $1 = OddY]);
      Inc(TileX, TileWidth);
    end;
    Inc(TileY, TileHeight);
  end;
end;

procedure TImageBrowseForm.Clear;
begin
  FImgView.Bitmap.SetSize(0, 0);
end;

{ TTableViewPopupMenuWrapper }

procedure TTableViewPopupMenuWrapper.AlignCenterEvent(Sender: TObject);
var
  Column: TcxGridColumn;
begin
  Column := TcxGridTableView(TdxBarButton(Sender).Tag).Controller.FocusedColumn;
  if Column <> nil then
  begin
    Column.GetProperties.Alignment.Horz := taCenter;
  end;
end;

procedure TTableViewPopupMenuWrapper.AlignLeftEvent(Sender: TObject);
var
  Column: TcxGridColumn;
begin
  Column := TcxGridTableView(TdxBarButton(Sender).Tag).Controller.FocusedColumn;
  if Column <> nil then
  begin
    Column.GetProperties.Alignment.Horz := taLeftJustify;
  end;
end;

procedure TTableViewPopupMenuWrapper.AlignRightEvent(Sender: TObject);
var
  Column: TcxGridColumn;
begin
  Column := TcxGridTableView(TdxBarButton(Sender).Tag).Controller.FocusedColumn;
  if Column <> nil then
  begin
    Column.GetProperties.Alignment.Horz := taRightJustify;
  end;
end;

procedure TTableViewPopupMenuWrapper.AllBestWidthEvent(Sender: TObject);
begin
  TcxGridTableView(TdxBarButton(Sender).Tag).ApplyBestFit();
end;

procedure TTableViewPopupMenuWrapper.BestWidthEvent(Sender: TObject);
var
  Column: TcxGridColumn;
begin
  Column := TcxGridTableView(TdxBarButton(Sender).Tag).Controller.FocusedColumn;
  if Column <> nil then
  begin
    Column.ApplyBestFit();
  end;
end;

procedure TTableViewPopupMenuWrapper.FooterAvgEvent(Sender: TObject);
var
  Column: TcxGridColumn;
begin
  Column := TcxGridTableView(TdxBarButton(Sender).Tag).Controller.FocusedColumn;
  if Column <> nil then
  begin
    Column.Summary.FooterKind := skAverage;
    Column.Summary.GroupKind := skAverage;
  end;
end;

procedure TTableViewPopupMenuWrapper.FooterCountEvent(Sender: TObject);
var
  Column: TcxGridColumn;
begin
  Column := TcxGridTableView(TdxBarButton(Sender).Tag).Controller.FocusedColumn;
  if Column <> nil then
  begin
    Column.Summary.FooterKind := skCount;
    Column.Summary.GroupKind := skCount;
  end;
end;

procedure TTableViewPopupMenuWrapper.FooterEvent(Sender: TObject);
begin
  with TcxGridTableView(TdxBarButton(Sender).Tag).OptionsView do
  begin
    Footer := not Footer;
    TdxBarButton(Sender).Lowered := Footer;
  end;
end;

procedure TTableViewPopupMenuWrapper.FooterMaxEvent(Sender: TObject);
var
  Column: TcxGridColumn;
begin
  Column := TcxGridTableView(TdxBarButton(Sender).Tag).Controller.FocusedColumn;
  if Column <> nil then
  begin
    Column.Summary.FooterKind := skMax;
    Column.Summary.GroupKind := skMax;
  end;
end;

procedure TTableViewPopupMenuWrapper.FooterMinEvent(Sender: TObject);
var
  Column: TcxGridColumn;
begin
  Column := TcxGridTableView(TdxBarButton(Sender).Tag).Controller.FocusedColumn;
  if Column <> nil then
  begin
    Column.Summary.FooterKind := skMin;
    Column.Summary.GroupKind := skMin;
  end;
end;

procedure TTableViewPopupMenuWrapper.FooterNoneEvent(Sender: TObject);
var
  Column: TcxGridColumn;
begin
  Column := TcxGridTableView(TdxBarButton(Sender).Tag).Controller.FocusedColumn;
  if Column <> nil then
  begin
    Column.Summary.FooterKind := skNone;
    Column.Summary.GroupKind := skNone;
  end;
end;

procedure TTableViewPopupMenuWrapper.FooterSummaryEvent(Sender: TObject);
var
  Column: TcxGridColumn;
begin
  Column := TcxGridTableView(TdxBarButton(Sender).Tag).Controller.FocusedColumn;
  if Column <> nil then
  begin
    Column.Summary.FooterKind := skSum;
    Column.Summary.GroupKind := skSum;
  end;
end;

procedure TTableViewPopupMenuWrapper.GroupBoxEvent(Sender: TObject);
begin
  with TcxGridTableView(TdxBarButton(Sender).Tag).OptionsView do
  begin
    GroupByBox := not GroupByBox;
    TdxBarButton(Sender).Lowered := GroupByBox;
  end;
end;

procedure TTableViewPopupMenuWrapper.SortAscendEvent(Sender: TObject);
var
  Column: TcxGridColumn;
begin
  Column := TcxGridTableView(TdxBarButton(Sender).Tag).Controller.FocusedColumn;
  if Column <> nil then
  begin
    Column.SortOrder := soAscending;
  end;
end;

procedure TTableViewPopupMenuWrapper.SortDescendEvent(Sender: TObject);
var
  Column: TcxGridColumn;
begin
  Column := TcxGridTableView(TdxBarButton(Sender).Tag).Controller.FocusedColumn;
  if Column <> nil then
  begin
    Column.SortOrder := soDescending;
  end;
end;

procedure TTableViewPopupMenuWrapper.SortNoneEvent(Sender: TObject);
var
  Column: TcxGridColumn;
begin
  Column := TcxGridTableView(TdxBarButton(Sender).Tag).Controller.FocusedColumn;
  if Column <> nil then
  begin
    Column.SortOrder := soNone;
  end;
end;

procedure TTableViewPopupMenuWrapper.WrapTableView
  (ATableView: TcxCustomGridTableView; APopupMenu: TdxBarPopupMenu);
var
  Button: TdxBarButton;
  ItemLinks: TdxBarItemLinks;

  function CreateSubMenu(ALinks: TdxBarItemLinks; ACaption: string)
    : TdxBarSubItem;
  begin
    Result := TdxBarSubItem.Create(APopupMenu);
    Result.Caption := ACaption;
    ALinks.Add(Result);
  end;

  procedure CreateButton(ALinks: TdxBarItemLinks; ACaption: string;
    AOnClick: TNotifyEvent);
  begin
    Button := TdxBarButton.Create(APopupMenu);
    Button.Caption := ACaption;
    Button.OnClick := AOnClick;
    Button.Tag := Integer(ATableView);
    ALinks.Add(Button);
  end;

  procedure CreateSummaryMenu();
  var
    SummarySubMenu: TdxBarSubItem;
  begin
    SummarySubMenu := CreateSubMenu(ItemLinks, '汇总方式');
    CreateButton(SummarySubMenu.ItemLinks, '合计(Sum)', FooterSummaryEvent);
    CreateButton(SummarySubMenu.ItemLinks, '计数(Count)', FooterCountEvent);
    CreateButton(SummarySubMenu.ItemLinks, '最大值(Max)', FooterMaxEvent);
    CreateButton(SummarySubMenu.ItemLinks, '最小值(Min)', FooterMinEvent);
    CreateButton(SummarySubMenu.ItemLinks, '平均值(Avg)', FooterAvgEvent);
    CreateButton(SummarySubMenu.ItemLinks, '无(None)', FooterNoneEvent);
  end;

  procedure CreateSortMenu();
  var
    SummarySubMenu: TdxBarSubItem;
  begin
    SummarySubMenu := CreateSubMenu(ItemLinks, '排序方式');
    CreateButton(SummarySubMenu.ItemLinks, '升序', SortAscendEvent);
    CreateButton(SummarySubMenu.ItemLinks, '降序', SortDescendEvent);
    CreateButton(SummarySubMenu.ItemLinks, '无', SortNoneEvent);
  end;

  procedure CreateAlignMenu();
  var
    SummarySubMenu: TdxBarSubItem;
  begin
    SummarySubMenu := CreateSubMenu(ItemLinks, '对齐方式');
    CreateButton(SummarySubMenu.ItemLinks, '左对齐', AlignLeftEvent);
    CreateButton(SummarySubMenu.ItemLinks, '右对齐', AlignRightEvent);
    CreateButton(SummarySubMenu.ItemLinks, '居中', AlignCenterEvent);
  end;

begin
  Assert(APopupMenu <> nil);
  Assert(APopupMenu.BarManager <> nil);

  // SubMenu := CreateSubMenu(APopupMenu.ItemLinks, '表格');
  // ItemLinks := SubMenu.ItemLinks;
  ItemLinks := APopupMenu.ItemLinks;
  CreateBarPopupMenuSeparator(APopupMenu, ItemLinks, '');

  CreateSortMenu();
  CreateButton(ItemLinks, '分组框', GroupBoxEvent);
  CreateButton(ItemLinks, '汇总栏', FooterEvent);
  CreateSummaryMenu();
  CreateButton(ItemLinks, '最佳宽度(所有列)', AllBestWidthEvent);
  CreateButton(ItemLinks, '最佳宽度', BestWidthEvent);
  CreateAlignMenu();
end;

{ TBaseDialog }

procedure TBaseDialog.BuildDialog;
begin

end;

procedure TBaseDialog.DoDialogCancel(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TBaseDialog.DoDialogOK(Sender: TObject);
begin
  ModalResult := mrOk;
end;

function TBaseDialog.Execute: Boolean;
begin
  Result := ShowModal = mrOk;
end;

procedure TBaseDialog.DoCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
  DoDialogCancel(Sender);
end;

procedure TBaseDialog.DoFormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_Return) then
    FocusNextControl;
end;

procedure TBaseDialog.DoOKClick(Sender: TObject);
begin
  if FInOKButton then
    Exit; // 防止OK事件重入

  FInOKButton := True;
  try
    DoDialogOK(Sender);
    // FocusNextControl(); // Hide;  FocusFirstControl()???
    // 如果键盘按着不放，ModalResult不能关闭窗口，还是会造成OK按钮的点击
  finally
    // if ModalResult = mrNone then
    if ModalResult <> mrOk then
      FInOKButton := False;
  end;
end;

procedure TBaseDialog.DoFormShow(Sender: TObject);
begin
  FInOKButton := False;
  // 根据Layout的自动大小属性，调整窗体的大小
  if FLayout.Align <> alClient then
  begin
    ClientHeight := FLayout.Height;
    ClientWidth := FLayout.Width;
  end;
  // PostMessage(FindNextControl(FLayout, True, True, False).Handle, WM_SETFOCUS, 0, 0);
  FocusFirstControl;
  DoDialogShow(Sender);
end;

procedure TBaseDialog.DoDialogShow(Sender: TObject);
begin

end;

procedure TBaseDialog.SetDialogImage(AName: string);
begin
  FImage.Picture := AppCore.ImageCenter.Get(AName);
  FImageItem.Visible := FImage.Picture.Graphic <> nil;
end;

procedure TBaseDialog.SetLayoutAutoSize(const Value: Boolean);
begin
  if not Value then
  begin
    BorderStyle := bsSizeable;
    ViewLayout.Align := alClient;
    ViewLayout.AutoSize := False;
    ViewLayout.Items.AlignHorz := ahClient;
    ViewLayout.Items.AlignVert := avClient;
    ViewLayout.Items[0].AlignHorz := ahClient;
    ViewLayout.Items[0].AlignVert := avClient;
    TdxLayoutGroup(ViewLayout.Items[0])[0].AlignHorz := ahClient;
    TdxLayoutGroup(ViewLayout.Items[0])[0].AlignVert := avClient;
  end
end;

function TBaseDialog.GetActions: TActionList;
begin
  Result := ViewActions;
end;

procedure TBaseDialog.BuildViewLayout;
begin
  inherited;
  Font := DevExpress.EditStyleController.Style.Font;
  Position := poMainFormCenter;
  KeyPreview := True;
  OnKeyDown := DoFormKeyDown; // 不能换成KeyUp，影响Enter按键消息
  OnShow := DoFormShow;
  BorderStyle := bsDialog;
  // BorderIcons := [biSystemMenu];
  Width := 600;
  Height := 400;

  FImage := TImage.Create(Self);
  with FImage do
  begin
    AutoSize := True;
    Transparent := True;
  end;

  with ViewLayout do
  begin
    Align := alNone;
    Items.AlignHorz := ahLeft;
    Items.AlignVert := avTop;
    LookAndFeel := DevExpress.dxLayoutDialog;
    Canvas.Font := Font;
    AutoSize := True;
  end;

  FOKButton := BuildDXButton(Self, '确定(&Q)', DoOKClick);
  FCancelButton := BuildDXButton(Self, '取消(&X)', DoCancelClick);
  FCancelButton.Cancel := True;

  with ViewLayout.Items do
  begin
    // LayoutDirection := ldHorizontal;

    with CreateGroup() do
    begin
      // LayoutDirection := ldHorizontal;
      ShowBorder := False;

      with CreateGroup() do
      begin
        ShowBorder := False;

        FImageItem := CreateItemForControl(FImage);
        with FImageItem do
        begin
          Visible := False;
          AlignHorz := ahRight;
        end;

        FDialogGroup := CreateGroup();
        with FDialogGroup do
        begin
          AlignHorz := ahClient;
          AlignVert := avClient;
          ShowBorder := False;
        end;

        FBottomGroup := CreateGroup();
        with FBottomGroup do
        begin
          AlignVert := avBottom;
          LayoutDirection := ldHorizontal;
          ShowBorder := False;

          FButtonGroup := CreateGroup;
          with FButtonGroup do
          begin
            AlignHorz := ahRight;
            LayoutDirection := ldHorizontal;
            ShowBorder := False;
            FOKItem := CreateItemForControl(FOKButton);
            FCancelItem := CreateItemForControl(FCancelButton);
          end;
        end;
      end;
    end;
  end;

  BuildDialog;

end;

function TBaseDialog.GetPluginLayoutGroup(AOperation: TBaseOperation)
  : TComponent;
begin
  Result := BottomGroup;
end;

{ TSelectDialog }

procedure TSelectDialog.BuildDialog;
begin
  inherited;
  FListBox := TcxListBox.Create(Self);
  FListBox.OnDblClick := DoOKClick;
  FListBox.Height := 200;
  FListBox.Width := 450;
  FListBox.ItemHeight := 30;
  FListBox.ListStyle := lbOwnerDrawFixed;

  with DialogGroup do
  begin
    with CreateItemForControl(FListBox) do
    begin
      AlignHorz := ahClient;
      AlignVert := avClient;
    end;
  end;
end;

function TSelectDialog.GetSelectIndex: Integer;
begin
  Result := FListBox.ItemIndex;
end;

function TSelectDialog.GetSelections: TStrings;
begin
  Result := FListBox.Items;
end;

procedure TSelectDialog.SetSelectIndex(const Value: Integer);
begin
  if Value > FListBox.Count - 1 then
    FListBox.ItemIndex := FListBox.Count - 1
  else
    FListBox.ItemIndex := Value;
end;

procedure TSelectDialog.SetSelections(Value: TStrings);
begin
  FListBox.Items := Value;
  if FListBox.Count > 0 then
    FListBox.ItemIndex := 0;
end;

{ TTableColorWrapInfo }

procedure TTableColorWrapInfo.DoCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
var
  I: Integer;
  Value: Variant;
begin
  if (not AViewInfo.GridRecord.Selected) and
    (AViewInfo.Item.Styles.Content = nil) then
  begin
    // 在重新创建表格后一定要重新Wrap,否则FColorColumn访问违例！！！
    Value := AViewInfo.GridRecord.Values[FTableColumn.Index];
    // TcxCustomGridTableItem(FTableColumn).Index
    for I := Low(FColorNodes) to High(FColorNodes) do
    begin
      if ((VarType(Value) = varString) and (Value = FColorNodes[I])) or
        (Value <= FColorNodes[I]) then
      begin
        ACanvas.Brush.Color := FColors[I];
        Break;
      end;
    end;
  end;
end;

procedure TTableColorWrapInfo.DoCustomDrawTreeCell(Sender: TcxCustomTreeList;
  ACanvas: TcxCanvas; AViewInfo: TcxTreeListEditCellViewInfo;
  var ADone: Boolean);
var
  I: Integer;
  Value: Variant;
begin
  if (not AViewInfo.Selected) then
  begin
    // 在重新创建表格后一定要重新Wrap,否则FTreeColumn访问违例！！！
    Value := AViewInfo.Node.Values[FTreeColumn.ItemIndex];
    for I := Low(FColorNodes) to High(FColorNodes) do
    begin
      if ((VarType(Value) = varString) and (Value = FColorNodes[I])) or
        (Value <= FColorNodes[I]) then
      begin
        ACanvas.Brush.Color := FColors[I];
        Break;
      end;
    end;
  end;
end;

procedure TTableColorWrapInfo.UnWrap;
begin
  inherited;
  if (Target is TcxGridDBTableView) then
  begin
    TcxGridDBTableView(Target).OnCustomDrawCell := nil;
  end
  else if (Target is TcxGridDBBandedTableView) then
  begin
    TcxGridDBBandedTableView(Target).OnCustomDrawCell := nil
  end
  else if (Target is TcxDBTreeList) then
  begin
    TcxDBTreeList(Target).OnCustomDrawDataCell := nil;
  end;
end;

procedure TTableColorWrapInfo.Wrap;
begin
  inherited;

end;

{ TTableViewColorWrapper }

constructor TTableViewColorWrapper.Create(AOwner: TComponent);
begin
  inherited;
  FOldOnBuildTableView := DevExpress.OnBuildTableView;
  DevExpress.OnBuildTableView := DoBuildTableView;
  FOldOnBuildTreeView := DevExpress.OnBuildTreeView;
  DevExpress.OnBuildTreeView := DoBuildTreeView;
end;

procedure TTableViewColorWrapper.DoBuildTableView
  (ATableView: TcxCustomGridTableView);
begin
  Wrap(ATableView);
end;

procedure TTableViewColorWrapper.DoBuildTreeView(ATreeView: TcxDBTreeList);
begin
  Wrap(ATreeView);
end;

function TTableViewColorWrapper.GetWrapInfoClass: TWrapInfoClass;
begin
  Result := TTableColorWrapInfo;
end;

procedure TTableViewColorWrapper.InternalWrap(AWrapInfo: TWrapInfo);
var
  WrapInfo: TTableColorWrapInfo;

  procedure GetColorField();
  var
    ColorList: TStrings;
    I: Integer;
  begin
    WrapInfo.FColorField := WrapInfo.FDataTable.CustomAttributes.Values
      ['ColorField'];

    ColorList := TStringList.Create;
    try
      ColorList.Delimiter := ';';
      ColorList.DelimitedText := WrapInfo.FDataTable.CustomAttributes.Values
        ['ColorNodes'];
      SetLength(WrapInfo.FColorNodes, ColorList.Count);
      for I := 0 to ColorList.Count - 1 do
      begin
        WrapInfo.FColorNodes[I] := ColorList[I];
      end;

      ColorList.DelimitedText := WrapInfo.FDataTable.CustomAttributes.Values
        ['ColorArray'];
      SetLength(WrapInfo.FColors, ColorList.Count);
      for I := 0 to ColorList.Count - 1 do
      begin
        WrapInfo.FColors[I] := StringToColor(ColorList[I]);
      end;
    finally
      ColorList.Free;
    end;
  end;

  function ValidateColorNode(): Boolean;
  begin
    Result := (Length(WrapInfo.FColorNodes) > 0) and // 定义颜色节点
      (Length(WrapInfo.FColorNodes) = Length(WrapInfo.FColors));
    // 定义的颜色节点和颜色值数目一致
  end;

begin
  WrapInfo := TTableColorWrapInfo(AWrapInfo);

  // 分别处理三种视图
  if (AWrapInfo.Target is TcxGridDBTableView) then
  begin
    WrapInfo.FDataTable := TDADataSource(TcxGridDBTableView(AWrapInfo.Target)
      .DataController.DataSource).DataTable;
    GetColorField;
    WrapInfo.FTableColumn := TcxGridDBTableView(AWrapInfo.Target)
      .GetColumnByFieldName(WrapInfo.FColorField);
    if ValidateColorNode and (WrapInfo.FTableColumn <> nil) then
      TcxGridDBTableView(AWrapInfo.Target).OnCustomDrawCell :=
        WrapInfo.DoCustomDrawCell;
  end
  else if (AWrapInfo.Target is TcxGridDBBandedTableView) then
  begin
    WrapInfo.FDataTable :=
      TDADataSource(TcxGridDBBandedTableView(AWrapInfo.Target)
      .DataController.DataSource).DataTable;
    GetColorField;
    WrapInfo.FTableColumn := TcxGridDBBandedTableView(AWrapInfo.Target)
      .GetColumnByFieldName(WrapInfo.FColorField);
    if ValidateColorNode and (WrapInfo.FTableColumn <> nil) then
      TcxGridDBBandedTableView(AWrapInfo.Target).OnCustomDrawCell :=
        WrapInfo.DoCustomDrawCell;
  end
  else if (AWrapInfo.Target is TcxDBTreeList) then
  begin
    WrapInfo.FDataTable := TDADataSource(TcxDBTreeList(AWrapInfo.Target)
      .DataController.DataSource).DataTable;
    GetColorField;
    WrapInfo.FTreeColumn := TcxDBTreeList(AWrapInfo.Target)
      .GetColumnByFieldName(WrapInfo.FColorField);
    if ValidateColorNode and (WrapInfo.FTreeColumn <> nil) then
      TcxDBTreeList(AWrapInfo.Target).OnCustomDrawDataCell :=
        WrapInfo.DoCustomDrawTreeCell;
  end
  else if (AWrapInfo.Target is TcxGridDBCardView) then
  begin
    WrapInfo.FDataTable := TDADataSource(TcxGridDBCardView(AWrapInfo.Target)
      .DataController.DataSource).DataTable;
    GetColorField;
    WrapInfo.FTableColumn := TcxGridDBCardView(AWrapInfo.Target)
      .GetRowByFieldName(WrapInfo.FColorField);
    if ValidateColorNode and (WrapInfo.FTableColumn <> nil) then
      TcxGridDBCardView(AWrapInfo.Target).OnCustomDrawCell :=
        WrapInfo.DoCustomDrawCell;
  end;
end;

function TTableViewColorWrapper.Wrap(ATarget: TComponent): TWrapInfo;
var
  DS: TDataSource;
begin
  UnWrap(ATarget);

  // 符合条件的才进行包装
  if (ATarget <> nil) then
    if (ATarget is TcxGridDBTableView) then
    begin
      DS := TcxGridDBTableView(ATarget).DataController.DataSource;
    end
    else if (ATarget is TcxGridDBBandedTableView) then
    begin
      DS := TcxGridDBBandedTableView(ATarget).DataController.DataSource;
    end
    else if (ATarget is TcxDBTreeList) then
    begin
      DS := TcxDBTreeList(ATarget).DataController.DataSource;
    end
    else if (ATarget is TcxGridDBCardView) then
    begin
      DS := TcxGridDBCardView(ATarget).DataController.DataSource;
    end;

  if (DS <> nil) and (DS is TDADataSource) and
    (TDADataSource(DS).DataTable <> nil) and
    (TDADataSource(DS).DataTable.CustomAttributes.Values['ColorField'] <> '')
  then
  begin
    Result := inherited Wrap(ATarget);
    InternalWrap(Result);
  end;
end;

{ TTextDialog }

procedure TTextDialog.BuildDialog;
begin
  inherited;
  OKButton.Default := True;
  FMaskEdit := TcxMaskEdit.Create(Self);
  FMaskEdit.Width := 400;
  FMaskEdit.Properties.MaskKind := emkRegExpr;
  // FMaskEdit.Properties.ClearKey := ShortCut(VK_DELETE, []);

  with DialogGroup do
  begin
    AlignVert := avTop;
    FEditItem := CreateItemForControl(FMaskEdit);
    // FEditItem.CaptionOptions.ViewLayout := clTop;
  end;
end;

function TTextDialog.GetText: string;
begin
  Result := FMaskEdit.Text;
end;

procedure TTextDialog.SetText(AValue: string);
begin
  FMaskEdit.Text := AValue;
end;

{ TCheckListDialog }

procedure TCheckListDialog.BuildDialog;
begin
  inherited;
  FStrings := TStringList.Create;
  FCheckListBox := TcxCheckListBox.Create(Self);
  FCheckListBox.Height := 400;
  FCheckListBox.Width := 500;
  TcxCheckListBoxHack(FCheckListBox).ItemHeight := 30;
  TcxCheckListBoxHack(FCheckListBox).ListStyle := lbOwnerDrawFixed;

  with DialogGroup do
  begin
    with CreateItemForControl(FCheckListBox) do
    begin
      AlignHorz := ahClient;
      AlignVert := avClient;
    end;
  end;
end;

{ 根据Strings填充CheckListBox }

procedure TCheckListDialog.BuildCheckListBox();
var
  I: Integer;
begin
  FCheckListBox.Items.Clear;
  for I := 0 to FStrings.Count - 1 do
  begin
    with FCheckListBox.Items.Add do
    begin
      Text := FStrings.Names[I];
      Checked := True;
    end;
  end;
end;

destructor TCheckListDialog.Destroy;
begin
  FStrings.Free;
  inherited;
end;

function TCheckListDialog.Execute: Boolean;
begin
  BuildCheckListBox();
  Result := inherited Execute;
end;

function TCheckListDialog.GetCheckedValue(ADelimiter: Char): string;
var
  TempStrings: TStrings;
  I: Integer;
begin
  TempStrings := TStringList.Create;
  TempStrings.Delimiter := ADelimiter;
  try
    for I := 0 to FStrings.Count - 1 do
      if FCheckListBox.Items[I].Checked then
        TempStrings.Add(FStrings.ValueFromIndex[I]);
    Result := TempStrings.DelimitedText;
  finally
    TempStrings.Free;
  end;
end;

procedure TCheckListDialog.DoDialogOK(Sender: TObject);
begin
  if GetCheckedValue() = '' then
    raise Exception.Create('请选择一个项目');
  inherited;
end;

procedure TCheckListDialog.SetItemHeight(const Value: Integer);
begin
  TcxCheckListBoxHack(FCheckListBox).ItemHeight := Value;
end;

{ TCheckBoxDialog }

procedure TCheckBoxDialog.BuildDialog;
begin
  inherited;
  FCheckBox := TcxCheckBox.Create(Self);
  FCheckBox.Transparent := True;
  DialogGroup.CreateItemForControl(FCheckBox);
end;

function TCheckBoxDialog.GetChecked: Boolean;
begin
  Result := FCheckBox.Checked;
end;

procedure TCheckBoxDialog.WriteChecked(const Value: Boolean);
begin
  FCheckBox.Checked := Value;
end;

{ TBusinessPrinters }

constructor TBusinessPrinters.Create;
begin
  inherited;
  FPrinters := TStringList.Create(); // 数据结构：业务名=打印机名称
  RegisterBusinessPrinter(sDefaultPrinter);
end;

destructor TBusinessPrinters.Destroy;
var
  I: Integer;
  S1, S2: string;
begin
  AppCore.IniFile.EraseSection(sPrinterSection);
  // 保存选择的打印机
  for I := 0 to FPrinters.Count - 1 do
  begin
    S1 := FPrinters.Names[I];
    S2 := FPrinters.ValueFromIndex[I];
    AppCore.IniFile.WriteString(sPrinterSection, S1, S2);
  end;
  FPrinters.Free;
  inherited;
end;

function TBusinessPrinters.GetBusinessPrinter(BusinessName: string): string;
begin
  Result := FPrinters.Values[BusinessName];
end;

procedure TBusinessPrinters.RegisterBusinessPrinter(BusinessName: string);
begin
  if FPrinters.IndexOfName(BusinessName) < 0 then
  begin
    FPrinters.Add(BusinessName + '=' + AppCore.IniFile.ReadString
      (sPrinterSection, BusinessName, ''));
  end
end;

{ TBusinessPrinterDialog }

procedure TBusinessPrinterDialog.BuildDialog;
var
  I: Integer;
  Combo: TcxComboBox;
begin
  inherited;
  SetDialogImage('misc\printer.png');

  Caption := '选择业务打印机';
  with DialogGroup do
    for I := 0 to FPrinters.Printers.Count - 1 do
    begin
      Combo := TcxComboBox.Create(Self);
      Combo.Width := 350;
      Combo.Properties.Items.Assign(frxPrinters.Printers);
      BusinessPrinters.Printers.Objects[I] := Combo;
      Combo.Text := FPrinters.Printers.ValueFromIndex[I];
      with CreateItemForControl(Combo) do
      begin
        Caption := FPrinters.Printers.Names[I];
      end;
    end;
end;

constructor TBusinessPrinterDialog.Create(AOwner: TComponent;
  APrinters: TBusinessPrinters);
begin
  FPrinters := APrinters;
  inherited Create(AOwner);
end;

function TBusinessPrinterDialog.Execute: Boolean;
var
  I: Integer;
begin
  Result := inherited Execute;
  if Result then
  begin
    for I := 0 to FPrinters.Printers.Count - 1 do
    begin
      // 注：如果调用ValueFromIndex或者Values，并且Text=''则会删除当前项
      FPrinters.Printers[I] := FPrinters.Printers.Names[I] + '=' +
        TcxComboBox(FPrinters.Printers.Objects[I]).Text;
    end;
  end;
end;

{ TDateEditDialog }

procedure TDateEditDialog.BuildDialog;
begin
  inherited;
  Caption := '选择日期';
  FDateEdit := TcxDateEdit.Create(Self);

  with DialogGroup do
  begin
    // AlignVert := avTop;
    FDateItem := CreateItemForControl(FDateEdit);
  end;
  FDateEdit.Date := Date();
end;

{ THttpDownloadThread }

constructor THttpDownloadThread.Create(Url, FileName: string;
  PrograssHandle: HWND);
begin
  inherited Create(True);
  FUrl := Url;
  FFileName := FileName;
  FProgressHandle := PrograssHandle;
  Resume;
end;

procedure THttpDownloadThread.GetFile(Url: string;
  Stream: TStream { ; ReceiveProgress: TclSocketProgressEvent } );
var
  HTTP: TIdHttp;
begin
  HTTP := TIdHttp.Create(nil);
  try
    try
      // Http.OnReceiveProgress := ReceiveProgress;
      HTTP.Get(Url, Stream);
    except
    end;
  finally
    HTTP.Free;
  end;
end;

procedure THttpDownloadThread.OnReceiveProgress(Sender: TObject;
  ABytesProceed, ATotalBytes: Integer);
begin
  SetPercent((ABytesProceed / ATotalBytes) * 100);
end;

procedure THttpDownloadThread.SetPercent(Percent: Double);
begin
  // PostMessage(FProgressHandle, AM_DownloadPercent, LowBytes(Percent), HighBytes(Percent));
end;

procedure THttpDownloadThread.Execute;
var
  FileStream: TFileStream;
begin
  FileStream := TFileStream.Create(FFileName, fmCreate);
  try
    GetFile(FUrl, FileStream { , OnReceiveProgress } );
  finally
    FileStream.Free;
  end;
end;

{ TBaseLayoutView }

procedure TBaseLayoutView.BuildViewLayout;
begin
  // 子类可在此构建视图，嵌套在Layout.BeginUpdate
end;

procedure TBaseLayoutView.DoInitView;
begin
  inherited;
  Width := 750;
  Height := 500;
  if FLayout = nil then
  begin
    FLayout := TdxLayoutControl.Create(Self);
    with FLayout do
    begin
      BeginUpdate;
      try
        ParentFont := False;
        Parent := Self;
        Align := alClient;
        LookAndFeel := DevExpress.dxLayoutPage;
        Items.AlignHorz := ahClient;
        Items.AlignVert := avClient;
        Font := DevExpress.EditStyleController.Style.Font;
        Canvas.Font := Font;
        BuildViewLayout;
      finally
        EndUpdate();
      end;
    end;
  end;
end;

procedure TBaseLayoutView.FocusFirstControl;
begin
  PostMessage(FindNextControl(FLayout, True, True, False).Handle,
    WM_SETFOCUS, 0, 0);
end;

procedure TBaseLayoutView.FocusNextControl;
begin
  PostMessage(Handle, WM_KEYDOWN, VK_TAB, 0);
end;

function TBaseLayoutView.GetPluginManager: TBaseViewPluginManager;
begin
  Result := TBaseLayoutViewPluginManager.Create(Self);
end;

procedure TBaseLayoutView.SetIsEmbedded(const Value: Boolean);
begin
  FIsEmbedded := Value;
  if FIsEmbedded then
  begin
    ViewLayout.LookAndFeel := DevExpress.dxLayoutPageEmbed;
  end
  else
  begin
    ViewLayout.LookAndFeel := DevExpress.dxLayoutPage;
  end;
end;

{ TBaseLayoutViewPluginManager }

procedure TBaseLayoutViewPluginManager.PluginOperation
  (AOperation: TBaseOperation);
var
  PluginControl: TControl;
  PopupEdit: TcxPopupEdit;
  PluginLayoutGroup: TdxLayoutGroup;
begin
  inherited;

  // 可以在多次设置Flag，Group, 从而把Plugin放在不同的地方
  if CanPlugin(AOperation) then
  begin
    PluginLayoutGroup := TdxLayoutGroup
      (PluginContainer.GetPluginLayoutGroup(AOperation));

    if PluginLayoutGroup = nil then
      PluginLayoutGroup := PluginGroup;

    if PluginLayoutGroup = nil then
      Exit;

    // 使用PlungControl自定义属性的目的：防止调用Operation.Execute，避免在创建插件时创建View
    if StrToBoolDef(AOperation.CustomAttributes.Values['PluginControl'], False)
    then
    begin
      PluginControl :=
        TControl(Integer(AOperation.Execute(iOperationCommand_PluginControl,
        [Integer(PluginContainer)])));
      if PluginControl <> nil then
      begin
        // 默认创建弹出式插件
        if StrToBoolDef(AOperation.CustomAttributes.Values['PluginPopup'], True)
        then
        begin
          PopupEdit := TcxPopupEdit.Create(PluginContainer);
          PopupEdit.Text := AOperation.Caption;
          PopupEdit.Properties.PopupSysPanelStyle := True;
          PopupEdit.Properties.PopupControl := PluginControl;
          with PluginLayoutGroup.CreateItemForControl(PopupEdit) do
          begin
            if PluginLayoutGroup.LayoutDirection = ldHorizontal then
              AlignVert := avCenter;
          end;
        end
        else
        begin
          with PluginLayoutGroup do
          begin
            AlignHorz := ahLeft;
            AlignVert := avTop;
            CreateItemForControl(PluginControl);
          end;
        end;

      end
    end
    else
      BuildLayoutDropDownOperation(PluginLayoutGroup.CreateItemForControl(nil),
        AOperation, PluginContainer);
  end;
end;

{ TReporterSelectDialog }

procedure TReporterSelectDialog.BuildDialog;
var
  TempGroup: TdxLayoutGroup;
begin
  inherited;

  Caption := '选择打印模板';

  ListBox.OnClick := DoListBoxClick;

  FPrintersCombo := TcxComboBox.Create(Self);
  FPrintersCombo.Width := 350;
  FPrintersCombo.Properties.Items.Assign(frxPrinters.Printers);

  FPreviewCheckBox := TcxCheckBox.Create(Self);
  FPreviewCheckBox.Transparent := True;

  with DialogGroup do
  begin
    // ShowBorder := False;
    // LayoutDirection := ldHorizontal;

    FParamItem := CreateItemForControl(nil);
    FParamItem.Visible := False;

    // with CreateGroup() do
    // begin
    // ShowBorder := False;

    with CreateItemForControl(FPrintersCombo) do
      Caption := '打印机:';

    with CreateItemForControl(FPreviewCheckBox) do
      Caption := '打印预览:';
    // end;
  end;
end;

procedure TReporterSelectDialog.DoListBoxClick(Sender: TObject);
begin
  // 加载配置
  PrinterName := AppCore.IniFile.ReadString(sReporterPrinterSection,
    ReporterName, '');

  if FParamData <> nil then
  begin
    FParamData.FilterText := 'ReportName=' + QuotedStr(ReporterName);
    // FParamItem.Visible := not FParamData.Eof;
  end;
end;

function TReporterSelectDialog.Execute: Boolean;
begin
  DoListBoxClick(nil);
  Result := inherited Execute();
  if Result then
  begin
    // 保存配置
    AppCore.IniFile.WriteString(sReporterPrinterSection, ReporterName,
      PrinterName);
  end;
end;

function TReporterSelectDialog.GetPreview: Boolean;
begin
  Result := FPreviewCheckBox.Checked;
end;

function TReporterSelectDialog.GetPrinterName: string;
begin
  Result := FPrintersCombo.Text;
end;

function TReporterSelectDialog.GetReporterName: string;
begin
  Result := Selections[SelectIndex];
end;

procedure TReporterSelectDialog.SetPreview(const Value: Boolean);
begin
  FPreviewCheckBox.Checked := Value;
end;

procedure TReporterSelectDialog.SetPrinterName(const Value: string);
begin
  FPrintersCombo.Text := Value;
end;

procedure TReporterSelectDialog.SetPrintParamData(const Value: TCustomData);
begin
  if FParamView = nil then
  begin
    FParamView := TTableGridDataView.Create(Self);
    with TTableGridDataView(FParamView) do
    begin
      ToolBarGroup.Visible := False;
      BorderStyle := bsNone;
      Height := 150;
      Width := 300;
    end;
    FParamItem.Control := FParamView;
    FParamItem.Visible := True;
  end;

  FParamData := Value;

  with TTableGridDataView(FParamView) do
    if ViewData <> Value then
      ViewData := Value;
end;

initialization

CursorList := TFileCursorList.Create(AppCore.ImagePath + 'icon\');
TableViewPopupMenuWrapper := TTableViewPopupMenuWrapper.Create;
TableViewColorWrapper := TTableViewColorWrapper.Create(nil);
BusinessPrinters := TBusinessPrinters.Create;

finalization

FreeAndNil(CursorList);
FreeAndNil(TableViewPopupMenuWrapper);
FreeAndNil(TableViewColorWrapper);
FreeAndNil(BusinessPrinters);

end.
