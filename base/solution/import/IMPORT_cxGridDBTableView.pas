unit IMPORT_cxGridDBTableView;
interface
uses
  Classes,
  cxGridCustomTableView,
  cxGridTableView,
  cxGridDBDataDefinitions,
  cxStorage,
  cxCustomData,
  cxDBData,
  cxGridDBTableView,
  Variants,
  PaxCompiler,
  PaxRegister;
procedure RegisterIMPORT_cxGridDBTableView;
implementation
function TcxGridDBTableView_GetColumns(Self:TcxGridDBTableView;Index: Integer):TcxGridDBColumn;
begin
  result := Self.Columns[Index];
end;
procedure TcxGridDBTableView_PutColumns(Self:TcxGridDBTableView;Index: Integer;const Value: TcxGridDBColumn);
begin
  Self.Columns[Index] := Value;
end;
procedure RegisterIMPORT_cxGridDBTableView;
var G, H: Integer;
begin
  H := RegisterNamespace(0, 'cxGridDBTableView');
  // Begin of class TcxGridDBColumn
  G := RegisterClassType(H, TcxGridDBColumn);
  RegisterHeader(G,
       'constructor Create(AOwner: TComponent); virtual;',
       @TcxGridDBColumn.Create);
  // End of class TcxGridDBColumn
  // Begin of class TcxGridDBTableView
  G := RegisterClassType(H, TcxGridDBTableView);
  RegisterHeader(G, 
       'function CreateColumn: TcxGridDBColumn;',
       @TcxGridDBTableView.CreateColumn);
  RegisterHeader(G, 
       'function GetColumnByFieldName(const AFieldName: string): TcxGridDBColumn;',
       @TcxGridDBTableView.GetColumnByFieldName);
  RegisterFakeHeader(G, 
       'function TcxGridDBTableView_GetColumns(Index: Integer):TcxGridDBColumn;',
       @TcxGridDBTableView_GetColumns);
  RegisterFakeHeader(G, 
       'procedure TcxGridDBTableView_PutColumns(Index: Integer;const Value: TcxGridDBColumn);',
       @TcxGridDBTableView_PutColumns);
  RegisterProperty(G, 
       'property Columns[Index: Integer]:TcxGridDBColumn read TcxGridDBTableView_GetColumns write TcxGridDBTableView_PutColumns;');
  RegisterHeader(G,
       'constructor Create(AOwner: TComponent); virtual;',
       @TcxGridDBTableView.Create);
  // End of class TcxGridDBTableView
end;
initialization
  RegisterIMPORT_cxGridDBTableView;
end.
