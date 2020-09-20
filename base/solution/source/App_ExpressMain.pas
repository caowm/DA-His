unit App_ExpressMain;

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
  Menus,
  App_Common,
  App_DevExpress,
  cxGraphics,
  cxControls,
  cxLookAndFeels,
  cxLookAndFeelPainters,
  dxLayoutControl,
  dxLayoutLookAndFeels, dxLayoutContainer;

type
  TAppSimpleForm = class(TForm)
    LayoutControlGroup_Root: TdxLayoutGroup;
    LayoutControl: TdxLayoutControl;
    dxLayoutLookAndFeelList1: TdxLayoutLookAndFeelList;
    dxLayoutCxLookAndFeel1: TdxLayoutCxLookAndFeel;
    dxLayoutWebLookAndFeel1: TdxLayoutWebLookAndFeel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    FAppObserver: TObserver;
    procedure OnAppNotify(Sender: TObject);
    procedure BuildOperationsLayout();
    procedure BuildOperation(AOperation: TBaseOperation);
    procedure OnLayoutItemClick(Sender: TObject);
  public
  end;

var
  AppSimpleForm: TAppSimpleForm;

implementation

{$R *.dfm}

procedure TAppSimpleForm.FormCreate(Sender: TObject);
begin
  LayoutControl.OptionsImage.Images := AppCore.SmallImage.ImageList;
  //LayoutControl.LookAndFeel := DevExpress.dxLayoutFeel;
  FAppObserver := TObserver.Create(OnAppNotify);
  AppCore.StateSubject.Attach(FAppObserver);
end;

procedure TAppSimpleForm.BuildOperationsLayout;
begin
  LayoutControl.BeginUpdate;
  try
    LayoutControl.Clear;
    AppCore.Operations.ForEach(BuildOperation);
  finally
    LayoutControl.EndUpdate();
  end;
end;

procedure TAppSimpleForm.BuildOperation(AOperation: TBaseOperation);
var
  Group: TdxLayoutGroup;
  Item: TdxLayoutItem;

  function FindGroup(): TdxLayoutGroup;
  var
    I: Integer;
  begin
    Result := nil;
    for I := 0 to LayoutControl.Items.Count - 1 do
      if SameText(LayoutControl.Items[I].Caption, AOperation.Category) then
      begin
        Result := TdxLayoutGroup(LayoutControl.Items[I]);
        Break;
      end;

    if Result = nil then
    begin
      Result := LayoutControl.CreateGroup(nil, LayoutControl.Items);
      Result.Caption := AOperation.Category;
      Result.ButtonOptions.ShowExpandButton := True;
      //TdxLayoutGroupCaptionOptions(Result.CaptionOptions).ImageIndex :=
        //AppCore.SmallImage.IndexOf(FolderImageName)
    end;
  end;
begin
  if AOperation.Caption = '-' then Exit;
  Group := FindGroup;
  Item := TdxLayoutItem.Create(Self);
  Item.Parent := Group;
  Item.Tag := Integer(AOperation);
  Item.Caption := AOperation.Caption;
  Item.CaptionOptions.ImageIndex := AppCore.SmallImage.IndexOf(AOperation.ImageName);
  Item.OnCaptionClick := OnLayoutItemClick;
end;

procedure TAppSimpleForm.OnLayoutItemClick(Sender: TObject);
begin
  TBaseOperation(TdxLayoutItem(Sender).Tag).Execute(0, []);
end;

procedure TAppSimpleForm.OnAppNotify(Sender: TObject);
begin
  case AppCore.State of
    asBeginning, asRunning:
      begin
        AppCore.MainView.ShowSide(msRight, Self);
        BuildOperationsLayout;
      end;
    asEnding:
      begin
        AppCore.MainView.CloseSide(Self);
      end;
  end;
end;

procedure TAppSimpleForm.FormDestroy(Sender: TObject);
begin
  FAppObserver.Free;
end;

initialization
  AppSimpleForm := TAppSimpleForm.Create(Application);

end.

