unit dxLayoutControl;


interface

uses
  Messages, Windows, SysUtils, Classes, Menus, Graphics, DB,
  Forms, Controls {after Forms for D12},
  StdCtrls, ExtCtrls, IniFiles, Contnrs, ImgList,
  dxCore, dxCoreClasses, dxMessages, cxClasses, cxGeometry, cxGraphics, cxControls,
  cxLookAndFeels, cxLibraryConsts, cxLookAndFeelPainters, cxDBEdit,
  dxLayoutLookAndFeels, dxLayoutCommon, dxLayoutSelection, cxPC, dxLayoutContainer;

type
  TdxCustomLayoutControl = class;
  TdxLayoutControlPainter = class;
  TdxLayoutControlPainterClass = class of TdxLayoutControlPainter;
  TdxLayoutControlViewInfo = class;
  TdxLayoutControlViewInfoClass = class of TdxLayoutControlViewInfo;

  { TdxLayoutControlPersistent }

  TdxLayoutControlPersistent = class(TPersistent)
  private
    FControl: TdxCustomLayoutControl;
  protected
    procedure Changed; virtual;
    function GetOwner: TPersistent; override;
  public
    constructor Create(AControl: TdxCustomLayoutControl); virtual;
    property Control: TdxCustomLayoutControl read FControl;
  end;

  { conatiner }

  TdxLayoutControlContainerPainter = class(TdxLayoutContainerPainter);

  TdxLayoutControlContainerViewInfo = class(TdxLayoutContainerViewInfo);

  { TdxLayoutControlContainer }

  TdxLayoutControlContainer = class(TdxLayoutContainer)
  private
    FControl: TdxCustomLayoutControl;
    function GetPainter: TdxLayoutControlContainerPainter;
    function GetViewInfo: TdxLayoutControlContainerViewInfo;
  protected
    function GetPainterClass: TdxLayoutContainerPainterClass; override;
    function GetViewInfoClass: TdxLayoutContainerViewInfoClass; override;
    // storing custom properties
    procedure GetItemStoredCustomProperties(AItem: TdxCustomLayoutItem;
      AProperties: TStrings); override;
    procedure GetItemStoredCustomPropertyValue(AItem: TdxCustomLayoutItem;
      const AName: string; var AValue: Variant); override;
    procedure SetItemStoredCustomPropertyValue(AItem: TdxCustomLayoutItem;
      const AName: string; const AValue: Variant); override;
    function GetStoredProperties(AProperties: TStrings): Boolean; override;
    procedure GetStoredPropertyValue(const AName: string; var AValue: Variant); override;
    procedure SetStoredPropertyValue(const AName: string; const AValue: Variant); override;

    function CanGetHitTest(const P: TPoint): Boolean; override;
    function CanRestore: Boolean; override;
    procedure Restore; override;
    procedure SizeAdjustment; override;
    procedure Store; override;
    function StoringSupports: Boolean; override;

    function CreateCustomizationControlHelper(AItem: TdxLayoutItem): TdxControlsDesignSelectorHelper; override;
    procedure CustomizationChanged; override;
    procedure CustomizeFormPostUpdate(AUpdateTypes: TdxLayoutCustomizeFormUpdateTypes); override;
    procedure PostBuildSelectionLayer; override;
    procedure PostInvalidateSelectionLayer(const R: TRect); override;
    procedure PostPlaceControls; override;

    function CanProcessKeyboard: Boolean; override;
    function CanUpdate: Boolean; override;
    function GetCanvas: TcxCanvas; override;
    function GetClientBounds: TRect; override;
    function GetClientRect: TRect; override;
    function GetItemsOwner: TComponent; override;
    function GetItemsParent: TcxControl; override;
    function GetItemsParentComponent: TComponent; override;
    function GetScrollOffset: TPoint; override;
    function GetSelectionHelperClass: TdxLayoutRunTimeSelectionHelperClass; override;
    function HasBackground: Boolean; override;
    function IsAutoControlAlignment: Boolean; override;
    function IsAutoControlTabOrders: Boolean; override;
    function IsFocusControlOnItemCaptionClick: Boolean; override;
    function IsShowLockedGroupChildren: Boolean; override;
    function IsSizableHorz: Boolean; override;
    function IsSizableVert: Boolean; override;
    procedure MakeVisible(AItem: TdxCustomLayoutItem); override;

    // font
    function GetBoldFont: TFont; override;
    function GetDefaultFont: TFont; override;

    procedure InitializeSubControlsCxLookAndFeel; override;
    procedure LayoutLookAndFeelUserChanged; override;

    property Painter: TdxLayoutControlContainerPainter read GetPainter;
  public
    constructor Create(AControl: TdxCustomLayoutControl); reintroduce; virtual;

    procedure BeginDragAndDrop; override;
    function CanDragAndDrop: Boolean; override;
    procedure FinishDragAndDrop(Accepted: Boolean); override;

    procedure Modified; override;

    property Control: TdxCustomLayoutControl read FControl;
    property ViewInfo: TdxLayoutControlContainerViewInfo read GetViewInfo;
  end;
  TdxLayoutControlContainerClass = class of TdxLayoutControlContainer;

  { controls }

  { TdxStoringOptions }

  TdxStoringOptions = class(TPersistent)
  private
    FIniFileName: string;
    FRegistryPath: string;
    FStoreToIniFile: Boolean;
    FStoreToRegistry: Boolean;
  protected
    function CanStoreToIniFile: Boolean;
    function CanStoreToRegistry: Boolean;
    function CanRestoreFromIniFile: Boolean;
    function CanRestoreFromRegistry: Boolean;
  public
    procedure Assign(Source: TPersistent); override;
  published
    property IniFileName: string read FIniFileName write FIniFileName;
    property RegistryPath: string read FRegistryPath write FRegistryPath;
    property StoreToIniFile: Boolean read FStoreToIniFile write FStoreToIniFile default False;
    property StoreToRegistry: Boolean read FStoreToRegistry write FStoreToRegistry default False;
  end;

  TdxLayoutItemOptions = class(TdxLayoutControlPersistent)
  private
    FAutoControlAreaAlignment: Boolean;
    FAutoControlTabOrders: Boolean;
    FFocusControlOnItemCaptionClick: Boolean;
    FShowLockedGroupChildren: Boolean;
    FSizableHorz: Boolean;
    FSizableVert: Boolean;

    procedure SetAutoControlAreaAlignment(Value: Boolean);
    procedure SetAutoControlTabOrders(Value: Boolean);
    procedure SetShowLockedGroupChildren(Value: Boolean);
  protected
    procedure Changed; override;
  public
    constructor Create(AControl: TdxCustomLayoutControl); override;
    procedure Assign(Source: TPersistent); override;
  published
    property AutoControlAreaAlignment: Boolean read FAutoControlAreaAlignment write SetAutoControlAreaAlignment default True;
    property AutoControlTabOrders: Boolean read FAutoControlTabOrders write SetAutoControlTabOrders default True;
    property FocusControlOnItemCaptionClick: Boolean read FFocusControlOnItemCaptionClick write FFocusControlOnItemCaptionClick default False;
    property ShowLockedGroupChildren: Boolean read FShowLockedGroupChildren write SetShowLockedGroupChildren default True;
    property SizableHorz: Boolean read FSizableHorz write FSizableHorz default False;
    property SizableVert: Boolean read FSizableVert write FSizableVert default False;
  end;

  TdxLayoutAutoContentSize = (acsWidth, acsHeight);
  TdxLayoutAutoContentSizes = set of TdxLayoutAutoContentSize;

  { TdxCustomLayoutControl }

  { TdxCustomLayoutControlHandler }

  TdxCustomLayoutControlHandler = class(TcxIUnknownObject)
  private
    FControl: TdxCustomLayoutControl;
    function GetViewInfo: TdxLayoutControlViewInfo;
  protected
    property Control: TdxCustomLayoutControl read FControl;
    property ViewInfo: TdxLayoutControlViewInfo read GetViewInfo;
  public
    constructor Create(AControl: TdxCustomLayoutControl); virtual;
  end;

  { TdxCustomLayoutControl }

  TdxLayoutControlGetItemStoredPropertiesEvent = procedure (Sender: TdxCustomLayoutControl;
    AItem: TdxCustomLayoutItem; AProperties: TStrings) of object;
  TdxLayoutControlGetItemStoredPropertyValueEvent = procedure (Sender: TdxCustomLayoutControl;
    AItem: TdxCustomLayoutItem; const AName: string; var AValue: Variant) of object;
  TdxLayoutControlSetItemStoredPropertyValueEvent = procedure (Sender: TdxCustomLayoutControl;
    AItem: TdxCustomLayoutItem; const AName: string; const AValue: Variant) of object;
  TdxLayoutControlGetStoredPropertiesEvent = procedure (Sender: TdxCustomLayoutControl;
    AProperties: TStrings) of object;
  TdxLayoutControlGetStoredPropertyValueEvent = procedure (Sender: TdxCustomLayoutControl;
    const AName: string; var AValue: Variant) of object;
  TdxLayoutControlSetStoredPropertyValueEvent = procedure (Sender: TdxCustomLayoutControl;
    const AName: string; const AValue: Variant) of object;

  TdxCustomLayoutControl = class(TcxScrollingControl,
    IdxLayoutComponent,
    IdxSkinSupport,
    IdxCustomizeControlsHelper,
    IcxEditorFieldLink2,
    IdxLayoutContainer)
  private
    FBoldFont: TFont;
    FDragDropHitTest: TdxCustomLayoutHitTest;
    FRightButtonPressed: Boolean;
    FRedrawOnResize: Boolean;

    // Objects
    FOptionsItem: TdxLayoutItemOptions;
    FOptionsStoring: TdxStoringOptions;
    FPainter: TdxLayoutControlPainter;
    FViewInfo: TdxLayoutControlViewInfo;

    FContainer: TdxLayoutControlContainer;

    // Customization
    FIsPopupShown: Boolean;
    // Storing
    FStoredStream: TMemoryStream;

    FOnCustomization: TNotifyEvent;
    FOnGetItemStoredProperties: TdxLayoutControlGetItemStoredPropertiesEvent;
    FOnGetItemStoredPropertyValue: TdxLayoutControlGetItemStoredPropertyValueEvent;
    FOnSetItemStoredPropertyValue: TdxLayoutControlSetItemStoredPropertyValueEvent;
    FOnGetStoredProperties: TdxLayoutControlGetStoredPropertiesEvent;
    FOnGetStoredPropertyValue: TdxLayoutControlGetStoredPropertyValueEvent;
    FOnSetStoredPropertyValue: TdxLayoutControlSetStoredPropertyValueEvent;
    // Get/Set Properties
    function GetAutoContentSizes: TdxLayoutAutoContentSizes;
    function GetContentBounds: TRect;
    function GetCustomization: Boolean;
    function GetCustomizeAvailableItemsViewKind: TdxLayoutAvailableItemsViewKind;
    function GetCustomizeForm: TdxLayoutControlCustomCustomizeForm;
    function GetCustomizeFormBounds: TRect;
    function GetCustomizeFormClass: TdxLayoutControlCustomCustomizeFormClass;
    function GetCustomizeFormTabbedView: Boolean;
    function GetHighlightRoot: Boolean;
    function GetIsLayoutLoading: Boolean;
    function GetItems: TdxLayoutGroup;
    function GetLayoutDirection: TdxLayoutDirection;
    function GetLayoutLookAndFeel: TdxCustomLayoutLookAndFeel;
    function GetMenuItems: TdxLayoutCustomizeFormMenuItems;
    function GetOccupiedClientHeight: Integer;
    function GetOccupiedClientWidth: Integer;
    function GetOptionsImage: TdxLayoutImageOptions;
    function GetShowDesignSelectors: Boolean;
    function GetUndoRedoManager: TdxUndoRedoManager;
    procedure SetAutoContentSizes(Value: TdxLayoutAutoContentSizes);
    procedure SetCustomization(Value: Boolean);
    procedure SetCustomizeAvailableItemsViewKind(Value: TdxLayoutAvailableItemsViewKind);
    procedure SetCustomizeFormBounds(const AValue: TRect);
    procedure SetCustomizeFormClass(AValue: TdxLayoutControlCustomCustomizeFormClass);
    procedure SetCustomizeFormTabbedView(Value: Boolean);
    procedure SetHighlightRoot(Value: Boolean);
    procedure SetLayoutDirection(Value: TdxLayoutDirection);
    procedure SetLayoutLookAndFeel(Value: TdxCustomLayoutLookAndFeel);
    procedure SetMenuItems(Value: TdxLayoutCustomizeFormMenuItems);
    procedure SetOptionsImage(Value: TdxLayoutImageOptions);
    procedure SetOptionsItem(Value: TdxLayoutItemOptions);
    procedure SetShowDesignSelectors(Value: Boolean);

    // Items
    function GetAutoControlAlignment: Boolean;
    function GetAutoControlTabOrders: Boolean;
    function GetAbsoluteItem(Index: Integer): TdxCustomLayoutItem;
    function GetAbsoluteItemCount: Integer;
    function GetAlignmentConstraint(Index: Integer): TdxLayoutAlignmentConstraint;
    function GetAlignmentConstraintCount: Integer;
    function GetAvailableItem(Index: Integer): TdxCustomLayoutItem;
    function GetAvailableItemCount: Integer;
    procedure SetAutoControlAlignment(Value: Boolean);
    procedure SetAutoControlTabOrders(Value: Boolean);

    // Storing
    procedure SetOptionsStoring(Value: TdxStoringOptions);
    function GetIniFileName: string;
    function GetRegistryPath: string;
    function GetStoreInIniFile: Boolean;
    function GetStoreInRegistry: Boolean;
    procedure SetIniFileName(const Value: string);
    procedure SetRegistryPath(const Value: string);
    procedure SetStoreInIniFile(const Value: Boolean);
    procedure SetStoreInRegistry(const Value: Boolean);

    procedure CreateHandlers;
    procedure DestroyHandlers;

    // Other
    procedure ContainerChangedHandler(Sender: TObject);
    procedure ContainerSelectionChangedHandler(Sender: TObject);
    procedure InitializeSubControlsCxLookAndFeel;
    procedure RefreshBoldFont;

    procedure WMContextMenu(var Message: TWMContextMenu); message WM_CONTEXTMENU;
    procedure WMGetDlgCode(var Message: TWMGetDlgCode); message WM_GETDLGCODE;
    procedure WMKillFocus(var Message: TWMKillFocus); message WM_KILLFOCUS;
    procedure WMSetCursor(var Message: TWMSetCursor); message WM_SETCURSOR;
    procedure WMSetFocus(var Message: TWMSetFocus); message WM_SETFOCUS;
    procedure CMChildKey(var Message: TCMChildKey); message CM_CHILDKEY;
    procedure CMControlChange(var Message: TCMControlChange); message CM_CONTROLCHANGE;
    procedure CMControlListChange(var Message: TCMControlListChange); message CM_CONTROLLISTCHANGE;
    procedure CMDialogChar(var Message: TCMDialogChar); message CM_DIALOGCHAR;
    procedure CMDialogKey(var Message: TCMDialogKey); message CM_DIALOGKEY;
    procedure CMHintShow(var Message: TCMHintShow); message CM_HINTSHOW;
    procedure CMTabStopChanged(var Message: TMessage); message CM_TABSTOPCHANGED;
    procedure DXMPlaceControls(var Message: TMessage); message DXM_LAYOUT_PLACECONTROLS;
    procedure DXMBuildSelectionLayer(var Message: TMessage); message DXM_LAYOUT_BUILDSELECTIONLAYER;
    procedure DXMInvalidateSelectionLayer(var Message: TMessage); message DXM_LAYOUT_INVALIDATESELECTIONLAYER;
    procedure DXMCustomizeFormUpdate(var Message: TMessage); message DXM_REFRESHCUSTOMIZATION;
  protected
    //IdxLayoutComponent
    procedure SelectionChanged; stdcall;
    //IdxCustomizeControlsHelper
    function CanProcessChildren: Boolean; virtual;
    //IdxLayoutContainer
    function GetContainer: TdxLayoutContainer;

    function CanGetHitTest(const P: TPoint): Boolean;
    function CanProcessKeyboard: Boolean;
    function GetCanvas: TcxCanvas;
    function GetScrollOffset: TPoint;
    function IsFocusControlOnItemCaptionClick: Boolean;
    function IsShowLockedGroupChildren: Boolean;
    function IsSizableHorz: Boolean;
    function IsSizableVert: Boolean;
    procedure MakeItemVisible(AItem: TdxCustomLayoutItem);
    procedure PostPlaceControls;
    procedure SizeAdjustment;

    procedure ActionChange(Sender: TObject; CheckDefaults: Boolean); override;
    procedure AlignControls(AControl: TControl; var Rect: TRect); override;
    procedure CreateParams(var Params: TCreateParams); override;
  {$IFNDEF DELPHI12}
    procedure GetChildren(Proc: TGetChildProc; Root: TComponent); override;
  {$ENDIF}
    function GetCursor(X, Y: Integer): TCursor; override;
    procedure DoEnter; override;
    procedure DoExit; override;
    function DoShowPopupMenu(AMenu: TComponent; X, Y: Integer): Boolean; override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure Loaded; override;
    procedure Paint; override;
    procedure SetName(const Value: TComponentName); override;
    procedure SetParentBackground(Value: Boolean); override;
    procedure WriteState(Writer: TWriter); override;
    procedure WndProc(var Message: TMessage); override;

    // Conditions
    function CanAutoSize(var NewWidth, NewHeight: Integer): Boolean; override;
    function CanFocusOnClick(X, Y: Integer): Boolean; override;
    function HasBackground: Boolean; override;
    function IsInternalControl(AControl: TControl): Boolean; override;
    function NeedRedrawOnResize: Boolean; override;

    // Notifications
    procedure BoundsChanged; override;
    procedure FontChanged; override;
    procedure LayoutChanged(AType: TdxChangeType = ctHard); override;

    // Mouse
    procedure DblClick; override;
    function GetDesignHitTest(X, Y: Integer; Shift: TShiftState): Boolean; override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure MouseLeave(AControl: TControl); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;

    // Scrollbars
    function IsScrollDataValid: Boolean; override;
    function GetContentSize: TSize; override;
    function NeedsToBringInternalControlsToFront: Boolean; override;
    procedure ScrollContent(APrevPos, ACurPos: Integer; AHorzScrolling: Boolean); override;

    // Drag and Drop
    function AllowAutoDragAndDropAtDesignTime(X, Y: Integer; Shift: TShiftState): Boolean; override;
    function AllowDragAndDropWithoutFocus: Boolean; override;
    function CanDrag(X, Y: Integer): Boolean; override;
    function CanDragAndDrop: Boolean;
    function GetDragAndDropObjectClass: TcxDragAndDropObjectClass; override;
    function StartDragAndDrop(const P: TPoint): Boolean; override;
    procedure EndDragAndDrop(Accepted: Boolean); override;

    function GetCxLookAndFeel: TcxLookAndFeel;
    function GetPainterClass: TdxLayoutControlPainterClass; virtual;
    function GetViewInfoClass: TdxLayoutControlViewInfoClass; virtual;

    function CanMultiSelect: Boolean; virtual;
    function CanShowSelection: Boolean; virtual;
    procedure CustomizeFormPostUpdate(AUpdateTypes: TdxLayoutCustomizeFormUpdateTypes);
    procedure DoCustomization; virtual;
    procedure DoGetItemStoredProperties(AItem: TdxCustomLayoutItem; AProperties: TStrings); virtual;
    procedure DoGetItemStoredPropertyValue(AItem: TdxCustomLayoutItem;
      const AName: string; var AValue: Variant); virtual;
    procedure DoSetItemStoredPropertyValue(AItem: TdxCustomLayoutItem;
      const AName: string; const AValue: Variant); virtual;
    procedure DoGetStoredProperties(AProperties: TStrings); virtual;
    procedure DoGetStoredPropertyValue(const AName: string; var AValue: Variant); virtual;
    procedure DoSetStoredPropertyValue(const AName: string; const AValue: Variant); virtual;
    function GetAlignmentConstraintClass: TdxLayoutAlignmentConstraintClass; virtual;
    function GetContainerClass: TdxLayoutControlContainerClass; virtual;
    function GetDesignSelectorRect: TRect;
    function IsToolSelected: Boolean;
    function IsUpdateLocked: Boolean;

    // selections
    procedure PostBuildSelectionLayer; virtual;
    procedure PostInvalidateSelectionLayer(const R: TRect); virtual;

    // storing
    function OldLoadFromIniFile(const AFileName: string): Boolean;
    function OldLoadFromRegistry(const ARegistryPath: string): Boolean;
    function OldLoadFromStream(AStream: TStream): Boolean;

    // IcxEditorFieldLink
    function CreateFieldControls(X, Y: Integer; ADataSource: TObject; AFieldList: TList): Boolean;
    procedure DoCreateFieldControl(AControl: TControl; AField: TField);
    function NeedCreateCaption: Boolean;

    // undo
    procedure CancelLastUndo;
    procedure SaveToUndo;

    procedure CreateBoldFont;
    procedure CreateContainer;
    procedure CreateOptions;
    procedure DestroyBoldFont;
    procedure DestroyContainer;
    procedure DestroyOptions;

    property BoldFont: TFont read FBoldFont;
    property cxLookAndFeel: TcxLookAndFeel read GetCxLookAndFeel;
    property IsLayoutLoading: Boolean read GetIsLayoutLoading;
    property MenuItems: TdxLayoutCustomizeFormMenuItems read GetMenuItems write SetMenuItems;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    procedure BeginDragAndDrop; override;
    procedure GetTabOrderList(List: TList); override;
  {$IFDEF DELPHI12}
    procedure GetChildren(Proc: TGetChildProc; Root: TComponent); override;
  {$ENDIF}

    procedure Clear;
    function CreateAlignmentConstraint: TdxLayoutAlignmentConstraint;
    function FindItem(AControl: TControl): TdxLayoutItem; overload;
    function FindItem(AControlHandle: THandle): TdxLayoutItem; overload;
    function FindItem(const AName: string): TdxCustomLayoutItem; overload;
    function GetHitTest(const P: TPoint): TdxCustomLayoutHitTest; overload;
    function GetHitTest(X, Y: Integer): TdxCustomLayoutHitTest; overload;

    procedure BeginUpdate;
    procedure CancelUpdate;
    procedure EndUpdate(ANeedPack: Boolean = True);

    function CreateGroup(AGroupClass: TdxLayoutGroupClass;): TdxLayoutGroup;
    function CreateItem(AItemClass: TdxCustomLayoutItemClass): TdxCustomLayoutItem;
    function CreateItemForControl(AControl: TControl): TdxLayoutItem;

    // Storing
    function CanRestore: Boolean;
    procedure Restore;
    procedure Store;

    procedure LoadFromIniFile(const AFileName: string);
    procedure LoadFromRegistry(const ARegistryPath: string);
    procedure LoadFromStream(AStream: TStream);
    procedure SaveToIniFile(const AFileName: string; ARecreate: Boolean = True);
    procedure SaveToRegistry(const ARegistryPath: string; ARecreate: Boolean = True);
    procedure SaveToStream(AStream: TStream);

    property AutoSize;

    property AutoContentSizes: TdxLayoutAutoContentSizes read GetAutoContentSizes write SetAutoContentSizes;
    property Container: TdxLayoutControlContainer read FContainer;
    property LayoutDirection: TdxLayoutDirection read GetLayoutDirection write SetLayoutDirection;

    property LookAndFeel: TdxCustomLayoutLookAndFeel read GetLayoutLookAndFeel write SetLayoutLookAndFeel;
    property LayoutLookAndFeel: TdxCustomLayoutLookAndFeel read GetLayoutLookAndFeel write SetLayoutLookAndFeel;

    property RedrawOnResize: Boolean read FRedrawOnResize write FRedrawOnResize;

    // Customization properties
    property Customization: Boolean read GetCustomization write SetCustomization;
    property CustomizeAvailableItemsViewKind: TdxLayoutAvailableItemsViewKind read GetCustomizeAvailableItemsViewKind
      write SetCustomizeAvailableItemsViewKind;
    property CustomizeForm: TdxLayoutControlCustomCustomizeForm read GetCustomizeForm;
    property CustomizeFormBounds: TRect read GetCustomizeFormBounds write SetCustomizeFormBounds;
    property CustomizeFormClass: TdxLayoutControlCustomCustomizeFormClass read GetCustomizeFormClass write SetCustomizeFormClass;
    property CustomizeFormTabbedView: Boolean read GetCustomizeFormTabbedView write SetCustomizeFormTabbedView;
    property ShowDesignSelectors: Boolean read GetShowDesignSelectors write SetShowDesignSelectors;
    property HighlightRoot: Boolean read GetHighlightRoot write SetHighlightRoot;

    property ContentBounds: TRect read GetContentBounds;
    property OccupiedClientWidth: Integer read GetOccupiedClientWidth;
    property OccupiedClientHeight: Integer read GetOccupiedClientHeight;

    // Options
    property OptionsImage: TdxLayoutImageOptions read GetOptionsImage write SetOptionsImage;

    // Item properies
    property OptionsItem: TdxLayoutItemOptions read FOptionsItem write SetOptionsItem;
    property AutoControlAlignment: Boolean read GetAutoControlAlignment write SetAutoControlAlignment default True;
    property AutoControlTabOrders: Boolean read GetAutoControlTabOrders write SetAutoControlTabOrders default True;
    property AbsoluteItemCount: Integer read GetAbsoluteItemCount;
    property AbsoluteItems[Index: Integer]: TdxCustomLayoutItem read GetAbsoluteItem;
    property AvailableItemCount: Integer read GetAvailableItemCount;
    property AvailableItems[Index: Integer]: TdxCustomLayoutItem read GetAvailableItem;
    property AlignmentConstraintCount: Integer read GetAlignmentConstraintCount;
    property AlignmentConstraints[Index: Integer]: TdxLayoutAlignmentConstraint read GetAlignmentConstraint;
    property Items: TdxLayoutGroup read GetItems;

    // Storing properties
    property OptionsStoring: TdxStoringOptions read FOptionsStoring write SetOptionsStoring;
    property IniFileName: string read GetIniFileName write SetIniFileName;
    property RegistryPath: string read GetRegistryPath write SetRegistryPath;
    property StoreInIniFile: Boolean read GetStoreInIniFile write SetStoreInIniFile;
    property StoreInRegistry: Boolean read GetStoreInRegistry write SetStoreInRegistry;

    // Undo
    property UndoRedoManager: TdxUndoRedoManager read GetUndoRedoManager;

    property Painter: TdxLayoutControlPainter read FPainter;
    property ViewInfo: TdxLayoutControlViewInfo read FViewInfo;

    property OnCustomization: TNotifyEvent read FOnCustomization write FOnCustomization;
    property OnGetItemStoredProperties: TdxLayoutControlGetItemStoredPropertiesEvent
      read FOnGetItemStoredProperties write FOnGetItemStoredProperties;
    property OnGetItemStoredPropertyValue: TdxLayoutControlGetItemStoredPropertyValueEvent
      read FOnGetItemStoredPropertyValue write FOnGetItemStoredPropertyValue;
    property OnSetItemStoredPropertyValue: TdxLayoutControlSetItemStoredPropertyValueEvent
      read FOnSetItemStoredPropertyValue write FOnSetItemStoredPropertyValue;
    property OnGetStoredProperties: TdxLayoutControlGetStoredPropertiesEvent
      read FOnGetStoredProperties write FOnGetStoredProperties;
    property OnGetStoredPropertyValue: TdxLayoutControlGetStoredPropertyValueEvent
      read FOnGetStoredPropertyValue write FOnGetStoredPropertyValue;
    property OnSetStoredPropertyValue: TdxLayoutControlSetStoredPropertyValueEvent
      read FOnSetStoredPropertyValue write FOnSetStoredPropertyValue;
  end;

  TdxLayoutControl = class(TdxCustomLayoutControl)
  published
    property Align;
    property Anchors;
    property BevelEdges;
    property BevelInner;
    property BevelOuter;
    property BevelKind;
    property BevelWidth;
    property BorderWidth;
    property Constraints;
    property DragCursor;
    property DragKind;
    property DragMode;
    property Enabled;
    property FocusOnClick;
    property Font;
    property MenuItems default dxDefaultLayoutCustomizeFormMenuItems;
    property ParentBackground default False;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ShowHint;
    property TabOrder;
    property TabStop;  // obsolete
    property Visible;

    property AutoContentSizes stored False; // obsolete
    property AutoControlAlignment stored False; // obsolete
    property AutoControlTabOrders stored False; // obsolete
    property AutoSize;

    property LookAndFeel stored False; // obsolete
    property LayoutLookAndFeel;

    property RedrawOnResize default True;
    
    // Customization properties
    property CustomizeFormTabbedView default False;
    property ShowDesignSelectors default True;
    property HighlightRoot default True;

    // Options
    property OptionsImage;
    property OptionsItem;

    // Storing properties
    property OptionsStoring;
    property IniFileName stored False; // obsolete
    property RegistryPath stored False; // obsolete
    property StoreInIniFile stored False; // obsolete
    property StoreInRegistry stored False; // obsolete

    property OnClick;
    property OnContextPopup;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDock;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMouseDown;
    property OnMouseEnter;
    property OnMouseLeave;
    property OnMouseMove;
    property OnMouseUp;
    property OnMouseWheel;
    property OnMouseWheelDown;
    property OnMouseWheelUp;
    property OnResize;
    property OnStartDock;
    property OnStartDrag;

    property OnCustomization;
    property OnGetItemStoredProperties;
    property OnGetItemStoredPropertyValue;
    property OnSetItemStoredPropertyValue;
    property OnGetStoredProperties;
    property OnGetStoredPropertyValue;
    property OnSetStoredPropertyValue;
  end;


implementation

end.
