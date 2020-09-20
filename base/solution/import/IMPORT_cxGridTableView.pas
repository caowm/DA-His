unit IMPORT_cxGridTableView;
interface
uses
  Types,
  Variants,
  Windows,
  Messages,
  Classes,
  Graphics,
  Controls,
  ImgList,
  Forms,
  Buttons,
  StdCtrls,
  ExtCtrls,
  ComCtrls,
  cxClasses,
  cxControls,
  cxGraphics,
  cxLookAndFeels,
  cxLookAndFeelPainters,
  cxStyles,
  cxStorage,
  cxPC,
  cxListBox,
  cxContainer,
  cxEdit,
  cxTextEdit,
  cxGrid,
  cxGridCommon,
  cxGridLevel,
  cxGridCustomView,
  cxGridCustomTableView,
  cxGridDetailsSite,
  cxCustomData,
  cxData,
  cxDataStorage,
  cxFilter,
  Menus,
  dxCoreClasses,
  cxGridTableView,
  PaxCompiler,
  PaxRegister;
procedure RegisterIMPORT_cxGridTableView;
implementation
function TcxGridTableView_GetColumnCount(Self:TcxGridTableView):Integer;
begin
  result := Self.ColumnCount;
end;
function TcxGridTableView_GetColumns(Self:TcxGridTableView;Index: Integer):TcxGridColumn;
begin
  result := Self.Columns[Index];
end;
procedure TcxGridTableView_PutColumns(Self:TcxGridTableView;Index: Integer;const Value: TcxGridColumn);
begin
  Self.Columns[Index] := Value;
end;
function TcxGridTableView_GetController(Self:TcxGridTableView):TcxGridTableController;
begin
  result := Self.Controller;
end;
function TcxGridTableView_GetGroupedColumnCount(Self:TcxGridTableView):Integer;
begin
  result := Self.GroupedColumnCount;
end;
function TcxGridTableView_GetGroupedColumns(Self:TcxGridTableView;Index: Integer):TcxGridColumn;
begin
  result := Self.GroupedColumns[Index];
end;
function TcxGridTableView_GetPainter(Self:TcxGridTableView):TcxGridTablePainter;
begin
  result := Self.Painter;
end;
function TcxGridTableView_GetViewData(Self:TcxGridTableView):TcxGridViewData;
begin
  result := Self.ViewData;
end;
function TcxGridTableView_GetViewInfo(Self:TcxGridTableView):TcxGridTableViewInfo;
begin
  result := Self.ViewInfo;
end;
function TcxGridTableView_GetVisibleColumnCount(Self:TcxGridTableView):Integer;
begin
  result := Self.VisibleColumnCount;
end;
function TcxGridTableView_GetVisibleColumns(Self:TcxGridTableView;Index: Integer):TcxGridColumn;
begin
  result := Self.VisibleColumns[Index];
end;
procedure RegisterIMPORT_cxGridTableView;
var G, H: Integer;
begin
  H := RegisterNamespace(0, 'cxGridTableView');
  // Begin of class TcxGridColumn
  G := RegisterClassType(H, TcxGridColumn);
  RegisterHeader(G,
       'constructor Create(AOwner: TComponent); virtual;',
       @TcxGridColumn.Create);
  // End of class TcxGridColumn
  // Begin of class TcxGridTableView
  G := RegisterClassType(H, TcxGridTableView);
  RegisterHeader(G, 
       'constructor Create(AOwner: TComponent); override;',
       @TcxGridTableView.Create);
  RegisterHeader(G, 
       'function CreateColumn: TcxGridColumn;',
       @TcxGridTableView.CreateColumn);
  RegisterFakeHeader(G, 
       'function TcxGridTableView_GetColumnCount:Integer;',
       @TcxGridTableView_GetColumnCount);
  RegisterProperty(G, 
       'property ColumnCount:Integer read TcxGridTableView_GetColumnCount;');
  RegisterFakeHeader(G, 
       'function TcxGridTableView_GetColumns(Index: Integer):TcxGridColumn;',
       @TcxGridTableView_GetColumns);
  RegisterFakeHeader(G, 
       'procedure TcxGridTableView_PutColumns(Index: Integer;const Value: TcxGridColumn);',
       @TcxGridTableView_PutColumns);
  RegisterProperty(G, 
       'property Columns[Index: Integer]:TcxGridColumn read TcxGridTableView_GetColumns write TcxGridTableView_PutColumns;');
  RegisterFakeHeader(G, 
       'function TcxGridTableView_GetController:TcxGridTableController;',
       @TcxGridTableView_GetController);
  RegisterProperty(G, 
       'property Controller:TcxGridTableController read TcxGridTableView_GetController;');
  RegisterFakeHeader(G, 
       'function TcxGridTableView_GetGroupedColumnCount:Integer;',
       @TcxGridTableView_GetGroupedColumnCount);
  RegisterProperty(G, 
       'property GroupedColumnCount:Integer read TcxGridTableView_GetGroupedColumnCount;');
  RegisterFakeHeader(G, 
       'function TcxGridTableView_GetGroupedColumns(Index: Integer):TcxGridColumn;',
       @TcxGridTableView_GetGroupedColumns);
  RegisterProperty(G, 
       'property GroupedColumns[Index: Integer]:TcxGridColumn read TcxGridTableView_GetGroupedColumns;');
  RegisterFakeHeader(G, 
       'function TcxGridTableView_GetPainter:TcxGridTablePainter;',
       @TcxGridTableView_GetPainter);
  RegisterProperty(G, 
       'property Painter:TcxGridTablePainter read TcxGridTableView_GetPainter;');
  RegisterFakeHeader(G, 
       'function TcxGridTableView_GetViewData:TcxGridViewData;',
       @TcxGridTableView_GetViewData);
  RegisterProperty(G, 
       'property ViewData:TcxGridViewData read TcxGridTableView_GetViewData;');
  RegisterFakeHeader(G, 
       'function TcxGridTableView_GetViewInfo:TcxGridTableViewInfo;',
       @TcxGridTableView_GetViewInfo);
  RegisterProperty(G, 
       'property ViewInfo:TcxGridTableViewInfo read TcxGridTableView_GetViewInfo;');
  RegisterFakeHeader(G, 
       'function TcxGridTableView_GetVisibleColumnCount:Integer;',
       @TcxGridTableView_GetVisibleColumnCount);
  RegisterProperty(G, 
       'property VisibleColumnCount:Integer read TcxGridTableView_GetVisibleColumnCount;');
  RegisterFakeHeader(G, 
       'function TcxGridTableView_GetVisibleColumns(Index: Integer):TcxGridColumn;',
       @TcxGridTableView_GetVisibleColumns);
  RegisterProperty(G, 
       'property VisibleColumns[Index: Integer]:TcxGridColumn read TcxGridTableView_GetVisibleColumns;');
  // End of class TcxGridTableView
end;
initialization
  RegisterIMPORT_cxGridTableView;
end.
