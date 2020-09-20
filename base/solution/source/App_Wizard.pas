unit App_Wizard;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dximctrl, dxGallery, dxGalleryControl, cxCalendar,
  cxScrollBox, dxCustomTileControl, cxClasses, dxTileControl, dxGDIPlusClasses,
  cxGeometry,
  dxCustomWizardControl, dxWizardControl, dxWizardControlForm;

const
  sWizardButtonBack = '上一步(&B)';
  sWizardButtonNext = '下一步(&N)';
  sWizardButtonExecute = '执行(&E)';
  sWizardButtonFinish = '完成(&F)';
  sWizardButtonCancel = '取消(&C)';
  sWizardButtonHelp = '帮助(&H)';

type

  TBaseWizardForm = class(TdxWizardControlForm)
  private
    FExecuteResult: Boolean;
    FWizardControl: TdxWizardControl;
  protected
    procedure BuildWizard(); virtual;
    procedure CreatePages(APageCount: Integer); virtual;
    function GetExecutePageIndex(): Integer;

    procedure DoPageChanged(Sender: TObject); virtual;
    procedure DoPageChanging(Sender: TObject;
      ANewPage: TdxWizardControlCustomPage; var AAllowChange: Boolean); virtual;
    procedure DoButtonClick(Sender: TObject;
      AKind: TdxWizardControlButtonKind; var AHandled: Boolean);
    procedure DoBackButtonClick(var AHandled: Boolean); virtual;
    procedure DoNextButtonClick(var AHandled: Boolean); virtual;
    procedure DoFinishButtonClick(var AHandled: Boolean); virtual;
    procedure DoCancelButtonClick(var AHandled: Boolean); virtual;
    procedure DoHelpButtonClick(var AHandled: Boolean); virtual;
    procedure DoPrepare(); virtual;

    property ExecutePageIndex: Integer read GetExecutePageIndex;
    property ExecuteResult: Boolean read FExecuteResult write FExecuteResult;
  public
    constructor Create(AOwner: TComponent); override;
    function Execute(): Boolean;
    property WizardControl: TdxWizardControl read FWizardControl;
  end;

  TTestWizardForm = class(TBaseWizardForm)
  private
    procedure BuildWizard(); override;
    procedure DoPrepare(); override;
    procedure DoNextButtonClick(var AHandled: Boolean); override;
    procedure PreparePage0();
    procedure PreparePage1();
  protected
  public
  end;

var
  Form1: TForm1;

implementation

uses
  Wizard_Test;

{$R *.dfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
var
  WizardForm: TBaseWizardForm;
begin
  WizardForm := TTestWizardForm.Create(nil);
  if WizardForm.Execute then
    Log('执行成功')
  else
    Log('执行失败');
  WizardForm.Free;
end;

procedure TForm1.Log(const AText: string);
begin
  Memo1.Lines.Add(Format('%s %s', [FormatDateTime('hh:mm:ss', Now), AText]));
end;


{ TBaseWizardForm }

procedure TBaseWizardForm.CreatePages(APageCount: Integer);
var
  I: Integer;
begin
  for I := 0 to APageCount - 1 do
  begin
    FWizardControl.AddPage.DoubleBuffered := False;
  end;
end;

constructor TBaseWizardForm.Create(AOwner: TComponent);
begin
  inherited CreateNew(AOwner);
  BuildWizard;
end;

procedure TBaseWizardForm.DoPrepare;
begin

end;

function TBaseWizardForm.Execute: Boolean;
begin
  WizardControl.ActivePageIndex := 0;
  DoPrepare();
  FExecuteResult := False;
  ShowModal;
  Result := FExecuteResult;
end;

procedure TBaseWizardForm.BuildWizard;
begin
  BorderStyle := bsSingle;
  BorderIcons := [biSystemMenu];
  Width := 600;
  Height := 480;
  Position := poScreenCenter;
  Caption := '向导';
  FWizardControl := TdxWizardControl.Create(Self);
  with FWizardControl do
  begin                   
    Parent := Self;
    //LookAndFeel.Kind := lfFlat;
    Buttons.Help.Visible := False;
    Buttons.Back.Caption := sWizardButtonBack;
    Buttons.Next.Caption := sWizardButtonNext;
    Buttons.Finish.Caption := sWizardButtonFinish;
    Buttons.Cancel.Caption := sWizardButtonCancel;
    Buttons.Help.Caption := sWizardButtonHelp;

    OnPageChanging := DoPageChanging;
    OnPageChanged := DoPageChanged;;
    OnButtonClick := DoButtonClick;
  end;
end;

procedure TBaseWizardForm.DoPageChanging(Sender: TObject;
  ANewPage: TdxWizardControlCustomPage; var AAllowChange: Boolean);
begin
  Form1.Log(Format('to page: %d', [ANewPage.PageIndex]));
end;

procedure TBaseWizardForm.DoButtonClick(Sender: TObject;
  AKind: TdxWizardControlButtonKind; var AHandled: Boolean);
begin
  case AKind of
    wcbkBack: DoBackButtonClick(AHandled);
    wcbkNext: DoNextButtonClick(AHandled);
    wcbkHelp: DoHelpButtonClick(AHandled);
    wcbkFinish: DoFinishButtonClick(AHandled);
    wcbkCancel: DoCancelButtonClick(AHandled);
  end;
end;

procedure TBaseWizardForm.DoBackButtonClick(var AHandled: Boolean);
begin

end;

procedure TBaseWizardForm.DoCancelButtonClick(var AHandled: Boolean);
begin
  ModalResult := mrCancel;
end;

procedure TBaseWizardForm.DoFinishButtonClick(var AHandled: Boolean);
begin
  ModalResult := mrOk;
end;

procedure TBaseWizardForm.DoHelpButtonClick(var AHandled: Boolean);
begin

end;

procedure TBaseWizardForm.DoNextButtonClick(var AHandled: Boolean);
begin

end;

procedure TBaseWizardForm.DoPageChanged(Sender: TObject);
begin
  if WizardControl.PageCount <= 1 then Exit;

  // 默认在最后一步时不能取消
  WizardControl.Buttons.Cancel.Enabled :=
    WizardControl.ActivePageIndex < WizardControl.PageCount - 1;

  // 默认在最后一步时不能后退
  WizardControl.Buttons.Back.Enabled :=
    WizardControl.ActivePageIndex < WizardControl.PageCount - 1;

  if WizardControl.ActivePageIndex = ExecutePageIndex then
    // 默认倒数第2步时，下一步的标题变为"执行"
    WizardControl.Buttons.Next.Caption := sWizardButtonExecute
  else if WizardControl.ActivePageIndex < ExecutePageIndex then
    // 默认倒数第2步之前，下一步的标题为"下一步"
    WizardControl.Buttons.Next.Caption := sWizardButtonNext;
end;


function TBaseWizardForm.GetExecutePageIndex: Integer;
begin
  // 执行页的索引
  Result := WizardControl.PageCount - 2;
end;

{ TTestWizardForm }

procedure TTestWizardForm.DoPrepare;
begin
  inherited;
end;

procedure TTestWizardForm.PreparePage0;
begin
  // 查找住院号
  Form1.Log('正在查询病人信息...');
end;

procedure TTestWizardForm.PreparePage1;
begin
  // 执行预交
  Form1.Log('正在执行住院预交...');
  if Random > 0.6 then
    raise Exception.Create('住院预交出现未知错误，请重试!');

  // 显示结果
  Form1.Log('住院预交执行成功!');
  ExecuteResult := True;
end;

procedure TTestWizardForm.BuildWizard;
begin
  inherited;

  Caption := '住院缴费向导';
  WizardControl.ViewStyle := wcvsWizard97;
  {
  WizardControl.ViewStyle := wcvsAero;
  WizardControl.OptionsViewStyleAero.Title.Text := Caption;
  Caption := '';
  BorderIcons := [];
  }
  //WizardControl.OptionsViewStyleAero.EnableTitleAero := True;

  CreatePages(3);

  WizardControl.Pages[0].Header.Title := '输入住院号';
  WizardControl.Pages[0].Header.Description := '';

  WizardControl.Pages[1].Header.Title := '输入预交金额';

  WizardControl.Pages[2].Header.Title := '执行结果';
  WizardControl.Pages[2].Header.Description := '';
end;


procedure TTestWizardForm.DoNextButtonClick(var AHandled: Boolean);
begin
  inherited;
  case WizardControl.ActivePageIndex of
    0: PreparePage0;
    1: PreparePage1;
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  with TForm2.Create(nil) do
  begin
    ShowModal;
    Free;
  end;
end;

end.
