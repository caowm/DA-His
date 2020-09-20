unit IMPORT_App_Class;
interface
uses
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  ActnList,
  StdCtrls,
  Forms,
  DB,
  Dialogs,
  Contnrs,
  TypInfo,
  ExtCtrls,
  Menus,
  frxPrinter,
  IdHTTP,
  jpeg,
  GR32,
  GR32_Image,
  GR32_Layers,
  App_Common,
  App_Function,
  App_DevExpress,
  uROClasses,
  uDADataTable,
  uDAInterfaces,
  cxGraphics,
  cxStyles,
  cxLookAndFeels,
  cxControls,
  cxCalendar,
  cxLookAndFeelPainters,
  cxDBEditRepository,
  cxExtEditRepositoryItems,
  cxEditRepositoryItems,
  cxEdit,
  cxImage,
  cxDBLookupComboBox,
  cxCalc,
  cxCheckListBox,
  cxSpinEdit,
  cxGridExportLink,
  cxGrid,
  cxGridCustomView,
  cxGridCustomTableView,
  cxGridTableView,
  cxGridDBTableView,
  cxGridBandedTableView,
  cxGridDBBandedTableView,
  cxGridDBCardView,
  cxClasses,
  cxGridCardView,
  cxCustomPivotGrid,
  cxDBPivotGrid,
  cxExportPivotGridLink,
  cxTL,
  cxDBTL,
  cxTLExportLink,
  cxGridCustomPopupMenu,
  cxGridPopupMenu,
  cxShellEditRepositoryItems,
  dxLayoutLookAndFeels,
  cxCustomData,
  cxDataStorage,
  cxDBData,
  cxDropDownEdit,
  cxGridChartView,
  cxGridDBChartView,
  cxCheckBox,
  cxCheckComboBox,
  cxCheckGroup,
  cxRadioGroup,
  cxCurrencyEdit,
  cxMaskEdit,
  cxTextEdit,
  cxLabel,
  cxButtons,
  cxListBox,
  cxPCdxBarPopupMenu,
  cxProgressBar,
  dxLayoutContainer,
  dxLayoutControl,
  dxGDIPlusAPI,
  dxGDIPlusClasses,
  dxCore,
  dxBar,
  App_Class,
  PaxCompiler,
  PaxRegister;
procedure RegisterIMPORT_App_Class;
implementation
function TProgressForm_GetCanceled(Self:TProgressForm):Boolean;
begin
  result := Self.Canceled;
end;
function TImageBrowseForm_GetImgView(Self:TImageBrowseForm):TImgView32;
begin
  result := Self.ImgView;
end;
function TBaseLayoutView_GetViewLayout(Self:TBaseLayoutView):TdxLayoutControl;
begin
  result := Self.ViewLayout;
end;
function TBaseLayoutView_GetIsEmbedded(Self:TBaseLayoutView):Boolean;
begin
  result := Self.IsEmbedded;
end;
procedure TBaseLayoutView_PutIsEmbedded(Self:TBaseLayoutView;const Value: Boolean);
begin
  Self.IsEmbedded := Value;
end;
function TBaseDialog_GetActions(Self:TBaseDialog):TActionList;
begin
  result := Self.Actions;
end;
procedure TBaseDialog_PutLayoutAutoSize(Self:TBaseDialog;const Value: Boolean);
begin
  Self.LayoutAutoSize := Value;
end;
function TBaseDialog_GetImage(Self:TBaseDialog):TImage;
begin
  result := Self.Image;
end;
procedure TBaseDialog_PutImageName(Self:TBaseDialog;const Value: string);
begin
  Self.ImageName := Value;
end;
function TBaseDialog_GetOKButton(Self:TBaseDialog):TcxButton;
begin
  result := Self.OKButton;
end;
function TBaseDialog_GetCancelButton(Self:TBaseDialog):TcxButton;
begin
  result := Self.CancelButton;
end;
function TBaseDialog_GetDialogGroup(Self:TBaseDialog):TdxLayoutGroup;
begin
  result := Self.DialogGroup;
end;
function TBaseDialog_GetBottomGroup(Self:TBaseDialog):TdxLayoutGroup;
begin
  result := Self.BottomGroup;
end;
function TBaseDialog_GetButtonGroup(Self:TBaseDialog):TdxLayoutGroup;
begin
  result := Self.ButtonGroup;
end;
function TBaseDialog_GetImageItem(Self:TBaseDialog):TdxLayoutItem;
begin
  result := Self.ImageItem;
end;
function TBaseDialog_GetOKItem(Self:TBaseDialog):TdxLayoutItem;
begin
  result := Self.OKItem;
end;
function TBaseDialog_GetCancelItem(Self:TBaseDialog):TdxLayoutItem;
begin
  result := Self.CancelItem;
end;
function TSelectDialog_GetSelections(Self:TSelectDialog):TStrings;
begin
  result := Self.Selections;
end;
function TSelectDialog_GetSelectIndex(Self:TSelectDialog):Integer;
begin
  result := Self.SelectIndex;
end;
procedure TSelectDialog_PutSelectIndex(Self:TSelectDialog;const Value: Integer);
begin
  Self.SelectIndex := Value;
end;
function TSelectDialog_GetListBox(Self:TSelectDialog):TcxListBox;
begin
  result := Self.ListBox;
end;
function TTextDialog_GetEditItem(Self:TTextDialog):TdxLayoutItem;
begin
  result := Self.EditItem;
end;
function TTextDialog_GetMaskEdit(Self:TTextDialog):TcxMaskEdit;
begin
  result := Self.MaskEdit;
end;
function TTextDialog_GetText(Self:TTextDialog):string;
begin
  result := Self.Text;
end;
procedure TTextDialog_PutText(Self:TTextDialog;const Value: string);
begin
  Self.Text := Value;
end;
function TDateEditDialog_GetDateEdit(Self:TDateEditDialog):TcxDateEdit;
begin
  result := Self.DateEdit;
end;
function TDateEditDialog_GetDateItem(Self:TDateEditDialog):TdxLayoutItem;
begin
  result := Self.DateItem;
end;
function TCheckBoxDialog_GetCheckBox(Self:TCheckBoxDialog):TcxCheckBox;
begin
  result := Self.CheckBox;
end;
function TCheckBoxDialog_GetChecked(Self:TCheckBoxDialog):Boolean;
begin
  result := Self.Checked;
end;
procedure TCheckBoxDialog_PutChecked(Self:TCheckBoxDialog;const Value: Boolean);
begin
  Self.Checked := Value;
end;
function TCheckListDialog_GetCheckStrings(Self:TCheckListDialog):TStrings;
begin
  result := Self.CheckStrings;
end;
function TCheckListDialog_GetCheckListBox(Self:TCheckListDialog):TcxCheckListBox;
begin
  result := Self.CheckListBox;
end;
procedure TCheckListDialog_PutItemHeight(Self:TCheckListDialog;const Value: Integer);
begin
  Self.ItemHeight := Value;
end;
function TBusinessPrinters_GetPrinters(Self:TBusinessPrinters):TStringList;
begin
  result := Self.Printers;
end;
function TReporterSelectDialog_GetReporterName(Self:TReporterSelectDialog):string;
begin
  result := Self.ReporterName;
end;
function TReporterSelectDialog_GetPrintPreview(Self:TReporterSelectDialog):Boolean;
begin
  result := Self.PrintPreview;
end;
procedure TReporterSelectDialog_PutPrintPreview(Self:TReporterSelectDialog;const Value: Boolean);
begin
  Self.PrintPreview := Value;
end;
function TReporterSelectDialog_GetPrinterName(Self:TReporterSelectDialog):string;
begin
  result := Self.PrinterName;
end;
procedure TReporterSelectDialog_PutPrinterName(Self:TReporterSelectDialog;const Value: string);
begin
  Self.PrinterName := Value;
end;
function TWrapInfo_GetTarget(Self:TWrapInfo):TComponent;
begin
  result := Self.Target;
end;
function TWrapInfo_GetWrapper(Self:TWrapInfo):TControlWrapper;
begin
  result := Self.Wrapper;
end;
function TControlWrapper_GetWrapInfoClass(Self:TControlWrapper):TWrapInfoClass;
begin
  result := Self.WrapInfoClass;
end;
function TTableColorWrapInfo_GetDataTable(Self:TTableColorWrapInfo):TDADataTable;
begin
  result := Self.DataTable;
end;
function TTableColorWrapInfo_GetColorField(Self:TTableColorWrapInfo):string;
begin
  result := Self.ColorField;
end;
function TTableColorWrapInfo_GetColorNodes(Self:TTableColorWrapInfo):TColorNodes;
begin
  result := Self.ColorNodes;
end;
procedure TTableColorWrapInfo_PutColorNodes(Self:TTableColorWrapInfo;const Value: TColorNodes);
begin
  Self.ColorNodes := Value;
end;
function TTableColorWrapInfo_GetColors(Self:TTableColorWrapInfo):TColorArray;
begin
  result := Self.Colors;
end;
procedure TTableColorWrapInfo_PutColors(Self:TTableColorWrapInfo;const Value: TColorArray);
begin
  Self.Colors := Value;
end;
procedure RegisterIMPORT_App_Class;
var G, H: Integer;
begin
  H := RegisterNamespace(0, 'App_Class');
  RegisterConstant(H, 'sIconArrowLeft', 'left.ico');
  RegisterConstant(H, 'sIconArrowRight', 'right.ico');
  RegisterConstant(H, 'sDefaultPrinter', 'Ä¬ÈÏ´òÓ¡»ú');
  RegisterConstant(H, 'sInterfaceSection', 'InterfaceSection');
  RegisterConstant(H, 'sPrinterSection', 'BusinessPrinters');
  RegisterConstant(H, 'sReporterPrinterSection', 'ReporterPrinter');
  // Begin of class TProgressForm
  G := RegisterClassType(H, TProgressForm);
  RegisterHeader(G, 
       'constructor Create(AOwner: TComponent); override;',
       @TProgressForm.Create);
  RegisterHeader(G, 
       'procedure BeginProgress();',
       @TProgressForm.BeginProgress);
  RegisterHeader(G, 
       'procedure EndProgress();',
       @TProgressForm.EndProgress);
  RegisterHeader(G, 
       'procedure SetHintLabel(const ACaption: string);',
       @TProgressForm.SetHintLabel);
  RegisterHeader(G, 
       'procedure SetHintFmt(const AFormat: string; AParam: array of const);',
       @TProgressForm.SetHintFmt);
  RegisterHeader(G, 
       'procedure SetProgress(AMax, APosition: Integer);',
       @TProgressForm.SetProgress);
  RegisterHeader(G, 
       'procedure SetCancelButtonVisible(AVisible: Boolean);',
       @TProgressForm.SetCancelButtonVisible);
  RegisterFakeHeader(G, 
       'function TProgressForm_GetCanceled:Boolean;',
       @TProgressForm_GetCanceled);
  RegisterProperty(G, 
       'property Canceled:Boolean read TProgressForm_GetCanceled;');
  // End of class TProgressForm
  RegisterRTTIType(H, TypeInfo(TBrowseImageAction));
  // Begin of class TImageBrowseForm
  G := RegisterClassType(H, TImageBrowseForm);
  RegisterHeader(G, 
       'procedure BrowseImage(AOnBrowseEvent: TBrowseImageEvent);',
       @TImageBrowseForm.BrowseImage);
  RegisterHeader(G, 
       'constructor Create(AOwner: TComponent); override;',
       @TImageBrowseForm.Create);
  RegisterHeader(G, 
       'destructor Destroy(); override;',
       @TImageBrowseForm.Destroy);
  RegisterHeader(G, 
       'procedure BrowseNext();',
       @TImageBrowseForm.BrowseNext);
  RegisterHeader(G, 
       'procedure BrowsePrior();',
       @TImageBrowseForm.BrowsePrior);
  RegisterHeader(G, 
       'procedure RefreshImage();',
       @TImageBrowseForm.RefreshImage);
  RegisterHeader(G, 
       'procedure ScaleImage(ADelta: Integer);',
       @TImageBrowseForm.ScaleImage);
  RegisterHeader(G, 
       'procedure Clear();',
       @TImageBrowseForm.Clear);
  RegisterFakeHeader(G, 
       'function TImageBrowseForm_GetImgView:TImgView32;',
       @TImageBrowseForm_GetImgView);
  RegisterProperty(G, 
       'property ImgView:TImgView32 read TImageBrowseForm_GetImgView;');
  // End of class TImageBrowseForm
  // Begin of class TFileCursorList
  G := RegisterClassType(H, TFileCursorList);
  RegisterHeader(G, 
       'constructor Create(const ACursorPath: string);',
       @TFileCursorList.Create);
  RegisterHeader(G, 
       'destructor Destroy(); override;',
       @TFileCursorList.Destroy);
  RegisterHeader(G, 
       'function IndexOf(const ACursorName: string): Integer;',
       @TFileCursorList.IndexOf);
  // End of class TFileCursorList
  // Begin of class TBaseLayoutView
  G := RegisterClassType(H, TBaseLayoutView);
  RegisterHeader(G, 
       'procedure DoInitView(); override;',
       @TBaseLayoutView.DoInitView);
  RegisterHeader(G, 
       'procedure FocusFirstControl();',
       @TBaseLayoutView.FocusFirstControl);
  RegisterFakeHeader(G, 
       'function TBaseLayoutView_GetViewLayout:TdxLayoutControl;',
       @TBaseLayoutView_GetViewLayout);
  RegisterProperty(G, 
       'property ViewLayout:TdxLayoutControl read TBaseLayoutView_GetViewLayout;');
  RegisterFakeHeader(G, 
       'function TBaseLayoutView_GetIsEmbedded:Boolean;',
       @TBaseLayoutView_GetIsEmbedded);
  RegisterFakeHeader(G, 
       'procedure TBaseLayoutView_PutIsEmbedded(const Value: Boolean);',
       @TBaseLayoutView_PutIsEmbedded);
  RegisterProperty(G, 
       'property IsEmbedded:Boolean read TBaseLayoutView_GetIsEmbedded write TBaseLayoutView_PutIsEmbedded;');
  RegisterHeader(G,
       'constructor Create(AOwner: TComponent); virtual;',
       @TBaseLayoutView.Create);
  // End of class TBaseLayoutView
  // Begin of class TBaseDialog
  G := RegisterClassType(H, TBaseDialog);
  RegisterHeader(G, 
       'function Execute(): Boolean; virtual;',
       @TBaseDialog.Execute);
  RegisterHeader(G, 
       'procedure DoDialogOK(Sender: TObject); virtual;',
       @TBaseDialog.DoDialogOK);
  RegisterHeader(G, 
       'procedure DoDialogCancel(Sender: TObject); virtual;',
       @TBaseDialog.DoDialogCancel);
  RegisterHeader(G, 
       'procedure DoDialogShow(Sender: TObject); virtual;',
       @TBaseDialog.DoDialogShow);
  RegisterHeader(G, 
       'procedure BuildDialog; virtual;',
       @TBaseDialog.BuildDialog);
  RegisterFakeHeader(G, 
       'function TBaseDialog_GetActions:TActionList;',
       @TBaseDialog_GetActions);
  RegisterProperty(G, 
       'property Actions:TActionList read TBaseDialog_GetActions;');
  RegisterFakeHeader(G, 
       'procedure TBaseDialog_PutLayoutAutoSize(const Value: Boolean);',
       @TBaseDialog_PutLayoutAutoSize);
  RegisterProperty(G, 
       'property LayoutAutoSize:Boolean write TBaseDialog_PutLayoutAutoSize;');
  RegisterFakeHeader(G, 
       'function TBaseDialog_GetImage:TImage;',
       @TBaseDialog_GetImage);
  RegisterProperty(G, 
       'property Image:TImage read TBaseDialog_GetImage;');
  RegisterFakeHeader(G, 
       'procedure TBaseDialog_PutImageName(const Value: string);',
       @TBaseDialog_PutImageName);
  RegisterProperty(G, 
       'property ImageName:string write TBaseDialog_PutImageName;');
  RegisterFakeHeader(G, 
       'function TBaseDialog_GetOKButton:TcxButton;',
       @TBaseDialog_GetOKButton);
  RegisterProperty(G, 
       'property OKButton:TcxButton read TBaseDialog_GetOKButton;');
  RegisterFakeHeader(G, 
       'function TBaseDialog_GetCancelButton:TcxButton;',
       @TBaseDialog_GetCancelButton);
  RegisterProperty(G, 
       'property CancelButton:TcxButton read TBaseDialog_GetCancelButton;');
  RegisterFakeHeader(G, 
       'function TBaseDialog_GetDialogGroup:TdxLayoutGroup;',
       @TBaseDialog_GetDialogGroup);
  RegisterProperty(G, 
       'property DialogGroup:TdxLayoutGroup read TBaseDialog_GetDialogGroup;');
  RegisterFakeHeader(G, 
       'function TBaseDialog_GetBottomGroup:TdxLayoutGroup;',
       @TBaseDialog_GetBottomGroup);
  RegisterProperty(G, 
       'property BottomGroup:TdxLayoutGroup read TBaseDialog_GetBottomGroup;');
  RegisterFakeHeader(G, 
       'function TBaseDialog_GetButtonGroup:TdxLayoutGroup;',
       @TBaseDialog_GetButtonGroup);
  RegisterProperty(G, 
       'property ButtonGroup:TdxLayoutGroup read TBaseDialog_GetButtonGroup;');
  RegisterFakeHeader(G, 
       'function TBaseDialog_GetImageItem:TdxLayoutItem;',
       @TBaseDialog_GetImageItem);
  RegisterProperty(G, 
       'property ImageItem:TdxLayoutItem read TBaseDialog_GetImageItem;');
  RegisterFakeHeader(G, 
       'function TBaseDialog_GetOKItem:TdxLayoutItem;',
       @TBaseDialog_GetOKItem);
  RegisterProperty(G, 
       'property OKItem:TdxLayoutItem read TBaseDialog_GetOKItem;');
  RegisterFakeHeader(G, 
       'function TBaseDialog_GetCancelItem:TdxLayoutItem;',
       @TBaseDialog_GetCancelItem);
  RegisterProperty(G, 
       'property CancelItem:TdxLayoutItem read TBaseDialog_GetCancelItem;');
  RegisterHeader(G,
       'constructor Create(AOwner: TComponent); virtual;',
       @TBaseDialog.Create);
  // End of class TBaseDialog
  // Begin of class TSelectDialog
  G := RegisterClassType(H, TSelectDialog);
  RegisterFakeHeader(G, 
       'function TSelectDialog_GetSelections:TStrings;',
       @TSelectDialog_GetSelections);
  RegisterProperty(G, 
       'property Selections:TStrings read TSelectDialog_GetSelections;');
  RegisterFakeHeader(G, 
       'function TSelectDialog_GetSelectIndex:Integer;',
       @TSelectDialog_GetSelectIndex);
  RegisterFakeHeader(G, 
       'procedure TSelectDialog_PutSelectIndex(const Value: Integer);',
       @TSelectDialog_PutSelectIndex);
  RegisterProperty(G, 
       'property SelectIndex:Integer read TSelectDialog_GetSelectIndex write TSelectDialog_PutSelectIndex;');
  RegisterFakeHeader(G, 
       'function TSelectDialog_GetListBox:TcxListBox;',
       @TSelectDialog_GetListBox);
  RegisterProperty(G, 
       'property ListBox:TcxListBox read TSelectDialog_GetListBox;');
  RegisterHeader(G,
       'constructor Create(AOwner: TComponent); virtual;',
       @TSelectDialog.Create);
  // End of class TSelectDialog
  // Begin of class TTextDialog
  G := RegisterClassType(H, TTextDialog);
  RegisterFakeHeader(G, 
       'function TTextDialog_GetEditItem:TdxLayoutItem;',
       @TTextDialog_GetEditItem);
  RegisterProperty(G, 
       'property EditItem:TdxLayoutItem read TTextDialog_GetEditItem;');
  RegisterFakeHeader(G, 
       'function TTextDialog_GetMaskEdit:TcxMaskEdit;',
       @TTextDialog_GetMaskEdit);
  RegisterProperty(G, 
       'property MaskEdit:TcxMaskEdit read TTextDialog_GetMaskEdit;');
  RegisterFakeHeader(G, 
       'function TTextDialog_GetText:string;',
       @TTextDialog_GetText);
  RegisterFakeHeader(G, 
       'procedure TTextDialog_PutText(const Value: string);',
       @TTextDialog_PutText);
  RegisterProperty(G, 
       'property Text:string read TTextDialog_GetText write TTextDialog_PutText;');
  RegisterHeader(G,
       'constructor Create(AOwner: TComponent); virtual;',
       @TTextDialog.Create);
  // End of class TTextDialog
  // Begin of class TDateEditDialog
  G := RegisterClassType(H, TDateEditDialog);
  RegisterFakeHeader(G, 
       'function TDateEditDialog_GetDateEdit:TcxDateEdit;',
       @TDateEditDialog_GetDateEdit);
  RegisterProperty(G, 
       'property DateEdit:TcxDateEdit read TDateEditDialog_GetDateEdit;');
  RegisterFakeHeader(G, 
       'function TDateEditDialog_GetDateItem:TdxLayoutItem;',
       @TDateEditDialog_GetDateItem);
  RegisterProperty(G, 
       'property DateItem:TdxLayoutItem read TDateEditDialog_GetDateItem;');
  RegisterHeader(G,
       'constructor Create(AOwner: TComponent); virtual;',
       @TDateEditDialog.Create);
  // End of class TDateEditDialog
  // Begin of class TCheckBoxDialog
  G := RegisterClassType(H, TCheckBoxDialog);
  RegisterFakeHeader(G, 
       'function TCheckBoxDialog_GetCheckBox:TcxCheckBox;',
       @TCheckBoxDialog_GetCheckBox);
  RegisterProperty(G, 
       'property CheckBox:TcxCheckBox read TCheckBoxDialog_GetCheckBox;');
  RegisterFakeHeader(G, 
       'function TCheckBoxDialog_GetChecked:Boolean;',
       @TCheckBoxDialog_GetChecked);
  RegisterFakeHeader(G, 
       'procedure TCheckBoxDialog_PutChecked(const Value: Boolean);',
       @TCheckBoxDialog_PutChecked);
  RegisterProperty(G, 
       'property Checked:Boolean read TCheckBoxDialog_GetChecked write TCheckBoxDialog_PutChecked;');
  RegisterHeader(G,
       'constructor Create(AOwner: TComponent); virtual;',
       @TCheckBoxDialog.Create);
  // End of class TCheckBoxDialog
  // Begin of class TCheckListDialog
  G := RegisterClassType(H, TCheckListDialog);
  RegisterHeader(G, 
       'destructor Destroy(); override;',
       @TCheckListDialog.Destroy);
  RegisterHeader(G, 
       'function Execute(): Boolean; override;',
       @TCheckListDialog.Execute);
  RegisterHeader(G, 
       'function GetCheckedValue(ADelimiter: Char = '',''): string;',
       @TCheckListDialog.GetCheckedValue);
  RegisterFakeHeader(G, 
       'function TCheckListDialog_GetCheckStrings:TStrings;',
       @TCheckListDialog_GetCheckStrings);
  RegisterProperty(G, 
       'property CheckStrings:TStrings read TCheckListDialog_GetCheckStrings;');
  RegisterFakeHeader(G, 
       'function TCheckListDialog_GetCheckListBox:TcxCheckListBox;',
       @TCheckListDialog_GetCheckListBox);
  RegisterProperty(G, 
       'property CheckListBox:TcxCheckListBox read TCheckListDialog_GetCheckListBox;');
  RegisterFakeHeader(G, 
       'procedure TCheckListDialog_PutItemHeight(const Value: Integer);',
       @TCheckListDialog_PutItemHeight);
  RegisterProperty(G, 
       'property ItemHeight:Integer write TCheckListDialog_PutItemHeight;');
  RegisterHeader(G,
       'constructor Create(AOwner: TComponent); virtual;',
       @TCheckListDialog.Create);
  // End of class TCheckListDialog
  // Begin of class TBusinessPrinters
  G := RegisterClassType(H, TBusinessPrinters);
  RegisterHeader(G, 
       'constructor Create();',
       @TBusinessPrinters.Create);
  RegisterHeader(G, 
       'destructor Destroy(); override;',
       @TBusinessPrinters.Destroy);
  RegisterHeader(G, 
       'procedure RegisterBusinessPrinter(BusinessName: string);',
       @TBusinessPrinters.RegisterBusinessPrinter);
  RegisterHeader(G, 
       'function GetBusinessPrinter(BusinessName: string): string;',
       @TBusinessPrinters.GetBusinessPrinter);
  RegisterFakeHeader(G, 
       'function TBusinessPrinters_GetPrinters:TStringList;',
       @TBusinessPrinters_GetPrinters);
  RegisterProperty(G, 
       'property Printers:TStringList read TBusinessPrinters_GetPrinters;');
  // End of class TBusinessPrinters
  // Begin of class TBusinessPrinterDialog
  G := RegisterClassType(H, TBusinessPrinterDialog);
  RegisterHeader(G, 
       'constructor Create(AOwner: TComponent; APrinters: TBusinessPrinters);',
       @TBusinessPrinterDialog.Create);
  RegisterHeader(G, 
       'function Execute(): Boolean; override;',
       @TBusinessPrinterDialog.Execute);
  // End of class TBusinessPrinterDialog
  // Begin of class TReporterSelectDialog
  G := RegisterClassType(H, TReporterSelectDialog);
  RegisterHeader(G, 
       'function Execute(): Boolean; override;',
       @TReporterSelectDialog.Execute);
  RegisterFakeHeader(G, 
       'function TReporterSelectDialog_GetReporterName:string;',
       @TReporterSelectDialog_GetReporterName);
  RegisterProperty(G, 
       'property ReporterName:string read TReporterSelectDialog_GetReporterName;');
  RegisterFakeHeader(G, 
       'function TReporterSelectDialog_GetPrintPreview:Boolean;',
       @TReporterSelectDialog_GetPrintPreview);
  RegisterFakeHeader(G, 
       'procedure TReporterSelectDialog_PutPrintPreview(const Value: Boolean);',
       @TReporterSelectDialog_PutPrintPreview);
  RegisterProperty(G, 
       'property PrintPreview:Boolean read TReporterSelectDialog_GetPrintPreview write TReporterSelectDialog_PutPrintPreview;');
  RegisterFakeHeader(G, 
       'function TReporterSelectDialog_GetPrinterName:string;',
       @TReporterSelectDialog_GetPrinterName);
  RegisterFakeHeader(G, 
       'procedure TReporterSelectDialog_PutPrinterName(const Value: string);',
       @TReporterSelectDialog_PutPrinterName);
  RegisterProperty(G, 
       'property PrinterName:string read TReporterSelectDialog_GetPrinterName write TReporterSelectDialog_PutPrinterName;');
  RegisterHeader(G,
       'constructor Create(AOwner: TComponent); virtual;',
       @TReporterSelectDialog.Create);
  // End of class TReporterSelectDialog
  // Begin of class TWrapInfo
  G := RegisterClassType(H, TWrapInfo);
  RegisterHeader(G, 
       'constructor Create(ATarget: TComponent); virtual;',
       @TWrapInfo.Create);
  RegisterHeader(G, 
       'destructor Destroy(); override;',
       @TWrapInfo.Destroy);
  RegisterFakeHeader(G, 
       'function TWrapInfo_GetTarget:TComponent;',
       @TWrapInfo_GetTarget);
  RegisterProperty(G, 
       'property Target:TComponent read TWrapInfo_GetTarget;');
  RegisterFakeHeader(G, 
       'function TWrapInfo_GetWrapper:TControlWrapper;',
       @TWrapInfo_GetWrapper);
  RegisterProperty(G, 
       'property Wrapper:TControlWrapper read TWrapInfo_GetWrapper;');
  RegisterHeader(G, 
       'procedure Wrap(); virtual;',
       @TWrapInfo.Wrap);
  RegisterHeader(G, 
       'procedure UnWrap(); virtual;',
       @TWrapInfo.UnWrap);
  // End of class TWrapInfo
  RegisterClassReferenceType(H, 'TWrapInfoClass');
  // Begin of class TControlWrapper
  G := RegisterClassType(H, TControlWrapper);
  RegisterHeader(G, 
       'constructor Create(AOwner: TComponent); override;',
       @TControlWrapper.Create);
  RegisterHeader(G, 
       'destructor Destroy(); override;',
       @TControlWrapper.Destroy);
  RegisterHeader(G, 
       'function Wrap(ATarget: TComponent): TWrapInfo; virtual;',
       @TControlWrapper.Wrap);
  RegisterHeader(G, 
       'procedure AddWrap(AWrapInfo: TWrapInfo);',
       @TControlWrapper.AddWrap);
  RegisterHeader(G, 
       'procedure Unwrap(ATarget: TComponent); virtual;',
       @TControlWrapper.Unwrap);
  RegisterFakeHeader(G, 
       'function TControlWrapper_GetWrapInfoClass:TWrapInfoClass;',
       @TControlWrapper_GetWrapInfoClass);
  RegisterProperty(G, 
       'property WrapInfoClass:TWrapInfoClass read TControlWrapper_GetWrapInfoClass;');
  // End of class TControlWrapper
  // Begin of class TTableViewPopupMenuWrapper
  G := RegisterClassType(H, TTableViewPopupMenuWrapper);
  RegisterHeader(G, 
       'procedure WrapTableView(ATableView: TcxCustomGridTableView; APopupMenu: TdxBarPopupMenu);',
       @TTableViewPopupMenuWrapper.WrapTableView);
  RegisterHeader(G,
       'constructor Create;',
       @TTableViewPopupMenuWrapper.Create);
  // End of class TTableViewPopupMenuWrapper
  // Begin of class TTableColorWrapInfo
  G := RegisterClassType(H, TTableColorWrapInfo);
  RegisterHeader(G, 
       'procedure Wrap(); override;',
       @TTableColorWrapInfo.Wrap);
  RegisterHeader(G, 
       'procedure UnWrap(); override;',
       @TTableColorWrapInfo.UnWrap);
  RegisterFakeHeader(G, 
       'function TTableColorWrapInfo_GetDataTable:TDADataTable;',
       @TTableColorWrapInfo_GetDataTable);
  RegisterProperty(G, 
       'property DataTable:TDADataTable read TTableColorWrapInfo_GetDataTable;');
  RegisterFakeHeader(G, 
       'function TTableColorWrapInfo_GetColorField:string;',
       @TTableColorWrapInfo_GetColorField);
  RegisterProperty(G, 
       'property ColorField:string read TTableColorWrapInfo_GetColorField;');
  RegisterFakeHeader(G, 
       'function TTableColorWrapInfo_GetColorNodes:TColorNodes;',
       @TTableColorWrapInfo_GetColorNodes);
  RegisterFakeHeader(G, 
       'procedure TTableColorWrapInfo_PutColorNodes(const Value: TColorNodes);',
       @TTableColorWrapInfo_PutColorNodes);
  RegisterProperty(G, 
       'property ColorNodes:TColorNodes read TTableColorWrapInfo_GetColorNodes write TTableColorWrapInfo_PutColorNodes;');
  RegisterFakeHeader(G, 
       'function TTableColorWrapInfo_GetColors:TColorArray;',
       @TTableColorWrapInfo_GetColors);
  RegisterFakeHeader(G, 
       'procedure TTableColorWrapInfo_PutColors(const Value: TColorArray);',
       @TTableColorWrapInfo_PutColors);
  RegisterProperty(G, 
       'property Colors:TColorArray read TTableColorWrapInfo_GetColors write TTableColorWrapInfo_PutColors;');
  RegisterHeader(G,
       'constructor Create(ATarget: TComponent); virtual;',
       @TTableColorWrapInfo.Create);
  // End of class TTableColorWrapInfo
  // Begin of class TTableViewColorWrapper
  G := RegisterClassType(H, TTableViewColorWrapper);
  RegisterHeader(G, 
       'constructor Create(AOwner: TComponent); override;',
       @TTableViewColorWrapper.Create);
  RegisterHeader(G, 
       'function Wrap(ATarget: TComponent): TWrapInfo; override;',
       @TTableViewColorWrapper.Wrap);
  // End of class TTableViewColorWrapper
  // Begin of class THttpDownloadThread
  G := RegisterClassType(H, THttpDownloadThread);
  RegisterHeader(G, 
       'constructor Create(Url, FileName: string; PrograssHandle: HWND);',
       @THttpDownloadThread.Create);
  // End of class THttpDownloadThread
  RegisterHeader(H, 'procedure Bitmap32ToJpg(ABitmap32: TBitmap32; const AFileName: string;  AQuality: Integer; AHorzRes, AVertRes: Integer);', @Bitmap32ToJpg);
  RegisterHeader(H, 'function DownloadImage(const URL: string): TdxGPImage;', @DownloadImage);
  RegisterHeader(H, 'function BuildLayoutButton(AItem: TdxLayoutItem; AAction: TAction): TcxButton;', @BuildLayoutButton);
  RegisterHeader(H, 'function BuildLayoutDropDownButton(AItem: TdxLayoutItem;  AActions: array of TAction; AFlag: Integer): TcxButton;', @BuildLayoutDropDownButton);
  RegisterHeader(H, 'procedure BuildDropDownButton(AButton: TcxButton; AActions: array of TAction);', @BuildDropDownButton);
  RegisterHeader(H, 'function BuildLayoutDropDownOperation(AItem: TdxLayoutItem; AOperation: TBaseOperation;  AOwner: TBaseView): TOperationAction;', @BuildLayoutDropDownOperation);
  RegisterHeader(H, 'procedure CreateBarPopupMenuSeparator(AOwner: TComponent; ALinks: TdxBarItemLinks; ACaption: string);', @CreateBarPopupMenuSeparator);
  RegisterHeader(H, 'function CreateBarManager(AOwner: TForm): TdxBarManager;', @CreateBarManager);
  RegisterHeader(H, 'function CreateBar(ABarManager: TdxBarManager; const ACaption: string): TdxBar;', @CreateBar);
  RegisterHeader(H, 'function BuildAction(AOwner: TActionList; ACaption, AImageName, AHint: string;  AOnUpdate, AOnExecute: TNotifyEvent; AShortCut: TShortCut = 0;  ATag: Integer = 0; AVisible: Boolean = True): TAction;', @BuildAction);
  RegisterHeader(H, 'function BuildDXButton(AOwner: TComponent; ACaption: string;  AOnClick: TNotifyEvent): TcxButton;', @BuildDXButton);
  RegisterHeader(H, 'function BuildDXCheckBox(AOwner: TComponent; ACaption: string; AOnClick: TNotifyEvent; AChecked: Boolean; AColor: TColor): TcxCheckBox;', @BuildDXCheckBox);
  RegisterHeader(H, 'function DX_InputQuery(const ACaption, APrompt, AEditMask: string; var Value: string): Boolean;', @DX_InputQuery);
  RegisterHeader(H, 'function DX_SelectQuery(const ACaption: string; ASource: TStrings; var Index: Integer): Boolean;', @DX_SelectQuery);
  RegisterHeader(H, 'function  ProgressForm(): TProgressForm;', @ProgressForm);
  RegisterHeader(H, 'function ReporterDialog: TReporterSelectDialog;', @ReporterDialog);
  RegisterVariable(H, 'CursorList: TFileCursorList;',@CursorList);
  RegisterVariable(H, 'TableViewPopupMenuWrapper: TTableViewPopupMenuWrapper;',@TableViewPopupMenuWrapper);
  RegisterVariable(H, 'TableViewColorWrapper: TTableViewColorWrapper;',@TableViewColorWrapper);
  RegisterVariable(H, 'BusinessPrinters: TBusinessPrinters;',@BusinessPrinters);
end;
initialization
  RegisterIMPORT_App_Class;
end.
