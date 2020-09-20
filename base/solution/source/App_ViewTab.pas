unit App_ViewTab;

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
  App_Common;

type
  TViewTabForm = class(TFrame)
    ViewTab: TTabControl;
    procedure ViewTabChange(Sender: TObject);
  private
    FAppObserver: TObserver;
    FViewObserver: TObserver;
    procedure OnAppNotify(Sender: TObject);
    procedure OnViewNotify(Sender: TObject);
    procedure SyncView(View: TBaseView);
  protected
    procedure Notification(AComponent: TComponent;
      Operation: TOperation); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy(); override;
  end;

implementation

{$R *.dfm}

{ TViewTabForm }

constructor TViewTabForm.Create(AOwner: TComponent);
begin
  inherited;
  FAppObserver := TObserver.Create(OnAppNotify);
  AppCore.StateSubject.Attach(FAppObserver);
  FViewObserver := TObserver.Create(OnViewNotify);
  //ViewTab.Images := AppCore.SmallImage.ImageList;
end;

destructor TViewTabForm.Destroy;
begin
  FAppObserver.Free;
  FViewObserver.Free;
  inherited;
end;

procedure TViewTabForm.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited;
  if (Operation = opRemove) and (AComponent is TBaseView) then
    with ViewTab.Tabs do
    begin
      Delete(IndexOfObject(AComponent));
      ViewTab.Visible := Count > 0;
    end
end;

procedure TViewTabForm.OnAppNotify(Sender: TObject);
begin
  case AppCore.State of
    asBeginning:
      begin
        AppCore.MainView.ViewSubject.Attach(FViewObserver);
      end;
    asEnding:
      begin
        ViewTab.Parent := Self;
      end;
  end;
end;

procedure TViewTabForm.OnViewNotify(Sender: TObject);
begin
  SyncView(TBaseView(Sender));
end;

procedure TViewTabForm.SyncView(View: TBaseView);
var
  I: Integer;
begin
  if View <> nil then
  begin
    I := ViewTab.Tabs.IndexOfObject(View);
    if I < 0 then
    begin
      ViewTab.TabIndex := ViewTab.Tabs.AddObject(View.Operation.Caption, View);
      View.FreeNotification(Self);
      ViewTab.Visible := True; 
      ViewTab.Parent := View.Parent; // AppCore.MainView;
      ViewTab.Top := -1000;
    end
    else
      ViewTab.TabIndex := I;
  end;
end;

procedure TViewTabForm.ViewTabChange(Sender: TObject);
begin
  TBaseView(ViewTab.Tabs.Objects[ViewTab.TabIndex]).Operation.Execute(0, []);
end;

initialization
  //if AppCore.Config.ReadBool(cAppSection, 'ShowTab', True) then
    TViewTabForm.Create(Application);


end.

