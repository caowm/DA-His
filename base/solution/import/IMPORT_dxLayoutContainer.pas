unit IMPORT_dxLayoutContainer;
interface
uses
  Messages,
  Windows,
  SysUtils,
  Classes,
  Menus,
  Graphics,
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
  cxStorage,
  dxLayoutLookAndFeels,
  dxLayoutCommon,
  dxLayoutSelection,
  cxPC,
  dxLayoutContainer,
  Variants,
  PaxCompiler,
  PaxRegister;
procedure RegisterIMPORT_dxLayoutContainer;
implementation
//function TdxLayoutControlCustomCustomizeForm_GetContainer(Self:TdxLayoutControlCustomCustomizeForm):TdxLayoutContainer;
//begin
//  result := Self.Container;
//end;
//procedure TdxLayoutControlCustomCustomizeForm_PutContainer(Self:TdxLayoutControlCustomCustomizeForm;const Value: TdxLayoutContainer);
//begin
//  Self.Container := Value;
//end;
//function TdxLayoutControlCustomCustomizeForm_GetLayoutPopupMenu(Self:TdxLayoutControlCustomCustomizeForm):TPopupMenu;
//begin
//  result := Self.LayoutPopupMenu;
//end;
//function TdxCustomLayoutItemCaptionOptions_GetAlignHorz(Self:TdxCustomLayoutItemCaptionOptions):TAlignment;
//begin
//  result := Self.AlignHorz;
//end;
//procedure TdxCustomLayoutItemCaptionOptions_PutAlignHorz(Self:TdxCustomLayoutItemCaptionOptions;const Value: TAlignment);
//begin
//  Self.AlignHorz := Value;
//end;
//function TdxCustomLayoutItemCaptionOptions_GetAlignVert(Self:TdxCustomLayoutItemCaptionOptions):TdxAlignmentVert;
//begin
//  result := Self.AlignVert;
//end;
//procedure TdxCustomLayoutItemCaptionOptions_PutAlignVert(Self:TdxCustomLayoutItemCaptionOptions;const Value: TdxAlignmentVert);
//begin
//  Self.AlignVert := Value;
//end;
//function TdxCustomLayoutItemCaptionOptions_GetText(Self:TdxCustomLayoutItemCaptionOptions):string;
//begin
//  result := Self.Text;
//end;
//procedure TdxCustomLayoutItemCaptionOptions_PutText(Self:TdxCustomLayoutItemCaptionOptions;const Value: string);
//begin
//  Self.Text := Value;
//end;
//function TdxCustomLayoutItemCaptionOptions_GetVisible(Self:TdxCustomLayoutItemCaptionOptions):Boolean;
//begin
//  result := Self.Visible;
//end;
//procedure TdxCustomLayoutItemCaptionOptions_PutVisible(Self:TdxCustomLayoutItemCaptionOptions;const Value: Boolean);
//begin
//  Self.Visible := Value;
//end;
//function TdxCustomLayoutItem_GetActuallyVisible(Self:TdxCustomLayoutItem):Boolean;
//begin
//  result := Self.ActuallyVisible;
//end;
//function TdxCustomLayoutItem_GetAllowRemove(Self:TdxCustomLayoutItem):Boolean;
//begin
//  result := Self.AllowRemove;
//end;
//procedure TdxCustomLayoutItem_PutAllowRemove(Self:TdxCustomLayoutItem;const Value: Boolean);
//begin
//  Self.AllowRemove := Value;
//end;
//function TdxCustomLayoutItem_GetCaptionForCustomizeForm(Self:TdxCustomLayoutItem):string;
//begin
//  result := Self.CaptionForCustomizeForm;
//end;
//function TdxCustomLayoutItem_GetContainer(Self:TdxCustomLayoutItem):TdxLayoutContainer;
//begin
//  result := Self.Container;
//end;
//procedure TdxCustomLayoutItem_PutContainer(Self:TdxCustomLayoutItem;const Value: TdxLayoutContainer);
//begin
//  Self.Container := Value;
//end;
//function TdxCustomLayoutItem_GetData(Self:TdxCustomLayoutItem):Pointer;
//begin
//  result := Self.Data;
//end;
//procedure TdxCustomLayoutItem_PutData(Self:TdxCustomLayoutItem;const Value: Pointer);
//begin
//  Self.Data := Value;
//end;
//function TdxCustomLayoutItem_GetEnabled(Self:TdxCustomLayoutItem):Boolean;
//begin
//  result := Self.Enabled;
//end;
//procedure TdxCustomLayoutItem_PutEnabled(Self:TdxCustomLayoutItem;const Value: Boolean);
//begin
//  Self.Enabled := Value;
//end;
//function TdxCustomLayoutItem_GetHeight(Self:TdxCustomLayoutItem):Integer;
//begin
//  result := Self.Height;
//end;
//procedure TdxCustomLayoutItem_PutHeight(Self:TdxCustomLayoutItem;const Value: Integer);
//begin
//  Self.Height := Value;
//end;
//function TdxCustomLayoutItem_GetIndex(Self:TdxCustomLayoutItem):Integer;
//begin
//  result := Self.Index;
//end;
//procedure TdxCustomLayoutItem_PutIndex(Self:TdxCustomLayoutItem;const Value: Integer);
//begin
//  Self.Index := Value;
//end;
//function TdxCustomLayoutItem_GetIsRoot(Self:TdxCustomLayoutItem):Boolean;
//begin
//  result := Self.IsRoot;
//end;
//function TdxCustomLayoutItem_GetViewInfo(Self:TdxCustomLayoutItem):TdxCustomLayoutItemViewInfo;
//begin
//  result := Self.ViewInfo;
//end;
//function TdxCustomLayoutItem_GetVisibleIndex(Self:TdxCustomLayoutItem):Integer;
//begin
//  result := Self.VisibleIndex;
//end;
//procedure TdxCustomLayoutItem_PutVisibleIndex(Self:TdxCustomLayoutItem;const Value: Integer);
//begin
//  Self.VisibleIndex := Value;
//end;
//function TdxCustomLayoutItem_GetWidth(Self:TdxCustomLayoutItem):Integer;
//begin
//  result := Self.Width;
//end;
//procedure TdxCustomLayoutItem_PutWidth(Self:TdxCustomLayoutItem;const Value: Integer);
//begin
//  Self.Width := Value;
//end;
//function TdxLayoutDirectionalItem_GetIsVertical(Self:TdxLayoutDirectionalItem):Boolean;
//begin
//  result := Self.IsVertical;
//end;
//function TdxLayoutLabeledItemCustomCaptionOptions_GetWidth(Self:TdxLayoutLabeledItemCustomCaptionOptions):Integer;
//begin
//  result := Self.Width;
//end;
//procedure TdxLayoutLabeledItemCustomCaptionOptions_PutWidth(Self:TdxLayoutLabeledItemCustomCaptionOptions;const Value: Integer);
//begin
//  Self.Width := Value;
//end;
//function TdxLayoutControlItem_GetOriginalControlSize(Self:TdxLayoutControlItem):TPoint;
//begin
//  result := Self.OriginalControlSize;
//end;
//procedure TdxLayoutControlItem_PutOriginalControlSize(Self:TdxLayoutControlItem;const Value: TPoint);
//begin
//  Self.OriginalControlSize := Value;
//end;
//function TdxLayoutControlItem_GetViewInfo(Self:TdxLayoutControlItem):TdxLayoutControlItemViewInfo;
//begin
//  result := Self.ViewInfo;
//end;
//function TdxLayoutItem_GetViewInfo(Self:TdxLayoutItem):TdxLayoutItemViewInfo;
//begin
//  result := Self.ViewInfo;
//end;
//function TdxLayoutGroupButtons_GetItems(Self:TdxLayoutGroupButtons;Index: Integer):TdxLayoutGroupButton;
//begin
//  result := Self.Items[Index];
//end;
//procedure TdxLayoutGroupButtons_PutItems(Self:TdxLayoutGroupButtons;Index: Integer;const Value: TdxLayoutGroupButton);
//begin
//  Self.Items[Index] := Value;
//end;
//function TdxLayoutGroupButtonOptions_GetExpandButton(Self:TdxLayoutGroupButtonOptions):TdxLayoutGroupButton;
//begin
//  result := Self.ExpandButton;
//end;
//function TdxLayoutGroupButtonOptions_GetGroup(Self:TdxLayoutGroupButtonOptions):TdxCustomLayoutGroup;
//begin
//  result := Self.Group;
//end;
//function TdxLayoutGroup_GetCount(Self:TdxLayoutGroup):Integer;
//begin
//  result := Self.Count;
//end;
//function TdxLayoutGroup_GetItems(Self:TdxLayoutGroup;Index: Integer):TdxCustomLayoutItem;
//begin
//  result := Self.Items[Index];
//end;
//function TdxLayoutGroup_GetViewInfo(Self:TdxLayoutGroup):TdxLayoutGroupViewInfo;
//begin
//  result := Self.ViewInfo;
//end;
//function TdxLayoutGroup_GetVisibleCount(Self:TdxLayoutGroup):Integer;
//begin
//  result := Self.VisibleCount;
//end;
//function TdxLayoutGroup_GetVisibleItems(Self:TdxLayoutGroup;Index: Integer):TdxCustomLayoutItem;
//begin
//  result := Self.VisibleItems[Index];
//end;
procedure RegisterIMPORT_dxLayoutContainer;
var G, H: Integer;
begin
  H := RegisterNamespace(0, 'dxLayoutContainer');
  RegisterConstant(H, 'htNone', 0);
  RegisterConstant(H, 'htCustomizeForm', 1);
  RegisterConstant(H, 'htItem', 10);
  RegisterConstant(H, 'htGroup', 20);
  RegisterConstant(H, 'htClientArea', 30);
  RegisterConstant(H, 'htAvailableItems', 40);
  RegisterConstant(H, 'htTreeViewItems', 50);
  RegisterConstant(H, 'htBasicItem', 60);
  RegisterConstant(H, 'htSizeHandle', 70);
  RegisterConstant(H, 'dxLayoutItemControlDefaultMinHeight', 20);
  RegisterConstant(H, 'dxLayoutItemControlDefaultMinWidth', 20);
  RegisterConstant(H, 'dxLayoutItemMinSize', 5);
  RegisterConstant(H, 'dxLayoutVersion', 3);
  RegisterRTTIType(H, TypeInfo(TdxLayoutAlignHorz));
  RegisterRTTIType(H, TypeInfo(TdxLayoutAlignVert));
  RegisterRTTIType(H, TypeInfo(TdxLayoutItemControlAlignHorz));
  RegisterRTTIType(H, TypeInfo(TdxLayoutItemControlAlignVert));
  RegisterRTTIType(H, TypeInfo(TdxLayoutAutoAlign));
  RegisterRTTIType(H, TypeInfo(TdxLayoutAutoAligns));
  RegisterRTTIType(H, TypeInfo(TdxLayoutDirection));
  RegisterRTTIType(H, TypeInfo(TdxLayoutActionType));
  RegisterRTTIType(H, TypeInfo(TdxLayoutCustomizeFormUpdateType));
  RegisterRTTIType(H, TypeInfo(TdxLayoutCustomizeFormUpdateTypes));
  RegisterRTTIType(H, TypeInfo(TdxLayoutAvailableItemsViewKind));
  RegisterRTTIType(H, TypeInfo(TdxLayoutCustomizeFormMenuItem));
  RegisterRTTIType(H, TypeInfo(TdxLayoutCustomizeFormMenuItems));
  // Begin of class TdxCustomLayoutItemOptions
  G := RegisterClassType(H, TdxCustomLayoutItemOptions);
//  RegisterHeader(G,
//       'constructor Create(AItem: TdxCustomLayoutItem); virtual;',
//       @TdxCustomLayoutItemOptions.Create);
  // End of class TdxCustomLayoutItemOptions
  // Begin of class TdxLayoutControlCustomCustomizeForm
  G := RegisterClassType(H, TdxLayoutControlCustomCustomizeForm);
//  RegisterHeader(G,
//       'destructor Destroy; override;',
//       @TdxLayoutControlCustomCustomizeForm.Destroy);
//  RegisterHeader(G,
//       'function GetHitTest(const P: TPoint): TdxCustomLayoutHitTest; virtual;',
//       @TdxLayoutControlCustomCustomizeForm.GetHitTest);
//  RegisterHeader(G,
//       'procedure ToggleHotTrackState(AItem: TdxCustomLayoutItem); virtual;',
//       @TdxLayoutControlCustomCustomizeForm.ToggleHotTrackState);
//  RegisterHeader(G,
//       'procedure UpdateAvailableItems; virtual;',
//       @TdxLayoutControlCustomCustomizeForm.UpdateAvailableItems);
//  RegisterHeader(G,
//       'procedure UpdateCaption; virtual;',
//       @TdxLayoutControlCustomCustomizeForm.UpdateCaption);
//  RegisterHeader(G,
//       'procedure UpdateContent; virtual;',
//       @TdxLayoutControlCustomCustomizeForm.UpdateContent);
//  RegisterHeader(G,
//       'procedure UpdateDragAndDropState; virtual;',
//       @TdxLayoutControlCustomCustomizeForm.UpdateDragAndDropState);
//  RegisterHeader(G,
//       'procedure UpdateSelection; virtual;',
//       @TdxLayoutControlCustomCustomizeForm.UpdateSelection);
//  RegisterHeader(G,
//       'procedure UpdateView; virtual;',
//       @TdxLayoutControlCustomCustomizeForm.UpdateView);
//  RegisterHeader(G,
//       'procedure UpdateVisibleItems; virtual;',
//       @TdxLayoutControlCustomCustomizeForm.UpdateVisibleItems);
//  RegisterFakeHeader(G,
//       'function TdxLayoutControlCustomCustomizeForm_GetContainer:TdxLayoutContainer;',
//       @TdxLayoutControlCustomCustomizeForm_GetContainer);
//  RegisterFakeHeader(G,
//       'procedure TdxLayoutControlCustomCustomizeForm_PutContainer(const Value: TdxLayoutContainer);',
//       @TdxLayoutControlCustomCustomizeForm_PutContainer);
//  RegisterProperty(G,
//       'property Container:TdxLayoutContainer read TdxLayoutControlCustomCustomizeForm_GetContainer write TdxLayoutControlCustomCustomizeForm_PutContainer;');
//  RegisterFakeHeader(G,
//       'function TdxLayoutControlCustomCustomizeForm_GetLayoutPopupMenu:TPopupMenu;',
//       @TdxLayoutControlCustomCustomizeForm_GetLayoutPopupMenu);
//  RegisterProperty(G,
//       'property LayoutPopupMenu:TPopupMenu read TdxLayoutControlCustomCustomizeForm_GetLayoutPopupMenu;');
//  RegisterHeader(G,
//       'constructor Create(AOwner: TComponent); virtual;',
//       @TdxLayoutControlCustomCustomizeForm.Create);
  // End of class TdxLayoutControlCustomCustomizeForm
  RegisterClassReferenceType(H, 'TdxLayoutControlCustomCustomizeFormClass');
  // Begin of class TdxCustomLayoutItemImageOptions
  G := RegisterClassType(H, TdxCustomLayoutItemImageOptions);
//  RegisterHeader(G,
//       'constructor Create(AItem: TdxCustomLayoutItem); override;',
//       @TdxCustomLayoutItemImageOptions.Create);
//  RegisterHeader(G,
//       'destructor Destroy; override;',
//       @TdxCustomLayoutItemImageOptions.Destroy);
//  RegisterHeader(G,
//       'procedure Assign(Source: TPersistent); override;',
//       @TdxCustomLayoutItemImageOptions.Assign);
  // End of class TdxCustomLayoutItemImageOptions
  RegisterRTTIType(H, TypeInfo(TdxAlignmentVert));
  RegisterRTTIType(H, TypeInfo(TdxCaptionLayout));
  RegisterRTTIType(H, TypeInfo(TdxLayoutItemCaptionVisibleElement));
  RegisterRTTIType(H, TypeInfo(TdxLayoutItemCaptionVisibleElements));
  // Begin of class TdxCustomLayoutItemCaptionOptions
  G := RegisterClassType(H, TdxCustomLayoutItemCaptionOptions);
//  RegisterHeader(G,
//       'constructor Create(AItem: TdxCustomLayoutItem); override;',
//       @TdxCustomLayoutItemCaptionOptions.Create);
//  RegisterHeader(G,
//       'destructor Destroy; override;',
//       @TdxCustomLayoutItemCaptionOptions.Destroy);
//  RegisterHeader(G,
//       'procedure Assign(Source: TPersistent); override;',
//       @TdxCustomLayoutItemCaptionOptions.Assign);
//  RegisterFakeHeader(G,
//       'function TdxCustomLayoutItemCaptionOptions_GetAlignHorz:TAlignment;',
//       @TdxCustomLayoutItemCaptionOptions_GetAlignHorz);
//  RegisterFakeHeader(G,
//       'procedure TdxCustomLayoutItemCaptionOptions_PutAlignHorz(const Value: TAlignment);',
//       @TdxCustomLayoutItemCaptionOptions_PutAlignHorz);
//  RegisterProperty(G,
//       'property AlignHorz:TAlignment read TdxCustomLayoutItemCaptionOptions_GetAlignHorz write TdxCustomLayoutItemCaptionOptions_PutAlignHorz;');
//  RegisterFakeHeader(G,
//       'function TdxCustomLayoutItemCaptionOptions_GetAlignVert:TdxAlignmentVert;',
//       @TdxCustomLayoutItemCaptionOptions_GetAlignVert);
//  RegisterFakeHeader(G,
//       'procedure TdxCustomLayoutItemCaptionOptions_PutAlignVert(const Value: TdxAlignmentVert);',
//       @TdxCustomLayoutItemCaptionOptions_PutAlignVert);
//  RegisterProperty(G,
//       'property AlignVert:TdxAlignmentVert read TdxCustomLayoutItemCaptionOptions_GetAlignVert write TdxCustomLayoutItemCaptionOptions_PutAlignVert;');
//  RegisterFakeHeader(G,
//       'function TdxCustomLayoutItemCaptionOptions_GetText:string;',
//       @TdxCustomLayoutItemCaptionOptions_GetText);
//  RegisterFakeHeader(G,
//       'procedure TdxCustomLayoutItemCaptionOptions_PutText(const Value: string);',
//       @TdxCustomLayoutItemCaptionOptions_PutText);
//  RegisterProperty(G,
//       'property Text:string read TdxCustomLayoutItemCaptionOptions_GetText write TdxCustomLayoutItemCaptionOptions_PutText;');
//  RegisterFakeHeader(G,
//       'function TdxCustomLayoutItemCaptionOptions_GetVisible:Boolean;',
//       @TdxCustomLayoutItemCaptionOptions_GetVisible);
//  RegisterFakeHeader(G,
//       'procedure TdxCustomLayoutItemCaptionOptions_PutVisible(const Value: Boolean);',
//       @TdxCustomLayoutItemCaptionOptions_PutVisible);
//  RegisterProperty(G,
//       'property Visible:Boolean read TdxCustomLayoutItemCaptionOptions_GetVisible write TdxCustomLayoutItemCaptionOptions_PutVisible;');
  // End of class TdxCustomLayoutItemCaptionOptions
  RegisterClassReferenceType(H, 'TdxCustomLayoutItemCaptionOptionsClass');
  RegisterRTTIType(H, TypeInfo(TdxLayoutSizeOptionsValue));
  RegisterRTTIType(H, TypeInfo(TdxLayoutSizeOptionsValues));
  // Begin of class TdxLayoutSizeOptions
  G := RegisterClassType(H, TdxLayoutSizeOptions);
//  RegisterHeader(G,
//       'procedure Assign(Source: TPersistent); override;',
//       @TdxLayoutSizeOptions.Assign);
//  RegisterHeader(G,
//       'constructor Create(AItem: TdxCustomLayoutItem); virtual;',
//       @TdxLayoutSizeOptions.Create);
//  // End of class TdxLayoutSizeOptions
//  // Begin of class TdxLayoutOffsets
//  G := RegisterClassType(H, TdxLayoutOffsets);
//  RegisterHeader(G,
//       'procedure Assign(Source: TPersistent); override;',
//       @TdxLayoutOffsets.Assign);
//  RegisterHeader(G,
//       'constructor Create(AItem: TdxCustomLayoutItem); virtual;',
//       @TdxLayoutOffsets.Create);
//  // End of class TdxLayoutOffsets
//  // Begin of class TdxLayoutPadding
//  G := RegisterClassType(H, TdxLayoutPadding);
//  RegisterHeader(G,
//       'procedure Assign(Source: TPersistent); override;',
//       @TdxLayoutPadding.Assign);
//  RegisterHeader(G,
//       'function GetValues: TRect;',
//       @TdxLayoutPadding.GetValues);
//  RegisterHeader(G,
//       'constructor Create(AItem: TdxCustomLayoutItem); virtual;',
//       @TdxLayoutPadding.Create);
  // End of class TdxLayoutPadding
  RegisterRTTIType(H, TypeInfo(TdxLayoutItemChangeType));
//  RegisterRTTIType(H, TypeInfo(TdxCustomLayoutItemAssignedValue));
//  RegisterRTTIType(H, TypeInfo(TdxCustomLayoutItemAssignedValues));
  // Begin of class TdxCustomLayoutItem
  G := RegisterClassType(H, TdxCustomLayoutItem);
//  RegisterHeader(G,
//       'constructor Create(AOwner: TComponent); override;',
//       @TdxCustomLayoutItem.Create);
//  RegisterHeader(G,
//       'procedure Assign(Source: TPersistent); override;',
//       @TdxCustomLayoutItem.Assign);
//  RegisterHeader(G,
//       'procedure BeforeDestruction; override;',
//       @TdxCustomLayoutItem.BeforeDestruction);
//  RegisterHeader(G,
//       'destructor Destroy; override;',
//       @TdxCustomLayoutItem.Destroy);
//  RegisterHeader(G,
//       'function GetParentComponent: TComponent; override;',
//       @TdxCustomLayoutItem.GetParentComponent);
//  RegisterHeader(G,
//       'function HasParent: Boolean; override;',
//       @TdxCustomLayoutItem.HasParent);
//  RegisterHeader(G,
//       'function CanMoveTo(AParent: TdxCustomLayoutItem): Boolean; virtual;',
//       @TdxCustomLayoutItem.CanMoveTo);
//  RegisterHeader(G,
//       'procedure MakeVisible;',
//       @TdxCustomLayoutItem.MakeVisible);
//  RegisterHeader(G,
//       'function Move(AParent: TdxLayoutGroup; AIndex: Integer; APack: Boolean = False): Boolean;',
//       @TdxCustomLayoutItem.Move);
//  RegisterHeader(G,
//       'function MoveTo(AParent: TdxLayoutGroup; AVisibleIndex: Integer; APack: Boolean = False): Boolean;',
//       @TdxCustomLayoutItem.MoveTo);
//  RegisterHeader(G,
//       'procedure Pack;',
//       @TdxCustomLayoutItem.Pack);
//  RegisterHeader(G,
//       'function PutIntoHiddenGroup(ALayoutDirection: TdxLayoutDirection): TdxLayoutGroup;',
//       @TdxCustomLayoutItem.PutIntoHiddenGroup);
//  RegisterHeader(G,
//       'procedure ToggleHotTrackState;',
//       @TdxCustomLayoutItem.ToggleHotTrackState);
//  RegisterFakeHeader(G,
//       'function TdxCustomLayoutItem_GetActuallyVisible:Boolean;',
//       @TdxCustomLayoutItem_GetActuallyVisible);
//  RegisterProperty(G,
//       'property ActuallyVisible:Boolean read TdxCustomLayoutItem_GetActuallyVisible;');
//  RegisterFakeHeader(G,
//       'function TdxCustomLayoutItem_GetAllowRemove:Boolean;',
//       @TdxCustomLayoutItem_GetAllowRemove);
//  RegisterFakeHeader(G,
//       'procedure TdxCustomLayoutItem_PutAllowRemove(const Value: Boolean);',
//       @TdxCustomLayoutItem_PutAllowRemove);
//  RegisterProperty(G,
//       'property AllowRemove:Boolean read TdxCustomLayoutItem_GetAllowRemove write TdxCustomLayoutItem_PutAllowRemove;');
//  RegisterFakeHeader(G,
//       'function TdxCustomLayoutItem_GetCaptionForCustomizeForm:string;',
//       @TdxCustomLayoutItem_GetCaptionForCustomizeForm);
//  RegisterProperty(G,
//       'property CaptionForCustomizeForm:string read TdxCustomLayoutItem_GetCaptionForCustomizeForm;');
//  RegisterFakeHeader(G,
//       'function TdxCustomLayoutItem_GetContainer:TdxLayoutContainer;',
//       @TdxCustomLayoutItem_GetContainer);
//  RegisterFakeHeader(G,
//       'procedure TdxCustomLayoutItem_PutContainer(const Value: TdxLayoutContainer);',
//       @TdxCustomLayoutItem_PutContainer);
//  RegisterProperty(G,
//       'property Container:TdxLayoutContainer read TdxCustomLayoutItem_GetContainer write TdxCustomLayoutItem_PutContainer;');
//  RegisterFakeHeader(G,
//       'function TdxCustomLayoutItem_GetData:Pointer;',
//       @TdxCustomLayoutItem_GetData);
//  RegisterFakeHeader(G,
//       'procedure TdxCustomLayoutItem_PutData(const Value: Pointer);',
//       @TdxCustomLayoutItem_PutData);
//  RegisterProperty(G,
//       'property Data:Pointer read TdxCustomLayoutItem_GetData write TdxCustomLayoutItem_PutData;');
//  RegisterFakeHeader(G,
//       'function TdxCustomLayoutItem_GetEnabled:Boolean;',
//       @TdxCustomLayoutItem_GetEnabled);
//  RegisterFakeHeader(G,
//       'procedure TdxCustomLayoutItem_PutEnabled(const Value: Boolean);',
//       @TdxCustomLayoutItem_PutEnabled);
//  RegisterProperty(G,
//       'property Enabled:Boolean read TdxCustomLayoutItem_GetEnabled write TdxCustomLayoutItem_PutEnabled;');
//  RegisterFakeHeader(G,
//       'function TdxCustomLayoutItem_GetHeight:Integer;',
//       @TdxCustomLayoutItem_GetHeight);
//  RegisterFakeHeader(G,
//       'procedure TdxCustomLayoutItem_PutHeight(const Value: Integer);',
//       @TdxCustomLayoutItem_PutHeight);
//  RegisterProperty(G,
//       'property Height:Integer read TdxCustomLayoutItem_GetHeight write TdxCustomLayoutItem_PutHeight;');
//  RegisterFakeHeader(G,
//       'function TdxCustomLayoutItem_GetIndex:Integer;',
//       @TdxCustomLayoutItem_GetIndex);
//  RegisterFakeHeader(G,
//       'procedure TdxCustomLayoutItem_PutIndex(const Value: Integer);',
//       @TdxCustomLayoutItem_PutIndex);
//  RegisterProperty(G,
//       'property Index:Integer read TdxCustomLayoutItem_GetIndex write TdxCustomLayoutItem_PutIndex;');
//  RegisterFakeHeader(G,
//       'function TdxCustomLayoutItem_GetIsRoot:Boolean;',
//       @TdxCustomLayoutItem_GetIsRoot);
//  RegisterProperty(G,
//       'property IsRoot:Boolean read TdxCustomLayoutItem_GetIsRoot;');
//  RegisterFakeHeader(G,
//       'function TdxCustomLayoutItem_GetViewInfo:TdxCustomLayoutItemViewInfo;',
//       @TdxCustomLayoutItem_GetViewInfo);
//  RegisterProperty(G,
//       'property ViewInfo:TdxCustomLayoutItemViewInfo read TdxCustomLayoutItem_GetViewInfo;');
//  RegisterFakeHeader(G,
//       'function TdxCustomLayoutItem_GetVisibleIndex:Integer;',
//       @TdxCustomLayoutItem_GetVisibleIndex);
//  RegisterFakeHeader(G,
//       'procedure TdxCustomLayoutItem_PutVisibleIndex(const Value: Integer);',
//       @TdxCustomLayoutItem_PutVisibleIndex);
//  RegisterProperty(G,
//       'property VisibleIndex:Integer read TdxCustomLayoutItem_GetVisibleIndex write TdxCustomLayoutItem_PutVisibleIndex;');
//  RegisterFakeHeader(G,
//       'function TdxCustomLayoutItem_GetWidth:Integer;',
//       @TdxCustomLayoutItem_GetWidth);
//  RegisterFakeHeader(G,
//       'procedure TdxCustomLayoutItem_PutWidth(const Value: Integer);',
//       @TdxCustomLayoutItem_PutWidth);
//  RegisterProperty(G,
//       'property Width:Integer read TdxCustomLayoutItem_GetWidth write TdxCustomLayoutItem_PutWidth;');
  // End of class TdxCustomLayoutItem
  // Begin of class TdxLayoutBasicItem
  G := RegisterClassType(H, TdxLayoutBasicItem);
//  RegisterHeader(G,
//       'constructor Create(AOwner: TComponent); override;',
//       @TdxLayoutBasicItem.Create);
  // End of class TdxLayoutBasicItem
  // Begin of class TdxLayoutNonLabeledItemCaptionOptions
  G := RegisterClassType(H, TdxLayoutNonLabeledItemCaptionOptions);
//  RegisterHeader(G,
//       'constructor Create(AItem: TdxCustomLayoutItem); override;',
//       @TdxLayoutNonLabeledItemCaptionOptions.Create);
  // End of class TdxLayoutNonLabeledItemCaptionOptions
  // Begin of class TdxLayoutNonLabeledItem
  G := RegisterClassType(H, TdxLayoutNonLabeledItem);
//  RegisterHeader(G,
//       'constructor Create(AOwner: TComponent); override;',
//       @TdxLayoutNonLabeledItem.Create);
  // End of class TdxLayoutNonLabeledItem
  // Begin of class TdxLayoutEmptySpaceItem
  G := RegisterClassType(H, TdxLayoutEmptySpaceItem);
//  RegisterHeader(G,
//       'constructor Create(AOwner: TComponent); override;',
//       @TdxLayoutEmptySpaceItem.Create);
  // End of class TdxLayoutEmptySpaceItem
  // Begin of class TdxLayoutDirectionalItem
  G := RegisterClassType(H, TdxLayoutDirectionalItem);
//  RegisterHeader(G,
//       'constructor Create(AOwner: TComponent); override;',
//       @TdxLayoutDirectionalItem.Create);
//  RegisterFakeHeader(G,
//       'function TdxLayoutDirectionalItem_GetIsVertical:Boolean;',
//       @TdxLayoutDirectionalItem_GetIsVertical);
//  RegisterProperty(G,
//       'property IsVertical:Boolean read TdxLayoutDirectionalItem_GetIsVertical;');
  // End of class TdxLayoutDirectionalItem
  // Begin of class TdxLayoutSeparatorItem
  G := RegisterClassType(H, TdxLayoutSeparatorItem);
//  RegisterHeader(G,
//       'constructor Create(AOwner: TComponent); override;',
//       @TdxLayoutSeparatorItem.Create);
  // End of class TdxLayoutSeparatorItem
  // Begin of class TdxLayoutSplitterItem
  G := RegisterClassType(H, TdxLayoutSplitterItem);
//  RegisterHeader(G,
//       'constructor Create(AOwner: TComponent); override;',
//       @TdxLayoutSplitterItem.Create);
  // End of class TdxLayoutSplitterItem
  // Begin of class TdxCustomLayoutItemStorableCaptionOptions
  G := RegisterClassType(H, TdxCustomLayoutItemStorableCaptionOptions);
//  RegisterHeader(G,
//       'constructor Create(AItem: TdxCustomLayoutItem); override;',
//       @TdxCustomLayoutItemStorableCaptionOptions.Create);
  // End of class TdxCustomLayoutItemStorableCaptionOptions
  // Begin of class TdxLayoutLabeledItemCustomCaptionOptions
  G := RegisterClassType(H, TdxLayoutLabeledItemCustomCaptionOptions);
//  RegisterHeader(G,
//       'constructor Create(AItem: TdxCustomLayoutItem); override;',
//       @TdxLayoutLabeledItemCustomCaptionOptions.Create);
//  RegisterHeader(G,
//       'procedure Assign(Source: TPersistent); override;',
//       @TdxLayoutLabeledItemCustomCaptionOptions.Assign);
//  RegisterFakeHeader(G,
//       'function TdxLayoutLabeledItemCustomCaptionOptions_GetWidth:Integer;',
//       @TdxLayoutLabeledItemCustomCaptionOptions_GetWidth);
//  RegisterFakeHeader(G,
//       'procedure TdxLayoutLabeledItemCustomCaptionOptions_PutWidth(const Value: Integer);',
//       @TdxLayoutLabeledItemCustomCaptionOptions_PutWidth);
//  RegisterProperty(G,
//       'property Width:Integer read TdxLayoutLabeledItemCustomCaptionOptions_GetWidth write TdxLayoutLabeledItemCustomCaptionOptions_PutWidth;');
  // End of class TdxLayoutLabeledItemCustomCaptionOptions
  // Begin of class TdxLayoutCustomLabeledItem
//  G := RegisterClassType(H, TdxLayoutCustomLabeledItem);
//  RegisterHeader(G,
//       'constructor Create(AOwner: TComponent); override;',
//       @TdxLayoutCustomLabeledItem.Create);
  // End of class TdxLayoutCustomLabeledItem
  // Begin of class TdxLayoutLabeledItemCaptionOptions
  G := RegisterClassType(H, TdxLayoutLabeledItemCaptionOptions);
//  RegisterHeader(G,
//       'constructor Create(AItem: TdxCustomLayoutItem); override;',
//       @TdxLayoutLabeledItemCaptionOptions.Create);
  // End of class TdxLayoutLabeledItemCaptionOptions
  // Begin of class TdxLayoutLabeledItem
  G := RegisterClassType(H, TdxLayoutLabeledItem);
//  RegisterHeader(G,
//       'constructor Create(AOwner: TComponent); override;',
//       @TdxLayoutLabeledItem.Create);
//  // End of class TdxLayoutLabeledItem
//  // Begin of class TdxCustomLayoutControlAdapter
  G := RegisterClassType(H, TdxCustomLayoutControlAdapter);
//  RegisterHeader(G,
//       'constructor Create(AItem: TdxLayoutItem); virtual;',
//       @TdxCustomLayoutControlAdapter.Create);
//  RegisterHeader(G,
//       'procedure SetInitialSettings; virtual;',
//       @TdxCustomLayoutControlAdapter.SetInitialSettings);
//  RegisterHeader(G,
//       'procedure Register(AControlClass: TControlClass);',
//       @TdxCustomLayoutControlAdapter.Register);
//  RegisterHeader(G,
//       'procedure Unregister(AControlClass: TControlClass);',
//       @TdxCustomLayoutControlAdapter.Unregister);
  // End of class TdxCustomLayoutControlAdapter
  RegisterClassReferenceType(H, 'TdxCustomLayoutControlAdapterClass');
  // Begin of class TdxLayoutItemCaptionOptions
  G := RegisterClassType(H, TdxLayoutItemCaptionOptions);
//  RegisterHeader(G,
//       'constructor Create(AItem: TdxCustomLayoutItem); override;',
//       @TdxLayoutItemCaptionOptions.Create);
  // End of class TdxLayoutItemCaptionOptions
  // Begin of class TdxLayoutItemControlOptions
  G := RegisterClassType(H, TdxLayoutItemControlOptions);
//  RegisterHeader(G,
//       'constructor Create(AItem: TdxCustomLayoutItem); override;',
//       @TdxLayoutItemControlOptions.Create);
//  RegisterHeader(G,
//       'function IsHeightFixed: Boolean;',
//       @TdxLayoutItemControlOptions.IsHeightFixed);
//  RegisterHeader(G,
//       'function IsWidthFixed: Boolean;',
//       @TdxLayoutItemControlOptions.IsWidthFixed);
  // End of class TdxLayoutItemControlOptions
  RegisterClassReferenceType(H, 'TdxLayoutItemControlOptionsClass');
  // Begin of class TdxLayoutControlItem
  G := RegisterClassType(H, TdxLayoutControlItem);
//  RegisterFakeHeader(G,
//       'function TdxLayoutControlItem_GetOriginalControlSize:TPoint;',
//       @TdxLayoutControlItem_GetOriginalControlSize);
//  RegisterFakeHeader(G,
//       'procedure TdxLayoutControlItem_PutOriginalControlSize(const Value: TPoint);',
//       @TdxLayoutControlItem_PutOriginalControlSize);
//  RegisterProperty(G,
//       'property OriginalControlSize:TPoint read TdxLayoutControlItem_GetOriginalControlSize write TdxLayoutControlItem_PutOriginalControlSize;');
//  RegisterFakeHeader(G,
//       'function TdxLayoutControlItem_GetViewInfo:TdxLayoutControlItemViewInfo;',
//       @TdxLayoutControlItem_GetViewInfo);
//  RegisterProperty(G,
//       'property ViewInfo:TdxLayoutControlItemViewInfo read TdxLayoutControlItem_GetViewInfo;');
//  RegisterHeader(G,
//       'constructor Create(AOwner: TComponent); override;',
//       @TdxLayoutControlItem.Create);
  // End of class TdxLayoutControlItem
  // Begin of class TdxLayoutItem
  G := RegisterClassType(H, TdxLayoutItem);
//  RegisterHeader(G,
//       'destructor Destroy; override;',
//       @TdxLayoutItem.Destroy);
//  RegisterFakeHeader(G,
//       'function TdxLayoutItem_GetViewInfo:TdxLayoutItemViewInfo;',
//       @TdxLayoutItem_GetViewInfo);
//  RegisterProperty(G,
//       'property ViewInfo:TdxLayoutItemViewInfo read TdxLayoutItem_GetViewInfo;');
//  RegisterHeader(G,
//       'constructor Create(AOwner: TComponent); override;',
//       @TdxLayoutItem.Create);
  // End of class TdxLayoutItem
  RegisterClassReferenceType(H, 'TdxLayoutItemClass');
  // Begin of class TdxLayoutTabbedOptions
  G := RegisterClassType(H, TdxLayoutTabbedOptions);
//  RegisterHeader(G,
//       'constructor Create(AOwner: TPersistent); override;',
//       @TdxLayoutTabbedOptions.Create);
//  RegisterHeader(G,
//       'destructor Destroy; override;',
//       @TdxLayoutTabbedOptions.Destroy);
  // End of class TdxLayoutTabbedOptions
  // Begin of class TdxLayoutGroupButton
  G := RegisterClassType(H, TdxLayoutGroupButton);
//  RegisterHeader(G,
//       'constructor Create(Collection: TCollection); override;',
//       @TdxLayoutGroupButton.Create);
//  RegisterHeader(G,
//       'destructor Destroy; override;',
//       @TdxLayoutGroupButton.Destroy);
//  RegisterHeader(G,
//       'procedure Assign(Source: TPersistent); override;',
//       @TdxLayoutGroupButton.Assign);
//  RegisterHeader(G,
//       'function GetNamePath: string; override;',
//       @TdxLayoutGroupButton.GetNamePath);
  // End of class TdxLayoutGroupButton
  // Begin of class TdxLayoutGroupButtons
  G := RegisterClassType(H, TdxLayoutGroupButtons);
//  RegisterHeader(G,
//       'constructor Create(AOptions: TdxLayoutGroupButtonOptions);',
//       @TdxLayoutGroupButtons.Create);
//  RegisterFakeHeader(G,
//       'function TdxLayoutGroupButtons_GetItems(Index: Integer):TdxLayoutGroupButton;',
//       @TdxLayoutGroupButtons_GetItems);
//  RegisterFakeHeader(G,
//       'procedure TdxLayoutGroupButtons_PutItems(Index: Integer;const Value: TdxLayoutGroupButton);',
//       @TdxLayoutGroupButtons_PutItems);
//  RegisterProperty(G,
//       'property Items[Index: Integer]:TdxLayoutGroupButton read TdxLayoutGroupButtons_GetItems write TdxLayoutGroupButtons_PutItems;default;');
  // End of class TdxLayoutGroupButtons
  RegisterRTTIType(H, TypeInfo(TdxLayoutGroupButtonsAlignment));
  // Begin of class TdxLayoutGroupButtonOptions
  G := RegisterClassType(H, TdxLayoutGroupButtonOptions);
//  RegisterHeader(G,
//       'constructor Create(AGroup: TdxLayoutGroup);',
//       @TdxLayoutGroupButtonOptions.Create);
//  RegisterHeader(G,
//       'destructor Destroy; override;',
//       @TdxLayoutGroupButtonOptions.Destroy);
//  RegisterHeader(G,
//       'procedure Assign(Source: TPersistent); override;',
//       @TdxLayoutGroupButtonOptions.Assign);
//  RegisterFakeHeader(G,
//       'function TdxLayoutGroupButtonOptions_GetExpandButton:TdxLayoutGroupButton;',
//       @TdxLayoutGroupButtonOptions_GetExpandButton);
//  RegisterProperty(G,
//       'property ExpandButton:TdxLayoutGroupButton read TdxLayoutGroupButtonOptions_GetExpandButton;');
//  RegisterFakeHeader(G,
//       'function TdxLayoutGroupButtonOptions_GetGroup:TdxLayoutGroup;',
//       @TdxLayoutGroupButtonOptions_GetGroup);
//  RegisterProperty(G,
//       'property Group:TdxLayoutGroup read TdxLayoutGroupButtonOptions_GetGroup;');
//  RegisterFakeHeader(G,
//       'function TdxLayoutGroupButtonOptions_GetVisibleCount:Integer;',
//       @TdxLayoutGroupButtonOptions_GetVisibleCount);
//  RegisterProperty(G,
//       'property VisibleCount:Integer read TdxLayoutGroupButtonOptions_GetVisibleCount;');
  // End of class TdxLayoutGroupButtonOptions
  // Begin of class TdxLayoutGroupCaptionOptions
  G := RegisterClassType(H, TdxLayoutGroupCaptionOptions);
//  RegisterHeader(G,
//       'constructor Create(AItem: TdxCustomLayoutItem); override;',
//       @TdxLayoutGroupCaptionOptions.Create);
  // End of class TdxLayoutGroupCaptionOptions
  RegisterRTTIType(H, TypeInfo(TdxLayoutItemControlAreaAlignment));
  // Begin of class TdxLayoutGroup
  G := RegisterClassType(H, TdxLayoutGroup);
//  RegisterHeader(G,
//       'constructor Create(AOwner: TComponent); override;',
//       @TdxLayoutGroup.Create);
//  RegisterHeader(G,
//       'destructor Destroy; override;',
//       @TdxLayoutGroup.Destroy);
//  RegisterHeader(G,
//       'procedure Assign(Source: TPersistent); override;',
//       @TdxLayoutGroup.Assign);
//  RegisterHeader(G,
//       'function CreateGroup(): TdxLayoutGroup();',
//       @TdxLayoutGroup.CreateGroup);
//  RegisterHeader(G,
//       'function CreateItem(AItemClass: TdxCustomLayoutItemClass = nil): TdxCustomLayoutItem;',
//       @TdxLayoutGroup.CreateItem);
//  RegisterHeader(G,
//       'function CreateItemForControl(AControl: TControl): TdxLayoutItem;',
//       @TdxLayoutGroup.CreateItemForControl);
//  RegisterHeader(G,
//       'function CanMoveTo(AParent: TdxCustomLayoutItem): Boolean; override;',
//       @TdxLayoutGroup.CanMoveTo);
//  RegisterHeader(G,
//       'procedure MoveChildrenToParent;',
//       @TdxLayoutGroup.MoveChildrenToParent);
//  RegisterHeader(G,
//       'function PutChildrenIntoHiddenGroup: TdxLayoutGroup;',
//       @TdxLayoutGroup.PutChildrenIntoHiddenGroup);
//  RegisterFakeHeader(G,
//       'function TdxLayoutGroup_GetCount:Integer;',
//       @TdxLayoutGroup_GetCount);
//  RegisterProperty(G,
//       'property Count:Integer read TdxLayoutGroup_GetCount;');
//  RegisterFakeHeader(G,
//       'function TdxLayoutGroup_GetItems(Index: Integer):TdxCustomLayoutItem;',
//       @TdxLayoutGroup_GetItems);
//  RegisterProperty(G,
//       'property Items[Index: Integer]:TdxCustomLayoutItem read TdxLayoutGroup_GetItems;default;');
//  RegisterFakeHeader(G,
//       'function TdxLayoutGroup_GetViewInfo:TdxLayoutGroupViewInfo;',
//       @TdxLayoutGroup_GetViewInfo);
//  RegisterProperty(G,
//       'property ViewInfo:TdxLayoutGroupViewInfo read TdxLayoutGroup_GetViewInfo;');
//  RegisterFakeHeader(G,
//       'function TdxLayoutGroup_GetVisibleCount:Integer;',
//       @TdxLayoutGroup_GetVisibleCount);
//  RegisterProperty(G,
//       'property VisibleCount:Integer read TdxLayoutGroup_GetVisibleCount;');
//  RegisterFakeHeader(G,
//       'function TdxLayoutGroup_GetVisibleItems(Index: Integer):TdxCustomLayoutItem;',
//       @TdxLayoutGroup_GetVisibleItems);
//  RegisterProperty(G,
//       'property VisibleItems[Index: Integer]:TdxCustomLayoutItem read TdxLayoutGroup_GetVisibleItems;');
  // End of class TdxLayoutGroup
end;
initialization
  RegisterIMPORT_dxLayoutContainer;
end.

