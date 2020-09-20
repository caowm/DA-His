
unit cxGridTableView;

interface

uses
  Types, Variants, Windows, Messages, Classes, Graphics, Controls, ImgList, Forms,
  Buttons, StdCtrls, ExtCtrls, ComCtrls, cxClasses, cxControls, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxStorage, cxPC, cxListBox,
  cxContainer, cxEdit, cxTextEdit, cxGrid, cxGridCommon, cxGridLevel,
  cxGridCustomView, cxGridCustomTableView, cxGridDetailsSite, cxCustomData,
  cxData, cxDataStorage, cxFilter, Menus, dxCoreClasses;


type


  TcxGridColumn = class(TcxCustomGridTableItem)
  end;

  TcxGridTableView = class(TcxCustomGridTableView) 
  public
    constructor Create(AOwner: TComponent); override;

    function CreateColumn: TcxGridColumn;

    property ColumnCount: Integer read GetColumnCount;
    property Columns[Index: Integer]: TcxGridColumn read GetColumn write SetColumn;
    property Controller: TcxGridTableController read GetController;
    property GroupedColumnCount: Integer read GetGroupedColumnCount;
    property GroupedColumns[Index: Integer]: TcxGridColumn read GetGroupedColumn;
    property Painter: TcxGridTablePainter read GetPainter;
    property ViewData: TcxGridViewData read GetViewData;
    property ViewInfo: TcxGridTableViewInfo read GetViewInfo;
    property VisibleColumnCount: Integer read GetVisibleColumnCount;
    property VisibleColumns[Index: Integer]: TcxGridColumn read GetVisibleColumn;
  published
    property BackgroundBitmaps: TcxGridTableBackgroundBitmaps read GetBackgroundBitmaps write SetBackgroundBitmaps;
    property DataController: TcxGridDataController read GetDataController write SetDataController;
    property DateTimeHandling: TcxGridTableDateTimeHandling read GetDateTimeHandling write SetDateTimeHandling;
    property Filtering: TcxGridTableFiltering read GetFiltering write SetFiltering;
    property FilterRow: TcxGridFilterRowOptions read FFilterRow write SetFilterRow;
    property Images;
    property NewItemRow: TcxGridNewItemRowOptions read FNewItemRow write SetNewItemRow;
    property OptionsBehavior: TcxGridTableOptionsBehavior read GetOptionsBehavior write SetOptionsBehavior;
    property OptionsCustomize: TcxGridTableOptionsCustomize read GetOptionsCustomize write SetOptionsCustomize;
    property OptionsData: TcxGridTableOptionsData read GetOptionsData write SetOptionsData;
    property OptionsSelection: TcxGridTableOptionsSelection read GetOptionsSelection write SetOptionsSelection;
    property OptionsView: TcxGridTableOptionsView read GetOptionsView write SetOptionsView;
    property Preview: TcxGridPreview read FPreview write SetPreview;
    property Styles: TcxGridTableViewStyles read GetStyles write SetStyles ;

    property OnColumnHeaderClick: TcxGridColumnEvent read FOnColumnHeaderClick write SetOnColumnHeaderClick;
    property OnColumnPosChanged: TcxGridColumnEvent read FOnColumnPosChanged write SetOnColumnPosChanged;
    property OnColumnSizeChanged: TcxGridColumnEvent read FOnColumnSizeChanged write SetOnColumnSizeChanged;
    property OnCustomDrawColumnHeader: TcxGridColumnCustomDrawHeaderEvent read FOnCustomDrawColumnHeader write SetOnCustomDrawColumnHeader;
    property OnCustomDrawFooterCell: TcxGridColumnCustomDrawHeaderEvent read FOnCustomDrawFooterCell write SetOnCustomDrawFooterCell;
    property OnCustomDrawGroupCell: TcxGridTableCellCustomDrawEvent read FOnCustomDrawGroupCell write SetOnCustomDrawGroupCell;
    property OnCustomDrawGroupSummaryCell: TcxGridGroupSummaryCellCustomDrawEvent read FOnCustomDrawGroupSummaryCell write SetOnCustomDrawGroupSummaryCell;
    property OnCustomDrawIndicatorCell: TcxGridIndicatorCellCustomDrawEvent read FOnCustomDrawIndicatorCell write SetOnCustomDrawIndicatorCell;
    property OnCustomization;

    property OnGroupRowCollapsed: TcxGridGroupRowEvent read FOnGroupRowCollapsed write FOnGroupRowCollapsed;
    property OnGroupRowCollapsing: TcxGridGroupRowChangingEvent read FOnGroupRowCollapsing write FOnGroupRowCollapsing;
    property OnGroupRowExpanded: TcxGridGroupRowEvent read FOnGroupRowExpanded write FOnGroupRowExpanded;
    property OnGroupRowExpanding: TcxGridGroupRowChangingEvent read FOnGroupRowExpanding write FOnGroupRowExpanding;

    property OnInitGroupingDateRanges;
    property OnLeftPosChanged: TNotifyEvent read FOnLeftPosChanged write SetOnLeftPosChanged;
  end;


implementation

end.
