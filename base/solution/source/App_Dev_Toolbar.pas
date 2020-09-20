unit App_Dev_Toolbar;

{
  使用TdxLayoutControl+TcxButton实现工具栏和状态栏

  Written by caowm (remobjects@qq.com)
  2014年9月
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
  StdCtrls,
  Dialogs,
  Menus,
  ActnList,
  DateUtils,
  Contnrs,
  uROClasses,
  App_Common,
  App_DevExpress,
  App_Function,
  cxGraphics,
  cxControls,
  cxLookAndFeels,
  cxLookAndFeelPainters,
  dxLayoutContainer,
  dxLayoutControl,
  dxLayoutControlAdapters,
  cxButtons,
  dxLayoutLookAndFeels,
  dxLayoutcxEditAdapters,
  dxAlertWindow,
  cxContainer,
  dxCore,
  cxEdit,
  cxProgressBar,
  dxStatusBar, cxClasses;

type

  TDevLayoutToolbar = class(TForm)
    LayoutGroup_Root: TdxLayoutGroup;
    Layout: TdxLayoutControl;
    ViewActionGroup: TdxLayoutGroup;
  private
    FAppObserver: TObserver;
    FViewObserver: TObserver;
    FViewTool: TObjectList;
    FViewMenu: TMenuItem;
    FCurView: TBaseView;
    procedure OnAppNotify(Sender: TObject);
    procedure OnViewNotify(Sender: TObject);
  public
    procedure BuildToolBar(AView: TBaseView);
    constructor Create(AOwner: TComponent); override;
    destructor Destroy(); override;
  end;

  TDevLayoutStatusBar = class
  private
    FLogObserver: TObserver;
    FAppObserver: TObserver;
    FStatusBar: TdxLayoutControl;
    FTimer: TROThreadTimer;
    FLastLogTime: TDateTime;
    FProgress: TcxProgressBar;
    FProgressItem: TdxLayoutItem;
    procedure DoAppNotify(Sender: TObject);
    procedure DoLogNotify(Sender: TObject);
    procedure DoTimer(CurrentTickCount: Cardinal);
  protected
    function GetBarCount(): Integer;
    procedure SetBarText(Index: Integer; Text: string);
  public
    constructor Create();
    destructor Destroy(); override;
    function AddBar(AWidth: Integer): Integer;
    procedure ShowProgress(MaxValue, Position: Integer);
  end;

  TDevStatusBar = class(TComponent)
  private
    FLogObserver: TObserver;
    FAppObserver: TObserver;
    FStatusBar: TdxStatusBar;
    FTimer: TROThreadTimer;
    FLastLogTime: TDateTime;
    FProgress: TcxProgressBar;
    FProgressPanel: TdxStatusBarPanel;
    procedure DoAppNotify(Sender: TObject);
    procedure DoLogNotify(Sender: TObject);
    procedure DoTimer(CurrentTickCount: Cardinal);
  protected
    function GetBarCount(): Integer;
    procedure SetBarText(Index: Integer; Text: string);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy(); override;
    function AddBar(AWidth: Integer): Integer;
    procedure ShowProgress(MaxValue, Position: Integer);

    property BarCount: Integer read GetBarCount;
    property BarText[Index: Integer]: string write SetBarText;
  end;

  TDevAlertWindow = class(TComponent)
  private
    FAlertWindowManager: TdxAlertWindowManager;
    FLogObserver: TObserver;
    FAppObserver: TObserver;
    procedure DoAppNotify(Sender: TObject);
    procedure DoLogNotify(Sender: TObject);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy(); override;
  end;

var
  DevStatusBar: TDevStatusBar; // 由组织者创建
  DevAlertWindow: TDevAlertWindow; // 由组织者创建

implementation

{$R *.dfm}
{ TDevLayoutToolbar }

procedure TDevLayoutToolbar.BuildToolBar(AView: TBaseView);
var
  I: Integer;
  Temp: TcxButton;
  Menu: TMenuItem;
begin

  // Layout.BeginUpdate;  // 影响Button.Action的更新, bug？？？
  try
    FreeAndNil(FViewTool);
    FreeAndNil(FViewMenu);
    if (AView = nil) or (AView.ViewActions = nil) or
      (AView.ViewActions.ActionCount = 0) then
      Exit;

    FViewTool := TObjectList.Create(True);
    FViewMenu := TMenuItem.Create(Self);
    FViewMenu.Visible := False;
    FViewMenu.Caption := '动作';
    AppCore.MainView.MainMenu.Items.Add(FViewMenu);

    for I := 0 to AView.ViewActions.ActionCount - 1 do
      if TAction(AView.ViewActions[I]).Visible then
      begin
        if TAction(AView.ViewActions[I]).Hint = '' then
          TAction(AView.ViewActions[I]).Hint :=
            TAction(AView.ViewActions[I]).Caption;

        // 挂到主菜单，让快捷键起作用
        Menu := TMenuItem.Create(FViewMenu);
        Menu.Action := AView.ViewActions[I];
        FViewMenu.Add(Menu);

        // 类别不同时添加分隔项
        if (I > 0) and (AView.ViewActions[I].Category <> AView.ViewActions
          [I - 1].Category) then
        begin
          FViewTool.Add(Layout.CreateItem(TdxLayoutSeparatorItem,
            Layout.Items));
        end;

        Temp := TcxButton.Create(nil);
        FViewTool.Add(Temp);

        Temp.Width := Layout.Canvas.TextWidth(TAction(AView.ViewActions[I])
          .Caption) + 8;
        // Temp.Height := ButtonClose.Height;
        Temp.SpeedButtonOptions.Flat := True;
        Temp.SpeedButtonOptions.CanBeFocused := False;
        Temp.SpeedButtonOptions.Transparent := True;
        Temp.SpeedButtonOptions.GroupIndex := TAction(AView.ViewActions[I])
          .GroupIndex;
        Temp.SpeedButtonOptions.Down := TAction(AView.ViewActions[I]).Checked;
        if TAction(AView.ViewActions[I]).ImageIndex > -1 then
          Temp.Width := Temp.Width + AView.ViewActions.Images.Width;
        Temp.TabStop := False;

        // 下面两行顺序很重要
        ViewActionGroup.CreateItemForControl(Temp).AlignVert := avClient;
        // 有时Button状态与Action不同步，只有放在这里最后设置, 但是影响界面刷新
        Temp.Action := AView.ViewActions[I];

      end;
  finally
    // Layout.EndUpdate();
  end;
end;

constructor TDevLayoutToolbar.Create(AOwner: TComponent);
begin
  inherited;
  Layout.LookAndFeel := DevExpress.dxLayoutFeelToolbar;
  FAppObserver := TObserver.Create(OnAppNotify);
  AppCore.StateSubject.Attach(FAppObserver);
  FViewObserver := TObserver.Create(OnViewNotify);

  Height := AppCore.ToolBarImage.ImageList.Height + 10;
end;

destructor TDevLayoutToolbar.Destroy;
begin
  FreeAndNil(FViewObserver);
  FreeAndNil(FAppObserver);
  inherited;
end;

procedure TDevLayoutToolbar.OnAppNotify(Sender: TObject);
begin

end;

procedure TDevLayoutToolbar.OnViewNotify(Sender: TObject);
begin
  FCurView := TBaseView(Sender);
  BuildToolBar(TBaseView(Sender));
end;

{ TDevLayoutStatusBar }

function TDevLayoutStatusBar.AddBar(AWidth: Integer): Integer;
begin
  FStatusBar.CreateItem(TdxLayoutSeparatorItem, FStatusBar.Items).AlignHorz
    := ahRight;
  Result := FStatusBar.CreateItem(TdxLayoutItem, FStatusBar.Items).Index;
  FStatusBar.Items[Result].Width := AWidth;
  FStatusBar.Items[Result].AlignVert := avClient;
  FStatusBar.Items[Result].AlignHorz := ahRight;
end;

constructor TDevLayoutStatusBar.Create;
begin
  inherited;
  FLogObserver := TObserver.Create(DoLogNotify);
  FAppObserver := TObserver.Create(DoAppNotify);
  AppCore.StateSubject.Attach(FAppObserver);
  AppCore.Logger.LogSubject.Attach(FLogObserver);
  FStatusBar := TdxLayoutControl.Create(nil);
  FStatusBar.ParentFont := False;
  FStatusBar.LookAndFeel := DevExpress.dxLayoutFeelToolbar;
  FStatusBar.Height := 28;
  FStatusBar.OptionsImage.Images := AppCore.LargeImage.ImageList;
  FStatusBar.ParentFont := False;
  FStatusBar.Items.LayoutDirection := ldHorizontal;
  FStatusBar.Items.AlignVert := avClient;
  FStatusBar.Items.AlignHorz := ahClient;
  FStatusBar.Align := alBottom;

  with TdxLayoutItem(FStatusBar.CreateItem(TdxLayoutItem, FStatusBar.Items)) do
  begin
    AlignHorz := ahClient;
    AlignVert := avClient;
    Caption := ' ';
  end;

  // 创建进度条
  FProgress := TcxProgressBar.Create(FStatusBar);
  FProgress.Width := 250;
  FProgress.Properties.BarStyle := cxbsGradient;
  FProgress.Properties.BeginColor := $00AAFFAA;
  FProgress.Properties.EndColor := $0000D328;

  FProgressItem := FStatusBar.CreateItemForControl(FProgress, FStatusBar.Items);
  with FProgressItem do
  begin
    AlignHorz := ahRight;
    AlignVert := avClient;
    Visible := False;
    Caption := ' ';
  end;
  // 定时清除提示。
  FTimer := TROThreadTimer.Create(DoTimer, 2000);
end;

destructor TDevLayoutStatusBar.Destroy;
begin
  FreeAndNil(FTimer);
  FreeAndNil(FAppObserver);
  FreeAndNil(FLogObserver);
  FreeAndNil(FStatusBar);
  inherited;
end;

procedure TDevLayoutStatusBar.DoAppNotify(Sender: TObject);
begin
  // StatusBar的父窗体释放时，如自身还没释放，则会报错
  case AppCore.State of
    asBeginning, asRunning:
      FStatusBar.Parent := AppCore.MainView;
    asEnding:
      FStatusBar.Parent := nil;
  end;
end;

procedure TDevLayoutStatusBar.DoLogNotify(Sender: TObject);
const
  cLogImageName: array [TLogType] of string = ('debug', 'info',
    'warning', 'error');
begin
  FStatusBar.BeginUpdate;
  try
    with TLogInfo(Sender) do
    begin
      FStatusBar.Items[0].CaptionOptions.Text := cLogTypeText[LogType] +
        '-' + Text;
      TdxLayoutItem(FStatusBar.Items[0]).CaptionOptions.ImageIndex :=
        AppCore.LargeImage.IndexOf(cLogImageName[LogType]);
      FLastLogTime := Now;
    end;
  finally
    FStatusBar.EndUpdate;
  end;
  FStatusBar.Update;
end;

procedure TDevLayoutStatusBar.DoTimer(CurrentTickCount: Cardinal);
begin
  if SecondsBetween(Now, FLastLogTime) > 60 then
  begin
    FStatusBar.Items[0].Caption := '准备.';
    TdxLayoutItem(FStatusBar.Items[0]).CaptionOptions.ImageIndex := -1;
  end;
end;

function TDevLayoutStatusBar.GetBarCount: Integer;
begin
  Result := FStatusBar.Items.Count
end;

procedure TDevLayoutStatusBar.SetBarText(Index: Integer; Text: string);
begin
  if (Index >= FStatusBar.Items.Count) or (Index < 0) then
    Index := 0;
  FStatusBar.Items[Index].Caption := Text;
end;

// Position达到最大值时自动隐藏
// 最后必须保证Positon>=MaxValue，以便隐藏进度条

procedure TDevLayoutStatusBar.ShowProgress(MaxValue, Position: Integer);
begin
  if Position >= MaxValue - 1 then
  begin
    FProgressItem.Visible := False;
  end
  else
  begin
    FProgressItem.Visible := True;
    FProgress.Properties.Max := MaxValue;
    FProgress.Position := Position;
    FProgress.Update;
  end;
end;

{ TDevStatusBar }

function TDevStatusBar.AddBar(AWidth: Integer): Integer;
begin
  with FStatusBar.Panels.Add do
  begin
    Result := Index;
    MinWidth := AWidth;
  end;
end;

constructor TDevStatusBar.Create(AOwner: TComponent);
begin
  inherited;
  FLogObserver := TObserver.Create(DoLogNotify);
  FAppObserver := TObserver.Create(DoAppNotify);
  AppCore.StateSubject.Attach(FAppObserver);
  AppCore.Logger.LogSubject.Attach(FLogObserver);
  FStatusBar := TdxStatusBar.Create(nil);
  FStatusBar.ParentFont := False;
  FStatusBar.Font.Name := '宋体';
  FStatusBar.Font.Size := 10;
  FStatusBar.Images := AppCore.ToolBarImage.ImageList;
  FStatusBar.PaintStyle := stpsUseLookAndFeel;
  FStatusBar.Align := alBottom;
  FStatusBar.Height := AppCore.ToolBarImage.ImageList.Height + 8;

  with FStatusBar.Panels.Add do
  begin
    Fixed := False;
  end;

  // 创建进度条
  FProgress := TcxProgressBar.Create(FStatusBar);
  FProgress.Properties.BarStyle := cxbsGradient;
  FProgress.Properties.BeginColor := $00AAFFAA;
  FProgress.Properties.EndColor := $0000D328;

  FProgressPanel := FStatusBar.Panels.Add;
  with FProgressPanel do
  begin
    Visible := False;
    Width := 250;
    PanelStyleClass := TdxStatusBarContainerPanelStyle;
    FProgress.Parent := TdxStatusBarContainerPanelStyle(PanelStyle).Container;
    FProgress.Align := alClient;
  end;

  // 定时清除提示。
  FTimer := TROThreadTimer.Create(DoTimer, 2000);
end;

destructor TDevStatusBar.Destroy;
begin
  FreeAndNil(FTimer);
  FreeAndNil(FAppObserver);
  FreeAndNil(FLogObserver);
  FreeAndNil(FStatusBar);
  inherited;
end;

procedure TDevStatusBar.DoAppNotify(Sender: TObject);
begin
  // StatusBar的父窗体释放时，如自身还没释放，则会报错
  case AppCore.State of
    asBeginning, asRunning:
      FStatusBar.Parent := AppCore.MainView;
    asEnding:
      FStatusBar.Parent := nil;
  end;
end;

procedure TDevStatusBar.DoLogNotify(Sender: TObject);
begin
  with TLogInfo(Sender) do
  begin
    FStatusBar.Panels[0].Text := cLogTypeText[LogType] + '-' + Text;
    TdxStatusBarTextPanelStyle(FStatusBar.Panels[0].PanelStyle).ImageIndex :=
      AppCore.ToolBarImage.IndexOf(cLogImageName[LogType]);
  end;
  FLastLogTime := Now;
  FStatusBar.Update;
end;

procedure TDevStatusBar.DoTimer(CurrentTickCount: Cardinal);
begin
  if SecondsBetween(Now, FLastLogTime) > 60 then
  begin
    FStatusBar.Panels[0].Text := '准备.';
    TdxStatusBarTextPanelStyle(FStatusBar.Panels[0].PanelStyle)
      .ImageIndex := -1;
  end;
end;

function TDevStatusBar.GetBarCount: Integer;
begin
  Result := FStatusBar.Panels.Count
end;

procedure TDevStatusBar.SetBarText(Index: Integer; Text: string);
begin
  if (Index >= FStatusBar.Panels.Count) or (Index < 0) then
    Index := 0;
  FStatusBar.Panels[Index].Text := Text;
  if Index <> 0 then
    // todo: 自动设置面板的宽度
    FStatusBar.Panels[Index].Width := GetTextWidth(Text, FStatusBar.Font) + 16;
end;

procedure TDevStatusBar.ShowProgress(MaxValue, Position: Integer);
begin
  if Position >= MaxValue - 1 then
  begin
    FProgressPanel.Visible := False;
  end
  else
  begin
    FProgressPanel.Visible := True;
    FProgress.Properties.Max := MaxValue;
    FProgress.Position := Position;
    FProgress.Update;
  end;
end;

{ TDevAlertWindow }

constructor TDevAlertWindow.Create(AOwner: TComponent);
begin
  inherited;
  FAlertWindowManager := TdxAlertWindowManager.Create(Self);
  FAlertWindowManager.OptionsMessage.Images := AppCore.ToolBarImage.ImageList;
  FAlertWindowManager.WindowMaxCount := 10;
  FAlertWindowManager.WindowPosition := awpTopRight;
  FAlertWindowManager.OptionsAnimate.AlphaBlendValue := 255;
  FAlertWindowManager.OptionsAnimate.ShowingAnimation := awaSlide;
  FAlertWindowManager.OptionsBehavior.DisplayTime := 5000;

  FLogObserver := TObserver.Create(DoLogNotify);
  // FAppObserver := TObserver.Create(DoAppNotify);
  // AppCore.StateSubject.Attach(FAppObserver);
  AppCore.Logger.LogSubject.Attach(FLogObserver);
end;

destructor TDevAlertWindow.Destroy;
begin
  FreeAndNil(FAppObserver);
  FreeAndNil(FLogObserver);
  inherited;
end;

procedure TDevAlertWindow.DoAppNotify(Sender: TObject);
begin

end;

procedure TDevAlertWindow.DoLogNotify(Sender: TObject);
begin
  with TLogInfo(Sender) do
  begin
    if (Code > 0)
    // or (LogType > mtInfo)
    then
      FAlertWindowManager.Show(cLogTypeText[LogType], Text,
        AppCore.ToolBarImage.IndexOf(cLogImageName[LogType]))
  end;
end;

end.
