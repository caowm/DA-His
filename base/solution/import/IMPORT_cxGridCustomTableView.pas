unit IMPORT_cxGridCustomTableView;
interface
uses
  Variants,
  Windows,
  Messages,
  Classes,
  Graphics,
  Controls,
  Forms,
  StdCtrls,
  Dialogs,
  cxClasses,
  cxGraphics,
  cxControls,
  cxLookAndFeels,
  cxLookAndFeelPainters,
  cxStorage,
  cxPC,
  cxFilterControl,
  cxNavigator,
  cxListBox,
  cxEdit,
  cxButtons,
  cxDataStorage,
  cxCustomData,
  cxData,
  cxFilter,
  cxDataUtils,
  cxContainer,
  cxCheckBox,
  cxCheckListBox,
  cxStyles,
  cxGridCommon,
  cxGridCustomView,
  cxMemo,
  dxCoreClasses,
  cxGridCustomTableView,
  PaxCompiler,
  PaxRegister;
procedure RegisterIMPORT_cxGridCustomTableView;
implementation
function TcxCustomGridRecord_GetDragHighlighted(Self:TcxCustomGridRecord):Boolean;
begin
  result := Self.DragHighlighted;
end;
function TcxCustomGridRecord_GetDisplayTexts(Self:TcxCustomGridRecord;Index: Integer):string;
begin
  result := Self.DisplayTexts[Index];
end;
procedure TcxCustomGridRecord_PutDisplayTexts(Self:TcxCustomGridRecord;Index: Integer;const Value: string);
begin
  Self.DisplayTexts[Index] := Value;
end;
function TcxCustomGridRecord_GetExpandable(Self:TcxCustomGridRecord):Boolean;
begin
  result := Self.Expandable;
end;
function TcxCustomGridRecord_GetExpanded(Self:TcxCustomGridRecord):Boolean;
begin
  result := Self.Expanded;
end;
procedure TcxCustomGridRecord_PutExpanded(Self:TcxCustomGridRecord;const Value: Boolean);
begin
  Self.Expanded := Value;
end;
function TcxCustomGridRecord_GetFocused(Self:TcxCustomGridRecord):Boolean;
begin
  result := Self.Focused;
end;
procedure TcxCustomGridRecord_PutFocused(Self:TcxCustomGridRecord;const Value: Boolean);
begin
  Self.Focused := Value;
end;
function TcxCustomGridRecord_GetGridView(Self:TcxCustomGridRecord):TcxCustomGridTableView;
begin
  result := Self.GridView;
end;
function TcxCustomGridRecord_GetHasCells(Self:TcxCustomGridRecord):Boolean;
begin
  result := Self.HasCells;
end;
function TcxCustomGridRecord_GetIndex(Self:TcxCustomGridRecord):Integer;
begin
  result := Self.Index;
end;
function TcxCustomGridRecord_GetIsData(Self:TcxCustomGridRecord):Boolean;
begin
  result := Self.IsData;
end;
function TcxCustomGridRecord_GetIsEditing(Self:TcxCustomGridRecord):Boolean;
begin
  result := Self.IsEditing;
end;
function TcxCustomGridRecord_GetIsFirst(Self:TcxCustomGridRecord):Boolean;
begin
  result := Self.IsFirst;
end;
function TcxCustomGridRecord_GetIsLast(Self:TcxCustomGridRecord):Boolean;
begin
  result := Self.IsLast;
end;
function TcxCustomGridRecord_GetIsNewItemRecord(Self:TcxCustomGridRecord):Boolean;
begin
  result := Self.IsNewItemRecord;
end;
function TcxCustomGridRecord_GetLevel(Self:TcxCustomGridRecord):Integer;
begin
  result := Self.Level;
end;
function TcxCustomGridRecord_GetParentRecord(Self:TcxCustomGridRecord):TcxCustomGridRecord;
begin
  result := Self.ParentRecord;
end;
function TcxCustomGridRecord_GetPartVisible(Self:TcxCustomGridRecord):Boolean;
begin
  result := Self.PartVisible;
end;
function TcxCustomGridRecord_GetRecordIndex(Self:TcxCustomGridRecord):Integer;
begin
  result := Self.RecordIndex;
end;
function TcxCustomGridRecord_GetSelected(Self:TcxCustomGridRecord):Boolean;
begin
  result := Self.Selected;
end;
procedure TcxCustomGridRecord_PutSelected(Self:TcxCustomGridRecord;const Value: Boolean);
begin
  Self.Selected := Value;
end;
function TcxCustomGridRecord_GetValueCount(Self:TcxCustomGridRecord):Integer;
begin
  result := Self.ValueCount;
end;
function TcxCustomGridRecord_GetValues(Self:TcxCustomGridRecord;Index: Integer):Variant;
begin
  result := Self.Values[Index];
end;
procedure TcxCustomGridRecord_PutValues(Self:TcxCustomGridRecord;Index: Integer;const Value: Variant);
begin
  Self.Values[Index] := Value;
end;
function TcxCustomGridRecord_GetViewData(Self:TcxCustomGridRecord):TcxCustomGridTableViewData;
begin
  result := Self.ViewData;
end;
function TcxCustomGridRecord_GetViewInfo(Self:TcxCustomGridRecord):TcxCustomGridRecordViewInfo;
begin
  result := Self.ViewInfo;
end;
function TcxCustomGridRecord_GetVisible(Self:TcxCustomGridRecord):Boolean;
begin
  result := Self.Visible;
end;
function TcxCustomGridTableViewData_GetCustomDataDisplayText2(Self: TcxCustomGridTableViewData;AItemIndex: Integer; const AValue: Variant): string; 
begin
  result := Self.GetCustomDataDisplayText(AITEMINDEX,AVALUE);
end;
function TcxCustomGridTableViewData_GetEditingRecord(Self:TcxCustomGridTableViewData):TcxCustomGridRecord;
begin
  result := Self.EditingRecord;
end;
function TcxCustomGridTableViewData_GetGridView(Self:TcxCustomGridTableViewData):TcxCustomGridTableView;
begin
  result := Self.GridView;
end;
function TcxCustomGridTableViewData_GetNewItemRecord(Self:TcxCustomGridTableViewData):TcxCustomGridRecord;
begin
  result := Self.NewItemRecord;
end;
function TcxCustomGridTableViewData_GetRecordCount(Self:TcxCustomGridTableViewData):Integer;
begin
  result := Self.RecordCount;
end;
function TcxCustomGridTableViewData_GetRecords(Self:TcxCustomGridTableViewData;Index: Integer):TcxCustomGridRecord;
begin
  result := Self.Records[Index];
end;
function TcxGridTableCellViewInfo_GetGridRecord(Self:TcxGridTableCellViewInfo):TcxCustomGridRecord;
begin
  result := Self.GridRecord;
end;
function TcxGridTableCellViewInfo_GetGridView(Self:TcxGridTableCellViewInfo):TcxCustomGridTableView;
begin
  result := Self.GridView;
end;
function TcxGridTableCellViewInfo_GetGridViewInfo(Self:TcxGridTableCellViewInfo):TcxCustomGridTableViewInfo;
begin
  result := Self.GridViewInfo;
end;
function TcxGridTableCellViewInfo_GetRecordViewInfo(Self:TcxGridTableCellViewInfo):TcxCustomGridRecordViewInfo;
begin
  result := Self.RecordViewInfo;
end;
function TcxGridTableCellViewInfo_GetSelected(Self:TcxGridTableCellViewInfo):Boolean;
begin
  result := Self.Selected;
end;
function TcxGridTableDataCellViewInfo_GetDisplayValue(Self:TcxGridTableDataCellViewInfo):TcxEditValue;
begin
  result := Self.DisplayValue;
end;
function TcxGridTableDataCellViewInfo_GetEditBounds(Self:TcxGridTableDataCellViewInfo):TRect;
begin
  result := Self.EditBounds;
end;
function TcxGridTableDataCellViewInfo_GetEditing(Self:TcxGridTableDataCellViewInfo):Boolean;
begin
  result := Self.Editing;
end;
function TcxGridTableDataCellViewInfo_GetEditViewInfo(Self:TcxGridTableDataCellViewInfo):TcxCustomEditViewInfo;
begin
  result := Self.EditViewInfo;
end;
function TcxGridTableDataCellViewInfo_GetFocused(Self:TcxGridTableDataCellViewInfo):Boolean;
begin
  result := Self.Focused;
end;
function TcxGridTableDataCellViewInfo_GetItem(Self:TcxGridTableDataCellViewInfo):TcxCustomGridTableItem;
begin
  result := Self.Item;
end;
function TcxGridTableDataCellViewInfo_GetProperties(Self:TcxGridTableDataCellViewInfo):TcxCustomEditProperties;
begin
  result := Self.Properties;
end;
function TcxGridTableDataCellViewInfo_GetStyle(Self:TcxGridTableDataCellViewInfo):TcxEditStyle;
begin
  result := Self.Style;
end;
function TcxGridTableDataCellViewInfo_GetValue(Self:TcxGridTableDataCellViewInfo):Variant;
begin
  result := Self.Value;
end;
function TcxCustomGridRecordViewInfo_GetContentBounds(Self:TcxCustomGridRecordViewInfo):TRect;
begin
  result := Self.ContentBounds;
end;
function TcxCustomGridRecordViewInfo_GetExpandButtonBounds(Self:TcxCustomGridRecordViewInfo):TRect;
begin
  result := Self.ExpandButtonBounds;
end;
function TcxCustomGridRecordViewInfo_GetFocused(Self:TcxCustomGridRecordViewInfo):Boolean;
begin
  result := Self.Focused;
end;
function TcxCustomGridRecordViewInfo_GetFocusRectBounds(Self:TcxCustomGridRecordViewInfo):TRect;
begin
  result := Self.FocusRectBounds;
end;
function TcxCustomGridRecordViewInfo_GetFullyVisible(Self:TcxCustomGridRecordViewInfo):Boolean;
begin
  result := Self.FullyVisible;
end;
function TcxCustomGridRecordViewInfo_GetGridView(Self:TcxCustomGridRecordViewInfo):TcxCustomGridTableView;
begin
  result := Self.GridView;
end;
function TcxCustomGridRecordViewInfo_GetGridRecord(Self:TcxCustomGridRecordViewInfo):TcxCustomGridRecord;
begin
  result := Self.GridRecord;
end;
function TcxCustomGridRecordViewInfo_GetGridViewInfo(Self:TcxCustomGridRecordViewInfo):TcxCustomGridTableViewInfo;
begin
  result := Self.GridViewInfo;
end;
function TcxCustomGridRecordViewInfo_GetIndex(Self:TcxCustomGridRecordViewInfo):Integer;
begin
  result := Self.Index;
end;
function TcxCustomGridRecordViewInfo_GetHideFocusRectOnExit(Self:TcxCustomGridRecordViewInfo):Boolean;
begin
  result := Self.HideFocusRectOnExit;
end;
function TcxCustomGridRecordViewInfo_GetRecordsViewInfo(Self:TcxCustomGridRecordViewInfo):TcxCustomGridRecordsViewInfo;
begin
  result := Self.RecordsViewInfo;
end;
function TcxCustomGridRecordViewInfo_GetSelected(Self:TcxCustomGridRecordViewInfo):Boolean;
begin
  result := Self.Selected;
end;
function TcxCustomGridRecordsViewInfo_GetAutoDataCellHeight(Self:TcxCustomGridRecordsViewInfo):Boolean;
begin
  result := Self.AutoDataCellHeight;
end;
function TcxCustomGridRecordsViewInfo_GetAutoDataRecordHeight(Self:TcxCustomGridRecordsViewInfo):Boolean;
begin
  result := Self.AutoDataRecordHeight;
end;
function TcxCustomGridRecordsViewInfo_GetAutoRecordHeight(Self:TcxCustomGridRecordsViewInfo):Boolean;
begin
  result := Self.AutoRecordHeight;
end;
function TcxCustomGridRecordsViewInfo_GetBackgroundBitmap(Self:TcxCustomGridRecordsViewInfo):TBitmap;
begin
  result := Self.BackgroundBitmap;
end;
procedure TcxCustomGridRecordsViewInfo_PutBackgroundBitmap(Self:TcxCustomGridRecordsViewInfo;const Value: TBitmap);
begin
  Self.BackgroundBitmap := Value;
end;
function TcxCustomGridRecordsViewInfo_GetBounds(Self:TcxCustomGridRecordsViewInfo):TRect;
begin
  result := Self.Bounds;
end;
function TcxCustomGridRecordsViewInfo_GetContentBounds(Self:TcxCustomGridRecordsViewInfo):TRect;
begin
  result := Self.ContentBounds;
end;
function TcxCustomGridRecordsViewInfo_GetCount(Self:TcxCustomGridRecordsViewInfo):Integer;
begin
  result := Self.Count;
end;
function TcxCustomGridRecordsViewInfo_GetGridView(Self:TcxCustomGridRecordsViewInfo):TcxCustomGridTableView;
begin
  result := Self.GridView;
end;
function TcxCustomGridRecordsViewInfo_GetItems(Self:TcxCustomGridRecordsViewInfo;Index: Integer):TcxCustomGridRecordViewInfo;
begin
  result := Self.Items[Index];
end;
function TcxCustomGridRecordsViewInfo_GetItemsOffset(Self:TcxCustomGridRecordsViewInfo):Integer;
begin
  result := Self.ItemsOffset;
end;
function TcxCustomGridRecordsViewInfo_GetVisibleCount(Self:TcxCustomGridRecordsViewInfo):Integer;
begin
  result := Self.VisibleCount;
end;
function TcxCustomGridTableViewInfo_GetCalculateDown(Self:TcxCustomGridTableViewInfo):Boolean;
begin
  result := Self.CalculateDown;
end;
procedure TcxCustomGridTableViewInfo_PutCalculateDown(Self:TcxCustomGridTableViewInfo;const Value: Boolean);
begin
  Self.CalculateDown := Value;
end;
function TcxCustomGridTableViewInfo_GetExpandButtonSize(Self:TcxCustomGridTableViewInfo):Integer;
begin
  result := Self.ExpandButtonSize;
end;
function TcxCustomGridTableViewInfo_GetFilterViewInfo(Self:TcxCustomGridTableViewInfo):TcxGridFilterViewInfo;
begin
  result := Self.FilterViewInfo;
end;
function TcxCustomGridTableViewInfo_GetFirstRecordIndex(Self:TcxCustomGridTableViewInfo):Integer;
begin
  result := Self.FirstRecordIndex;
end;
procedure TcxCustomGridTableViewInfo_PutFirstRecordIndex(Self:TcxCustomGridTableViewInfo;const Value: Integer);
begin
  Self.FirstRecordIndex := Value;
end;
function TcxCustomGridTableViewInfo_GetGridView(Self:TcxCustomGridTableViewInfo):TcxCustomGridTableView;
begin
  result := Self.GridView;
end;
function TcxCustomGridTableViewInfo_GetNavigatorBounds(Self:TcxCustomGridTableViewInfo):TRect;
begin
  result := Self.NavigatorBounds;
end;
function TcxCustomGridTableViewInfo_GetNavigatorOffset(Self:TcxCustomGridTableViewInfo):Integer;
begin
  result := Self.NavigatorOffset;
end;
function TcxCustomGridTableViewInfo_GetNavigatorSiteViewInfo(Self:TcxCustomGridTableViewInfo):TcxNavigatorSiteViewInfo;
begin
  result := Self.NavigatorSiteViewInfo;
end;
function TcxCustomGridTableViewInfo_GetNavigatorViewInfo(Self:TcxCustomGridTableViewInfo):TcxNavigatorViewInfo;
begin
  result := Self.NavigatorViewInfo;
end;
function TcxCustomGridTableViewInfo_GetNoDataInfoText(Self:TcxCustomGridTableViewInfo):string;
begin
  result := Self.NoDataInfoText;
end;
function TcxCustomGridTableViewInfo_GetNoDataInfoTextAreaBounds(Self:TcxCustomGridTableViewInfo):TRect;
begin
  result := Self.NoDataInfoTextAreaBounds;
end;
function TcxCustomGridTableViewInfo_GetNoDataInfoTextAreaVisible(Self:TcxCustomGridTableViewInfo):Boolean;
begin
  result := Self.NoDataInfoTextAreaVisible;
end;
function TcxCustomGridTableViewInfo_GetPartsBottomHeight(Self:TcxCustomGridTableViewInfo):Integer;
begin
  result := Self.PartsBottomHeight;
end;
function TcxCustomGridTableViewInfo_GetPartsTopHeight(Self:TcxCustomGridTableViewInfo):Integer;
begin
  result := Self.PartsTopHeight;
end;
function TcxCustomGridTableViewInfo_GetRecordsViewInfo(Self:TcxCustomGridTableViewInfo):TcxCustomGridRecordsViewInfo;
begin
  result := Self.RecordsViewInfo;
end;
function TcxCustomGridTableViewInfo_GetScrollableAreaBounds(Self:TcxCustomGridTableViewInfo):TRect;
begin
  result := Self.ScrollableAreaBounds;
end;
function TcxCustomGridTableViewInfo_GetScrollableAreaBoundsForEdit(Self:TcxCustomGridTableViewInfo):TRect;
begin
  result := Self.ScrollableAreaBoundsForEdit;
end;
function TcxCustomGridTableViewInfo_GetScrollableAreaBoundsHorz(Self:TcxCustomGridTableViewInfo):TRect;
begin
  result := Self.ScrollableAreaBoundsHorz;
end;
function TcxCustomGridTableViewInfo_GetScrollableAreaBoundsVert(Self:TcxCustomGridTableViewInfo):TRect;
begin
  result := Self.ScrollableAreaBoundsVert;
end;
function TcxCustomGridTableViewInfo_GetScrollableAreaWidth(Self:TcxCustomGridTableViewInfo):Integer;
begin
  result := Self.ScrollableAreaWidth;
end;
function TcxCustomGridTableViewInfo_GetVisibleRecordCount(Self:TcxCustomGridTableViewInfo):Integer;
begin
  result := Self.VisibleRecordCount;
end;
function TcxCustomGridTableItem_GetActuallyVisible(Self:TcxCustomGridTableItem):Boolean;
begin
  result := Self.ActuallyVisible;
end;
function TcxCustomGridTableItem_GetBestFitMaxWidth(Self:TcxCustomGridTableItem):Integer;
begin
  result := Self.BestFitMaxWidth;
end;
procedure TcxCustomGridTableItem_PutBestFitMaxWidth(Self:TcxCustomGridTableItem;const Value: Integer);
begin
  Self.BestFitMaxWidth := Value;
end;
function TcxCustomGridTableItem_GetEditable(Self:TcxCustomGridTableItem):Boolean;
begin
  result := Self.Editable;
end;
function TcxCustomGridTableItem_GetEditing(Self:TcxCustomGridTableItem):Boolean;
begin
  result := Self.Editing;
end;
procedure TcxCustomGridTableItem_PutEditing(Self:TcxCustomGridTableItem;const Value: Boolean);
begin
  Self.Editing := Value;
end;
function TcxCustomGridTableItem_GetEditValue(Self:TcxCustomGridTableItem):Variant;
begin
  result := Self.EditValue;
end;
procedure TcxCustomGridTableItem_PutEditValue(Self:TcxCustomGridTableItem;const Value: Variant);
begin
  Self.EditValue := Value;
end;
function TcxCustomGridTableItem_GetFiltered(Self:TcxCustomGridTableItem):Boolean;
begin
  result := Self.Filtered;
end;
procedure TcxCustomGridTableItem_PutFiltered(Self:TcxCustomGridTableItem;const Value: Boolean);
begin
  Self.Filtered := Value;
end;
function TcxCustomGridTableItem_GetFilteringDateRanges(Self:TcxCustomGridTableItem):TcxGridFilteringDateRanges;
begin
  result := Self.FilteringDateRanges;
end;
function TcxCustomGridTableItem_GetFocused(Self:TcxCustomGridTableItem):Boolean;
begin
  result := Self.Focused;
end;
procedure TcxCustomGridTableItem_PutFocused(Self:TcxCustomGridTableItem;const Value: Boolean);
begin
  Self.Focused := Value;
end;
function TcxCustomGridTableItem_GetFocusedCellViewInfo(Self:TcxCustomGridTableItem):TcxGridTableDataCellViewInfo;
begin
  result := Self.FocusedCellViewInfo;
end;
function TcxCustomGridTableItem_GetGridView(Self:TcxCustomGridTableItem):TcxCustomGridTableView;
begin
  result := Self.GridView;
end;
function TcxCustomGridTableItem_GetHideable(Self:TcxCustomGridTableItem):Boolean;
begin
  result := Self.Hideable;
end;
function TcxCustomGridTableItem_GetID(Self:TcxCustomGridTableItem):Integer;
begin
  result := Self.ID;
end;
function TcxCustomGridTableItem_GetIncSearching(Self:TcxCustomGridTableItem):Boolean;
begin
  result := Self.IncSearching;
end;
function TcxCustomGridTableItem_GetIndex(Self:TcxCustomGridTableItem):Integer;
begin
  result := Self.Index;
end;
procedure TcxCustomGridTableItem_PutIndex(Self:TcxCustomGridTableItem;const Value: Integer);
begin
  Self.Index := Value;
end;
function TcxCustomGridTableItem_GetIsFirst(Self:TcxCustomGridTableItem):Boolean;
begin
  result := Self.IsFirst;
end;
function TcxCustomGridTableItem_GetIsLast(Self:TcxCustomGridTableItem):Boolean;
begin
  result := Self.IsLast;
end;
function TcxCustomGridTableItem_GetOptions(Self:TcxCustomGridTableItem):TcxCustomGridTableItemOptions;
begin
  result := Self.Options;
end;
procedure TcxCustomGridTableItem_PutOptions(Self:TcxCustomGridTableItem;const Value: TcxCustomGridTableItemOptions);
begin
  Self.Options := Value;
end;
function TcxCustomGridTableItem_GetPropertiesClass(Self:TcxCustomGridTableItem):TcxCustomEditPropertiesClass;
begin
  result := Self.PropertiesClass;
end;
procedure TcxCustomGridTableItem_PutPropertiesClass(Self:TcxCustomGridTableItem;const Value: TcxCustomEditPropertiesClass);
begin
  Self.PropertiesClass := Value;
end;
function TcxCustomGridTableItem_GetSortIndex(Self:TcxCustomGridTableItem):Integer;
begin
  result := Self.SortIndex;
end;
procedure TcxCustomGridTableItem_PutSortIndex(Self:TcxCustomGridTableItem;const Value: Integer);
begin
  Self.SortIndex := Value;
end;
function TcxCustomGridTableItem_GetSortOrder(Self:TcxCustomGridTableItem):TcxGridSortOrder;
begin
  result := Self.SortOrder;
end;
procedure TcxCustomGridTableItem_PutSortOrder(Self:TcxCustomGridTableItem;const Value: TcxGridSortOrder);
begin
  Self.SortOrder := Value;
end;
function TcxCustomGridTableItem_GetStyles(Self:TcxCustomGridTableItem):TcxCustomGridTableItemStyles;
begin
  result := Self.Styles;
end;
procedure TcxCustomGridTableItem_PutStyles(Self:TcxCustomGridTableItem;const Value: TcxCustomGridTableItemStyles);
begin
  Self.Styles := Value;
end;
function TcxCustomGridTableItem_GetVisibleCaption(Self:TcxCustomGridTableItem):string;
begin
  result := Self.VisibleCaption;
end;
function TcxCustomGridTableItem_GetVisibleIndex(Self:TcxCustomGridTableItem):Integer;
begin
  result := Self.VisibleIndex;
end;
function TcxCustomGridTableView_GetController(Self:TcxCustomGridTableView):TcxCustomGridTableController;
begin
  result := Self.Controller;
end;
function TcxCustomGridTableView_GetDateTimeHandling(Self:TcxCustomGridTableView):TcxCustomGridTableDateTimeHandling;
begin
  result := Self.DateTimeHandling;
end;
procedure TcxCustomGridTableView_PutDateTimeHandling(Self:TcxCustomGridTableView;const Value: TcxCustomGridTableDateTimeHandling);
begin
  Self.DateTimeHandling := Value;
end;
function TcxCustomGridTableView_GetFiltering(Self:TcxCustomGridTableView):TcxCustomGridTableFiltering;
begin
  result := Self.Filtering;
end;
procedure TcxCustomGridTableView_PutFiltering(Self:TcxCustomGridTableView;const Value: TcxCustomGridTableFiltering);
begin
  Self.Filtering := Value;
end;
function TcxCustomGridTableView_GetGroupedItemCount(Self:TcxCustomGridTableView):Integer;
begin
  result := Self.GroupedItemCount;
end;
function TcxCustomGridTableView_GetGroupedItems(Self:TcxCustomGridTableView;Index: Integer):TcxCustomGridTableItem;
begin
  result := Self.GroupedItems[Index];
end;
function TcxCustomGridTableView_GetItemCount(Self:TcxCustomGridTableView):Integer;
begin
  result := Self.ItemCount;
end;
function TcxCustomGridTableView_GetItems(Self:TcxCustomGridTableView;Index: Integer):TcxCustomGridTableItem;
begin
  result := Self.Items[Index];
end;
procedure TcxCustomGridTableView_PutItems(Self:TcxCustomGridTableView;Index: Integer;const Value: TcxCustomGridTableItem);
begin
  Self.Items[Index] := Value;
end;
function TcxCustomGridTableView_GetMasterGridRecord(Self:TcxCustomGridTableView):TcxCustomGridRecord;
begin
  result := Self.MasterGridRecord;
end;
function TcxCustomGridTableView_GetOptionsBehavior(Self:TcxCustomGridTableView):TcxCustomGridTableOptionsBehavior;
begin
  result := Self.OptionsBehavior;
end;
procedure TcxCustomGridTableView_PutOptionsBehavior(Self:TcxCustomGridTableView;const Value: TcxCustomGridTableOptionsBehavior);
begin
  Self.OptionsBehavior := Value;
end;
function TcxCustomGridTableView_GetOptionsCustomize(Self:TcxCustomGridTableView):TcxCustomGridTableOptionsCustomize;
begin
  result := Self.OptionsCustomize;
end;
procedure TcxCustomGridTableView_PutOptionsCustomize(Self:TcxCustomGridTableView;const Value: TcxCustomGridTableOptionsCustomize);
begin
  Self.OptionsCustomize := Value;
end;
function TcxCustomGridTableView_GetOptionsData(Self:TcxCustomGridTableView):TcxCustomGridTableOptionsData;
begin
  result := Self.OptionsData;
end;
procedure TcxCustomGridTableView_PutOptionsData(Self:TcxCustomGridTableView;const Value: TcxCustomGridTableOptionsData);
begin
  Self.OptionsData := Value;
end;
function TcxCustomGridTableView_GetOptionsSelection(Self:TcxCustomGridTableView):TcxCustomGridTableOptionsSelection;
begin
  result := Self.OptionsSelection;
end;
procedure TcxCustomGridTableView_PutOptionsSelection(Self:TcxCustomGridTableView;const Value: TcxCustomGridTableOptionsSelection);
begin
  Self.OptionsSelection := Value;
end;
function TcxCustomGridTableView_GetOptionsView(Self:TcxCustomGridTableView):TcxCustomGridTableOptionsView;
begin
  result := Self.OptionsView;
end;
procedure TcxCustomGridTableView_PutOptionsView(Self:TcxCustomGridTableView;const Value: TcxCustomGridTableOptionsView);
begin
  Self.OptionsView := Value;
end;
function TcxCustomGridTableView_GetPainter(Self:TcxCustomGridTableView):TcxCustomGridTablePainter;
begin
  result := Self.Painter;
end;
function TcxCustomGridTableView_GetPatternGridView(Self:TcxCustomGridTableView):TcxCustomGridTableView;
begin
  result := Self.PatternGridView;
end;
function TcxCustomGridTableView_GetSortedItemCount(Self:TcxCustomGridTableView):Integer;
begin
  result := Self.SortedItemCount;
end;
function TcxCustomGridTableView_GetSortedItems(Self:TcxCustomGridTableView;Index: Integer):TcxCustomGridTableItem;
begin
  result := Self.SortedItems[Index];
end;
function TcxCustomGridTableView_GetStyles(Self:TcxCustomGridTableView):TcxCustomGridTableViewStyles;
begin
  result := Self.Styles;
end;
procedure TcxCustomGridTableView_PutStyles(Self:TcxCustomGridTableView;const Value: TcxCustomGridTableViewStyles);
begin
  Self.Styles := Value;
end;
function TcxCustomGridTableView_GetViewData(Self:TcxCustomGridTableView):TcxCustomGridTableViewData;
begin
  result := Self.ViewData;
end;
function TcxCustomGridTableView_GetViewInfo(Self:TcxCustomGridTableView):TcxCustomGridTableViewInfo;
begin
  result := Self.ViewInfo;
end;
function TcxCustomGridTableView_GetVisibleItemCount(Self:TcxCustomGridTableView):Integer;
begin
  result := Self.VisibleItemCount;
end;
function TcxCustomGridTableView_GetVisibleItems(Self:TcxCustomGridTableView;Index: Integer):TcxCustomGridTableItem;
begin
  result := Self.VisibleItems[Index];
end;
procedure RegisterIMPORT_cxGridCustomTableView;
var G, H: Integer;
begin
  H := RegisterNamespace(0, 'cxGridCustomTableView');
  // Begin of class TcxCustomGridRecord
  G := RegisterClassType(H, TcxCustomGridRecord);
  RegisterHeader(G, 
       'constructor Create(AViewData: TcxCustomGridTableViewData; AIndex: Integer;      const ARecordInfo: TcxRowInfo); virtual;',
       @TcxCustomGridRecord.Create);
  RegisterHeader(G, 
       'destructor Destroy; override;',
       @TcxCustomGridRecord.Destroy);
  RegisterHeader(G, 
       'function CanFocus: Boolean; virtual;',
       @TcxCustomGridRecord.CanFocus);
  RegisterHeader(G, 
       'function CanFocusCells: Boolean; virtual;',
       @TcxCustomGridRecord.CanFocusCells);
  RegisterHeader(G, 
       'procedure Collapse(ARecurse: Boolean);',
       @TcxCustomGridRecord.Collapse);
  RegisterHeader(G, 
       'procedure Expand(ARecurse: Boolean);',
       @TcxCustomGridRecord.Expand);
  RegisterHeader(G, 
       'function GetFirstFocusableChild: TcxCustomGridRecord; virtual;',
       @TcxCustomGridRecord.GetFirstFocusableChild);
  RegisterHeader(G, 
       'function GetLastFocusableChild(ARecursive: Boolean): TcxCustomGridRecord; virtual;',
       @TcxCustomGridRecord.GetLastFocusableChild);
  RegisterHeader(G, 
       'procedure Invalidate(AItem: TcxCustomGridTableItem = nil); virtual;',
       @TcxCustomGridRecord.Invalidate);
  RegisterHeader(G, 
       'procedure MakeVisible;',
       @TcxCustomGridRecord.MakeVisible);
  RegisterFakeHeader(G, 
       'function TcxCustomGridRecord_GetDragHighlighted:Boolean;',
       @TcxCustomGridRecord_GetDragHighlighted);
  RegisterProperty(G, 
       'property DragHighlighted:Boolean read TcxCustomGridRecord_GetDragHighlighted;');
  RegisterFakeHeader(G, 
       'function TcxCustomGridRecord_GetDisplayTexts(Index: Integer):string;',
       @TcxCustomGridRecord_GetDisplayTexts);
  RegisterFakeHeader(G, 
       'procedure TcxCustomGridRecord_PutDisplayTexts(Index: Integer;const Value: string);',
       @TcxCustomGridRecord_PutDisplayTexts);
  RegisterProperty(G, 
       'property DisplayTexts[Index: Integer]:string read TcxCustomGridRecord_GetDisplayTexts write TcxCustomGridRecord_PutDisplayTexts;');
  RegisterFakeHeader(G, 
       'function TcxCustomGridRecord_GetExpandable:Boolean;',
       @TcxCustomGridRecord_GetExpandable);
  RegisterProperty(G, 
       'property Expandable:Boolean read TcxCustomGridRecord_GetExpandable;');
  RegisterFakeHeader(G, 
       'function TcxCustomGridRecord_GetExpanded:Boolean;',
       @TcxCustomGridRecord_GetExpanded);
  RegisterFakeHeader(G, 
       'procedure TcxCustomGridRecord_PutExpanded(const Value: Boolean);',
       @TcxCustomGridRecord_PutExpanded);
  RegisterProperty(G, 
       'property Expanded:Boolean read TcxCustomGridRecord_GetExpanded write TcxCustomGridRecord_PutExpanded;');
  RegisterFakeHeader(G, 
       'function TcxCustomGridRecord_GetFocused:Boolean;',
       @TcxCustomGridRecord_GetFocused);
  RegisterFakeHeader(G, 
       'procedure TcxCustomGridRecord_PutFocused(const Value: Boolean);',
       @TcxCustomGridRecord_PutFocused);
  RegisterProperty(G, 
       'property Focused:Boolean read TcxCustomGridRecord_GetFocused write TcxCustomGridRecord_PutFocused;');
  RegisterFakeHeader(G, 
       'function TcxCustomGridRecord_GetGridView:TcxCustomGridTableView;',
       @TcxCustomGridRecord_GetGridView);
  RegisterProperty(G, 
       'property GridView:TcxCustomGridTableView read TcxCustomGridRecord_GetGridView;');
  RegisterFakeHeader(G, 
       'function TcxCustomGridRecord_GetHasCells:Boolean;',
       @TcxCustomGridRecord_GetHasCells);
  RegisterProperty(G, 
       'property HasCells:Boolean read TcxCustomGridRecord_GetHasCells;');
  RegisterFakeHeader(G, 
       'function TcxCustomGridRecord_GetIndex:Integer;',
       @TcxCustomGridRecord_GetIndex);
  RegisterProperty(G, 
       'property Index:Integer read TcxCustomGridRecord_GetIndex;');
  RegisterFakeHeader(G, 
       'function TcxCustomGridRecord_GetIsData:Boolean;',
       @TcxCustomGridRecord_GetIsData);
  RegisterProperty(G, 
       'property IsData:Boolean read TcxCustomGridRecord_GetIsData;');
  RegisterFakeHeader(G, 
       'function TcxCustomGridRecord_GetIsEditing:Boolean;',
       @TcxCustomGridRecord_GetIsEditing);
  RegisterProperty(G, 
       'property IsEditing:Boolean read TcxCustomGridRecord_GetIsEditing;');
  RegisterFakeHeader(G, 
       'function TcxCustomGridRecord_GetIsFirst:Boolean;',
       @TcxCustomGridRecord_GetIsFirst);
  RegisterProperty(G, 
       'property IsFirst:Boolean read TcxCustomGridRecord_GetIsFirst;');
  RegisterFakeHeader(G, 
       'function TcxCustomGridRecord_GetIsLast:Boolean;',
       @TcxCustomGridRecord_GetIsLast);
  RegisterProperty(G, 
       'property IsLast:Boolean read TcxCustomGridRecord_GetIsLast;');
  RegisterFakeHeader(G, 
       'function TcxCustomGridRecord_GetIsNewItemRecord:Boolean;',
       @TcxCustomGridRecord_GetIsNewItemRecord);
  RegisterProperty(G, 
       'property IsNewItemRecord:Boolean read TcxCustomGridRecord_GetIsNewItemRecord;');
  RegisterFakeHeader(G, 
       'function TcxCustomGridRecord_GetLevel:Integer;',
       @TcxCustomGridRecord_GetLevel);
  RegisterProperty(G, 
       'property Level:Integer read TcxCustomGridRecord_GetLevel;');
  RegisterFakeHeader(G, 
       'function TcxCustomGridRecord_GetParentRecord:TcxCustomGridRecord;',
       @TcxCustomGridRecord_GetParentRecord);
  RegisterProperty(G, 
       'property ParentRecord:TcxCustomGridRecord read TcxCustomGridRecord_GetParentRecord;');
  RegisterFakeHeader(G, 
       'function TcxCustomGridRecord_GetPartVisible:Boolean;',
       @TcxCustomGridRecord_GetPartVisible);
  RegisterProperty(G, 
       'property PartVisible:Boolean read TcxCustomGridRecord_GetPartVisible;');
  RegisterFakeHeader(G, 
       'function TcxCustomGridRecord_GetRecordIndex:Integer;',
       @TcxCustomGridRecord_GetRecordIndex);
  RegisterProperty(G, 
       'property RecordIndex:Integer read TcxCustomGridRecord_GetRecordIndex;');
  RegisterFakeHeader(G, 
       'function TcxCustomGridRecord_GetSelected:Boolean;',
       @TcxCustomGridRecord_GetSelected);
  RegisterFakeHeader(G, 
       'procedure TcxCustomGridRecord_PutSelected(const Value: Boolean);',
       @TcxCustomGridRecord_PutSelected);
  RegisterProperty(G, 
       'property Selected:Boolean read TcxCustomGridRecord_GetSelected write TcxCustomGridRecord_PutSelected;');
  RegisterFakeHeader(G, 
       'function TcxCustomGridRecord_GetValueCount:Integer;',
       @TcxCustomGridRecord_GetValueCount);
  RegisterProperty(G, 
       'property ValueCount:Integer read TcxCustomGridRecord_GetValueCount;');
  RegisterFakeHeader(G, 
       'function TcxCustomGridRecord_GetValues(Index: Integer):Variant;',
       @TcxCustomGridRecord_GetValues);
  RegisterFakeHeader(G, 
       'procedure TcxCustomGridRecord_PutValues(Index: Integer;const Value: Variant);',
       @TcxCustomGridRecord_PutValues);
  RegisterProperty(G, 
       'property Values[Index: Integer]:Variant read TcxCustomGridRecord_GetValues write TcxCustomGridRecord_PutValues;');
  RegisterFakeHeader(G, 
       'function TcxCustomGridRecord_GetViewData:TcxCustomGridTableViewData;',
       @TcxCustomGridRecord_GetViewData);
  RegisterProperty(G, 
       'property ViewData:TcxCustomGridTableViewData read TcxCustomGridRecord_GetViewData;');
  RegisterFakeHeader(G, 
       'function TcxCustomGridRecord_GetViewInfo:TcxCustomGridRecordViewInfo;',
       @TcxCustomGridRecord_GetViewInfo);
  RegisterProperty(G, 
       'property ViewInfo:TcxCustomGridRecordViewInfo read TcxCustomGridRecord_GetViewInfo;');
  RegisterFakeHeader(G, 
       'function TcxCustomGridRecord_GetVisible:Boolean;',
       @TcxCustomGridRecord_GetVisible);
  RegisterProperty(G, 
       'property Visible:Boolean read TcxCustomGridRecord_GetVisible;');
  // End of class TcxCustomGridRecord
  RegisterRTTIType(H, TypeInfo(TcxGridDataOperation));
  // Begin of class TcxCustomGridTableViewData
  G := RegisterClassType(H, TcxCustomGridTableViewData);
  RegisterHeader(G, 
       'constructor Create(AGridView: TcxCustomGridView); override;',
       @TcxCustomGridTableViewData.Create);
  RegisterHeader(G, 
       'destructor Destroy; override;',
       @TcxCustomGridTableViewData.Destroy);
  RegisterHeader(G, 
       'procedure Collapse(ARecurse: Boolean); virtual;',
       @TcxCustomGridTableViewData.Collapse);
  RegisterHeader(G, 
       'procedure DestroyRecords;',
       @TcxCustomGridTableViewData.DestroyRecords);
  RegisterHeader(G, 
       'procedure Expand(ARecurse: Boolean); virtual;',
       @TcxCustomGridTableViewData.Expand);
  RegisterHeader(G, 
       'function GetRecordByIndex(AIndex: Integer): TcxCustomGridRecord;',
       @TcxCustomGridTableViewData.GetRecordByIndex);
  RegisterHeader(G, 
       'function GetRecordByRecordIndex(ARecordIndex: Integer): TcxCustomGridRecord;',
       @TcxCustomGridTableViewData.GetRecordByRecordIndex);
  RegisterHeader(G, 
       'function GetRecordIndexByRecord(ARecord: TcxCustomGridRecord): Integer;',
       @TcxCustomGridTableViewData.GetRecordIndexByRecord);
  RegisterHeader(G, 
       'function IsRecordIndexValid(AIndex: Integer): Boolean;',
       @TcxCustomGridTableViewData.IsRecordIndexValid);
  RegisterHeader(G, 
       'procedure Refresh(ARecordCount: Integer); virtual;',
       @TcxCustomGridTableViewData.Refresh);
  RegisterHeader(G, 
       'procedure RefreshRecords;',
       @TcxCustomGridTableViewData.RefreshRecords);
  RegisterHeader(G, 
       'procedure CheckNewItemRecord;',
       @TcxCustomGridTableViewData.CheckNewItemRecord);
  RegisterHeader(G, 
       'function HasNewItemRecord: Boolean; virtual;',
       @TcxCustomGridTableViewData.HasNewItemRecord);
  RegisterHeader(G, 
       'function AddItemToFilter(AParent: TcxFilterCriteriaItemList; AItem: TcxCustomGridTableItem;      AOperatorKind: TcxFilterOperatorKind; const AValue: Variant; ADisplayText: string = '''';      AReplaceExistent: Boolean = True): TcxFilterCriteriaItem;'+'',
       @TcxCustomGridTableViewData.AddItemToFilter);
  RegisterHeader(G, 
       'function CreateFilterValueList: TcxGridFilterValueList;',
       @TcxCustomGridTableViewData.CreateFilterValueList);
  RegisterHeader(G, 
       'function CustomCompareDataValues(AField: TcxCustomDataField; const AValue1, AValue2: Variant;      AMode: TcxDataControllerComparisonMode): Integer; virtual;',
       @TcxCustomGridTableViewData.CustomCompareDataValues);
  RegisterHeader(G, 
       'function GetCustomDataDisplayText(AItemIndex: Integer; const AValue: Variant): string; overload; virtual;',
       @TcxCustomGridTableViewData_GetCustomDataDisplayText2);
  RegisterHeader(G, 
       'function NeedsCustomDataComparison(AField: TcxCustomDataField; AMode: TcxDataControllerComparisonMode): Boolean; virtual;',
       @TcxCustomGridTableViewData.NeedsCustomDataComparison);
  RegisterFakeHeader(G, 
       'function TcxCustomGridTableViewData_GetEditingRecord:TcxCustomGridRecord;',
       @TcxCustomGridTableViewData_GetEditingRecord);
  RegisterProperty(G, 
       'property EditingRecord:TcxCustomGridRecord read TcxCustomGridTableViewData_GetEditingRecord;');
  RegisterFakeHeader(G, 
       'function TcxCustomGridTableViewData_GetGridView:TcxCustomGridTableView;',
       @TcxCustomGridTableViewData_GetGridView);
  RegisterProperty(G, 
       'property GridView:TcxCustomGridTableView read TcxCustomGridTableViewData_GetGridView;');
  RegisterFakeHeader(G, 
       'function TcxCustomGridTableViewData_GetNewItemRecord:TcxCustomGridRecord;',
       @TcxCustomGridTableViewData_GetNewItemRecord);
  RegisterProperty(G, 
       'property NewItemRecord:TcxCustomGridRecord read TcxCustomGridTableViewData_GetNewItemRecord;');
  RegisterFakeHeader(G, 
       'function TcxCustomGridTableViewData_GetRecordCount:Integer;',
       @TcxCustomGridTableViewData_GetRecordCount);
  RegisterProperty(G, 
       'property RecordCount:Integer read TcxCustomGridTableViewData_GetRecordCount;');
  RegisterFakeHeader(G, 
       'function TcxCustomGridTableViewData_GetRecords(Index: Integer):TcxCustomGridRecord;',
       @TcxCustomGridTableViewData_GetRecords);
  RegisterProperty(G, 
       'property Records[Index: Integer]:TcxCustomGridRecord read TcxCustomGridTableViewData_GetRecords;');
  // End of class TcxCustomGridTableViewData
  // Begin of class TcxGridTableCellViewInfo
  G := RegisterClassType(H, TcxGridTableCellViewInfo);
  RegisterHeader(G, 
       'constructor Create(ARecordViewInfo: TcxCustomGridRecordViewInfo); reintroduce; virtual;',
       @TcxGridTableCellViewInfo.Create);
  RegisterHeader(G, 
       'procedure Calculate(ALeftBound, ATopBound: Integer; AWidth: Integer = -1;      AHeight: Integer = -1); override;',
       @TcxGridTableCellViewInfo.Calculate);
  RegisterHeader(G, 
       'function CanDrawSelected: Boolean; virtual;',
       @TcxGridTableCellViewInfo.CanDrawSelected);
  RegisterHeader(G, 
       'function MouseDown(AHitTest: TcxCustomGridHitTest; AButton: TMouseButton;      AShift: TShiftState): Boolean; override;',
       @TcxGridTableCellViewInfo.MouseDown);
  RegisterFakeHeader(G, 
       'function TcxGridTableCellViewInfo_GetGridRecord:TcxCustomGridRecord;',
       @TcxGridTableCellViewInfo_GetGridRecord);
  RegisterProperty(G, 
       'property GridRecord:TcxCustomGridRecord read TcxGridTableCellViewInfo_GetGridRecord;');
  RegisterFakeHeader(G, 
       'function TcxGridTableCellViewInfo_GetGridView:TcxCustomGridTableView;',
       @TcxGridTableCellViewInfo_GetGridView);
  RegisterProperty(G, 
       'property GridView:TcxCustomGridTableView read TcxGridTableCellViewInfo_GetGridView;');
  RegisterFakeHeader(G, 
       'function TcxGridTableCellViewInfo_GetGridViewInfo:TcxCustomGridTableViewInfo;',
       @TcxGridTableCellViewInfo_GetGridViewInfo);
  RegisterProperty(G, 
       'property GridViewInfo:TcxCustomGridTableViewInfo read TcxGridTableCellViewInfo_GetGridViewInfo;');
  RegisterFakeHeader(G, 
       'function TcxGridTableCellViewInfo_GetRecordViewInfo:TcxCustomGridRecordViewInfo;',
       @TcxGridTableCellViewInfo_GetRecordViewInfo);
  RegisterProperty(G, 
       'property RecordViewInfo:TcxCustomGridRecordViewInfo read TcxGridTableCellViewInfo_GetRecordViewInfo;');
  RegisterFakeHeader(G, 
       'function TcxGridTableCellViewInfo_GetSelected:Boolean;',
       @TcxGridTableCellViewInfo_GetSelected);
  RegisterProperty(G, 
       'property Selected:Boolean read TcxGridTableCellViewInfo_GetSelected;');
  // End of class TcxGridTableCellViewInfo
  // Begin of class TcxGridTableDataCellViewInfo
  G := RegisterClassType(H, TcxGridTableDataCellViewInfo);
  RegisterHeader(G, 
       'constructor Create(ARecordViewInfo: TcxCustomGridRecordViewInfo;      AItem: TcxCustomGridTableItem); reintroduce; virtual;',
       @TcxGridTableDataCellViewInfo.Create);
  RegisterHeader(G, 
       'destructor Destroy; override;',
       @TcxGridTableDataCellViewInfo.Destroy);
  RegisterHeader(G, 
       'procedure BeforeRecalculation; override;',
       @TcxGridTableDataCellViewInfo.BeforeRecalculation);
  RegisterHeader(G, 
       'procedure Calculate(ALeftBound, ATopBound: Integer; AWidth: Integer = -1;      AHeight: Integer = -1); override;',
       @TcxGridTableDataCellViewInfo.Calculate);
  RegisterHeader(G, 
       'function CanDrawSelected: Boolean; override;',
       @TcxGridTableDataCellViewInfo.CanDrawSelected);
  RegisterHeader(G, 
       'function GetInplaceEditPosition: TcxInplaceEditPosition;',
       @TcxGridTableDataCellViewInfo.GetInplaceEditPosition);
  RegisterHeader(G, 
       'procedure Invalidate(ARecalculate: Boolean); reintroduce; virtual;',
       @TcxGridTableDataCellViewInfo.Invalidate);
  RegisterHeader(G, 
       'function MouseDown(AHitTest: TcxCustomGridHitTest; AButton: TMouseButton;      AShift: TShiftState): Boolean; override;',
       @TcxGridTableDataCellViewInfo.MouseDown);
  RegisterHeader(G, 
       'function MouseMove(AHitTest: TcxCustomGridHitTest; AShift: TShiftState): Boolean; override;',
       @TcxGridTableDataCellViewInfo.MouseMove);
  RegisterHeader(G, 
       'function MouseUp(AHitTest: TcxCustomGridHitTest; AButton: TMouseButton;      AShift: TShiftState): Boolean; override;',
       @TcxGridTableDataCellViewInfo.MouseUp);
  RegisterFakeHeader(G, 
       'function TcxGridTableDataCellViewInfo_GetDisplayValue:TcxEditValue;',
       @TcxGridTableDataCellViewInfo_GetDisplayValue);
  RegisterProperty(G, 
       'property DisplayValue:TcxEditValue read TcxGridTableDataCellViewInfo_GetDisplayValue;');
  RegisterFakeHeader(G, 
       'function TcxGridTableDataCellViewInfo_GetEditBounds:TRect;',
       @TcxGridTableDataCellViewInfo_GetEditBounds);
  RegisterProperty(G, 
       'property EditBounds:TRect read TcxGridTableDataCellViewInfo_GetEditBounds;');
  RegisterFakeHeader(G, 
       'function TcxGridTableDataCellViewInfo_GetEditing:Boolean;',
       @TcxGridTableDataCellViewInfo_GetEditing);
  RegisterProperty(G, 
       'property Editing:Boolean read TcxGridTableDataCellViewInfo_GetEditing;');
  RegisterFakeHeader(G, 
       'function TcxGridTableDataCellViewInfo_GetEditViewInfo:TcxCustomEditViewInfo;',
       @TcxGridTableDataCellViewInfo_GetEditViewInfo);
  RegisterProperty(G, 
       'property EditViewInfo:TcxCustomEditViewInfo read TcxGridTableDataCellViewInfo_GetEditViewInfo;');
  RegisterFakeHeader(G, 
       'function TcxGridTableDataCellViewInfo_GetFocused:Boolean;',
       @TcxGridTableDataCellViewInfo_GetFocused);
  RegisterProperty(G, 
       'property Focused:Boolean read TcxGridTableDataCellViewInfo_GetFocused;');
  RegisterFakeHeader(G, 
       'function TcxGridTableDataCellViewInfo_GetItem:TcxCustomGridTableItem;',
       @TcxGridTableDataCellViewInfo_GetItem);
  RegisterProperty(G, 
       'property Item:TcxCustomGridTableItem read TcxGridTableDataCellViewInfo_GetItem;');
  RegisterFakeHeader(G, 
       'function TcxGridTableDataCellViewInfo_GetProperties:TcxCustomEditProperties;',
       @TcxGridTableDataCellViewInfo_GetProperties);
  RegisterProperty(G, 
       'property Properties:TcxCustomEditProperties read TcxGridTableDataCellViewInfo_GetProperties;');
  RegisterFakeHeader(G, 
       'function TcxGridTableDataCellViewInfo_GetStyle:TcxEditStyle;',
       @TcxGridTableDataCellViewInfo_GetStyle);
  RegisterProperty(G, 
       'property Style:TcxEditStyle read TcxGridTableDataCellViewInfo_GetStyle;');
  RegisterFakeHeader(G, 
       'function TcxGridTableDataCellViewInfo_GetValue:Variant;',
       @TcxGridTableDataCellViewInfo_GetValue);
  RegisterProperty(G, 
       'property Value:Variant read TcxGridTableDataCellViewInfo_GetValue;');
  // End of class TcxGridTableDataCellViewInfo
  // Begin of class TcxCustomGridRecordViewInfo
  G := RegisterClassType(H, TcxCustomGridRecordViewInfo);
  RegisterHeader(G, 
       'constructor Create(ARecordsViewInfo: TcxCustomGridRecordsViewInfo;      ARecord: TcxCustomGridRecord); reintroduce; virtual;',
       @TcxCustomGridRecordViewInfo.Create);
  RegisterHeader(G, 
       'destructor Destroy; override;',
       @TcxCustomGridRecordViewInfo.Destroy);
  RegisterHeader(G, 
       'procedure BeforeRecalculation; override;',
       @TcxCustomGridRecordViewInfo.BeforeRecalculation);
  RegisterHeader(G, 
       'function Click(AHitTest: TcxCustomGridHitTest; AButton: TMouseButton;      AShift: TShiftState): Boolean; reintroduce; virtual;',
       @TcxCustomGridRecordViewInfo.Click);
  RegisterHeader(G, 
       'function GetBoundsForInvalidate(AItem: TcxCustomGridTableItem): TRect; virtual;',
       @TcxCustomGridRecordViewInfo.GetBoundsForInvalidate);
  RegisterHeader(G, 
       'function GetBoundsForItem(AItem: TcxCustomGridTableItem): TRect; virtual;',
       @TcxCustomGridRecordViewInfo.GetBoundsForItem);
  RegisterHeader(G, 
       'function GetCellViewInfoByItem(AItem: TcxCustomGridTableItem): TcxGridTableDataCellViewInfo; virtual;',
       @TcxCustomGridRecordViewInfo.GetCellViewInfoByItem);
  RegisterHeader(G, 
       'function GetHitTest(const P: TPoint): TcxCustomGridHitTest; override;',
       @TcxCustomGridRecordViewInfo.GetHitTest);
  RegisterHeader(G, 
       'procedure MainCalculate(ALeftBound, ATopBound: Integer); virtual;',
       @TcxCustomGridRecordViewInfo.MainCalculate);
  RegisterHeader(G, 
       'function MouseDown(AHitTest: TcxCustomGridHitTest; AButton: TMouseButton;      AShift: TShiftState): Boolean; override;',
       @TcxCustomGridRecordViewInfo.MouseDown);
  RegisterHeader(G, 
       'function ProcessDialogChar(ACharCode: Word): Boolean; virtual;',
       @TcxCustomGridRecordViewInfo.ProcessDialogChar);
  RegisterHeader(G, 
       'procedure Recalculate;',
       @TcxCustomGridRecordViewInfo.Recalculate);
  RegisterFakeHeader(G, 
       'function TcxCustomGridRecordViewInfo_GetContentBounds:TRect;',
       @TcxCustomGridRecordViewInfo_GetContentBounds);
  RegisterProperty(G, 
       'property ContentBounds:TRect read TcxCustomGridRecordViewInfo_GetContentBounds;');
  RegisterFakeHeader(G, 
       'function TcxCustomGridRecordViewInfo_GetExpandButtonBounds:TRect;',
       @TcxCustomGridRecordViewInfo_GetExpandButtonBounds);
  RegisterProperty(G, 
       'property ExpandButtonBounds:TRect read TcxCustomGridRecordViewInfo_GetExpandButtonBounds;');
  RegisterFakeHeader(G, 
       'function TcxCustomGridRecordViewInfo_GetFocused:Boolean;',
       @TcxCustomGridRecordViewInfo_GetFocused);
  RegisterProperty(G, 
       'property Focused:Boolean read TcxCustomGridRecordViewInfo_GetFocused;');
  RegisterFakeHeader(G, 
       'function TcxCustomGridRecordViewInfo_GetFocusRectBounds:TRect;',
       @TcxCustomGridRecordViewInfo_GetFocusRectBounds);
  RegisterProperty(G, 
       'property FocusRectBounds:TRect read TcxCustomGridRecordViewInfo_GetFocusRectBounds;');
  RegisterFakeHeader(G, 
       'function TcxCustomGridRecordViewInfo_GetFullyVisible:Boolean;',
       @TcxCustomGridRecordViewInfo_GetFullyVisible);
  RegisterProperty(G, 
       'property FullyVisible:Boolean read TcxCustomGridRecordViewInfo_GetFullyVisible;');
  RegisterFakeHeader(G, 
       'function TcxCustomGridRecordViewInfo_GetGridView:TcxCustomGridTableView;',
       @TcxCustomGridRecordViewInfo_GetGridView);
  RegisterProperty(G, 
       'property GridView:TcxCustomGridTableView read TcxCustomGridRecordViewInfo_GetGridView;');
  RegisterFakeHeader(G, 
       'function TcxCustomGridRecordViewInfo_GetGridRecord:TcxCustomGridRecord;',
       @TcxCustomGridRecordViewInfo_GetGridRecord);
  RegisterProperty(G, 
       'property GridRecord:TcxCustomGridRecord read TcxCustomGridRecordViewInfo_GetGridRecord;');
  RegisterFakeHeader(G, 
       'function TcxCustomGridRecordViewInfo_GetGridViewInfo:TcxCustomGridTableViewInfo;',
       @TcxCustomGridRecordViewInfo_GetGridViewInfo);
  RegisterProperty(G, 
       'property GridViewInfo:TcxCustomGridTableViewInfo read TcxCustomGridRecordViewInfo_GetGridViewInfo;');
  RegisterFakeHeader(G, 
       'function TcxCustomGridRecordViewInfo_GetIndex:Integer;',
       @TcxCustomGridRecordViewInfo_GetIndex);
  RegisterProperty(G, 
       'property Index:Integer read TcxCustomGridRecordViewInfo_GetIndex;');
  RegisterFakeHeader(G, 
       'function TcxCustomGridRecordViewInfo_GetHideFocusRectOnExit:Boolean;',
       @TcxCustomGridRecordViewInfo_GetHideFocusRectOnExit);
  RegisterProperty(G, 
       'property HideFocusRectOnExit:Boolean read TcxCustomGridRecordViewInfo_GetHideFocusRectOnExit;');
  RegisterFakeHeader(G, 
       'function TcxCustomGridRecordViewInfo_GetRecordsViewInfo:TcxCustomGridRecordsViewInfo;',
       @TcxCustomGridRecordViewInfo_GetRecordsViewInfo);
  RegisterProperty(G, 
       'property RecordsViewInfo:TcxCustomGridRecordsViewInfo read TcxCustomGridRecordViewInfo_GetRecordsViewInfo;');
  RegisterFakeHeader(G, 
       'function TcxCustomGridRecordViewInfo_GetSelected:Boolean;',
       @TcxCustomGridRecordViewInfo_GetSelected);
  RegisterProperty(G, 
       'property Selected:Boolean read TcxCustomGridRecordViewInfo_GetSelected;');
  // End of class TcxCustomGridRecordViewInfo
  // Begin of class TcxCustomGridRecordsViewInfo
  G := RegisterClassType(H, TcxCustomGridRecordsViewInfo);
  RegisterHeader(G, 
       'constructor Create(AGridViewInfo: TcxCustomGridTableViewInfo); virtual;',
       @TcxCustomGridRecordsViewInfo.Create);
  RegisterHeader(G, 
       'destructor Destroy; override;',
       @TcxCustomGridRecordsViewInfo.Destroy);
  RegisterHeader(G, 
       'function CanOffset(AItemCountDelta: Integer): Boolean; virtual;',
       @TcxCustomGridRecordsViewInfo.CanOffset);
  RegisterHeader(G, 
       'function GetCellHeight(ACellContentHeight: Integer): Integer; virtual;',
       @TcxCustomGridRecordsViewInfo.GetCellHeight);
  RegisterHeader(G, 
       'function GetHitTest(const P: TPoint): TcxCustomGridHitTest; virtual;',
       @TcxCustomGridRecordsViewInfo.GetHitTest);
  RegisterHeader(G, 
       'function GetRealItem(ARecord: TcxCustomGridRecord): TcxCustomGridRecordViewInfo; virtual;',
       @TcxCustomGridRecordsViewInfo.GetRealItem);
  RegisterHeader(G, 
       'function IsCellMultiLine(AItem: TcxCustomGridTableItem): Boolean; virtual;',
       @TcxCustomGridRecordsViewInfo.IsCellMultiLine);
  RegisterHeader(G, 
       'procedure MainCalculate; virtual;',
       @TcxCustomGridRecordsViewInfo.MainCalculate);
  RegisterHeader(G, 
       'procedure Offset(DX, DY: Integer); virtual;',
       @TcxCustomGridRecordsViewInfo.Offset);
  RegisterHeader(G, 
       'procedure OffsetRecords(AItemCountDelta, APixelScrollRecordOffsetDelta: Integer); virtual;',
       @TcxCustomGridRecordsViewInfo.OffsetRecords);
  RegisterHeader(G, 
       'procedure Paint;',
       @TcxCustomGridRecordsViewInfo.Paint);
  RegisterFakeHeader(G, 
       'function TcxCustomGridRecordsViewInfo_GetAutoDataCellHeight:Boolean;',
       @TcxCustomGridRecordsViewInfo_GetAutoDataCellHeight);
  RegisterProperty(G, 
       'property AutoDataCellHeight:Boolean read TcxCustomGridRecordsViewInfo_GetAutoDataCellHeight;');
  RegisterFakeHeader(G, 
       'function TcxCustomGridRecordsViewInfo_GetAutoDataRecordHeight:Boolean;',
       @TcxCustomGridRecordsViewInfo_GetAutoDataRecordHeight);
  RegisterProperty(G, 
       'property AutoDataRecordHeight:Boolean read TcxCustomGridRecordsViewInfo_GetAutoDataRecordHeight;');
  RegisterFakeHeader(G, 
       'function TcxCustomGridRecordsViewInfo_GetAutoRecordHeight:Boolean;',
       @TcxCustomGridRecordsViewInfo_GetAutoRecordHeight);
  RegisterProperty(G, 
       'property AutoRecordHeight:Boolean read TcxCustomGridRecordsViewInfo_GetAutoRecordHeight;');
  RegisterFakeHeader(G, 
       'function TcxCustomGridRecordsViewInfo_GetBackgroundBitmap:TBitmap;',
       @TcxCustomGridRecordsViewInfo_GetBackgroundBitmap);
  RegisterFakeHeader(G, 
       'procedure TcxCustomGridRecordsViewInfo_PutBackgroundBitmap(const Value: TBitmap);',
       @TcxCustomGridRecordsViewInfo_PutBackgroundBitmap);
  RegisterProperty(G, 
       'property BackgroundBitmap:TBitmap read TcxCustomGridRecordsViewInfo_GetBackgroundBitmap write TcxCustomGridRecordsViewInfo_PutBackgroundBitmap;');
  RegisterFakeHeader(G, 
       'function TcxCustomGridRecordsViewInfo_GetBounds:TRect;',
       @TcxCustomGridRecordsViewInfo_GetBounds);
  RegisterProperty(G, 
       'property Bounds:TRect read TcxCustomGridRecordsViewInfo_GetBounds;');
  RegisterFakeHeader(G, 
       'function TcxCustomGridRecordsViewInfo_GetContentBounds:TRect;',
       @TcxCustomGridRecordsViewInfo_GetContentBounds);
  RegisterProperty(G, 
       'property ContentBounds:TRect read TcxCustomGridRecordsViewInfo_GetContentBounds;');
  RegisterFakeHeader(G, 
       'function TcxCustomGridRecordsViewInfo_GetCount:Integer;',
       @TcxCustomGridRecordsViewInfo_GetCount);
  RegisterProperty(G, 
       'property Count:Integer read TcxCustomGridRecordsViewInfo_GetCount;');
  RegisterFakeHeader(G, 
       'function TcxCustomGridRecordsViewInfo_GetGridView:TcxCustomGridTableView;',
       @TcxCustomGridRecordsViewInfo_GetGridView);
  RegisterProperty(G, 
       'property GridView:TcxCustomGridTableView read TcxCustomGridRecordsViewInfo_GetGridView;');
  RegisterFakeHeader(G, 
       'function TcxCustomGridRecordsViewInfo_GetItems(Index: Integer):TcxCustomGridRecordViewInfo;',
       @TcxCustomGridRecordsViewInfo_GetItems);
  RegisterProperty(G, 
       'property Items[Index: Integer]:TcxCustomGridRecordViewInfo read TcxCustomGridRecordsViewInfo_GetItems;default;');
  RegisterFakeHeader(G, 
       'function TcxCustomGridRecordsViewInfo_GetItemsOffset:Integer;',
       @TcxCustomGridRecordsViewInfo_GetItemsOffset);
  RegisterProperty(G, 
       'property ItemsOffset:Integer read TcxCustomGridRecordsViewInfo_GetItemsOffset;');
  RegisterFakeHeader(G, 
       'function TcxCustomGridRecordsViewInfo_GetVisibleCount:Integer;',
       @TcxCustomGridRecordsViewInfo_GetVisibleCount);
  RegisterProperty(G, 
       'property VisibleCount:Integer read TcxCustomGridRecordsViewInfo_GetVisibleCount;');
  // End of class TcxCustomGridRecordsViewInfo
  // Begin of class TcxCustomGridTableViewInfo
  G := RegisterClassType(H, TcxCustomGridTableViewInfo);
  RegisterHeader(G, 
       'constructor Create(AGridView: TcxCustomGridView); override;',
       @TcxCustomGridTableViewInfo.Create);
  RegisterHeader(G, 
       'destructor Destroy; override;',
       @TcxCustomGridTableViewInfo.Destroy);
  RegisterHeader(G, 
       'function CanOffset(ARecordCountDelta, DX, DY: Integer): Boolean; virtual;',
       @TcxCustomGridTableViewInfo.CanOffset);
  RegisterHeader(G, 
       'function CanOffsetView(ARecordCountDelta: Integer): Boolean; virtual;',
       @TcxCustomGridTableViewInfo.CanOffsetView);
  RegisterHeader(G, 
       'procedure DoOffset(ARecordCountDelta, DX, DY: Integer); virtual;',
       @TcxCustomGridTableViewInfo.DoOffset);
  RegisterHeader(G, 
       'function GetNearestPopupHeight(AHeight: Integer; AAdditionalRecord: Boolean = False): Integer; virtual;',
       @TcxCustomGridTableViewInfo.GetNearestPopupHeight);
  RegisterHeader(G, 
       'function GetPopupHeight(ADropDownRecordCount: Integer): Integer; virtual;',
       @TcxCustomGridTableViewInfo.GetPopupHeight);
  RegisterFakeHeader(G, 
       'function TcxCustomGridTableViewInfo_GetCalculateDown:Boolean;',
       @TcxCustomGridTableViewInfo_GetCalculateDown);
  RegisterFakeHeader(G, 
       'procedure TcxCustomGridTableViewInfo_PutCalculateDown(const Value: Boolean);',
       @TcxCustomGridTableViewInfo_PutCalculateDown);
  RegisterProperty(G, 
       'property CalculateDown:Boolean read TcxCustomGridTableViewInfo_GetCalculateDown write TcxCustomGridTableViewInfo_PutCalculateDown;');
  RegisterFakeHeader(G, 
       'function TcxCustomGridTableViewInfo_GetExpandButtonSize:Integer;',
       @TcxCustomGridTableViewInfo_GetExpandButtonSize);
  RegisterProperty(G, 
       'property ExpandButtonSize:Integer read TcxCustomGridTableViewInfo_GetExpandButtonSize;');
  RegisterFakeHeader(G, 
       'function TcxCustomGridTableViewInfo_GetFilterViewInfo:TcxGridFilterViewInfo;',
       @TcxCustomGridTableViewInfo_GetFilterViewInfo);
  RegisterProperty(G, 
       'property FilterViewInfo:TcxGridFilterViewInfo read TcxCustomGridTableViewInfo_GetFilterViewInfo;');
  RegisterFakeHeader(G, 
       'function TcxCustomGridTableViewInfo_GetFirstRecordIndex:Integer;',
       @TcxCustomGridTableViewInfo_GetFirstRecordIndex);
  RegisterFakeHeader(G, 
       'procedure TcxCustomGridTableViewInfo_PutFirstRecordIndex(const Value: Integer);',
       @TcxCustomGridTableViewInfo_PutFirstRecordIndex);
  RegisterProperty(G, 
       'property FirstRecordIndex:Integer read TcxCustomGridTableViewInfo_GetFirstRecordIndex write TcxCustomGridTableViewInfo_PutFirstRecordIndex;');
  RegisterFakeHeader(G, 
       'function TcxCustomGridTableViewInfo_GetGridView:TcxCustomGridTableView;',
       @TcxCustomGridTableViewInfo_GetGridView);
  RegisterProperty(G, 
       'property GridView:TcxCustomGridTableView read TcxCustomGridTableViewInfo_GetGridView;');
  RegisterFakeHeader(G, 
       'function TcxCustomGridTableViewInfo_GetNavigatorBounds:TRect;',
       @TcxCustomGridTableViewInfo_GetNavigatorBounds);
  RegisterProperty(G, 
       'property NavigatorBounds:TRect read TcxCustomGridTableViewInfo_GetNavigatorBounds;');
  RegisterFakeHeader(G, 
       'function TcxCustomGridTableViewInfo_GetNavigatorOffset:Integer;',
       @TcxCustomGridTableViewInfo_GetNavigatorOffset);
  RegisterProperty(G, 
       'property NavigatorOffset:Integer read TcxCustomGridTableViewInfo_GetNavigatorOffset;');
  RegisterFakeHeader(G, 
       'function TcxCustomGridTableViewInfo_GetNavigatorSiteViewInfo:TcxNavigatorSiteViewInfo;',
       @TcxCustomGridTableViewInfo_GetNavigatorSiteViewInfo);
  RegisterProperty(G, 
       'property NavigatorSiteViewInfo:TcxNavigatorSiteViewInfo read TcxCustomGridTableViewInfo_GetNavigatorSiteViewInfo;');
  RegisterFakeHeader(G, 
       'function TcxCustomGridTableViewInfo_GetNavigatorViewInfo:TcxNavigatorViewInfo;',
       @TcxCustomGridTableViewInfo_GetNavigatorViewInfo);
  RegisterProperty(G, 
       'property NavigatorViewInfo:TcxNavigatorViewInfo read TcxCustomGridTableViewInfo_GetNavigatorViewInfo;');
  RegisterFakeHeader(G, 
       'function TcxCustomGridTableViewInfo_GetNoDataInfoText:string;',
       @TcxCustomGridTableViewInfo_GetNoDataInfoText);
  RegisterProperty(G, 
       'property NoDataInfoText:string read TcxCustomGridTableViewInfo_GetNoDataInfoText;');
  RegisterFakeHeader(G, 
       'function TcxCustomGridTableViewInfo_GetNoDataInfoTextAreaBounds:TRect;',
       @TcxCustomGridTableViewInfo_GetNoDataInfoTextAreaBounds);
  RegisterProperty(G, 
       'property NoDataInfoTextAreaBounds:TRect read TcxCustomGridTableViewInfo_GetNoDataInfoTextAreaBounds;');
  RegisterFakeHeader(G, 
       'function TcxCustomGridTableViewInfo_GetNoDataInfoTextAreaVisible:Boolean;',
       @TcxCustomGridTableViewInfo_GetNoDataInfoTextAreaVisible);
  RegisterProperty(G, 
       'property NoDataInfoTextAreaVisible:Boolean read TcxCustomGridTableViewInfo_GetNoDataInfoTextAreaVisible;');
  RegisterFakeHeader(G, 
       'function TcxCustomGridTableViewInfo_GetPartsBottomHeight:Integer;',
       @TcxCustomGridTableViewInfo_GetPartsBottomHeight);
  RegisterProperty(G, 
       'property PartsBottomHeight:Integer read TcxCustomGridTableViewInfo_GetPartsBottomHeight;');
  RegisterFakeHeader(G, 
       'function TcxCustomGridTableViewInfo_GetPartsTopHeight:Integer;',
       @TcxCustomGridTableViewInfo_GetPartsTopHeight);
  RegisterProperty(G, 
       'property PartsTopHeight:Integer read TcxCustomGridTableViewInfo_GetPartsTopHeight;');
  RegisterFakeHeader(G, 
       'function TcxCustomGridTableViewInfo_GetRecordsViewInfo:TcxCustomGridRecordsViewInfo;',
       @TcxCustomGridTableViewInfo_GetRecordsViewInfo);
  RegisterProperty(G, 
       'property RecordsViewInfo:TcxCustomGridRecordsViewInfo read TcxCustomGridTableViewInfo_GetRecordsViewInfo;');
  RegisterFakeHeader(G, 
       'function TcxCustomGridTableViewInfo_GetScrollableAreaBounds:TRect;',
       @TcxCustomGridTableViewInfo_GetScrollableAreaBounds);
  RegisterProperty(G, 
       'property ScrollableAreaBounds:TRect read TcxCustomGridTableViewInfo_GetScrollableAreaBounds;');
  RegisterFakeHeader(G, 
       'function TcxCustomGridTableViewInfo_GetScrollableAreaBoundsForEdit:TRect;',
       @TcxCustomGridTableViewInfo_GetScrollableAreaBoundsForEdit);
  RegisterProperty(G, 
       'property ScrollableAreaBoundsForEdit:TRect read TcxCustomGridTableViewInfo_GetScrollableAreaBoundsForEdit;');
  RegisterFakeHeader(G, 
       'function TcxCustomGridTableViewInfo_GetScrollableAreaBoundsHorz:TRect;',
       @TcxCustomGridTableViewInfo_GetScrollableAreaBoundsHorz);
  RegisterProperty(G, 
       'property ScrollableAreaBoundsHorz:TRect read TcxCustomGridTableViewInfo_GetScrollableAreaBoundsHorz;');
  RegisterFakeHeader(G, 
       'function TcxCustomGridTableViewInfo_GetScrollableAreaBoundsVert:TRect;',
       @TcxCustomGridTableViewInfo_GetScrollableAreaBoundsVert);
  RegisterProperty(G, 
       'property ScrollableAreaBoundsVert:TRect read TcxCustomGridTableViewInfo_GetScrollableAreaBoundsVert;');
  RegisterFakeHeader(G, 
       'function TcxCustomGridTableViewInfo_GetScrollableAreaWidth:Integer;',
       @TcxCustomGridTableViewInfo_GetScrollableAreaWidth);
  RegisterProperty(G, 
       'property ScrollableAreaWidth:Integer read TcxCustomGridTableViewInfo_GetScrollableAreaWidth;');
  RegisterFakeHeader(G, 
       'function TcxCustomGridTableViewInfo_GetVisibleRecordCount:Integer;',
       @TcxCustomGridTableViewInfo_GetVisibleRecordCount);
  RegisterProperty(G, 
       'property VisibleRecordCount:Integer read TcxCustomGridTableViewInfo_GetVisibleRecordCount;');
  // End of class TcxCustomGridTableViewInfo
  RegisterTypeAlias(H, 'TcxGridSortOrder:TcxDataSortOrder');
  // Begin of class TcxCustomGridTableItem
  G := RegisterClassType(H, TcxCustomGridTableItem);
  RegisterHeader(G, 
       'constructor Create(AOwner: TComponent); override;',
       @TcxCustomGridTableItem.Create);
  RegisterHeader(G, 
       'destructor Destroy; override;',
       @TcxCustomGridTableItem.Destroy);
  RegisterHeader(G, 
       'procedure Assign(Source: TPersistent); override;',
       @TcxCustomGridTableItem.Assign);
  RegisterHeader(G, 
       'function GetParentComponent: TComponent; override;',
       @TcxCustomGridTableItem.GetParentComponent);
  RegisterHeader(G, 
       'function HasParent: Boolean; override;',
       @TcxCustomGridTableItem.HasParent);
  RegisterHeader(G, 
       'procedure ApplyBestFit(ACheckSizingAbility: Boolean = False; AFireEvents: Boolean = False); virtual;',
       @TcxCustomGridTableItem.ApplyBestFit);
  RegisterHeader(G, 
       'function CalculateDefaultCellHeight(ACanvas: TcxCanvas; AFont: TFont): Integer; virtual;',
       @TcxCustomGridTableItem.CalculateDefaultCellHeight);
  RegisterHeader(G, 
       'function CreateEditStyle: TcxEditStyle; virtual;',
       @TcxCustomGridTableItem.CreateEditStyle);
  RegisterHeader(G, 
       'procedure FocusWithSelection; virtual;',
       @TcxCustomGridTableItem.FocusWithSelection);
  RegisterHeader(G, 
       'function GetAlternateCaption: string;',
       @TcxCustomGridTableItem.GetAlternateCaption);
  RegisterHeader(G, 
       'function GetDefaultValuesProvider(AProperties: TcxCustomEditProperties = nil): IcxEditDefaultValuesProvider;',
       @TcxCustomGridTableItem.GetDefaultValuesProvider);
  RegisterHeader(G, 
       'function GetRepositoryItem: TcxEditRepositoryItem;',
       @TcxCustomGridTableItem.GetRepositoryItem);
  RegisterHeader(G, 
       'procedure MakeVisible;',
       @TcxCustomGridTableItem.MakeVisible);
  RegisterHeader(G, 
       'procedure RestoreDefaults; virtual;',
       @TcxCustomGridTableItem.RestoreDefaults);
  RegisterFakeHeader(G, 
       'function TcxCustomGridTableItem_GetActuallyVisible:Boolean;',
       @TcxCustomGridTableItem_GetActuallyVisible);
  RegisterProperty(G, 
       'property ActuallyVisible:Boolean read TcxCustomGridTableItem_GetActuallyVisible;');
  RegisterFakeHeader(G, 
       'function TcxCustomGridTableItem_GetBestFitMaxWidth:Integer;',
       @TcxCustomGridTableItem_GetBestFitMaxWidth);
  RegisterFakeHeader(G, 
       'procedure TcxCustomGridTableItem_PutBestFitMaxWidth(const Value: Integer);',
       @TcxCustomGridTableItem_PutBestFitMaxWidth);
  RegisterProperty(G, 
       'property BestFitMaxWidth:Integer read TcxCustomGridTableItem_GetBestFitMaxWidth write TcxCustomGridTableItem_PutBestFitMaxWidth;');
  RegisterFakeHeader(G, 
       'function TcxCustomGridTableItem_GetEditable:Boolean;',
       @TcxCustomGridTableItem_GetEditable);
  RegisterProperty(G, 
       'property Editable:Boolean read TcxCustomGridTableItem_GetEditable;');
  RegisterFakeHeader(G, 
       'function TcxCustomGridTableItem_GetEditing:Boolean;',
       @TcxCustomGridTableItem_GetEditing);
  RegisterFakeHeader(G, 
       'procedure TcxCustomGridTableItem_PutEditing(const Value: Boolean);',
       @TcxCustomGridTableItem_PutEditing);
  RegisterProperty(G, 
       'property Editing:Boolean read TcxCustomGridTableItem_GetEditing write TcxCustomGridTableItem_PutEditing;');
  RegisterFakeHeader(G, 
       'function TcxCustomGridTableItem_GetEditValue:Variant;',
       @TcxCustomGridTableItem_GetEditValue);
  RegisterFakeHeader(G, 
       'procedure TcxCustomGridTableItem_PutEditValue(const Value: Variant);',
       @TcxCustomGridTableItem_PutEditValue);
  RegisterProperty(G, 
       'property EditValue:Variant read TcxCustomGridTableItem_GetEditValue write TcxCustomGridTableItem_PutEditValue;');
  RegisterFakeHeader(G, 
       'function TcxCustomGridTableItem_GetFiltered:Boolean;',
       @TcxCustomGridTableItem_GetFiltered);
  RegisterFakeHeader(G, 
       'procedure TcxCustomGridTableItem_PutFiltered(const Value: Boolean);',
       @TcxCustomGridTableItem_PutFiltered);
  RegisterProperty(G, 
       'property Filtered:Boolean read TcxCustomGridTableItem_GetFiltered write TcxCustomGridTableItem_PutFiltered;');
  RegisterFakeHeader(G, 
       'function TcxCustomGridTableItem_GetFilteringDateRanges:TcxGridFilteringDateRanges;',
       @TcxCustomGridTableItem_GetFilteringDateRanges);
  RegisterProperty(G, 
       'property FilteringDateRanges:TcxGridFilteringDateRanges read TcxCustomGridTableItem_GetFilteringDateRanges;');
  RegisterFakeHeader(G, 
       'function TcxCustomGridTableItem_GetFocused:Boolean;',
       @TcxCustomGridTableItem_GetFocused);
  RegisterFakeHeader(G, 
       'procedure TcxCustomGridTableItem_PutFocused(const Value: Boolean);',
       @TcxCustomGridTableItem_PutFocused);
  RegisterProperty(G, 
       'property Focused:Boolean read TcxCustomGridTableItem_GetFocused write TcxCustomGridTableItem_PutFocused;');
  RegisterFakeHeader(G, 
       'function TcxCustomGridTableItem_GetFocusedCellViewInfo:TcxGridTableDataCellViewInfo;',
       @TcxCustomGridTableItem_GetFocusedCellViewInfo);
  RegisterProperty(G, 
       'property FocusedCellViewInfo:TcxGridTableDataCellViewInfo read TcxCustomGridTableItem_GetFocusedCellViewInfo;');
  RegisterFakeHeader(G, 
       'function TcxCustomGridTableItem_GetGridView:TcxCustomGridTableView;',
       @TcxCustomGridTableItem_GetGridView);
  RegisterProperty(G, 
       'property GridView:TcxCustomGridTableView read TcxCustomGridTableItem_GetGridView;');
  RegisterFakeHeader(G, 
       'function TcxCustomGridTableItem_GetHideable:Boolean;',
       @TcxCustomGridTableItem_GetHideable);
  RegisterProperty(G, 
       'property Hideable:Boolean read TcxCustomGridTableItem_GetHideable;');
  RegisterFakeHeader(G, 
       'function TcxCustomGridTableItem_GetID:Integer;',
       @TcxCustomGridTableItem_GetID);
  RegisterProperty(G, 
       'property ID:Integer read TcxCustomGridTableItem_GetID;');
  RegisterFakeHeader(G, 
       'function TcxCustomGridTableItem_GetIncSearching:Boolean;',
       @TcxCustomGridTableItem_GetIncSearching);
  RegisterProperty(G, 
       'property IncSearching:Boolean read TcxCustomGridTableItem_GetIncSearching;');
  RegisterFakeHeader(G, 
       'function TcxCustomGridTableItem_GetIndex:Integer;',
       @TcxCustomGridTableItem_GetIndex);
  RegisterFakeHeader(G, 
       'procedure TcxCustomGridTableItem_PutIndex(const Value: Integer);',
       @TcxCustomGridTableItem_PutIndex);
  RegisterProperty(G, 
       'property Index:Integer read TcxCustomGridTableItem_GetIndex write TcxCustomGridTableItem_PutIndex;');
  RegisterFakeHeader(G, 
       'function TcxCustomGridTableItem_GetIsFirst:Boolean;',
       @TcxCustomGridTableItem_GetIsFirst);
  RegisterProperty(G, 
       'property IsFirst:Boolean read TcxCustomGridTableItem_GetIsFirst;');
  RegisterFakeHeader(G, 
       'function TcxCustomGridTableItem_GetIsLast:Boolean;',
       @TcxCustomGridTableItem_GetIsLast);
  RegisterProperty(G, 
       'property IsLast:Boolean read TcxCustomGridTableItem_GetIsLast;');
  RegisterFakeHeader(G, 
       'function TcxCustomGridTableItem_GetOptions:TcxCustomGridTableItemOptions;',
       @TcxCustomGridTableItem_GetOptions);
  RegisterFakeHeader(G, 
       'procedure TcxCustomGridTableItem_PutOptions(const Value: TcxCustomGridTableItemOptions);',
       @TcxCustomGridTableItem_PutOptions);
  RegisterProperty(G, 
       'property Options:TcxCustomGridTableItemOptions read TcxCustomGridTableItem_GetOptions write TcxCustomGridTableItem_PutOptions;');
  RegisterFakeHeader(G, 
       'function TcxCustomGridTableItem_GetPropertiesClass:TcxCustomEditPropertiesClass;',
       @TcxCustomGridTableItem_GetPropertiesClass);
  RegisterFakeHeader(G, 
       'procedure TcxCustomGridTableItem_PutPropertiesClass(const Value: TcxCustomEditPropertiesClass);',
       @TcxCustomGridTableItem_PutPropertiesClass);
  RegisterProperty(G, 
       'property PropertiesClass:TcxCustomEditPropertiesClass read TcxCustomGridTableItem_GetPropertiesClass write TcxCustomGridTableItem_PutPropertiesClass;');
  RegisterFakeHeader(G, 
       'function TcxCustomGridTableItem_GetSortIndex:Integer;',
       @TcxCustomGridTableItem_GetSortIndex);
  RegisterFakeHeader(G, 
       'procedure TcxCustomGridTableItem_PutSortIndex(const Value: Integer);',
       @TcxCustomGridTableItem_PutSortIndex);
  RegisterProperty(G, 
       'property SortIndex:Integer read TcxCustomGridTableItem_GetSortIndex write TcxCustomGridTableItem_PutSortIndex;');
  RegisterFakeHeader(G, 
       'function TcxCustomGridTableItem_GetSortOrder:TcxGridSortOrder;',
       @TcxCustomGridTableItem_GetSortOrder);
  RegisterFakeHeader(G, 
       'procedure TcxCustomGridTableItem_PutSortOrder(const Value: TcxGridSortOrder);',
       @TcxCustomGridTableItem_PutSortOrder);
  RegisterProperty(G, 
       'property SortOrder:TcxGridSortOrder read TcxCustomGridTableItem_GetSortOrder write TcxCustomGridTableItem_PutSortOrder;');
  RegisterFakeHeader(G, 
       'function TcxCustomGridTableItem_GetStyles:TcxCustomGridTableItemStyles;',
       @TcxCustomGridTableItem_GetStyles);
  RegisterFakeHeader(G, 
       'procedure TcxCustomGridTableItem_PutStyles(const Value: TcxCustomGridTableItemStyles);',
       @TcxCustomGridTableItem_PutStyles);
  RegisterProperty(G, 
       'property Styles:TcxCustomGridTableItemStyles read TcxCustomGridTableItem_GetStyles write TcxCustomGridTableItem_PutStyles;');
  RegisterFakeHeader(G, 
       'function TcxCustomGridTableItem_GetVisibleCaption:string;',
       @TcxCustomGridTableItem_GetVisibleCaption);
  RegisterProperty(G, 
       'property VisibleCaption:string read TcxCustomGridTableItem_GetVisibleCaption;');
  RegisterFakeHeader(G, 
       'function TcxCustomGridTableItem_GetVisibleIndex:Integer;',
       @TcxCustomGridTableItem_GetVisibleIndex);
  RegisterProperty(G, 
       'property VisibleIndex:Integer read TcxCustomGridTableItem_GetVisibleIndex;');
  // End of class TcxCustomGridTableItem
  RegisterRTTIType(H, TypeInfo(TcxGridViewRestoringFilterAttribute));
  RegisterRTTIType(H, TypeInfo(TcxGridViewRestoringFilterAttributes));
  RegisterRTTIType(H, TypeInfo(TcxGridDataControllerChange));
  // Begin of class TcxCustomGridTableView
  G := RegisterClassType(H, TcxCustomGridTableView);
  RegisterHeader(G, 
       'destructor Destroy; override;',
       @TcxCustomGridTableView.Destroy);
  RegisterHeader(G, 
       'procedure ApplyBestFit(AItem: TcxCustomGridTableItem = nil; ACheckSizingAbility: Boolean = False;      AFireEvents: Boolean = False); virtual;',
       @TcxCustomGridTableView.ApplyBestFit);
  RegisterHeader(G, 
       'procedure ClearItems;',
       @TcxCustomGridTableView.ClearItems);
  RegisterHeader(G, 
       'procedure CopyToClipboard(ACopyAll: Boolean);',
       @TcxCustomGridTableView.CopyToClipboard);
  RegisterHeader(G, 
       'function CreateItem: TcxCustomGridTableItem;',
       @TcxCustomGridTableView.CreateItem);
  RegisterHeader(G, 
       'function FindItemByID(AID: Integer): TcxCustomGridTableItem;',
       @TcxCustomGridTableView.FindItemByID);
  RegisterHeader(G, 
       'function FindItemByName(const AName: string): TcxCustomGridTableItem;',
       @TcxCustomGridTableView.FindItemByName);
  RegisterHeader(G, 
       'function FindItemByTag(ATag: TcxTag): TcxCustomGridTableItem;',
       @TcxCustomGridTableView.FindItemByTag);
  RegisterHeader(G, 
       'function IndexOfItem(AItem: TcxCustomGridTableItem): Integer;',
       @TcxCustomGridTableView.IndexOfItem);
  RegisterHeader(G, 
       'procedure MakeMasterGridRecordVisible;',
       @TcxCustomGridTableView.MakeMasterGridRecordVisible);
  RegisterHeader(G, 
       'procedure RestoreDefaults; override;',
       @TcxCustomGridTableView.RestoreDefaults);
  RegisterHeader(G, 
       'procedure BeginBestFitUpdate;',
       @TcxCustomGridTableView.BeginBestFitUpdate);
  RegisterHeader(G, 
       'procedure EndBestFitUpdate;',
       @TcxCustomGridTableView.EndBestFitUpdate);
  RegisterHeader(G, 
       'procedure BeginFilteringUpdate;',
       @TcxCustomGridTableView.BeginFilteringUpdate);
  RegisterHeader(G, 
       'procedure EndFilteringUpdate;',
       @TcxCustomGridTableView.EndFilteringUpdate);
  RegisterHeader(G, 
       'procedure BeginGroupingUpdate;',
       @TcxCustomGridTableView.BeginGroupingUpdate);
  RegisterHeader(G, 
       'procedure EndGroupingUpdate;',
       @TcxCustomGridTableView.EndGroupingUpdate);
  RegisterHeader(G, 
       'procedure BeginSortingUpdate;',
       @TcxCustomGridTableView.BeginSortingUpdate);
  RegisterHeader(G, 
       'procedure EndSortingUpdate;',
       @TcxCustomGridTableView.EndSortingUpdate);
  RegisterHeader(G, 
       'function CanBeLookupList: Boolean; virtual;',
       @TcxCustomGridTableView.CanBeLookupList);
  RegisterFakeHeader(G, 
       'function TcxCustomGridTableView_GetController:TcxCustomGridTableController;',
       @TcxCustomGridTableView_GetController);
  RegisterProperty(G, 
       'property Controller:TcxCustomGridTableController read TcxCustomGridTableView_GetController;');
  RegisterFakeHeader(G, 
       'function TcxCustomGridTableView_GetDateTimeHandling:TcxCustomGridTableDateTimeHandling;',
       @TcxCustomGridTableView_GetDateTimeHandling);
  RegisterFakeHeader(G, 
       'procedure TcxCustomGridTableView_PutDateTimeHandling(const Value: TcxCustomGridTableDateTimeHandling);',
       @TcxCustomGridTableView_PutDateTimeHandling);
  RegisterProperty(G, 
       'property DateTimeHandling:TcxCustomGridTableDateTimeHandling read TcxCustomGridTableView_GetDateTimeHandling write TcxCustomGridTableView_PutDateTimeHandling;');
  RegisterFakeHeader(G, 
       'function TcxCustomGridTableView_GetFiltering:TcxCustomGridTableFiltering;',
       @TcxCustomGridTableView_GetFiltering);
  RegisterFakeHeader(G, 
       'procedure TcxCustomGridTableView_PutFiltering(const Value: TcxCustomGridTableFiltering);',
       @TcxCustomGridTableView_PutFiltering);
  RegisterProperty(G, 
       'property Filtering:TcxCustomGridTableFiltering read TcxCustomGridTableView_GetFiltering write TcxCustomGridTableView_PutFiltering;');
  RegisterFakeHeader(G, 
       'function TcxCustomGridTableView_GetGroupedItemCount:Integer;',
       @TcxCustomGridTableView_GetGroupedItemCount);
  RegisterProperty(G, 
       'property GroupedItemCount:Integer read TcxCustomGridTableView_GetGroupedItemCount;');
  RegisterFakeHeader(G, 
       'function TcxCustomGridTableView_GetGroupedItems(Index: Integer):TcxCustomGridTableItem;',
       @TcxCustomGridTableView_GetGroupedItems);
  RegisterProperty(G, 
       'property GroupedItems[Index: Integer]:TcxCustomGridTableItem read TcxCustomGridTableView_GetGroupedItems;');
  RegisterFakeHeader(G, 
       'function TcxCustomGridTableView_GetItemCount:Integer;',
       @TcxCustomGridTableView_GetItemCount);
  RegisterProperty(G, 
       'property ItemCount:Integer read TcxCustomGridTableView_GetItemCount;');
  RegisterFakeHeader(G, 
       'function TcxCustomGridTableView_GetItems(Index: Integer):TcxCustomGridTableItem;',
       @TcxCustomGridTableView_GetItems);
  RegisterFakeHeader(G, 
       'procedure TcxCustomGridTableView_PutItems(Index: Integer;const Value: TcxCustomGridTableItem);',
       @TcxCustomGridTableView_PutItems);
  RegisterProperty(G, 
       'property Items[Index: Integer]:TcxCustomGridTableItem read TcxCustomGridTableView_GetItems write TcxCustomGridTableView_PutItems;');
  RegisterFakeHeader(G, 
       'function TcxCustomGridTableView_GetMasterGridRecord:TcxCustomGridRecord;',
       @TcxCustomGridTableView_GetMasterGridRecord);
  RegisterProperty(G, 
       'property MasterGridRecord:TcxCustomGridRecord read TcxCustomGridTableView_GetMasterGridRecord;');
  RegisterFakeHeader(G, 
       'function TcxCustomGridTableView_GetOptionsBehavior:TcxCustomGridTableOptionsBehavior;',
       @TcxCustomGridTableView_GetOptionsBehavior);
  RegisterFakeHeader(G, 
       'procedure TcxCustomGridTableView_PutOptionsBehavior(const Value: TcxCustomGridTableOptionsBehavior);',
       @TcxCustomGridTableView_PutOptionsBehavior);
  RegisterProperty(G, 
       'property OptionsBehavior:TcxCustomGridTableOptionsBehavior read TcxCustomGridTableView_GetOptionsBehavior write TcxCustomGridTableView_PutOptionsBehavior;');
  RegisterFakeHeader(G, 
       'function TcxCustomGridTableView_GetOptionsCustomize:TcxCustomGridTableOptionsCustomize;',
       @TcxCustomGridTableView_GetOptionsCustomize);
  RegisterFakeHeader(G, 
       'procedure TcxCustomGridTableView_PutOptionsCustomize(const Value: TcxCustomGridTableOptionsCustomize);',
       @TcxCustomGridTableView_PutOptionsCustomize);
  RegisterProperty(G, 
       'property OptionsCustomize:TcxCustomGridTableOptionsCustomize read TcxCustomGridTableView_GetOptionsCustomize write TcxCustomGridTableView_PutOptionsCustomize;');
  RegisterFakeHeader(G, 
       'function TcxCustomGridTableView_GetOptionsData:TcxCustomGridTableOptionsData;',
       @TcxCustomGridTableView_GetOptionsData);
  RegisterFakeHeader(G, 
       'procedure TcxCustomGridTableView_PutOptionsData(const Value: TcxCustomGridTableOptionsData);',
       @TcxCustomGridTableView_PutOptionsData);
  RegisterProperty(G, 
       'property OptionsData:TcxCustomGridTableOptionsData read TcxCustomGridTableView_GetOptionsData write TcxCustomGridTableView_PutOptionsData;');
  RegisterFakeHeader(G, 
       'function TcxCustomGridTableView_GetOptionsSelection:TcxCustomGridTableOptionsSelection;',
       @TcxCustomGridTableView_GetOptionsSelection);
  RegisterFakeHeader(G, 
       'procedure TcxCustomGridTableView_PutOptionsSelection(const Value: TcxCustomGridTableOptionsSelection);',
       @TcxCustomGridTableView_PutOptionsSelection);
  RegisterProperty(G, 
       'property OptionsSelection:TcxCustomGridTableOptionsSelection read TcxCustomGridTableView_GetOptionsSelection write TcxCustomGridTableView_PutOptionsSelection;');
  RegisterFakeHeader(G, 
       'function TcxCustomGridTableView_GetOptionsView:TcxCustomGridTableOptionsView;',
       @TcxCustomGridTableView_GetOptionsView);
  RegisterFakeHeader(G, 
       'procedure TcxCustomGridTableView_PutOptionsView(const Value: TcxCustomGridTableOptionsView);',
       @TcxCustomGridTableView_PutOptionsView);
  RegisterProperty(G, 
       'property OptionsView:TcxCustomGridTableOptionsView read TcxCustomGridTableView_GetOptionsView write TcxCustomGridTableView_PutOptionsView;');
  RegisterFakeHeader(G, 
       'function TcxCustomGridTableView_GetPainter:TcxCustomGridTablePainter;',
       @TcxCustomGridTableView_GetPainter);
  RegisterProperty(G, 
       'property Painter:TcxCustomGridTablePainter read TcxCustomGridTableView_GetPainter;');
  RegisterFakeHeader(G, 
       'function TcxCustomGridTableView_GetPatternGridView:TcxCustomGridTableView;',
       @TcxCustomGridTableView_GetPatternGridView);
  RegisterProperty(G, 
       'property PatternGridView:TcxCustomGridTableView read TcxCustomGridTableView_GetPatternGridView;');
  RegisterFakeHeader(G, 
       'function TcxCustomGridTableView_GetSortedItemCount:Integer;',
       @TcxCustomGridTableView_GetSortedItemCount);
  RegisterProperty(G, 
       'property SortedItemCount:Integer read TcxCustomGridTableView_GetSortedItemCount;');
  RegisterFakeHeader(G, 
       'function TcxCustomGridTableView_GetSortedItems(Index: Integer):TcxCustomGridTableItem;',
       @TcxCustomGridTableView_GetSortedItems);
  RegisterProperty(G, 
       'property SortedItems[Index: Integer]:TcxCustomGridTableItem read TcxCustomGridTableView_GetSortedItems;');
  RegisterFakeHeader(G, 
       'function TcxCustomGridTableView_GetStyles:TcxCustomGridTableViewStyles;',
       @TcxCustomGridTableView_GetStyles);
  RegisterFakeHeader(G, 
       'procedure TcxCustomGridTableView_PutStyles(const Value: TcxCustomGridTableViewStyles);',
       @TcxCustomGridTableView_PutStyles);
  RegisterProperty(G, 
       'property Styles:TcxCustomGridTableViewStyles read TcxCustomGridTableView_GetStyles write TcxCustomGridTableView_PutStyles;');
  RegisterFakeHeader(G, 
       'function TcxCustomGridTableView_GetViewData:TcxCustomGridTableViewData;',
       @TcxCustomGridTableView_GetViewData);
  RegisterProperty(G, 
       'property ViewData:TcxCustomGridTableViewData read TcxCustomGridTableView_GetViewData;');
  RegisterFakeHeader(G, 
       'function TcxCustomGridTableView_GetViewInfo:TcxCustomGridTableViewInfo;',
       @TcxCustomGridTableView_GetViewInfo);
  RegisterProperty(G, 
       'property ViewInfo:TcxCustomGridTableViewInfo read TcxCustomGridTableView_GetViewInfo;');
  RegisterFakeHeader(G, 
       'function TcxCustomGridTableView_GetVisibleItemCount:Integer;',
       @TcxCustomGridTableView_GetVisibleItemCount);
  RegisterProperty(G, 
       'property VisibleItemCount:Integer read TcxCustomGridTableView_GetVisibleItemCount;');
  RegisterFakeHeader(G, 
       'function TcxCustomGridTableView_GetVisibleItems(Index: Integer):TcxCustomGridTableItem;',
       @TcxCustomGridTableView_GetVisibleItems);
  RegisterProperty(G, 
       'property VisibleItems[Index: Integer]:TcxCustomGridTableItem read TcxCustomGridTableView_GetVisibleItems;');
  RegisterHeader(G,
       'constructor Create(AOwner: TComponent); virtual;',
       @TcxCustomGridTableView.Create);
  // End of class TcxCustomGridTableView
end;
initialization
  RegisterIMPORT_cxGridCustomTableView;
end.
