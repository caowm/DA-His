
unit cxGridCustomTableView;

interface

uses
  Variants, Windows, Messages, Classes, Graphics, Controls, Forms, StdCtrls, Dialogs,
  cxClasses, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxStorage, cxPC, cxFilterControl, cxNavigator, cxListBox, cxEdit, cxButtons,
  cxDataStorage, cxCustomData, cxData, cxFilter, cxDataUtils, cxContainer,
  cxCheckBox, cxCheckListBox, cxStyles, cxGridCommon, cxGridCustomView, cxMemo,
  dxCoreClasses;

type



  TcxCustomGridRecordClass = class of TcxCustomGridRecord;

  TcxCustomGridRecord = class
  public
    constructor Create(AViewData: TcxCustomGridTableViewData; AIndex: Integer;
      const ARecordInfo: TcxRowInfo); virtual;
    destructor Destroy; override;
    function CanFocus: Boolean; virtual;
    function CanFocusCells: Boolean; virtual;
    procedure Collapse(ARecurse: Boolean);
    procedure Expand(ARecurse: Boolean);
    function GetFirstFocusableChild: TcxCustomGridRecord; virtual;
    function GetLastFocusableChild(ARecursive: Boolean): TcxCustomGridRecord; virtual;
    procedure Invalidate(AItem: TcxCustomGridTableItem = nil); virtual;
    procedure MakeVisible;

    //property Data: Pointer read FData write FData;
    property DragHighlighted: Boolean read GetDragHighlighted;
    property DisplayTexts[Index: Integer]: string read GetDisplayText write SetDisplayText;
    property Expandable: Boolean read GetExpandable;
    property Expanded: Boolean read GetExpanded write SetExpanded;
    property Focused: Boolean read GetFocused write SetFocused;
    property GridView: TcxCustomGridTableView read GetGridView;
    property HasCells: Boolean read GetHasCells;
    property Index: Integer read FIndex;
    property IsData: Boolean read GetIsData;
    property IsEditing: Boolean read GetIsEditing;
    property IsFirst: Boolean read GetIsFirst;
    property IsLast: Boolean read GetIsLast;
    property IsNewItemRecord: Boolean read GetIsNewItemRecord;
    property Level: Integer read GetLevel;
    property ParentRecord: TcxCustomGridRecord read GetParentRecord;
    property PartVisible: Boolean read GetPartVisible;
    property RecordIndex: Integer read GetRecordIndex;
    property Selected: Boolean read GetSelected write SetSelected;
    property ValueCount: Integer read GetValueCount;
    property Values[Index: Integer]: Variant read GetValue write SetValue;
    property ViewData: TcxCustomGridTableViewData read FViewData;
    property ViewInfo: TcxCustomGridRecordViewInfo read FViewInfo;
    property Visible: Boolean read GetVisible;
  end;

  // view data

  TcxGridDataOperation = (doSorting, doGrouping, doFiltering);

  TcxCustomGridTableViewData = class(TcxCustomGridViewData)
   public
    constructor Create(AGridView: TcxCustomGridView); override;
    destructor Destroy; override;

    procedure Collapse(ARecurse: Boolean); virtual;
    procedure DestroyRecords;
    procedure Expand(ARecurse: Boolean); virtual;
    function GetRecordByIndex(AIndex: Integer): TcxCustomGridRecord;
    function GetRecordByRecordIndex(ARecordIndex: Integer): TcxCustomGridRecord;
    function GetRecordIndexByRecord(ARecord: TcxCustomGridRecord): Integer;
    function IsRecordIndexValid(AIndex: Integer): Boolean;
    procedure Refresh(ARecordCount: Integer); virtual;
    procedure RefreshRecords;

    procedure CheckNewItemRecord;
    function HasNewItemRecord: Boolean; virtual;

    function AddItemToFilter(AParent: TcxFilterCriteriaItemList; AItem: TcxCustomGridTableItem;
      AOperatorKind: TcxFilterOperatorKind; const AValue: Variant; ADisplayText: string = '';
      AReplaceExistent: Boolean = True): TcxFilterCriteriaItem;
    function CreateFilterValueList: TcxGridFilterValueList;
    function GetDisplayText(ARecordIndex, AItemIndex: Integer; out AText: string;
      AUseCustomValue: Boolean = False; ACustomValueOperation: TcxGridDataOperation = doGrouping): Boolean; virtual;

    // custom data handling
    function CustomCompareDataValues(AField: TcxCustomDataField; const AValue1, AValue2: Variant;
      AMode: TcxDataControllerComparisonMode): Integer; virtual;
    function GetCustomDataDisplayText(ARecordIndex, AItemIndex: Integer;
      AOperation: TcxGridDataOperation): string; overload; virtual;
    function GetCustomDataDisplayText(AItemIndex: Integer; const AValue: Variant): string; overload; virtual;
    function GetCustomDataValue(AField: TcxCustomDataField; const AValue: Variant;
      AOperation: TcxGridDataOperation): Variant; overload;
    function GetCustomDataValue(AItem: TcxCustomGridTableItem; const AValue: Variant;
      AOperation: TcxGridDataOperation): Variant; overload; virtual;
    function HasCustomDataHandling(AField: TcxCustomDataField; AOperation: TcxGridDataOperation): Boolean; overload;
    function HasCustomDataHandling(AItem: TcxCustomGridTableItem; AOperation: TcxGridDataOperation): Boolean; overload; virtual;
    function NeedsCustomDataComparison(AField: TcxCustomDataField; AMode: TcxDataControllerComparisonMode): Boolean; virtual;

    property EditingRecord: TcxCustomGridRecord read FEditingRecord;
    property GridView: TcxCustomGridTableView read GetGridView;
    property NewItemRecord: TcxCustomGridRecord read FNewItemRecord;
    property RecordCount: Integer read GetRecordCount;
    property Records[Index: Integer]: TcxCustomGridRecord read GetRecord;
  end;


  // cells

  TcxGridTableCellViewInfo = class(TcxCustomGridViewCellViewInfo)
    public
    constructor Create(ARecordViewInfo: TcxCustomGridRecordViewInfo); reintroduce; virtual;
    procedure Calculate(ALeftBound, ATopBound: Integer; AWidth: Integer = -1;
      AHeight: Integer = -1); override;
    function CanDrawSelected: Boolean; virtual;
    function MouseDown(AHitTest: TcxCustomGridHitTest; AButton: TMouseButton;
      AShift: TShiftState): Boolean; override;
    property GridRecord: TcxCustomGridRecord read GetGridRecord;
    property GridView: TcxCustomGridTableView read GetGridView;
    property GridViewInfo: TcxCustomGridTableViewInfo read GetGridViewInfo;
    property RecordViewInfo: TcxCustomGridRecordViewInfo read FRecordViewInfo;
    property Selected: Boolean read GetSelected;
  end;

  TcxGridTableDataCellViewInfo = class(TcxGridTableCellViewInfo)
    public
    constructor Create(ARecordViewInfo: TcxCustomGridRecordViewInfo;
      AItem: TcxCustomGridTableItem); reintroduce; virtual;
    destructor Destroy; override;
    procedure BeforeRecalculation; override;
    procedure Calculate(ALeftBound, ATopBound: Integer; AWidth: Integer = -1;
      AHeight: Integer = -1); override;
    function CanDrawSelected: Boolean; override;
    function GetInplaceEditPosition: TcxInplaceEditPosition;
    procedure Invalidate(ARecalculate: Boolean); reintroduce; virtual;
    function MouseDown(AHitTest: TcxCustomGridHitTest; AButton: TMouseButton;
      AShift: TShiftState): Boolean; override;
    function MouseMove(AHitTest: TcxCustomGridHitTest; AShift: TShiftState): Boolean; override;
    function MouseUp(AHitTest: TcxCustomGridHitTest; AButton: TMouseButton;
      AShift: TShiftState): Boolean; override;

    property DisplayValue: TcxEditValue read GetDisplayValue;
    property EditBounds: TRect read GetEditBounds;
    property Editing: Boolean read GetEditing;
    property EditViewInfo: TcxCustomEditViewInfo read FEditViewInfo;
    property Focused: Boolean read GetFocused;
    property Item: TcxCustomGridTableItem read FItem;
    property Properties: TcxCustomEditProperties read GetProperties;
    property Style: TcxEditStyle read FStyle;
    property Value: Variant read GetValue;
  end;

  // records

  TcxCustomGridRecordViewInfo = class(TcxCustomGridViewCellViewInfo)
    public
    constructor Create(ARecordsViewInfo: TcxCustomGridRecordsViewInfo;
      ARecord: TcxCustomGridRecord); reintroduce; virtual;
    destructor Destroy; override;
    procedure BeforeRecalculation; override;
    function Click(AHitTest: TcxCustomGridHitTest; AButton: TMouseButton;
      AShift: TShiftState): Boolean; reintroduce; virtual;
    function GetBoundsForInvalidate(AItem: TcxCustomGridTableItem): TRect; virtual;
    function GetBoundsForItem(AItem: TcxCustomGridTableItem): TRect; virtual;
    function GetCellViewInfoByItem(AItem: TcxCustomGridTableItem): TcxGridTableDataCellViewInfo; virtual;
    {procedure GetDataCellViewParams(AItem: TcxCustomGridTableItem;
      ACellViewInfo: TcxGridTableCellViewInfo; var AParams: TcxViewParams); virtual;}
    function GetHitTest(const P: TPoint): TcxCustomGridHitTest; override;
    procedure MainCalculate(ALeftBound, ATopBound: Integer); virtual;
    function MouseDown(AHitTest: TcxCustomGridHitTest; AButton: TMouseButton;
      AShift: TShiftState): Boolean; override;
    function ProcessDialogChar(ACharCode: Word): Boolean; virtual;
    procedure Recalculate;

    property ContentBounds: TRect read GetContentBounds;
    property ExpandButtonBounds: TRect read FExpandButtonBounds;
    property Focused: Boolean read GetFocused;
    property FocusRectBounds: TRect read GetFocusRectBounds;
    property FullyVisible: Boolean read GetFullyVisible;
    property GridView: TcxCustomGridTableView read GetGridView;
    property GridRecord: TcxCustomGridRecord read FRecord;
    property GridViewInfo: TcxCustomGridTableViewInfo read GetGridViewInfo;
    property Index: Integer read GetIndex;
    property HideFocusRectOnExit: Boolean read GetHideFocusRectOnExit;
    property RecordsViewInfo: TcxCustomGridRecordsViewInfo read FRecordsViewInfo;
    property Selected: Boolean read GetSelected;
  end;

  TcxCustomGridRecordsViewInfoClass = class of TcxCustomGridRecordsViewInfo;

  TcxCustomGridRecordsViewInfo = class 
  public
    constructor Create(AGridViewInfo: TcxCustomGridTableViewInfo); virtual;
    destructor Destroy; override;
    function CanOffset(AItemCountDelta: Integer): Boolean; virtual;
    function GetCellHeight(ACellContentHeight: Integer): Integer; virtual;
    function GetHitTest(const P: TPoint): TcxCustomGridHitTest; virtual;
    function GetRealItem(ARecord: TcxCustomGridRecord): TcxCustomGridRecordViewInfo; virtual;
    function IsCellMultiLine(AItem: TcxCustomGridTableItem): Boolean; virtual;
    procedure MainCalculate; virtual;
    procedure Offset(DX, DY: Integer); virtual;
    procedure OffsetRecords(AItemCountDelta, APixelScrollRecordOffsetDelta: Integer); virtual;
    procedure Paint;

    property AutoDataCellHeight: Boolean read GetAutoDataCellHeight;
    property AutoDataRecordHeight: Boolean read GetAutoDataRecordHeight;
    property AutoRecordHeight: Boolean read GetAutoRecordHeight;
    property BackgroundBitmap: TBitmap read FBackgroundBitmap write FBackgroundBitmap;
    property Bounds: TRect read FBounds;
    property ContentBounds: TRect read FContentBounds;
    property Count: Integer read GetCount;
    property GridView: TcxCustomGridTableView read GetGridView;
    property Items[Index: Integer]: TcxCustomGridRecordViewInfo read GetItem; default;
    property ItemsOffset: Integer read FItemsOffset;
    property VisibleCount: Integer read FVisibleCount;
  end;


  TcxCustomGridTableViewInfo = class(TcxCustomGridViewInfo)
  public
    constructor Create(AGridView: TcxCustomGridView); override;
    destructor Destroy; override;
    function CanOffset(ARecordCountDelta, DX, DY: Integer): Boolean; virtual;
    function CanOffsetView(ARecordCountDelta: Integer): Boolean; virtual;
    procedure DoOffset(ARecordCountDelta, DX, DY: Integer); virtual;

    // for extended lookup edit
    function GetNearestPopupHeight(AHeight: Integer; AAdditionalRecord: Boolean = False): Integer; virtual;
    function GetPopupHeight(ADropDownRecordCount: Integer): Integer; virtual;

    property CalculateDown: Boolean read FCalculateDown write FCalculateDown;
    property ExpandButtonSize: Integer read GetExpandButtonSize;
    property FilterViewInfo: TcxGridFilterViewInfo read FFilterViewInfo;
    property FirstRecordIndex: Integer read GetFirstRecordIndex write FFirstRecordIndex;
    property GridView: TcxCustomGridTableView read GetGridView;
    property NavigatorBounds: TRect read GetNavigatorBounds;
    property NavigatorOffset: Integer read GetNavigatorOffset;
    property NavigatorSiteViewInfo: TcxNavigatorSiteViewInfo read FNavigatorSiteViewInfo;
    property NavigatorViewInfo: TcxNavigatorViewInfo read GetNavigatorViewInfo;
    property NoDataInfoText: string read GetNoDataInfoText;
    property NoDataInfoTextAreaBounds: TRect read GetNoDataInfoTextAreaBounds;
    property NoDataInfoTextAreaVisible: Boolean read GetNoDataInfoTextAreaVisible;
    property PartsBottomHeight: Integer read GetPartsBottomHeight;
    property PartsTopHeight: Integer read GetPartsTopHeight;
    property RecordsViewInfo: TcxCustomGridRecordsViewInfo read FRecordsViewInfo;
    property ScrollableAreaBounds: TRect read GetScrollableAreaBounds;
    property ScrollableAreaBoundsForEdit: TRect read GetScrollableAreaBoundsForEdit;
    property ScrollableAreaBoundsHorz: TRect read GetScrollableAreaBoundsHorz;
    property ScrollableAreaBoundsVert: TRect read GetScrollableAreaBoundsVert;
    property ScrollableAreaWidth: Integer read GetScrollableAreaWidth;
    property VisibleRecordCount: Integer read GetVisibleRecordCount;
  end;


  TcxGridSortOrder = TcxDataSortOrder;

  TcxGridTableDataCellCustomDrawEvent = procedure(Sender: TcxCustomGridTableView;
    ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean) of object;

  TcxGridGetCellHintEvent = procedure(Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
    ACellViewInfo: TcxGridTableDataCellViewInfo; const AMousePos: TPoint;
    var AHintText: TCaption; var AIsHintMultiLine: Boolean; var AHintTextRect: TRect) of object;
  TcxGridGetDataTextEvent = procedure(Sender: TcxCustomGridTableItem;
    ARecordIndex: Integer; var AText: string) of object;
  TcxGridGetDisplayTextEvent = procedure(Sender: TcxCustomGridTableItem;
    ARecord: TcxCustomGridRecord; var AText: string) of object;
  TcxGridGetFilterDisplayTextEvent = procedure(Sender: TcxCustomGridTableItem;
    const AValue: Variant; var ADisplayText: string) of object;
  TcxGridGetFilterValuesEvent = procedure(Sender: TcxCustomGridTableItem;
    AValueList: TcxDataFilterValueList) of object;
  TcxGridGetPropertiesEvent = procedure(Sender: TcxCustomGridTableItem;
    ARecord: TcxCustomGridRecord; var AProperties: TcxCustomEditProperties) of object;
  TcxGridInitDateRangesEvent = procedure(Sender: TcxCustomGridTableItem; ADateRanges: TcxGridDateRanges) of object;
  TcxGridTableItemGetStoredPropertiesEvent = procedure(Sender: TcxCustomGridTableItem;
    AProperties: TStrings) of object;
  TcxGridTableItemGetStoredPropertyValueEvent = procedure(Sender: TcxCustomGridTableItem;
    const AName: string; var AValue: Variant) of object;
  TcxGridTableItemSetStoredPropertyValueEvent = procedure(Sender: TcxCustomGridTableItem;
    const AName: string; const AValue: Variant) of object;
  TcxGridUserFilteringEvent = procedure(Sender: TcxCustomGridTableItem;
    const AValue: Variant; const ADisplayText: string) of object;
  TcxGridUserFilteringExEvent = procedure(Sender: TcxCustomGridTableItem;
    AFilterList: TcxFilterCriteriaItemList; const AValue: Variant; const ADisplayText: string) of object;

  TcxCustomGridTableItemClass = class of TcxCustomGridTableItem;

  TcxCustomGridTableItem = class(TcxComponent, IcxEditRepositoryItemListener, IcxStoredObject)
  private    
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
    function GetParentComponent: TComponent; override;
    function HasParent: Boolean; override;

    procedure ApplyBestFit(ACheckSizingAbility: Boolean = False; AFireEvents: Boolean = False); virtual;
    function CalculateDefaultCellHeight(ACanvas: TcxCanvas; AFont: TFont): Integer; virtual;
    function CreateEditStyle: TcxEditStyle; virtual;
    procedure FocusWithSelection; virtual;
    function GetAlternateCaption: string;
    function GetDefaultValuesProvider(AProperties: TcxCustomEditProperties = nil): IcxEditDefaultValuesProvider;
    function GetProperties: TcxCustomEditProperties; overload;
    function GetProperties(ARecord: TcxCustomGridRecord): TcxCustomEditProperties; overload;
    function GetProperties(ARecordIndex: Integer): TcxCustomEditProperties; overload;
    function GetRepositoryItem: TcxEditRepositoryItem;
    procedure MakeVisible;
    procedure RestoreDefaults; virtual;

    property ActuallyVisible: Boolean read GetActuallyVisible;
    property BestFitMaxWidth: Integer read FBestFitMaxWidth write SetBestFitMaxWidth default 0;
    property Editable: Boolean read GetEditable;
    property Editing: Boolean read GetEditing write SetEditing;
    property EditValue: Variant read GetEditValue write SetEditValue;
    property Filtered: Boolean read GetFiltered write SetFiltered;
    property FilteringDateRanges: TcxGridFilteringDateRanges read FFilteringDateRanges;
    property Focused: Boolean read GetFocused write SetFocused;
    property FocusedCellViewInfo: TcxGridTableDataCellViewInfo read GetFocusedCellViewInfo;
    property GridView: TcxCustomGridTableView read FGridView;
    property Hideable: Boolean read CanHide;
    property ID: Integer read FID;
    property IncSearching: Boolean read GetIncSearching;
    property Index: Integer read FIndex write SetIndex;
    property IsFirst: Boolean read GetIsFirst;
    property IsLast: Boolean read GetIsLast;
    property Options: TcxCustomGridTableItemOptions read FOptions write SetOptions;
    property PropertiesClass: TcxCustomEditPropertiesClass read FPropertiesClass write SetPropertiesClass;
    property SortIndex: Integer read GetSortIndex write SetSortIndex default -1;
    property SortOrder: TcxGridSortOrder read GetSortOrder write SetSortOrder stored IsSortOrderStored;
    property Styles: TcxCustomGridTableItemStyles read FStyles write SetStyles;
    property VisibleCaption: string read GetVisibleCaption;
    property VisibleIndex: Integer read FVisibleIndex;
  published
    property AlternateCaption: string read FAlternateCaption write SetAlternateCaption;
    property Caption: string read GetCaption write SetCaption stored IsCaptionStored;
    property DataBinding: TcxGridItemDataBinding read FDataBinding write SetDataBinding;
    property PropertiesClassName: string read GetPropertiesClassName write SetPropertiesClassName;
    property Properties: TcxCustomEditProperties read FProperties write SetProperties;
    property RepositoryItem: TcxEditRepositoryItem read FRepositoryItem write SetRepositoryItem;
    property Visible: Boolean read GetVisible write SetVisible stored IsVisibleStored default True;
    property PropertiesEvents: TNotifyEvent read FSubClassEvents write FSubClassEvents;
    property StylesEvents: TNotifyEvent read FSubClassEvents write FSubClassEvents;
    property Tag: TcxTag read GetTag write SetTag stored IsTagStored;
    property OnCustomDrawCell: TcxGridTableDataCellCustomDrawEvent read FOnCustomDrawCell write SetOnCustomDrawCell;
    property OnGetCellHint: TcxGridGetCellHintEvent read FOnGetCellHint write SetOnGetCellHint;
    property OnGetDataText: TcxGridGetDataTextEvent read FOnGetDataText write SetOnGetDataText;
    property OnGetDisplayText: TcxGridGetDisplayTextEvent read FOnGetDisplayText write SetOnGetDisplayText;
    property OnGetFilterDisplayText: TcxGridGetFilterDisplayTextEvent read FOnGetFilterDisplayText write SetOnGetFilterDisplayText;
    property OnGetFilterValues: TcxGridGetFilterValuesEvent read FOnGetFilterValues write SetOnGetFilterValues;
    property OnGetProperties: TcxGridGetPropertiesEvent read FOnGetProperties write SetOnGetProperties;
    property OnGetPropertiesForEdit: TcxGridGetPropertiesEvent read FOnGetPropertiesForEdit write SetOnGetPropertiesForEdit;
    property OnGetStoredProperties: TcxGridTableItemGetStoredPropertiesEvent read FOnGetStoredProperties write SetOnGetStoredProperties;
    property OnGetStoredPropertyValue: TcxGridTableItemGetStoredPropertyValueEvent read FOnGetStoredPropertyValue write SetOnGetStoredPropertyValue;
    property OnInitFilteringDateRanges: TcxGridInitDateRangesEvent read FOnInitFilteringDateRanges write SetOnInitFilteringDateRanges;
    property OnSetStoredPropertyValue: TcxGridTableItemSetStoredPropertyValueEvent read FOnSetStoredPropertyValue write SetOnSetStoredPropertyValue;
    property OnUserFiltering: TcxGridUserFilteringEvent read FOnUserFiltering write SetOnUserFiltering;
    property OnUserFilteringEx: TcxGridUserFilteringExEvent read FOnUserFilteringEx write SetOnUserFilteringEx;
  end;


  TcxGridViewRestoringFilterAttribute = (rfaActive, rfaData, rfaMRUItems);
  TcxGridViewRestoringFilterAttributes = set of TcxGridViewRestoringFilterAttribute;

  TcxGridTableCellCustomDrawEvent = procedure(Sender: TcxCustomGridTableView;
    ACanvas: TcxCanvas; AViewInfo: TcxGridTableCellViewInfo; var ADone: Boolean) of object;

  TcxGridAllowRecordOperationEvent = procedure(Sender: TcxCustomGridTableView;
    ARecord: TcxCustomGridRecord; var AAllow: Boolean) of object;
  TcxGridCellClickEvent = procedure(Sender: TcxCustomGridTableView;
    ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
    AShift: TShiftState; var AHandled: Boolean) of object;
  TcxGridCustomTableViewEvent = procedure(Sender: TcxCustomGridTableView) of object;
  TcxGridEditingEvent = procedure(Sender: TcxCustomGridTableView;
    AItem: TcxCustomGridTableItem; var AAllow: Boolean) of object;
  TcxGridEditDblClickEvent = procedure(Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
    AEdit: TcxCustomEdit) of object;
  TcxGridEditKeyEvent = procedure(Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
    AEdit: TcxCustomEdit; var Key: Word; Shift: TShiftState) of object;
  TcxGridEditKeyPressEvent = procedure(Sender: TcxCustomGridTableView;
    AItem: TcxCustomGridTableItem; AEdit: TcxCustomEdit; var Key: Char) of object;
  TcxGridCustomTableItemEvent = procedure(Sender: TcxCustomGridTableView;
    AItem: TcxCustomGridTableItem) of object;
  TcxGridFilterCustomizationEvent = procedure(Sender: TcxCustomGridTableView;
    var ADone: Boolean) of object;
  TcxGridFilterDialogShowEvent = procedure(Sender: TcxCustomGridTableView;
    AItem: TcxCustomGridTableItem; var ADone: Boolean) of object;
  TcxGridFocusedItemChangedEvent = procedure(Sender: TcxCustomGridTableView;
    APrevFocusedItem, AFocusedItem: TcxCustomGridTableItem) of object;
  TcxGridFocusedRecordChangedEvent = procedure(Sender: TcxCustomGridTableView;
    APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean) of object;
  TcxGridGetCellHeightEvent = procedure(Sender: TcxCustomGridTableView;
    ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
    ACellViewInfo: TcxGridTableDataCellViewInfo; var AHeight: Integer) of object;
  TcxGridGetDragDropTextEvent = procedure(Sender: TcxCustomGridTableView;
    ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem; var AText: string) of object;
  TcxGridInitEditEvent = procedure(Sender: TcxCustomGridTableView;
    AItem: TcxCustomGridTableItem; AEdit: TcxCustomEdit) of object;
  TcxGridInitEditValueEvent = procedure(Sender: TcxCustomGridTableView;
    AItem: TcxCustomGridTableItem; AEdit: TcxCustomEdit; var AValue: TcxEditValue) of object;
  TcxGridPartCustomDrawBackgroundEvent = procedure(Sender: TcxCustomGridTableView;
    ACanvas: TcxCanvas; AViewInfo: TcxCustomGridCellViewInfo; var ADone: Boolean) of object;
  TcxGridRecordEvent = procedure(Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord) of object;

  TcxGridDataControllerChange = (dccItemAdded, dccItemRemoved, dccIndexesChanged);

  TcxCustomGridTableView = class(TcxCustomGridView)
  public
    destructor Destroy; override;

    procedure ApplyBestFit(AItem: TcxCustomGridTableItem = nil; ACheckSizingAbility: Boolean = False;
      AFireEvents: Boolean = False); virtual;
    procedure ClearItems;
    procedure CopyToClipboard(ACopyAll: Boolean);
    function CreateItem: TcxCustomGridTableItem;
    function FindItemByID(AID: Integer): TcxCustomGridTableItem;
    function FindItemByName(const AName: string): TcxCustomGridTableItem;
    function FindItemByTag(ATag: TcxTag): TcxCustomGridTableItem;
    function IndexOfItem(AItem: TcxCustomGridTableItem): Integer;
    procedure MakeMasterGridRecordVisible;
    procedure RestoreDefaults; override;

    procedure BeginBestFitUpdate;
    procedure EndBestFitUpdate;
    procedure BeginFilteringUpdate;
    procedure EndFilteringUpdate;
    procedure BeginGroupingUpdate;
    procedure EndGroupingUpdate;
    procedure BeginSortingUpdate;
    procedure EndSortingUpdate;

    // for extended lookup edit
    class function CanBeLookupList: Boolean; virtual;

    property Controller: TcxCustomGridTableController read GetController;
    property DateTimeHandling: TcxCustomGridTableDateTimeHandling read FDateTimeHandling write SetDateTimeHandling;
    property Filtering: TcxCustomGridTableFiltering read FFiltering write SetFiltering;
    property GroupedItemCount: Integer read GetGroupedItemCount;
    property GroupedItems[Index: Integer]: TcxCustomGridTableItem read GetGroupedItem;
    property ItemCount: Integer read GetItemCount;
    property Items[Index: Integer]: TcxCustomGridTableItem read GetItem write SetItem;
    property MasterGridRecord: TcxCustomGridRecord read GetMasterGridRecord;
    property OptionsBehavior: TcxCustomGridTableOptionsBehavior read GetOptionsBehavior
      write SetOptionsBehavior;
    property OptionsCustomize: TcxCustomGridTableOptionsCustomize read FOptionsCustomize
      write SetOptionsCustomize;
    property OptionsData: TcxCustomGridTableOptionsData read GetOptionsData write SetOptionsData;
    property OptionsSelection: TcxCustomGridTableOptionsSelection read GetOptionsSelection
      write SetOptionsSelection;
    property OptionsView: TcxCustomGridTableOptionsView read GetOptionsView write SetOptionsView;
    property Painter: TcxCustomGridTablePainter read GetPainter;
    property PatternGridView: TcxCustomGridTableView read GetPatternGridView;
    property SortedItemCount: Integer read GetSortedItemCount;
    property SortedItems[Index: Integer]: TcxCustomGridTableItem read GetSortedItem;
    property Styles: TcxCustomGridTableViewStyles read GetStyles write SetStyles;
    property ViewData: TcxCustomGridTableViewData read GetViewData;
    property ViewInfo: TcxCustomGridTableViewInfo read GetViewInfo;
    property VisibleItemCount: Integer read GetVisibleItemCount;
    property VisibleItems[Index: Integer]: TcxCustomGridTableItem read GetVisibleItem;
  published
    property Navigator: TcxGridViewNavigator read FNavigator write SetNavigator;
    property FilterBox: TcxGridFilterBox read FFilterBox write SetFilterBox;

    property NavigatorButtons: TcxNavigatorControlButtons read GetNavigatorButtons write SetNavigatorButtons stored False;
    property NavigatorEvents: TNotifyEvent read FSubClassEvents write FSubClassEvents;
    property OnCanFocusRecord: TcxGridAllowRecordOperationEvent read FOnCanFocusRecord write SetOnCanFocusRecord;
    property OnCanSelectRecord: TcxGridAllowRecordOperationEvent read FOnCanSelectRecord write SetOnCanSelectRecord;
    property OnCellClick: TcxGridCellClickEvent read FOnCellClick write SetOnCellClick;
    property OnCellDblClick: TcxGridCellClickEvent read FOnCellDblClick write SetOnCellDblClick;
    property OnCustomDrawCell: TcxGridTableDataCellCustomDrawEvent read FOnCustomDrawCell write SetOnCustomDrawCell;
    property OnCustomDrawPartBackground: TcxGridPartCustomDrawBackgroundEvent
      read FOnCustomDrawPartBackground write SetOnCustomDrawPartBackground;
    property OnEditing: TcxGridEditingEvent read FOnEditing write SetOnEditing;
    property OnEditChanged: TcxGridCustomTableItemEvent read FOnEditChanged write SetOnEditChanged;
    property OnEditDblClick: TcxGridEditDblClickEvent read FOnEditDblClick write SetOnEditDblClick;
    property OnEditKeyDown: TcxGridEditKeyEvent read FOnEditKeyDown write SetOnEditKeyDown;
    property OnEditKeyPress: TcxGridEditKeyPressEvent read FOnEditKeyPress write SetOnEditKeyPress;
    property OnEditKeyUp: TcxGridEditKeyEvent read FOnEditKeyUp write SetOnEditKeyUp;
    property OnEditValueChanged: TcxGridCustomTableItemEvent read FOnEditValueChanged write SetOnEditValueChanged;
    property OnFilterControlDialogShow: TNotifyEvent read FOnFilterControlDialogShow
      write SetOnFilterControlDialogShow;
    property OnFilterCustomization: TcxGridFilterCustomizationEvent read FOnFilterCustomization
      write SetOnFilterCustomization;
    property OnFilterDialogShow: TcxGridFilterDialogShowEvent read FOnFilterDialogShow
      write SetOnFilterDialogShow;
    property OnFocusedItemChanged: TcxGridFocusedItemChangedEvent read FOnFocusedItemChanged
      write SetOnFocusedItemChanged;
    property OnFocusedRecordChanged: TcxGridFocusedRecordChangedEvent read FOnFocusedRecordChanged
      write SetOnFocusedRecordChanged;
    property OnGetCellHeight: TcxGridGetCellHeightEvent read FOnGetCellHeight write SetOnGetCellHeight;
    property OnGetDragDropText: TcxGridGetDragDropTextEvent read FOnGetDragDropText write SetOnGetDragDropText;
    property OnInitEdit: TcxGridInitEditEvent read FOnInitEdit write SetOnInitEdit;
    property OnInitEditValue: TcxGridInitEditValueEvent read FOnInitEditValue write SetOnInitEditValue;
    property OnInitFilteringDateRanges: TcxGridInitDateRangesEvent read FOnInitFilteringDateRanges write SetOnInitFilteringDateRanges;
    property OnInitStoredObject;
    property OnSelectionChanged: TcxGridCustomTableViewEvent read FOnSelectionChanged write SetOnSelectionChanged;
    property OnTopRecordIndexChanged: TNotifyEvent read FOnTopRecordIndexChanged write SetOnTopRecordIndexChanged;
    property OnUpdateEdit: TcxGridInitEditEvent read FOnUpdateEdit write SetOnUpdateEdit;
  end;




implementation

end.
