unit IMPORT_App_DAView;
interface
uses
  SysUtils,
  Classes,
  Forms,
  Messages,
  Menus,
  Controls,
  Variants,
  ActnList,
  StrUtils,
  DB,
  ExtCtrls,
  Contnrs,
  Windows,
  IniFiles,
  uDACore,
  uDAFields,
  uDASchema,
  uDAInterfaces,
  uDADataTable,
  uROClasses,
  cxDBData,
  cxDBEdit,
  cxEdit,
  cxTextEdit,
  cxCalendar,
  cxButtons,
  cxButtonEdit,
  cxSpinEdit,
  cxMemo,
  cxDropDownEdit,
  cxFilter,
  cxGrid,
  cxGridCustomView,
  cxGridCustomTableView,
  cxGridTableView,
  cxGridDBTableView,
  cxGridBandedTableView,
  cxGridDBBandedTableView,
  cxGridCardView,
  cxGridDBCardView,
  cxGridChartView,
  cxGridDBChartView,
  cxDBPivotGrid,
  cxGridDBDataDefinitions,
  cxClasses,
  cxControls,
  cxCustomData,
  cxCustomPivotGrid,
  cxGridPopupMenu,
  cxGridCustomPopupMenu,
  cxTL,
  cxDBTL,
  dxBar,
  dxLayoutControl,
  dxLayoutContainer,
  App_Function,
  App_Common,
  App_DevExpress,
  App_Class,
  App_DAModel,
  App_DAView,
  PaxCompiler,
  PaxRegister;
procedure RegisterIMPORT_App_DAView;
implementation
function TBaseLayoutViewPluginManager_GetPluginGroup(Self:TBaseLayoutViewPluginManager):TdxLayoutGroup;
begin
  result := Self.PluginGroup;
end;
procedure TBaseLayoutViewPluginManager_PutPluginGroup(Self:TBaseLayoutViewPluginManager;const Value: TdxLayoutGroup);
begin
  Self.PluginGroup := Value;
end;
function TCustomDataView_GetFirstAction(Self:TCustomDataView):TAction;
begin
  result := Self.FirstAction;
end;
function TCustomDataView_GetPriorAction(Self:TCustomDataView):TAction;
begin
  result := Self.PriorAction;
end;
function TCustomDataView_GetNextAction(Self:TCustomDataView):TAction;
begin
  result := Self.NextAction;
end;
function TCustomDataView_GetLastAction(Self:TCustomDataView):TAction;
begin
  result := Self.LastAction;
end;
function TCustomDataView_GetInsertAction(Self:TCustomDataView):TAction;
begin
  result := Self.InsertAction;
end;
function TCustomDataView_GetDeleteAction(Self:TCustomDataView):TAction;
begin
  result := Self.DeleteAction;
end;
function TCustomDataView_GetEditAction(Self:TCustomDataView):TAction;
begin
  result := Self.EditAction;
end;
function TCustomDataView_GetSaveAction(Self:TCustomDataView):TAction;
begin
  result := Self.SaveAction;
end;
function TCustomDataView_GetCancelAction(Self:TCustomDataView):TAction;
begin
  result := Self.CancelAction;
end;
function TCustomDataView_GetExportAction(Self:TCustomDataView):TAction;
begin
  result := Self.ExportAction;
end;
function TCustomDataView_GetImportAction(Self:TCustomDataView):TAction;
begin
  result := Self.ImportAction;
end;
function TCustomDataView_GetPrintAction(Self:TCustomDataView):TAction;
begin
  result := Self.PrintAction;
end;
function TCustomDataView_GetQueryAction(Self:TCustomDataView):TAction;
begin
  result := Self.QueryAction;
end;
function TCustomDataView_GetSelectAllAction(Self:TCustomDataView):TAction;
begin
  result := Self.SelectAllAction;
end;
function TCustomDataView_GetSelectNoneAction(Self:TCustomDataView):TAction;
begin
  result := Self.SelectNoneAction;
end;
function TCustomDataView_GetSelectInverseAction(Self:TCustomDataView):TAction;
begin
  result := Self.SelectInverseAction;
end;
function TCustomDataView_GetInserting(Self:TCustomDataView):Boolean;
begin
  result := Self.Inserting;
end;
procedure TCustomDataView_PutInserting(Self:TCustomDataView;const Value: Boolean);
begin
  Self.Inserting := Value;
end;
function TCustomDataView_GetDeleting(Self:TCustomDataView):Boolean;
begin
  result := Self.Deleting;
end;
procedure TCustomDataView_PutDeleting(Self:TCustomDataView;const Value: Boolean);
begin
  Self.Deleting := Value;
end;
function TCustomDataView_GetEditing(Self:TCustomDataView):Boolean;
begin
  result := Self.Editing;
end;
procedure TCustomDataView_PutEditing(Self:TCustomDataView;const Value: Boolean);
begin
  Self.Editing := Value;
end;
function TCustomDataView_GetQuerying(Self:TCustomDataView):Boolean;
begin
  result := Self.Querying;
end;
procedure TCustomDataView_PutQuerying(Self:TCustomDataView;const Value: Boolean);
begin
  Self.Querying := Value;
end;
function TCustomDataView_GetExporting(Self:TCustomDataView):Boolean;
begin
  result := Self.Exporting;
end;
procedure TCustomDataView_PutExporting(Self:TCustomDataView;const Value: Boolean);
begin
  Self.Exporting := Value;
end;
function TCustomDataView_GetImporting(Self:TCustomDataView):Boolean;
begin
  result := Self.Importing;
end;
procedure TCustomDataView_PutImporting(Self:TCustomDataView;const Value: Boolean);
begin
  Self.Importing := Value;
end;
function TCustomDataView_GetPrinting(Self:TCustomDataView):Boolean;
begin
  result := Self.Printing;
end;
procedure TCustomDataView_PutPrinting(Self:TCustomDataView;const Value: Boolean);
begin
  Self.Printing := Value;
end;
function TCustomDataView_GetViewData(Self:TCustomDataView):TCustomData;
begin
  result := Self.ViewData;
end;
procedure TCustomDataView_PutViewData(Self:TCustomDataView;const Value: TCustomData);
begin
  Self.ViewData := Value;
end;
function TCustomDataView_GetBeginDateEdit(Self:TCustomDataView):TcxDateEdit;
begin
  result := Self.BeginDateEdit;
end;
function TCustomDataView_GetEndDateEdit(Self:TCustomDataView):TcxDateEdit;
begin
  result := Self.EndDateEdit;
end;
function TCustomDataView_GetFilterEdit(Self:TCustomDataView):TcxButtonEdit;
begin
  result := Self.FilterEdit;
end;
function TCustomDataView_GetViewPopupMenu(Self:TCustomDataView):TdxBarPopupMenu;
begin
  result := Self.ViewPopupMenu;
end;
function TCustomDataView_GetViewGroup(Self:TCustomDataView):TdxLayoutGroup;
begin
  result := Self.ViewGroup;
end;
function TCustomDataView_GetToolBarGroup(Self:TCustomDataView):TdxLayoutGroup;
begin
  result := Self.ToolBarGroup;
end;
function TCustomDataView_GetActionGroup(Self:TCustomDataView):TdxLayoutGroup;
begin
  result := Self.ActionGroup;
end;
function TCustomDataView_GetFilterEditItem(Self:TCustomDataView):TdxLayoutItem;
begin
  result := Self.FilterEditItem;
end;
function TCustomDataView_GetPeriodGroup(Self:TCustomDataView):TdxLayoutGroup;
begin
  result := Self.PeriodGroup;
end;
function TCustomDataView_GetBeginDateItem(Self:TCustomDataView):TdxLayoutItem;
begin
  result := Self.BeginDateItem;
end;
function TCustomDataView_GetEndDateItem(Self:TCustomDataView):TdxLayoutItem;
begin
  result := Self.EndDateItem;
end;
function TCustomDataView_GetAutoEdit(Self:TCustomDataView):Boolean;
begin
  result := Self.AutoEdit;
end;
procedure TCustomDataView_PutAutoEdit(Self:TCustomDataView;const Value: Boolean);
begin
  Self.AutoEdit := Value;
end;
function TCustomDataView_GetFilterFields(Self:TCustomDataView):TStrings;
begin
  result := Self.FilterFields;
end;
function TCustomDataView_GetFilterText(Self:TCustomDataView):string;
begin
  result := Self.FilterText;
end;
procedure TCustomDataView_PutFilterText(Self:TCustomDataView;const Value: string);
begin
  Self.FilterText := Value;
end;
function TCustomDataView_GetFixFilterField(Self:TCustomDataView):string;
begin
  result := Self.FixFilterField;
end;
function TCustomDataView_GetFixFilterText(Self:TCustomDataView):string;
begin
  result := Self.FixFilterText;
end;
function TCustomDataView_GetMultiSelectField(Self:TCustomDataView):string;
begin
  result := Self.MultiSelectField;
end;
procedure TCustomDataView_PutMultiSelectField(Self:TCustomDataView;const Value: string);
begin
  Self.MultiSelectField := Value;
end;
function TCustomDataView_GetMultiSelectCategoryField(Self:TCustomDataView):string;
begin
  result := Self.MultiSelectCategoryField;
end;
procedure TCustomDataView_PutMultiSelectCategoryField(Self:TCustomDataView;const Value: string);
begin
  Self.MultiSelectCategoryField := Value;
end;
function TFormDataView_GetEditorGroup(Self:TFormDataView):TdxLayoutGroup;
begin
  result := Self.EditorGroup;
end;
function TFormDataView_GetImage(Self:TFormDataView):TImage;
begin
  result := Self.Image;
end;
procedure TFormDataView_PutImageName(Self:TFormDataView;const Value: string);
begin
  Self.ImageName := Value;
end;
function TFormDataView_GetOKButton(Self:TFormDataView):TcxButton;
begin
  result := Self.OKButton;
end;
function TFormDataView_GetCancelButton(Self:TFormDataView):TcxButton;
begin
  result := Self.CancelButton;
end;
function TFormDataView_GetBottomGroup(Self:TFormDataView):TdxLayoutGroup;
begin
  result := Self.BottomGroup;
end;
function TFormDataView_GetOKItem(Self:TFormDataView):TdxLayoutItem;
begin
  result := Self.OKItem;
end;
function TFormDataView_GetCancelItem(Self:TFormDataView):TdxLayoutItem;
begin
  result := Self.CancelItem;
end;
function TCustomGridDataView_GetFormViewAction(Self:TCustomGridDataView):TAction;
begin
  result := Self.FormViewAction;
end;
function TCustomGridDataView_GetGrid(Self:TCustomGridDataView):TcxGrid;
begin
  result := Self.Grid;
end;
function TCustomGridDataView_GetGridPopupMenu(Self:TCustomGridDataView):TcxGridPopupMenu;
begin
  result := Self.GridPopupMenu;
end;
function TCustomGridDataView_GetGridView(Self:TCustomGridDataView):TcxCustomGridView;
begin
  result := Self.GridView;
end;
function TCustomGridDataView_GetGridViewPopupMenu(Self:TCustomGridDataView):TPopupMenu;
begin
  result := Self.GridViewPopupMenu;
end;
function TCustomGridDataView_GetDataController(Self:TCustomGridDataView):TcxGridDBDataController;
begin
  result := Self.DataController;
end;
function TCustomGridDataView_GetGridLayoutItem(Self:TCustomGridDataView):TdxLayoutItem;
begin
  result := Self.GridLayoutItem;
end;
function TCustomGridDataView_GetFormView(Self:TCustomGridDataView):TFormDataView;
begin
  result := Self.FormView;
end;
function TCustomGridDataView_GetFormViewClass(Self:TCustomGridDataView):TFormDataViewClass;
begin
  result := Self.FormViewClass;
end;
procedure TCustomGridDataView_PutFormViewClass(Self:TCustomGridDataView;const Value: TFormDataViewClass);
begin
  Self.FormViewClass := Value;
end;
function TCustomGridDataView_GetUseFormForEditing(Self:TCustomGridDataView):Boolean;
begin
  result := Self.UseFormForEditing;
end;
procedure TCustomGridDataView_PutUseFormForEditing(Self:TCustomGridDataView;const Value: Boolean);
begin
  Self.UseFormForEditing := Value;
end;
function TTableGridDataView_GetTableView(Self:TTableGridDataView):TcxGridDBTableView;
begin
  result := Self.TableView;
end;
function TBandGridDataView_GetBandView(Self:TBandGridDataView):TcxGridDBBandedTableView;
begin
  result := Self.BandView;
end;
function TCardGridDataView_GetCardView(Self:TCardGridDataView):TcxGridDBCardView;
begin
  result := Self.CardView;
end;
function TChartGridDataView_GetChartView(Self:TChartGridDataView):TcxGridDBChartView;
begin
  result := Self.ChartView;
end;
function TPivotDataView_GetPivotGrid(Self:TPivotDataView):TcxDBPivotGrid;
begin
  result := Self.PivotGrid;
end;
function TPivotDataView_GetPivotLayoutItem(Self:TPivotDataView):TdxLayoutItem;
begin
  result := Self.PivotLayoutItem;
end;
function TTreeDataView_GetTreeView(Self:TTreeDataView):TcxDBTreeList;
begin
  result := Self.TreeView;
end;
function TTreeDataView_GetTreeLayoutItem(Self:TTreeDataView):TdxLayoutItem;
begin
  result := Self.TreeLayoutItem;
end;
function TDataViewOperation_GetViewData(Self:TDataViewOperation):TCustomData;
begin
  result := Self.ViewData;
end;
procedure TDataViewOperation_PutViewData(Self:TDataViewOperation;const Value: TCustomData);
begin
  Self.ViewData := Value;
end;
function TDataViewOperation_GetOwnsData(Self:TDataViewOperation):Boolean;
begin
  result := Self.OwnsData;
end;
procedure TDataViewOperation_PutOwnsData(Self:TDataViewOperation;const Value: Boolean);
begin
  Self.OwnsData := Value;
end;
function TDictIMEDialog_GetDictData(Self:TDictIMEDialog):TCustomData;
begin
  result := Self.DictData;
end;
function TPopupEditorWrapInfo_GetButtonAction(Self:TPopupEditorWrapInfo):TAction;
begin
  result := Self.ButtonAction;
end;
function TPopupEditorWrapInfo_GetClearAction(Self:TPopupEditorWrapInfo):TAction;
begin
  result := Self.ClearAction;
end;
function TPopupEditorWrapInfo_GetDataSource(Self:TPopupEditorWrapInfo):TDADataSource;
begin
  result := Self.DataSource;
end;
procedure TPopupEditorWrapInfo_PutDataSource(Self:TPopupEditorWrapInfo;const Value: TDADataSource);
begin
  Self.DataSource := Value;
end;
function TPopupEditorWrapInfo_GetDataTable(Self:TPopupEditorWrapInfo):TDADataTable;
begin
  result := Self.DataTable;
end;
procedure TPopupEditorWrapInfo_PutDataTable(Self:TPopupEditorWrapInfo;const Value: TDADataTable);
begin
  Self.DataTable := Value;
end;
function TPopupEditorWrapInfo_GetProperties(Self:TPopupEditorWrapInfo):TcxCustomEditProperties;
begin
  result := Self.Properties;
end;
procedure TPopupEditorWrapInfo_PutProperties(Self:TPopupEditorWrapInfo;const Value: TcxCustomEditProperties);
begin
  Self.Properties := Value;
end;
function TPopupEditorWrapInfo_GetField(Self:TPopupEditorWrapInfo):TDAField;
begin
  result := Self.Field;
end;
procedure TPopupEditorWrapInfo_PutField(Self:TPopupEditorWrapInfo;const Value: TDAField);
begin
  Self.Field := Value;
end;
function TPopupEditorWrapInfo_GetSetValueField(Self:TPopupEditorWrapInfo):TStrings;
begin
  result := Self.SetValueField;
end;
function TPopupEditorWrapInfo_GetGetValueField(Self:TPopupEditorWrapInfo):TStrings;
begin
  result := Self.GetValueField;
end;
function TPopupEditorWrapInfo_GetDictName(Self:TPopupEditorWrapInfo):string;
begin
  result := Self.DictName;
end;
procedure TPopupEditorWrapInfo_PutDictName(Self:TPopupEditorWrapInfo;const Value: string);
begin
  Self.DictName := Value;
end;
function TPopupEditorWrapInfo_GetMultiEditorAttributes(Self:TPopupEditorWrapInfo):TStrings;
begin
  result := Self.MultiEditorAttributes;
end;
function TReportConfigView_GetReportName(Self:TReportConfigView):string;
begin
  result := Self.ReportName;
end;
function TReportConfigView_GetReportView(Self:TReportConfigView):TTableGridDataView;
begin
  result := Self.ReportView;
end;
function TReportConfigView_GetParamView(Self:TReportConfigView):TTableGridDataView;
begin
  result := Self.ParamView;
end;
procedure RegisterIMPORT_App_DAView;
var G, H: Integer;
begin
  H := RegisterNamespace(0, 'App_DAView');
  RegisterConstant(H, 'sDataNameMiscReport', 'Misc_Report');
  RegisterConstant(H, 'sDataNameMiscReportParam', 'Misc_ReportParam');
  RegisterConstant(H, 'sDataViewName_Table', 'TableView');
  RegisterConstant(H, 'sDataViewName_Card', 'CardView');
  RegisterConstant(H, 'sDataViewName_Tree', 'TreeView');
  RegisterConstant(H, 'sDataViewName_Form', 'FormView');
  RegisterConstant(H, 'sPopupViewName_DictIME', 'DictIME');
  RegisterConstant(H, 'sPopupViewName_AgeIME', 'AgeIME');
  RegisterConstant(H, 'sDeleteDataConfirm', '确定删除数据吗?');
  RegisterConstant(H, 'sControlHaveWrapped', '%s控件已包装');
  RegisterConstant(H, 'sActionCategoryNavigate', 'Navigate');
  RegisterConstant(H, 'sActionCategoryData', 'Data');
  RegisterConstant(H, 'sActionCategoryBusiness', 'Business');
  RegisterConstant(H, 'sLayoutGroupOperation', '操作面板');
  RegisterConstant(H, 'sLayoutGroupInput', '输入面板');
  RegisterRTTIType(H, TypeInfo(TNavigateAction));
  // Begin of class TBaseLayoutViewPluginManager
  G := RegisterClassType(H, TBaseLayoutViewPluginManager);
  RegisterHeader(G, 
       'procedure PluginOperation(AOperation: TBaseOperation); override;',
       @TBaseLayoutViewPluginManager.PluginOperation);
  RegisterFakeHeader(G, 
       'function TBaseLayoutViewPluginManager_GetPluginGroup:TdxLayoutGroup;',
       @TBaseLayoutViewPluginManager_GetPluginGroup);
  RegisterFakeHeader(G, 
       'procedure TBaseLayoutViewPluginManager_PutPluginGroup(const Value: TdxLayoutGroup);',
       @TBaseLayoutViewPluginManager_PutPluginGroup);
  RegisterProperty(G, 
       'property PluginGroup:TdxLayoutGroup read TBaseLayoutViewPluginManager_GetPluginGroup write TBaseLayoutViewPluginManager_PutPluginGroup;');
  RegisterHeader(G,
       'constructor Create(AOwner: TComponent); virtual;',
       @TBaseLayoutViewPluginManager.Create);
  // End of class TBaseLayoutViewPluginManager
  // Begin of class TCustomDataView
  G := RegisterClassType(H, TCustomDataView);
  RegisterHeader(G, 
       'destructor Destroy(); override;',
       @TCustomDataView.Destroy);
  RegisterHeader(G, 
       'function CanInsert(): Boolean; virtual;',
       @TCustomDataView.CanInsert);
  RegisterHeader(G, 
       'function CanEdit(): Boolean; virtual;',
       @TCustomDataView.CanEdit);
  RegisterHeader(G, 
       'function CanDelete(): Boolean; virtual;',
       @TCustomDataView.CanDelete);
  RegisterHeader(G, 
       'function CanSave(): Boolean; virtual;',
       @TCustomDataView.CanSave);
  RegisterHeader(G, 
       'function CanCancel(): Boolean; virtual;',
       @TCustomDataView.CanCancel);
  RegisterHeader(G, 
       'function CanQuery(): Boolean; virtual;',
       @TCustomDataView.CanQuery);
  RegisterHeader(G, 
       'function CanExport(): Boolean; virtual;',
       @TCustomDataView.CanExport);
  RegisterHeader(G, 
       'function CanImport(): Boolean; virtual;',
       @TCustomDataView.CanImport);
  RegisterHeader(G, 
       'function CanPrint(): Boolean; virtual;',
       @TCustomDataView.CanPrint);
  RegisterHeader(G, 
       'function CanNavigate(): Boolean; virtual;',
       @TCustomDataView.CanNavigate);
  RegisterHeader(G, 
       'procedure GoFirst(); virtual;',
       @TCustomDataView.GoFirst);
  RegisterHeader(G, 
       'procedure GoNext(); virtual;',
       @TCustomDataView.GoNext);
  RegisterHeader(G, 
       'procedure GoPrior(); virtual;',
       @TCustomDataView.GoPrior);
  RegisterHeader(G, 
       'procedure GoLast(); virtual;',
       @TCustomDataView.GoLast);
  RegisterHeader(G, 
       'procedure DataInsert(); virtual;',
       @TCustomDataView.DataInsert);
  RegisterHeader(G, 
       'procedure DataEdit(); virtual;',
       @TCustomDataView.DataEdit);
  RegisterHeader(G, 
       'function DataDelete(AAskConfirm: Boolean = True): Boolean; virtual;',
       @TCustomDataView.DataDelete);
  RegisterHeader(G, 
       'procedure DataSave(); virtual;',
       @TCustomDataView.DataSave);
  RegisterHeader(G, 
       'procedure DataCancel(); virtual;',
       @TCustomDataView.DataCancel);
  RegisterHeader(G, 
       'procedure DataExport(); virtual;',
       @TCustomDataView.DataExport);
  RegisterHeader(G, 
       'procedure DataImport(); virtual;',
       @TCustomDataView.DataImport);
  RegisterHeader(G, 
       'procedure DataPrint(); virtual;',
       @TCustomDataView.DataPrint);
  RegisterHeader(G, 
       'procedure DataQuery(); virtual;',
       @TCustomDataView.DataQuery);
  RegisterHeader(G, 
       'function FieldByName(const AName: string): TDAField;',
       @TCustomDataView.FieldByName);
  RegisterHeader(G,
       'function GetVisibleFields(): string; virtual;',
       @TCustomDataView.GetVisibleFields);
  RegisterHeader(G, 
       'procedure DoLocalFilter(const AValue: string); virtual;',
       @TCustomDataView.DoLocalFilter);
  RegisterHeader(G, 
       'procedure DoServerFilter(const AValue: string); virtual;',
       @TCustomDataView.DoServerFilter);
  RegisterHeader(G, 
       'procedure CheckSelected(); virtual;',
       @TCustomDataView.CheckSelected);
  RegisterHeader(G, 
       'function GetMultiSelectCount: Integer;',
       @TCustomDataView.GetMultiSelectCount);
  RegisterHeader(G, 
       'procedure SetActionVisible(AAction: TAction; AVisible: Boolean);',
       @TCustomDataView.SetActionVisible);
  RegisterHeader(G, 
       'procedure SetActionsVisible(AActionArray: array of TAction; AVisible: Boolean = True);',
       @TCustomDataView.SetActionsVisible);
  RegisterHeader(G, 
       'procedure SetDataEditing(AValue: Boolean);',
       @TCustomDataView.SetDataEditing);
  RegisterHeader(G, 
       'function HaveDataAfterFilter(): Boolean; virtual;',
       @TCustomDataView.HaveDataAfterFilter);
  RegisterHeader(G, 
       'procedure SaveViewLayout(AIniFile: TIniFile); virtual;',
       @TCustomDataView.SaveViewLayout);
  RegisterHeader(G, 
       'procedure RestoreViewLayout(AIniFile: TIniFile); virtual;',
       @TCustomDataView.RestoreViewLayout);
  RegisterHeader(G, 
       'procedure SetFieldEditing(AFieldNames: array of string); virtual;',
       @TCustomDataView.SetFieldEditing);
  RegisterHeader(G, 
       'procedure SetPeriodFormatYearMonth();',
       @TCustomDataView.SetPeriodFormatYearMonth);
  RegisterHeader(G, 
       'procedure SetPeriodFormatYear();',
       @TCustomDataView.SetPeriodFormatYear);
  RegisterHeader(G, 
       'procedure SetOnlyOneDate();',
       @TCustomDataView.SetOnlyOneDate);
  RegisterFakeHeader(G, 
       'function TCustomDataView_GetFirstAction:TAction;',
       @TCustomDataView_GetFirstAction);
  RegisterProperty(G, 
       'property FirstAction:TAction read TCustomDataView_GetFirstAction;');
  RegisterFakeHeader(G, 
       'function TCustomDataView_GetPriorAction:TAction;',
       @TCustomDataView_GetPriorAction);
  RegisterProperty(G, 
       'property PriorAction:TAction read TCustomDataView_GetPriorAction;');
  RegisterFakeHeader(G, 
       'function TCustomDataView_GetNextAction:TAction;',
       @TCustomDataView_GetNextAction);
  RegisterProperty(G, 
       'property NextAction:TAction read TCustomDataView_GetNextAction;');
  RegisterFakeHeader(G, 
       'function TCustomDataView_GetLastAction:TAction;',
       @TCustomDataView_GetLastAction);
  RegisterProperty(G, 
       'property LastAction:TAction read TCustomDataView_GetLastAction;');
  RegisterFakeHeader(G, 
       'function TCustomDataView_GetInsertAction:TAction;',
       @TCustomDataView_GetInsertAction);
  RegisterProperty(G, 
       'property InsertAction:TAction read TCustomDataView_GetInsertAction;');
  RegisterFakeHeader(G, 
       'function TCustomDataView_GetDeleteAction:TAction;',
       @TCustomDataView_GetDeleteAction);
  RegisterProperty(G, 
       'property DeleteAction:TAction read TCustomDataView_GetDeleteAction;');
  RegisterFakeHeader(G, 
       'function TCustomDataView_GetEditAction:TAction;',
       @TCustomDataView_GetEditAction);
  RegisterProperty(G,
       'property EditAction:TAction read TCustomDataView_GetEditAction;');
  RegisterFakeHeader(G, 
       'function TCustomDataView_GetSaveAction:TAction;',
       @TCustomDataView_GetSaveAction);
  RegisterProperty(G, 
       'property SaveAction:TAction read TCustomDataView_GetSaveAction;');
  RegisterFakeHeader(G, 
       'function TCustomDataView_GetCancelAction:TAction;',
       @TCustomDataView_GetCancelAction);
  RegisterProperty(G, 
       'property CancelAction:TAction read TCustomDataView_GetCancelAction;');
  RegisterFakeHeader(G, 
       'function TCustomDataView_GetExportAction:TAction;',
       @TCustomDataView_GetExportAction);
  RegisterProperty(G, 
       'property ExportAction:TAction read TCustomDataView_GetExportAction;');
  RegisterFakeHeader(G, 
       'function TCustomDataView_GetImportAction:TAction;',
       @TCustomDataView_GetImportAction);
  RegisterProperty(G, 
       'property ImportAction:TAction read TCustomDataView_GetImportAction;');
  RegisterFakeHeader(G, 
       'function TCustomDataView_GetPrintAction:TAction;',
       @TCustomDataView_GetPrintAction);
  RegisterProperty(G, 
       'property PrintAction:TAction read TCustomDataView_GetPrintAction;');
  RegisterFakeHeader(G, 
       'function TCustomDataView_GetQueryAction:TAction;',
       @TCustomDataView_GetQueryAction);
  RegisterProperty(G, 
       'property QueryAction:TAction read TCustomDataView_GetQueryAction;');
  RegisterFakeHeader(G, 
       'function TCustomDataView_GetSelectAllAction:TAction;',
       @TCustomDataView_GetSelectAllAction);
  RegisterProperty(G, 
       'property SelectAllAction:TAction read TCustomDataView_GetSelectAllAction;');
  RegisterFakeHeader(G, 
       'function TCustomDataView_GetSelectNoneAction:TAction;',
       @TCustomDataView_GetSelectNoneAction);
  RegisterProperty(G, 
       'property SelectNoneAction:TAction read TCustomDataView_GetSelectNoneAction;');
  RegisterFakeHeader(G, 
       'function TCustomDataView_GetSelectInverseAction:TAction;',
       @TCustomDataView_GetSelectInverseAction);
  RegisterProperty(G, 
       'property SelectInverseAction:TAction read TCustomDataView_GetSelectInverseAction;');
  RegisterFakeHeader(G, 
       'function TCustomDataView_GetInserting:Boolean;',
       @TCustomDataView_GetInserting);
  RegisterFakeHeader(G, 
       'procedure TCustomDataView_PutInserting(const Value: Boolean);',
       @TCustomDataView_PutInserting);
  RegisterProperty(G, 
       'property Inserting:Boolean read TCustomDataView_GetInserting write TCustomDataView_PutInserting;');
  RegisterFakeHeader(G, 
       'function TCustomDataView_GetDeleting:Boolean;',
       @TCustomDataView_GetDeleting);
  RegisterFakeHeader(G, 
       'procedure TCustomDataView_PutDeleting(const Value: Boolean);',
       @TCustomDataView_PutDeleting);
  RegisterProperty(G, 
       'property Deleting:Boolean read TCustomDataView_GetDeleting write TCustomDataView_PutDeleting;');
  RegisterFakeHeader(G, 
       'function TCustomDataView_GetEditing:Boolean;',
       @TCustomDataView_GetEditing);
  RegisterFakeHeader(G, 
       'procedure TCustomDataView_PutEditing(const Value: Boolean);',
       @TCustomDataView_PutEditing);
  RegisterProperty(G, 
       'property Editing:Boolean read TCustomDataView_GetEditing write TCustomDataView_PutEditing;');
  RegisterFakeHeader(G, 
       'function TCustomDataView_GetQuerying:Boolean;',
       @TCustomDataView_GetQuerying);
  RegisterFakeHeader(G, 
       'procedure TCustomDataView_PutQuerying(const Value: Boolean);',
       @TCustomDataView_PutQuerying);
  RegisterProperty(G, 
       'property Querying:Boolean read TCustomDataView_GetQuerying write TCustomDataView_PutQuerying;');
  RegisterFakeHeader(G, 
       'function TCustomDataView_GetExporting:Boolean;',
       @TCustomDataView_GetExporting);
  RegisterFakeHeader(G, 
       'procedure TCustomDataView_PutExporting(const Value: Boolean);',
       @TCustomDataView_PutExporting);
  RegisterProperty(G, 
       'property Exporting:Boolean read TCustomDataView_GetExporting write TCustomDataView_PutExporting;');
  RegisterFakeHeader(G, 
       'function TCustomDataView_GetImporting:Boolean;',
       @TCustomDataView_GetImporting);
  RegisterFakeHeader(G, 
       'procedure TCustomDataView_PutImporting(const Value: Boolean);',
       @TCustomDataView_PutImporting);
  RegisterProperty(G, 
       'property Importing:Boolean read TCustomDataView_GetImporting write TCustomDataView_PutImporting;');
  RegisterFakeHeader(G, 
       'function TCustomDataView_GetPrinting:Boolean;',
       @TCustomDataView_GetPrinting);
  RegisterFakeHeader(G, 
       'procedure TCustomDataView_PutPrinting(const Value: Boolean);',
       @TCustomDataView_PutPrinting);
  RegisterProperty(G, 
       'property Printing:Boolean read TCustomDataView_GetPrinting write TCustomDataView_PutPrinting;');
  RegisterFakeHeader(G, 
       'function TCustomDataView_GetViewData:TCustomData;',
       @TCustomDataView_GetViewData);
  RegisterFakeHeader(G, 
       'procedure TCustomDataView_PutViewData(const Value: TCustomData);',
       @TCustomDataView_PutViewData);
  RegisterProperty(G, 
       'property ViewData:TCustomData read TCustomDataView_GetViewData write TCustomDataView_PutViewData;');
  RegisterFakeHeader(G, 
       'function TCustomDataView_GetBeginDateEdit:TcxDateEdit;',
       @TCustomDataView_GetBeginDateEdit);
  RegisterProperty(G, 
       'property BeginDateEdit:TcxDateEdit read TCustomDataView_GetBeginDateEdit;');
  RegisterFakeHeader(G, 
       'function TCustomDataView_GetEndDateEdit:TcxDateEdit;',
       @TCustomDataView_GetEndDateEdit);
  RegisterProperty(G, 
       'property EndDateEdit:TcxDateEdit read TCustomDataView_GetEndDateEdit;');
  RegisterFakeHeader(G, 
       'function TCustomDataView_GetFilterEdit:TcxButtonEdit;',
       @TCustomDataView_GetFilterEdit);
  RegisterProperty(G, 
       'property FilterEdit:TcxButtonEdit read TCustomDataView_GetFilterEdit;');
  RegisterFakeHeader(G, 
       'function TCustomDataView_GetViewPopupMenu:TdxBarPopupMenu;',
       @TCustomDataView_GetViewPopupMenu);
  RegisterProperty(G, 
       'property ViewPopupMenu:TdxBarPopupMenu read TCustomDataView_GetViewPopupMenu;');
  RegisterFakeHeader(G, 
       'function TCustomDataView_GetViewGroup:TdxLayoutGroup;',
       @TCustomDataView_GetViewGroup);
  RegisterProperty(G, 
       'property ViewGroup:TdxLayoutGroup read TCustomDataView_GetViewGroup;');
  RegisterFakeHeader(G, 
       'function TCustomDataView_GetToolBarGroup:TdxLayoutGroup;',
       @TCustomDataView_GetToolBarGroup);
  RegisterProperty(G, 
       'property ToolBarGroup:TdxLayoutGroup read TCustomDataView_GetToolBarGroup;');
  RegisterFakeHeader(G, 
       'function TCustomDataView_GetActionGroup:TdxLayoutGroup;',
       @TCustomDataView_GetActionGroup);
  RegisterProperty(G, 
       'property ActionGroup:TdxLayoutGroup read TCustomDataView_GetActionGroup;');
  RegisterFakeHeader(G, 
       'function TCustomDataView_GetFilterEditItem:TdxLayoutItem;',
       @TCustomDataView_GetFilterEditItem);
  RegisterProperty(G, 
       'property FilterEditItem:TdxLayoutItem read TCustomDataView_GetFilterEditItem;');
  RegisterFakeHeader(G, 
       'function TCustomDataView_GetPeriodGroup:TdxLayoutGroup;',
       @TCustomDataView_GetPeriodGroup);
  RegisterProperty(G, 
       'property PeriodGroup:TdxLayoutGroup read TCustomDataView_GetPeriodGroup;');
  RegisterFakeHeader(G,
       'function TCustomDataView_GetBeginDateItem:TdxLayoutItem;',
       @TCustomDataView_GetBeginDateItem);
  RegisterProperty(G, 
       'property BeginDateItem:TdxLayoutItem read TCustomDataView_GetBeginDateItem;');
  RegisterFakeHeader(G, 
       'function TCustomDataView_GetEndDateItem:TdxLayoutItem;',
       @TCustomDataView_GetEndDateItem);
  RegisterProperty(G, 
       'property EndDateItem:TdxLayoutItem read TCustomDataView_GetEndDateItem;');
  RegisterFakeHeader(G, 
       'function TCustomDataView_GetAutoEdit:Boolean;',
       @TCustomDataView_GetAutoEdit);
  RegisterFakeHeader(G, 
       'procedure TCustomDataView_PutAutoEdit(const Value: Boolean);',
       @TCustomDataView_PutAutoEdit);
  RegisterProperty(G, 
       'property AutoEdit:Boolean read TCustomDataView_GetAutoEdit write TCustomDataView_PutAutoEdit;');
  RegisterFakeHeader(G, 
       'function TCustomDataView_GetFilterFields:TStrings;',
       @TCustomDataView_GetFilterFields);
  RegisterProperty(G, 
       'property FilterFields:TStrings read TCustomDataView_GetFilterFields;');
  RegisterFakeHeader(G, 
       'function TCustomDataView_GetFilterText:string;',
       @TCustomDataView_GetFilterText);
  RegisterFakeHeader(G,
       'procedure TCustomDataView_PutFilterText(const Value: string);',
       @TCustomDataView_PutFilterText);
  RegisterProperty(G, 
       'property FilterText:string read TCustomDataView_GetFilterText write TCustomDataView_PutFilterText;');
  RegisterFakeHeader(G, 
       'function TCustomDataView_GetFixFilterField:string;',
       @TCustomDataView_GetFixFilterField);
  RegisterProperty(G, 
       'property FixFilterField:string read TCustomDataView_GetFixFilterField;');
  RegisterFakeHeader(G, 
       'function TCustomDataView_GetFixFilterText:string;',
       @TCustomDataView_GetFixFilterText);
  RegisterProperty(G, 
       'property FixFilterText:string read TCustomDataView_GetFixFilterText;');
  RegisterFakeHeader(G, 
       'function TCustomDataView_GetMultiSelectField:string;',
       @TCustomDataView_GetMultiSelectField);
  RegisterFakeHeader(G, 
       'procedure TCustomDataView_PutMultiSelectField(const Value: string);',
       @TCustomDataView_PutMultiSelectField);
  RegisterProperty(G, 
       'property MultiSelectField:string read TCustomDataView_GetMultiSelectField write TCustomDataView_PutMultiSelectField;');
  RegisterFakeHeader(G, 
       'function TCustomDataView_GetMultiSelectCategoryField:string;',
       @TCustomDataView_GetMultiSelectCategoryField);
  RegisterFakeHeader(G,
       'procedure TCustomDataView_PutMultiSelectCategoryField(const Value: string);',
       @TCustomDataView_PutMultiSelectCategoryField);
  RegisterProperty(G, 
       'property MultiSelectCategoryField:string read TCustomDataView_GetMultiSelectCategoryField write TCustomDataView_PutMultiSelectCategoryField;');
  RegisterHeader(G,
       'constructor Create(AOwner: TComponent); virtual;',
       @TCustomDataView.Create);
  // End of class TCustomDataView
  RegisterClassReferenceType(H, 'TCustomDataViewClass');
  // Begin of class TFormDataView
  G := RegisterClassType(H, TFormDataView);
  RegisterFakeHeader(G, 
       'function TFormDataView_GetEditorGroup:TdxLayoutGroup;',
       @TFormDataView_GetEditorGroup);
  RegisterProperty(G, 
       'property EditorGroup:TdxLayoutGroup read TFormDataView_GetEditorGroup;');
  RegisterFakeHeader(G, 
       'function TFormDataView_GetImage:TImage;',
       @TFormDataView_GetImage);
  RegisterProperty(G, 
       'property Image:TImage read TFormDataView_GetImage;');
  RegisterFakeHeader(G, 
       'procedure TFormDataView_PutImageName(const Value: string);',
       @TFormDataView_PutImageName);
  RegisterProperty(G, 
       'property ImageName:string write TFormDataView_PutImageName;');
  RegisterFakeHeader(G, 
       'function TFormDataView_GetOKButton:TcxButton;',
       @TFormDataView_GetOKButton);
  RegisterProperty(G, 
       'property OKButton:TcxButton read TFormDataView_GetOKButton;');
  RegisterFakeHeader(G, 
       'function TFormDataView_GetCancelButton:TcxButton;',
       @TFormDataView_GetCancelButton);
  RegisterProperty(G, 
       'property CancelButton:TcxButton read TFormDataView_GetCancelButton;');
  RegisterFakeHeader(G, 
       'function TFormDataView_GetBottomGroup:TdxLayoutGroup;',
       @TFormDataView_GetBottomGroup);
  RegisterProperty(G, 
       'property BottomGroup:TdxLayoutGroup read TFormDataView_GetBottomGroup;');
  RegisterFakeHeader(G, 
       'function TFormDataView_GetOKItem:TdxLayoutItem;',
       @TFormDataView_GetOKItem);
  RegisterProperty(G, 
       'property OKItem:TdxLayoutItem read TFormDataView_GetOKItem;');
  RegisterFakeHeader(G, 
       'function TFormDataView_GetCancelItem:TdxLayoutItem;',
       @TFormDataView_GetCancelItem);
  RegisterProperty(G, 
       'property CancelItem:TdxLayoutItem read TFormDataView_GetCancelItem;');
  RegisterHeader(G,
       'constructor Create(AOwner: TComponent); virtual;',
       @TFormDataView.Create);
  // End of class TFormDataView
  RegisterClassReferenceType(H, 'TFormDataViewClass');
  // Begin of class TCustomGridDataView
  G := RegisterClassType(H, TCustomGridDataView);
  RegisterHeader(G, 
       'procedure GoFirst(); override;',
       @TCustomGridDataView.GoFirst);
  RegisterHeader(G, 
       'procedure GoNext(); override;',
       @TCustomGridDataView.GoNext);
  RegisterHeader(G, 
       'procedure GoPrior(); override;',
       @TCustomGridDataView.GoPrior);
  RegisterHeader(G, 
       'procedure GoLast(); override;',
       @TCustomGridDataView.GoLast);
  RegisterHeader(G, 
       'function CanEdit(): Boolean; override;',
       @TCustomGridDataView.CanEdit);
  RegisterHeader(G, 
       'function CanDelete(): Boolean; override;',
       @TCustomGridDataView.CanDelete);
  RegisterHeader(G, 
       'procedure DataInsert(); override;',
       @TCustomGridDataView.DataInsert);
  RegisterHeader(G, 
       'procedure DataEdit(); override;',
       @TCustomGridDataView.DataEdit);
  RegisterHeader(G, 
       'procedure DataQuery(); override;',
       @TCustomGridDataView.DataQuery);
  RegisterHeader(G, 
       'function DataDelete(AAskConfirm: Boolean = True): Boolean; override;',
       @TCustomGridDataView.DataDelete);
  RegisterHeader(G, 
       'procedure DataExport(); override;',
       @TCustomGridDataView.DataExport);
  RegisterHeader(G, 
       'function HaveDataAfterFilter(): Boolean; override;',
       @TCustomGridDataView.HaveDataAfterFilter);
  RegisterHeader(G, 
       'procedure DoLocalFilter(const AValue: string); override;',
       @TCustomGridDataView.DoLocalFilter);
  RegisterHeader(G, 
       'procedure ExtractNameAndKeyValue(const ANameField, AKeyField: string; ADest: TStrings);',
       @TCustomGridDataView.ExtractNameAndKeyValue);
  RegisterHeader(G, 
       'procedure SaveViewLayout(AIniFile: TIniFile); override;',
       @TCustomGridDataView.SaveViewLayout);
  RegisterHeader(G,
       'procedure RestoreViewLayout(AIniFile: TIniFile); override;',
       @TCustomGridDataView.RestoreViewLayout);
  RegisterHeader(G, 
       'procedure SetFieldEditing(AFieldNames: array of string); override;',
       @TCustomGridDataView.SetFieldEditing);
  RegisterHeader(G, 
       'procedure FocusFirstVisibleColumn(); virtual;',
       @TCustomGridDataView.FocusFirstVisibleColumn);
  RegisterHeader(G, 
       'procedure ForEachSelected(AProc: TNotifyEvent);',
       @TCustomGridDataView.ForEachSelected);
  RegisterFakeHeader(G, 
       'function TCustomGridDataView_GetFormViewAction:TAction;',
       @TCustomGridDataView_GetFormViewAction);
  RegisterProperty(G, 
       'property FormViewAction:TAction read TCustomGridDataView_GetFormViewAction;');
  RegisterFakeHeader(G, 
       'function TCustomGridDataView_GetGrid:TcxGrid;',
       @TCustomGridDataView_GetGrid);
  RegisterProperty(G, 
       'property Grid:TcxGrid read TCustomGridDataView_GetGrid;');
  RegisterFakeHeader(G, 
       'function TCustomGridDataView_GetGridPopupMenu:TcxGridPopupMenu;',
       @TCustomGridDataView_GetGridPopupMenu);
  RegisterProperty(G, 
       'property GridPopupMenu:TcxGridPopupMenu read TCustomGridDataView_GetGridPopupMenu;');
  RegisterFakeHeader(G, 
       'function TCustomGridDataView_GetGridView:TcxCustomGridView;',
       @TCustomGridDataView_GetGridView);
  RegisterProperty(G, 
       'property GridView:TcxCustomGridView read TCustomGridDataView_GetGridView;');
  RegisterFakeHeader(G, 
       'function TCustomGridDataView_GetGridViewPopupMenu:TPopupMenu;',
       @TCustomGridDataView_GetGridViewPopupMenu);
  RegisterProperty(G, 
       'property GridViewPopupMenu:TPopupMenu read TCustomGridDataView_GetGridViewPopupMenu;');
  RegisterFakeHeader(G, 
       'function TCustomGridDataView_GetDataController:TcxGridDBDataController;',
       @TCustomGridDataView_GetDataController);
  RegisterProperty(G, 
       'property DataController:TcxGridDBDataController read TCustomGridDataView_GetDataController;');
  RegisterFakeHeader(G, 
       'function TCustomGridDataView_GetGridLayoutItem:TdxLayoutItem;',
       @TCustomGridDataView_GetGridLayoutItem);
  RegisterProperty(G, 
       'property GridLayoutItem:TdxLayoutItem read TCustomGridDataView_GetGridLayoutItem;');
  RegisterFakeHeader(G, 
       'function TCustomGridDataView_GetFormView:TFormDataView;',
       @TCustomGridDataView_GetFormView);
  RegisterProperty(G, 
       'property FormView:TFormDataView read TCustomGridDataView_GetFormView;');
  RegisterFakeHeader(G,
       'function TCustomGridDataView_GetFormViewClass:TFormDataViewClass;',
       @TCustomGridDataView_GetFormViewClass);
  RegisterFakeHeader(G, 
       'procedure TCustomGridDataView_PutFormViewClass(const Value: TFormDataViewClass);',
       @TCustomGridDataView_PutFormViewClass);
  RegisterProperty(G, 
       'property FormViewClass:TFormDataViewClass read TCustomGridDataView_GetFormViewClass write TCustomGridDataView_PutFormViewClass;');
  RegisterFakeHeader(G, 
       'function TCustomGridDataView_GetUseFormForEditing:Boolean;',
       @TCustomGridDataView_GetUseFormForEditing);
  RegisterFakeHeader(G, 
       'procedure TCustomGridDataView_PutUseFormForEditing(const Value: Boolean);',
       @TCustomGridDataView_PutUseFormForEditing);
  RegisterProperty(G, 
       'property UseFormForEditing:Boolean read TCustomGridDataView_GetUseFormForEditing write TCustomGridDataView_PutUseFormForEditing;');
  RegisterHeader(G,
       'constructor Create(AOwner: TComponent); virtual;',
       @TCustomGridDataView.Create);
  // End of class TCustomGridDataView
  // Begin of class TTableGridDataView
  G := RegisterClassType(H, TTableGridDataView);
  RegisterHeader(G, 
       'function CanQuery(): Boolean; override;',
       @TTableGridDataView.CanQuery);
  RegisterHeader(G, 
       'procedure DataInsert(); override;',
       @TTableGridDataView.DataInsert);
  RegisterHeader(G, 
       'procedure DataEdit(); override;',
       @TTableGridDataView.DataEdit);
  RegisterHeader(G, 
       'procedure DataPrint(); override;',
       @TTableGridDataView.DataPrint);
  RegisterHeader(G, 
       'function GetVisibleFields(): string; override;',
       @TTableGridDataView.GetVisibleFields);
  RegisterHeader(G, 
       'procedure SaveViewLayout(AIniFile: TIniFile); override;',
       @TTableGridDataView.SaveViewLayout);
  RegisterHeader(G, 
       'procedure RestoreViewLayout(AIniFile: TIniFile); override;',
       @TTableGridDataView.RestoreViewLayout);
  RegisterHeader(G, 
       'procedure EnableMultiSelect();',
       @TTableGridDataView.EnableMultiSelect);
  RegisterHeader(G, 
       'procedure DisableMultiSelect();',
       @TTableGridDataView.DisableMultiSelect);
  RegisterFakeHeader(G, 
       'function TTableGridDataView_GetTableView:TcxGridDBTableView;',
       @TTableGridDataView_GetTableView);
  RegisterProperty(G,
       'property TableView:TcxGridDBTableView read TTableGridDataView_GetTableView;');
  RegisterHeader(G,
       'constructor Create(AOwner: TComponent); virtual;',
       @TTableGridDataView.Create);
  // End of class TTableGridDataView
  // Begin of class TBandGridDataView
  G := RegisterClassType(H, TBandGridDataView);
  RegisterHeader(G, 
       'function CanQuery(): Boolean; override;',
       @TBandGridDataView.CanQuery);
  RegisterHeader(G, 
       'procedure DataInsert(); override;',
       @TBandGridDataView.DataInsert);
  RegisterHeader(G, 
       'procedure DataEdit(); override;',
       @TBandGridDataView.DataEdit);
  RegisterHeader(G, 
       'function GetVisibleFields(): string; override;',
       @TBandGridDataView.GetVisibleFields);
  RegisterHeader(G, 
       'procedure SaveViewLayout(AIniFile: TIniFile); override;',
       @TBandGridDataView.SaveViewLayout);
  RegisterHeader(G, 
       'procedure RestoreViewLayout(AIniFile: TIniFile); override;',
       @TBandGridDataView.RestoreViewLayout);
  RegisterHeader(G,
       'procedure EnableMultiSelect();',
       @TBandGridDataView.EnableMultiSelect);
  RegisterHeader(G, 
       'procedure DisableMultiSelect();',
       @TBandGridDataView.DisableMultiSelect);
  RegisterFakeHeader(G, 
       'function TBandGridDataView_GetBandView:TcxGridDBBandedTableView;',
       @TBandGridDataView_GetBandView);
  RegisterProperty(G, 
       'property BandView:TcxGridDBBandedTableView read TBandGridDataView_GetBandView;');
  RegisterHeader(G,
       'constructor Create(AOwner: TComponent); virtual;',
       @TBandGridDataView.Create);
  // End of class TBandGridDataView
  // Begin of class TCardGridDataView
  G := RegisterClassType(H, TCardGridDataView);
  RegisterHeader(G, 
       'procedure DataInsert(); override;',
       @TCardGridDataView.DataInsert);
  RegisterHeader(G, 
       'procedure DataEdit(); override;',
       @TCardGridDataView.DataEdit);
  RegisterHeader(G, 
       'function CanQuery(): Boolean; override;',
       @TCardGridDataView.CanQuery);
  RegisterHeader(G,
       'procedure SaveViewLayout(AIniFile: TIniFile); override;',
       @TCardGridDataView.SaveViewLayout);
  RegisterHeader(G, 
       'procedure RestoreViewLayout(AIniFile: TIniFile); override;',
       @TCardGridDataView.RestoreViewLayout);
  RegisterFakeHeader(G, 
       'function TCardGridDataView_GetCardView:TcxGridDBCardView;',
       @TCardGridDataView_GetCardView);
  RegisterProperty(G, 
       'property CardView:TcxGridDBCardView read TCardGridDataView_GetCardView;');
  RegisterHeader(G,
       'constructor Create(AOwner: TComponent); virtual;',
       @TCardGridDataView.Create);
  // End of class TCardGridDataView
  // Begin of class TChartGridDataView
  G := RegisterClassType(H, TChartGridDataView);
  RegisterHeader(G, 
       'function CanInsert(): Boolean; override;',
       @TChartGridDataView.CanInsert);
  RegisterHeader(G, 
       'function CanEdit(): Boolean; override;',
       @TChartGridDataView.CanEdit);
  RegisterHeader(G, 
       'function CanDelete(): Boolean; override;',
       @TChartGridDataView.CanDelete);
  RegisterFakeHeader(G,
       'function TChartGridDataView_GetChartView:TcxGridDBChartView;',
       @TChartGridDataView_GetChartView);
  RegisterProperty(G, 
       'property ChartView:TcxGridDBChartView read TChartGridDataView_GetChartView;');
  RegisterHeader(G,
       'constructor Create(AOwner: TComponent); virtual;',
       @TChartGridDataView.Create);
  // End of class TChartGridDataView
  // Begin of class TPivotDataView
  G := RegisterClassType(H, TPivotDataView);
  RegisterHeader(G, 
       'function CanInsert(): Boolean; override;',
       @TPivotDataView.CanInsert);
  RegisterHeader(G, 
       'function CanEdit(): Boolean; override;',
       @TPivotDataView.CanEdit);
  RegisterHeader(G, 
       'function CanDelete(): Boolean; override;',
       @TPivotDataView.CanDelete);
  RegisterHeader(G, 
       'function CanExport(): Boolean; override;',
       @TPivotDataView.CanExport);
  RegisterHeader(G, 
       'procedure DataExport(); override;',
       @TPivotDataView.DataExport);
  RegisterFakeHeader(G,
       'function TPivotDataView_GetPivotGrid:TcxDBPivotGrid;',
       @TPivotDataView_GetPivotGrid);
  RegisterProperty(G, 
       'property PivotGrid:TcxDBPivotGrid read TPivotDataView_GetPivotGrid;');
  RegisterFakeHeader(G, 
       'function TPivotDataView_GetPivotLayoutItem:TdxLayoutItem;',
       @TPivotDataView_GetPivotLayoutItem);
  RegisterProperty(G, 
       'property PivotLayoutItem:TdxLayoutItem read TPivotDataView_GetPivotLayoutItem;');
  RegisterHeader(G,
       'constructor Create(AOwner: TComponent); virtual;',
       @TPivotDataView.Create);
  // End of class TPivotDataView
  // Begin of class TTreeDataView
  G := RegisterClassType(H, TTreeDataView);
  RegisterHeader(G, 
       'procedure GoFirst(); override;',
       @TTreeDataView.GoFirst);
  RegisterHeader(G, 
       'procedure GoNext(); override;',
       @TTreeDataView.GoNext);
  RegisterHeader(G, 
       'procedure GoPrior(); override;',
       @TTreeDataView.GoPrior);
  RegisterHeader(G, 
       'procedure GoLast(); override;',
       @TTreeDataView.GoLast);
  RegisterHeader(G, 
       'function CanQuery(): Boolean; override;',
       @TTreeDataView.CanQuery);
  RegisterHeader(G, 
       'function CanExport(): Boolean; override;',
       @TTreeDataView.CanExport);
  RegisterHeader(G, 
       'procedure DataInsert(); override;',
       @TTreeDataView.DataInsert);
  RegisterHeader(G, 
       'procedure DataEdit(); override;',
       @TTreeDataView.DataEdit);
  RegisterHeader(G, 
       'function DataDelete(AAskConfirm: Boolean = True): Boolean; override;',
       @TTreeDataView.DataDelete);
  RegisterHeader(G, 
       'procedure DataExport(); override;',
       @TTreeDataView.DataExport);
  RegisterHeader(G, 
       'procedure DoLocalFilter(const AValue: string);',
       @TTreeDataView.DoLocalFilter);
  RegisterFakeHeader(G, 
       'function TTreeDataView_GetTreeView:TcxDBTreeList;',
       @TTreeDataView_GetTreeView);
  RegisterProperty(G,
       'property TreeView:TcxDBTreeList read TTreeDataView_GetTreeView;');
  RegisterFakeHeader(G, 
       'function TTreeDataView_GetTreeLayoutItem:TdxLayoutItem;',
       @TTreeDataView_GetTreeLayoutItem);
  RegisterProperty(G, 
       'property TreeLayoutItem:TdxLayoutItem read TTreeDataView_GetTreeLayoutItem;');
  RegisterHeader(G,
       'constructor Create(AOwner: TComponent); virtual;',
       @TTreeDataView.Create);
  // End of class TTreeDataView
  // Begin of class TDataViewOperation
  G := RegisterClassType(H, TDataViewOperation);
  RegisterHeader(G, 
       'destructor Destroy(); override;',
       @TDataViewOperation.Destroy);
  RegisterFakeHeader(G, 
       'function TDataViewOperation_GetViewData:TCustomData;',
       @TDataViewOperation_GetViewData);
  RegisterFakeHeader(G, 
       'procedure TDataViewOperation_PutViewData(const Value: TCustomData);',
       @TDataViewOperation_PutViewData);
  RegisterProperty(G, 
       'property ViewData:TCustomData read TDataViewOperation_GetViewData write TDataViewOperation_PutViewData;');
  RegisterFakeHeader(G, 
       'function TDataViewOperation_GetOwnsData:Boolean;',
       @TDataViewOperation_GetOwnsData);
  RegisterFakeHeader(G, 
       'procedure TDataViewOperation_PutOwnsData(const Value: Boolean);',
       @TDataViewOperation_PutOwnsData);
  RegisterProperty(G, 
       'property OwnsData:Boolean read TDataViewOperation_GetOwnsData write TDataViewOperation_PutOwnsData;');
  RegisterHeader(G,
       'constructor Create(AOwner: TComponent); virtual;',
       @TDataViewOperation.Create);
  // End of class TDataViewOperation
  // Begin of class TDictManageView
  G := RegisterClassType(H, TDictManageView);
  RegisterHeader(G, 
       'destructor Destroy(); override;',
       @TDictManageView.Destroy);
  RegisterHeader(G, 
       'procedure LocateDict(const ALogicalName: string);',
       @TDictManageView.LocateDict);
  RegisterHeader(G,
       'constructor Create(AOwner: TComponent); virtual;',
       @TDictManageView.Create);
  // End of class TDictManageView
  // Begin of interface IPopupEditorForm
  RegisterInterfaceType(H, 'IPopupEditorForm',IPopupEditorForm,'IUnknown',IUnknown);
  RegisterHeader(G, 
       'procedure DoPopupInit(Sender: TPopupEditorWrapInfo);',
       nil, -1);
  RegisterHeader(G, 
       'procedure DoPopup(Sender: TPopupEditorWrapInfo);',
       nil, -2);
  RegisterHeader(G, 
       'procedure DoPopupClose(Sender: TPopupEditorWrapInfo);',
       nil, -3);
  RegisterHeader(G, 
       'function DoModalDialog(Sender: TPopupEditorWrapInfo;      const AFilterText: string): Boolean;',
       nil, -4);
  // End of interface IPopupEditorForm
  // Begin of class TDictIMEDialog
  G := RegisterClassType(H, TDictIMEDialog);
  RegisterHeader(G, 
       'constructor Create(AOwner: TComponent); override;',
       @TDictIMEDialog.Create);
  RegisterHeader(G, 
       'destructor Destroy(); override;',
       @TDictIMEDialog.Destroy);
  RegisterHeader(G, 
       'procedure RegisterDataView(AViewName: string; AViewClass: TCustomDataViewClass);',
       @TDictIMEDialog.RegisterDataView);
  RegisterHeader(G, 
       'function Start(ASender: TControl; ADataName, AViewName, AFilterText: string;      ANotifier: TNotifyEvent): Boolean;',
       @TDictIMEDialog.Start);
  RegisterHeader(G, 
       'function StartIME(ASender: TControl; ACustomData: TCustomData;      AViewName, AFilterText: string;      ANotifier: TNotifyEvent; AShowOnly: Boolean): Boolean;',
       @TDictIMEDialog.StartIME);
  RegisterFakeHeader(G, 
       'function TDictIMEDialog_GetDictData:TCustomData;',
       @TDictIMEDialog_GetDictData);
  RegisterProperty(G, 
       'property DictData:TCustomData read TDictIMEDialog_GetDictData;');
  // End of class TDictIMEDialog
  // Begin of class TAgeIMEDialog
  G := RegisterClassType(H, TAgeIMEDialog);
  RegisterHeader(G, 
       'function Start(ASender: TControl; ANotifier: TNotifyEvent): Boolean;',
       @TAgeIMEDialog.Start);
  RegisterHeader(G,
       'constructor Create(AOwner: TComponent); virtual;',
       @TAgeIMEDialog.Create);
  // End of class TAgeIMEDialog
  // Begin of class TPopupEditorWrapInfo
  G := RegisterClassType(H, TPopupEditorWrapInfo);
  RegisterHeader(G, 
       'constructor Create(ATarget: TComponent); override;',
       @TPopupEditorWrapInfo.Create);
  RegisterHeader(G, 
       'destructor Destroy(); override;',
       @TPopupEditorWrapInfo.Destroy);
  RegisterHeader(G, 
       'procedure Wrap(); override;',
       @TPopupEditorWrapInfo.Wrap);
  RegisterHeader(G, 
       'procedure DoKeyPress(Sender: TObject; var Key: Char);',
       @TPopupEditorWrapInfo.DoKeyPress);
  RegisterHeader(G, 
       'procedure DoPopup(Sender: TObject);',
       @TPopupEditorWrapInfo.DoPopup);
  RegisterHeader(G, 
       'procedure DoPopupInit(Sender: TObject);',
       @TPopupEditorWrapInfo.DoPopupInit);
  RegisterHeader(G, 
       'procedure DoPopupOK(Sender: TObject);',
       @TPopupEditorWrapInfo.DoPopupOK);
  RegisterHeader(G, 
       'procedure ClosePopup();',
       @TPopupEditorWrapInfo.ClosePopup);
  RegisterHeader(G, 
       'procedure DoPopupClose(Sender: TcxControl; AReason: TcxEditCloseUpReason);',
       @TPopupEditorWrapInfo.DoPopupClose);
  RegisterFakeHeader(G, 
       'function TPopupEditorWrapInfo_GetButtonAction:TAction;',
       @TPopupEditorWrapInfo_GetButtonAction);
  RegisterProperty(G, 
       'property ButtonAction:TAction read TPopupEditorWrapInfo_GetButtonAction;');
  RegisterFakeHeader(G, 
       'function TPopupEditorWrapInfo_GetClearAction:TAction;',
       @TPopupEditorWrapInfo_GetClearAction);
  RegisterProperty(G, 
       'property ClearAction:TAction read TPopupEditorWrapInfo_GetClearAction;');
  RegisterFakeHeader(G, 
       'function TPopupEditorWrapInfo_GetDataSource:TDADataSource;',
       @TPopupEditorWrapInfo_GetDataSource);
  RegisterFakeHeader(G, 
       'procedure TPopupEditorWrapInfo_PutDataSource(const Value: TDADataSource);',
       @TPopupEditorWrapInfo_PutDataSource);
  RegisterProperty(G, 
       'property DataSource:TDADataSource read TPopupEditorWrapInfo_GetDataSource write TPopupEditorWrapInfo_PutDataSource;');
  RegisterFakeHeader(G, 
       'function TPopupEditorWrapInfo_GetDataTable:TDADataTable;',
       @TPopupEditorWrapInfo_GetDataTable);
  RegisterFakeHeader(G, 
       'procedure TPopupEditorWrapInfo_PutDataTable(const Value: TDADataTable);',
       @TPopupEditorWrapInfo_PutDataTable);
  RegisterProperty(G, 
       'property DataTable:TDADataTable read TPopupEditorWrapInfo_GetDataTable write TPopupEditorWrapInfo_PutDataTable;');
  RegisterFakeHeader(G, 
       'function TPopupEditorWrapInfo_GetProperties:TcxCustomEditProperties;',
       @TPopupEditorWrapInfo_GetProperties);
  RegisterFakeHeader(G, 
       'procedure TPopupEditorWrapInfo_PutProperties(const Value: TcxCustomEditProperties);',
       @TPopupEditorWrapInfo_PutProperties);
  RegisterProperty(G,
       'property Properties:TcxCustomEditProperties read TPopupEditorWrapInfo_GetProperties write TPopupEditorWrapInfo_PutProperties;');
  RegisterFakeHeader(G, 
       'function TPopupEditorWrapInfo_GetField:TDAField;',
       @TPopupEditorWrapInfo_GetField);
  RegisterFakeHeader(G, 
       'procedure TPopupEditorWrapInfo_PutField(const Value: TDAField);',
       @TPopupEditorWrapInfo_PutField);
  RegisterProperty(G, 
       'property Field:TDAField read TPopupEditorWrapInfo_GetField write TPopupEditorWrapInfo_PutField;');
  RegisterFakeHeader(G, 
       'function TPopupEditorWrapInfo_GetSetValueField:TStrings;',
       @TPopupEditorWrapInfo_GetSetValueField);
  RegisterProperty(G, 
       'property SetValueField:TStrings read TPopupEditorWrapInfo_GetSetValueField;');
  RegisterFakeHeader(G, 
       'function TPopupEditorWrapInfo_GetGetValueField:TStrings;',
       @TPopupEditorWrapInfo_GetGetValueField);
  RegisterProperty(G, 
       'property GetValueField:TStrings read TPopupEditorWrapInfo_GetGetValueField;');
  RegisterFakeHeader(G, 
       'function TPopupEditorWrapInfo_GetDictName:string;',
       @TPopupEditorWrapInfo_GetDictName);
  RegisterFakeHeader(G, 
       'procedure TPopupEditorWrapInfo_PutDictName(const Value: string);',
       @TPopupEditorWrapInfo_PutDictName);
  RegisterProperty(G,
       'property DictName:string read TPopupEditorWrapInfo_GetDictName write TPopupEditorWrapInfo_PutDictName;');
  RegisterFakeHeader(G, 
       'function TPopupEditorWrapInfo_GetMultiEditorAttributes:TStrings;',
       @TPopupEditorWrapInfo_GetMultiEditorAttributes);
  RegisterProperty(G, 
       'property MultiEditorAttributes:TStrings read TPopupEditorWrapInfo_GetMultiEditorAttributes;');
  // End of class TPopupEditorWrapInfo
  // Begin of class TPopupEditorWrapper
  G := RegisterClassType(H, TPopupEditorWrapper);
  RegisterHeader(G, 
       'constructor Create(AOwner: TComponent); override;',
       @TPopupEditorWrapper.Create);
  RegisterHeader(G, 
       'destructor Destroy(); override;',
       @TPopupEditorWrapper.Destroy);
  RegisterHeader(G, 
       'procedure WrapDataControl(AControl: TComponent;      AProperties: TcxCustomEditProperties;      AField: TDAField; ASource: TDADataSource;      AMultiEditorAttributes: TStrings);',
       @TPopupEditorWrapper.WrapDataControl);
  RegisterHeader(G, 
       'procedure WrapProperites(AColumn: TComponent;      AProperties: TcxCustomEditProperties;      AField: TDAField; ASource: TDADataSource;      AMultiEditorAttributes: TStrings);',
       @TPopupEditorWrapper.WrapProperites);
  RegisterHeader(G, 
       'procedure RegisterPopupEditor(const AEditorName: string; AEditor: TFormClass);',
       @TPopupEditorWrapper.RegisterPopupEditor);
  RegisterHeader(G, 
       'function GetPopupEditor(const AEditorName: string): TForm;',
       @TPopupEditorWrapper.GetPopupEditor);
  // End of class TPopupEditorWrapper
  // Begin of class TReportConfigView
  G := RegisterClassType(H, TReportConfigView);
  RegisterHeader(G, 
       'function GetParamNameArray(): TVariantArray;',
       @TReportConfigView.GetParamNameArray);
  RegisterHeader(G, 
       'function GetParamValueArray(): TVariantArray;',
       @TReportConfigView.GetParamValueArray);
  RegisterFakeHeader(G, 
       'function TReportConfigView_GetReportName:string;',
       @TReportConfigView_GetReportName);
  RegisterProperty(G, 
       'property ReportName:string read TReportConfigView_GetReportName;');
  RegisterFakeHeader(G, 
       'function TReportConfigView_GetReportView:TTableGridDataView;',
       @TReportConfigView_GetReportView);
  RegisterProperty(G, 
       'property ReportView:TTableGridDataView read TReportConfigView_GetReportView;');
  RegisterFakeHeader(G, 
       'function TReportConfigView_GetParamView:TTableGridDataView;',
       @TReportConfigView_GetParamView);
  RegisterProperty(G, 
       'property ParamView:TTableGridDataView read TReportConfigView_GetParamView;');
  RegisterHeader(G,
       'constructor Create(AOwner: TComponent); virtual;',
       @TReportConfigView.Create);
  // End of class TReportConfigView
  RegisterHeader(H, 'function DictIME: TDictIMEDialog;', @DictIME);
  RegisterHeader(H, 'function GetDataViewClass(ADataViewType: TDataViewType): TCustomDataViewClass;', @GetDataViewClass);
  RegisterHeader(H, 'function EditData(ACustomData: TCustomData): Boolean;', @EditData);
  RegisterVariable(H, 'PopupEditorWrapper: TPopupEditorWrapper;',@PopupEditorWrapper);
  RegisterVariable(H, 'CustomDataPrintProc: TCustomDataPrintProc;',@CustomDataPrintProc);
end;
initialization
  RegisterIMPORT_App_DAView;
end.

