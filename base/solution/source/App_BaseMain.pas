unit App_BaseMain;

{
  基础主窗体

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
  ExtCtrls,
  AppEvnts,
  Menus,
  XPMan,
  Contnrs,
{$IFDEF LoadPlugin}
  App_PluginManager,
  App_Plugin,
{$ENDIF}
  App_Common,
  ActnList, System.Actions;

const
  WM_SHOWVIEW = WM_USER + 1;
  WM_ParentResize = WM_USER + 2;

type

  TAppBaseMain = class(TMainView)
    MainMenu: TMainMenu;
    ActionList: TActionList;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    FOperationMenuContainer: TComponent;

    procedure DoShortCut(var Msg: TWMKey; var Handled: Boolean);
    
    procedure SortByTextActionExecute(Sender: TObject);
    procedure SortByOrderActionExecute(Sender: TObject);
    procedure SortByClickActionExecute(Sender: TObject);
    procedure BuildSingleMenu(AOperation: TBaseOperation; ARootMenu: TMenuItem);
    procedure BuildMultiMenu(AOperation: TBaseOperation);
    procedure UpdateOperationMenu(AOperation: TBaseOperation);
    procedure RemoveOperationMenu(AOperation: TBaseOperation);
    procedure ClickMenuItem(Sender: TObject);
{$IFDEF LoadPlugin}
    FPluginMgr: TPluginManager;

    procedure LoadPlugins();
    procedure BuildPluginCommand();
    procedure BuildCommandMenu(APlugIn: TPlugIn; ACommand: TPluginCommand);
    procedure ClickPluginCommand(Sender: TObject);
    procedure OnLoadPlugin(Sender: TObject; FileName: string; var AllowLoad: Boolean);
    procedure DoCommandChange(Sender: TObject);
{$ENDIF}
  protected
    FFirstOperation: string;
    FLastClicked: TBaseOperation;
    FViewSubject: TSubject;
    FActiveView: TBaseView;
    FOpenedViews: TObjectList;

    FOperationMenuContainerBucket: TObjectBucketList;
    FOperationObserver: TObserver;

    procedure BuildOperationMenu(); virtual;
    procedure DoOperationChange(Sender: TObject); virtual;

    procedure WMSHOWVIEW(var Msg: TMessage); message WM_SHOWVIEW;   
    procedure WMParentResize(var Msg: TMessage); message WM_ParentResize;
    procedure InternalShowView(View: TBaseView); virtual;

    procedure LoadState(); virtual;
    procedure SaveState(); virtual;
    procedure SetTitle(const AText: string); virtual;
    procedure SyncView(View: TBaseView); virtual;
    function HideView(): TBaseView; virtual;
    procedure GoForward(); virtual;
    procedure GoBackward(); virtual;
    procedure SaveLastClickedView(AView: TBaseView);

    function GetViewSubject: TSubject; override;
    function GetActiveView: TBaseView; override;
    function GetMainMenu: TMainMenu; override;
    function GetActionList: TActionList; override;
    function GetViewCount(): Integer; override;
  public
    procedure ShowView(View: TBaseView); override;
    procedure CloseView(); override;
    procedure PreviousView(); override;
    procedure NextView(); override;
    procedure HideAllView(); override;

    procedure ShowSide(Side: TMainSide; Form: TForm); override;
    procedure CloseSide(Form: TForm); override;
  end;

var
  AppBaseMain: TAppBaseMain;

implementation

{$R *.dfm}

type

  TBaseViewHack = class(TBaseView);

  { TMainForm }

procedure TAppBaseMain.ShowView(View: TBaseView);
begin
  // 方便切换界面
  PostMessage(Handle, WM_SHOWVIEW, Integer(View), 0);
end;

procedure TAppBaseMain.SetTitle(const AText: string);
begin
  Caption := Application.Title + AppCore.ID;
  if AText <> '' then
    Caption := Caption + ' - ' + AText;
end;

procedure TAppBaseMain.FormCreate(Sender: TObject);
begin
  Caption := Application.Title + '[' + AppCore.ID + ':' + AppCore.Version + ']';
  OnShortCut := DoShortCut; // 解决嵌入的BaseView的按键问题
  FViewSubject := TSubject.Create;
  FOperationMenuContainerBucket := TObjectBucketList.Create();
  FOperationObserver := TObserver.Create(DoOperationChange);
  FOpenedViews := TObjectList.Create(False);

  ActionList.Images := AppCore.ToolBarImage.ImageList;
  AppCore.MainView := Self; ////AppCore

{$IFDEF LoadPlugin}
  LoadPlugins(); ////
{$ENDIF}   
  AppCore.State := asBeginning;
 
end;

procedure TAppBaseMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SaveState;
  //try
    AppCore.State := asAskQuit;
  //except
    //AppCore.State := asRunning;
    //raise;
  //end;
  
  //AppCore.Logger.Write('主窗体关闭');
end;

procedure TAppBaseMain.BuildOperationMenu;
begin
  FOperationMenuContainer.Free;
  FOperationMenuContainerBucket.Clear;
  FOperationMenuContainer := TComponent.Create(Self);
  FOperationMenuContainer.Name := 'OperationMenu';
  AppCore.Operations.ForEach(BuildMultiMenu);
end;

procedure TAppBaseMain.LoadState;
begin
  with AppCore.IniFile do
  begin
    if Align <> alClient then
      SetBounds(ReadInteger(sAppSection, 'Left', Left),
        ReadInteger(sAppSection, 'Top', Top),
        ReadInteger(sAppSection, 'Width', Width),
        ReadInteger(sAppSection, 'Height', Height));

    if ReadBool(sAppSection, 'WindowState', False) then
      WindowState := wsMaximized;

    Font.Name := ReadString(sAppSection, 'FontName', '宋体');
    Font.Size := ReadInteger(sAppSection, 'FontSize', 10);
    Font.Color := ReadInteger(sAppSection, 'FontColor', clBlack);
    Color := ReadInteger(sAppSection, 'Color', Color);

    FFirstOperation := ReadString(sAppSection, 'FirstOperation', '');

    FLastClicked := TViewOperation(AppCore.Operations.SearchOperation(
      ReadString(sAppSection, 'LastItem', '')));
  end;
end;

procedure TAppBaseMain.SaveState;
begin
  with AppCore.IniFile do
  begin
    WriteBool(sAppSection, 'WindowState', WindowState = wsMaximized);
    if WindowState <> wsMaximized then
    begin
      WriteInteger(sAppSection, 'Left', Left);
      WriteInteger(sAppSection, 'Top', Top);
      WriteInteger(sAppSection, 'Width', Width);
      WriteInteger(sAppSection, 'Height', Height);
    end;

    WriteString(sAppSection, 'FontName', Font.Name);
    WriteInteger(sAppSection, 'FontSize', Font.Size);
    WriteInteger(sAppSection, 'FontColor', Font.Color);

    if FLastClicked = nil then
      WriteString(sAppSection, 'LastItem', '')
    else
      WriteString(sAppSection, 'LastItem', FLastClicked.GUID);
  end;
end;

{$IFDEF LoadPlugin}

procedure TAppBaseMain.LoadPlugins;
begin
  FPluginMgr := TPluginManager.Create(Self);
  FPluginMgr.PluginObject := AppCore;
  FPluginMgr.PluginKind := plgPackage;
  FPluginMgr.PluginFolder := AppCore.AppPath + 'plugin\';
  FPluginMgr.OnBeforeLoad := OnLoadPlugin;
  FPluginMgr.LoadPlugins;
end;

procedure TAppBaseMain.BuildCommandMenu(APlugIn: TPlugIn; ACommand:
  TPluginCommand);
var
  I: integer;
  SL: TStrings;
  ParentMenu, ChildMenu: TMenuItem;
begin
  SL := TStringList.Create;
  try
    SL.CommaText := ACommand.Caption;
    if SL.Count = 1 then SL.Insert(0, APlugin.Description);

    ParentMenu := MainMenu.Items.Find(SL[0]);
    if ParentMenu = nil then
    begin
      ParentMenu := TMenuItem.Create(MainMenu);
      ParentMenu.Caption := SL[0];
      MainMenu.Items.Add(ParentMenu);
    end;

    for I := 1 to SL.Count - 2 do
    begin
      ChildMenu := ParentMenu.Find(SL[I]);
      if ChildMenu = nil then
      begin
        ChildMenu := TMenuItem.Create(MainMenu);
        ChildMenu.Caption := SL[I];
        ParentMenu.Add(ChildMenu);
      end;
      ParentMenu := ChildMenu;
    end;

    ChildMenu := TMenuItem.Create(MainMenu);
    ACommand.Data := ChildMenu;
    ChildMenu.Tag := Integer(ACommand);
    ChildMenu.Enabled := ACommand.Enabled;
    ChildMenu.Caption := SL[SL.Count - 1];
    ChildMenu.ShortCut := ACommand.ShortCut;
    ChildMenu.OnClick := ClickPluginCommand;
    ACommand.OnChange := DoCommandChange;
    ParentMenu.Add(ChildMenu);
  finally
    SL.Free;
  end;
end;

procedure TAppBaseMain.BuildPluginCommand;
var
  I, J: Integer;
  Plugin: TPlugin;
begin
  for I := 0 to FPluginMgr.PluginCount - 1 do
  begin
    Plugin := TPlugin(FPluginMgr.Plugins[I]);
    if Plugin.Commands.Count = 0 then Continue;

    for J := 0 to Plugin.Commands.Count - 1 do
      BuildCommandMenu(Plugin, Plugin.Commands[J]);
  end;
end;

procedure TAppBaseMain.ClickPluginCommand(Sender: TObject);
begin
  TPluginCommand(TMenuItem(Sender).Tag).Execute;
end;

procedure TAppBaseMain.OnLoadPlugin(Sender: TObject; FileName: string; var
  AllowLoad: Boolean);
begin
  AppCore.Logger.Write('加载插件: ' + FileName);
end;

procedure TAppBaseMain.DoCommandChange(Sender: TObject);
begin
  with (TPluginCommand(Sender).Data as TMenuItem) do
  begin
    Enabled := TPluginCommand(Sender).Enabled;
    //Caption := TPluginCommand(Sender).Caption;
    Hint := TPluginCommand(Sender).Hint;
  end;
end;

{$ENDIF}

procedure TAppBaseMain.FormDestroy(Sender: TObject);
begin
  AppCore.State := asEnding;

  //AppCore.Logger.Write('主窗体释放');
  FOperationMenuContainerBucket.Free;
  FViewSubject.Free;
  FOperationObserver.Free;
  FOpenedViews.Free;
  AppCore.MainView := nil;
{$IFDEF LoadPlugin}
  FPluginMgr.Free;
{$ENDIF}
end;

procedure TAppBaseMain.ClickMenuItem(Sender: TObject);
begin
  TBaseOperation(TMenuItem(Sender).Tag).Execute(0, []);
end;

procedure TAppBaseMain.SyncView(View: TBaseView);
begin
  SetTitle(View.Caption);
end;

procedure TAppBaseMain.DoOperationChange(Sender: TObject);
begin
  case TBaseOperation(Sender).State of
    osCreating: BuildMultiMenu(TBaseOperation(Sender));
    osUpdating: UpdateOperationMenu(TBaseOperation(Sender));
    osRemoving: RemoveOperationMenu(TBaseOperation(Sender));
  end;
end;

procedure TAppBaseMain.GoBackward;
var
  I: Integer;
begin
  if FOpenedViews.Count > 1 then
  begin
    I := FOpenedViews.IndexOf(FActiveView);
    Dec(I);
    if I < 0 then I := FOpenedViews.Count - 1;
    ShowView(TBaseView(FOpenedViews[I]));
  end;
end;

procedure TAppBaseMain.GoForward;
var
  I: Integer;
begin
  if FOpenedViews.Count > 1 then
  begin
    I := FOpenedViews.IndexOf(FActiveView);
    Inc(I);
    if I > FOpenedViews.Count - 1 then I := 0;
    ShowView(TBaseView(FOpenedViews[I]));
  end;
end;

procedure TAppBaseMain.SortByTextActionExecute(Sender: TObject);
begin
  AppCore.Operations.SortByCaption;
  BuildOperationMenu;
  AppCore.State := asRunning;
end;

procedure TAppBaseMain.SortByOrderActionExecute(Sender: TObject);
begin
  AppCore.Operations.SortByOrder;
  BuildOperationMenu;
  AppCore.State := asRunning;
end;

procedure TAppBaseMain.SortByClickActionExecute(Sender: TObject);
begin
  AppCore.Operations.SortByClick;
  BuildOperationMenu;
  AppCore.State := asRunning;
end;

procedure TAppBaseMain.FormShow(Sender: TObject);
begin

{$IFDEF LoadPlugin}
  BuildPluginCommand;
{$ENDIF}

  AppCore.State := asRunning;

  //AppCore.Logger.Write('准备主窗体');

  LoadState;

  //放在asRunning之后，
  BuildOperationMenu;
  AppCore.Operations.OperationChanged.Attach(FOperationObserver);

  if (FFirstOperation <> '') and
    (AppCore.Operations.SearchOperation(FFirstOperation) <> nil) then
    AppCore.Operations.SearchOperation(FFirstOperation).Execute(iOperationCommand_Default, [])
  else if (FLastClicked <> nil) and FLastClicked.Visible then
    FLastClicked.Execute(iOperationCommand_Default, []);

  //AppCore.Logger.Write('完成主窗体');
end;

procedure TAppBaseMain.HideAllView;
begin
  HideView;
end;

function TAppBaseMain.GetActiveView: TBaseView;
begin
  Result := FActiveView;
end;

function TAppBaseMain.HideView: TBaseView;
begin
  if (FActiveView <> nil) then
  begin
    Result := FActiveView;
    TBaseViewHack(Result).DoHideView;
    Result.Hide;
    SetTitle('');
    FActiveView := nil;
    //FLastClicked := nil;
    Result.State := vsHiding;
    FViewSubject.Notify(Result);
  end
  else
    Result := nil;
end;

function TAppBaseMain.GetMainMenu: TMainMenu;
begin
  Result := MainMenu;
end;

function TAppBaseMain.GetActionList: TActionList;
begin
  Result := ActionList;
end;

function TAppBaseMain.GetViewSubject: TSubject;
begin
  Result := FViewSubject;
end;

procedure TAppBaseMain.BuildMultiMenu(AOperation: TBaseOperation);
var
  I: integer;
  ParentMenu, ChildMenu: TMenuItem;
  SL: TStrings;
begin
  if not AOperation.Visible or
    ((AOperation.Flag and iOperationFlag_NoMenu) <> 0) then
    Exit;

  SL := TStringList.Create;
  try
    if AOperation.Category = '' then
      SL.CommaText := '常规'
    else
      SL.CommaText := AOperation.Category;
    ParentMenu := MainMenu.Items.Find(SL[0]);
    if ParentMenu = nil then
    begin
      ParentMenu := TMenuItem.Create(FOperationMenuContainer);
      ParentMenu.Caption := SL[0];
      MainMenu.Items.Add(ParentMenu);
    end;

    for I := 1 to SL.Count - 1 do
    begin
      ChildMenu := ParentMenu.Find(SL[I]);
      if ChildMenu = nil then
      begin
        ChildMenu := TMenuItem.Create(FOperationMenuContainer);
        ChildMenu.Caption := SL[I];
        ParentMenu.Add(ChildMenu);
      end;
      ParentMenu := ChildMenu;
    end;

    ChildMenu := TMenuItem.Create(FOperationMenuContainer);
    ChildMenu.Tag := Integer(AOperation);
    FOperationMenuContainerBucket.Add(AOperation, ChildMenu);
    ChildMenu.Caption := AOperation.Caption;
    ChildMenu.Checked := AOperation.Checked;
    ChildMenu.ShortCut := AOperation.ShortKey;
    ChildMenu.Visible := AOperation.Visible;
    ChildMenu.OnClick := ClickMenuItem;
    ChildMenu.Enabled := AOperation.Enabled;
    ParentMenu.Add(ChildMenu);
  finally
    SL.Free;
  end;
end;

procedure TAppBaseMain.BuildSingleMenu(AOperation: TBaseOperation; ARootMenu: TMenuItem);
var
  I: Integer;
  ParentMenu, ChildMenu: TMenuItem;
  SL: TStrings;
begin
  if not AOperation.Visible or
    ((AOperation.Flag and iOperationFlag_NoMenu) <> 0) then
    Exit;

  SL := TStringList.Create;
  try
    SL.CommaText := AOperation.Category;
    ParentMenu := ARootMenu;
    for I := 0 to SL.Count - 1 do
    begin
      ChildMenu := ParentMenu.Find(SL[I]);
      if ChildMenu = nil then
      begin
        ChildMenu := TMenuItem.Create(FOperationMenuContainer);
        ChildMenu.Caption := SL[I];
        ParentMenu.Add(ChildMenu);
      end;
      ParentMenu := ChildMenu;
    end;
    ChildMenu := TMenuItem.Create(FOperationMenuContainer);    
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

procedure TAppBaseMain.CloseView;
var
  Temp: TBaseView;
  I: Integer;
begin
  if FActiveView = nil then Exit;
  Temp := FActiveView;
  HideView;
  I := FOpenedViews.IndexOf(Temp);
  FOpenedViews.Remove(Temp);
  if Temp.FreeOnClose then
    Temp.Free;
  if FOpenedViews.Count > 0 then
  begin
    if I > FOpenedViews.Count - 1 then
      Dec(I);
    ShowView(TBaseView(FOpenedViews[I]));
  end;
end;

procedure TAppBaseMain.NextView;
begin
  GoForward;
end;

procedure TAppBaseMain.PreviousView;
begin
  GoBackward;
end;

function TAppBaseMain.GetViewCount: Integer;
begin
  Result := FOpenedViews.Count;
end;

procedure TAppBaseMain.ShowSide(Side: TMainSide; Form: TForm);
begin

end;

procedure TAppBaseMain.CloseSide(Form: TForm);
begin

end;

procedure TAppBaseMain.WMSHOWVIEW(var Msg: TMessage);
begin
  InternalShowView(TBaseView(Msg.wParam));
end;

procedure TAppBaseMain.InternalShowView(View: TBaseView);
begin
  if (View <> FActiveView) then
  begin
    HideView;
    View.Parent := Self;
    View.Align := alClient;
    View.BorderStyle := bsNone;
    View.BorderWidth := 2;
    View.AutoScroll := True;
    View.Font := Font;
  end;
  if FOpenedViews.IndexOf(View) < 0 then
    FOpenedViews.Add(View);
  FActiveView := View;

  SaveLastClickedView(FActiveView);
  
  View.Color := Color;
  View.Visible := True;
  SetTitle(View.Caption);
  TBaseViewHack(View).DoShowView;
  View.State := vsShowing;
  FViewSubject.Notify(View);
end;

procedure TAppBaseMain.DoShortCut(var Msg: TWMKey; var Handled: Boolean);
begin
  if (ActiveView <> nil) and (ActiveView.Parent <> nil) then
  begin
    Handled := ActiveView.IsShortCut(Msg);
  end;
end;

procedure TAppBaseMain.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (ActiveView <> nil) and (ActiveView.Parent <> nil) and
    Assigned(ActiveView.OnKeyDown) then
  begin
    // ActiveView能得到KeyDown事件了, 再调用会触发两次
    // ActiveView.OnKeyDown(Sender, Key, Shift);
  end;
end;

procedure TAppBaseMain.UpdateOperationMenu(AOperation: TBaseOperation);
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

procedure TAppBaseMain.RemoveOperationMenu(AOperation: TBaseOperation);
var
  MenuItem: TMenuItem;
begin
  if FOperationMenuContainerBucket.Exists(AOperation) then
  begin
    MenuItem := TMenuItem(FOperationMenuContainerBucket.Data[AOperation]);
    MenuItem.Free; // 子菜单？？？
  end;
end;

procedure TAppBaseMain.WMParentResize(var Msg: TMessage);
var
  R: TRect;
begin
  Windows.GetClientRect(ParentWindow, R);
  SetBounds(0, 0, R.Right, R.Bottom);
end;

procedure TAppBaseMain.SaveLastClickedView(AView: TBaseView);
begin
  if (AView.Operation <> nil) and AView.Operation.Visible and
    ((AView.Operation.Flag and iOperationFlag_NoMenu) = 0) then
    FLastClicked := AView.Operation;
end;

end.

