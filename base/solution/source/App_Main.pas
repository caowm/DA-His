unit App_Main;

{
  用TPanel作为View的容器
  管理Side
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
  App_Common,
  App_BaseMain,
  ActnList,
  Menus,
  ExtCtrls;

type
  TAppMainForm = class(TAppBaseMain)
    LeftPanel: TPanel;
    LeftSplitter: TSplitter;
    RightSplitter: TSplitter;
    RightPanel: TPanel;
    BottomPanel: TPanel;
    BottomSplitter: TSplitter;
    ClientPanel: TPanel;
  private
    procedure SetSide();
  protected
    procedure LoadState(); override;
    procedure SaveState(); override;
  public
    procedure ShowView(View: TBaseView); override;
    procedure ShowSide(Side: TMainSide; Form: TForm); override;
    procedure CloseSide(Form: TForm); override;
  end;

var
  AppMainForm: TAppMainForm;

implementation

type

  TBaseViewHack = class(TBaseView);

  {$R *.dfm}

  { TAppMainForm }

procedure TAppMainForm.LoadState;
begin
  inherited;
  with AppCore.IniFile do
  begin
    LeftPanel.Width := ReadInteger(sAppSection, 'LeftSide', LeftPanel.Width);
    if (LeftPanel.Width <= 0) then LeftPanel.Width := 1;
    RightPanel.Width := ReadInteger(sAppSection, 'RightSide', RightPanel.Width);
    if (RightPanel.Width <= 0) then RightPanel.Width := 1;
    BottomPanel.Height := ReadInteger(sAppSection, 'BottomSide', BottomPanel.Height);
    if (BottomPanel.Width <= 0) then BottomPanel.Width := 1;
  end;
end;

procedure TAppMainForm.SaveState;
begin
  inherited;
  with AppCore.IniFile do
  begin
    WriteInteger(sAppSection, 'LeftSide', LeftPanel.Width);
    WriteInteger(sAppSection, 'RightSide', RightPanel.Width);
    WriteInteger(sAppSection, 'BottomSide', BottomPanel.Height);
  end;
end;

procedure TAppMainForm.SetSide;
begin
  LeftPanel.Visible := LeftPanel.ControlCount > 0;
  LeftSplitter.Visible := LeftPanel.Visible;
  RightPanel.Visible := RightPanel.ControlCount > 0;
  RightSplitter.Visible := RightPanel.Visible;
  BottomPanel.Visible := BottomPanel.ControlCount > 0;
  BottomSplitter.Visible := BottomPanel.Visible;
end;

procedure TAppMainForm.ShowSide(Side: TMainSide; Form: TForm);
var
  MainPanel: array[TMainSide] of TPanel;
  MainSplitter: array[TMainSide] of TSplitter;
begin
  MainPanel[msLeft] := LeftPanel;
  MainPanel[msRight] := RightPanel;
  MainPanel[msBottom] := BottomPanel;
  MainSplitter[msLeft] := LeftSplitter;
  MainSplitter[msRight] := RightSplitter;
  MainSplitter[msBottom] := BottomSplitter;

  Form.BorderStyle := bsNone;
  Form.Parent := MainPanel[Side];
  Form.Align := alClient;
  Form.Visible := True;
  //Form.Font := Font;
  Form.BringToFront;
  if (MainPanel[Side].Width < 2) then MainPanel[Side].Width := 185;

  SetSide();
end;

procedure TAppMainForm.CloseSide(Form: TForm);
begin
  Form.Visible := False;
  Form.Parent := nil;
  SetSide();
end;

procedure TAppMainForm.ShowView(View: TBaseView);
begin
  if (View <> FActiveView) then
  begin
    HideView;
    View.Parent := ClientPanel;
    View.Align := alClient;
    View.BorderStyle := bsNone;
    View.AutoScroll := True;
    View.Font := Font;
    View.Color := Color;
  end;
  if FOpenedViews.IndexOf(View) < 0 then
    FOpenedViews.Add(View);
  FActiveView := View;

  View.Visible := True;
  SetTitle(View.Caption);
  TBaseViewHack(View).DoShowView;
  FLastClicked := View.Operation;
  FViewSubject.Notify(View);
end;

end.

