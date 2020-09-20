unit App_DevWizard;

{
  向导库
}

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
  ExtCtrls,
  StdCtrls,
  Buttons,
  App_DevExpress,
  cxGraphics,
  cxControls,
  cxLookAndFeels,
  cxLookAndFeelPainters,
  dxLayoutContainer,
  dxLayoutControl,
  dxLayoutControlAdapters,
  Menus,
  cxButtons;

type

  {
     向导接口

     1 每执行完一步应设置好自己的状态，以便容器更新界面
     2 最少3步，1至n-2是准备阶段，n-1步是执行阶段，第n步显示结果。
     3 在执行阶段主动调用Container.RefreshInterface
  }
  IWizard = interface
    ['{53BE1CB6-63FC-4207-96CE-E069C5C75ABF}']
    //用于Container安放自身以及初始界面的大小
    function GetWizardControl(): TControl;
    function GetWizardTitle(): string;
    function GetStepCount(): Integer;
    function GetCurrStep(): Integer;
    function GetCurrHint(): string;
    function GetCanCancel(): Boolean;
    function GetIsSuccess(): Boolean;


    procedure DoFirst();    // Container在开始向导时调用
    procedure DoPre();
    procedure DoNext();
    procedure DoCancel(); 

    //Container根据以下属性设置界面
    property WizardControl: TControl read GetWizardControl;
    property WizardTitle: string read GetWizardTitle;
    property StepCount: Integer read GetStepCount;
    property CurrentStep: Integer read GetCurrStep;
    property CurrentHint: string read GetCurrHint;
    property IsSuccess: Boolean read GetIsSuccess; // 任务是否执行成功标志
    property CanCancel: Boolean read GetCanCancel; // 在执行过程中是否可取消
  end;

  {
     向导容器
    1. 容器每执行一步应保证刷新一下，与Wizard状态同步;
    2  最后一步自动显示完成按钮，倒数第2步自动显示执行按钮
  }
  IWizardContainer = interface
    // 向导在执行过程中查询此函数    
    function GetCancelClicked: Boolean;
    //负责把Wizard放置在界面中, 并根据Wizard的属性设置标题, 大小等
    procedure RefreshInterface();
    function ExecuteWizard(Wizard: IWizard): Boolean;
    property CancelClicked: Boolean read GetCancelClicked;
  end;

  TWizardContainer = class(TForm, IWizardContainer)
    lblStep: TLabel;
    lblHint: TLabel;
    WizardImage: TImage;
    dxLayoutControl1Group_Root: TdxLayoutGroup;
    dxLayoutControl1: TdxLayoutControl;
    IconItem: TdxLayoutItem;
    HeaderGroup: TdxLayoutGroup;
    DescriptionItem: TdxLayoutItem;
    CancelButton: TcxButton;
    CancelItem: TdxLayoutItem;
    ButtonGroup: TdxLayoutGroup;
    NextButton: TcxButton;
    NextItem: TdxLayoutItem;
    PreButton: TcxButton;
    PreItem: TdxLayoutItem;
    WizardItem: TdxLayoutItem;
    ExecButton: TcxButton;
    ExecItem: TdxLayoutItem;
    procedure PreButtonClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure NextButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ExecButtonClick(Sender: TObject);
  private
    { Private declarations }
    FCancelClicked: Boolean;
    FWizard: IWizard;
  protected
    procedure SetButton();
    procedure SetHint();
    function GetCancelClicked(): Boolean;
    procedure RefreshInterface();
    function ExecuteWizard(AWizard: IWizard): Boolean;
  public
    { Public declarations }
  end;

function GetWizardContainer(): IWizardContainer;

implementation

var
  WizardContainer: TWizardContainer;

{$R *.dfm}

function GetWizardContainer(): IWizardContainer;
begin
  if WizardContainer = nil then
    WizardContainer := TWizardContainer.Create(nil);
  Result := WizardContainer;
end;

function TWizardContainer.ExecuteWizard(AWizard: IWizard): Boolean;
var
  OldParent: TWinControl;
begin
  FCancelClicked := False;
  FWizard := AWizard;
  OldParent := AWizard.WizardControl.Parent;
  with FWizard do
  begin
    ClientWidth := WizardControl.Width;
    ClientHeight := WizardControl.Height + 100;
    Caption := WizardTitle;
    WizardControl.Parent := Self;
    WizardControl.Visible := True;
  end;
  WizardItem.Control := FWizard.WizardControl;
  FWizard.DoFirst;
  RefreshInterface;
  Result := ShowModal = mrOK;
  FWizard := nil;
  AWizard.WizardControl.Visible := False;
  WizardItem.Control := nil;
  AWizard.WizardControl.Parent := OldParent;
end;

procedure TWizardContainer.PreButtonClick(Sender: TObject);
begin
  try
    FWizard.DoPre;
  finally
    RefreshInterface;
  end;
end;

procedure TWizardContainer.NextButtonClick(Sender: TObject);
begin
  try
    FWizard.DoNext;
  finally
    RefreshInterface;
  end;
end;

procedure TWizardContainer.btnCancelClick(Sender: TObject);
begin
  if FWizard.CurrentStep < FWizard.StepCount - 2 then
    ModalResult := mrCancel
  else begin
    FCancelClicked := True;
  end;
end;

procedure TWizardContainer.SetButton;
begin
  with FWizard do
  begin
    // |0,1,2,3...StepCount-4,StepCount-3|StepCount-2|StepCount-1
    // |准备                             |执行       |完成
    PreButton.Enabled := (CurrentStep > 0) and (CurrentStep < StepCount - 2);
    NextButton.Enabled := (CurrentStep >= 0) and (CurrentStep < StepCount - 3);
    ExecItem.Enabled := CurrentStep in [StepCount - 3, StepCount - 1];
    if (CurrentStep = StepCount - 1) then
      ExecButton.Caption := '完成'
    else
      ExecButton.Caption := '执行';
    CancelButton.Enabled := (CurrentStep < StepCount - 2) or
      (CanCancel and (CurrentStep = StepCount - 2));
  end;
end;

procedure TWizardContainer.SetHint;
begin
  with FWizard do
  begin
    lblStep.Caption := IntToStr(StepCount) + '.' + IntToStr(CurrentStep);
    lblHint.Caption := CurrentHint;
  end;
end;

procedure TWizardContainer.FormShow(Sender: TObject);
begin
  FWizard.DoFirst;
end;

procedure TWizardContainer.RefreshInterface;
begin
  SetHint;
  SetButton;
  Application.ProcessMessages;
end;

procedure TWizardContainer.ExecButtonClick(Sender: TObject);
begin
  if FWizard.CurrentStep = FWizard.StepCount - 3 then
    NextButton.Click
  else
  begin
    if FWizard.IsSuccess then ModalResult := mrOk
    else ModalResult := mrCancel;
  end;  
end;

function TWizardContainer.GetCancelClicked: Boolean;
begin
  Result := FCancelClicked;
end;

initialization

finalization
  FreeAndNil(WizardContainer);

end.

