
unit cxGridDBTableView;


interface

uses
  Classes, cxGridCustomTableView, cxGridTableView, cxGridDBDataDefinitions,
  cxStorage, cxCustomData, cxDBData;

type

  TcxGridDBColumn = class(TcxGridColumn)
  published
    property DataBinding: TcxGridItemDBDataBinding read GetDataBinding write SetDataBinding;
  end;

  TcxGridDBTableView = class(TcxGridTableView)
  protected
  public
    function CreateColumn: TcxGridDBColumn;
    function GetColumnByFieldName(const AFieldName: string): TcxGridDBColumn;
    property Columns[Index: Integer]: TcxGridDBColumn read GetColumn write SetColumn;
  published
    property DataController: TcxGridDBDataController read GetDataController write SetDataController;
  end;

implementation

end.
