unit App_FastReportPreview;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  App_DevExpress,
  cxGraphics,
  cxControls,
  cxLookAndFeels,
  cxLookAndFeelPainters,
  dxLayoutContainer,
  dxLayoutControlAdapters,
  Menus,
  StdCtrls,
  cxButtons,
  dxLayoutControl,
  frxClass,
  frxPreview;

type
  TReportPreviewForm = class(TForm)
    ReportPreview: TfrxPreview;
    dxLayoutControl1Group_Root: TdxLayoutGroup;
    dxLayoutControl1: TdxLayoutControl;
    dxLayoutControl1Group1: TdxLayoutGroup;
    dxLayoutControl1Item1: TdxLayoutItem;
    EditBtn: TcxButton;
    dxLayoutControl1Item2: TdxLayoutItem;
    PrintBtn: TcxButton;
    dxLayoutControl1Item3: TdxLayoutItem;
    DelBtn: TcxButton;
    dxLayoutControl1Item4: TdxLayoutItem;
    AddBtn: TcxButton;
    dxLayoutControl1Item5: TdxLayoutItem;
    SaveBtn: TcxButton;
    dxLayoutControl1Item6: TdxLayoutItem;
    procedure PrintBtnClick(Sender: TObject);
    procedure EditBtnClick(Sender: TObject);
    procedure DelBtnClick(Sender: TObject);
    procedure AddBtnClick(Sender: TObject);
    procedure SaveBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FModified: Boolean;
    FSource: string;
  public
    procedure ShowPreparedReport(AFileName: string);
  end;

function GetReportPreviewForm(): TReportPreviewForm;

implementation

uses
  App_FastReport;

{$R *.dfm}

var
  ReportPreviewForm: TReportPreviewForm;

function GetReportPreviewForm(): TReportPreviewForm;
begin
  if ReportPreviewForm = nil then
    ReportPreviewForm := TReportPreviewForm.Create(nil);
  Result := ReportPreviewForm;
end;

{ TReportPreviewForm }

procedure TReportPreviewForm.ShowPreparedReport(AFileName: string);
begin
  FSource := AFileName;
  FModified := False;
  FastReport.frxReport.PreviewPages.LoadFromFile(AFileName);
  ShowModal;
end;

procedure TReportPreviewForm.PrintBtnClick(Sender: TObject);
begin
  ReportPreview.Print;
end;

procedure TReportPreviewForm.EditBtnClick(Sender: TObject);
begin
  ReportPreview.Edit;
  FModified := True;
end;

procedure TReportPreviewForm.DelBtnClick(Sender: TObject);
begin
  ReportPreview.DeletePage;
  FModified := True;
end;

procedure TReportPreviewForm.AddBtnClick(Sender: TObject);
begin
  ReportPreview.AddPage;  
  FModified := True;
end;

procedure TReportPreviewForm.SaveBtnClick(Sender: TObject);
begin
  ReportPreview.SaveToFile(FSource);
end;

procedure TReportPreviewForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if FModified then ReportPreview.SaveToFile;
  FastReport.frxReport.Preview := nil;
end;

procedure TReportPreviewForm.FormCreate(Sender: TObject);
begin  
  //ReportPreview.Init;
end;

procedure TReportPreviewForm.FormShow(Sender: TObject);
begin
  FastReport.frxReport.Preview := ReportPreview;
end;

initialization

finalization
  FreeAndNil(ReportPreviewForm);

end.

