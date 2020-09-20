unit App_DevNavBar;

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
  App_Common,
  cxNavigator,
  cxDBNavigator,
  cxPCdxBarPopupMenu,
  dxLayoutContainer,
  dxNavBarCollns,
  cxClasses,
  dxNavBarBase,
  dxNavBar;

type 
  
  TDevNavBar = class(TForm)
  private
    FNavBar: TdxNavBar;
    FAppObserver: TObserver;
    FOperationObserver: TObserver;
    FViewObserver: TObserver;
    FSide: TMainSide;

    procedure OnAppNotify(Sender: TObject);
    procedure OnOperationNotify(Sender: TObject);
    procedure OnViewNotify(Sender: TObject);
    procedure BuildOperationNavBar();
    procedure DoItemClick(Sender: TObject);
    procedure LoadState();
    procedure SaveState();
  public
    constructor Create(AOwner: TComponent; ASide: TMainSide); reintroduce;
    destructor Destroy(); override;
  end;



implementation

const
  sNavBarSection = 'NavigateBar';

{ TDevNavBar }

procedure TDevNavBar.BuildOperationNavBar;
const
  NormalCaption = '常规';
var
  I: Integer;

  procedure BuildItem(Operation: TBaseOperation);
  var
    Group: TdxNavBarGroup;
    Item: TdxNavBarItem;
  begin
    if (not Operation.Visible) or (Operation.Caption = '-') or
      ((Operation.Flag and iOperationFlag_NoTree) <> 0) then
      Exit;

    Group := TdxNavBarGroup(FNavBar.Groups.ItemByCaption(Operation.Category));
    if (Group = nil) then
    begin
      if (Operation.Category <> '') then
      begin
        Group := FNavBar.Groups.Add;
        Group.Caption := Operation.Category;
      end
      else begin
        Group := TdxNavBarGroup(FNavBar.Groups.ItemByCaption(NormalCaption));
        if Group = nil then
        begin
          Group := FNavBar.Groups.Add;
          Group.Caption := NormalCaption;
        end;
      end;
    end;
    Item := FNavBar.Items.Add;
    Item.Caption := Operation.Caption;
    Item.Tag := Integer(Operation);
    Item.SmallImageIndex := AppCore.SmallImage.IndexOf(Operation.ImageName);
    if Item.SmallImageIndex < 0 then
      Item.SmallImageIndex := 0;
    Item.OnClick := DoItemClick;
    Group.CreateLink(Item);
  end;
begin
  for I := 0 to AppCore.Operations.Count - 1 do
  begin
    BuildItem(AppCore.Operations[I]);
  end;
  LoadState();
end;

constructor TDevNavBar.Create(AOwner: TComponent; ASide: TMainSide);
begin
  inherited CreateNew(AOwner);
  Caption := '操作目录';
  FSide := ASide;
  FNavBar := TdxNavBar.Create(Self);
  FNavBar.Parent := Self;
  FNavBar.Align := alClient;
  FNavBar.View := AppCore.IniFile.ReadInteger(sAppSection, 'NavBarViewStyle', 13);
  FNavBar.OptionsImage.SmallImages := AppCore.SmallImage.ImageList;

  FAppObserver := TObserver.Create(OnAppNotify);
  AppCore.StateSubject.Attach(FAppObserver);

  FOperationObserver := TObserver.Create(OnOperationNotify);
  AppCore.Operations.OperationChanged.Attach(FOperationObserver);

  FViewObserver := TObserver.Create(OnViewNotify);
end;

destructor TDevNavBar.Destroy;
begin
  SaveState();
  FreeAndNil(FAppObserver);
  FreeAndNil(FOperationObserver);
  FreeAndNil(FViewObserver);
  inherited;
end;

procedure TDevNavBar.DoItemClick(Sender: TObject);
begin
  TBaseOperation(TdxNavBarItem(Sender).Tag).Execute(0, []);
end;

procedure TDevNavBar.LoadState;
begin

end;

procedure TDevNavBar.OnAppNotify(Sender: TObject);
begin
  case AppCore.State of
    asRunning:
      begin
        BuildOperationNavBar;
        FNavBar.Font := AppCore.MainView.Font;
        AppCore.MainView.ShowSide(FSide, Self);
        AppCore.MainView.ViewSubject.Attach(FViewObserver);
      end;
    asEnding:
      begin
        AppCore.MainView.CloseSide(Self);
      end;
  end;
end;

procedure TDevNavBar.OnOperationNotify(Sender: TObject);
begin

end;

procedure TDevNavBar.OnViewNotify(Sender: TObject);
begin

end;

procedure TDevNavBar.SaveState;
begin

end;

initialization
  TDevNavBar.Create(Application, msLeft);


end.

