unit IMPORT_App_FastReport;
interface
uses
  SysUtils,
  Classes,
  Forms,
  DB,
  App_Common,
  App_Function,
  Controls,
  frxClass,
  fs_iinterpreter,
  frxPrintDialog,
  frxPrinter,
  fs_iclassesrtti,
  fs_idialogsrtti,
  fs_iformsrtti,
  fs_ipascal,
  fs_igraphicsrtti,
  fs_iadortti,
  fs_idbctrlsrtti,
  fs_iextctrlsrtti,
  fs_ichartrtti,
  fs_iinirtti,
  frxDBSet,
  frxDesgn,
  frxExportText,
  frxExportXLS,
  frxDCtrl,
  frxGradient,
  frxChBox,
  frxCross,
  frxRich,
  frxChart,
  frxOLE,
  frxBarcode,
  frxADOComponents,
  frxExportCSV,
  frxExportImage,
  frxExportHTML,
  frxExportPDF,
  frxExportRTF,
  ADODB,
  Dialogs,
  App_FastReport,
  Variants,
  PaxCompiler,
  PaxRegister;
procedure RegisterIMPORT_App_FastReport;
implementation
function TReportModule_GetPrinter(Self:TReportModule):string;
begin
  result := Self.Printer;
end;
procedure TReportModule_PutPrinter(Self:TReportModule;const Value: string);
begin
  Self.Printer := Value;
end;
function TReportModule_GetDefaultPrinter(Self:TReportModule):string;
begin
  result := Self.DefaultPrinter;
end;
function TReportModule_GetReportFilePath(Self:TReportModule):string;
begin
  result := Self.ReportFilePath;
end;
procedure TReportModule_PutReportFilePath(Self:TReportModule;const Value: string);
begin
  Self.ReportFilePath := Value;
end;
procedure RegisterIMPORT_App_FastReport;
var G, H: Integer;
begin
  H := RegisterNamespace(0, 'App_FastReport');
  // Begin of class TReportModule
  G := RegisterClassType(H, TReportModule);
  RegisterHeader(G, 
       'procedure DataModuleCreate(Sender: TObject);',
       @TReportModule.DataModuleCreate);
  RegisterHeader(G, 
       'procedure PrintReport(AReportName: string;      const ADataSets: array of TDataSet;      const ADataSetName: array of string;      const AParams, AValues: array of Variant;      APreviewIt: Boolean = True;      const APrinter: string = '''');',
       @TReportModule.PrintReport);
  RegisterHeader(G, 
       'procedure PrintStream(AStream: TStream;      const AReportName: string;      APreviewIt: Boolean = True;      const APrinter: string = '''');',
       @TReportModule.PrintStream);
  RegisterHeader(G, 
       'procedure SetupPrinter();',
       @TReportModule.SetupPrinter);
  RegisterFakeHeader(G, 
       'function TReportModule_GetPrinter:string;',
       @TReportModule_GetPrinter);
  RegisterFakeHeader(G, 
       'procedure TReportModule_PutPrinter(const Value: string);',
       @TReportModule_PutPrinter);
  RegisterProperty(G, 
       'property Printer:string read TReportModule_GetPrinter write TReportModule_PutPrinter;');
  RegisterFakeHeader(G, 
       'function TReportModule_GetDefaultPrinter:string;',
       @TReportModule_GetDefaultPrinter);
  RegisterProperty(G, 
       'property DefaultPrinter:string read TReportModule_GetDefaultPrinter;');
  RegisterFakeHeader(G, 
       'function TReportModule_GetReportFilePath:string;',
       @TReportModule_GetReportFilePath);
  RegisterFakeHeader(G, 
       'procedure TReportModule_PutReportFilePath(const Value: string);',
       @TReportModule_PutReportFilePath);
  RegisterProperty(G, 
       'property ReportFilePath:string read TReportModule_GetReportFilePath write TReportModule_PutReportFilePath;');
  RegisterHeader(G,
       'constructor Create(AOwner: TComponent); virtual;',
       @TReportModule.Create);
  // End of class TReportModule
  RegisterVariable(H, 'FastReport: TReportModule;',@FastReport);
end;
initialization
  RegisterIMPORT_App_FastReport;
end.
