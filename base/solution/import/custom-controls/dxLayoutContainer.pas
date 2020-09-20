
unit dxLayoutContainer;


interface

uses
  Messages, Windows, SysUtils, Classes, Menus, Graphics,
  Forms, Controls {after Forms for D12},
  StdCtrls, ExtCtrls, IniFiles, Contnrs, ImgList,
  dxCore, dxCoreClasses, dxMessages, cxClasses, cxGeometry, cxGraphics, cxControls,
  cxLookAndFeels, cxLibraryConsts, cxLookAndFeelPainters, cxStorage,
  dxLayoutLookAndFeels, dxLayoutCommon, dxLayoutSelection, cxPC;

const
  htError = -1;
  htNone = 0;
  htCustomizeForm = 1;
  htItem = 10;
  htGroup = 20;
  htClientArea = 30;
  htAvailableItems = 40;
  htTreeViewItems = 50;
  htBasicItem = 60;
  htSizeHandle = 70;

  dxLayoutItemControlDefaultMinHeight = 20;
  dxLayoutItemControlDefaultMinWidth = 20;

  dxLayoutItemMinSize = 5;
  dxLayoutVersion = 3;

type
  
  TdxLayoutAlignHorz = (ahLeft, ahCenter, ahRight, ahClient, ahParentManaged);
  TdxLayoutAlignVert = (avTop, avCenter, avBottom, avClient, avParentManaged);
  TdxLayoutItemControlAlignHorz = ahLeft..ahClient;
  TdxLayoutItemControlAlignVert = avTop..avClient;
  TdxLayoutAutoAlign = (aaHorizontal, aaVertical);
  TdxLayoutAutoAligns = set of TdxLayoutAutoAlign;
  TdxLayoutDirection = (ldHorizontal, ldVertical, ldTabbed);
  TdxLayoutAreaPart = (apNone, apLeft, apTop, apRight, apBottom, apCenter,
    apBefore, apAfter, apBeforeContent, apAfterContent, apFirstChild, apLastChild);
  TdxLayoutActionType = (atNone, atInsert, atCreateGroup, atContentInsert);

  TdxLayoutCustomizeFormUpdateType = (cfutCaption, cfutAvailableItems, cfutVisibleItems, cfutSelection, cfutView, cfutDragAndDropState);
  TdxLayoutCustomizeFormUpdateTypes = set of TdxLayoutCustomizeFormUpdateType;

  TdxLayoutAvailableItemsViewKind = (aivkList, aivkTree);
  TdxLayoutItemChangedEvent = procedure(AItem: TdxCustomLayoutItem) of object;

  TdxLayoutCustomizeFormMenuItem = (cfmiAlignHorz, cfmiAlignVert, cfmiDirection, cfmiCaptionLayout, cfmiCaptionAlignHorz,
    cfmiCaptionAlignVert, cfmiCaption, cfmiBorder, cfmiExpandButton);
  TdxLayoutCustomizeFormMenuItems = set of TdxLayoutCustomizeFormMenuItem;



  TdxCustomLayoutItemOptions = class(TPersistent)
  private
    FItem: TdxCustomLayoutItem;
    function GetIsRestoring: Boolean;
  protected
    procedure BeginUpdate;
    procedure EndUpdate;

    procedure Changed; virtual;
    property Item: TdxCustomLayoutItem read FItem;
    property IsRestoring: Boolean read GetIsRestoring;
  public
    constructor Create(AItem: TdxCustomLayoutItem); virtual;
  end;

  { CustomizeForm }

  TdxLayoutControlCustomCustomizeForm = class(TForm)
  private
    FContainer: TdxLayoutContainer;
    procedure SetContainer(AValue: TdxLayoutContainer);
  protected
    procedure CreateParams(var Params: TCreateParams); override;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;

    function CanAddItem: Boolean; virtual;
    function CanModify: Boolean; virtual;
    function CanShowItem(AItem: TdxCustomLayoutItem): Boolean; virtual;
    function CanShowMenuItem(AMenuItem: TdxLayoutCustomizeFormMenuItem): Boolean;
    procedure DoInitializeControl; virtual;
    function GetWndParent: THandle; virtual;
    procedure ItemChanged(AItem: TdxCustomLayoutItem); virtual;
    function GetLayoutPopupMenu: TPopupMenu; virtual;
    procedure InitializeControl; virtual;
  public
    destructor Destroy; override;

    function GetHitTest(const P: TPoint): TdxCustomLayoutHitTest; virtual;
    procedure ToggleHotTrackState(AItem: TdxCustomLayoutItem); virtual;

    procedure UpdateAvailableItems; virtual;
    procedure UpdateCaption; virtual;
    procedure UpdateContent; virtual;
    procedure UpdateDragAndDropState; virtual;
    procedure UpdateSelection; virtual;
    procedure UpdateView; virtual;
    procedure UpdateVisibleItems; virtual;

    property Container: TdxLayoutContainer read FContainer write SetContainer;
    property LayoutPopupMenu: TPopupMenu read GetLayoutPopupMenu;
  end;
  TdxLayoutControlCustomCustomizeFormClass = class of TdxLayoutControlCustomCustomizeForm;

  { TdxLayoutItemImageOptions }

  TdxCustomLayoutItemImageOptions = class(TdxCustomLayoutItemOptions)
  private
    FGlyph: TBitmap;
    FImageIndex: Integer;
    procedure SetGlyph(AValue: TBitmap);
    procedure SetImageIndex(AValue: Integer);

    procedure GlyphChanged(Sender: TObject);
  protected
    function GetCurrentImage(out AGlyph: TBitmap; out AImages: TCustomImageList; out AImageIndex: Integer): Boolean;
    function GetImageList(AEnabled: Boolean): TCustomImageList;
    function GetImageSize: TSize;
    function IsImageAssigned: Boolean;
  public
    constructor Create(AItem: TdxCustomLayoutItem); override;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
  published
    property Glyph: TBitmap read FGlyph write SetGlyph;
    property ImageIndex: Integer read FImageIndex write SetImageIndex default -1;
  end;

  TdxAlignmentVert = (tavTop, tavCenter, tavBottom);
  TdxCaptionLayout = (clLeft, clTop, clRight, clBottom);
  TdxLayoutItemCaptionVisibleElement = (cveImage, cveText);
  TdxLayoutItemCaptionVisibleElements = set of TdxLayoutItemCaptionVisibleElement;

  TdxCustomLayoutItemCaptionOptions = class(TdxCustomLayoutItemOptions)
  private
    FAlignHorz: TAlignment;
    FAlignVert: TdxAlignmentVert;
    FImageOptions: TdxCustomLayoutItemImageOptions;
    FLayout: TdxCaptionLayout;
    FShowAccelChar: Boolean;
    FText: string;
    FVisibleElements: TdxLayoutItemCaptionVisibleElements;
    FVisible: Boolean;
    function GetGlyph: TBitmap;
    function GetImageIndex: Integer;
    procedure SetAlignHorz(Value: TAlignment);
    procedure SetAlignVert(Value: TdxAlignmentVert);
    procedure SetGlyph(AValue: TBitmap);
    procedure SetImageIndex(AValue: Integer);
    procedure SetImageOptions(Value: TdxCustomLayoutItemImageOptions);
    procedure SetLayout(Value: TdxCaptionLayout);
    procedure SetShowAccelChar(Value: Boolean);
    procedure SetVisibleElements(Value: TdxLayoutItemCaptionVisibleElements);
    procedure SetVisible(Value: Boolean);
  protected
    function IsTextStored: Boolean; virtual;
    function GetText: string; virtual;
    procedure SetText(const Value: string); virtual;
    // storing
    procedure GetStoredPropertyValue(const AName: string; var AValue: Variant); virtual;
    procedure GetStoredProperties(AProperties: TStrings); virtual;
    procedure SetStoredPropertyValue(const AName: string; const AValue: Variant); virtual;

    property Glyph: TBitmap read GetGlyph write SetGlyph;
    property ImageIndex: Integer read GetImageIndex write SetImageIndex default -1;
    property ImageOptions: TdxCustomLayoutItemImageOptions read FImageOptions write SetImageOptions;
    property Layout: TdxCaptionLayout read FLayout write SetLayout;
    property ShowAccelChar: Boolean read FShowAccelChar write SetShowAccelChar default True;
    property VisibleElements: TdxLayoutItemCaptionVisibleElements read FVisibleElements write SetVisibleElements default [cveImage, cveText];
  public
    constructor Create(AItem: TdxCustomLayoutItem); override;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;

    property AlignHorz: TAlignment read FAlignHorz write SetAlignHorz default taLeftJustify;
    property AlignVert: TdxAlignmentVert read FAlignVert write SetAlignVert;
    property Text: string read GetText write SetText stored IsTextStored;
    property Visible: Boolean read FVisible write SetVisible default True;
  end;
  TdxCustomLayoutItemCaptionOptionsClass = class of TdxCustomLayoutItemCaptionOptions;

  TdxLayoutSizeOptionsValue = (sovSizableHorz, sovSizableVert);
  TdxLayoutSizeOptionsValues = set of TdxLayoutSizeOptionsValue;

  TdxLayoutSizeOptions = class(TdxCustomLayoutItemOptions)
  private
    FAssignedValues: TdxLayoutSizeOptionsValues;
    FSizableHorz: Boolean;
    FSizableVert: Boolean;
    FWidth: Integer;
    FHeight: Integer;
    function GetSizableHorz: Boolean;
    function GetSizableVert: Boolean;
    procedure SetAssignedValues(Value: TdxLayoutSizeOptionsValues);
    procedure SetSizableHorz(Value: Boolean);
    procedure SetSizableVert(Value: Boolean);
    procedure SetHeight(Value: Integer);
    procedure SetWidth(Value: Integer);

    function IsSizableHorzStored: Boolean;
    function IsSizableVertStored: Boolean;
  protected
    procedure Changed; override;
  public
    procedure Assign(Source: TPersistent); override;
  published
    property AssignedValues: TdxLayoutSizeOptionsValues read FAssignedValues write SetAssignedValues default [];
    property SizableHorz: Boolean read GetSizableHorz write SetSizableHorz stored IsSizableHorzStored;
    property SizableVert: Boolean read GetSizableVert write SetSizableVert stored IsSizableVertStored;
    property Height: Integer read FHeight write SetHeight default 0;
    property Width: Integer read FWidth write SetWidth default 0;
  end;

  TdxLayoutOffsets = class(TdxCustomLayoutItemOptions)
  private
    FBottom: Integer;
    FLeft: Integer;
    FRight: Integer;
    FTop: Integer;
  protected
    function GetValue(Index: Integer): Integer; virtual;
    procedure SetValue(Index: Integer; Value: Integer); virtual;
  public
    procedure Assign(Source: TPersistent); override;
  published
    property Bottom: Integer index 1 read GetValue write SetValue default 0;
    property Left: Integer index 2 read GetValue write SetValue default 0;
    property Right: Integer index 3 read GetValue write SetValue default 0;
    property Top: Integer index 4 read GetValue write SetValue default 0;
  end;

  TdxLayoutPadding = class(TdxLayoutOffsets)
  private
    FAssignedValues: TdxLayoutPaddingAssignedValues;
    function IsValueStored(Index: Integer): Boolean;
    procedure SetAssignedValues(Value: TdxLayoutPaddingAssignedValues);
  protected
    function GetValue(Index: Integer): Integer; override;
    procedure SetValue(Index: Integer; Value: Integer); override;
  public
    procedure Assign(Source: TPersistent); override;
    function GetValues: TRect;
  published
    property AssignedValues: TdxLayoutPaddingAssignedValues read FAssignedValues write SetAssignedValues default [];
    property Bottom stored IsValueStored;
    property Left stored IsValueStored;
    property Right stored IsValueStored;
    property Top stored IsValueStored;
  end;

  { TdxCustomLayoutItem }

  TdxLayoutItemChangeType = (ictHard, ictMedium, ictLight, ictComplex);

  TdxCustomLayoutItemAssignedValue = (liavEnabled);
  TdxCustomLayoutItemAssignedValues = set of TdxCustomLayoutItemAssignedValue;

  TdxCustomLayoutItemClass = class of TdxCustomLayoutItem;

  TdxCustomLayoutItem = class(TComponent,
    IdxLayoutLookAndFeelUser,
    IdxLayoutSelectableItem,
    IcxStoredObject)
  private
    FAlignHorz: TdxLayoutAlignHorz;
    FAlignmentConstraint: TdxLayoutAlignmentConstraint;
    FAlignVert: TdxLayoutAlignVert;
    FAllowRemove: Boolean;
    FAssignedValues: TdxCustomLayoutItemAssignedValues;
    FCachedTextHeight: Integer;
    FContainer: TdxLayoutContainer;
    FCustomization: Boolean;
    FData: Pointer;
    FEnabled: Boolean;
    FIsUserDefined: Boolean;
    FLayoutLookAndFeel: TdxCustomLayoutLookAndFeel;
    // storing
    FLoadedIndex: Integer;
    FLoadedParentName: string;
    FSuperfluous: Boolean;

    FOffsets: TdxLayoutOffsets;
    FPadding: TdxLayoutPadding;
    FParent: TdxLayoutGroup;
    FVisible: Boolean;
    FViewInfo: TdxCustomLayoutItemViewInfo;

    FCaptionOptions: TdxCustomLayoutItemCaptionOptions;
    FSizeOptions: TdxLayoutSizeOptions;

    FOnCaptionClick: TNotifyEvent;

    procedure ApplyLoadedPosition;
    function GetRealAlignHorz: TdxLayoutAlignHorz;
    function GetRealAlignVert: TdxLayoutAlignVert;
    function GetActuallyVisible: Boolean;
    function GetAutoAligns: TdxLayoutAutoAligns;
    function GetAlignHorz: TdxLayoutAlignHorz;
    function GetAlignVert: TdxLayoutAlignVert;
    function GetCaption: string;
    function GetCaptionForCustomizeForm: string;
    function GetEnabled: Boolean;
    function GetIndex: Integer;
    function GetViewInfo: TdxCustomLayoutItemViewInfo;
    function GetVisibleIndex: Integer;
    procedure SetAlignHorz(Value: TdxLayoutAlignHorz);
    procedure SetAlignmentConstraint(Value: TdxLayoutAlignmentConstraint);
    procedure SetAlignVert(Value: TdxLayoutAlignVert);
    procedure SetAutoAligns(Value: TdxLayoutAutoAligns);
    procedure SetCaption(const Value: string);
    procedure SetCaptionOptions(const Value: TdxCustomLayoutItemCaptionOptions);
    procedure SetContainer(Value: TdxLayoutContainer);
    procedure SetCustomization(Value: Boolean);
    procedure SetEnabled(Value: Boolean);
    procedure SetLayoutLookAndFeel(Value: TdxCustomLayoutLookAndFeel);
    procedure SetIndex(Value: Integer);
    procedure SetOffsets(const Value: TdxLayoutOffsets);
    procedure SetPadding(const Value: TdxLayoutPadding);
    procedure SetParent(Value: TdxLayoutGroup);
    procedure SetShowCaption(Value: Boolean);
    procedure SetViewInfo(Value: TdxCustomLayoutItemViewInfo);
    procedure SetVisible(Value: Boolean);
    procedure SetVisibleIndex(Value: Integer);
    procedure SetSizeOptions(Value: TdxLayoutSizeOptions);

    function GetHeight: Integer;
    function GetWidth: Integer;
    procedure SetHeight(Value: Integer);
    procedure SetWidth(Value: Integer);

    procedure ReadIndex(Reader: TReader);
    procedure WriteIndex(Writer: TWriter);

    function IsAlignHorzStored: Boolean;
    function IsAlignVertStored: Boolean;
    function IsEnabledStored: Boolean;
  protected
    // IdxLayoutLookAndFeelUser
    procedure IdxLayoutLookAndFeelUser.BeginLookAndFeelDestroying = BeginLayoutLookAndFeelUserDestroying;
    procedure IdxLayoutLookAndFeelUser.EndLookAndFeelDestroying = EndLayoutLookAndFeelUserDestroying;
    procedure IdxLayoutLookAndFeelUser.LookAndFeelChanged = LayoutLookAndFeelUserChanged;
    procedure IdxLayoutLookAndFeelUser.LookAndFeelDestroyed = LayoutLookAndFeelUserDestroyed;
    procedure BeginLayoutLookAndFeelUserDestroying; stdcall;
    procedure EndLayoutLookAndFeelUserDestroying; stdcall;
    procedure LayoutLookAndFeelUserChanged; stdcall;
    procedure LayoutLookAndFeelUserDestroyed; stdcall;
    //IdxLayoutSelectableItem
    function CanDelete: Boolean; virtual;
    function IsOwner(AOwner: TComponent): Boolean; virtual;
    procedure SelectComponent(AShift: TShiftState = []); virtual;
    procedure SelectParent; virtual;
    procedure SelectionChanged; virtual;
    function IdxLayoutSelectableItem.IsVisible = IsSelectableItemVisible;
    function IsSelectableItemVisible: Boolean; virtual;
    procedure IdxLayoutSelectableItem.MakeVisible = SelectableItemMakeVisible;
    procedure SelectableItemMakeVisible; virtual;
    // IcxStoredObject
    function IcxStoredObject.GetObjectName = GetStoredObjectName;
    function IcxStoredObject.GetProperties = GetStoredProperties;
    procedure IcxStoredObject.GetPropertyValue = GetStoredPropertyValue;
    procedure IcxStoredObject.SetPropertyValue = SetStoredPropertyValue;
    function GetStoredObjectName: string; virtual;
    function GetStoredProperties(AProperties: TStrings): Boolean; virtual;
    procedure GetStoredPropertyValue(const AName: string; var AValue: Variant); virtual;
    procedure SetStoredPropertyValue(const AName: string; const AValue: Variant); virtual;

    procedure DefineProperties(Filer: TFiler); override;
    procedure Loaded; override;
    procedure SetName(const Value: TComponentName); override;
    procedure SetParentComponent(Value: TComponent); override;

    // LayoutLookAndFeel
    procedure LayoutLookAndFeelChanged; virtual;
    procedure SetInitialSettings; virtual;

    function CanBeAlone: Boolean; virtual;
    function CanDragAndDrop(const P: TPoint): Boolean; virtual;
    function CanProcessAccel(out AItem: TdxCustomLayoutItem): Boolean; virtual;
    function CanRemove: Boolean; virtual;
    function CanResizeHorz: Boolean; virtual;
    function CanResizeVert: Boolean; virtual;
    function HasControl: Boolean; virtual;
    function HasCaption: Boolean; virtual; // #DG !!!

    procedure DoGetTabOrderList(List: TList); virtual;
    procedure GetTabOrderList(List: TList);

    //inplace renaming
    function GetInplaceRenameCaption: string; virtual;
    procedure SetInplaceRenameCaption(const ACaption: string); virtual;

    procedure DoCaptionDown; dynamic;
    procedure DoCaptionClick; dynamic;
    procedure DoPack; virtual;
    function DoProcessAccel: Boolean; dynamic;

    function GetParentManagedAlignHorz: TdxLayoutAlignHorz; virtual;
    function GetParentManagedAlignVert: TdxLayoutAlignVert; virtual;
    function GetBaseName: string; virtual;
    function GetCursor(X, Y: Integer): TCursor; virtual;
    function GetIsRoot: Boolean; virtual;
    function GetLayoutLookAndFeel: TdxCustomLayoutLookAndFeel; virtual;
    function GetShowCaption: Boolean; virtual; // #DG !!!
    function GetVisible: Boolean; virtual;
    function GetOptions: TdxCustomLayoutLookAndFeelOptions; virtual; abstract;

    procedure BeforeCalculateViewInfo; virtual;
    procedure AfterCalculateViewInfo; virtual;
    procedure ApplyCalculatedChanges; virtual;

    procedure AfterRestoring; virtual;
    procedure BeforeRestoring; virtual;
    procedure CheckIndex; virtual;
    function IsNeedDeleteAfterLoading: Boolean; virtual;
    procedure PopulateItems(AList: TList); virtual;
    procedure SetLoadedInfo(const AParentName: string; AIndex: Integer);

    function IsExpanded: Boolean; virtual;

    function IsParentGroup(AParentGroup: TdxLayoutGroup): Boolean;
    function IsChildItem(AChildItem: TdxCustomLayoutItem): Boolean;

    function CanInit: Boolean; virtual;
    procedure DoInit; virtual;
    procedure Init;

    function IsAvailable: Boolean;
    function IsDesigning: Boolean;
    function IsDestroying: Boolean;
    function IsDragged: Boolean;
    function IsImageVisible: Boolean;
    function IsLoading: Boolean;
    function IsLocked: Boolean; virtual;
    function IsParentLocked: Boolean; virtual;
    function IsSelected: Boolean;
    function IsTextVisible: Boolean;
    function IsVisibleForCustomization: Boolean; virtual;
    function IsViewInfoValid: Boolean;

    procedure KeyDown(var Key: Word; Shift: TShiftState); virtual;
    procedure ProcessAccel; dynamic;
    function ProcessDialogChar(ACharCode: Word): Boolean; virtual;
    function ProcessDialogKey(ACharCode: Word; AKeyData: Integer; AFocusedItem: TdxLayoutItem): Boolean; virtual;
    procedure RestoreItemControlSize; virtual;
    procedure ResetCachedTextHeight;

    class function GetCaptionOptionsClass: TdxCustomLayoutItemCaptionOptionsClass; virtual;
    class function GetItemClassKind: Integer; virtual;
    function GetParentHelperClass: TdxLayoutGroupHelperClass;
    function GetViewInfoClass: TdxCustomLayoutItemViewInfoClass; virtual; abstract;

    procedure LoadFromIni(AIniFile: TCustomIniFile; const ASection: string; AVersion: Integer); virtual;
    procedure SaveToIni(AIniFile: TCustomIniFile; const ASection: string); virtual;

    function Focused: Boolean; virtual;

    //Notification
    procedure DoItemChanged;

    // Changing
    procedure BeginUpdate;
    procedure CancelUpdate;
    procedure EndUpdate(ANeedPack: Boolean = True);
    procedure Changed(AType: TdxLayoutItemChangeType = ictHard);
    procedure DoChanged(AType: TdxLayoutItemChangeType); virtual;
    procedure ParentChanged(AType: TdxLayoutItemChangeType);
    procedure ContainerChanged; virtual;
    procedure CustomizationChanged; virtual;
    procedure EnabledChanged; virtual;

    procedure CreateOptions; virtual;
    procedure DestroyOptions; virtual;

    function CanFocus: Boolean; virtual;
    function IsFocused: Boolean; virtual;

    property CachedTextHeight: Integer read FCachedTextHeight write FCachedTextHeight;
    property Customization: Boolean read FCustomization write SetCustomization;
    property IsUserDefined: Boolean read FIsUserDefined write FIsUserDefined;
    property LoadedIndex: Integer read FLoadedIndex;
    property Superfluous: Boolean read FSuperfluous write FSuperfluous;

//    property UserWidth: Integer read FUserWidth write FUserWidth;
    property Padding: TdxLayoutPadding read FPadding write SetPadding;
    property OnCaptionClick: TNotifyEvent read FOnCaptionClick write FOnCaptionClick;
  public
    constructor Create(AOwner: TComponent); override;
    procedure Assign(Source: TPersistent); override;
    procedure BeforeDestruction; override;
    destructor Destroy; override;
    function GetParentComponent: TComponent; override;
    function HasParent: Boolean; override;

    function CanMoveTo(AParent: TdxCustomLayoutItem): Boolean; virtual;
    procedure MakeVisible;
    function Move(AParent: TdxLayoutGroup; AIndex: Integer; APack: Boolean = False): Boolean;
    function MoveTo(AParent: TdxLayoutGroup; AVisibleIndex: Integer; APack: Boolean = False): Boolean;
    procedure Pack;
    function PutIntoHiddenGroup(ALayoutDirection: TdxLayoutDirection): TdxLayoutGroup;

    procedure ToggleHotTrackState;

    property ActuallyVisible: Boolean read GetActuallyVisible;
    property AllowRemove: Boolean read FAllowRemove write FAllowRemove default True;
    property CaptionForCustomizeForm: string read GetCaptionForCustomizeForm;
    property Container: TdxLayoutContainer read FContainer write SetContainer;
    property Data: Pointer read FData write FData;
    property Enabled: Boolean read GetEnabled write SetEnabled stored IsEnabledStored;
    property Height: Integer read GetHeight write SetHeight;
    property Index: Integer read GetIndex write SetIndex;
    property IsRoot: Boolean read GetIsRoot;
    property ViewInfo: TdxCustomLayoutItemViewInfo read GetViewInfo;
    property VisibleIndex: Integer read GetVisibleIndex write SetVisibleIndex;
    property Width: Integer read GetWidth write SetWidth;
  published
    property AutoAligns: TdxLayoutAutoAligns read GetAutoAligns write SetAutoAligns stored False; // obsolete
    property AlignHorz: TdxLayoutAlignHorz read GetAlignHorz write SetAlignHorz stored IsAlignHorzStored;
    property AlignVert: TdxLayoutAlignVert read GetAlignVert write SetAlignVert stored IsAlignVertStored;
    property AlignmentConstraint: TdxLayoutAlignmentConstraint read FAlignmentConstraint
      write SetAlignmentConstraint;

    property Caption: string read GetCaption write SetCaption stored False; // obsolete
    property CaptionOptions: TdxCustomLayoutItemCaptionOptions read FCaptionOptions write SetCaptionOptions;
    property LookAndFeel: TdxCustomLayoutLookAndFeel read FLayoutLookAndFeel write SetLayoutLookAndFeel stored False; // osolette
    property LayoutLookAndFeel: TdxCustomLayoutLookAndFeel read FLayoutLookAndFeel write SetLayoutLookAndFeel;
    property Offsets: TdxLayoutOffsets read FOffsets write SetOffsets;
    property Parent: TdxLayoutGroup read FParent write SetParent;
    property ShowCaption: Boolean read GetShowCaption write SetShowCaption stored False; // obsolete
    property Visible: Boolean read FVisible write SetVisible default True;
    property SizeOptions: TdxLayoutSizeOptions read FSizeOptions write SetSizeOptions;
  end;

  TdxLayoutBasicItem = class(TdxCustomLayoutItem)
  protected
    function GetViewInfoClass: TdxCustomLayoutItemViewInfoClass; override;
  end;

  // Auxiliary Items

  TdxLayoutNonLabeledItemCaptionOptions = class(TdxCustomLayoutItemCaptionOptions)
  published
    property Text;
  end;

  TdxLayoutNonLabeledItem = class(TdxLayoutBasicItem)
  private
    function GetCaptionOptions: TdxLayoutNonLabeledItemCaptionOptions; {$IFDEF DELPHI9} inline; {$ENDIF}
    procedure SetCaptionOptions(Value: TdxLayoutNonLabeledItemCaptionOptions); {$IFDEF DELPHI9} inline; {$ENDIF}
  protected
    class function GetCaptionOptionsClass: TdxCustomLayoutItemCaptionOptionsClass; override;
  published
    property Enabled;
    property CaptionOptions: TdxLayoutNonLabeledItemCaptionOptions read GetCaptionOptions write SetCaptionOptions;
  end;

  TdxLayoutEmptySpaceItem = class(TdxLayoutNonLabeledItem)
  protected
    function GetBaseName: string; override;
    class function GetItemClassKind: Integer; override;
    function GetViewInfoClass: TdxCustomLayoutItemViewInfoClass; override;

    function CanBeAlone: Boolean; override;
  end;

  TdxLayoutDirectionalItem = class(TdxLayoutNonLabeledItem)
  private
    function GetIsVertical: Boolean;
  protected
    function GetViewInfoClass: TdxCustomLayoutItemViewInfoClass; override;

    function CanBeAlone: Boolean; override;
    function GetOptions: TdxCustomLayoutLookAndFeelOptions; override;
  public
    constructor Create(AOwner: TComponent); override;

    property IsVertical: Boolean read GetIsVertical;
  end;

  TdxLayoutSeparatorItem = class(TdxLayoutDirectionalItem)
  protected
    class function GetItemClassKind: Integer; override;
    function GetBaseName: string; override;
    function GetViewInfoClass: TdxCustomLayoutItemViewInfoClass; override;
  end;

  TdxLayoutSplitterItem = class(TdxLayoutDirectionalItem)
  protected
    class function GetItemClassKind: Integer; override;
    function GetBaseName: string; override;
    function GetViewInfoClass: TdxCustomLayoutItemViewInfoClass; override;
  end;

  TdxCustomLayoutItemStorableCaptionOptions = class(TdxCustomLayoutItemCaptionOptions)
  protected
    procedure GetStoredPropertyValue(const AName: string; var AValue: Variant); override;
    procedure GetStoredProperties(AProperties: TStrings); override;
    procedure SetStoredPropertyValue(const AName: string; const AValue: Variant); override;
  end;

  TdxLayoutLabeledItemCustomCaptionOptions = class(TdxCustomLayoutItemStorableCaptionOptions)
  private
    FCursor: TCursor;
    FWidth: Integer;
    procedure SetWidth(Value: Integer);
  protected
    property Cursor: TCursor read FCursor write FCursor default crDefault;
  public
    constructor Create(AItem: TdxCustomLayoutItem); override;
    procedure Assign(Source: TPersistent); override;

    property AlignHorz;
    property AlignVert default tavCenter;
    property Glyph;
    property ImageIndex;
    property VisibleElements;
    property Width: Integer read FWidth write SetWidth default 0;
  end;

  TdxLayoutCustomLabeledItem = class(TdxLayoutBasicItem)
  private
    function GetCaptionOptions: TdxLayoutLabeledItemCustomCaptionOptions; {$IFDEF DELPHI9} inline; {$ENDIF}
    procedure SetCaptionOptions(Value: TdxLayoutLabeledItemCustomCaptionOptions); {$IFDEF DELPHI9} inline; {$ENDIF}
  protected
    function GetParentManagedAlignVert: TdxLayoutAlignVert; override;

    class function GetCaptionOptionsClass: TdxCustomLayoutItemCaptionOptionsClass; override;
    function GetOptions: TdxCustomLayoutLookAndFeelOptions; override;
    function GetViewInfoClass: TdxCustomLayoutItemViewInfoClass; override;

    property CaptionOptions: TdxLayoutLabeledItemCustomCaptionOptions
      read GetCaptionOptions write SetCaptionOptions;
  published
    property Padding;
  end;

  TdxLayoutLabeledItemCaptionOptions = class(TdxLayoutLabeledItemCustomCaptionOptions)
  published
    property AlignHorz;
    property AlignVert;
    property Cursor;
    property Glyph;
    property ImageIndex;
    property ShowAccelChar;
    property Text;
    property Visible;
    property VisibleElements;
    property Width;
  end;

  TdxLayoutLabeledItem = class(TdxLayoutCustomLabeledItem)
  private
    function GetCaptionOptions: TdxLayoutLabeledItemCaptionOptions; {$IFDEF DELPHI9} inline; {$ENDIF}
    procedure SetCaptionOptions(Value: TdxLayoutLabeledItemCaptionOptions); {$IFDEF DELPHI9} inline; {$ENDIF}
  protected
    function GetBaseName: string; override;
    class function GetCaptionOptionsClass: TdxCustomLayoutItemCaptionOptionsClass; override;
    class function GetItemClassKind: Integer; override;
  published
    property AllowRemove;
    property CaptionOptions: TdxLayoutLabeledItemCaptionOptions read GetCaptionOptions write SetCaptionOptions;
    property Enabled;
    property OnCaptionClick;
  end;

  // item
  TdxCustomLayoutControlAdapter = class(TPersistent)
  private
    FItem: TdxLayoutItem;
    function GetControl: TControl;
    function GetLayoutLookAndFeel: TdxCustomLayoutLookAndFeel;
  protected
    function AllowCheckSize: Boolean; virtual;
    procedure HideControlBorder; virtual;
    procedure Init; virtual;

    procedure AfterCalculateViewInfo; virtual;
    procedure InternalSetInitialSettings; virtual;
    function NeedBorder: Boolean; virtual;
    function HasBorderProperty: Boolean;
    function ShowItemCaption: Boolean; virtual;
    function UseItemColor: Boolean; virtual;
    //Customization
    procedure BeginCustomization; virtual;
    procedure EndCustomization; virtual;

    property Control: TControl read GetControl;
    property Item: TdxLayoutItem read FItem;
    property LayoutLookAndFeel: TdxCustomLayoutLookAndFeel read GetLayoutLookAndFeel;
  public
    constructor Create(AItem: TdxLayoutItem); virtual;
    procedure SetInitialSettings; virtual;
    class procedure Register(AControlClass: TControlClass);
    class procedure Unregister(AControlClass: TControlClass);
  end;
  TdxCustomLayoutControlAdapterClass = class of TdxCustomLayoutControlAdapter;

  TdxLayoutItemCaptionOptions = class(TdxLayoutLabeledItemCaptionOptions)
  published
    property Layout default clLeft;
  end;

  TdxLayoutItemControlOptions = class(TdxCustomLayoutItemOptions)
  private
    FAlignHorz: TdxLayoutItemControlAlignHorz;
    FAlignVert: TdxLayoutItemControlAlignVert;
    FAutoControlAreaAlignment: Boolean;
    FAutoColor: Boolean;
    FMinHeight: Integer;
    FMinWidth: Integer;
    FOpaque: Boolean;
    FShowBorder: Boolean;
    function GetFixedSize: Boolean;
    function GetItem: TdxLayoutItem;
    procedure SetAlignHorz(Value: TdxLayoutItemControlAlignHorz);
    procedure SetAlignVert(Value: TdxLayoutItemControlAlignVert);
    procedure SetAutoControlAreaAlignment(Value: Boolean);
    procedure SetAutoColor(Value: Boolean);
    procedure SetFixedSize(Value: Boolean);
    procedure SetMinHeight(Value: Integer);
    procedure SetMinWidth(Value: Integer);
    procedure SetOpaque(Value: Boolean);
    procedure SetShowBorder(Value: Boolean);
  protected
    property Item: TdxLayoutItem read GetItem;
  public
    constructor Create(AItem: TdxCustomLayoutItem); override;

    function IsHeightFixed: Boolean;
    function IsWidthFixed: Boolean;
  published
    property AlignHorz: TdxLayoutItemControlAlignHorz read FAlignHorz write SetAlignHorz default ahClient;
    property AlignVert: TdxLayoutItemControlAlignVert read FAlignVert write SetAlignVert default avClient;
    property AutoAlignment: Boolean read FAutoControlAreaAlignment write SetAutoControlAreaAlignment stored False; // obsolete
    property AutoControlAreaAlignment: Boolean read FAutoControlAreaAlignment write SetAutoControlAreaAlignment default True;
    property AutoColor: Boolean read FAutoColor write SetAutoColor default False;
    property FixedSize: Boolean read GetFixedSize write SetFixedSize stored False; // deprecated 'Use AlignHorz and AlignVert';
    property MinHeight: Integer read FMinHeight write SetMinHeight default dxLayoutItemControlDefaultMinHeight;
    property MinWidth: Integer read FMinWidth write SetMinWidth default dxLayoutItemControlDefaultMinWidth;
    property Opaque: Boolean read FOpaque write SetOpaque default False;
    property ShowBorder: Boolean read FShowBorder write SetShowBorder default True;
  end;
  TdxLayoutItemControlOptionsClass = class of TdxLayoutItemControlOptions;

  TdxLayoutControlItem = class(TdxLayoutCustomLabeledItem)
  private
    FControlOptions: TdxLayoutItemControlOptions;
    FOriginalControlSize: TPoint;
    function GetViewInfo: TdxLayoutControlItemViewInfo;
    procedure SetControlOptions(Value: TdxLayoutItemControlOptions);
  protected
    procedure DoInit; override;
    class function GetCaptionOptionsClass: TdxCustomLayoutItemCaptionOptionsClass; override;
    function GetViewInfoClass: TdxCustomLayoutItemViewInfoClass; override;

    procedure CreateOptions; override;
    procedure DestroyOptions; override;

    function CanFocusControl: Boolean; virtual;
    function GetControlOptionsClass: TdxLayoutItemControlOptionsClass; virtual;

    property ControlOptions: TdxLayoutItemControlOptions read FControlOptions write SetControlOptions;
  public
    property OriginalControlSize: TPoint read FOriginalControlSize write FOriginalControlSize;
    property ViewInfo: TdxLayoutControlItemViewInfo read GetViewInfo;
  end;

  TdxLayoutItem = class(TdxLayoutControlItem)
  private
    FControl: TControl;
    FControlLocked: Boolean;
    FControlAdapter: TdxCustomLayoutControlAdapter;
    FControlSizeBeforeDestruction: TPoint;

    FIsNewControlSizeAssigned: Boolean;
    FNewControlSize: TPoint;
    FControlSizeChanged: Boolean;

    FCustomizeControlHelper: TdxControlsDesignSelectorHelper;
    FWindowProcObject: TcxWindowProcLinkedObject;

    function GetCaptionOptions: TdxLayoutItemCaptionOptions; {$IFDEF DELPHI9} inline; {$ENDIF}
    function GetDesignSelectorRect: TRect;
    function GetViewInfo: TdxLayoutItemViewInfo;
    function GetWinControl: TWinControl;
    procedure SetCaptionOptions(Value: TdxLayoutItemCaptionOptions); {$IFDEF DELPHI9} inline; {$ENDIF}
    procedure SetControl(Value: TControl);

    function CanFocusControlOnCaptionClick: Boolean;
    procedure CreateControlAdapter;
  protected
    class function GetItemClassKind: Integer; override;

    // CustomItem
    function CanDelete: Boolean; override;
    function CanProcessAccel(out AItem: TdxCustomLayoutItem): Boolean; override;
    procedure ContainerChanged; override;
    procedure CustomizationChanged; override;
    procedure DoCaptionDown; override;
    procedure DoGetTabOrderList(List: TList); override;
    function GetBaseName: string; override;
    procedure ProcessAccel; override;
    procedure RestoreItemControlSize; override;

    procedure AfterCalculateViewInfo; override;
    procedure BeforeCalculateViewInfo; override;
    procedure ApplyCalculatedChanges; override;
    procedure SetInitialSettings; override;

    class function GetCaptionOptionsClass: TdxCustomLayoutItemCaptionOptionsClass; override;
    function GetViewInfoClass: TdxCustomLayoutItemViewInfoClass; override;

    function CanDragAndDrop(const P: TPoint): Boolean; override;
    function CanFocusControl: Boolean; override;
    procedure ControlWndProc(var Message: TMessage); virtual;
    function IsDesignSelectorVisible: Boolean;
    function HasControl: Boolean; override;
    function HasWinControl: Boolean;
    procedure SaveControlSizeBeforeDestruction;
    procedure SaveOriginalControlSize;
    procedure SetControlEnablement;
    procedure SetControlFocus;
    procedure SetControlVisibility;
    procedure UpdateDesignSelectors;

    property ControlAdapter: TdxCustomLayoutControlAdapter read FControlAdapter;
    property ControlLocked: Boolean read FControlLocked;
    property ControlSizeBeforeDestruction: TPoint read FControlSizeBeforeDestruction;
    property DesignSelectorRect: TRect read GetDesignSelectorRect;
    property WinControl: TWinControl read GetWinControl;
  public
    destructor Destroy; override;

    property ViewInfo: TdxLayoutItemViewInfo read GetViewInfo;
  published
    property AllowRemove;
    property CaptionOptions: TdxLayoutItemCaptionOptions read GetCaptionOptions write SetCaptionOptions;
    property Control: TControl read FControl write SetControl;
    property ControlOptions;
    property Enabled;
    property OnCaptionClick;
  end;

  TdxLayoutItemClass = class of TdxLayoutItem;

  TdxLayoutTabbedOptions = class(TcxCustomTabControlProperties)
  private
    FInternalImages: TcxImageList;
    function GetGroup: TdxLayoutGroup;
    function GetInternalImages: TcxImageList;
    function GetItemCaption(AItem: TdxCustomLayoutItem): string;
  protected
    function CanChange(NewTabIndex: Integer): Boolean; override;
    procedure CheckTabs;
    procedure DeleteTab(AItem: TdxCustomLayoutItem);
    function GetItem(AIndex: Integer): TdxCustomLayoutItem;
    procedure InsertTab(AItem: TdxCustomLayoutItem);
    procedure RefreshImages;
    procedure RefreshTabsCaption;
    procedure RefreshTabsEnabled;
    procedure RefreshTabsVisible;
    property Group: TdxLayoutGroup read GetGroup;
    property InternalImages: TcxImageList read GetInternalImages;
  public
    constructor Create(AOwner: TPersistent); override;
    destructor Destroy; override;
  published
    property CloseButtonMode;
    property CloseTabWithMiddleClick;
    property HideTabs;
    property HotTrack;
    property ImageBorder;
    property MultiLine;
    property NavigatorPosition;
    property Options;
    property RaggedRight;
    property Rotate;
    property RotatedTabsMaxWidth;
    property ScrollOpposite;
    property ShowFrame;
    property TabCaptionAlignment;
    property TabHeight;
    property TabPosition;
    property TabWidth;
  end;

  TdxLayoutGroupButtons = class;
  TdxLayoutGroupButtonOptions = class;

  TdxLayoutGroupButton = class(TCollectionItem)
  private
    FEnabled: Boolean;
    FGlyph: TBitmap;
    FHeight: Cardinal;
    FHint: string;
    FTag: Integer;
    FVisible: Boolean;
    FWidth: Cardinal;
    FOnClick: TNotifyEvent;
    FOnExpandButtonClick: TNotifyEvent;
    function GetButtons: TdxLayoutGroupButtons;
    procedure SetEnabled(AValue: Boolean);
    procedure SetGlyph(AValue: TBitmap);
    procedure SetHeight(AValue: Cardinal);
    procedure SetVisible(AValue: Boolean);
    procedure SetWidth(AValue: Cardinal);
  protected
    function GetHeight: Integer;
    function GetWidth: Integer;
    procedure DoClick;
    function IsExpandButton: Boolean;

    property Buttons: TdxLayoutGroupButtons read GetButtons;
    property OnExpandButtonClick: TNotifyEvent read FOnExpandButtonClick write FOnExpandButtonClick;
  public
    constructor Create(Collection: TCollection); override;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
    function GetNamePath: string; override;
  published
    property Enabled: Boolean read FEnabled write SetEnabled default True;
    property Glyph: TBitmap read FGlyph write SetGlyph;
    property Height: Cardinal read FHeight write SetHeight default 0;
    property Hint: string read FHint write FHint;
    property Tag: Integer read FTag write FTag default 0;
    property Visible: Boolean read FVisible write SetVisible default True;
    property Width: Cardinal read FWidth write SetWidth default 0;
    property OnClick: TNotifyEvent read FOnClick write FOnClick;
  end;

  TdxLayoutGroupButtons = class(TCollection)
  private
    FOptions: TdxLayoutGroupButtonOptions;
    FOnChange: TNotifyEvent;
    function GetItem(Index: Integer): TdxLayoutGroupButton;
    function GetOptions: TdxLayoutGroupButtonOptions;
    procedure SetItem(Index: Integer; const AValue: TdxLayoutGroupButton);
  protected
    function GetOwner: TPersistent; override;
    procedure Update(Item: TCollectionItem); override;

    property Options: TdxLayoutGroupButtonOptions read GetOptions;
  public
    constructor Create(AOptions: TdxLayoutGroupButtonOptions);

    property Items[Index: Integer]: TdxLayoutGroupButton read GetItem write SetItem; default;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
  end;

  TdxLayoutGroupButtonsAlignment = (gbaLeft, gbaRight);

  TdxLayoutGroupButtonOptions = class(TPersistent)
  private
    FAlignment: TdxLayoutGroupButtonsAlignment;
    FButtons: TdxLayoutGroupButtons;
    FDefaultHeight: Cardinal;
    FDefaultWidth: Cardinal;
    FExpandButton: TdxLayoutGroupButton;
    FGroup: TdxLayoutGroup;
    FInternalButtons: TdxLayoutGroupButtons;
    FVisible: Boolean;
    procedure ChangeCollectionHandler(Sender: TObject);
    procedure ExpandButtonClickHandler(Sender: TObject);
    function GetShowExpandButton: Boolean;
    function GetVisibleCount: Integer;
    procedure SetAlignment(AValue: TdxLayoutGroupButtonsAlignment);
    procedure SetButtons(AValue: TdxLayoutGroupButtons);
    procedure SetDefaultHeight(AValue: Cardinal);
    procedure SetDefaultWidth(AValue: Cardinal);
    procedure SetShowExpandButton(AValue: Boolean);
    procedure SetVisible(AValue: Boolean);
  protected
    function GetOwner: TPersistent; override;
    procedure Changed;
    function IsAnyButtonVisible: Boolean;
  public
    constructor Create(AGroup: TdxLayoutGroup);
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;

    property ExpandButton: TdxLayoutGroupButton read FExpandButton;
    property Group: TdxLayoutGroup read FGroup;
    property VisibleCount: Integer read GetVisibleCount;
  published
    property Alignment: TdxLayoutGroupButtonsAlignment read FAlignment write SetAlignment default gbaRight;
    property Buttons: TdxLayoutGroupButtons read FButtons write SetButtons;
    property DefaultHeight: Cardinal read FDefaultHeight write SetDefaultHeight default 16;
    property DefaultWidth: Cardinal read FDefaultWidth write SetDefaultWidth default 16;
    property ShowExpandButton: Boolean read GetShowExpandButton write SetShowExpandButton default False;
    property Visible: Boolean read FVisible write SetVisible default True;
  end;

  TdxLayoutGroupCaptionOptions = class(TdxCustomLayoutItemStorableCaptionOptions)
  public
    constructor Create(AItem: TdxCustomLayoutItem); override;
  published
    property AlignHorz;
    property AlignVert default tavTop;
    property Glyph;
    property ImageIndex;
    property Layout default clTop;
    property ShowAccelChar;
    property Text;
    property Visible;
    property VisibleElements;
  end;

  TdxLayoutItemControlAreaAlignment = (catDefault, catNone, catAuto, catOwn);

  TdxLayoutGroupExpandingEvent = procedure(Sender: TObject; var Allow: Boolean) of object;
  TdxLayoutGroupTabChangingEvent = procedure(Sender: TObject; ANewTabIndex: Integer; var Allow: Boolean) of object;

  TdxLayoutGroup = class(TdxCustomLayoutItem, IcxControlComponentState)
  private
    FButtonOptions: TdxLayoutGroupButtonOptions;
    FExpanded: Boolean;
    FHidden: Boolean;
    FItems: TcxComponentList;
    FItemIndex: Integer;
    FVisibleItems: TcxComponentList;
    FLayoutDirection: TdxLayoutDirection;
    FItemControlAreaAlignment: TdxLayoutItemControlAreaAlignment;
    FLocked: Boolean;
    FLayoutLookAndFeelException: Boolean;
    FShowBorder: Boolean;
    FLockTabbedChangesCount: Integer;
    FTabbedOptions: TdxLayoutTabbedOptions;
    FUseIndent: Boolean;

    FOnCollapsed: TNotifyEvent;
    FOnCollapsing: TdxLayoutGroupExpandingEvent;
    FOnExpanded: TNotifyEvent;
    FOnExpanding: TdxLayoutGroupExpandingEvent;
    FOnTabChanged: TNotifyEvent;
    FOnTabChanging: TdxLayoutGroupTabChangingEvent;

    procedure TabbedOptionsChangedHandler(Sender: TObject; AType: TcxCustomTabControlPropertiesChangedType);
    procedure TabbedOptionsChangeHandler(Sender: TObject);
    procedure TabCanCloseHandler(Sender: TObject; ATabIndex: Integer; var ACanClose: Boolean);
    procedure TabClickHandler(Sender: TObject; ATabVisibleIndex: Integer; AShift: TShiftState);
    procedure TabCloseHandler(Sender: TObject; ATabIndex: Integer);

    function GetCaptionOptions: TdxLayoutGroupCaptionOptions; {$IFDEF DELPHI9} inline; {$ENDIF}
    function GetCount: Integer;
    function GetItem(Index: Integer): TdxCustomLayoutItem;
    function GetShowBorder: Boolean;
    function GetViewInfo: TdxLayoutGroupViewInfo;
    function GetVisibleCount: Integer;
    function GetVisibleItem(Index: Integer): TdxCustomLayoutItem;
    procedure SetButtonOptions(Value: TdxLayoutGroupButtonOptions);
    procedure SetCaptionOptions(Value: TdxLayoutGroupCaptionOptions); {$IFDEF DELPHI9} inline; {$ENDIF}
    procedure SetExpanded(Value: Boolean);
    procedure SetHidden(Value: Boolean);
    procedure SetItemIndex(Value: Integer);
    procedure SetItemControlAreaAlignment(Value: TdxLayoutItemControlAreaAlignment);
    procedure SetLayoutDirection(Value: TdxLayoutDirection);
    procedure SetLocked(Value: Boolean);
    procedure SetLayoutLookAndFeelException(Value: Boolean);
    procedure SetShowBorder(Value: Boolean);
    procedure SetTabbedOptions(Value: TdxLayoutTabbedOptions);
    procedure SetUseIndent(Value: Boolean);

    procedure AddItem(AItem: TdxCustomLayoutItem);
    procedure ExtractItem(AItem: TdxCustomLayoutItem);
    procedure ItemListChanged(Sender: TObject; AComponent: TComponent; AAction: TcxComponentCollectionNotification);

    procedure ReadSpecial(Reader: TReader);
    procedure WriteSpecial(Writer: TWriter);

    function IsItemIndexStored: Boolean;
    function GetChildLayoutLookAndFeel: TdxCustomLayoutLookAndFeel;
  protected
    procedure DefineProperties(Filer: TFiler); override;
    class function GetItemClassKind: Integer; override;
    procedure SetParentComponent(Value: TComponent); override;
    // storing
    function GetStoredProperties(AProperties: TStrings): Boolean; override;
    procedure GetStoredPropertyValue(const AName: string; var AValue: Variant); override;
    procedure SetStoredPropertyValue(const AName: string; const AValue: Variant); override;

    procedure CheckIndex; override;
    function IsNeedDeleteAfterLoading: Boolean; override;
    procedure PopulateItems(AList: TList); override;

    // TdxCustomLayoutItem
    function CanDelete: Boolean; override;
    function CanProcessAccel(out AItem: TdxCustomLayoutItem): Boolean; override;
    function CanRemove: Boolean; override;
    procedure ContainerChanged; override;
    procedure DoGetTabOrderList(List: TList); override;
    procedure DoPack; override;
    class function GetCaptionOptionsClass: TdxCustomLayoutItemCaptionOptionsClass; override;
    function GetBaseName: string; override;
    function GetIsRoot: Boolean; override;
    function GetShowCaption: Boolean; override;
    function GetVisible: Boolean; override;
    function GetViewInfoClass: TdxCustomLayoutItemViewInfoClass; override;
    procedure LoadFromIni(AIniFile: TCustomIniFile; const ASection: string; AVersion: Integer); override;
    procedure SaveToIni(AIniFile: TCustomIniFile; const ASection: string); override;
    function ProcessDialogChar(ACharCode: Word): Boolean; override;
    function ProcessDialogKey(ACharCode: Word; AKeyData: Integer; AFocusedItem: TdxLayoutItem): Boolean; override;
    procedure RestoreItemControlSize; override;

    procedure LayoutLookAndFeelChanged; override;
    procedure SetInitialSettings; override;
    procedure BeforeCalculateViewInfo; override;
    procedure AfterCalculateViewInfo; override;
    procedure ApplyCalculatedChanges; override;

    function GetOptions: TdxCustomLayoutLookAndFeelOptions; override;

    function IsExpanded: Boolean; override;
    function IsLocked: Boolean; override;

    procedure CreateOptions; override;
    procedure DestroyOptions; override;

    // Events
    procedure DoCollapsed; virtual;
    function DoCollapsing: Boolean; virtual;
    procedure DoExpanded; virtual;
    function DoExpanding: Boolean; virtual;
    procedure DoTabChanged; virtual;
    function DoTabChanging(ANewTabIndex: Integer): Boolean; virtual;

    procedure BuildVisibleItemsList;
    function GetMaxChildImageSize: TSize;
    function GetHelperClass: TdxLayoutGroupHelperClass;

    function CanFocus: Boolean; override;

    function AllowShowChild(AChild: TdxCustomLayoutItem): Boolean; virtual;
    function IsAnyButtonVisible: Boolean;

    procedure LockTabbedChanges;
    procedure UnlockTabbedChanges;

    procedure ChangeItemIndex(AItem: TdxCustomLayoutItem; Value: Integer);
    procedure ChangeItemVisibleIndex(AItem: TdxCustomLayoutItem; Value: Integer);
    function GetItemIndex(AItemVisibleIndex: Integer): Integer;
    function IndexOf(AItem: TdxCustomLayoutItem): Integer;
    function IsSuperfluous: Boolean;
    function VisibleIndexOf(AItem: TdxCustomLayoutItem): Integer;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;

    function CreateGroup(): TdxLayoutGroup;   // 注意：需改造原始文件
    function CreateItem(AItemClass: TdxCustomLayoutItemClass = nil): TdxCustomLayoutItem;
    function CreateItemForControl(AControl: TControl): TdxLayoutItem;

    function CanMoveTo(AParent: TdxCustomLayoutItem): Boolean; override;
    procedure MoveChildrenToParent;
    function PutChildrenIntoHiddenGroup: TdxLayoutGroup;

    property Count: Integer read GetCount;
    property Items[Index: Integer]: TdxCustomLayoutItem read GetItem; default;
    property IsUserDefined;
    property ViewInfo: TdxLayoutGroupViewInfo read GetViewInfo;
    property VisibleCount: Integer read GetVisibleCount;
    property VisibleItems[Index: Integer]: TdxCustomLayoutItem read GetVisibleItem;
  published
    property AllowRemove;
    property ButtonOptions: TdxLayoutGroupButtonOptions read FButtonOptions write SetButtonOptions;
    property CaptionOptions: TdxLayoutGroupCaptionOptions read GetCaptionOptions write SetCaptionOptions;
    property Enabled;
    property Expanded: Boolean read FExpanded write SetExpanded default True;
    property Hidden: Boolean read FHidden write SetHidden default False;
    property ItemControlAreaAlignment: TdxLayoutItemControlAreaAlignment read FItemControlAreaAlignment write SetItemControlAreaAlignment default catDefault;
    property ItemIndex: Integer read FItemIndex write SetItemIndex stored IsItemIndexStored;
    property LayoutDirection: TdxLayoutDirection read FLayoutDirection write SetLayoutDirection default ldVertical;
    property Locked: Boolean read FLocked write SetLocked default False;
    property LookAndFeelException: Boolean read FLayoutLookAndFeelException write SetLayoutLookAndFeelException stored False; // obsolete
    property LayoutLookAndFeelException: Boolean read FLayoutLookAndFeelException write SetLayoutLookAndFeelException default False;
    property Padding;
    property ShowBorder: Boolean read GetShowBorder write SetShowBorder default True;
    property TabbedOptions: TdxLayoutTabbedOptions read FTabbedOptions write SetTabbedOptions;
    property UseIndent: Boolean read FUseIndent write SetUseIndent default True;
    property OnCaptionClick;
    property OnCollapsed: TNotifyEvent read FOnCollapsed write FOnCollapsed;
    property OnCollapsing: TdxLayoutGroupExpandingEvent read FOnCollapsing write FOnCollapsing;
    property OnExpanded: TNotifyEvent read FOnExpanded write FOnExpanded;
    property OnExpanding: TdxLayoutGroupExpandingEvent read FOnExpanding write FOnExpanding;
    property OnTabChanged: TNotifyEvent read FOnTabChanged write FOnTabChanged;
    property OnTabChanging: TdxLayoutGroupTabChangingEvent read FOnTabChanging write FOnTabChanging;
  end;



 

implementation


end.
