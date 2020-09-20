unit IMPORT_dxLayoutControl;
interface
uses
  Messages,
  Windows,
  SysUtils,
  Classes,
  Menus,
  Graphics,
  DB,
  Forms,
  Controls,
  StdCtrls,
  ExtCtrls,
  IniFiles,
  Contnrs,
  ImgList,
  dxCore,
  dxCoreClasses,
  dxMessages,
  cxClasses,
  cxGeometry,
  cxGraphics,
  cxControls,
  cxLookAndFeels,
  cxLibraryConsts,
  cxLookAndFeelPainters,
  cxDBEdit,
  dxLayoutLookAndFeels,
  dxLayoutCommon,
  dxLayoutSelection,
  cxPC,
  dxLayoutContainer,
  dxLayoutControl,
  Variants,
  PaxCompiler,
  PaxRegister;
procedure RegisterIMPORT_dxLayoutControl;
implementation
function TdxLayoutControlPersistent_GetControl(Self:TdxLayoutControlPersistent):TdxCustomLayoutControl;
begin
  result := Self.Control;
end;
function TdxLayoutControlContainer_GetControl(Self:TdxLayoutControlContainer):TdxCustomLayoutControl;
begin
  result := Self.Control;
end;
function TdxLayoutControlContainer_GetViewInfo(Self:TdxLayoutControlContainer):TdxLayoutControlContainerViewInfo;
begin
  result := Self.ViewInfo;
end;
function TdxCustomLayoutControl_GetAutoContentSizes(Self:TdxCustomLayoutControl):TdxLayoutAutoContentSizes;
begin
  result := Self.AutoContentSizes;
end;
procedure TdxCustomLayoutControl_PutAutoContentSizes(Self:TdxCustomLayoutControl;const Value: TdxLayoutAutoContentSizes);
begin
  Self.AutoContentSizes := Value;
end;
function TdxCustomLayoutControl_GetContainer(Self:TdxCustomLayoutControl):TdxLayoutControlContainer;
begin
  result := Self.Container;
end;
function TdxCustomLayoutControl_GetLayoutDirection(Self:TdxCustomLayoutControl):TdxLayoutDirection;
begin
  result := Self.LayoutDirection;
end;
procedure TdxCustomLayoutControl_PutLayoutDirection(Self:TdxCustomLayoutControl;const Value: TdxLayoutDirection);
begin
  Self.LayoutDirection := Value;
end;
function TdxCustomLayoutControl_GetLookAndFeel(Self:TdxCustomLayoutControl):TdxCustomLayoutLookAndFeel;
begin
  result := Self.LookAndFeel;
end;
procedure TdxCustomLayoutControl_PutLookAndFeel(Self:TdxCustomLayoutControl;const Value: TdxCustomLayoutLookAndFeel);
begin
  Self.LookAndFeel := Value;
end;
function TdxCustomLayoutControl_GetLayoutLookAndFeel(Self:TdxCustomLayoutControl):TdxCustomLayoutLookAndFeel;
begin
  result := Self.LayoutLookAndFeel;
end;
procedure TdxCustomLayoutControl_PutLayoutLookAndFeel(Self:TdxCustomLayoutControl;const Value: TdxCustomLayoutLookAndFeel);
begin
  Self.LayoutLookAndFeel := Value;
end;
function TdxCustomLayoutControl_GetRedrawOnResize(Self:TdxCustomLayoutControl):Boolean;
begin
  result := Self.RedrawOnResize;
end;
procedure TdxCustomLayoutControl_PutRedrawOnResize(Self:TdxCustomLayoutControl;const Value: Boolean);
begin
  Self.RedrawOnResize := Value;
end;
function TdxCustomLayoutControl_GetCustomization(Self:TdxCustomLayoutControl):Boolean;
begin
  result := Self.Customization;
end;
procedure TdxCustomLayoutControl_PutCustomization(Self:TdxCustomLayoutControl;const Value: Boolean);
begin
  Self.Customization := Value;
end;
function TdxCustomLayoutControl_GetCustomizeAvailableItemsViewKind(Self:TdxCustomLayoutControl):TdxLayoutAvailableItemsViewKind;
begin
  result := Self.CustomizeAvailableItemsViewKind;
end;
procedure TdxCustomLayoutControl_PutCustomizeAvailableItemsViewKind(Self:TdxCustomLayoutControl;const Value: TdxLayoutAvailableItemsViewKind);
begin
  Self.CustomizeAvailableItemsViewKind := Value;
end;
function TdxCustomLayoutControl_GetCustomizeForm(Self:TdxCustomLayoutControl):TdxLayoutControlCustomCustomizeForm;
begin
  result := Self.CustomizeForm;
end;
function TdxCustomLayoutControl_GetCustomizeFormBounds(Self:TdxCustomLayoutControl):TRect;
begin
  result := Self.CustomizeFormBounds;
end;
procedure TdxCustomLayoutControl_PutCustomizeFormBounds(Self:TdxCustomLayoutControl;const Value: TRect);
begin
  Self.CustomizeFormBounds := Value;
end;
function TdxCustomLayoutControl_GetCustomizeFormClass(Self:TdxCustomLayoutControl):TdxLayoutControlCustomCustomizeFormClass;
begin
  result := Self.CustomizeFormClass;
end;
procedure TdxCustomLayoutControl_PutCustomizeFormClass(Self:TdxCustomLayoutControl;const Value: TdxLayoutControlCustomCustomizeFormClass);
begin
  Self.CustomizeFormClass := Value;
end;
function TdxCustomLayoutControl_GetCustomizeFormTabbedView(Self:TdxCustomLayoutControl):Boolean;
begin
  result := Self.CustomizeFormTabbedView;
end;
procedure TdxCustomLayoutControl_PutCustomizeFormTabbedView(Self:TdxCustomLayoutControl;const Value: Boolean);
begin
  Self.CustomizeFormTabbedView := Value;
end;
function TdxCustomLayoutControl_GetShowDesignSelectors(Self:TdxCustomLayoutControl):Boolean;
begin
  result := Self.ShowDesignSelectors;
end;
procedure TdxCustomLayoutControl_PutShowDesignSelectors(Self:TdxCustomLayoutControl;const Value: Boolean);
begin
  Self.ShowDesignSelectors := Value;
end;
function TdxCustomLayoutControl_GetHighlightRoot(Self:TdxCustomLayoutControl):Boolean;
begin
  result := Self.HighlightRoot;
end;
procedure TdxCustomLayoutControl_PutHighlightRoot(Self:TdxCustomLayoutControl;const Value: Boolean);
begin
  Self.HighlightRoot := Value;
end;
function TdxCustomLayoutControl_GetContentBounds(Self:TdxCustomLayoutControl):TRect;
begin
  result := Self.ContentBounds;
end;
function TdxCustomLayoutControl_GetOccupiedClientWidth(Self:TdxCustomLayoutControl):Integer;
begin
  result := Self.OccupiedClientWidth;
end;
function TdxCustomLayoutControl_GetOccupiedClientHeight(Self:TdxCustomLayoutControl):Integer;
begin
  result := Self.OccupiedClientHeight;
end;
function TdxCustomLayoutControl_GetOptionsImage(Self:TdxCustomLayoutControl):TdxLayoutImageOptions;
begin
  result := Self.OptionsImage;
end;
procedure TdxCustomLayoutControl_PutOptionsImage(Self:TdxCustomLayoutControl;const Value: TdxLayoutImageOptions);
begin
  Self.OptionsImage := Value;
end;
function TdxCustomLayoutControl_GetOptionsItem(Self:TdxCustomLayoutControl):TdxLayoutItemOptions;
begin
  result := Self.OptionsItem;
end;
procedure TdxCustomLayoutControl_PutOptionsItem(Self:TdxCustomLayoutControl;const Value: TdxLayoutItemOptions);
begin
  Self.OptionsItem := Value;
end;
function TdxCustomLayoutControl_GetAutoControlAlignment(Self:TdxCustomLayoutControl):Boolean;
begin
  result := Self.AutoControlAlignment;
end;
procedure TdxCustomLayoutControl_PutAutoControlAlignment(Self:TdxCustomLayoutControl;const Value: Boolean);
begin
  Self.AutoControlAlignment := Value;
end;
function TdxCustomLayoutControl_GetAutoControlTabOrders(Self:TdxCustomLayoutControl):Boolean;
begin
  result := Self.AutoControlTabOrders;
end;
procedure TdxCustomLayoutControl_PutAutoControlTabOrders(Self:TdxCustomLayoutControl;const Value: Boolean);
begin
  Self.AutoControlTabOrders := Value;
end;
function TdxCustomLayoutControl_GetAbsoluteItemCount(Self:TdxCustomLayoutControl):Integer;
begin
  result := Self.AbsoluteItemCount;
end;
function TdxCustomLayoutControl_GetAbsoluteItems(Self:TdxCustomLayoutControl;Index: Integer):TdxCustomLayoutItem;
begin
  result := Self.AbsoluteItems[Index];
end;
function TdxCustomLayoutControl_GetAvailableItemCount(Self:TdxCustomLayoutControl):Integer;
begin
  result := Self.AvailableItemCount;
end;
function TdxCustomLayoutControl_GetAvailableItems(Self:TdxCustomLayoutControl;Index: Integer):TdxCustomLayoutItem;
begin
  result := Self.AvailableItems[Index];
end;
function TdxCustomLayoutControl_GetAlignmentConstraintCount(Self:TdxCustomLayoutControl):Integer;
begin
  result := Self.AlignmentConstraintCount;
end;
function TdxCustomLayoutControl_GetAlignmentConstraints(Self:TdxCustomLayoutControl;Index: Integer):TdxLayoutAlignmentConstraint;
begin
  result := Self.AlignmentConstraints[Index];
end;
function TdxCustomLayoutControl_GetItems(Self:TdxCustomLayoutControl):TdxLayoutGroup;
begin
  result := Self.Items;
end;
function TdxCustomLayoutControl_GetOptionsStoring(Self:TdxCustomLayoutControl):TdxStoringOptions;
begin
  result := Self.OptionsStoring;
end;
procedure TdxCustomLayoutControl_PutOptionsStoring(Self:TdxCustomLayoutControl;const Value: TdxStoringOptions);
begin
  Self.OptionsStoring := Value;
end;
function TdxCustomLayoutControl_GetIniFileName(Self:TdxCustomLayoutControl):string;
begin
  result := Self.IniFileName;
end;
procedure TdxCustomLayoutControl_PutIniFileName(Self:TdxCustomLayoutControl;const Value: string);
begin
  Self.IniFileName := Value;
end;
function TdxCustomLayoutControl_GetRegistryPath(Self:TdxCustomLayoutControl):string;
begin
  result := Self.RegistryPath;
end;
procedure TdxCustomLayoutControl_PutRegistryPath(Self:TdxCustomLayoutControl;const Value: string);
begin
  Self.RegistryPath := Value;
end;
function TdxCustomLayoutControl_GetStoreInIniFile(Self:TdxCustomLayoutControl):Boolean;
begin
  result := Self.StoreInIniFile;
end;
procedure TdxCustomLayoutControl_PutStoreInIniFile(Self:TdxCustomLayoutControl;const Value: Boolean);
begin
  Self.StoreInIniFile := Value;
end;
function TdxCustomLayoutControl_GetStoreInRegistry(Self:TdxCustomLayoutControl):Boolean;
begin
  result := Self.StoreInRegistry;
end;
procedure TdxCustomLayoutControl_PutStoreInRegistry(Self:TdxCustomLayoutControl;const Value: Boolean);
begin
  Self.StoreInRegistry := Value;
end;
function TdxCustomLayoutControl_GetUndoRedoManager(Self:TdxCustomLayoutControl):TdxUndoRedoManager;
begin
  result := Self.UndoRedoManager;
end;
function TdxCustomLayoutControl_GetPainter(Self:TdxCustomLayoutControl):TdxLayoutControlPainter;
begin
  result := Self.Painter;
end;
function TdxCustomLayoutControl_GetViewInfo(Self:TdxCustomLayoutControl):TdxLayoutControlViewInfo;
begin
  result := Self.ViewInfo;
end;
procedure RegisterIMPORT_dxLayoutControl;
var G, H: Integer;
begin
  H := RegisterNamespace(0, 'dxLayoutControl');
  // Begin of class TdxLayoutControlPersistent
  G := RegisterClassType(H, TdxLayoutControlPersistent);
  RegisterHeader(G, 
       'constructor Create(AControl: TdxCustomLayoutControl); virtual;',
       @TdxLayoutControlPersistent.Create);
  RegisterFakeHeader(G, 
       'function TdxLayoutControlPersistent_GetControl:TdxCustomLayoutControl;',
       @TdxLayoutControlPersistent_GetControl);
  RegisterProperty(G, 
       'property Control:TdxCustomLayoutControl read TdxLayoutControlPersistent_GetControl;');
  // End of class TdxLayoutControlPersistent
  // Begin of class TdxLayoutControlContainer
  G := RegisterClassType(H, TdxLayoutControlContainer);
  RegisterHeader(G, 
       'constructor Create(AControl: TdxCustomLayoutControl); reintroduce; virtual;',
       @TdxLayoutControlContainer.Create);
  RegisterHeader(G, 
       'procedure BeginDragAndDrop; override;',
       @TdxLayoutControlContainer.BeginDragAndDrop);
  RegisterHeader(G, 
       'function CanDragAndDrop: Boolean; override;',
       @TdxLayoutControlContainer.CanDragAndDrop);
  RegisterHeader(G, 
       'procedure FinishDragAndDrop(Accepted: Boolean); override;',
       @TdxLayoutControlContainer.FinishDragAndDrop);
  RegisterHeader(G, 
       'procedure Modified; override;',
       @TdxLayoutControlContainer.Modified);
  RegisterFakeHeader(G, 
       'function TdxLayoutControlContainer_GetControl:TdxCustomLayoutControl;',
       @TdxLayoutControlContainer_GetControl);
  RegisterProperty(G, 
       'property Control:TdxCustomLayoutControl read TdxLayoutControlContainer_GetControl;');
  RegisterFakeHeader(G, 
       'function TdxLayoutControlContainer_GetViewInfo:TdxLayoutControlContainerViewInfo;',
       @TdxLayoutControlContainer_GetViewInfo);
  RegisterProperty(G, 
       'property ViewInfo:TdxLayoutControlContainerViewInfo read TdxLayoutControlContainer_GetViewInfo;');
  // End of class TdxLayoutControlContainer
  RegisterClassReferenceType(H, 'TdxLayoutControlContainerClass');
  // Begin of class TdxStoringOptions
  G := RegisterClassType(H, TdxStoringOptions);
  RegisterHeader(G, 
       'procedure Assign(Source: TPersistent); override;',
       @TdxStoringOptions.Assign);
  RegisterHeader(G,
       'constructor Create;',
       @TdxStoringOptions.Create);
  // End of class TdxStoringOptions
  // Begin of class TdxLayoutItemOptions
  G := RegisterClassType(H, TdxLayoutItemOptions);
  RegisterHeader(G, 
       'constructor Create(AControl: TdxCustomLayoutControl); override;',
       @TdxLayoutItemOptions.Create);
  RegisterHeader(G, 
       'procedure Assign(Source: TPersistent); override;',
       @TdxLayoutItemOptions.Assign);
  // End of class TdxLayoutItemOptions
  RegisterRTTIType(H, TypeInfo(TdxLayoutAutoContentSize));
  RegisterRTTIType(H, TypeInfo(TdxLayoutAutoContentSizes));
  // Begin of class TdxCustomLayoutControlHandler
  G := RegisterClassType(H, TdxCustomLayoutControlHandler);
  RegisterHeader(G, 
       'constructor Create(AControl: TdxCustomLayoutControl); virtual;',
       @TdxCustomLayoutControlHandler.Create);
  // End of class TdxCustomLayoutControlHandler
  // Begin of class TdxCustomLayoutControl
  G := RegisterClassType(H, TdxCustomLayoutControl);
  RegisterHeader(G, 
       'constructor Create(AOwner: TComponent); override;',
       @TdxCustomLayoutControl.Create);
  RegisterHeader(G, 
       'destructor Destroy; override;',
       @TdxCustomLayoutControl.Destroy);
  RegisterHeader(G, 
       'procedure BeginDragAndDrop; override;',
       @TdxCustomLayoutControl.BeginDragAndDrop);
  RegisterHeader(G, 
       'procedure GetTabOrderList(List: TList); override;',
       @TdxCustomLayoutControl.GetTabOrderList);
  RegisterHeader(G, 
       'procedure Clear;',
       @TdxCustomLayoutControl.Clear);
  RegisterHeader(G, 
       'function CreateAlignmentConstraint: TdxLayoutAlignmentConstraint;',
       @TdxCustomLayoutControl.CreateAlignmentConstraint);
  RegisterHeader(G, 
       'procedure BeginUpdate;',
       @TdxCustomLayoutControl.BeginUpdate);
  RegisterHeader(G, 
       'procedure CancelUpdate;',
       @TdxCustomLayoutControl.CancelUpdate);
  RegisterHeader(G, 
       'procedure EndUpdate(ANeedPack: Boolean = True);',
       @TdxCustomLayoutControl.EndUpdate);
  RegisterHeader(G, 
       'function CreateGroup(AGroupClass: TdxLayoutGroupClass = nil; AParent: TdxLayoutGroup = nil): TdxLayoutGroup;',
       @TdxCustomLayoutControl.CreateGroup);
  RegisterHeader(G, 
       'function CreateItem(AItemClass: TdxCustomLayoutItemClass = nil; AParent: TdxLayoutGroup = nil): TdxCustomLayoutItem;',
       @TdxCustomLayoutControl.CreateItem);
  RegisterHeader(G, 
       'function CreateItemForControl(AControl: TControl; AParent: TdxLayoutGroup = nil): TdxLayoutItem;',
       @TdxCustomLayoutControl.CreateItemForControl);
  RegisterHeader(G, 
       'function CanRestore: Boolean;',
       @TdxCustomLayoutControl.CanRestore);
  RegisterHeader(G, 
       'procedure Restore;',
       @TdxCustomLayoutControl.Restore);
  RegisterHeader(G, 
       'procedure Store;',
       @TdxCustomLayoutControl.Store);
  RegisterHeader(G, 
       'procedure LoadFromIniFile(const AFileName: string);',
       @TdxCustomLayoutControl.LoadFromIniFile);
  RegisterHeader(G, 
       'procedure LoadFromRegistry(const ARegistryPath: string);',
       @TdxCustomLayoutControl.LoadFromRegistry);
  RegisterHeader(G, 
       'procedure LoadFromStream(AStream: TStream);',
       @TdxCustomLayoutControl.LoadFromStream);
  RegisterHeader(G, 
       'procedure SaveToIniFile(const AFileName: string; ARecreate: Boolean = True);',
       @TdxCustomLayoutControl.SaveToIniFile);
  RegisterHeader(G, 
       'procedure SaveToRegistry(const ARegistryPath: string; ARecreate: Boolean = True);',
       @TdxCustomLayoutControl.SaveToRegistry);
  RegisterHeader(G, 
       'procedure SaveToStream(AStream: TStream);',
       @TdxCustomLayoutControl.SaveToStream);
  RegisterFakeHeader(G, 
       'function TdxCustomLayoutControl_GetAutoContentSizes:TdxLayoutAutoContentSizes;',
       @TdxCustomLayoutControl_GetAutoContentSizes);
  RegisterFakeHeader(G, 
       'procedure TdxCustomLayoutControl_PutAutoContentSizes(const Value: TdxLayoutAutoContentSizes);',
       @TdxCustomLayoutControl_PutAutoContentSizes);
  RegisterProperty(G, 
       'property AutoContentSizes:TdxLayoutAutoContentSizes read TdxCustomLayoutControl_GetAutoContentSizes write TdxCustomLayoutControl_PutAutoContentSizes;');
  RegisterFakeHeader(G, 
       'function TdxCustomLayoutControl_GetContainer:TdxLayoutControlContainer;',
       @TdxCustomLayoutControl_GetContainer);
  RegisterProperty(G, 
       'property Container:TdxLayoutControlContainer read TdxCustomLayoutControl_GetContainer;');
  RegisterFakeHeader(G, 
       'function TdxCustomLayoutControl_GetLayoutDirection:TdxLayoutDirection;',
       @TdxCustomLayoutControl_GetLayoutDirection);
  RegisterFakeHeader(G, 
       'procedure TdxCustomLayoutControl_PutLayoutDirection(const Value: TdxLayoutDirection);',
       @TdxCustomLayoutControl_PutLayoutDirection);
  RegisterProperty(G, 
       'property LayoutDirection:TdxLayoutDirection read TdxCustomLayoutControl_GetLayoutDirection write TdxCustomLayoutControl_PutLayoutDirection;');
  RegisterFakeHeader(G, 
       'function TdxCustomLayoutControl_GetLookAndFeel:TdxCustomLayoutLookAndFeel;',
       @TdxCustomLayoutControl_GetLookAndFeel);
  RegisterFakeHeader(G, 
       'procedure TdxCustomLayoutControl_PutLookAndFeel(const Value: TdxCustomLayoutLookAndFeel);',
       @TdxCustomLayoutControl_PutLookAndFeel);
  RegisterProperty(G, 
       'property LookAndFeel:TdxCustomLayoutLookAndFeel read TdxCustomLayoutControl_GetLookAndFeel write TdxCustomLayoutControl_PutLookAndFeel;');
  RegisterFakeHeader(G, 
       'function TdxCustomLayoutControl_GetLayoutLookAndFeel:TdxCustomLayoutLookAndFeel;',
       @TdxCustomLayoutControl_GetLayoutLookAndFeel);
  RegisterFakeHeader(G, 
       'procedure TdxCustomLayoutControl_PutLayoutLookAndFeel(const Value: TdxCustomLayoutLookAndFeel);',
       @TdxCustomLayoutControl_PutLayoutLookAndFeel);
  RegisterProperty(G, 
       'property LayoutLookAndFeel:TdxCustomLayoutLookAndFeel read TdxCustomLayoutControl_GetLayoutLookAndFeel write TdxCustomLayoutControl_PutLayoutLookAndFeel;');
  RegisterFakeHeader(G, 
       'function TdxCustomLayoutControl_GetRedrawOnResize:Boolean;',
       @TdxCustomLayoutControl_GetRedrawOnResize);
  RegisterFakeHeader(G, 
       'procedure TdxCustomLayoutControl_PutRedrawOnResize(const Value: Boolean);',
       @TdxCustomLayoutControl_PutRedrawOnResize);
  RegisterProperty(G, 
       'property RedrawOnResize:Boolean read TdxCustomLayoutControl_GetRedrawOnResize write TdxCustomLayoutControl_PutRedrawOnResize;');
  RegisterFakeHeader(G, 
       'function TdxCustomLayoutControl_GetCustomization:Boolean;',
       @TdxCustomLayoutControl_GetCustomization);
  RegisterFakeHeader(G, 
       'procedure TdxCustomLayoutControl_PutCustomization(const Value: Boolean);',
       @TdxCustomLayoutControl_PutCustomization);
  RegisterProperty(G, 
       'property Customization:Boolean read TdxCustomLayoutControl_GetCustomization write TdxCustomLayoutControl_PutCustomization;');
  RegisterFakeHeader(G, 
       'function TdxCustomLayoutControl_GetCustomizeAvailableItemsViewKind:TdxLayoutAvailableItemsViewKind;',
       @TdxCustomLayoutControl_GetCustomizeAvailableItemsViewKind);
  RegisterFakeHeader(G, 
       'procedure TdxCustomLayoutControl_PutCustomizeAvailableItemsViewKind(const Value: TdxLayoutAvailableItemsViewKind);',
       @TdxCustomLayoutControl_PutCustomizeAvailableItemsViewKind);
  RegisterProperty(G, 
       'property CustomizeAvailableItemsViewKind:TdxLayoutAvailableItemsViewKind read TdxCustomLayoutControl_GetCustomizeAvailableItemsViewKind write TdxCustomLayoutControl_PutCustomizeAvailableItemsViewKind;');
  RegisterFakeHeader(G, 
       'function TdxCustomLayoutControl_GetCustomizeForm:TdxLayoutControlCustomCustomizeForm;',
       @TdxCustomLayoutControl_GetCustomizeForm);
  RegisterProperty(G, 
       'property CustomizeForm:TdxLayoutControlCustomCustomizeForm read TdxCustomLayoutControl_GetCustomizeForm;');
  RegisterFakeHeader(G, 
       'function TdxCustomLayoutControl_GetCustomizeFormBounds:TRect;',
       @TdxCustomLayoutControl_GetCustomizeFormBounds);
  RegisterFakeHeader(G, 
       'procedure TdxCustomLayoutControl_PutCustomizeFormBounds(const Value: TRect);',
       @TdxCustomLayoutControl_PutCustomizeFormBounds);
  RegisterProperty(G, 
       'property CustomizeFormBounds:TRect read TdxCustomLayoutControl_GetCustomizeFormBounds write TdxCustomLayoutControl_PutCustomizeFormBounds;');
  RegisterFakeHeader(G, 
       'function TdxCustomLayoutControl_GetCustomizeFormClass:TdxLayoutControlCustomCustomizeFormClass;',
       @TdxCustomLayoutControl_GetCustomizeFormClass);
  RegisterFakeHeader(G, 
       'procedure TdxCustomLayoutControl_PutCustomizeFormClass(const Value: TdxLayoutControlCustomCustomizeFormClass);',
       @TdxCustomLayoutControl_PutCustomizeFormClass);
  RegisterProperty(G, 
       'property CustomizeFormClass:TdxLayoutControlCustomCustomizeFormClass read TdxCustomLayoutControl_GetCustomizeFormClass write TdxCustomLayoutControl_PutCustomizeFormClass;');
  RegisterFakeHeader(G, 
       'function TdxCustomLayoutControl_GetCustomizeFormTabbedView:Boolean;',
       @TdxCustomLayoutControl_GetCustomizeFormTabbedView);
  RegisterFakeHeader(G, 
       'procedure TdxCustomLayoutControl_PutCustomizeFormTabbedView(const Value: Boolean);',
       @TdxCustomLayoutControl_PutCustomizeFormTabbedView);
  RegisterProperty(G, 
       'property CustomizeFormTabbedView:Boolean read TdxCustomLayoutControl_GetCustomizeFormTabbedView write TdxCustomLayoutControl_PutCustomizeFormTabbedView;');
  RegisterFakeHeader(G, 
       'function TdxCustomLayoutControl_GetShowDesignSelectors:Boolean;',
       @TdxCustomLayoutControl_GetShowDesignSelectors);
  RegisterFakeHeader(G, 
       'procedure TdxCustomLayoutControl_PutShowDesignSelectors(const Value: Boolean);',
       @TdxCustomLayoutControl_PutShowDesignSelectors);
  RegisterProperty(G, 
       'property ShowDesignSelectors:Boolean read TdxCustomLayoutControl_GetShowDesignSelectors write TdxCustomLayoutControl_PutShowDesignSelectors;');
  RegisterFakeHeader(G, 
       'function TdxCustomLayoutControl_GetHighlightRoot:Boolean;',
       @TdxCustomLayoutControl_GetHighlightRoot);
  RegisterFakeHeader(G, 
       'procedure TdxCustomLayoutControl_PutHighlightRoot(const Value: Boolean);',
       @TdxCustomLayoutControl_PutHighlightRoot);
  RegisterProperty(G, 
       'property HighlightRoot:Boolean read TdxCustomLayoutControl_GetHighlightRoot write TdxCustomLayoutControl_PutHighlightRoot;');
  RegisterFakeHeader(G, 
       'function TdxCustomLayoutControl_GetContentBounds:TRect;',
       @TdxCustomLayoutControl_GetContentBounds);
  RegisterProperty(G, 
       'property ContentBounds:TRect read TdxCustomLayoutControl_GetContentBounds;');
  RegisterFakeHeader(G, 
       'function TdxCustomLayoutControl_GetOccupiedClientWidth:Integer;',
       @TdxCustomLayoutControl_GetOccupiedClientWidth);
  RegisterProperty(G, 
       'property OccupiedClientWidth:Integer read TdxCustomLayoutControl_GetOccupiedClientWidth;');
  RegisterFakeHeader(G, 
       'function TdxCustomLayoutControl_GetOccupiedClientHeight:Integer;',
       @TdxCustomLayoutControl_GetOccupiedClientHeight);
  RegisterProperty(G, 
       'property OccupiedClientHeight:Integer read TdxCustomLayoutControl_GetOccupiedClientHeight;');
  RegisterFakeHeader(G, 
       'function TdxCustomLayoutControl_GetOptionsImage:TdxLayoutImageOptions;',
       @TdxCustomLayoutControl_GetOptionsImage);
  RegisterFakeHeader(G, 
       'procedure TdxCustomLayoutControl_PutOptionsImage(const Value: TdxLayoutImageOptions);',
       @TdxCustomLayoutControl_PutOptionsImage);
  RegisterProperty(G, 
       'property OptionsImage:TdxLayoutImageOptions read TdxCustomLayoutControl_GetOptionsImage write TdxCustomLayoutControl_PutOptionsImage;');
  RegisterFakeHeader(G, 
       'function TdxCustomLayoutControl_GetOptionsItem:TdxLayoutItemOptions;',
       @TdxCustomLayoutControl_GetOptionsItem);
  RegisterFakeHeader(G, 
       'procedure TdxCustomLayoutControl_PutOptionsItem(const Value: TdxLayoutItemOptions);',
       @TdxCustomLayoutControl_PutOptionsItem);
  RegisterProperty(G, 
       'property OptionsItem:TdxLayoutItemOptions read TdxCustomLayoutControl_GetOptionsItem write TdxCustomLayoutControl_PutOptionsItem;');
  RegisterFakeHeader(G, 
       'function TdxCustomLayoutControl_GetAutoControlAlignment:Boolean;',
       @TdxCustomLayoutControl_GetAutoControlAlignment);
  RegisterFakeHeader(G, 
       'procedure TdxCustomLayoutControl_PutAutoControlAlignment(const Value: Boolean);',
       @TdxCustomLayoutControl_PutAutoControlAlignment);
  RegisterProperty(G, 
       'property AutoControlAlignment:Boolean read TdxCustomLayoutControl_GetAutoControlAlignment write TdxCustomLayoutControl_PutAutoControlAlignment;');
  RegisterFakeHeader(G, 
       'function TdxCustomLayoutControl_GetAutoControlTabOrders:Boolean;',
       @TdxCustomLayoutControl_GetAutoControlTabOrders);
  RegisterFakeHeader(G, 
       'procedure TdxCustomLayoutControl_PutAutoControlTabOrders(const Value: Boolean);',
       @TdxCustomLayoutControl_PutAutoControlTabOrders);
  RegisterProperty(G, 
       'property AutoControlTabOrders:Boolean read TdxCustomLayoutControl_GetAutoControlTabOrders write TdxCustomLayoutControl_PutAutoControlTabOrders;');
  RegisterFakeHeader(G, 
       'function TdxCustomLayoutControl_GetAbsoluteItemCount:Integer;',
       @TdxCustomLayoutControl_GetAbsoluteItemCount);
  RegisterProperty(G, 
       'property AbsoluteItemCount:Integer read TdxCustomLayoutControl_GetAbsoluteItemCount;');
  RegisterFakeHeader(G, 
       'function TdxCustomLayoutControl_GetAbsoluteItems(Index: Integer):TdxCustomLayoutItem;',
       @TdxCustomLayoutControl_GetAbsoluteItems);
  RegisterProperty(G, 
       'property AbsoluteItems[Index: Integer]:TdxCustomLayoutItem read TdxCustomLayoutControl_GetAbsoluteItems;');
  RegisterFakeHeader(G, 
       'function TdxCustomLayoutControl_GetAvailableItemCount:Integer;',
       @TdxCustomLayoutControl_GetAvailableItemCount);
  RegisterProperty(G, 
       'property AvailableItemCount:Integer read TdxCustomLayoutControl_GetAvailableItemCount;');
  RegisterFakeHeader(G, 
       'function TdxCustomLayoutControl_GetAvailableItems(Index: Integer):TdxCustomLayoutItem;',
       @TdxCustomLayoutControl_GetAvailableItems);
  RegisterProperty(G, 
       'property AvailableItems[Index: Integer]:TdxCustomLayoutItem read TdxCustomLayoutControl_GetAvailableItems;');
  RegisterFakeHeader(G, 
       'function TdxCustomLayoutControl_GetAlignmentConstraintCount:Integer;',
       @TdxCustomLayoutControl_GetAlignmentConstraintCount);
  RegisterProperty(G, 
       'property AlignmentConstraintCount:Integer read TdxCustomLayoutControl_GetAlignmentConstraintCount;');
  RegisterFakeHeader(G, 
       'function TdxCustomLayoutControl_GetAlignmentConstraints(Index: Integer):TdxLayoutAlignmentConstraint;',
       @TdxCustomLayoutControl_GetAlignmentConstraints);
  RegisterProperty(G, 
       'property AlignmentConstraints[Index: Integer]:TdxLayoutAlignmentConstraint read TdxCustomLayoutControl_GetAlignmentConstraints;');
  RegisterFakeHeader(G, 
       'function TdxCustomLayoutControl_GetItems:TdxLayoutGroup;',
       @TdxCustomLayoutControl_GetItems);
  RegisterProperty(G, 
       'property Items:TdxLayoutGroup read TdxCustomLayoutControl_GetItems;');
  RegisterFakeHeader(G, 
       'function TdxCustomLayoutControl_GetOptionsStoring:TdxStoringOptions;',
       @TdxCustomLayoutControl_GetOptionsStoring);
  RegisterFakeHeader(G, 
       'procedure TdxCustomLayoutControl_PutOptionsStoring(const Value: TdxStoringOptions);',
       @TdxCustomLayoutControl_PutOptionsStoring);
  RegisterProperty(G, 
       'property OptionsStoring:TdxStoringOptions read TdxCustomLayoutControl_GetOptionsStoring write TdxCustomLayoutControl_PutOptionsStoring;');
  RegisterFakeHeader(G, 
       'function TdxCustomLayoutControl_GetIniFileName:string;',
       @TdxCustomLayoutControl_GetIniFileName);
  RegisterFakeHeader(G, 
       'procedure TdxCustomLayoutControl_PutIniFileName(const Value: string);',
       @TdxCustomLayoutControl_PutIniFileName);
  RegisterProperty(G, 
       'property IniFileName:string read TdxCustomLayoutControl_GetIniFileName write TdxCustomLayoutControl_PutIniFileName;');
  RegisterFakeHeader(G, 
       'function TdxCustomLayoutControl_GetRegistryPath:string;',
       @TdxCustomLayoutControl_GetRegistryPath);
  RegisterFakeHeader(G, 
       'procedure TdxCustomLayoutControl_PutRegistryPath(const Value: string);',
       @TdxCustomLayoutControl_PutRegistryPath);
  RegisterProperty(G, 
       'property RegistryPath:string read TdxCustomLayoutControl_GetRegistryPath write TdxCustomLayoutControl_PutRegistryPath;');
  RegisterFakeHeader(G, 
       'function TdxCustomLayoutControl_GetStoreInIniFile:Boolean;',
       @TdxCustomLayoutControl_GetStoreInIniFile);
  RegisterFakeHeader(G, 
       'procedure TdxCustomLayoutControl_PutStoreInIniFile(const Value: Boolean);',
       @TdxCustomLayoutControl_PutStoreInIniFile);
  RegisterProperty(G, 
       'property StoreInIniFile:Boolean read TdxCustomLayoutControl_GetStoreInIniFile write TdxCustomLayoutControl_PutStoreInIniFile;');
  RegisterFakeHeader(G, 
       'function TdxCustomLayoutControl_GetStoreInRegistry:Boolean;',
       @TdxCustomLayoutControl_GetStoreInRegistry);
  RegisterFakeHeader(G, 
       'procedure TdxCustomLayoutControl_PutStoreInRegistry(const Value: Boolean);',
       @TdxCustomLayoutControl_PutStoreInRegistry);
  RegisterProperty(G, 
       'property StoreInRegistry:Boolean read TdxCustomLayoutControl_GetStoreInRegistry write TdxCustomLayoutControl_PutStoreInRegistry;');
  RegisterFakeHeader(G, 
       'function TdxCustomLayoutControl_GetUndoRedoManager:TdxUndoRedoManager;',
       @TdxCustomLayoutControl_GetUndoRedoManager);
  RegisterProperty(G, 
       'property UndoRedoManager:TdxUndoRedoManager read TdxCustomLayoutControl_GetUndoRedoManager;');
  RegisterFakeHeader(G, 
       'function TdxCustomLayoutControl_GetPainter:TdxLayoutControlPainter;',
       @TdxCustomLayoutControl_GetPainter);
  RegisterProperty(G, 
       'property Painter:TdxLayoutControlPainter read TdxCustomLayoutControl_GetPainter;');
  RegisterFakeHeader(G, 
       'function TdxCustomLayoutControl_GetViewInfo:TdxLayoutControlViewInfo;',
       @TdxCustomLayoutControl_GetViewInfo);
  RegisterProperty(G, 
       'property ViewInfo:TdxLayoutControlViewInfo read TdxCustomLayoutControl_GetViewInfo;');
  // End of class TdxCustomLayoutControl
  // Begin of class TdxLayoutControl
  G := RegisterClassType(H, TdxLayoutControl);
  RegisterHeader(G,
       'constructor Create(AOwner: TComponent); override;',
       @TdxLayoutControl.Create);
  // End of class TdxLayoutControl
end;
initialization
  RegisterIMPORT_dxLayoutControl;
end.
