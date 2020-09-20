unit App_DataWizard;

{
  数据导入导出

  Written by caowm (remobjects@qq.com)
  2014年9月
}

interface

uses
  SysUtils,
  Classes,
  Forms,
  DB,
  App_Function,
  App_DAModel,
  QImport3,
  QImport3XMLDoc,
  QImport3Wizard,
  QImport3XML,
  QExport4,
  QExport4Docx,
  QExport4Dialog,
  QExport4XML,
  QImport3XLS,
  QImport3ASCII,
  QExport4ASCII,
  QExport4XLS, QImport3XMLBased;

type

  TDataWizard = class(TDataModule, IDataExportWizard, IDataImportWizard)
    QImport3Wizard: TQImport3Wizard;
    QExport4Dialog: TQExport4Dialog;
    QExport4Docx: TQExport4Docx;
    QImport3XMLDoc: TQImport3XMLDoc;
    QImport3XML: TQImport3XML;
    QExport4XML: TQExport4XML;
    QImport3XLS: TQImport3XLS;
    QImport3ASCII: TQImport3ASCII;
    QExport4XLS: TQExport4XLS;
    QExport4ASCII: TQExport4ASCII;
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    procedure ExportData(ADataSet: TDataSet; AExportFields: string);
    procedure ImportData(ADataSet: TDataSet;
      AImportFields, AKeyColumns: string);
  end;

function DataWizard(): TDataWizard;

implementation

var
  FDataWizard: TDataWizard;

{$R *.dfm}

function DataWizard(): TDataWizard;
begin
  if FDataWizard = nil then
    FDataWizard := TDataWizard.Create(Application);
  Result := FDataWizard;
end;

{ TDataImportExportDM }

procedure TDataWizard.ExportData(ADataSet: TDataSet; AExportFields: string);
var
  FileName: string;
  QEExport: TQExport4Text;
begin
  if ShowSave('输入导出的文件名', 'Excel文件|*.xls|CSV文件|*.csv', FileName) then
  begin
    if SameText(ExtractFileExt(FileName), '.xls') then
    begin
      QEExport := QExport4XLS;
    end
    else
    begin
      QEExport := QExport4ASCII;
    end;
    QEExport.DataSet := ADataSet;
    QEExport.FileName := FileName;
    QEExport.ExportedFields.CommaText := AExportFields;
    QEExport.Execute;
  end;
end;

procedure TDataWizard.ImportData(ADataSet: TDataSet;
  AImportFields, AKeyColumns: string);
var
  FileName: string;

  procedure BuildXlsMap(Map: TStrings);
  var
    I: Integer;
  begin
    for I := 0 to Map.Count - 1 do
    begin
      Map[I] := Map[I] + '=' + Char(Ord('A') + I) + '-COLFINISH';
    end;
  end;

  procedure BuildAsciiMap(Map: TStrings);
  var
    I: Integer;
  begin
    for I := 0 to Map.Count - 1 do
    begin
      Map[I] := Map[I] + '=' + IntToStr(I + 1);
    end;
  end;

begin
  if ShowOpen('选择要导入的文件', 'Excel文件|*.xls|CSV文件|*.csv', FileName) then
  begin
    if SameText(ExtractFileExt(FileName), '.xls') then
    begin
      QImport3XLS.DataSet := ADataSet;
      QImport3XLS.FileName := FileName;
      QImport3XLS.Map.CommaText := AImportFields;
      QImport3XLS.KeyColumns.Delimiter := ';';
      QImport3XLS.KeyColumns.DelimitedText := AKeyColumns;
      BuildXlsMap(QImport3XLS.Map);
      QImport3XLS.Execute;
    end
    else
    begin
      QImport3ASCII.DataSet := ADataSet;
      QImport3ASCII.FileName := FileName;
      QImport3ASCII.Map.CommaText := AImportFields;
      QImport3ASCII.KeyColumns.Delimiter := ';';
      QImport3ASCII.KeyColumns.DelimitedText := AKeyColumns;
      BuildAsciiMap(QImport3ASCII.Map);
      QImport3ASCII.Execute;
    end;
  end;
end;

procedure TDataWizard.DataModuleDestroy(Sender: TObject);
begin
  DataImportWizard := nil;
  DataExportWizard := nil;
end;

initialization

DataImportWizard := DataWizard;
DataExportWizard := DataWizard;

finalization

end.
