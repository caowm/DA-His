{*
  创建与AppCore.Operations对应的树形目录
*}

unit App_OperationTree;

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
  ComCtrls,
  Contnrs,
  ExtCtrls,
  Menus,
  App_Function,
  App_Common;

const
  WM_OPERATIONCLICKED = WM_USER + 1;

type
  TOperationTreeView = class(TForm)
    OperationTree: TTreeView;
    procedure OperationTreeChange(Sender: TObject; Node: TTreeNode);
    procedure OperationTreeCustomDrawItem(Sender: TCustomTreeView;
      Node: TTreeNode; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure OperationTreeDblClick(Sender: TObject);
    procedure OperationTreeKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure OperationTreeContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
  private
    FAppObserver: TObserver;
    FOperationObserver: TObserver;
    FViewObserver: TObserver;
    FTreeChangeEnabled: Boolean;
    FOperationTreeBucket: TObjectBucketList;
    FSide: TMainSide;
    FPopupMenu: TPopupMenu;

    procedure OnAppNotify(Sender: TObject);
    procedure OnOperationNotify(Sender: TObject);
    procedure OnViewNotify(Sender: TObject);
    procedure BuildOperationTree();
    procedure ClickTreeItem(AItem: TTreeNode);
    procedure SyncView(View: TBaseView);
    procedure WMOperation(var Message: TMessage); message WM_OPERATIONCLICKED;
    procedure ShowOperationActions(Node: TTreeNode);

    procedure BuildTreeItem(Operation: TBaseOperation);
    procedure RemoveTreeItem(Operation: TBaseOperation);
    procedure UpdateTreeItem(Operation: TBaseOperation);
  public
    constructor Create(AOwner: TComponent; ASide: TMainSide); reintroduce;
    property PopupMenu: TPopupMenu read FPopupMenu;
  end;

implementation

{$R *.dfm}

{ TOperationTreeView }

procedure TOperationTreeView.BuildOperationTree;
var
  I: integer;
begin
  FTreeChangeEnabled := False;
  OperationTree.Items.Clear;
  FOperationTreeBucket.Clear;
  try
    for I := 0 to AppCore.Operations.Count - 1 do
    begin
      BuildTreeItem(AppCore.Operations[I]);
    end;
  finally
    FTreeChangeEnabled := True;
  end;
  OperationTree.FullExpand;
end;

procedure TOperationTreeView.ClickTreeItem(AItem: TTreeNode);
begin
  if (AItem <> nil) and (AItem.Data <> nil) then
  begin
    //PostMessage的作用是让前面的消息处理完，不嵌套后面的消息
    //那么View可在DoShowView里面设置自己的焦点!!!
    PostMessage(Handle, WM_OPERATIONCLICKED, Integer(AItem.Data), 0);
  end;
end;

procedure TOperationTreeView.WMOperation(var Message: TMessage);
begin
  TBaseOperation(Message.WParam).Execute(0, []);
end;

procedure TOperationTreeView.OperationTreeChange(Sender: TObject;
  Node: TTreeNode);
begin
  if FTreeChangeEnabled then
    ClickTreeItem(Node);
end;

procedure TOperationTreeView.OperationTreeCustomDrawItem(
  Sender: TCustomTreeView; Node: TTreeNode; State: TCustomDrawState;
  var DefaultDraw: Boolean);
begin
  //Sender.Canvas.TextFlags := Sender.Canvas.TextFlags and (not ETO_OPAQUE);
  //SetBkMode(Canvas.Handle, TRANSPARENT);
  if Node.Data <> nil then
    if not TBaseOperation(Node.Data).Enabled then
      Sender.Canvas.Font.Color := clGrayText;
  Canvas.Brush.Style := bsClear;
  DefaultDraw := True;
end;

procedure TOperationTreeView.OperationTreeDblClick(Sender: TObject);
begin
  ClickTreeItem(OperationTree.Selected);
end;

procedure TOperationTreeView.OperationTreeKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Ord(Key) = VK_SPACE) or (Ord(Key) = VK_RETURN) then
    ClickTreeItem(OperationTree.Selected);
end;

procedure TOperationTreeView.FormCreate(Sender: TObject);
begin
  FOperationTreeBucket := TObjectBucketList.Create();
  OperationTree.Images := AppCore.SmallImage.ImageList;

  FAppObserver := TObserver.Create(OnAppNotify);
  AppCore.StateSubject.Attach(FAppObserver);

  FOperationObserver := TObserver.Create(OnOperationNotify);
  AppCore.Operations.OperationChanged.Attach(FOperationObserver);

  FViewObserver := TObserver.Create(OnViewNotify);
end;

procedure TOperationTreeView.FormDestroy(Sender: TObject);
begin
  FTreeChangeEnabled := False;
  FAppObserver.Free;
  FOperationObserver.Free;
  FViewObserver.Free;
  FOperationTreeBucket.Free;
end;

procedure TOperationTreeView.SyncView(View: TBaseView);
var
  Temp: TObject;
begin
  if (View <> nil) and FOperationTreeBucket.Exists(View.Operation) then
  begin
    Temp := FOperationTreeBucket.Data[View.Operation];
    //同步显示选择的节点，并避免二次触发OnChange事件
    if Temp <> nil then
    begin
      FTreeChangeEnabled := False;
      TTreeNode(Temp).Selected := True;
      FTreeChangeEnabled := True;
    end
  end;
end;

procedure TOperationTreeView.OnAppNotify(Sender: TObject);
begin
  case AppCore.State of
    asRunning:
      begin
        AppCore.MainView.ShowSide(FSide, Self);
        BuildOperationTree; //要放在ShowSide的后面, why?
        AppCore.MainView.ViewSubject.Attach(FViewObserver);
        Color := AppCore.MainView.Color;
      end;
    asEnding:
      begin
        FTreeChangeEnabled := False;
        AppCore.MainView.CloseSide(Self);  // MainView已经释放???
      end;
  end;
end;

procedure TOperationTreeView.OnOperationNotify(Sender: TObject);
begin
  if Sender <> nil then
  begin
    case TBaseOperation(Sender).State of
      osCreating: BuildTreeItem(TBaseOperation(Sender));
      osUpdating: UpdateTreeItem(TBaseOperation(Sender));
      osRemoving: RemoveTreeItem(TBaseOperation(Sender));
    end;
  end;
end;

procedure TOperationTreeView.OnViewNotify(Sender: TObject);
begin
  SyncView(TBaseView(Sender));
end;

constructor TOperationTreeView.Create(AOwner: TComponent;
  ASide: TMainSide);
begin
  inherited Create(AOwner);
  FSide := ASide;
  FPopupMenu := TPopupMenu.Create(Self);
end;

procedure TOperationTreeView.BuildTreeItem(Operation: TBaseOperation);
var
  I: integer;
  PNode, CNode: TTreeNode;
  SL: TStringList;

  function FindNode(ANode: TTreeNode; const ATitle: string): TTreeNode;
  begin
    Result := ANode;
    while (Result <> nil) and (CompareText(Result.Text, ATitle) <> 0) do
      Result := Result.GetNextSibling
  end;

begin
  if not Operation.Visible or (Operation.Caption = '-') or
    ((Operation.Flag and iOperationFlag_NoTree) <> 0) or
    (Operation.Caption = '-') then Exit;

  SL := TStringList.Create;
  try
    SL.CommaText := Operation.Category;
    PNode := nil;
    CNode := OperationTree.TopItem;
    for I := 0 to SL.Count - 1 do
    begin
      CNode := FindNode(CNode, SL[I]);
      if CNode = nil then
      begin
        // 创建目录节点
        PNode := OperationTree.Items.AddChild(PNode, SL[I]);
        PNode.ImageIndex := AppCore.SmallImage.IndexOf(sFolderImageName); 
        if PNode.ImageIndex < 0 then
          PNode.ImageIndex := AppCore.SmallImage.DefaultIndex;
        PNode.SelectedIndex := PNode.ImageIndex;
      end
      else
        PNode := CNode;
      CNode := PNode.GetFirstChild;
    end;
    // 创建功能节点
    CNode := OperationTree.Items.AddChild(PNode, Operation.Caption);
    CNode.Data := Operation;
    FOperationTreeBucket.Add(Operation, CNode);
    CNode.ImageIndex := AppCore.SmallImage.IndexOf(Operation.ImageName);  
    if CNode.ImageIndex < 0 then
      CNode.ImageIndex := AppCore.SmallImage.DefaultIndex;
    CNode.SelectedIndex := CNode.ImageIndex;
  finally
    SL.Free;
  end;
end;

procedure TOperationTreeView.RemoveTreeItem(Operation: TBaseOperation);
var
  Temp, TempParent: TTreeNode;

  procedure RemoveParent(Node: TTreeNode);
  var
    NodeParent: TTreeNode;
  begin
   if Node <> nil then
    begin
      NodeParent := Node.Parent;
      if (Node.Count = 0) and (Node.Data = nil) then
        Node.Delete;
      RemoveParent(NodeParent);
    end
  end;
begin
  if FOperationTreeBucket.Exists(Operation) then
  begin
    Temp := TTreeNode(FOperationTreeBucket.Data[Operation]);
    FOperationTreeBucket.Remove(Operation);
    //删除节点，并避免二次触发OnChange事件
    if (Temp <> nil) then
    begin
      FTreeChangeEnabled := False;
      {
      // 如果直接删除有可能已随着父节点删除！！！
      Temp.Delete;  //注意：子节点也会被删除!!!
      }
      if Temp.Count = 0 then
      begin
        TempParent := Temp.Parent;
        Temp.Delete;
        RemoveParent(TempParent);
      end
      else begin
        // 有子节点时，暂时保留
        Temp.Data := nil;
      end;
      FTreeChangeEnabled := True;
    end;
  end;

end;

procedure TOperationTreeView.UpdateTreeItem(Operation: TBaseOperation);
var
  Node: TTreeNode;
begin
  if FOperationTreeBucket.Exists(Operation) then
  begin
    Node := TTreeNode(FOperationTreeBucket.Data[Operation]);
    if (Node <> nil) then
    begin
      Node.Text := Operation.Caption;

      Node.ImageIndex := AppCore.SmallImage.IndexOf(Operation.ImageName);
      if Node.ImageIndex < 0 then
        Node.ImageIndex := AppCore.SmallImage.DefaultIndex;
      Node.SelectedIndex := Node.ImageIndex;   
    end;
  end;    
end;

procedure TOperationTreeView.OperationTreeContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: Boolean);
var
  Node: TTreeNode;
  NodePos: TPoint;
begin
  NodePos := OperationTree.ScreenToClient(MousePos);
  Node := OperationTree.GetNodeAt(MousePos.X, MousePos.Y);
  ShowOperationActions(Node);
  Handled := True;
end;

procedure TOperationTreeView.ShowOperationActions(Node: TTreeNode);
begin
  //AppCore.Logger.Write('Tree Popup Enter');
  if (Node = nil) or (Node.Data = nil) then Exit;

  Node.Selected := True;
  PopupMenu.Items.Clear;
  with TBaseOperation(Node.Data) do
  begin
    BuildPopupMenu(PopupMenu, PopupMenu, Actions);
    PopupMenu.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y);
  end;
end;

initialization
  TOperationTreeView.Create(Application, msLeft);

end.

