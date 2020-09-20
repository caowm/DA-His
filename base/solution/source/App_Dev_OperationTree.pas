unit App_Dev_OperationTree;

{
  用DevExpress、TcxTreeList构建的业务操作树

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
  cxGraphics,
  cxControls,
  cxLookAndFeels,
  cxLookAndFeelPainters,
  cxTL,
  cxTextEdit,
  cxTLdxBarBuiltInMenu,
  cxInplaceContainer,
  dxBar,
  cxCustomData,
  cxStyles, cxDataControllerConditionalFormattingRulesManagerDialog;

const
  WM_OPERATIONCLICKED = WM_USER + 1;

type
  TDevOperationTree = class(TForm)
    OperationTree: TcxTreeList;
    cxTreeList1Column1: TcxTreeListColumn;
    procedure OperationTreeDblClick(Sender: TObject);
    procedure OperationTreeKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure OperationTreeCustomDrawDataCell(Sender: TcxCustomTreeList;
      ACanvas: TcxCanvas; AViewInfo: TcxTreeListEditCellViewInfo;
      var ADone: Boolean);
    procedure OperationTreeFocusedNodeChanged(Sender: TcxCustomTreeList;
      APrevFocusedNode, AFocusedNode: TcxTreeListNode);
    procedure OperationTreeContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
  private
    FAppObserver: TObserver;
    FOperationObserver: TObserver;
    FViewObserver: TObserver;
    FTreeChangeEnabled: Boolean;
    FOperationTreeBucket: TObjectBucketList;
    FSide: TMainSide;
    FPopupMenu: TdxBarPopupMenu;

    procedure OnAppNotify(Sender: TObject);
    procedure OnOperationNotify(Sender: TObject);
    procedure OnViewNotify(Sender: TObject);
    procedure BuildOperationTree();
    procedure BuildTreeItem(Operation: TBaseOperation);
    procedure RemoveTreeItem(Operation: TBaseOperation);
    procedure UpdateTreeItem(Operation: TBaseOperation);
    procedure ClickTreeItem(AItem: TcxTreeListNode);
    procedure SyncView(View: TBaseView);
    procedure WMOperation(var Message: TMessage); message WM_OPERATIONCLICKED;
    procedure ShowOperationActions(Node: TcxTreeListNode);
    function GetPopupMenu(): TdxBarPopupMenu;
  public
    constructor Create(AOwner: TComponent; ASide: TMainSide);
    property PopupMenu: TdxBarPopupMenu read GetPopupMenu;
  end;

var
  DevOperationTree: TDevOperationTree;

implementation

uses
  App_DevExpress, App_Class;

{$R *.dfm}
{ TDevOperationTree }

procedure TDevOperationTree.BuildOperationTree;
var
  I: integer;
begin
  FTreeChangeEnabled := False;
  OperationTree.Clear;
  FOperationTreeBucket.Clear;
  try
    for I := 0 to AppCore.Operations.Count - 1 do
    begin
      BuildTreeItem(AppCore.Operations[I]);
    end;
  finally
    FTreeChangeEnabled := True;
  end;
  // OperationTree.FullExpand;
end;

procedure TDevOperationTree.BuildTreeItem(Operation: TBaseOperation);
var
  I: integer;
  PNode, CNode: TcxTreeListNode;
  SL: TStringList;

  function FindNode(ANode: TcxTreeListNode; const ATitle: string)
    : TcxTreeListNode;
  begin
    Result := ANode;
    while (Result <> nil) and (CompareText(Result.Texts[0], ATitle) <> 0) do
      Result := Result.GetNextSibling
  end;

begin
  if not Operation.Visible or (Operation.Caption = '-') or
    ((Operation.Flag and iOperationFlag_NoTree) <> 0) then
    Exit;

  SL := TStringList.Create;
  try
    SL.CommaText := Operation.Category;
    PNode := nil;
    CNode := OperationTree.TopNode;
    for I := 0 to SL.Count - 1 do
    begin
      CNode := FindNode(CNode, SL[I]);
      if CNode = nil then
      begin
        // 创建目录节点
        PNode := OperationTree.AddChild(PNode);
        PNode.Texts[0] := SL[I];
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
    CNode := OperationTree.AddChild(PNode);
    CNode.Texts[0] := Operation.Caption;
    CNode.Visible := Operation.Visible;
    CNode.Enabled := Operation.Enabled;
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

procedure TDevOperationTree.ClickTreeItem(AItem: TcxTreeListNode);
begin
  if (AItem <> nil) and (AItem.Data <> nil) then
  begin
    // PostMessage的作用是让前面的消息处理完，不嵌套后面的消息
    // 那么View可在DoShowView里面设置自己的焦点!!!
    PostMessage(Handle, WM_OPERATIONCLICKED, integer(AItem.Data), 0);
  end;
end;

procedure TDevOperationTree.OnAppNotify(Sender: TObject);
begin
  case AppCore.State of
    asBeginning:
      begin
      end;
    asRunning:
      begin
        // AppCore.Logger.Write('准备操作目录', mtDebug, 0);
        BuildOperationTree;
        AppCore.MainView.ShowSide(FSide, Self);
        AppCore.MainView.ViewSubject.Attach(FViewObserver);
        // AppCore.Logger.Write('完成操作目录', mtDebug, 0);
      end;
    asEnding:
      begin

        FTreeChangeEnabled := False;
        AppCore.MainView.CloseSide(Self); // MainView已经释放???
      end;
  end;
end;

procedure TDevOperationTree.OnOperationNotify(Sender: TObject);
begin
  if Sender <> nil then
  begin
    case TBaseOperation(Sender).State of
      osCreating:
        BuildTreeItem(TBaseOperation(Sender));
      osUpdating:
        UpdateTreeItem(TBaseOperation(Sender));
      osRemoving:
        RemoveTreeItem(TBaseOperation(Sender));
    end;
  end;
end;

procedure TDevOperationTree.OnViewNotify(Sender: TObject);
begin
  SyncView(TBaseView(Sender));
end;

procedure TDevOperationTree.SyncView(View: TBaseView);
var
  Temp: TObject;
begin
  if (View <> nil) and (View.State = vsShowing) and
    FOperationTreeBucket.Exists(View.Operation) then
  begin
    Temp := FOperationTreeBucket.Data[View.Operation];
    // 同步显示选择的节点，并避免二次触发OnChange事件
    if (Temp <> nil) then
    begin
      FTreeChangeEnabled := False;
      TcxTreeListNode(Temp).Focused := True;
      // 展现此节点
      while TcxTreeListNode(Temp).Parent <> nil do
      begin
        TcxTreeListNode(Temp).Parent.Expanded := True;
        Temp := TcxTreeListNode(Temp).Parent
      end;
      FTreeChangeEnabled := True;
    end;
  end;
end;

procedure TDevOperationTree.WMOperation(var Message: TMessage);
begin
  TBaseOperation(Message.WParam).Execute(0, []);
end;

procedure TDevOperationTree.OperationTreeDblClick(Sender: TObject);
begin
  ClickTreeItem(OperationTree.FocusedNode);
end;

procedure TDevOperationTree.OperationTreeKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Ord(Key) = VK_SPACE) or (Ord(Key) = VK_RETURN) then
    ClickTreeItem(OperationTree.FocusedNode);
end;

procedure TDevOperationTree.FormCreate(Sender: TObject);
begin
  FOperationTreeBucket := TObjectBucketList.Create();
  OperationTree.Images := AppCore.SmallImage.ImageList;

  FAppObserver := TObserver.Create(OnAppNotify);
  AppCore.StateSubject.Attach(FAppObserver);

  FOperationObserver := TObserver.Create(OnOperationNotify);
  AppCore.Operations.OperationChanged.Attach(FOperationObserver);

  FViewObserver := TObserver.Create(OnViewNotify);
end;

procedure TDevOperationTree.FormDestroy(Sender: TObject);
begin
  FTreeChangeEnabled := False;
  FreeAndNil(FAppObserver);
  FreeAndNil(FOperationObserver);
  FreeAndNil(FViewObserver);
  FreeAndNil(FOperationTreeBucket);
end;

procedure TDevOperationTree.OperationTreeCustomDrawDataCell
  (Sender: TcxCustomTreeList; ACanvas: TcxCanvas;
  AViewInfo: TcxTreeListEditCellViewInfo; var ADone: Boolean);
begin
  if (AViewInfo.Node.Data <> nil) then
    if not TBaseOperation(AViewInfo.Node.Data).Enabled then
      ACanvas.Font.Color := clGrayText;
  Canvas.Brush.Style := bsClear;
  ADone := False;
end;

constructor TDevOperationTree.Create(AOwner: TComponent; ASide: TMainSide);
begin
  inherited Create(AOwner);
  FSide := ASide;
  // OperationTree.Styles := DevExpress.GetTreeStyle;
end;

procedure TDevOperationTree.OperationTreeFocusedNodeChanged
  (Sender: TcxCustomTreeList; APrevFocusedNode, AFocusedNode: TcxTreeListNode);
begin
  if FTreeChangeEnabled then
    ClickTreeItem(OperationTree.FocusedNode);
end;

procedure TDevOperationTree.RemoveTreeItem(Operation: TBaseOperation);
var
  Temp, TempParent: TcxTreeListNode;

  procedure RemoveParent(Node: TcxTreeListNode);
  var
    NodeParent: TcxTreeListNode;
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
    Temp := TcxTreeListNode(FOperationTreeBucket.Data[Operation]);
    FOperationTreeBucket.Remove(Operation);
    // 删除节点，并避免二次触发OnChange事件
    if (Temp <> nil) then
    begin
      FTreeChangeEnabled := False;
      {
        // 如果直接删除有可能已随着父节点删除！！！
        Temp.Delete;  //注意：子节点也会被删除!!!
      }
      try
        if Temp.Count = 0 then
        begin
          TempParent := Temp.Parent;
          Temp.Delete;
          RemoveParent(TempParent);
        end
        else
        begin
          // 有子节点时，暂时保留
          Temp.Data := nil;
        end;
      except
      end;
      FTreeChangeEnabled := True;
    end;
  end;
end;

procedure TDevOperationTree.UpdateTreeItem(Operation: TBaseOperation);
var
  Node: TcxTreeListNode;
begin
  if FOperationTreeBucket.Exists(Operation) then
  begin
    Node := TcxTreeListNode(FOperationTreeBucket.Data[Operation]);
    if (Node <> nil) then
    begin
      Node.Texts[0] := Operation.Caption;
      Node.Visible := Operation.Visible;
      Node.Enabled := Operation.Enabled;

      Node.ImageIndex := AppCore.SmallImage.IndexOf(Operation.ImageName);
      if Node.ImageIndex < 0 then
        Node.ImageIndex := AppCore.SmallImage.DefaultIndex;
      Node.SelectedIndex := Node.ImageIndex;
    end;
  end;
end;

procedure TDevOperationTree.OperationTreeContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: Boolean);
var
  Node: TcxTreeListNode;
  NodePos: TPoint;
begin
  NodePos := OperationTree.ScreenToClient(MousePos);
  Node := OperationTree.GetNodeAt(MousePos.X, MousePos.Y);
  Handled := True;
  ShowOperationActions(Node);
end;

procedure TDevOperationTree.ShowOperationActions(Node: TcxTreeListNode);
var
  I: integer;
begin
  if (Node = nil) or (Node.Data = nil) then
    Exit;

  // AppCore.Logger.Write('Tree Popup Enter');
  PopupMenu.ItemLinks.Clear;
  with TBaseOperation(Node.Data) do
  begin
    BuildBarPopupMenu(PopupMenu, PopupMenu, Actions, '');
    if PopupMenu.ItemLinks.Count > 0 then
      PopupMenu.PopupFromCursorPos;
  end;
end;

function TDevOperationTree.GetPopupMenu: TdxBarPopupMenu;
begin
  if FPopupMenu = nil then
    FPopupMenu := TdxBarPopupMenu.Create(Self);
  Result := FPopupMenu;
end;

initialization

TDevOperationTree.Create(Application, msLeft);

end.
