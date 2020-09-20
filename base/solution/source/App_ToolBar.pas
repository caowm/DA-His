unit App_ToolBar;

{
  根据View的Action自动创建工具栏，并显示View的标题

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
  Dialogs,
  ToolWin,
  ComCtrls,
  ImgList,
  Menus,
  Buttons,
  Contnrs,
  ActnList,
  App_Common,
  uROClasses,
  DateUtils,
  StdCtrls,
  ExtCtrls, System.Actions;

const
  sSimpleToolBar = 'SimpleToolBar';
  sSimpleStatusBar = 'SimpleStatusBar';
  sSimpleTitleBar = 'SimpleTitleBar';

type
  TSimpleToolBar = class(TForm)
    ToolBar: TToolBar;
    ActionList: TActionList;
    CloseAction: TAction;
    BackAction: TAction;
    ForwardAction: TAction;
    //LoggerAction: TAction;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ViewLabel: TLabel;
    ToolButton4: TToolButton;
    TreeAction: TAction;
    ViewImage: TImage;
    Bevel1: TBevel;
    procedure CloseActionExecute(Sender: TObject);
    procedure CloseActionUpdate(Sender: TObject);
    procedure BackActionExecute(Sender: TObject);
    procedure ForwardActionExecute(Sender: TObject);
    procedure ForwardActionUpdate(Sender: TObject);
    procedure LoggerActionExecute(Sender: TObject);
  private
    FAppObserver: TObserver;
    FViewObserver: TObserver;
    FViewTool: TToolBar;
    FViewMenu: TMenuItem;
    procedure OnAppNotify(Sender: TObject);
    procedure OnViewNotify(Sender: TObject);
    procedure BuildToolBar(AView: TBaseView);
    procedure SetTitle(AView: TBaseView);
  public
    constructor Create(AOwner: TComponent); override; 
    destructor Destroy(); override;
  end;

  TAppStatusBar = class
  private
    FLogObserver: TObserver;
    FAppObserver: TObserver;
    FStatusBar: TStatusBar;
    FOldStatusBarProc: TWndMethod;
    FTimer: TROThreadTimer;
    FLastLogTime: TDateTime;
    procedure DoAppNotify(Sender: TObject);
    procedure DoLogNotify(Sender: TObject);
    procedure DoStatusBarResize(Sender: TObject);
    procedure DoTimer(CurrentTickCount: Cardinal);
    procedure NewStatusBarProc(var Msg: TMessage);
  protected
    function GetBarCount(): Integer;
    procedure SetBarText(Index: Integer; Text: string);
  public
    constructor Create();
    destructor Destroy(); override;
    function AddBar(AWidth: Integer): Integer;
  end;

  TSimpleStatusBar = class(TPanel)
  private
    FLogObserver: TObserver;
    FAppObserver: TObserver;
    FTimer: TROThreadTimer;
    FLastLogTime: TDateTime;
    FLogoImage: TImage;
    FLogLabel: TLabel;
    FBevel: TBevel;
    procedure DoAppNotify(Sender: TObject);
    procedure DoLogNotify(Sender: TObject);
    procedure DoTimer(CurrentTickCount: Cardinal);
    procedure CMLogger(var Msg: TMessage); message CM_LOGGER;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy(); override;
  end;

  TSimpleTitleBar = class(TPanel)
  private
    FAppObserver: TObserver;
    FLogoImage: TImage;
    FBevel: TBevel;
    FMenuButton: TSpeedButton;
    FMenu: TPopupMenu;
    
    FOperationMenuContainerBucket: TObjectBucketList;
    FOperationObserver: TObserver;
    
    procedure DoAppNotify(Sender: TObject);
    procedure CreateMenu();
    procedure BuildSingleMenu(AOperation: TBaseOperation);
    procedure ClickMenuItem(Sender: TObject);
    procedure DoMenuButtonClick(Sender: TObject); 
    procedure UpdateOperationMenu(AOperation: TBaseOperation);
    procedure RemoveOperationMenu(AOperation: TBaseOperation);
    procedure DoOperationChange(Sender: TObject); virtual;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy(); override;

    property LogoImage: TImage read FLogoImage;
    property MenuButton: TSpeedButton read FMenuButton;
  end;

var
  SimpleTitleBar: TSimpleTitleBar;
  SimpleToolBar: TSimpleToolBar;
  SimpleStatusBar: TSimpleStatusBar;

implementation

{$R *.dfm}

{ TToolBarFrame }

constructor TSimpleToolBar.Create(AOwner: TComponent);
begin
  inherited;
  ViewLabel.Caption := '';
  FAppObserver := TObserver.Create(OnAppNotify);
  AppCore.StateSubject.Attach(FAppObserver);
  FViewObserver := TObserver.Create(OnViewNotify);
  ToolBar.Images := AppCore.ToolBarImage.ImageList;
  ToolBar.DisabledImages := AppCore.ToolBarImage.DisabledImages;
  CloseAction.ImageIndex := AppCore.ToolBarImage.IndexOf('closewindow');
  BackAction.ImageIndex := AppCore.ToolBarImage.IndexOf('back');
  ForwardAction.ImageIndex := AppCore.ToolBarImage.IndexOf('forward');
  //LoggerAction.ImageIndex := AppCore.ToolBarImage.IndexOf('log');
  Height := AppCore.IniFile.ReadInteger(sAppSection, 'ToolbarHeight', 40);
  Color := AppCore.IniFile.ReadInteger(sAppSection, 'ToolbarColor', $F4F0ED);
end;

destructor TSimpleToolBar.Destroy;
begin
  FAppObserver.Free;
  FViewObserver.Free;    
  inherited;
end;

procedure TSimpleToolBar.BuildToolBar(AView: TBaseView);

var
  I: Integer;
  Temp: TToolButton;
  Menu: TMenuItem;
begin
  FreeAndNil(FViewTool);
  FreeAndNil(FViewMenu);
  SetTitle(AView);

  if (AView = nil) or (AView.ViewActions = nil) or
    (AView.ViewActions.ActionCount = 0) then
    Exit;

  FViewTool := TToolBar.Create(Self);
  with FViewTool do
  begin
    Visible := False;
    List := True;
    ShowCaptions := True;
    Parent := Self;
    Flat := True;
    Align := alNone;
    EdgeBorders := [];
    Transparent := True;
    ButtonWidth := ToolBar.ButtonWidth;
    ButtonHeight := ToolBar.ButtonHeight;
    Images := AppCore.ToolBarImage.ImageList;
    DisabledImages := AppCore.ToolBarImage.DisabledImages;
    Width := ActionList.ActionCount * (ButtonWidth + 0);
    Left := Toolbar.Left - Width - 2;
    Top := Toolbar.Top;
  end;

  FViewMenu := TMenuItem.Create(Self);
  FViewMenu.Visible := False;
  FViewMenu.Caption := '业务';
  AppCore.MainView.MainMenu.Items.Add(FViewMenu);

  for I := 0 to AView.ViewActions.ActionCount - 1 do
    if TAction(AView.ViewActions[I]).Visible then
    begin
      if (I > 0) and (AView.ViewActions[I].Category <> AView.ViewActions[I - 1].Category) then
        with TToolButton.Create(FViewTool) do
        begin
          Style := tbsSeparator;
          Left := 2000;
          Parent := FViewTool;
        end;

      Temp := TToolButton.Create(FViewTool);
      Temp.Action := AView.ViewActions[I];
      Temp.AutoSize := True;
      Temp.Left := 2000;
      Temp.Parent := FViewTool;

      Menu := TMenuItem.Create(FViewMenu);
      Menu.Action := AView.ViewActions[I];
      FViewMenu.Add(Menu);
    end;

  with FViewTool do
  begin
    Visible := True;
    Width := 1000;
    AutoSize := True;
    Left := Toolbar.Left - FViewTool.Width - 2;
    Height := Toolbar.Height;
    Anchors := [akRight, akTop];
  end;
end;

procedure TSimpleToolBar.OnAppNotify(Sender: TObject);
begin
  case AppCore.State of
    asBeginning:
      begin
        AppCore.MainView.ViewSubject.Attach(FViewObserver);
        CloseAction.ActionList := AppCore.MainView.ActionList;
        BackAction.ActionList := AppCore.MainView.ActionList;
        ForwardAction.ActionList := AppCore.MainView.ActionList;
        //LoggerAction.ActionList := AppCore.MainView.ActionList;
        Parent := TWinControl(AppCore.MainView.FindChildControl('ClientPanel'));
        if Parent = nil then
          Parent := AppCore.MainView;
        Visible := True;
      end;
    asEnding:
      begin
        Visible := False;
        Parent := nil;
      end;
  end;
end;

procedure TSimpleToolBar.OnViewNotify(Sender: TObject);
begin
  BuildToolBar(TBaseView(Sender));
end;

procedure TSimpleToolBar.CloseActionExecute(Sender: TObject);
begin
  AppCore.MainView.CloseView;
end;

procedure TSimpleToolBar.CloseActionUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := AppCore.MainView.ActiveView <> nil;
end;

procedure TSimpleToolBar.BackActionExecute(Sender: TObject);
begin
  AppCore.MainView.PreviousView;
end;

procedure TSimpleToolBar.ForwardActionExecute(Sender: TObject);
begin
  AppCore.MainView.NextView;
end;

procedure TSimpleToolBar.ForwardActionUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := AppCore.MainView.ViewCount > 1;
end;

procedure TSimpleToolBar.LoggerActionExecute(Sender: TObject);
begin
  //AppCore.Logger.Show;
end;

procedure TSimpleToolBar.SetTitle(AView: TBaseView);
begin
  if AView = nil then
  begin
    ViewLabel.Caption := '';
    ViewImage.Picture.Bitmap := nil;
  end
  else
  begin
    ViewLabel.Caption := AView.Caption;

    with ViewImage.Picture.Bitmap do
    begin
      Width := AppCore.ToolBarImage.ImageList.Width;
      Height := AppCore.ToolBarImage.ImageList.Height;
      Canvas.Brush.Color := Color;
      Canvas.FillRect(Rect(0, 0, Width, Height));

      AppCore.ToolBarImage.ImageList.Overlay(
        AppCore.ToolBarImage.IndexOf(AView.ImageName), 0);

      AppCore.ToolBarImage.ImageList.DrawOverlay(
        Canvas, 0, 0,
        AppCore.ToolBarImage.IndexOf(AView.ImageName),
        0, ImgList.dsNormal, ImgList.itImage, True);
    end;

  end;
end;


{ TAppStatusBar }

function TAppStatusBar.AddBar(AWidth: Integer): Integer;
begin
  with FStatusBar.Panels.Add do
  begin
    Result := Index;
    Width := AWidth;
  end;
end;

constructor TAppStatusBar.Create;
var
  Panel: TStatusPanel;
begin
  inherited;
  FLogObserver := TObserver.Create(DoLogNotify);
  FAppObserver := TObserver.Create(DoAppNotify);
  AppCore.StateSubject.Attach(FAppObserver);
  AppCore.Logger.LogSubject.Attach(FLogObserver);
  FStatusBar := TStatusBar.Create(nil);
  FOldStatusBarProc := FStatusBar.WindowProc;
  FStatusBar.WindowProc := NewStatusBarProc;
  FStatusBar.BorderWidth := 0;
  FStatusBar.OnResize := DoStatusBarResize;
  Panel := FStatusBar.Panels.Add;
  Panel.Width := 128;
  Panel := FStatusBar.Panels.Add;
  Panel.Width := 192;
  Panel := FStatusBar.Panels.Add;
  Panel.Width := 128;
  FTimer := TROThreadTimer.Create(DoTimer, 2000);
end;

destructor TAppStatusBar.Destroy;
begin
  FTimer.Free;
  FAppObserver.Free;
  FLogObserver.Free;
  FStatusBar.Free;
  inherited;
end;

procedure TAppStatusBar.DoAppNotify(Sender: TObject);
begin
  //StatusBar的父窗体释放时，如自身还没释放，则会报错
  case AppCore.State of
    asBeginning, asRunning:
      begin
        FStatusBar.Parent := AppCore.MainView;
        FStatusBar.Color := $F7F1EC; //AppCore.MainView.Color;
      end;
    asEnding: FStatusBar.Parent := nil;
  end;
end;

procedure TAppStatusBar.DoLogNotify(Sender: TObject);
begin
  PostMessage(FStatusBar.Handle, CM_LOGGER, Integer(Sender), 0)
end;

procedure TAppStatusBar.DoStatusBarResize(Sender: TObject);
begin
  FStatusBar.Panels[0].Width := FStatusBar.Width -
    FStatusBar.Panels[1].Width - FStatusBar.Panels[2].Width;
end;

procedure TAppStatusBar.DoTimer(CurrentTickCount: Cardinal);
begin
  if SecondsBetween(Now, FLastLogTime) > 9 then
    FStatusBar.Panels[0].Text := '准备.'   
end;

function TAppStatusBar.GetBarCount: Integer;
begin
  Result := FStatusBar.Panels.Count
end;

procedure TAppStatusBar.NewStatusBarProc(var Msg: TMessage);
begin    
  if Msg.Msg = CM_LOGGER then
  begin
    with TLogInfo(Msg.WParam) do
    begin
      FStatusBar.Panels[0].Text := Text;
      FLastLogTime := Now;
      Free;
    end;
  end
  else
    FOldStatusBarProc(Msg);
end;

procedure TAppStatusBar.SetBarText(Index: Integer; Text: string);
begin
  if (Index >= FStatusBar.Panels.Count) or (Index < 0) then
    Index := 0;
  FStatusBar.Panels[Index].Text := Text;
end;

{ TSimpleStatusBar }

procedure TSimpleStatusBar.CMLogger(var Msg: TMessage);
begin
  with TLogInfo(Msg.WParam) do
  begin
    FLogLabel.Visible := True;
    FLogLabel.Caption := Text;
    case LogType of
      mtError: FLogLabel.Font.Color := clRed;
      mtWarning: FLogLabel.Font.Color := clPurple;
      else FLogLabel.Font.Color := clBlack;
    end;
    ReleaseRef;
  end;
  FLastLogTime := Now;
  //FLogLabel.Repaint;
end;

constructor TSimpleStatusBar.Create(AOwner: TComponent);
begin
  inherited;
  Color := AppCore.IniFile.ReadInteger(sAppSection, 'StatusBarColor', $F7F1EC);
  Height := AppCore.IniFile.ReadInteger(sAppSection, 'StatusBarHeight', 40);
  BorderStyle := bsNone;
  Align := alBottom;
  BevelOuter := bvNone;

  FLogObserver := TObserver.Create(DoLogNotify);
  FAppObserver := TObserver.Create(DoAppNotify);
  AppCore.StateSubject.Attach(FAppObserver);
  AppCore.Logger.LogSubject.Attach(FLogObserver);
  FTimer := TROThreadTimer.Create(DoTimer, 2000);
  FTimer.Synchronized := True;  // 

  FBevel := TBevel.Create(Self);
  FBevel.Parent := Self;
  FBevel.Align := alTop;
  FBevel.Shape := bsTopLine;
  FBevel.Height := 2;

  FLogoImage := TImage.Create(Self);
  FLogoImage.Parent := Self;
  FLogoImage.SetBounds(15, 4, 32, 32);
  FLogoImage.Stretch := False;
  //FLogoImage.AutoSize := True;
  FLogoImage.Align := alLeft;
  FLogoImage.Picture := AppCore.ImageCenter.Get('Logo.png');
  FLogoImage.Width := FLogoImage.Picture.Width;
  Height := FLogoImage.Picture.Height;
  
  FLogLabel := TLabel.Create(Self);
  FLogLabel.Parent := Self;
  FLogLabel.Alignment := taRightJustify;
  FLogLabel.WordWrap := True;
  FLogLabel.Transparent := True;
  FLogLabel.AutoSize := False;
  FLogLabel.Left := FLogoImage.Left + FLogoImage.Width + 4;
  FLogLabel.Top := FLogoImage.Top + 4;
  FLogLabel.Width := Width - FLogLabel.Left - 10;
  FLogLabel.Height := 40;
  FLogLabel.Anchors := [akLeft, akRight, akTop];
  //FLogLabel.Align := alBottom;

end;

destructor TSimpleStatusBar.Destroy;
begin       
  FTimer.Free;
  FAppObserver.Free;
  FLogObserver.Free;
  inherited;
end;

procedure TSimpleStatusBar.DoAppNotify(Sender: TObject);
begin
  case AppCore.State of
    asRunning: Parent := AppCore.MainView;
    asEnding: Parent := nil;
  end;
end;

procedure TSimpleStatusBar.DoLogNotify(Sender: TObject);
begin
  TLogInfo(Sender).AddRef;
  PostMessage(Handle, CM_LOGGER, Integer(Sender), 0)
end;

procedure TSimpleStatusBar.DoTimer(CurrentTickCount: Cardinal);
begin
  if SecondsBetween(Now, FLastLogTime) > 9 then
    //FLogLabel.Caption := '准备.'
    FLogLabel.Visible := False;
end;

{ TSimpleTitleBar }

procedure TSimpleTitleBar.BuildSingleMenu(AOperation: TBaseOperation);

procedure InternalBuild(AOperation: TBaseOperation; ARootMenu: TMenuItem);
var
  I: Integer;
  ParentMenu, ChildMenu: TMenuItem;
  SL: TStrings;
begin
  if not AOperation.Visible then Exit;

  SL := TStringList.Create;
  try
    SL.CommaText := AOperation.Category;
    ParentMenu := ARootMenu;
    for I := 0 to SL.Count - 1 do
    begin
      ChildMenu := ParentMenu.Find(SL[I]);
      if ChildMenu = nil then
      begin
        ChildMenu := TMenuItem.Create(Self);
        ChildMenu.Caption := SL[I];
        ParentMenu.Add(ChildMenu);
      end;
      ParentMenu := ChildMenu;
    end;
    ChildMenu := TMenuItem.Create(Self);
    FOperationMenuContainerBucket.Add(AOperation, ChildMenu);
    ChildMenu.Tag := Integer(AOperation);
    ChildMenu.Caption := AOperation.Caption;
    ChildMenu.Checked := AOperation.Checked;
    ChildMenu.ShortCut := AOperation.ShortKey;
    ChildMenu.OnClick := ClickMenuItem;
    ChildMenu.Enabled := AOperation.Enabled;
    ChildMenu.Visible := AOperation.Visible;
    ParentMenu.Add(ChildMenu);
  finally
    SL.Free;
  end;
end;

begin
  InternalBuild(AOperation, FMenu.Items);
end;

procedure TSimpleTitleBar.ClickMenuItem(Sender: TObject);
begin
  TBaseOperation(TMenuItem(Sender).Tag).Execute(0, []);
end;

constructor TSimpleTitleBar.Create(AOwner: TComponent);
begin
  inherited;
  Color := AppCore.IniFile.ReadInteger(sAppSection, 'TitleBarColor', $8D7D6F);
  Height := AppCore.IniFile.ReadInteger(sAppSection, 'TitleBarHeight', 50);
  BorderStyle := bsNone;
  Align := alTop;
  BevelOuter := bvNone;

  FAppObserver := TObserver.Create(DoAppNotify);
  AppCore.StateSubject.Attach(FAppObserver);
  
  FOperationMenuContainerBucket := TObjectBucketList.Create();
  FOperationObserver := TObserver.Create(DoOperationChange);
  
  FBevel := TBevel.Create(Self);
  FBevel.Parent := Self;
  FBevel.Align := alBottom;
  FBevel.Shape := bsBottomLine;
  FBevel.Height := 2;

  FLogoImage := TImage.Create(Self);
  FLogoImage.Parent := Self;
  //FLogoImage.SetBounds(15, 5, 20, 20);
  FLogoImage.Align := alLeft;
  FLogoImage.Stretch := False;
  //FLogoImage.AutoSize := True;
  FLogoImage.Picture := AppCore.ImageCenter.Get('Title.png');
  FLogoImage.Width := FLogoImage.Picture.Width;
  Height := FLogoImage.Picture.Height;

  FMenuButton := TSpeedButton.Create(Self);
  FMenuButton.Parent := Self;
  //FMenuButton.Caption := '开始';
  FMenuButton.Hint := '开始菜单';
  FMenuButton.Width := 60;
  FMenuButton.Height := 40;
  FMenuButton.Left := Width - FMenuButton.Width - 10;
  FMenuButton.Top := (Height - FMenuButton.Height) div 2;
  FMenuButton.Anchors := [akRight];
  FMenuButton.OnClick := DoMenuButtonClick;
  FMenuButton.Flat := True;
  FMenuButton.Align := alRight;
  FMenuButton.Glyph := AppCore.ImageCenter.GetBitmap('start.bmp');

  FMenu := TPopupMenu.Create(Self);
  // todo: 菜单的更新
end;

procedure TSimpleTitleBar.CreateMenu;
begin
  AppCore.Operations.ForEach(BuildSingleMenu);  
end;

destructor TSimpleTitleBar.Destroy;
begin               
  FAppObserver.Free;
  FOperationMenuContainerBucket.Free;
  FOperationObserver.Free;
  inherited;
end;

procedure TSimpleTitleBar.DoAppNotify(Sender: TObject);
begin
  case AppCore.State of
    asRunning: begin
      Parent := AppCore.MainView;
      AppCore.MainView.Menu := nil;
      CreateMenu;
      AppCore.Operations.OperationChanged.Attach(FOperationObserver);
    end;
    asEnding: Parent := nil;
  end;
end;

procedure TSimpleTitleBar.DoMenuButtonClick(Sender: TObject);
var
  P: TPoint;
begin
  P.X := FMenuButton.Left;
  P.Y := FMenuButton.Top + FMenuButton.Height;
  P := ClientToScreen(P);
  FMenu.Popup(P.X, P.Y);
end;


procedure TSimpleTitleBar.DoOperationChange(Sender: TObject);
begin
  case TBaseOperation(Sender).State of
    osCreating: BuildSingleMenu(TBaseOperation(Sender));
    osUpdating: UpdateOperationMenu(TBaseOperation(Sender));
    osRemoving: RemoveOperationMenu(TBaseOperation(Sender));
  end;
end;

procedure TSimpleTitleBar.RemoveOperationMenu(AOperation: TBaseOperation);
var
  MenuItem: TMenuItem;
begin
  if FOperationMenuContainerBucket.Exists(AOperation) then
  begin
    MenuItem := TMenuItem(FOperationMenuContainerBucket.Data[AOperation]);
    MenuItem.Free; // 子菜单？？？
  end;
end;

procedure TSimpleTitleBar.UpdateOperationMenu(AOperation: TBaseOperation);
var
  MenuItem: TMenuItem;
begin
  if FOperationMenuContainerBucket.Exists(AOperation) then
  begin
    MenuItem := TMenuItem(FOperationMenuContainerBucket.Data[AOperation]);
    if (MenuItem <> nil) then
    begin
      MenuItem.Enabled := AOperation.Enabled;
      MenuItem.Checked := AOperation.Checked;
      MenuItem.Caption := AOperation.Caption;
      MenuItem.Visible := AOperation.Visible;
      MenuItem.ImageIndex :=
        AppCore.ToolBarImage.IndexOf(AOperation.ImageName);
    end;
  end
end;

initialization
//  SimpleTitleBar := TSimpleTitleBar.Create(Application);
//  SimpleToolBar := TSimpleToolBar.Create(Application);
//  SimpleStatusBar := TSimpleStatusBar.Create(Application);

end.

