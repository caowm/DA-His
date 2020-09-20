unit App_Dev_Main;

{
  用DevExpress构建的主窗体

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
  Contnrs,
  App_Common,
  App_BaseMain,
  App_DevExpress,
  ActnList,
  Menus,
  cxGraphics,
  cxControls,
  cxLookAndFeels,
  cxLookAndFeelPainters,
  cxSplitter,
  cxPC,
  ExtCtrls,
  cxPCdxBarPopupMenu,
  dxStatusBar,
  cxClasses,
  dxBar, ImgList, dxBarBuiltInMenu, System.Actions;

type
  TDevMain = class(TAppBaseMain)
    LeftPage: TcxPageControl;
    RightPage: TcxPageControl;
    BottomPage: TcxPageControl;
    LeftSplitter: TcxSplitter;
    RightSplitter: TcxSplitter;
    BottomSplitter: TcxSplitter;
    ClientPage: TcxPageControl;
    LeftPanel: TPanel;
    RightPanel: TPanel;
    BottomPanel: TPanel;
    ClientPanel: TPanel;
    BarManager: TdxBarManager;
    MenuBar: TdxBar;
    procedure ClientPageChange(Sender: TObject);
    procedure ClientPagePageChanging(Sender: TObject; NewPage: TcxTabSheet;
      var AllowChange: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ClientPageDblClick(Sender: TObject);
  private
    FBarButtonList: TObjectList;

    function FindViewPageIndex(View: TBaseView): Integer;
    procedure SetSide();
    procedure ClickOperationBarButton(Sender: TObject);
  protected

    procedure BuildMultiMenuOperation(AOperation: TBaseOperation);
    procedure UpdateOperationMenu(AOperation: TBaseOperation);
    procedure RemoveOperationMenu(AOperation: TBaseOperation);
    procedure BuildOperationMenu(); override;
    procedure DoOperationChange(Sender: TObject); override;
    procedure LoadState(); override;
    procedure SaveState(); override;
    function GetActiveView: TBaseView; override;
    procedure InternalShowView(View: TBaseView); override;
  public
    procedure CloseView(); override;
    procedure PreviousView(); override;
    procedure NextView(); override;
    procedure HideAllView(); override;

    procedure ShowSide(Side: TMainSide; Form: TForm); override;
    procedure CloseSide(Form: TForm); override;
  end;

var
  DevMain: TDevMain;

implementation

{$R *.dfm}

type
  THackView = class(TBaseView);

  { TDevMain }

procedure TDevMain.LoadState;
begin
  inherited;
  with AppCore.IniFile do
  begin
    LeftPanel.Width := ReadInteger(sAppSection, 'LeftSide', LeftPanel.Width);
    RightPanel.Width := ReadInteger(sAppSection, 'RightSide', RightPanel.Width);
    BottomPanel.Height := ReadInteger(sAppSection, 'BottomSide',
      BottomPanel.Height);
    ClientPage.HideTabs := ReadBool(sAppSection, 'HideTabs', False);
  end;
  SetSide();
end;

procedure TDevMain.SaveState;
begin
  try
    inherited;
    with AppCore.IniFile do
    begin
      WriteInteger(sAppSection, 'LeftSide', LeftPanel.Width);
      WriteInteger(sAppSection, 'RightSide', RightPanel.Width);
      WriteInteger(sAppSection, 'BottomSide', BottomPanel.Height);
      WriteBool(sAppSection, 'HideTabs', ClientPage.HideTabs);
    end;
  except
  end;
end;

procedure TDevMain.SetSide;
begin
  LeftPanel.Visible := LeftPage.PageCount > 0;
  LeftSplitter.Visible := LeftPanel.Visible;
  LeftSplitter.Left := LeftPanel.Width + 2;
  LeftPage.Properties.HideTabs := LeftPage.PageCount < 2;

  RightPanel.Visible := RightPage.PageCount > 0;
  RightSplitter.Visible := RightPanel.Visible;
  RightSplitter.Left := 0;
  RightPage.Properties.HideTabs := RightPage.PageCount < 2;

  BottomPanel.Visible := BottomPage.PageCount > 0;
  BottomSplitter.Visible := BottomPanel.Visible;
  BottomSplitter.Top := BottomPanel.Top + 2;
  BottomPage.Properties.HideTabs := BottomPage.PageCount < 2;
end;

procedure TDevMain.ShowSide(Side: TMainSide; Form: TForm);
var
  MainPage: array [TMainSide] of TcxPageControl;
  MainSplitter: array [TMainSide] of TcxSplitter;
  Sheet: TcxTabSheet;
begin
  MainPage[msLeft] := LeftPage;
  MainPage[msRight] := RightPage;
  MainPage[msBottom] := BottomPage;
  MainSplitter[msLeft] := LeftSplitter;
  MainSplitter[msRight] := RightSplitter;
  MainSplitter[msBottom] := BottomSplitter;

  Form.BorderStyle := bsNone;
  Form.Align := alClient;

  if (Form.Parent is TcxTabSheet) then
  begin
    Sheet := TcxTabSheet(Form.Parent);
    if (Sheet.PageControl <> MainPage[Side]) then
    begin
      Form.Visible := False;
      Form.Parent := nil;
      Sheet.Free;
    end;
  end;

  if (not(Form.Parent is TcxTabSheet)) then
  begin
    Sheet := TcxTabSheet.Create(MainPage[Side]);
    Sheet.PageControl := MainPage[Side];
    Sheet.BorderWidth := 2;
    Sheet.Caption := Form.Caption;
    Form.Parent := Sheet;
    Form.Font := Font;
    Form.Visible := True;
  end;

  SetSide();
end;

procedure TDevMain.CloseSide(Form: TForm);
var
  Sheet: TcxTabSheet;
begin
  if (Form.Parent is TcxTabSheet) then
  begin
    Sheet := TcxTabSheet(Form.Parent);
    Form.Visible := False;
    Form.Parent := nil;
    Sheet.Free;
    SetSide();
  end;
end;

procedure TDevMain.InternalShowView(View: TBaseView);
var
  I: Integer;
  Sheet: TcxTabSheet;
begin
  I := FindViewPageIndex(View);

  if I < 0 then
  begin
    Sheet := TcxTabSheet.Create(ClientPage);
    Sheet.Caption := View.Caption;
    Sheet.ImageIndex := AppCore.SmallImage.IndexOf(View.ImageName);
    Sheet.BorderWidth := 2;
    Sheet.PageControl := ClientPage;
    // 安排在当前Page的后面
    if ClientPage.PageCount > 2 then
      Sheet.PageIndex := ClientPage.ActivePageIndex + 1;
    ClientPage.ActivePage := Sheet;

    View.Parent := Sheet;
    View.Align := alClient;
    View.BorderStyle := bsNone;
    View.AutoScroll := True;
    View.Font := Font;
    View.Color := Color;
    View.Visible := True;

    Sheet.Tag := Integer(View); // Tag=0时PageChange事件不执行动作
    ClientPageChange(Sheet);
  end
  else if ClientPage.ActivePageIndex = I then
    ClientPageChange(nil)
  else
  begin
    ClientPage.ActivePageIndex := I;
  end;

  SaveLastClickedView(View);

  SetTitle(View.Caption);
end;

procedure TDevMain.ClientPageChange(Sender: TObject);
begin
  SetTitle('');
  if (ClientPage.ActivePage = nil) or
    (THackView(ClientPage.ActivePage.Tag) = nil) then
    Exit;

  with THackView(ClientPage.ActivePage.Tag) do
  begin
    SetTitle(Caption);
    DoShowView();
    State := vsShowing;
  end;
  FViewSubject.Notify(THackView(ClientPage.ActivePage.Tag));

  SaveLastClickedView(TBaseView(ClientPage.ActivePage.Tag));
end;

procedure TDevMain.ClientPagePageChanging(Sender: TObject; NewPage: TcxTabSheet;
  var AllowChange: Boolean);
begin
  if (ClientPage.ActivePage = nil) or
    (THackView(ClientPage.ActivePage.Tag) = nil) then
    Exit;

  with THackView(ClientPage.ActivePage.Tag) do
  begin
    DoHideView();
    State := vsHiding;
  end;

  FViewSubject.Notify(THackView(ClientPage.ActivePage.Tag));
end;

procedure TDevMain.CloseView;
begin
  if (ClientPage.ActivePage = nil) or
    (THackView(ClientPage.ActivePage.Tag) = nil) then
    Exit;

  with THackView(ClientPage.ActivePage.Tag) do
  begin
    DoHideView();
    State := vsHiding;
    FViewSubject.Notify(TObject(ClientPage.ActivePage.Tag));
    ClientPage.ActivePage.Tag := 0;
    if FreeOnClose then
      Free()
    else
      Close();
    ClientPage.ActivePage.Free;
  end;
end;

function TDevMain.FindViewPageIndex(View: TBaseView): Integer;
var
  I: Integer;
begin
  Result := -1;
  for I := 0 to ClientPage.PageCount - 1 do
    if ClientPage.Pages[I].Tag = Integer(View) then
    begin
      Result := I;
      break;
    end;
end;

procedure TDevMain.HideAllView;
begin
  ClientPage.Visible := False;
end;

procedure TDevMain.NextView;
begin
  ClientPage.SelectNextPage(True);
end;

procedure TDevMain.PreviousView;
begin
  ClientPage.SelectNextPage(False);
end;

function TDevMain.GetActiveView: TBaseView;
begin
  if ClientPage.PageCount = 0 then
    Result := nil
  else
    Result := TBaseView(ClientPage.ActivePage.Tag);
end;

procedure TDevMain.FormCreate(Sender: TObject);
begin
  DevExpress.BarManager := BarManager;
  ClientPage.Images := AppCore.SmallImage.ImageList;
  BarManager.ImageOptions.Images := AppCore.ToolBarImage.ImageList;
  FBarButtonList := TObjectList.Create(False);
  inherited;
end;

procedure TDevMain.BuildOperationMenu;
var
  I: Integer;
begin
  FOperationMenuContainerBucket.Clear;
  FBarButtonList.OwnsObjects := True;
  FBarButtonList.Clear;
  AppCore.Operations.ForEach(BuildMultiMenuOperation);
  FBarButtonList.OwnsObjects := False;
end;

procedure TDevMain.BuildMultiMenuOperation(AOperation: TBaseOperation);
var
  SL: TStrings;
  BarItem: TdxBarItem;

  function FindSubItemByName(SL: TStrings): TdxBarSubItem;
  var
    I, J: Integer;
    ParentLinks: TdxBarItemLinks;
  begin
    ParentLinks := MenuBar.ItemLinks;
    for I := 0 to SL.Count - 1 do
    begin
      Result := nil;

      for J := 0 to ParentLinks.Count - 1 do
      begin
        if (CompareText(ParentLinks.Items[J].Item.Caption, SL[I]) = 0) and
          ParentLinks.Items[J].Item.InheritsFrom(TdxBarSubItem) then
        begin
          Result := TdxBarSubItem(ParentLinks.Items[J].Item);
          break;
        end;
      end;

      if Result = nil then
      begin
        Result := BarManager.AddSubItem;
        FBarButtonList.Add(Result);
        Result.Caption := SL[I];
        ParentLinks.Add(Result);
      end;
      ParentLinks := Result.ItemLinks;
    end;
  end;

begin
  if not AOperation.Visible or ((AOperation.Flag and iOperationFlag_NoMenu) <> 0)
  then
    Exit;

  SL := TStringList.Create;
  BarManager.BeginUpdate;
  try
    if AOperation.Category = '' then
      SL.CommaText := '常规'
    else
      SL.CommaText := AOperation.Category;

    if AOperation.Caption = '-' then
    begin
      BarItem := BarManager.AddItem(TdxBarSeparator);
      TdxBarSeparator(BarItem).ShowCaption := False;
    end
    else
    begin
      BarItem := BarManager.AddButton;
      with TdxBarButton(BarItem) do
      begin
        Tag := Integer(AOperation);
        Caption := AOperation.Caption;
        Down := AOperation.Checked;
        ShortCut := AOperation.ShortKey;
        OnClick := ClickOperationBarButton;
        Enabled := AOperation.Enabled;
        if not AOperation.Visible then
          Visible := ivNever;
        ImageIndex := AppCore.ToolBarImage.IndexOf(AOperation.ImageName);
      end;
      FOperationMenuContainerBucket.Add(AOperation, BarItem);
    end;

    with FindSubItemByName(SL) do
    begin
      ItemLinks.Add(BarItem);
    end;

  finally
    SL.Free;
    BarManager.EndUpdate();
  end;
end;

procedure TDevMain.ClickOperationBarButton(Sender: TObject);
begin
  TBaseOperation(TdxBarButton(Sender).Tag).Execute(0, []);
end;

procedure TDevMain.DoOperationChange(Sender: TObject);
begin
  case TBaseOperation(Sender).State of
    osCreating:
      BuildMultiMenuOperation(TBaseOperation(Sender));
    osUpdating:
      UpdateOperationMenu(TBaseOperation(Sender));
    osRemoving:
      RemoveOperationMenu(TBaseOperation(Sender));
  end;
end;

procedure TDevMain.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(FBarButtonList);
end;

procedure TDevMain.ClientPageDblClick(Sender: TObject);
begin
  CloseView;
end;

procedure TDevMain.RemoveOperationMenu(AOperation: TBaseOperation);
var
  BarButton: TdxBarButton;
begin
  if FOperationMenuContainerBucket.Exists(AOperation) then
  begin
    BarButton := TdxBarButton(FOperationMenuContainerBucket.Data[AOperation]);
    BarButton.Free; // 子菜单？？？
  end;
end;

procedure TDevMain.UpdateOperationMenu(AOperation: TBaseOperation);
var
  BarButton: TdxBarButton;
begin
  if FOperationMenuContainerBucket.Exists(AOperation) then
  begin
    BarButton := TdxBarButton(FOperationMenuContainerBucket.Data[AOperation]);
    if (BarButton <> nil) then
    begin
      BarButton.Enabled := AOperation.Enabled and AOperation.Visible;
      BarButton.Down := AOperation.Checked;
      BarButton.Caption := AOperation.Caption;
      BarButton.ImageIndex := AppCore.ToolBarImage.IndexOf
        (AOperation.ImageName);
      if AOperation.Visible then
        BarButton.Visible := ivAlways
      else
        BarButton.Visible := ivNever;
    end;
  end;
end;

end.
