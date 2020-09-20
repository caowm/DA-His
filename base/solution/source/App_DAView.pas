unit App_DAView;

{
  数据窗体基类

  Written by caowm (remobjects@qq.com)
  2014年9月
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
  StrUtils,
  DB,
  ExtCtrls,
  Contnrs,
  Windows,
  IniFiles,
  uDAInterfaces,
  uDADataTable,
  uROClasses,
  uDAWhere,
  uDACore,
  uDAFields,
  cxDBData,
  cxDBEdit,
  cxEdit,
  cxCheckBox,
  cxTextEdit,
  cxCalendar,
  cxButtons,
  cxButtonEdit,
  cxSpinEdit,
  cxMemo,
  cxDropDownEdit,
  cxFilter,
  cxGrid,
  cxGridLevel,
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
  cxGridDBDataDefinitions,
  cxClasses,
  cxControls,
  cxCustomData,
  cxCustomPivotGrid,
  cxGridPopupMenu,
  cxGridCustomPopupMenu,
  cxTL,
  cxDBTL,
  dxBar,
  dxLayoutControl,
  dxLayoutContainer,
  App_Function,
  App_Common,
  App_DevExpress,
  App_Class,
  // App_DataWizard,
  App_DAModel;

const
  sDataNameMiscReport = 'Misc_Report';
  sDataNameMiscReportParam = 'Misc_ReportParam';

  sDataViewName_Table = 'TableView';
  sDataViewName_Card = 'CardView';
  sDataViewName_Tree = 'TreeView';
  sDataViewName_Form = 'FormView';

  sPopupViewName_DictIME = 'DictIME';
  sPopupViewName_AgeIME = 'AgeIME';

  sDeleteDataConfirm = '确定删除数据吗?';
  sControlHaveWrapped = '%s控件已包装';

  sActionCategoryNavigate = 'Navigate';
  sActionCategoryData = 'Data';
  sActionCategoryBusiness = 'Business';

  sLayoutGroupOperation = '操作面板';
  sLayoutGroupInput = '输入面板';

const
  CM_TABLECELLCLICK = WM_USER + 1;

type

  // 在视图对数据做出筛选后，用于同步各视图之间的数据浏览动作
  TNavigateAction = (naFirst, naNext, naPrior, naLast);
  TNavigateDataEvent = procedure(Sender: TObject;
    NavigateAction: TNavigateAction) of object;

  {
    数据视图基类

    1 设置数据时自动打开数据
    2 默认实现报表接口
    3 默认创建布局控件、快捷菜单、数据Action、过滤字段列表、数据工具栏、过滤控件
    4 新增时间段控件,以满足查询的需要，
    5 增强数据筛选、选择功能，字典和其他输入的地方更方便继承
    增加一个固定筛选字段、对应文本和筛选符
  }
  TCustomDataView = class(TBaseLayoutView)
  private
    FCustomData: TCustomData;
    FAutoEdit: Boolean;
    FViewPopupMenu: TdxBarPopupMenu;
    FOnNavigateData: TNavigateDataEvent;
    FOnDoubleClickView: TNotifyEvent;
    FBeginDateEdit: TcxDateEdit;
    FEndDateEdit: TcxDateEdit;

    FInserting: Boolean;
    FDeleting: Boolean;
    FEditing: Boolean;
    FQuerying: Boolean;
    FExporting: Boolean;
    FImporting: Boolean;
    FPrinting: Boolean;

    FViewGroup: TdxLayoutGroup;
    FToolBarGroup: TdxLayoutGroup;
    FViewActionGroup: TdxLayoutGroup;
    FFilterLayoutItem: TdxLayoutItem;
    FPeriodGroup: TdxLayoutGroup;
    FBeginDateItem: TdxLayoutItem;
    FEndDateItem: TdxLayoutItem;
    FClientGroup: TdxLayoutGroup;

    FFirstAction: TAction;
    FPriorAction: TAction;
    FNextAction: TAction;
    FLastAction: TAction;

    FInsertAction: TAction;
    FEditAction: TAction;
    FDeleteAction: TAction;
    FSaveAction: TAction;
    FCancelAction: TAction;
    FExportAction: TAction;
    FImportAction: TAction;
    FPrintAction: TAction;
    FQueryAction: TAction;
    FChartAction: TAction;

    FMultiSelectField: string; // 多选字段名称
    FMultiSelectCategoryField: string; // 多选类别字段（在某一类中进行多选）
    FMultiSelectCategoryFieldValue: Variant; // 当前类别字段的值
    FSelectAllAction: TAction;
    FSelectNoneAction: TAction;
    FSelectInverseAction: TAction;

    FFilterFields: TStrings;
    FFilterButtonEdit: TcxButtonEdit;
    FOnFilterEnter: TNotifyEvent; // 过虑字段按Enter键时触发
    FFixFilterField: string;
    FFixFilterText: string;
    FFixFilterOp: TcxFilterOperatorKind;
    FShowPrintDialog: Boolean;

    FChartView: TCustomDataView;

    function GetFilterFields(): TStrings;
    procedure DoFilterChange(Sender: TObject);
    procedure DoFilterEditButton(Sender: TObject; AButtonIndex: Integer);
    procedure DoFilterKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    function GetFilterText: string;
    procedure SetFilterText(const Value: string);
    procedure SetMultiSelectField(const Value: string);
    procedure RecordMultiSelectCategoryFieldValue();
    procedure EnumMultiSelectCount(ADataTable: TDADataTable; AParam: Variant);
    function GetBeginDate: TDateTime;
    function GetEndDate: TDateTime;
    procedure SetBeginDate(const Value: TDateTime);
    procedure SetEndDate(const Value: TDateTime);
  protected
    procedure CreateCloseAction();

    procedure OnFirstUpdate(Sender: TObject);
    procedure OnInsertUpdate(Sender: TObject);
    procedure OnEditUpdate(Sender: TObject);
    procedure OnDeleteUpdate(Sender: TObject);
    procedure OnSaveUpdate(Sender: TObject);
    procedure OnCancelUpdate(Sender: TObject);
    procedure OnQueryUpdate(Sender: TObject);
    procedure OnExportUpdate(Sender: TObject);
    procedure OnImportUpdate(Sender: TObject);
    procedure OnPrintUpdate(Sender: TObject);
    procedure OnSelectUpdate(Sender: TObject);

    procedure OnCloseExecute(Sender: TObject);
    procedure OnFirstExecute(Sender: TObject);
    procedure OnLastExecute(Sender: TObject);
    procedure OnPriorExecute(Sender: TObject);
    procedure OnNextExecute(Sender: TObject);
    procedure OnInsertExecute(Sender: TObject);
    procedure OnEditExecute(Sender: TObject);
    procedure OnDeleteExecute(Sender: TObject);
    procedure OnSaveExecute(Sender: TObject);
    procedure OnCancelExecute(Sender: TObject);
    procedure OnQueryExecute(Sender: TObject);
    procedure OnExportExecute(Sender: TObject);
    procedure DoImportExecute(Sender: TObject);
    procedure OnPrintExecute(Sender: TObject);
    procedure OnChartExecute(Sender: TObject);
    procedure OnSelectAllExecute(Sender: TObject); virtual;
    procedure OnSelectNoneExecute(Sender: TObject); virtual;
    procedure OnSelectInverseExecute(Sender: TObject); virtual;

    procedure Notification(AComponent: TComponent;
      Operation: TOperation); override;

    procedure DoMultiSelect(ADataTable: TDADataTable; AParam: Variant); virtual;
    procedure BuildFilterFields(); virtual;
    function DoNavigateEvent(NavigateAction: TNavigateAction): Boolean; virtual;

    procedure SetAutoEdit(AValue: Boolean); virtual;

    procedure SetDeleting(const Value: Boolean); virtual;
    procedure SetEditing(const Value: Boolean); virtual;
    procedure SetExporting(const Value: Boolean); virtual;
    procedure SetImporting(const Value: Boolean); virtual;
    procedure SetInserting(const Value: Boolean); virtual;
    procedure SetPrinting(const Value: Boolean); virtual;
    procedure SetQuerying(const Value: Boolean); virtual;

    procedure ResetActionCaption(AAction: TAction; const ACaption: string);

    procedure BuildViewLayout(); override;
    procedure BuildViewComponent(); virtual;
    procedure BuildViewAction(); virtual;
    procedure BuildViewToolBar(); virtual;
    procedure BuildViewPopupMenu(); virtual;
    procedure SetData(ACustomData: TCustomData); virtual;

  public
    destructor Destroy(); override;
    function GetPluginLayoutGroup(AOperation: TBaseOperation)
      : TComponent; override;

    function CanInsert(): Boolean; virtual;
    function CanEdit(): Boolean; virtual;
    function CanDelete(): Boolean; virtual;
    function CanSave(): Boolean; virtual;
    function CanCancel(): Boolean; virtual;
    function CanQuery(): Boolean; virtual;
    function CanExport(): Boolean; virtual;
    function CanImport(): Boolean; virtual;
    function CanPrint(): Boolean; virtual;
    function CanNavigate(): Boolean; virtual;

    procedure GoFirst(); virtual;
    procedure GoNext(); virtual;
    procedure GoPrior(); virtual;
    procedure GoLast(); virtual;
    procedure DataInsert(); virtual;
    procedure DataEdit(); virtual;
    function DataDelete(AAskConfirm: Boolean = True): Boolean; virtual;
    procedure DataSave(); virtual;
    procedure DataCancel(); virtual;
    procedure DataExport(); virtual;
    procedure DataImport(); virtual;
    procedure DataPrint(); virtual;
    procedure DataQuery(); virtual;
    procedure ShowChart(); virtual;

    function FieldByName(const AName: string): TDAField;
    function GetVisibleFields(): string; virtual;
    procedure SetVisibleFields(Fields: string); virtual;

    procedure DoLocalFilter(const AValue: string); virtual;
    procedure DoServerFilter(const AValue: string); virtual;
    procedure CheckSelected(); virtual;
    function GetMultiSelectCount: Integer;

    procedure SetActionVisible(AAction: TAction; AVisible: Boolean);
    procedure SetActionsVisible(AActionArray: array of TAction;
      AVisible: Boolean = True);
    procedure SetDataEditing(AValue: Boolean);
    function HaveDataAfterFilter(): Boolean; virtual;
    procedure SetFixFilter(AFieldName: string = ''; AFilterText: string = '';
      AOperator: TcxFilterOperatorKind = foEqual);

    procedure SaveViewLayout(AIniFile: TIniFile); virtual;
    procedure RestoreViewLayout(AIniFile: TIniFile); virtual;
    procedure SetFieldEditing(AFieldNames: array of string); virtual;
    procedure SetPeriodFormatYearMonth();
    procedure SetPeriodFormatYear();
    procedure SetOnlyOneDate();

    property FirstAction: TAction read FFirstAction;
    property PriorAction: TAction read FPriorAction;
    property NextAction: TAction read FNextAction;
    property LastAction: TAction read FLastAction;

    property InsertAction: TAction read FInsertAction;
    property DeleteAction: TAction read FDeleteAction;
    property EditAction: TAction read FEditAction;
    property SaveAction: TAction read FSaveAction;
    property CancelAction: TAction read FCancelAction;
    property ExportAction: TAction read FExportAction;
    property ImportAction: TAction read FImportAction;
    property PrintAction: TAction read FPrintAction;
    property QueryAction: TAction read FQueryAction;
    property ChartAction: TAction read FChartAction;

    property SelectAllAction: TAction read FSelectAllAction;
    property SelectNoneAction: TAction read FSelectNoneAction;
    property SelectInverseAction: TAction read FSelectInverseAction;

    property Inserting: Boolean read FInserting write SetInserting;
    property Deleting: Boolean read FDeleting write SetDeleting;
    property Editing: Boolean read FEditing write SetEditing;
    property Querying: Boolean read FQuerying write SetQuerying;
    property Exporting: Boolean read FExporting write SetExporting;
    property Importing: Boolean read FImporting write SetImporting;
    property Printing: Boolean read FPrinting write SetPrinting;

    property ViewData: TCustomData read FCustomData write SetData;
    property BeginDateEdit: TcxDateEdit read FBeginDateEdit;
    property EndDateEdit: TcxDateEdit read FEndDateEdit;
    property FilterEdit: TcxButtonEdit read FFilterButtonEdit;
    property ViewPopupMenu: TdxBarPopupMenu read FViewPopupMenu;

    property ViewGroup: TdxLayoutGroup read FViewGroup;
    property ToolBarGroup: TdxLayoutGroup read FToolBarGroup;
    property ActionGroup: TdxLayoutGroup read FViewActionGroup;
    property FilterEditItem: TdxLayoutItem read FFilterLayoutItem;
    property PeriodGroup: TdxLayoutGroup read FPeriodGroup;
    property BeginDateItem: TdxLayoutItem read FBeginDateItem;
    property EndDateItem: TdxLayoutItem read FEndDateItem;
    property ClientGroup: TdxLayoutGroup read FClientGroup;

    property AutoEdit: Boolean read FAutoEdit write SetAutoEdit;
    property FilterFields: TStrings read GetFilterFields;
    property FilterText: string read GetFilterText write SetFilterText;
    property FixFilterField: string read FFixFilterField;
    property FixFilterText: string read FFixFilterText;
    property MultiSelectField: string read FMultiSelectField
      write SetMultiSelectField; // 多选字段
    property MultiSelectCategoryField: string read FMultiSelectCategoryField
      write FMultiSelectCategoryField; // 多选类别字段
    property ShowPrintDialog: Boolean read FShowPrintDialog
      write FShowPrintDialog;
  published
    property BeginDate: TDateTime read GetBeginDate write SetBeginDate;
    property EndDate: TDateTime read GetEndDate write SetEndDate;
    property OnNavigateData: TNavigateDataEvent read FOnNavigateData
      write FOnNavigateData;
    property OnFilterPressEnter: TNotifyEvent read FOnFilterEnter
      write FOnFilterEnter;
    property OnDoubleClickView: TNotifyEvent read FOnDoubleClickView
      write FOnDoubleClickView;

  end;

  TCustomDataPrintProc = procedure(Sender: TCustomData;
    ShowPrintDialog: Boolean);
  TCustomDataViewClass = class of TCustomDataView;

  {
    表单数据视图
    1 根据Schema自动创建编辑表单
    2 提供对话框模式，表单高度自动适应
  }
  TFormDataView = class(TCustomDataView)
  private
    FImage: TImage;
    FEditorGroup: TdxLayoutGroup;
    FEditorContainer: TdxLayoutGroup;
    FImageItem: TdxLayoutItem;

    FOKButton: TcxButton;
    FCancelButton: TcxButton;
    FOKItem: TdxLayoutItem;
    FCancelItem: TdxLayoutItem;
    FBottomGroup: TdxLayoutGroup;

    procedure DoFormShow(Sender: TObject);
    procedure DoFormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure SetViewImage(const Value: string);
  protected
    procedure BuildViewComponent(); override;
    procedure BuildViewAction(); override;
    procedure BuildViewPopupMenu(); override;
    procedure SetData(ACustomData: TCustomData); override;

    procedure DoOKClick(Sender: TObject); virtual;
    procedure DoCancelClick(Sender: TObject); virtual;

    procedure BuildDataEditor(); virtual;
  public
    property EditorGroup: TdxLayoutGroup read FEditorGroup;
    property Image: TImage read FImage;
    property ImageName: string write SetViewImage;
    property OKButton: TcxButton read FOKButton;
    property CancelButton: TcxButton read FCancelButton;
    property BottomGroup: TdxLayoutGroup read FBottomGroup;
    property OKItem: TdxLayoutItem read FOKItem;
    property CancelItem: TdxLayoutItem read FCancelItem;
  end;

  TFormDataViewClass = class of TFormDataView;

  {
    用TcxGrid作为容器的数据视图基类
    1 包含相应数据表单视图，如果UseFormForEditing=True, 那么在编辑时可自动打开表单视图
    2 自动触发ViewData.TriggerScroll
    3 自动建立TcxButtonEdit事件
    4 遍历每个选择的记录：ForEachSelected, 用于多选操作
  }
  TCustomGridDataView = class(TCustomDataView)
  private
    FGridLayoutItem: TdxLayoutItem;
    FGrid: TcxGrid;
    FGridPopupMenu: TcxGridPopupMenu;
    FGridView: TcxCustomGridView;
    FGridViewPopupMenu: TPopupMenu;
    FFormViewClass: TFormDataViewClass;
    FFormView: TFormDataView;
    FFormViewAction: TAction;
    FUseFormForEditing: Boolean;
    FOnRecordScroll: TNotifyEvent;
    FOptionsDataEditing: Boolean;

    function GetFormView(): TFormDataView;
    procedure SyncFormData();
    procedure DoMenuItemExpandAll(Sender: TObject);
    procedure DoMenuItemCollapseAll(Sender: TObject);
    procedure DoGridMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure DoTableCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure DoFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
  protected
    FViewClass: TcxCustomGridViewClass;

    procedure BuildViewComponent(); override;
    procedure BuildViewAction(); override;
    procedure BuildFilterFields(); override;

    function GetDataController(): TcxGridDBDataController; virtual;
    procedure BuildEditButtonEvent(); virtual;
    procedure DoGridNavigate(Sender: TObject;
      NavigateAction: TNavigateAction); virtual;
    procedure DoActionShowFormView(Sender: TObject); virtual;
    procedure DoEditButtonClick(Sender: TObject;
      AButtonIndex: Integer); virtual;

    procedure DoTableCellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean); virtual;

    procedure DoTableCellClickMsg(var Msg: TMessage); message CM_TABLECELLCLICK;

    procedure ConfigViewAfterData(); virtual;
  public
    procedure GoFirst(); override;
    procedure GoNext(); override;
    procedure GoPrior(); override;
    procedure GoLast(); override;

    function CanEdit(): Boolean; override;
    function CanDelete(): Boolean; override;
    procedure DataInsert(); override;
    procedure DataEdit(); override;
    procedure DataQuery(); override;
    function DataDelete(AAskConfirm: Boolean = True): Boolean; override;
    procedure DataExport(); override;
    function HaveDataAfterFilter(): Boolean; override;
    procedure DoLocalFilter(const AValue: string); override;

    procedure ExtractNameAndKeyValue(const ANameFields, AKeyField: string;
      ADest: TStrings);
    procedure SaveViewLayout(AIniFile: TIniFile); override;
    procedure RestoreViewLayout(AIniFile: TIniFile); override;
    procedure SetFieldEditing(AFieldNames: array of string); override;
    procedure FocusFirstVisibleColumn(); virtual;
    procedure ForEachSelected(AProc: TNotifyEvent);

    property FormViewAction: TAction read FFormViewAction;
    property Grid: TcxGrid read FGrid;
    property GridPopupMenu: TcxGridPopupMenu read FGridPopupMenu;
    property GridView: TcxCustomGridView read FGridView;
    property GridViewPopupMenu: TPopupMenu read FGridViewPopupMenu;
    property DataController: TcxGridDBDataController read GetDataController;
    property GridLayoutItem: TdxLayoutItem read FGridLayoutItem;
    property FormView: TFormDataView read GetFormView;
    property FormViewClass: TFormDataViewClass read FFormViewClass
      write FFormViewClass;
    property UseFormForEditing: Boolean read FUseFormForEditing
      write FUseFormForEditing;
    property OnRecordScroll: TNotifyEvent read FOnRecordScroll
      write FOnRecordScroll;
    property OptionsDataEditing: Boolean read FOptionsDataEditing
      write FOptionsDataEditing;
  end;

  { 表格数据视图 }
  TTableGridDataView = class(TCustomGridDataView)
  private
    FLastReporterGroupValue: string;
    FView: TcxGridDBTableView;
    procedure DoDataPrint(Sender: TObject);
  protected
    procedure BuildViewComponent(); override;
    procedure BuildViewPopupMenu(); override;
    procedure SetData(Data: TCustomData); override;
    procedure SetAutoEdit(AValue: Boolean); override;
    function GetDataController(): TcxGridDBDataController; override;
  public
    function CanQuery(): Boolean; override;
    procedure DataInsert(); override;
    procedure DataEdit(); override;
    procedure DataPrint(); override;
    function GetVisibleFields(): string; override;
    procedure SetVisibleFields(Fields: string); override;
    procedure SaveViewLayout(AIniFile: TIniFile); override;
    procedure RestoreViewLayout(AIniFile: TIniFile); override;

    procedure EnableMultiSelect();
    procedure DisableMultiSelect();

    property TableView: TcxGridDBTableView read FView;
  end;

  { Band表格数据视图 }
  TBandGridDataView = class(TCustomGridDataView)
  private
    FView: TcxGridDBBandedTableView;
  protected
    procedure BuildViewComponent(); override;
    procedure BuildViewPopupMenu(); override;
    procedure SetData(Data: TCustomData); override;
    procedure SetAutoEdit(AValue: Boolean); override;
    function GetDataController(): TcxGridDBDataController; override;
  public
    function CanQuery(): Boolean; override;
    procedure DataInsert(); override;
    procedure DataEdit(); override;
    function GetVisibleFields(): string; override;
    procedure SaveViewLayout(AIniFile: TIniFile); override;
    procedure RestoreViewLayout(AIniFile: TIniFile); override;

    procedure EnableMultiSelect();
    procedure DisableMultiSelect();

    property BandView: TcxGridDBBandedTableView read FView;
  end;

  { 卡片数据视图 }
  TCardGridDataView = class(TCustomGridDataView)
  private
    FView: TcxGridDBCardView;
  protected
    procedure BuildViewComponent(); override;
    procedure BuildViewPopupMenu(); override;
    procedure SetData(Data: TCustomData); override;
    procedure SetAutoEdit(AValue: Boolean); override;
    function GetDataController(): TcxGridDBDataController; override;
  public
    procedure DataInsert(); override;
    procedure DataEdit(); override;
    function CanQuery(): Boolean; override;
    procedure SaveViewLayout(AIniFile: TIniFile); override;
    procedure RestoreViewLayout(AIniFile: TIniFile); override;

    property CardView: TcxGridDBCardView read FView;
  end;

  {
    图表数据视图

    1 在自定义图表时发生Access Violation, 修改如下代码：
    Unit cxGridChartView
    constructor TcxGridChartOptionsTreeView.Create
    注销这行：Style.HotTrack := False;
  }
  TChartGridDataView = class(TCustomGridDataView)
  private
    FView: TcxGridDBChartView;
  protected
    procedure BuildViewComponent(); override;
    procedure BuildViewPopupMenu(); override;
    procedure BuildViewToolBar(); override;
    procedure SetData(Data: TCustomData); override;
  public
    function CanInsert(): Boolean; override;
    function CanEdit(): Boolean; override;
    function CanDelete(): Boolean; override;
    property ChartView: TcxGridDBChartView read FView;
  end;

  { 交叉表格数据视图 }
  TPivotDataView = class(TCustomDataView)
  private
    FPivot: TcxDBPivotGrid;
    FPivotLayoutItem: TdxLayoutItem;
    FGridLayoutItem: TdxLayoutItem;
  protected
    procedure BuildViewComponent(); override;
    procedure BuildViewToolBar(); override;
    procedure BuildViewPopupMenu(); override;
    procedure SetData(Data: TCustomData); override;
  public
    function CanInsert(): Boolean; override;
    function CanEdit(): Boolean; override;
    function CanDelete(): Boolean; override;
    function CanExport(): Boolean; override;
    procedure DataExport(); override;
    property PivotGrid: TcxDBPivotGrid read FPivot;
    property PivotLayoutItem: TdxLayoutItem read FGridLayoutItem;
  end;

  {
    树形数据视图

    在Node发生改变时触发ViewData.TriggerScroll
  }
  TTreeDataView = class(TCustomDataView)
  private
    FTreeView: TcxDBTreeList;
    FOnRecordScroll: TNotifyEvent;
    FOptionsDataEditing: Boolean;
    procedure DoFocusedNodeChanged(Sender: TcxCustomTreeList;
      APrevFocusedNode, AFocusedNode: TcxTreeListNode);
    procedure DoTreeDblClick(Sender: TObject);
  protected
    FTreeLayoutItem: TdxLayoutItem;
    procedure BuildViewComponent(); override;
    procedure BuildFilterFields(); override;
    procedure SetData(Data: TCustomData); override;
    procedure SetAutoEdit(AValue: Boolean); override;
  public
    procedure GoFirst(); override;
    procedure GoNext(); override;
    procedure GoPrior(); override;
    procedure GoLast(); override;

    function CanQuery(): Boolean; override;
    function CanExport(): Boolean; override;
    procedure DataInsert(); override;
    procedure DataEdit(); override;
    function DataDelete(AAskConfirm: Boolean = True): Boolean; override;
    procedure DataExport(); override;
    procedure DoLocalFilter(const AValue: string); // override;
    property TreeView: TcxDBTreeList read FTreeView;
    property TreeLayoutItem: TdxLayoutItem read FTreeLayoutItem;
    property OnRecordScroll: TNotifyEvent read FOnRecordScroll
      write FOnRecordScroll;
    property OptionsDataEditing: Boolean read FOptionsDataEditing
      write FOptionsDataEditing;
  end;

  {
    基础数据视图业务

    1 ViewClass可以不设置，可让Schema指定视图类型
    2 需指定数据，可以指定CommonDataContainer中的数据
  }
  TDataViewOperation = class(TViewOperation)
  private
    FCustomData: TCustomData;
    FOwnsData: Boolean;
  protected
    function GetViewClass(): TBaseViewClass; override;
    function GetView(): TBaseView; override;
  public
    destructor Destroy(); override;

    property ViewData: TCustomData read FCustomData write FCustomData;
    property OwnsData: Boolean read FOwnsData write FOwnsData;
  end;

  {
    数据字典维护视图

    根据CustomData的Schema的定义来显示不同的视图
    每个数据一个视图
  }
  TDictManageView = class(TBaseLayoutView)
  private
    FDictTree: TcxTreeList;
    FViewLayoutItem: TdxLayoutItem;

    procedure DoTreeChange(Sender: TObject);
    procedure BuildTree();
  protected
    procedure BuildViewLayout(); override;
    procedure BuildViewComponent();
  public
    destructor Destroy(); override;
    procedure LocateDict(const ALogicalName: string);
  end;

  TPopupEditorWrapper = class;
  TPopupEditorWrapInfo = class;

  IPopupEditorForm = interface
    ['{5BD2A9A0-DC98-45F4-A517-125F85E83CF0}']
    procedure DoPopupInit(Sender: TPopupEditorWrapInfo);
    procedure DoPopup(Sender: TPopupEditorWrapInfo);
    procedure DoPopupClose(Sender: TPopupEditorWrapInfo);
    function DoModalDialog(Sender: TPopupEditorWrapInfo;
      const AFilterText: string): Boolean;
  end;

  {
    数据输入选择法

    可注册数据视图，用于数据输入、选择
  }
  TDictIMEDialog = class(TBaseDialog, IPopupEditorForm)
  private
    FRegisteredDataView: TStrings;

    FOpened: Boolean;
    FOldWidth: Integer;
    FOldHeight: Integer;
    FDictName: string;
    FDictData: TCustomData;
    FNotifier: TNotifyEvent;
    FCurView: TCustomDataView;
    FViewItem: TdxLayoutItem;

    FPopupWrapInfo: TPopupEditorWrapInfo;

    procedure DoFormResize(Sender: TObject);
  protected
    procedure DoDialogOK(Sender: TObject); override;
    procedure DoDialogCancel(Sender: TObject); override;

    function GetDataView(AViewName: string): TCustomDataView;
    procedure RestoreDict();
    procedure SaveDict();
    procedure FocusFilter();
    procedure EditData();

    procedure DoPopupOK(Sender: TObject);
    { IPopupEditorForm }
    procedure DoPopupInit(Sender: TPopupEditorWrapInfo);
    procedure DoPopup(Sender: TPopupEditorWrapInfo);
    procedure DoPopupClose(Sender: TPopupEditorWrapInfo);
    function DoModalDialog(Sender: TPopupEditorWrapInfo;
      const AFilterText: string): Boolean;

  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy(); override;

    procedure RegisterDataView(AViewName: string;
      AViewClass: TCustomDataViewClass);

    function Start(ASender: TControl; ADataName, AViewName, AFilterText: string;
      ANotifier: TNotifyEvent): Boolean;

    function StartIME(ASender: TControl; ACustomData: TCustomData;
      AViewName, AFilterText: string; ANotifier: TNotifyEvent;
      AShowOnly: Boolean): Boolean;

    // 字典输入成功后将返回字典数据，否则将为nil
    property DictData: TCustomData read FDictData;
  end;

  { 年龄输入 }
  TAgeIMEDialog = class(TBaseDialog, IPopupEditorForm)
  private
    FAgeEdit: TcxSpinEdit;
    FNotifier: TNotifyEvent;
    FPopupWrapInfo: TPopupEditorWrapInfo;
    procedure EditData();
    procedure DoPopupOK(Sender: TObject);
  protected
    procedure DoDialogOK(Sender: TObject); override;
    procedure DoDialogCancel(Sender: TObject); override;
    procedure BuildDialog; override;
    { IPopupEditorForm }
    procedure DoPopupInit(Sender: TPopupEditorWrapInfo);
    procedure DoPopup(Sender: TPopupEditorWrapInfo);
    procedure DoPopupClose(Sender: TPopupEditorWrapInfo);
    function DoModalDialog(Sender: TPopupEditorWrapInfo;
      const AFilterText: string): Boolean;
  public
    function Start(ASender: TControl; ANotifier: TNotifyEvent): Boolean;
  end;

  {
    数据绑定控件、表格视图的列字典输入法包装信息

    1 对于PopupEdit，采用弹出式编辑器
    2 针对普通编辑器，采用模式对话框
  }
  TPopupEditorWrapInfo = class(TWrapInfo)
  private
    FProperties: TcxCustomEditProperties;
    FDataSource: TDADataSource;
    FDataTable: TDADataTable;
    FField: TDAField;
    FButtonAction: TAction;
    FClearAction: TAction;
    FOldGridEditKeyEvent: TcxGridEditKeyPressEvent;
    FPopupControl: TObject;
    FEditorName: string;
    FPopupEditorForm: TForm;
    FGetValueFields: TStrings;
    FSetValueFields: TStrings;
    FDictName: string;
    FDictTable: TDADataTable;
    FMultiEditorAttributes: TStrings;
    FFreeEditing: Boolean; // 是否可自由编辑，不设置键盘事件
    FFreeAppending: Boolean; // 自由方式下内容是否合并上去，否则为替换
    FFreeAppendChar: string;

    procedure ShowModalPopuForm(const AFilterText: string);
    procedure DoButtonAction(Sender: TObject);
    procedure DoActionClear(Sender: TObject);
    function GetButtonAction: TAction;
    function GetClearAction: TAction;
    procedure DoPopupEnter(Sender: TObject);
  protected
    procedure EditData();
    procedure ClearData();
    procedure DoGridEditKeyPress(Sender: TcxCustomGridTableView;
      AItem: TcxCustomGridTableItem; AEdit: TcxCustomEdit; var Key: Char);
  public
    constructor Create(ATarget: TComponent); override;
    destructor Destroy(); override;
    procedure Wrap(); override;

    procedure DoKeyPress(Sender: TObject; var Key: Char);
    procedure DoPopupOK(Sender: TObject);
    procedure DoPopup(Sender: TObject);
    procedure DoPopupInit(Sender: TObject);
    procedure ClosePopup();
    procedure DoPopupClose(Sender: TcxControl; AReason: TcxEditCloseUpReason);

    property ButtonAction: TAction read GetButtonAction;
    property ClearAction: TAction read GetClearAction;
    property DataSource: TDADataSource read FDataSource write FDataSource;
    property DataTable: TDADataTable read FDataTable write FDataTable;
    property Properties: TcxCustomEditProperties read FProperties
      write FProperties;
    property Field: TDAField read FField write FField;
    property SetValueField: TStrings read FSetValueFields;
    property GetValueField: TStrings read FGetValueFields;
    property DictName: string read FDictName write FDictName;
    property MultiEditorAttributes: TStrings read FMultiEditorAttributes;
  end;

  { 弹出式字典输入法包装器 }
  TPopupEditorWrapper = class(TControlWrapper)
  private
    FRegisteredEditor: TStrings;
    FCreatedEditor: TStrings;
    FOldOnWrapProperties: TOnWrapProperties;
  protected
    function GetWrapInfoClass(): TWrapInfoClass; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy(); override;

    procedure WrapDataControl(AControl: TComponent;
      AProperties: TcxCustomEditProperties; AField: TDAField;
      ASource: TDADataSource; AMultiEditorAttributes: TStrings);

    procedure WrapProperites(AColumn: TComponent;
      AProperties: TcxCustomEditProperties; AField: TDAField;
      ASource: TDADataSource; AMultiEditorAttributes: TStrings);

    procedure RegisterPopupEditor(const AEditorName: string;
      AEditor: TFormClass);
    function GetPopupEditor(const AEditorName: string): TForm;
  end;

  {
    打印配置视图

    使用前需注册公共数据：Misc_Report, Misc_ReportParam
  }
  TReportConfigView = class(TBaseLayoutView)
  private
    FReportData: TCustomData;
    FParamData: TCustomData;
    FReportView: TTableGridDataView;
    FParamView: TTableGridDataView;
    FOnPrint: TNotifyEvent;

    function BuildLocalParamData(): TCustomData;
    function BuildLocalReportData(): TCustomData;
    function GetReportName: string;
  protected
    procedure BuildViewLayout(); override;
    procedure DoPrintReport(Sender: TObject); virtual;
  public
    function GetParamNameArray(): TVariantArray;
    function GetParamValueArray(): TVariantArray;

    property ReportName: string read GetReportName;
    property ReportView: TTableGridDataView read FReportView;
    property ParamView: TTableGridDataView read FParamView;
    property OnPrint: TNotifyEvent read FOnPrint write FOnPrint;
  end;

function DictIME: TDictIMEDialog;

function GetDataViewClass(ADataViewType: TDataViewType): TCustomDataViewClass;

function EditData(ACustomData: TCustomData): Boolean;

var
  PopupEditorWrapper: TPopupEditorWrapper; // 字典输入包装器
  CustomDataPrintProc: TCustomDataPrintProc;

implementation

{$WARNINGS OFF}

type
  TcxCustomEditAccess = class(TcxCustomEdit);

var
  EditDataView: TFormDataView;

function EditData(ACustomData: TCustomData): Boolean;
begin
  if EditDataView = nil then
  begin
    EditDataView := TFormDataView.Create(Application);
    EditDataView.Position := poMainFormCenter;
    EditDataView.BorderStyle := bsDialog;
  end;
  EditDataView.Caption := ACustomData.Description;
  EditDataView.ViewData := ACustomData;
  Result := EditDataView.ShowModal = mrOk;
end;

function DictIME: TDictIMEDialog;
begin
  Result := TDictIMEDialog(PopupEditorWrapper.GetPopupEditor
    (sPopupViewName_DictIME));
end;

{
  AFilterFields包含要过滤的字段和对应列
  AFixFilterField: 固定的过滤字段
  AFixFilterText: 固定的过滤文本
  对TreeList中的Filter无效????
}

procedure BuildFilter(AFilter: TcxDataFilterCriteria; AFilterFields: TStrings;
  const AText: string; const AFixFilterField: string = '';
  const AFixFilterText: string = '';
  AFixFilterOp: TcxFilterOperatorKind = foEqual);
var
  I: Integer;
  FilterRoot: TcxFilterCriteriaItemList;
begin
  with AFilter do
  begin
    Active := False;
    Root.Clear;
    if (AText = '') and (AFixFilterField = '') then
      Exit;

    if AFixFilterField <> '' then
    begin
      Root.BoolOperatorKind := fboAnd;
      Root.AddItem(TcxDBDataController(AFilter.DataController)
        .GetItemByFieldName(AFixFilterField), AFixFilterOp, AFixFilterText,
        AFixFilterField);
      FilterRoot := Root.AddItemList(fboOr);
    end
    else
    begin
      Root.BoolOperatorKind := fboOr;
      FilterRoot := Root;
    end;

    if (AText <> '') then
      for I := 0 to AFilterFields.Count - 1 do
        FilterRoot.AddItem(AFilterFields.Objects[I], foLike, '%' + AText + '%',
          AFilterFields[I]);

    Active := True;
  end;
end;

function GetDataViewClass(ADataViewType: TDataViewType): TCustomDataViewClass;
const
  ViewClassArray: array [TDataViewType] of TCustomDataViewClass =
    (TTableGridDataView, TBandGridDataView, TCardGridDataView,
    TChartGridDataView, TTreeDataView, TPivotDataView, TFormDataView);
begin
  if Integer(ADataViewType) > Integer(dvForm) then
    ADataViewType := dvForm;
  if Integer(ADataViewType) < 0 then
    ADataViewType := dvGrid;
  Result := ViewClassArray[ADataViewType];
end;

{ TCustomDataView }

procedure TCustomDataView.BuildFilterFields;
var
  I: Integer;
begin
  {
    建立过滤字段列表
    子类可进一步优化
    由子类决定何时调用此过程
  }
  FilterFields.Clear;
  if ViewData = nil then
    Exit;

  // 一个数据模型可能用在多个视图中，因此每个视图需配置自己的过滤字段
  FilterFields.AddStrings(ViewData.FilterFields);
  // 如果没有定义过滤字段，则自动添加所有文本字段
  if FilterFields.Count = 0 then
    for I := 0 to ViewData.Table.Fields.Count - 1 do
    begin
      if ViewData.Table.Fields[I].DataType in [datString, datWideString] then
        FilterFields.Add(ViewData.Table.Fields[I].Name);
    end;
end;

{ 组装Action }
procedure TCustomDataView.BuildViewAction;
begin
  FFirstAction := BuildAction('第一条', 'first', '', OnFirstUpdate, OnFirstExecute,
    ShortCut(VK_UP, [ssAlt, ssShift]), 0);
  FPriorAction := BuildAction('上一条', 'prior', '', OnFirstUpdate, OnPriorExecute,
    ShortCut(VK_UP, [ssAlt]), 0);
  FNextAction := BuildAction('下一条', 'next', '', OnFirstUpdate, OnNextExecute,
    ShortCut(VK_DOWN, [ssAlt]), 0);
  FLastAction := BuildAction('最后一条', 'last', '', OnFirstUpdate, OnLastExecute,
    ShortCut(VK_DOWN, [ssAlt, ssShift]), 0);
  FFirstAction.Visible := False;
  FPriorAction.Visible := False;
  FNextAction.Visible := False;
  FLastAction.Visible := False;

  FQueryAction := BuildAction('刷新', 'query', '', OnQueryUpdate, OnQueryExecute,
    ShortCut(Ord('Q'), [ssCtrl]), BTN_SHOWCAPTION);
  FExportAction := BuildAction('导出', 'export', '', OnExportUpdate,
    OnExportExecute, 0, BTN_NOPOPUPMENU);
  FImportAction := BuildAction('导入', 'import', '', OnImportUpdate,
    DoImportExecute, 0, BTN_SHOWCAPTION or BTN_NOPOPUPMENU);
  FPrintAction := BuildAction('打印', 'print', '', OnPrintUpdate, OnPrintExecute,
    ShortCut(Ord('P'), [ssCtrl]), BTN_SHOWCAPTION);
  FCancelAction := BuildAction('取消', 'cancel', '', OnCancelUpdate,
    OnCancelExecute, 0, BTN_SHOWCAPTION or BTN_NOPOPUPMENU);
  FSaveAction := BuildAction('保存', 'post', '', OnSaveUpdate, OnSaveExecute,
    ShortCut(Ord('S'), [ssCtrl]), BTN_SHOWCAPTION or BTN_NOPOPUPMENU);
  FEditAction := BuildAction('编辑', 'edit', '', OnEditUpdate, OnEditExecute,
    ShortCut(VK_F2, []), BTN_SHOWCAPTION);
  FDeleteAction := BuildAction('删除', 'del', '', OnDeleteUpdate, OnDeleteExecute,
    ShortCut(VK_DELETE, [ssCtrl]), BTN_SHOWCAPTION or BTN_NOPOPUPMENU);
  FInsertAction := BuildAction('新增', 'add', '', OnInsertUpdate, OnInsertExecute,
    ShortCut(VK_F8, []), BTN_SHOWCAPTION);
  FChartAction := BuildAction('图表', 'chart', '', nil, OnChartExecute, 0,
    BTN_SHOWCAPTION);
  FChartAction.GroupIndex := 1;

  FImportAction.Visible := False;
  FPrintAction.Visible := False;
  FSaveAction.Visible := False;
  FCancelAction.Visible := False;
  FDeleteAction.Visible := False;
  FEditAction.Visible := False;
  FInsertAction.Visible := False;
  FChartAction.Visible := False;

  FSelectAllAction := BuildAction('全选', 'select_all', '', OnSelectUpdate,
    OnSelectAllExecute, 0, BTN_SHOWCAPTION);
  FSelectNoneAction := BuildAction('不选', 'select_none', '', OnSelectUpdate,
    OnSelectNoneExecute, 0, BTN_SHOWCAPTION);
  FSelectInverseAction := BuildAction('反选', 'select_inverse', '',
    OnSelectUpdate, OnSelectInverseExecute, 0, BTN_SHOWCAPTION);
  FSelectAllAction.Visible := False;
  FSelectNoneAction.Visible := False;
  FSelectInverseAction.Visible := False;
end;

{ 组装工具栏 }

procedure TCustomDataView.BuildViewToolBar;
begin
  {
    注意：只有在BarManager创建之后才能调用。而BarManager只能在主窗体中创建。
    即只有主窗体创建后才能调用BuildViewToolBar，BuildViewPopupMenu情形同此;
  }
  BuildLayoutToolBar(FViewActionGroup, ViewActions);
end;

{ 组装视图 }

procedure TCustomDataView.BuildViewComponent;
begin
  if FFilterButtonEdit = nil then
  begin
    FFilterButtonEdit := TcxButtonEdit.Create(Self);
    FFilterButtonEdit.OnKeyDown := DoFilterKeyDown;
    with FFilterButtonEdit.Properties do
    begin
      Buttons[0].Caption := '×';
      Buttons[0].Kind := bkText;
      MaxLength := 20;
      OnChange := DoFilterChange;
      OnButtonClick := DoFilterEditButton;
      ClearKey := ShortCut(VK_DELETE, []);
    end;

    FBeginDateEdit := TcxDateEdit.Create(Self);
    FEndDateEdit := TcxDateEdit.Create(Self);
    FBeginDateEdit.Date := Date();
    FEndDateEdit.Date := Date();

    FViewPopupMenu := TdxBarPopupMenu.Create(Self);
    FViewPopupMenu.BarManager := DevExpress.BarManager;

    with ViewLayout do
    begin
      FViewGroup := Items.CreateGroup();
      with FViewGroup do
      begin
        AlignHorz := ahClient;
        AlignVert := avClient;
        ShowBorder := False;

        // 创建工具栏面板
        FToolBarGroup := CreateGroup();
        with FToolBarGroup do
        begin
          LayoutDirection := ldHorizontal;
          ShowBorder := False;

          // 创建时间段查询面板
          FPeriodGroup := CreateGroup();
          with FPeriodGroup do
          begin
            Visible := False;
            ShowBorder := False;
            LayoutDirection := ldHorizontal;
            AlignVert := avCenter;
            FBeginDateItem := CreateItemForControl(FBeginDateEdit);
            with FBeginDateItem do
            begin
              Caption := '起始时间:';
              AlignVert := avCenter;
            end;
            FEndDateItem := CreateItemForControl(FEndDateEdit);
            with FEndDateItem do
            begin
              Caption := '结束时间:';
              AlignVert := avCenter;
            end;
          end;

          FViewActionGroup := CreateGroup();
          FViewActionGroup.ShowBorder := False;
          FViewActionGroup.LayoutDirection := ldHorizontal;

          // 创建筛选面板
          FFilterLayoutItem := CreateItemForControl(FFilterButtonEdit);
          with FFilterLayoutItem do
          begin
            AlignVert := avCenter;
            Caption := '筛选:';
            Visible := False;
          end;
        end;

        FClientGroup := CreateGroup();
        with FClientGroup do
        begin
          // LayoutDirection := ldTabbed;
          ShowBorder := False;
          AlignHorz := ahClient;
          AlignVert := avClient;
        end;
      end; // ViewGroup

    end;
  end;
end;

{ 组装弹出菜单 }
procedure TCustomDataView.BuildViewPopupMenu;
begin
  BuildBarPopupMenu(Self, ViewPopupMenu, ViewActions, '');
end;

function TCustomDataView.CanCancel: Boolean;
begin
  Result := (FCustomData <> nil) and FCustomData.CanCancel;
end;

function TCustomDataView.CanDelete: Boolean;
begin
  Result := FDeleting and (FCustomData <> nil) and FCustomData.CanDelete;
end;

function TCustomDataView.CanEdit: Boolean;
begin
  Result := FEditing and (FCustomData <> nil) and FCustomData.CanEdit;
end;

function TCustomDataView.CanExport: Boolean;
begin
  Result := FExporting and (FCustomData <> nil) and FCustomData.Table.Active;
end;

function TCustomDataView.CanImport: Boolean;
begin
  Result := FImporting and (FCustomData <> nil) and FCustomData.Table.Active;
end;

function TCustomDataView.CanInsert: Boolean;
begin
  Result := FInserting and (FCustomData <> nil) and FCustomData.CanInsert;
end;

function TCustomDataView.CanPrint: Boolean;
begin
  Result := FPrinting or ((FCustomData <> nil) and FCustomData.CanPrint());
end;

function TCustomDataView.CanQuery: Boolean;
begin
  Result := FQuerying and (FCustomData <> nil) and FCustomData.CanQuery;
end;

function TCustomDataView.CanSave: Boolean;
begin
  Result := (FCustomData <> nil) and FCustomData.CanSave;
end;

procedure TCustomDataView.DataCancel();
begin
  FCustomData.Cancel;
end;

function TCustomDataView.DataDelete(AAskConfirm: Boolean = True): Boolean;
begin
  Result := False;
  if not AAskConfirm or ShowYesNo(Caption + ': ' + sDeleteDataConfirm) then
  begin
    FCustomData.Delete;
    Result := True;
  end;
end;

procedure TCustomDataView.DataEdit();
begin
  if FCustomData <> nil then
    FCustomData.Edit;
end;

procedure TCustomDataView.DataExport();
begin
  if DataExportWizard <> nil then
    DataExportWizard.ExportData(ViewData.Table.Dataset, GetVisibleFields);
end;

procedure TCustomDataView.DataImport;
begin
  if DataImportWizard <> nil then
    DataImportWizard.ImportData(ViewData.Table.Dataset, GetVisibleFields,
      ViewData.KeyFieldNames);
end;

procedure TCustomDataView.DataInsert();
begin
  if FCustomData <> nil then
    FCustomData.Insert;
end;

procedure TCustomDataView.DataPrint();
begin
  if Assigned(CustomDataPrintProc) then
    CustomDataPrintProc(ViewData, ShowPrintDialog);
end;

procedure TCustomDataView.DataQuery();
begin
  if FCustomData <> nil then
  begin
    FCustomData.Refresh;
  end;
end;

procedure TCustomDataView.DataSave();
begin
  if FCustomData <> nil then
    FCustomData.Save;
end;

function TCustomDataView.GetFilterFields: TStrings;
begin
  if FFilterFields = nil then
    FFilterFields := TStringList.Create;
  Result := FFilterFields;
end;

function TCustomDataView.CanNavigate: Boolean;
begin
  Result := (ViewData <> nil) and ViewData.Table.Active;
end;

procedure TCustomDataView.GoFirst;
begin
  if CanNavigate then
    if not DoNavigateEvent(naFirst) then
      ViewData.First;
end;

procedure TCustomDataView.GoLast;
begin
  if CanNavigate then
    // 没有设置事件时就做自己的默认动作
    if not DoNavigateEvent(naLast) then
      ViewData.Last;
end;

procedure TCustomDataView.GoNext;
begin
  if CanNavigate then
    if not DoNavigateEvent(naNext) then
      ViewData.Next;
end;

procedure TCustomDataView.GoPrior;
begin
  if CanNavigate then
    if not DoNavigateEvent(naPrior) then
      ViewData.Prior;
end;

procedure TCustomDataView.OnFirstExecute(Sender: TObject);
begin
  GoFirst;
end;

procedure TCustomDataView.OnFirstUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := CanNavigate;
end;

procedure TCustomDataView.OnLastExecute(Sender: TObject);
begin
  GoLast;
end;

procedure TCustomDataView.OnNextExecute(Sender: TObject);
begin
  GoNext;
end;

procedure TCustomDataView.OnPriorExecute(Sender: TObject);
begin
  GoPrior;
end;

procedure TCustomDataView.OnCancelExecute(Sender: TObject);
begin
  DataCancel;
end;

procedure TCustomDataView.OnCancelUpdate(Sender: TObject);
begin
  FCancelAction.Enabled := CanCancel;
end;

procedure TCustomDataView.OnDeleteExecute(Sender: TObject);
begin
  DataDelete(True);
end;

procedure TCustomDataView.OnDeleteUpdate(Sender: TObject);
begin
  FDeleteAction.Enabled := CanDelete;
end;

procedure TCustomDataView.OnEditExecute(Sender: TObject);
begin
  DataEdit;
end;

procedure TCustomDataView.OnEditUpdate(Sender: TObject);
begin
  FEditAction.Enabled := CanEdit;
end;

procedure TCustomDataView.OnExportExecute(Sender: TObject);
begin
  DataExport;
end;

procedure TCustomDataView.DoImportExecute(Sender: TObject);
begin
  DataImport;
end;

procedure TCustomDataView.OnExportUpdate(Sender: TObject);
begin
  FExportAction.Enabled := CanExport;
end;

procedure TCustomDataView.OnImportUpdate(Sender: TObject);
begin
  FImportAction.Enabled := CanImport;
end;

procedure TCustomDataView.OnInsertExecute(Sender: TObject);
begin
  DataInsert;
end;

procedure TCustomDataView.OnInsertUpdate(Sender: TObject);
begin
  FInsertAction.Enabled := CanInsert;
end;

procedure TCustomDataView.OnPrintExecute(Sender: TObject);
begin
  DataPrint;
end;

procedure TCustomDataView.OnPrintUpdate(Sender: TObject);
begin
  FPrintAction.Enabled := CanPrint;
end;

procedure TCustomDataView.OnQueryExecute(Sender: TObject);
begin
  DataQuery;
end;

procedure TCustomDataView.OnQueryUpdate(Sender: TObject);
begin
  FQueryAction.Enabled := CanQuery;
end;

procedure TCustomDataView.OnSaveExecute(Sender: TObject);
begin
  DataSave;
end;

procedure TCustomDataView.OnSaveUpdate(Sender: TObject);
begin
  FSaveAction.Enabled := CanSave;
end;

procedure TCustomDataView.SetData(ACustomData: TCustomData);
var
  Attr: string;
begin
  FMultiSelectField := '';
  FCustomData := ACustomData;
  SetAutoEdit(FAutoEdit);
  if (FCustomData <> nil) then
  begin
    MultiSelectField := FCustomData.Table.CustomAttributes.Values
      ['MultiSelectField'];
    Printing := ACustomData.ReporterNames.Count > 0;

    // 同一数据用在多个地方时，可能需分别设置，不可放在Schema中
    Attr := FCustomData.CustomAttributes.Values['AutoEdit'];
    if Attr <> '' then
      AutoEdit := StrToBoolDef(Attr, False);

    Attr := FCustomData.CustomAttributes.Values['ShowFilterEdit'];
    if Attr <> '' then
      FilterEditItem.Visible := StrToBoolDef(Attr, False);

    Attr := FCustomData.CustomAttributes.Values['ShowGridChart'];
    if Attr <> '' then
      SetActionVisible(ChartAction, StrToBoolDef(Attr, False));

    FCustomData.FreeNotification(Self);
    if (not FCustomData.Table.Active) then
      DataQuery;
    // 数据没有打开时，则无法创建其他对象, Open应该写上基本的查询功能
    // 可以在SetData之前打开数据，不会产生额外的消耗
  end;
end;

destructor TCustomDataView.Destroy;
begin
  SaveViewLayout(AppCore.UserIni);
  FCustomData := nil;
  FreeAndNil(FFilterFields);
  inherited;
end;

procedure TCustomDataView.SetAutoEdit(AValue: Boolean);
begin
  FAutoEdit := AValue;
  if FCustomData <> nil then
    FCustomData.Source.AutoEdit := FAutoEdit;
end;

procedure TCustomDataView.DoLocalFilter(const AValue: string);
begin
  ViewData.DoLocalFilter(AValue);
end;

procedure TCustomDataView.DoServerFilter(const AValue: string);
begin
  ViewData.DoServerFilter(AValue);
end;

procedure TCustomDataView.DoFilterChange(Sender: TObject);
begin
  if ViewData.FilterFromServer then
    DoServerFilter(FFilterButtonEdit.Text)
  else
    DoLocalFilter(FFilterButtonEdit.Text);
end;

procedure TCustomDataView.DoFilterEditButton(Sender: TObject;
  AButtonIndex: Integer);
begin
  FFilterButtonEdit.Text := '';
end;

function TCustomDataView.DoNavigateEvent(NavigateAction
  : TNavigateAction): Boolean;
begin
  if Assigned(FOnNavigateData) then
  begin
    FOnNavigateData(Self, NavigateAction);
    Result := True
  end
  else
    Result := False;
end;

{ 设置与Action相关的TControl以及TdxLayoutItem的可见性 }

procedure TCustomDataView.SetActionVisible(AAction: TAction; AVisible: Boolean);

  procedure SetActionControlItem(AParentControl: TWinControl);
  var
    I: Integer;
    Item: TdxLayoutItem;
  begin
    for I := 0 to AParentControl.ControlCount - 1 do
    begin
      if (AParentControl.Controls[I].Action = AAction) then
      begin
        Item := ViewLayout.FindItem(AParentControl.Controls[I]);
        if Item <> nil then
          Item.Visible := AVisible;
      end;
      if AParentControl.Controls[I].InheritsFrom(TWinControl) then
        SetActionControlItem(TWinControl(AParentControl.Controls[I]));
    end;
  end;

begin
  AAction.Visible := AVisible;
  SetActionControlItem(Self);
end;

procedure TCustomDataView.SetDataEditing(AValue: Boolean);
begin
  Editing := AValue;
  Deleting := AValue;
  Inserting := AValue;
  // 使相应编辑Action可见
  SetActionsVisible([InsertAction, DeleteAction, EditAction, SaveAction,
    CancelAction], AValue);
end;

{ 设置Action的可见性 }

procedure TCustomDataView.SetActionsVisible(AActionArray: array of TAction;
  AVisible: Boolean = True);
var
  I: Integer;
begin
  {
    for I := 0 to ViewActions.ActionCount - 1 do
    begin
    SetActionVisible(TAction(ViewActions[I]), not AVisible);
    end;
  }
  for I := 0 to Length(AActionArray) - 1 do
  begin
    SetActionVisible(AActionArray[I], AVisible);
  end;
end;

procedure TCustomDataView.DoFilterKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Ord(Key) = VK_RETURN) and (Shift = []) then
  begin
    if HaveDataAfterFilter and Assigned(FOnFilterEnter) then
      FOnFilterEnter(Sender);
  end
  else if (Ord(Key) = VK_UP) and (Shift = []) then
    GoPrior
  else if (Ord(Key) = VK_DOWN) and (Shift = []) then
    GoNext
  else if (Ord(Key) = VK_UP) and (Shift = [ssCtrl]) then
    GoFirst
  else if (Ord(Key) = VK_DOWN) and (Shift = [ssCtrl]) then
    GoLast
end;

function TCustomDataView.HaveDataAfterFilter: Boolean;
begin
  Result := CanQuery and not ViewData.Table.EOF;
end;

{ 添加固定的筛选条件 }

procedure TCustomDataView.SetFixFilter(AFieldName, AFilterText: string;
  AOperator: TcxFilterOperatorKind);
const
  DAOperator: array [foEqual .. foLike] of TDABinaryOperator = (dboEqual,
    dboNotEqual, dboLess, dboLessOrEqual, dboGreater,
    dboGreaterOrEqual, dboLike);
begin
  FFixFilterField := AFieldName;
  FFixFilterText := AFilterText;
  FFixFilterOp := AOperator;

  if FCustomData <> nil then
  begin
    FCustomData.SetFixFilter(AFieldName, AFilterText, DAOperator[AOperator]);
  end;

  DoFilterChange(FFilterButtonEdit);
end;

function TCustomDataView.FieldByName(const AName: string): TDAField;
begin
  Result := ViewData.Table.FieldByName(AName);
end;

procedure TCustomDataView.BuildViewLayout;
begin
  FShowPrintDialog := True;
  inherited;
  FEditing := False;
  FInserting := False;
  FDeleting := False;
  FQuerying := True;
  FExporting := True;
  FPrinting := False;

  BuildViewComponent;
  BuildViewAction;
  BuildViewToolBar;
  BuildViewPopupMenu;
end;

{ 获取可见的字段，用逗号隔开 }

function TCustomDataView.GetVisibleFields: string;
var
  I: Integer;
begin
  Result := '';
  for I := 0 to ViewData.Table.Fields.Count - 1 do
  begin
    if ViewData.Table.Fields[I].Visible then
    begin
      if Result = '' then
        Result := ViewData.Table.Fields[I].Name
      else
        Result := Result + ',' + ViewData.Table.Fields[I].Name;
    end;
  end;
end;

procedure TCustomDataView.SetDeleting(const Value: Boolean);
begin
  FDeleting := Value;
  SetActionVisible(DeleteAction, Value);
end;

procedure TCustomDataView.SetEditing(const Value: Boolean);
begin
  FEditing := Value;
  SetActionsVisible(EditAction, Value);
end;

procedure TCustomDataView.SetExporting(const Value: Boolean);
begin
  FExporting := Value;
  SetActionsVisible(ExportAction, Value);
end;

procedure TCustomDataView.SetImporting(const Value: Boolean);
begin
  FImporting := Value;
  SetActionsVisible(ImportAction, Value);
end;

procedure TCustomDataView.SetInserting(const Value: Boolean);
begin
  FInserting := Value;
  SetActionVisible(InsertAction, Value);
end;

procedure TCustomDataView.SetPrinting(const Value: Boolean);
begin
  FPrinting := Value;
  SetActionVisible(PrintAction, Value);
end;

procedure TCustomDataView.SetQuerying(const Value: Boolean);
begin
  FQuerying := Value;
  SetActionVisible(QueryAction, Value);
end;

{ 重置Action标题, 便于子类重新定义标准Action, 在BuildAction时调用 }

procedure TCustomDataView.ResetActionCaption(AAction: TAction;
  const ACaption: string);
begin
  AAction.Tag := AAction.Tag or BTN_SHOWCAPTION;
  AAction.Caption := ACaption;
end;

procedure TCustomDataView.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  if (Operation = opRemove) and (AComponent = FCustomData) then
  begin
    FCustomData := nil;
  end;
  inherited;
end;

function TCustomDataView.GetFilterText: string;
begin
  Result := FilterEdit.Text;
end;

procedure TCustomDataView.SetFilterText(const Value: string);
begin
  FilterEdit.Text := Value;
end;

procedure TCustomDataView.OnSelectNoneExecute(Sender: TObject);
begin
  DataSave;
  EnumDataTable(FCustomData.Table, DoMultiSelect, 0);
end;

procedure TCustomDataView.OnSelectAllExecute(Sender: TObject);
begin
  DataSave;
  RecordMultiSelectCategoryFieldValue();
  EnumDataTable(FCustomData.Table, DoMultiSelect, 1);
end;

procedure TCustomDataView.OnSelectInverseExecute(Sender: TObject);
begin
  DataSave;
  EnumDataTable(FCustomData.Table, DoMultiSelect, 2);
end;

procedure TCustomDataView.OnSelectUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := (FCustomData <> nil) and (MultiSelectField <> '');
end;

procedure TCustomDataView.DoMultiSelect(ADataTable: TDADataTable;
  AParam: Variant);
begin
  ViewData.Edit;
  if (FMultiSelectCategoryField = '') or
    (FMultiSelectCategoryFieldValue = ADataTable.FieldByName
    (FMultiSelectCategoryField).Value) then
    case AParam of
      0:
        ADataTable.FieldByName(MultiSelectField).AsBoolean := False;
      1:
        ADataTable.FieldByName(MultiSelectField).AsBoolean := True;
      2:
        ADataTable.FieldByName(MultiSelectField).AsBoolean :=
          not ADataTable.FieldByName(MultiSelectField).AsBoolean;
    end;
  ViewData.Save;
end;

procedure TCustomDataView.SetMultiSelectField(const Value: string);
begin
  FMultiSelectField := Value;
  SetActionsVisible([FSelectAllAction, FSelectNoneAction, FSelectInverseAction],
    (FMultiSelectField <> '') and ViewData.FieldByName(Value).Visible);
end;

procedure TCustomDataView.RecordMultiSelectCategoryFieldValue;
begin
  // 记录下当前多选类别字段的值
  if FMultiSelectCategoryField <> '' then
    FMultiSelectCategoryFieldValue := FCustomData.Table.FieldByName
      (FMultiSelectCategoryField).Value;
end;

procedure TCustomDataView.CheckSelected;
begin
  // 检查选择的数据是否正确
  if (ViewData = nil) and ViewData.EOF then
    raise Exception.Create('选择错误');

  if (MultiSelectField <> '') and (GetMultiSelectCount = 0) then
  begin
    raise Exception.Create('请进行选择')
  end;
end;

function TCustomDataView.GetMultiSelectCount: Integer;
begin
  Result := 0;
  if MultiSelectField <> '' then
    EnumDataTable(ViewData.Table, EnumMultiSelectCount, Integer(@Result));
end;

procedure TCustomDataView.EnumMultiSelectCount(ADataTable: TDADataTable;
  AParam: Variant);
begin
  if FieldByName(MultiSelectField).AsBoolean then
    PInteger(Integer(AParam))^ := PInteger(Integer(AParam))^ + 1;
end;

procedure TCustomDataView.RestoreViewLayout(AIniFile: TIniFile);
begin

end;

procedure TCustomDataView.SaveViewLayout(AIniFile: TIniFile);
begin

end;

procedure TCustomDataView.SetFieldEditing(AFieldNames: array of string);
begin
  // 设置字段的可编辑状态
end;

function TCustomDataView.GetBeginDate: TDateTime;
begin
  BeginDateEdit.PostEditValue;
  Result := BeginDateEdit.Date;
end;

function TCustomDataView.GetEndDate: TDateTime;
begin
  EndDateEdit.PostEditValue;
  Result := EndDateEdit.Date;
end;

procedure TCustomDataView.SetBeginDate(const Value: TDateTime);
begin
  BeginDateEdit.Date := Value;
end;

procedure TCustomDataView.SetEndDate(const Value: TDateTime);
begin
  EndDateEdit.Date := Value;
end;

procedure TCustomDataView.SetPeriodFormatYear;
begin
  BeginDateEdit.Properties.DisplayFormat := 'YYYY年';
  EndDateEdit.Properties.DisplayFormat :=
    BeginDateEdit.Properties.DisplayFormat;
  BeginDateItem.Caption := '起始年份';
  EndDateItem.Caption := '结束年份';
  BeginDateEdit.Properties.EditFormat := 'YYYY';
  EndDateEdit.Properties.EditFormat := BeginDateEdit.Properties.EditFormat;
end;

procedure TCustomDataView.SetPeriodFormatYearMonth;
begin
  BeginDateEdit.Properties.DisplayFormat := 'YYYY年MM月';
  EndDateEdit.Properties.DisplayFormat :=
    BeginDateEdit.Properties.DisplayFormat;
  BeginDateItem.Caption := '起始年月';
  EndDateItem.Caption := '结束年月';
  BeginDateEdit.Properties.EditFormat := 'YYYY-MM';
  EndDateEdit.Properties.EditFormat := BeginDateEdit.Properties.EditFormat;
end;

procedure TCustomDataView.OnCloseExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TCustomDataView.CreateCloseAction;
begin
  // 应放在BuildActions过程中
  BuildAction('关闭', 'close', '', nil, OnCloseExecute, ShortCut(VK_ESCAPE, []),
    BTN_SHOWCAPTION or BTN_NOPOPUPMENU);
end;

procedure TCustomDataView.SetOnlyOneDate;
begin
  PeriodGroup.Visible := True;
  BeginDateItem.Caption := '查询日期';
  EndDateItem.Visible := False; // 只允许查询一天的记录
end;

function TCustomDataView.GetPluginLayoutGroup(AOperation: TBaseOperation)
  : TComponent;
begin
  Result := ToolBarGroup;
end;

procedure TCustomDataView.SetVisibleFields(Fields: string);
begin

end;

procedure TCustomDataView.ShowChart;
begin
  if FChartView = nil then
  begin
    FChartView := TChartGridDataView.Create(Self);
    FChartView.BorderStyle := bsNone;
    FChartView.IsEmbedded := True;
    FChartView.ToolBarGroup.Visible := False;

    with ViewGroup.CreateItemForControl(FChartView) do
    begin
      AlignHorz := ahClient;
      AlignVert := avClient;
    end;

    // 记录容器的序号
    FChartView.Tag := Integer(ViewGroup.Items[ViewGroup.Count - 1]);
  end;

  if (ViewData <> nil) and (FChartView.ViewData <> ViewData) then
  begin
    FChartView.ViewData := ViewData;
  end;

  ChartAction.Checked := not ChartAction.Checked;
  // 图表的显示与原视图显示相反
  TdxLayoutItem(FChartView.Tag).Visible := ChartAction.Checked;
  ClientGroup.Visible := not ChartAction.Checked;
end;

procedure TCustomDataView.OnChartExecute(Sender: TObject);
begin
  ShowChart;
end;

{ TCustomGridDataView }

procedure TCustomGridDataView.BuildFilterFields;
var
  I: Integer;
begin
  inherited;
  for I := 0 to FilterFields.Count - 1 do
  begin
    // 记录下过滤字段对应的Column，让过滤更快
    FilterFields.Objects[I] := TcxDBDataController(GridView.DataController)
      .GetItemByFieldName(FilterFields[I]);
    // TCustomGridDataView的子类的DataController都是TcxDBDataController
  end;
end;

procedure TCustomGridDataView.BuildViewAction;
begin
  inherited;
  FFormViewAction := BuildAction('表单视图', 'form', '', FEditAction.OnUpdate,
    DoActionShowFormView, 0, 0);
  FFormViewAction.Visible := False;
end;

procedure TCustomGridDataView.BuildViewComponent;
var
  ViewMenuItem: TMenuItem;
begin
  inherited;
  if FGrid = nil then
  begin
    FGrid := TcxGrid.Create(Self);
    FGrid.Levels.Add;

    FGridLayoutItem := ClientGroup.CreateItemForControl(FGrid);
    with FGridLayoutItem do
    begin
      AlignHorz := ahClient;
      AlignVert := avClient;
    end;

    FGridView := FGrid.CreateView(FViewClass);
    FGrid.Levels[0].GridView := FGridView;
    FGrid.Levels[0].Caption := '数据';
    FGridView.OnMouseUp := DoGridMouseUp;
    if GridView.InheritsFrom(TcxCustomGridTableView) then
      with TcxCustomGridTableView(GridView) do
      begin
        OnCellDblClick := DoTableCellDblClick;
        OnCellClick := DoTableCellClick;
        OnFocusedRecordChanged := DoFocusedRecordChanged;
      end;
    // 为了只在单元格弹出菜单，才编写此事件，否则可使用PopupMenu属性
    // FGrid.PopupMenu := ViewPopupMenu;

    FGridPopupMenu := TcxGridPopupMenu.Create(Self);
    FGridPopupMenu.Grid := FGrid;
    FGridViewPopupMenu := TPopupMenu.Create(Self);
    with TcxPopupMenuInfo(FGridPopupMenu.PopupMenus.Add) do
    begin
      HitTypes := [gvhtExpandButton, gvhtRecord]; // gvhtGroupByBox
      PopupMenu := FGridViewPopupMenu;
      GridView := FGridView;
    end;

    ViewMenuItem := TMenuItem.Create(Self);
    ViewMenuItem.Caption := '全部展开';
    ViewMenuItem.OnClick := DoMenuItemExpandAll;
    FGridViewPopupMenu.Items.Add(ViewMenuItem);

    ViewMenuItem := TMenuItem.Create(Self);
    ViewMenuItem.Caption := '全部折叠';
    ViewMenuItem.OnClick := DoMenuItemCollapseAll;
    FGridViewPopupMenu.Items.Add(ViewMenuItem);

    FFormViewClass := TFormDataView;
  end;
end;

function TCustomGridDataView.CanDelete: Boolean;
begin
  Result := inherited CanDelete and
    (GridView.DataController.FocusedRecordIndex > -1)
end;

function TCustomGridDataView.CanEdit: Boolean;
begin
  Result := inherited CanEdit and
    (GridView.DataController.FocusedRecordIndex > -1)
end;

function TCustomGridDataView.DataDelete(AAskConfirm: Boolean): Boolean;
begin
  // FView.DataController.DeleteSelection;
  // 调用数据中的方法，保持模型和视图分离
  Result := inherited DataDelete;

  with GridView do
  begin
    // DataController.UpdateItems(False);
    DataController.ClearSelection;
    DataController.SyncSelectionFocusedRecord;
  end;
end;

procedure TCustomGridDataView.DataEdit;
begin
  inherited;

  if UseFormForEditing then
  begin
    // FormViewAction.Execute;
    DoActionShowFormView(FormViewAction);
    DataCancel;
    DataController.SyncSelectionFocusedRecord;
  end
  else
    Grid.SetFocus;
  with GridView do
  begin
    Focused := True;
    DataController.ClearSelection;
    // DataController.Edit;
    DataController.SyncSelectionFocusedRecord;
    // 设置焦点
  end;
end;

procedure TCustomGridDataView.DataExport;
begin
  DevExpress.ExportGrid(FGrid);
end;

procedure TCustomGridDataView.DataInsert;
begin
  if UseFormForEditing then
  begin
    SyncFormData;
  end;

  if UseFormForEditing then
  begin
    inherited;
    // FormViewAction.Execute;
    DoActionShowFormView(FormViewAction);
    DataCancel;
    // DataController.ClearSelection;
    DataController.SyncSelectionFocusedRecord;
  end
  else
    with GridView do
    begin
      Grid.SetFocus;
      DataController.ClearSelection;
      // 调用数据中的方法，保持模型和视图分离
      inherited;
      // 设置焦点
      if GridView.InheritsFrom(TcxGridTableView) then
        TcxGridTableView(GridView).Controller.FocusedColumn.Editing := True
      else if GridView.InheritsFrom(TcxGridDBCardView) then
        TcxGridDBCardView(GridView).Controller.FocusedItem.Editing := True;
      FocusFirstVisibleColumn();
      DataController.SyncSelectionFocusedRecord;
    end;
end;

procedure TCustomGridDataView.DoFocusedRecordChanged
  (Sender: TcxCustomGridTableView; APrevFocusedRecord, AFocusedRecord
  : TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  if ViewData <> nil then
  begin
    ViewData.TriggerScroll;
  end;
  if Assigned(FOnRecordScroll) then
    FOnRecordScroll(GridView);
end;

procedure TCustomGridDataView.DoGridMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  P: TPoint;
begin
  if (Button = mbRight) and (ViewPopupMenu.ItemLinks.VisibleItemCount > 0) and
    (GridView.GetHitTest(X, Y).HitTestCode in [htNone, htCell]) then
  begin
    P.X := X;
    P.Y := Y;
    P := Grid.ClientToScreen(P);
    ViewPopupMenu.Popup(P.X, P.Y);
  end;
end;

procedure TCustomGridDataView.DoGridNavigate(Sender: TObject;
  NavigateAction: TNavigateAction);
begin
  case NavigateAction of
    naFirst:
      GoFirst;
    naLast:
      GoLast;
    naNext:
      GoNext;
    naPrior:
      GoPrior;
  end;
end;

procedure TCustomGridDataView.DoTableCellDblClick
  (Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  if Assigned(OnDoubleClickView) then
    OnDoubleClickView(GridView);
end;

procedure TCustomGridDataView.DoTableCellClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  // 自动编辑多选字段
  if (MultiSelectField <> '') and (AButton = mbLeft) then
  begin
    if ACellViewInfo.Item = DataController.GetItemByFieldName(MultiSelectField)
    then
    begin
      PostMessage(Handle, CM_TABLECELLCLICK, 0, 0);
    end;
  end;
end;

{ 提取名值对，用于获取LookupColumn列的显示内容 }

procedure TCustomGridDataView.ExtractNameAndKeyValue(const ANameFields,
  AKeyField: string; ADest: TStrings);
var
  NameColumnIndex, KeyColumnIndex, I, J: Integer;
  NameFieldList: TStrings;
  NameKeyValue: string;
begin
  ADest.Clear;
  NameFieldList := TStringList.Create;
  try
    NameFieldList.CommaText := ANameFields;

    with TcxGridDBDataController(GridView.DataController) do
    begin
      KeyColumnIndex := GetItemByFieldName(AKeyField).Index;
      for I := 0 to RecordCount - 1 do
      begin
        NameKeyValue := '';
        for J := 0 to NameFieldList.Count - 1 do
        begin
          NameColumnIndex := GetItemByFieldName(NameFieldList[J]).Index;
          NameKeyValue := NameKeyValue + DisplayTexts[I, NameColumnIndex] + ' ';
        end;
        ADest.Add(NameKeyValue + '=' + DisplayTexts[I, KeyColumnIndex]);
      end;
    end;
  finally
    NameFieldList.Free;
  end;
end;

procedure TCustomGridDataView.FocusFirstVisibleColumn;
var
  I: Integer;
begin
  if GridView.InheritsFrom(TcxGridTableView) then
    with TcxGridTableView(GridView) do
      for I := 0 to VisibleColumnCount - 1 do
        if VisibleColumns[I].Options.Focusing and VisibleColumns[I].Options.Editing
        then
        begin
          VisibleColumns[I].Focused := True;
          VisibleColumns[I].Editing := True;
          Break;
        end;
end;

function TCustomGridDataView.GetFormView: TFormDataView;
begin
  if FFormView = nil then
  begin
    FFormView := FFormViewClass.Create(Self);
    FFormView.Caption := Caption;
    FFormView.Position := poMainFormCenter;
    // 设置浏览同步
    FFormView.OnNavigateData := DoGridNavigate;
    FFormView.AutoEdit := AutoEdit;
    FFormView.SetDataEditing(True); // 注意: 数据可删除、插入???
    FFormView.BorderStyle := bsDialog;
  end;
  Result := FFormView;
end;

procedure TCustomGridDataView.GoFirst;
begin
  if not DoNavigateEvent(naFirst) then
  begin
    FGridView.DataController.GotoFirst;
    FGridView.DataController.SyncSelectionFocusedRecord;
  end;
end;

procedure TCustomGridDataView.GoLast;
begin
  if not DoNavigateEvent(naLast) then
  begin
    FGridView.DataController.GotoLast;
    FGridView.DataController.SyncSelectionFocusedRecord;
  end;
end;

procedure TCustomGridDataView.GoNext;
begin
  if not DoNavigateEvent(naNext) then
  begin
    FGridView.DataController.GotoNext;
    // 开启多选后需要同步
    FGridView.DataController.SyncSelectionFocusedRecord;
  end;
end;

procedure TCustomGridDataView.GoPrior;
begin
  if not DoNavigateEvent(naPrior) then
  begin
    FGridView.DataController.GotoPrev;
    FGridView.DataController.SyncSelectionFocusedRecord;
  end;
end;

function TCustomGridDataView.HaveDataAfterFilter: Boolean;
begin
  Result := inherited HaveDataAfterFilter() and
    (FGridView.DataController.FocusedRecordIndex > -1)
end;

procedure TCustomGridDataView.RestoreViewLayout(AIniFile: TIniFile);
begin

end;

procedure TCustomGridDataView.DoActionShowFormView(Sender: TObject);
begin
  SyncFormData;
  FormView.ShowModal;
end;

{ 保存表格布局 }

procedure TCustomGridDataView.SaveViewLayout(AIniFile: TIniFile);
begin

end;

procedure TCustomGridDataView.DoLocalFilter(const AValue: string);
begin
  if (ViewData = nil) then
    Exit;
  BuildFilter(GridView.DataController.Filter, FilterFields, AValue,
    FFixFilterField, FFixFilterText, FFixFilterOp);
  GridView.DataController.SyncSelected(True);
end;

procedure TCustomGridDataView.SyncFormData;
begin
  if FormView.ViewData <> ViewData then
  begin
    FormView.SetData(ViewData);
    FormView.Caption := Caption;
    FormView.Width := StrToIntDef(ViewData.Table.CustomAttributes.Values
      ['Form.Width'], 640);
    FormView.Height := StrToIntDef(ViewData.Table.CustomAttributes.Values
      ['Form.Height'], 480);
  end;
end;

{ 为ButtonEdit建立默认的事件，方便子类编写事件处理程序，只需覆盖DoEditButtonClick }

procedure TCustomGridDataView.BuildEditButtonEvent;
var
  I: Integer;
begin
  if GridView.InheritsFrom(TcxCustomGridTableView) then
    with TcxCustomGridTableView(GridView) do
      for I := 0 to ItemCount - 1 do
      begin
        if Items[I].Properties is TcxButtonEditProperties then
          with TcxButtonEditProperties(Items[I].Properties) do
          begin
            OnButtonClick := DoEditButtonClick;
          end;
      end
end;

procedure TCustomGridDataView.DoEditButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin

end;

{
  枚举选择记录

  DataSet记录指针与与记录号同步！！！
}

procedure TCustomGridDataView.ForEachSelected(AProc: TNotifyEvent);
var
  BK: TBookmark;
  I: Integer;
  LastRecordIndex: Integer;
  ARowIndex: Integer;
  ARowInfo: TcxRowInfo;
  RecordKeyValue: Variant;
  SelectedRecord: array of Variant;
begin
  ViewData.Table.DisableControls;
  // DataController.BeginUpdate;
  // BK := ViewData.GetBookmark;
  try

    // DataController.ForEachRow的限制：
    // Dataset记录指针与选择同步条件: DataController要在GridMode模式下
    // GridView.DataController.ForEachRow(True, AProc);

    SetLength(SelectedRecord, DataController.GetSelectedCount);
    LastRecordIndex := -1;
    // 先记录选择的键值，因为在枚举期间不能修改数据
    for I := 0 to DataController.GetSelectedCount - 1 do
    begin
      // TcxDBDataController(GridView.DataController).FocusSelectedRow(I);
      ARowIndex := DataController.GetSelectedRowIndex(I);
      ARowInfo := DataController.GetRowInfo(ARowIndex);
      // 忽略分组行
      if ARowInfo.RecordIndex <> LastRecordIndex then
      begin
        // 获取键值，记得在Schema中指定主键字段
        RecordKeyValue := DataController.GetRecordId(ARowInfo.RecordIndex);
        SelectedRecord[I] := RecordKeyValue;
        LastRecordIndex := ARowInfo.RecordIndex;
      end
      else
        SelectedRecord[I] := null;
    end;

    // 枚举记录，可修改数据
    for I := 0 to Length(SelectedRecord) - 1 do
    begin
      if ViewData.Table.Locate(ViewData.KeyFieldNames, SelectedRecord[I], [])
      then
        AProc(ViewData);
    end;

    // ViewData.GotoBookmark(BK);
  finally
    // ViewData.FreeBookmark(BK); // 注意释放
    // DataController.EndUpdate;
    ViewData.Table.EnableControls;
  end;
end;

procedure TCustomGridDataView.DoMenuItemExpandAll(Sender: TObject);
begin
  DataController.Groups.FullExpand;
end;

procedure TCustomGridDataView.DoMenuItemCollapseAll(Sender: TObject);
begin
  DataController.Groups.FullCollapse;
end;

function TCustomGridDataView.GetDataController: TcxGridDBDataController;
begin
  Result := nil;
end;

procedure TCustomGridDataView.DoTableCellClickMsg(var Msg: TMessage);
begin
  ViewData.DisableControls;
  try
    try
      ViewData.Edit; // DataEdit在不显示QueryAction时有问题
      ViewData.Table.FieldByName(MultiSelectField).AsBoolean :=
        not ViewData.Table.FieldByName(MultiSelectField).AsBoolean;
      ViewData.Save;
    except
      ViewData.Cancel;
      raise;
    end;
  finally
    ViewData.EnableControls;
  end;
end;

procedure TCustomGridDataView.SetFieldEditing(AFieldNames: array of string);
var
  I: Integer;
  Column: TcxCustomGridTableItem;
begin
  // 除指定的字段外，其余都不可编辑
  for I := 0 to ViewData.Table.FieldCount - 1 do
  begin
    Column := DataController.GetItemByFieldName(ViewData.Table.Fields[I].Name);
    if Column <> nil then
    begin
      Column.Options.Editing := False;
      // Column.Focusing := False;
    end;
  end;
  for I := 0 to Length(AFieldNames) - 1 do
  begin
    Column := DataController.GetItemByFieldName(AFieldNames[I]);
    if Column <> nil then
      Column.Options.Editing := True;
  end;
end;

procedure TCustomGridDataView.ConfigViewAfterData;
var
  Attr: string;
begin
  Attr := FCustomData.CustomAttributes.Values['ShowGridPopupMenu'];
  if StrToBoolDef(Attr, True) then
    GridPopupMenu.Grid := Grid
  else
    GridPopupMenu.Grid := nil;

  Attr := FCustomData.CustomAttributes.Values['OptionsData.Editing'];
  FOptionsDataEditing := StrToBoolDef(Attr, False);

  Attr := FCustomData.CustomAttributes.Values['UseFormForEditing'];
  if not FUseFormForEditing and (Attr <> '') then
    FUseFormForEditing := StrToBoolDef(Attr, False);
end;

procedure TCustomGridDataView.DataQuery;
begin
  inherited;
  DataController.SyncSelectionFocusedRecord;
end;

{ TTableGridDataView }

procedure TTableGridDataView.BuildViewComponent;
begin
  FViewClass := TcxGridDBTableView;
  inherited;
  // ShowFilterText := True;
  FView := TcxGridDBTableView(GridView);
end;

procedure TTableGridDataView.BuildViewPopupMenu;
begin
  inherited;
  // TableView.OnMouseDown := DoTableMouseDown;
  // TableView.PopupMenu := ViewPopupMenu;
  // TableViewPopupMenuWrapper.WrapTableView(TableView, ViewPopupMenu);
end;

function TTableGridDataView.CanQuery: Boolean;
begin
  Result := inherited CanQuery;
  // 在Action的刷新事件中解决编辑状态问题
  if Result and (FCustomData.Table.State in [dsBrowse]) and
    TableView.OptionsData.Editing and not AutoEdit and not OptionsDataEditing
  then
    TableView.OptionsData.Editing := False;
end;

procedure TTableGridDataView.SetData(Data: TCustomData);
begin
  TableView.DataController.DataSource := nil;
  TableView.ClearItems;
  inherited;

  if Data = nil then
    Exit;

  {
    1 数据发生变化时,如果SmartRefresh=False，Grid会重新遍历Table!!!

    2 所以SmartRefresh=False时，使用DataTable.Scroll事件时注意：在保存数据前
    屏蔽Scroll事件，保存后恢复Scroll事件。
    考虑用TableView.OnFocusedRecordChanged事件替代DataTable.Scroll事件

    3 使用SmartRefresh后，要使用DataController的数据操作方法才能同步View和DataSet。

    4 如果还是使用DataSet的数据操作方法，要手动调用DataController.UpdateItems,
    重新加载所有数据以及新数据。

    5 建议不使用SmartRefresh，问题太多。
  }

  { 重新建立视图 }
  DevExpress.BuildTableView(TableView, FCustomData.Source);
  BuildEditButtonEvent;
  BuildFilterFields;
  RestoreViewLayout(AppCore.UserIni);

  ConfigViewAfterData;
end;

procedure TTableGridDataView.SetAutoEdit(AValue: Boolean);
begin
  inherited;
  FView.OptionsData.Editing := AValue;
end;

procedure TTableGridDataView.DataEdit;
begin
  inherited;
  if not UseFormForEditing then
  begin
    TableView.OptionsData.Editing := True;
    TableView.Controller.FocusedColumn.Editing := True;
  end;
end;

procedure TTableGridDataView.DataInsert;
begin
  inherited;
  if not UseFormForEditing then
  begin
    TableView.OptionsData.Editing := True;
    FocusFirstVisibleColumn();
  end;
end;

procedure TTableGridDataView.SaveViewLayout(AIniFile: TIniFile);
var
  I: Integer;
begin
  if ViewData = nil then
    Exit;
  // AIniFile.EraseSection(ViewData.LogicalName);
  for I := 0 to TableView.ColumnCount - 1 do
  begin
    AIniFile.WriteInteger(ViewData.LogicalName,
      TableView.Columns[I].DataBinding.FieldName, TableView.Columns[I].Width);
  end;
end;

procedure TTableGridDataView.RestoreViewLayout(AIniFile: TIniFile);
var
  I, W: Integer;
  Cols: TStrings;
  Col: TcxGridDBColumn;
begin
  if ViewData = nil then
    Exit;

  Cols := TStringList.Create;
  TableView.BeginUpdate();
  try
    AIniFile.ReadSectionValues(ViewData.LogicalName, Cols);
    if Cols.Count = 0 then
      Exit;

    for I := 0 to Cols.Count - 1 do
    begin
      Col := TableView.GetColumnByFieldName(Cols.Names[I]);
      if (Col <> nil) then
        with Col do
        begin
          Width := StrToIntDef(Cols.ValueFromIndex[I], Width);
        end;
    end;
  finally
    TableView.EndUpdate;
    Cols.Free;
  end;
end;

function TTableGridDataView.GetVisibleFields: string;
var
  I: Integer;
begin
  Result := '';
  for I := 0 to TableView.ColumnCount - 1 do
  begin
    if TableView.Columns[I].Visible then
      if Result = '' then
        Result := TableView.Columns[I].DataBinding.FieldName
      else
        Result := Result + ',' + TableView.Columns[I].DataBinding.FieldName;
  end;
end;

procedure TTableGridDataView.DisableMultiSelect;
begin
  TableView.OptionsSelection.MultiSelect := False;
end;

procedure TTableGridDataView.EnableMultiSelect;
begin
  TableView.OptionsSelection.MultiSelect := True;
end;

function TTableGridDataView.GetDataController: TcxGridDBDataController;
begin
  Result := TableView.DataController;
end;

procedure TTableGridDataView.DataPrint;
begin
  FLastReporterGroupValue := '';
  FShowPrintDialog := True;
  // 没有选中数据，自动选择当前行
  if DataController.GetSelectedCount = 0 then
    DataController.SyncSelectionFocusedRecord;
  ForEachSelected(DoDataPrint);
end;

procedure TTableGridDataView.DoDataPrint(Sender: TObject);
begin
  // 过滤相同组的记录
  if (ViewData.ReporterGroupField = '') or
    (FLastReporterGroupValue <> ViewData.AsString[ViewData.ReporterGroupField])
  then
  begin
    inherited DataPrint();
    if ViewData.ReporterGroupField <> '' then
      FLastReporterGroupValue := ViewData.AsString[ViewData.ReporterGroupField];
    ShowPrintDialog := False; // 打印第一个记录后不在显示对话框
  end;
end;

procedure TTableGridDataView.SetVisibleFields(Fields: string);
var
  I: Integer;
begin
  Fields := Fields + ';';
  for I := 0 to TableView.ColumnCount - 1 do
  begin
    TableView.Columns[I].Visible :=
      Pos(TableView.Columns[I].DataBinding.FieldName + ';', Fields) > 0
  end;
end;

{ TTreeDataView }

procedure TTreeDataView.BuildFilterFields;
var
  I: Integer;
begin
  inherited;
  for I := 0 to FilterFields.Count - 1 do
  begin
    // TreeList无法做过滤????
    FilterFields.Objects[I] := TreeView.GetColumnByFieldName(FilterFields[I]);
  end;
end;

procedure TTreeDataView.BuildViewComponent;
begin
  inherited;
  if FTreeView = nil then
  begin
    FTreeView := TcxDBTreeList.Create(Self);
    FTreeView.Parent := Self;
    FTreeView.PopupMenu := ViewPopupMenu;
    FTreeView.OnFocusedNodeChanged := DoFocusedNodeChanged;
    FTreeView.OnDblClick := DoTreeDblClick;
    FTreeLayoutItem := ClientGroup.CreateItemForControl(FTreeView);
    with FTreeLayoutItem do
    begin
      AlignHorz := ahClient;
      AlignVert := avClient;
    end;
  end;
end;

function TTreeDataView.CanExport: Boolean;
begin
  Result := CanQuery and (ViewData.Table.RecordCount > 0)
end;

function TTreeDataView.CanQuery: Boolean;
begin
  Result := inherited CanQuery;
  // 在Action的刷新事件中解决编辑状态问题
  if Result and (FCustomData.Table.State in [dsBrowse]) and
    TreeView.OptionsData.Editing and not AutoEdit and not OptionsDataEditing
  then
    TreeView.OptionsData.Editing := False;
end;

function TTreeDataView.DataDelete(AAskConfirm: Boolean = True): Boolean;
begin
  Result := inherited DataDelete;
  if Result and (TreeView.FocusedNode <> nil) then
    TreeView.FocusedNode.Selected := True;
end;

procedure TTreeDataView.DataEdit();
begin
  TreeView.SetFocus;
  inherited;
  TreeView.OptionsData.Editing := True;
  TreeView.FocusedNode.Selected := True;
end;

procedure TTreeDataView.DataExport();
begin
  DevExpress.ExportTreeList(FTreeView);
end;

procedure TTreeDataView.DataInsert();
begin
  TreeView.SetFocus;
  inherited;
  TreeView.FocusedNode.Selected := True;
  TreeView.OptionsData.Editing := True;
end;

procedure TTreeDataView.DoFocusedNodeChanged(Sender: TcxCustomTreeList;
  APrevFocusedNode, AFocusedNode: TcxTreeListNode);
begin
  if ViewData <> nil then
    ViewData.TriggerScroll;
  if Assigned(FOnRecordScroll) then
    FOnRecordScroll(TreeView);
end;

procedure TTreeDataView.DoTreeDblClick(Sender: TObject);
begin
  if Assigned(OnDoubleClickView) then
    OnDoubleClickView(TreeView)
end;

procedure TTreeDataView.DoLocalFilter(const AValue: string);
begin
  {
    if (ViewData = nil) then Exit;
    // TreeView不支持过滤
    BuildFilter(TreeView.DataController.Filter, FilterFields, AValue,
    FFixFilterField, FFixFilterText, FFixFilterOp);
    TreeView.DataController.SyncSelected(True);
  }
  inherited;
end;

procedure TTreeDataView.SetAutoEdit(AValue: Boolean);
begin
  inherited;
  FTreeView.OptionsData.Editing := True;
end;

procedure TTreeDataView.SetData(Data: TCustomData);
begin
  TreeView.DataController.DataSource := nil;
  TreeView.DeleteAllColumns;
  inherited;
  if Data = nil then
    Exit;

  FOptionsDataEditing := StrToBoolDef(FCustomData.CustomAttributes.Values
    ['OptionsData.Editing'], False);

  { 重新建立树形图 }
  DevExpress.BuildTreeView(TreeView, FCustomData.Source);
  BuildFilterFields;
  // TreeView.Root.Expand(False);
  ExpandTreeView(TreeView.Root, 1);
end;

{ TDataOperation }

destructor TDataViewOperation.Destroy;
begin
  if FOwnsData then
    FreeAndNil(FCustomData);
  inherited;
end;

function TDataViewOperation.GetView: TBaseView;
begin
  Result := inherited GetView;
  if (TCustomDataView(Result).ViewData = nil) and (FCustomData <> nil) then
  begin
    TCustomDataView(Result).ViewData := FCustomData;
    TCustomDataView(Result).SetDataEditing(True);
  end;
end;

{ 如果没有指定ViewClass，根据schema的定义决定使用的视图 }

function TDataViewOperation.GetViewClass: TBaseViewClass;
begin
  Result := GetDataViewClass(FCustomData.DefaultViewType);
end;

procedure TTreeDataView.GoFirst;
begin
  if not DoNavigateEvent(naFirst) then
    TreeView.DataController.GotoFirst;
end;

procedure TTreeDataView.GoLast;
begin
  if not DoNavigateEvent(naLast) then
    TreeView.DataController.GotoLast;
end;

procedure TTreeDataView.GoNext;
begin
  if not DoNavigateEvent(naNext) then
    TreeView.DataController.GotoNext;
end;

procedure TTreeDataView.GoPrior;
begin
  if not DoNavigateEvent(naPrior) then
    TreeView.DataController.GotoPrev;
end;

{ TFormDataView }

procedure TFormDataView.BuildDataEditor;
begin
  { 根据Data创建表单 }
  ViewLayout.BeginUpdate;
  try
    FreeAndNil(FEditorContainer);
    if ViewData = nil then
      Exit;
    FEditorContainer := FEditorGroup.CreateGroup();
    FEditorContainer.ShowBorder := False;
    DevExpress.BuildFormView(FEditorContainer, ViewData);
  finally
    ViewLayout.EndUpdate;
  end;
end;

procedure TFormDataView.BuildViewAction;
begin
  inherited;
  FirstAction.Visible := True;
  PriorAction.Visible := True;
  NextAction.Visible := True;
  LastAction.Visible := True;
end;

procedure TFormDataView.BuildViewComponent;
begin
  inherited;
  KeyPreview := True;
  OnShow := DoFormShow;
  OnKeyDown := DoFormKeyDown;
  ViewLayout.LookAndFeel := DevExpress.dxLayoutDialog;
  ViewLayout.Align := alNone;
  ViewLayout.Items.AlignHorz := ahLeft;
  ViewLayout.Items.AlignVert := avTop;
  ViewLayout.AutoSize := True;
  // FEditorContainer默认包含在FEditorGroup中
  // ViewLayout.Items.AlignVert := avTop;
  // 如果是avClient，则不能自动计算表单的高度
  // FEditorGroup := ViewGroup.CreateGroup();
  FEditorGroup := ClientGroup.CreateGroup();
  FEditorGroup.ShowBorder := False;

  FImage := TImage.Create(Self);
  with FImage do
  begin
    AutoSize := True;
    Transparent := True;
  end;

  FOKButton := BuildDXButton(Self, '确定(&Q)', DoOKClick);
  FCancelButton := BuildDXButton(Self, '取消(&X)', DoCancelClick);
  FCancelButton.Cancel := True;

  with ViewGroup do
  begin
    FImageItem := CreateItemForControl(FImage);
    with FImageItem do
    begin
      Index := 0;
      Visible := False;
      AlignHorz := ahRight;
    end;
  end;

  FBottomGroup := ViewGroup.CreateGroup();
  with FBottomGroup do
  begin
    // AlignVert := avBottom;
    LayoutDirection := ldHorizontal;
    ShowBorder := False;
    with CreateGroup() do
    begin
      AlignHorz := ahRight;
      LayoutDirection := ldHorizontal;
      ShowBorder := False;
      FOKItem := CreateItemForControl(FOKButton);
      FCancelItem := CreateItemForControl(FCancelButton);
    end;
  end;
end;

procedure TFormDataView.BuildViewPopupMenu;
begin
  SaveAction.Execute;
  ModalResult := mrOk;
end;

procedure TFormDataView.DoCancelClick(Sender: TObject);
begin
  CancelAction.Execute;
  ModalResult := mrCancel;
end;

procedure TFormDataView.DoFormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  // 在表单控件之间按回车跳转，Memo控件中按住Ctrl换行
  if (Key = VK_RETURN) then
  begin
    PostMessage(Handle, WM_KEYDOWN, VK_TAB, 0);
  end;
end;

procedure TFormDataView.DoFormShow(Sender: TObject);
begin
  if ViewLayout.Align <> alClient then
  begin
    ClientHeight := ViewLayout.Height;
    ClientWidth := ViewLayout.Width;
    // ViewLayout.Align := alClient;
  end;
  FocusFirstControl;
end;

procedure TFormDataView.DoOKClick(Sender: TObject);
begin
  SaveAction.Execute;
  ModalResult := mrOk;
end;

procedure TFormDataView.SetData(ACustomData: TCustomData);
begin
  inherited;
  ToolBarGroup.Visible := StrToBoolDef(ACustomData.CustomAttributes.Values
    ['FormToolBar'], True);
  ImageName := ACustomData.CustomAttributes.Values['FormImageName'];
  BuildDataEditor;
end;

procedure TFormDataView.SetViewImage(const Value: string);
begin
  FImage.Picture := AppCore.ImageCenter.Get(Value);
  FImageItem.Visible := FImage.Picture.Graphic <> nil;
end;

{ TDictIMEDialog }

constructor TDictIMEDialog.Create(AOwner: TComponent);
begin
  FRegisteredDataView := TStringList.Create;

  RegisterDataView(sDataViewName_Table, TTableGridDataView);
  RegisterDataView(sDataViewName_Card, TCardGridDataView);
  RegisterDataView(sDataViewName_Tree, TTreeDataView);
  RegisterDataView(sDataViewName_Form, TFormDataView);

  inherited;
  Visible := False;
  LayoutAutoSize := False;

  FViewItem := DialogGroup.CreateItemForControl(nil);
  FViewItem.AlignHorz := ahClient;
  FViewItem.AlignVert := avClient;
end;

destructor TDictIMEDialog.Destroy;
begin
  FRegisteredDataView.Free;
  inherited;
end;

procedure TDictIMEDialog.DoDialogOK(Sender: TObject);
begin
  if (FCurView.HaveDataAfterFilter) then
  begin
    FOpened := False;
    FDictData := FCurView.ViewData;

    if Assigned(FNotifier) then
    begin
      FNotifier(Self);
    end
    else
    begin
      // 处理完消息，避免报错：cannnot focus invisible or disabled controls
      Application.ProcessMessages;
      ModalResult := mrOk;
    end;
  end;
end;

procedure TDictIMEDialog.DoFormResize(Sender: TObject);
begin
  FOldWidth := Width;
  FOldHeight := Height;
end;

function TDictIMEDialog.Start(ASender: TControl;
  ADataName, AViewName, AFilterText: string; ANotifier: TNotifyEvent): Boolean;
begin
  Result := StartIME(ASender, DataContainer.Items[ADataName], AViewName,
    AFilterText, ANotifier, False);
end;

{
  注意：如果输入中文法，可能会产生多次调用！！！
  此方法是模式窗体输入法
}

function TDictIMEDialog.StartIME(ASender: TControl; ACustomData: TCustomData;
  AViewName, AFilterText: string; ANotifier: TNotifyEvent;
  AShowOnly: Boolean): Boolean;
begin
  FViewItem.Control := nil;
  if FCurView <> nil then
    FCurView.Visible := False;

  // 不允许第二次打开
  if not FOpened then
  begin
    FDictName := ACustomData.LogicalName;
    RestoreDict();

    FOpened := True;
    Caption := ACustomData.Description;

    FNotifier := ANotifier;

    if AViewName = '' then
      AViewName := ACustomData.Table.CustomAttributes.Values['IME.ViewName'];

    if FRegisteredDataView.IndexOf(AViewName) < 0 then
      AViewName := sDataViewName_Table;

    FCurView := GetDataView(AViewName);

    with FCurView do
    begin
      Visible := True;
      // 根据Schema中Access配置操作
      SetDataEditing((ACustomData.Access <> '') and
        AppCore.User.HaveAccess(ACustomData.Access));
      SetData(ACustomData);
      FilterEdit.Text := Trim(AFilterText);
      Printing := False;

      // ToolBarGroup.Visible := not AShowOnly;
    end;
    FViewItem.Control := FCurView;
    OKItem.Visible := not AShowOnly;
    if AShowOnly then
      CancelButton.Caption := '关闭'
    else
      CancelButton.Caption := '取消';

    Result := False;

    if not Assigned(FNotifier) then
    begin
      PlaceFormBelowControl(Self, ASender);
      BorderStyle := bsSizeable;
      Result := Execute;
      SaveDict();
      FOpened := False;
    end;

    if not Assigned(ANotifier) and Result then
    begin
      // 以下自动跳到下一个输入框
      // 问题: (Cannot focus a disabled or invisible window)
      // PostMessage(Screen.ActiveControl.Handle, WM_KEYDOWN, VK_RETURN, 0);
    end;
  end;
end;

procedure TDictIMEDialog.FocusFilter;
begin
  with FCurView do
  begin
    FilterEdit.SetFocus;
    FilterEdit.SelLength := 0;
    FilterEdit.SelStart := Length(FilterEdit.Text);
  end;
end;

procedure TDictIMEDialog.RestoreDict;
begin
  // AppCore.Logger.Write('RestoreDict: ' + FDictName, mtInfo, 0);
  FOldWidth := AppCore.UserIni.ReadInteger(FDictName, 'PopupWidth_', 480);
  FOldHeight := AppCore.UserIni.ReadInteger(FDictName, 'PopupHeight_', 320);

  // 恢复弹出式窗体中的大小
  OnResize := nil;
  Width := FOldWidth;
  Height := FOldHeight;
  OnResize := DoFormResize;
end;

procedure TDictIMEDialog.SaveDict;
begin
  // AppCore.Logger.Write('SaveDict: ' + FDictName, mtInfo, 0);
  if FCurView <> nil then
  begin
    FCurView.SaveViewLayout(AppCore.UserIni);
    AppCore.UserIni.WriteInteger(FDictName, 'PopupWidth_', FOldWidth);
    AppCore.UserIni.WriteInteger(FDictName, 'PopupHeight_', FOldHeight);
  end;
  OnResize := nil;
end;

procedure TDictIMEDialog.DoPopupClose(Sender: TPopupEditorWrapInfo);
begin
  FOpened := False;
  SaveDict;
end;

procedure TDictIMEDialog.DoPopupInit(Sender: TPopupEditorWrapInfo);
begin
  FPopupWrapInfo := Sender;
  FOpened := False;
  Start(Screen.ActiveControl, Sender.DictName, '', '', DoPopupOK);
end;

procedure TDictIMEDialog.DoPopup(Sender: TPopupEditorWrapInfo);
begin
end;

function TDictIMEDialog.DoModalDialog(Sender: TPopupEditorWrapInfo;
  const AFilterText: string): Boolean;
begin
  FPopupWrapInfo := Sender;
  Result := Start(Screen.ActiveControl, Sender.DictName, '', AFilterText, nil);
  if Result then
  begin
    EditData;
  end;
end;

procedure TDictIMEDialog.EditData;
begin
  FPopupWrapInfo.EditData;
end;

procedure TDictIMEDialog.DoPopupOK(Sender: TObject);
begin
  EditData;
  FPopupWrapInfo.DoPopupOK(Sender);
end;

function TDictIMEDialog.GetDataView(AViewName: string): TCustomDataView;
begin
  Result := TCustomDataView(FindComponent('DataView_' + AViewName));
  if Result = nil then
  begin
    Result := TCustomDataViewClass(FRegisteredDataView.Objects
      [FRegisteredDataView.IndexOf(AViewName)]).Create(Self);
    with Result do
    begin
      Name := 'DataView_' + AViewName;
      BorderStyle := bsNone;
      FilterEditItem.Visible := True;
      FilterEditItem.Index := 0;
      OnFilterPressEnter := DoDialogOK;
      OnDoubleClickView := DoDialogOK;
    end;

    // 根据视图类型做适当调整
    if Result.ClassType = TTableGridDataView then
      with TTableGridDataView(Result) do
      begin
        TableView.FilterBox.Visible := fvNever;
      end;
  end;
end;

procedure TDictIMEDialog.RegisterDataView(AViewName: string;
  AViewClass: TCustomDataViewClass);
begin
  if FRegisteredDataView.IndexOf(AViewName) < 0 then
    FRegisteredDataView.AddObject(AViewName, TObject(AViewClass));
end;

procedure TDictIMEDialog.DoDialogCancel(Sender: TObject);
begin
  FOpened := False;
  FDictData := nil;
  if Assigned(FNotifier) then
  begin
    FPopupWrapInfo.ClosePopup;
  end
  else
    ModalResult := mrCancel;
end;

{ TDictManageView }

procedure TDictManageView.BuildTree;
var
  I: Integer;
  CustomData: TCustomData;
  ParentNode: TcxTreeListNode;

  function GetParentNode(ACustomData: TCustomData): TcxTreeListNode;
  var
    Category: string;
  begin
    Category := Trim(ACustomData.Category);
    if Category = '' then
      Category := '未分类';
    Result := FDictTree.FindNodeByText(Category, FDictTree.Columns[0], nil,
      False, True, False, tlfmExact);
    if (Result = nil) then
    begin
      Result := FDictTree.Root.AddChild;
      Result.Texts[0] := Category;
      Result.ImageIndex := AppCore.SmallImage.IndexOf(sFolderImageName);
    end;
  end;

begin
  for I := 0 to DataContainer.Count - 1 do
  begin
    // 可根据TDataDefinition.Flag建立TreeView的数据
    // 这里把DataContainer全部当做的字典表
    CustomData := DataContainer.ItemsByIndex[I].CustomData;
    ParentNode := GetParentNode(CustomData);
    with ParentNode.AddChild do
    begin
      Texts[0] := CustomData.Description;
      Texts[1] := CustomData.LogicalName;
      ImageIndex := AppCore.SmallImage.IndexOf(sDefaultImageName);
      Data := CustomData;
      // AppCore.Logger.Write(Texts[0] + ' ' + Texts[1]);
    end;
  end;
end;

procedure TDictManageView.BuildViewComponent;
begin
  FDictTree := TcxTreeList.Create(Self);
  with FDictTree do
  begin
    OptionsView.ColumnAutoWidth := True;
    OptionsData.Editing := False;
    OptionsData.Deleting := False;
    OptionsSelection.CellSelect := False;
    Images := AppCore.SmallImage.ImageList;
    with CreateColumn() do
    begin
      Caption.Text := '字典目录';
    end;
    with CreateColumn() do
    begin
      Caption.Text := '逻辑名称';
      Visible := False;
    end;
    with CreateColumn() do
    begin
      Caption.Text := '视图对象'; // 相应视图保存在此列中
      Visible := False;
    end;
  end;

  with ViewLayout.Items do
  begin
    LayoutDirection := ldHorizontal;

    with CreateItemForControl(FDictTree) do
    begin
      AlignHorz := ahLeft;
      AlignVert := avClient;
      Index := 0;
      Width := AppCore.IniFile.ReadInteger(Self.ClassName, 'LeftWidth', 200);
    end;

    CreateItem(TdxLayoutSplitterItem).Index := 1;
    FViewLayoutItem := TdxLayoutItem(CreateItem());
    with FViewLayoutItem do
    begin
      AlignHorz := ahClient;
      AlignVert := avClient;
    end;
  end;

  BuildTree;

  FDictTree.OnSelectionChanged := DoTreeChange;
end;

destructor TDictManageView.Destroy;
begin
  AppCore.IniFile.WriteInteger(ClassName, 'LeftWidth',
    ViewLayout.Items[0].Width);
  inherited;
end;

procedure TDictManageView.BuildViewLayout;
begin
  inherited;
  BuildViewComponent;
end;

{
  选择不同的字典时显示相应视图
  每个数据单独打开一个相应视图，并保留下来
}

procedure TDictManageView.DoTreeChange(Sender: TObject);
var
  DictView: TCustomDataView;
  DictData: TCustomData;
begin
  if FDictTree.FocusedNode = nil then
    Exit;

  with FDictTree.FocusedNode do
  begin
    if Data <> nil then
    begin
      // 隐藏当前字典视图
      if FViewLayoutItem.Control <> nil then
      begin
        FViewLayoutItem.Control.Visible := False;
        FViewLayoutItem.Control := nil;
      end;

      DictData := TCustomData(Data);

      if VarIsNull(Values[2]) then
      begin
        // 创建当前字典的视图
        DictView := GetDataViewClass(DictData.DefaultViewType).Create(Self);
        if DictView.InheritsFrom(TCustomGridDataView) then
          with TCustomGridDataView(DictView) do
            SetActionVisible(FormViewAction, True);
        DictView.SetDataEditing(True);
        DictView.Caption := DictData.Description;
        DictView.BorderStyle := bsNone;
        DictView.FilterEditItem.Visible := True;
        Values[2] := Integer(DictView);
        DictView.SetData(DictData);
      end
      else
        DictView := TCustomDataView(Integer(Values[2]));
      // 自动编辑数据，在SetData之后、之前调用稍稍有点区别(BuildView将
      // OptionsData.Editing设置为False)
      DictView.AutoEdit := True;

      // 显示视图
      FViewLayoutItem.Control := DictView;
    end;
  end;
end;

procedure TDictManageView.LocateDict(const ALogicalName: string);
var
  DictNode: TcxTreeListNode;
begin
  DictNode := FDictTree.FindNodeByText(ALogicalName, FDictTree.Columns[1]);
  if DictNode <> nil then
    DictNode.Focused := True;
end;

{ TBandGridDataView }

procedure TBandGridDataView.BuildViewComponent;
begin
  FViewClass := TcxGridDBBandedTableView;
  inherited;
  FView := TcxGridDBBandedTableView(GridView);
end;

procedure TBandGridDataView.BuildViewPopupMenu;
begin
  inherited;
  // BandView.PopupMenu := ViewPopupMenu;
  // TableViewPopupMenuWrapper.WrapTableView(BandView, ViewPopupMenu);
end;

function TBandGridDataView.CanQuery: Boolean;
begin
  Result := inherited CanQuery;
  // 在Action的刷新事件中解决编辑状态问题
  if Result and (FCustomData.Table.State in [dsBrowse]) and
    BandView.OptionsData.Editing and not AutoEdit and not OptionsDataEditing
  then
    BandView.OptionsData.Editing := False;
end;

procedure TBandGridDataView.DataEdit;
begin
  inherited;
  if not UseFormForEditing then
  begin
    BandView.OptionsData.Editing := True;
    BandView.Controller.FocusedColumn.Editing := True;
  end;
end;

procedure TBandGridDataView.DataInsert;
begin
  inherited;
  if not UseFormForEditing then
  begin
    BandView.OptionsData.Editing := True;
    FocusFirstVisibleColumn();
  end;
end;

procedure TBandGridDataView.DisableMultiSelect;
begin
  BandView.OptionsSelection.MultiSelect := False;
end;

procedure TBandGridDataView.EnableMultiSelect;
begin
  BandView.OptionsSelection.MultiSelect := True;
end;

function TBandGridDataView.GetDataController: TcxGridDBDataController;
begin
  Result := BandView.DataController;
end;

function TBandGridDataView.GetVisibleFields: string;
var
  I: Integer;
begin
  Result := '';
  for I := 0 to BandView.ColumnCount - 1 do
  begin
    if BandView.Columns[I].Visible then
      if Result = '' then
        Result := BandView.Columns[I].DataBinding.FieldName
      else
        Result := Result + ',' + BandView.Columns[I].DataBinding.FieldName;
  end;
end;

procedure TBandGridDataView.RestoreViewLayout(AIniFile: TIniFile);
var
  I, W: Integer;
  Cols: TStrings;
  Col: TcxGridDBBandedColumn;
begin
  Assert(ViewData <> nil);

  Cols := TStringList.Create;
  BandView.BeginUpdate();
  try
    AIniFile.ReadSectionValues(ViewData.LogicalName, Cols);
    if Cols.Count = 0 then
      Exit;

    for I := 0 to Cols.Count - 1 do
    begin
      Col := BandView.GetColumnByFieldName(Cols.Names[I]);
      if (Col <> nil) then
        with Col do
        begin
          Width := StrToIntDef(Cols.ValueFromIndex[I], Width);
          if Width > 1000 then
            Width := 100;
        end;
    end;
  finally
    BandView.EndUpdate;
    Cols.Free;
  end;
end;

procedure TBandGridDataView.SaveViewLayout(AIniFile: TIniFile);
var
  I, W: Integer;
begin
  if ViewData = nil then
    Exit;
  // AIniFile.EraseSection(ViewData.LogicalName);
  for I := 0 to BandView.ColumnCount - 1 do
  begin
    AIniFile.WriteInteger(ViewData.LogicalName,
      BandView.Columns[I].DataBinding.FieldName, BandView.Columns[I].Width);
  end;
end;

procedure TBandGridDataView.SetAutoEdit(AValue: Boolean);
begin
  inherited;
  FView.OptionsData.Editing := AValue;
end;

procedure TBandGridDataView.SetData(Data: TCustomData);
begin
  BandView.DataController.DataSource := nil;
  BandView.ClearItems;
  inherited;
  if Data = nil then
    Exit;

  DevExpress.BuildBandView(BandView, FCustomData.Source);
  BuildEditButtonEvent;
  BuildFilterFields;
  RestoreViewLayout(AppCore.UserIni);

  ConfigViewAfterData();
end;

{ TChartGridDataView }

procedure TChartGridDataView.BuildViewComponent;
begin
  FViewClass := TcxGridDBChartView;
  inherited;
  FView := TcxGridDBChartView(GridView);
  PeriodGroup.Visible := True;
end;

procedure TChartGridDataView.BuildViewPopupMenu;
begin
  inherited;
  // sChartView.PopupMenu := ViewPopupMenu;
end;

procedure TChartGridDataView.BuildViewToolBar;
begin
  BuildLayoutToolBar(ActionGroup, [FExportAction, FQueryAction]);
end;

function TChartGridDataView.CanDelete: Boolean;
begin
  Result := False;
end;

function TChartGridDataView.CanEdit: Boolean;
begin
  Result := False;
end;

function TChartGridDataView.CanInsert: Boolean;
begin
  Result := False;
end;

procedure TChartGridDataView.SetData(Data: TCustomData);
begin
  ChartView.ClearSeries;
  ChartView.ClearDataGroups;
  ChartView.DataController.DataSource := nil;
  inherited;
  if Data = nil then
    Exit;
  DevExpress.BuildChartView(ChartView, FCustomData.Source);
  BuildFilterFields;
end;

{ TPivotDataView }

procedure TPivotDataView.BuildViewComponent;
begin
  inherited;
  if FPivot = nil then
  begin
    FPivot := TcxDBPivotGrid.Create(Self);

    FPivotLayoutItem := ClientGroup.CreateItemForControl(FPivot);
    with FPivotLayoutItem do
    begin
      AlignHorz := ahClient;
      AlignVert := avClient;
    end;
  end;
  PeriodGroup.Visible := True;
end;

procedure TPivotDataView.BuildViewPopupMenu;
begin
  // 去除快捷菜单
end;

procedure TPivotDataView.BuildViewToolBar;
begin
  // BuildLayoutToolBar(ActionGroup, [FExportAction, FQueryAction]);
  inherited;
end;

function TPivotDataView.CanDelete: Boolean;
begin
  Result := False;
end;

function TPivotDataView.CanEdit: Boolean;
begin
  Result := False;
end;

function TPivotDataView.CanExport: Boolean;
begin
  Result := (ViewData <> nil) and ViewData.Table.Active;
end;

function TPivotDataView.CanInsert: Boolean;
begin
  Result := False;
end;

procedure TPivotDataView.DataExport;
begin
  DevExpress.ExportPivot(FPivot);
end;

procedure TPivotDataView.SetData(Data: TCustomData);
begin
  PivotGrid.DeleteAllFields;
  PivotGrid.DataController.DataSource := nil;
  inherited;
  DevExpress.BuildPivotGrid(FPivot, Data.Source);
end;

{ TCardGridDataView }

procedure TCardGridDataView.BuildViewComponent;
begin
  FViewClass := TcxGridDBCardView;
  inherited;
  FView := TcxGridDBCardView(GridView);
end;

procedure TCardGridDataView.BuildViewPopupMenu;
begin
  inherited;
  // CardView.PopupMenu := ViewPopupMenu;
  // TableViewPopupMenuWrapper.WrapTableView(CardView, ViewPopupMenu);
end;

function TCardGridDataView.CanQuery: Boolean;
begin
  Result := inherited CanQuery;
  // 在Action的刷新事件中解决编辑状态问题
  if Result and (FCustomData.Table.State in [dsBrowse]) and
    CardView.OptionsData.Editing and not AutoEdit and not OptionsDataEditing
  then
    CardView.OptionsData.Editing := False;
end;

procedure TCardGridDataView.DataEdit;
begin
  inherited;
  if not UseFormForEditing then
  begin
    CardView.OptionsData.Editing := True;
    CardView.Controller.FocusedRow.Editing := True;
  end;
end;

procedure TCardGridDataView.DataInsert;
begin
  inherited;
  if not UseFormForEditing then
  begin
    CardView.OptionsData.Editing := True;
  end;
end;

function TCardGridDataView.GetDataController: TcxGridDBDataController;
begin
  Result := CardView.DataController;
end;

procedure TCardGridDataView.RestoreViewLayout(AIniFile: TIniFile);
begin
  inherited;
  if ViewData = nil then
    Exit;
  CardView.OptionsView.CardWidth := AIniFile.ReadInteger(ViewData.LogicalName,
    'CardWidth_', CardView.OptionsView.CardWidth);
end;

procedure TCardGridDataView.SaveViewLayout(AIniFile: TIniFile);
begin
  inherited;
  if ViewData = nil then
    Exit;
  AIniFile.ReadInteger(ViewData.LogicalName, 'CardWidth_',
    CardView.OptionsView.CardWidth);
end;

procedure TCardGridDataView.SetAutoEdit(AValue: Boolean);
begin
  inherited;
  FView.OptionsData.Editing := AValue;
end;

procedure TCardGridDataView.SetData(Data: TCustomData);
begin
  CardView.ClearItems;
  CardView.DataController.DataSource := nil;
  inherited;
  if Data = nil then
    Exit;
  DevExpress.BuildCardView(CardView, FCustomData.Source);
  BuildEditButtonEvent;
  BuildFilterFields;
  RestoreViewLayout(AppCore.UserIni);
  ConfigViewAfterData();
end;

{ TPopupEditorWrapInfo }

constructor TPopupEditorWrapInfo.Create(ATarget: TComponent);
begin
  inherited;
  FGetValueFields := TStringList.Create;
  FGetValueFields.Delimiter := ';';
  FSetValueFields := TStringList.Create;
  FSetValueFields.Delimiter := ';';
  FMultiEditorAttributes := TStringList.Create;
  // AppCore.Logger.Write(ClassName + ' Created');
end;

destructor TPopupEditorWrapInfo.Destroy;
begin
  // AppCore.Logger.Write(ClassName + ' Destroyed');
  FreeAndNil(FButtonAction);
  FreeAndNil(FClearAction);
  FreeAndNil(FGetValueFields);
  FreeAndNil(FSetValueFields);
  FreeAndNil(FMultiEditorAttributes);
  inherited;
end;

procedure TPopupEditorWrapInfo.DoButtonAction(Sender: TObject);
begin
  ShowModalPopuForm('');
end;

procedure TPopupEditorWrapInfo.DoPopupOK(Sender: TObject);
begin
  TcxDBPopupEdit(FPopupControl).DroppedDown := False;
  if Screen.ActiveControl <> nil then
    PostMessage(Screen.ActiveControl.Handle, WM_KEYDOWN, VK_RETURN, 0);
end;

procedure TPopupEditorWrapInfo.DoGridEditKeyPress
  (Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
  AEdit: TcxCustomEdit; var Key: Char);
begin
  if (AItem = Target) then
    DoKeyPress(AEdit, Key)
  else if Assigned(FOldGridEditKeyEvent) then
    FOldGridEditKeyEvent(Sender, AItem, AEdit, Key);
end;

procedure TPopupEditorWrapInfo.DoKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key in ['a' .. 'z', 'A' .. 'Z', '0' .. '9', ' ']) then
  begin
    ShowModalPopuForm(Key);
    Key := #0;
  end;
end;

procedure TPopupEditorWrapInfo.DoPopupInit(Sender: TObject);
begin
  (FPopupEditorForm as IPopupEditorForm).DoPopupInit(Self);
end;

procedure TPopupEditorWrapInfo.DoPopup(Sender: TObject);
begin
  FPopupControl := Sender;
  (FPopupEditorForm as IPopupEditorForm).DoPopup(Self);
end;

procedure TPopupEditorWrapInfo.DoPopupClose(Sender: TcxControl;
  AReason: TcxEditCloseUpReason);
begin
  (FPopupEditorForm as IPopupEditorForm).DoPopupClose(Self);
  // 没有下面的语句，在Popup之后调用ShowModalPopuForm报can't modal a visible form.
  with FPopupEditorForm do
  begin
    Align := alNone;
    Visible := False;
    Parent := nil;
  end;
end;

procedure TPopupEditorWrapInfo.ShowModalPopuForm(const AFilterText: string);
begin
  (FPopupEditorForm as IPopupEditorForm).DoModalDialog(Self, AFilterText);
end;

procedure TPopupEditorWrapInfo.Wrap;
var
  TempAttributes: TStrings;

  procedure AddButton(Properties: TcxCustomEditProperties);
  begin
    with Properties.Buttons.Add do
    begin
      Default := True;
      Kind := bkGlyph;
      AppCore.SmallImage.ImageList.GetImage
        (AppCore.SmallImage.IndexOf('Dict'), Glyph);
      Action := ButtonAction;
    end;
  end;

begin
  FPopupEditorForm := TPopupEditorWrapper(Wrapper).GetPopupEditor(FEditorName);
  if FPopupEditorForm = nil then
    Exit;

  // 考虑Column.OnGetProperties
  TempAttributes := FMultiEditorAttributes;
  if TempAttributes.Count = 0 then
    TempAttributes := FField.CustomAttributes;

  FFreeEditing := StrToBoolDef(TempAttributes.Values['IME.FreeEditing'], False);
  FFreeAppending := StrToBoolDef(TempAttributes.Values
    ['IME.FreeAppending'], False);
  FFreeAppendChar := TempAttributes.Values['IME.FreeAppendChar'];

  SetValueField.DelimitedText := TempAttributes.Values['IME.SetValueField'];
  GetValueField.DelimitedText := TempAttributes.Values['IME.GetValueField'];
  DictName := TempAttributes.Values['IME.DictName'];

  if DictName <> '' then
  begin
    FDictTable := DataContainer.Items[DictName].Table;
    if (GetValueField.Text = '') then
      GetValueField.Text := DataContainer.Items[DictName].KeyFieldNames;
  end;

  if SetValueField.Text = '' then
    SetValueField.Text := FField.Name;

  if Target.InheritsFrom(TcxCustomPopupEdit) and
    StrToBoolDef(TempAttributes.Values['PopupEdit.AutoDropdown'], False) then
    with TcxCustomPopupEdit(Target) do
    begin
      OnEnter := DoPopupEnter;
    end;

  if FProperties.InheritsFrom(TcxPopupEditProperties) then
  begin
    with TcxPopupEditProperties(FProperties) do
    begin
      // PopupAutoSize := True;
      PopupControl := FPopupEditorForm;
      OnPopup := DoPopup;
      OnInitPopup := DoPopupInit;
      OnClosePopup := DoPopupClose;
      // PopupSysPanelStyle := True;
      ReadOnly := True; // 造成灰色背景???
    end;
  end
  else if Target.InheritsFrom(TcxCustomEdit) then
    with TcxCustomEdit(Target) do
    begin
      AddButton(ActiveProperties);
      if not FFreeEditing then
        OnKeyPress := DoKeyPress;
    end
  else if Target.InheritsFrom(TcxCustomGridTableItem) then
  begin
    with TcxCustomGridTableItem(Target) do
    begin
      AddButton(Properties);
    end;
    if not FFreeEditing then
    begin
      // 串联事件
      FOldGridEditKeyEvent := TcxCustomGridTableItem(Target)
        .GridView.OnEditKeyPress;
      TcxCustomGridTableItem(Target).GridView.OnEditKeyPress := nil;
      // 没有上面一句，下面一句不起作用?? 因为DX在判断事件处理方法是否相同时，加了"@"符号?
      // 以前没遇到这种情况，是因为没有串联事件
      TcxCustomGridTableItem(Target).GridView.OnEditKeyPress :=
        DoGridEditKeyPress;
    end;
  end
  else if Target.InheritsFrom(TcxTreeListColumn) then
  begin
    with TcxTreeListColumn(Target) do
    begin
      AddButton(Properties);
    end;
  end;

  // 添加清除按钮
  if StrToBoolDef(TempAttributes.Values['IME.ClearButton'], False) then
    with FProperties.Buttons.Add do
    begin
      Action := ClearAction;
      Kind := bkText;
      AppCore.SmallImage.ImageList.GetImage
        (AppCore.SmallImage.IndexOf('Clear'), Glyph);
    end;
end;

procedure TPopupEditorWrapInfo.EditData;
var
  I: Integer;
  S, SeparateChar: string;
  Done: Boolean;
begin
  if FDataSource.AutoEdit then
    DataTable_IntoEditState(FDataTable);

  if (FDataTable.Owner is TCustomData) and (FDictTable.Owner is TCustomData)
  then
  begin
    Done := False;
    TCustomData(FDataTable.Owner).AssignFieldValue(FField.Name,
      TCustomData(FDictTable.Owner), Done);
    if Done then
      Exit;
  end;

  // 在编辑状态才赋值数据
  if FDataTable.State in [dsEdit, dsInsert] then
    // 为各字段赋值
    for I := 0 to FSetValueFields.Count - 1 do
    begin
      if not(FDataTable.State <> dsEdit) then
        FDataTable.Edit; // 解决TreeView的问题

      if not FFreeEditing and not FFreeAppending then
        FDataTable.FieldByName(FSetValueFields[I]).AsString :=
          FDictTable.FieldByName(FGetValueFields[I]).AsString
      else
      begin
        S := FDataTable.FieldByName(FSetValueFields[I]).AsString;
        if (S = '') or (RightStr(S, 1) = FFreeAppendChar) then
          SeparateChar := ''
        else
          SeparateChar := FFreeAppendChar;
        // 在自由输入模式下应该不涉及多个字段
        FDataTable.FieldByName(FSetValueFields[I]).AsString := S + SeparateChar
          + FDictTable.FieldByName(FGetValueFields[I]).AsString
      end;
    end;
end;

procedure TPopupEditorWrapInfo.ClosePopup;
begin
  TcxDBPopupEdit(FPopupControl).DroppedDown := False;
end;

procedure TPopupEditorWrapInfo.ClearData;
var
  I: Integer;
begin
  if FDataSource.AutoEdit then
    DataTable_IntoEditState(FDataTable);

  // 编辑状态中才清除数据
  if (FDataTable.State in [dsEdit, dsInsert]) then
    // 为各字段赋值
    for I := 0 to FSetValueFields.Count - 1 do
    begin
      FDataTable.Edit; // 解决TreeView的问题
      if FDataTable.FieldByName(FSetValueFields[I]).DataType
        in [datString, datMemo, datWideString] then
        FDataTable.FieldByName(FSetValueFields[I]).Value := ''
      else
        FDataTable.FieldByName(FSetValueFields[I]).Value := 0;
    end;
end;

procedure TPopupEditorWrapInfo.DoActionClear(Sender: TObject);
begin
  ClearData;
end;

function TPopupEditorWrapInfo.GetButtonAction: TAction;
begin
  if FButtonAction = nil then
  begin
    FButtonAction := TAction.Create(nil);
    FButtonAction.OnExecute := DoButtonAction;
    FButtonAction.Caption := '...';
    FButtonAction.Hint := '查询输入';
    FButtonAction.ShortCut := ShortCut(Ord('D'), [ssCtrl]);
  end;
  Result := FButtonAction;
end;

function TPopupEditorWrapInfo.GetClearAction: TAction;
begin
  if FClearAction = nil then
  begin
    FClearAction := TAction.Create(nil);
    FClearAction.OnExecute := DoActionClear;
    FClearAction.Caption := 'C';
    FClearAction.Hint := '清空';
  end;
  Result := FClearAction;
end;

procedure TPopupEditorWrapInfo.DoPopupEnter(Sender: TObject);
begin
  TcxCustomPopupEdit(Sender).DroppedDown := True;
end;

{ TPopupEditorWrapper }

constructor TPopupEditorWrapper.Create(AOwner: TComponent);
begin
  inherited;
  // 其他Wrapper都要记下这个属性，以便传递事件
  FOldOnWrapProperties := DevExpress.OnWrapProperties;
  DevExpress.OnWrapProperties := WrapProperites;
  FRegisteredEditor := TStringList.Create;
  FCreatedEditor := TStringList.Create;
  RegisterPopupEditor(sPopupViewName_DictIME, TDictIMEDialog);
  RegisterPopupEditor(sPopupViewName_AgeIME, TAgeIMEDialog);
end;

destructor TPopupEditorWrapper.Destroy;
begin
  FRegisteredEditor.Free;
  FCreatedEditor.Free;
  inherited;
end;

function TPopupEditorWrapper.GetPopupEditor(const AEditorName: string): TForm;
var
  I: Integer;
begin
  I := FRegisteredEditor.IndexOf(AEditorName);
  if I > -1 then
  begin

    Result := TForm(FCreatedEditor.Objects[I]);
    if Result = nil then
    begin
      Result := TFormClass(FRegisteredEditor.Objects[I]).Create(Application);
      FCreatedEditor.Objects[I] := Result;
    end;
  end
  else
    Result := nil;
end;

function TPopupEditorWrapper.GetWrapInfoClass: TWrapInfoClass;
begin
  Result := TPopupEditorWrapInfo;
end;

procedure TPopupEditorWrapper.RegisterPopupEditor(const AEditorName: string;
  AEditor: TFormClass);
begin
  FRegisteredEditor.AddObject(AEditorName, TObject(AEditor));
  FCreatedEditor.AddObject(AEditorName, nil);
end;

procedure TPopupEditorWrapper.WrapDataControl(AControl: TComponent;
  AProperties: TcxCustomEditProperties; AField: TDAField;
  ASource: TDADataSource; AMultiEditorAttributes: TStrings);
var
  EditorName: string;
  PopupWrapInfo: TPopupEditorWrapInfo;
begin
  if AMultiEditorAttributes <> nil then
  begin
    EditorName := AMultiEditorAttributes.Values['PopupEditor'];
    if EditorName = '' then
    begin
      EditorName := AMultiEditorAttributes.Values['IME.DictName'];
      if EditorName <> '' then
        EditorName := sPopupViewName_DictIME;
    end;
  end
  else
  begin
    EditorName := AField.CustomAttributes.Values['PopupEditor'];
    if EditorName = '' then
    begin
      EditorName := AField.CustomAttributes.Values['IME.DictName'];
      if EditorName <> '' then
        EditorName := sPopupViewName_DictIME;
    end;
  end;

  if EditorName <> '' then
  begin
    PopupWrapInfo := TPopupEditorWrapInfo(Wrap(AControl));
    with PopupWrapInfo do
    begin
      FEditorName := EditorName;
      DataSource := ASource;
      DataTable := ASource.DataTable;
      Properties := AProperties;
      Field := AField;
      if AMultiEditorAttributes <> nil then
        FMultiEditorAttributes.Text := AMultiEditorAttributes.Text;
      Wrap();
    end;
  end;
end;

procedure TPopupEditorWrapper.WrapProperites(AColumn: TComponent;
  AProperties: TcxCustomEditProperties; AField: TDAField;
  ASource: TDADataSource; AMultiEditorAttributes: TStrings);
begin
  WrapDataControl(AColumn, AProperties, AField, ASource,
    AMultiEditorAttributes);

  if Assigned(FOldOnWrapProperties) then
    FOldOnWrapProperties(AColumn, AProperties, AField, ASource,
      AMultiEditorAttributes);
end;

{ TReportConfigView }

function TReportConfigView.BuildLocalParamData: TCustomData;
begin
  Result := TCustomData.Create(Self, nil, '', 'ReportParam');

  Result.CustomAttributes.Add('OptionsView.DataRowHeight=50');

  with Result.Table.Fields.Add('ReportName', datString, 200) do
  begin
    Visible := False;
    InPrimaryKey := True;
    DisplayLabel := '报表名';
  end;
  with Result.Table.Fields.Add('ParamName', datString, 50) do
  begin
    DisplayLabel := '参数名';
    InPrimaryKey := True;
  end;
  with Result.Table.Fields.Add('ParamValue', datString, 3000) do
  begin
    DisplayLabel := '参数值';
    CustomAttributes.Add('Properties=Memo')
  end;

  with Result.Table.Fields.Add('Memo', datString, 200) do
  begin
    DisplayLabel := '备注';
    CustomAttributes.Add('Properties=Memo')
  end;
end;

function TReportConfigView.BuildLocalReportData: TCustomData;
begin
  Result := TCustomData.Create(Self, nil, '', 'Report');

  with Result.Table.Fields.Add('ReportName', datString, 200) do
  begin
    InPrimaryKey := True;
    DisplayLabel := '报表名';
  end;
  with Result.Table.Fields.Add('Category', datString, 50) do
  begin
    Visible := False;
    CustomAttributes.Add('GroupIndex=0');
    DisplayLabel := '分类';
  end;
  with Result.Table.Fields.Add('Memo', datString, 200) do
  begin
    DisplayLabel := '备注';
    CustomAttributes.Add('Properties=Memo')
  end;
end;

procedure TReportConfigView.BuildViewLayout;
begin
  inherited;

  FReportData := DataContainer.Items[sDataNameMiscReport];
  if FReportData = nil then
    FReportData := BuildLocalReportData;

  FParamData := DataContainer.Items[sDataNameMiscReportParam];
  if FParamData = nil then
    FParamData := BuildLocalParamData;

  FParamData.BindMaster(FReportData, 'ReportName');

  FReportView := TTableGridDataView.Create(Self);
  with FReportView do
  begin
    BorderStyle := bsNone;
    Width := 350;
    SetDataEditing(True);
    SetActionsVisible([PrintAction]);
    PrintAction.OnExecute := DoPrintReport;
    InsertAction.ShortCut := 0;
    EditAction.ShortCut := 0;
    // Importing := True;
    IsEmbedded := True;
    ViewGroup.Caption := '打印列表';
    ViewGroup.ShowBorder := True;
    ViewData := FReportData;
    Printing := True;
  end;

  FParamView := TTableGridDataView.Create(Self);
  with FParamView do
  begin
    BorderStyle := bsNone;
    SetDataEditing(True);
    // Importing := True;
    IsEmbedded := True;
    ViewGroup.Caption := '打印参数';
    ViewGroup.ShowBorder := True;
    ViewData := FParamData;
  end;

  with ViewLayout.Items do
  begin
    LayoutDirection := ldHorizontal;
    AlignVert := avClient;
    AlignHorz := ahClient;

    with CreateItemForControl(FReportView) do
    begin
      AlignHorz := ahLeft;
      AlignVert := avClient;
    end;

    CreateItem(TdxLayoutSplitterItem);

    with CreateItemForControl(FParamView) do
    begin
      AlignHorz := ahClient;
      AlignVert := avClient;
    end;
  end;
end;

procedure TReportConfigView.DoPrintReport(Sender: TObject);
begin
  // 由子类实现打印
  if Assigned(OnPrint) then
    OnPrint(Sender);
end;

function TReportConfigView.GetParamNameArray: TVariantArray;
begin
  SetLength(Result, FParamData.RecordCount);
  FParamData.First;
  while not FParamData.EOF do
  begin
    Result[FParamData.RecID] := FParamData.AsString['ParamName'];
    FParamData.Next;
  end;
end;

function TReportConfigView.GetParamValueArray: TVariantArray;
begin
  SetLength(Result, FParamData.RecordCount);
  FParamData.First;
  while not FParamData.EOF do
  begin
    Result[FParamData.RecID] := FParamData.AsString['ParamValue'];
    FParamData.Next;
  end;
end;

function TReportConfigView.GetReportName: string;
begin
  Result := FReportData.AsString['ReportName'];
end;

{ TAgeIMEDialog }

procedure TAgeIMEDialog.BuildDialog;
begin
  inherited;
  BorderStyle := bsDialog;
  Caption := '输入年龄';
  FAgeEdit := TcxSpinEdit.Create(Self);
  FAgeEdit.Properties.MinValue := 0;
  FAgeEdit.Properties.MaxValue := 150;
  with DialogGroup.CreateItemForControl(FAgeEdit) do
  begin
    // Caption := '年龄';
  end;
end;

procedure TAgeIMEDialog.DoDialogCancel(Sender: TObject);
begin
  if Assigned(FNotifier) then
  begin
    FPopupWrapInfo.ClosePopup;
  end
  else
    ModalResult := mrCancel;
end;

procedure TAgeIMEDialog.DoDialogOK(Sender: TObject);
begin
  if Assigned(FNotifier) then
  begin
    FNotifier(Self);
  end
  else
  begin
    ModalResult := mrOk;
  end;
end;

function TAgeIMEDialog.DoModalDialog(Sender: TPopupEditorWrapInfo;
  const AFilterText: string): Boolean;
begin
  FPopupWrapInfo := Sender;
  FAgeEdit.Value := 0;
  Result := Start(Screen.ActiveControl, nil);
  if Result then
  begin
    EditData;
  end;
end;

procedure TAgeIMEDialog.DoPopup(Sender: TPopupEditorWrapInfo);
begin
  FAgeEdit.Value := 0;
end;

procedure TAgeIMEDialog.DoPopupClose(Sender: TPopupEditorWrapInfo);
begin
end;

procedure TAgeIMEDialog.DoPopupInit(Sender: TPopupEditorWrapInfo);
begin
  FPopupWrapInfo := Sender;
  Start(Screen.ActiveControl, DoPopupOK);
end;

procedure TAgeIMEDialog.DoPopupOK(Sender: TObject);
begin
  EditData;
  FPopupWrapInfo.DoPopupOK(Sender);
end;

procedure TAgeIMEDialog.EditData;
begin
  DataTable_IntoEditState(FPopupWrapInfo.FDataTable);
  FPopupWrapInfo.FDataTable.FieldByName(FPopupWrapInfo.FSetValueFields[0])
    .AsDateTime := Round(Date() - FAgeEdit.Value * 365.25);
end;

function TAgeIMEDialog.Start(ASender: TControl;
  ANotifier: TNotifyEvent): Boolean;
begin
  Result := False;
  FNotifier := ANotifier;
  if not Assigned(FNotifier) then
  begin
    PlaceFormBelowControl(Self, ASender);
    Result := Execute;
  end;
end;

initialization

PopupEditorWrapper := TPopupEditorWrapper.Create(nil);

finalization

FreeAndNil(PopupEditorWrapper);

end.
