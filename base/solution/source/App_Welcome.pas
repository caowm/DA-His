unit App_Welcome;

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
  App_Layout,
  ExtCtrls,
  Menus,
  StdCtrls;

type

  TAppWelcomeForm = class(TBaseView)
    procedure FormCreate(Sender: TObject);
  private
    FLayout: TTableLayout;
  public
    procedure LoadAdvertise();
    procedure DoInitView(); override;
    procedure DoShowView(); override;
  end;

implementation

{$R *.dfm}

{ TAppWelcomeForm }

procedure TAppWelcomeForm.DoInitView();
begin
  inherited;
  LoadAdvertise;
end;

procedure TAppWelcomeForm.DoShowView;
begin
  inherited;
  AppCore.Logger.Write('显示首页');
end;

procedure TAppWelcomeForm.LoadAdvertise;
begin

end;

procedure TAppWelcomeForm.FormCreate(Sender: TObject);
var
  Colors: array[0..2] of TColor;
begin
  FLayout := TTableLayout.Create(Self, 20, 4, 4);
  FLayout.Height := 200;
  FLayout.Parent := Self;
  FLayout.Align := alClient;
  FLayout.SetLayout(20, 20, [], []);
  //FLayout.AddControl(Label1, 0, 0, 0, 0);
  Colors[0] := RandomColor;
  Colors[1] := (not Colors[0]) and $FFFFFF;
  Colors[2] := (Colors[0] + Colors[1]) shr 1;
  {
  FLayout.AddControl(nil, 10, 7, 14, 7, Colors[Random(2)]);
  FLayout.AddControl(nil, 11, 8, 11, 8, Colors[Random(2)]);
  FLayout.AddControl(nil, 10, 9, 14, 9, Colors[Random(2)]);
  FLayout.AddControl(nil, 14, 10, 14, 10, Colors[Random(2)]);
  FLayout.AddControl(nil, 1, 11, 14, 11, Colors[Random(2)]);

  FLayout.AddControl(nil, 4, 6, 4, 9, Colors[Random(2)]);
  FLayout.AddControl(nil, 10, 4, 10, 9, Colors[Random(2)]);
  FLayout.AddControl(nil, 4, 10, 5, 10, Colors[Random(2)]);
  FLayout.AddControl(nil, 9, 10, 10, 10, Colors[Random(2)]);
  FLayout.AddControl(nil, 5, 9, 6, 9, Colors[Random(2)]);
  FLayout.AddControl(nil, 8, 9, 9, 9, Colors[Random(2)]);
  FLayout.AddControl(nil, 6, 8, 8, 8, Colors[Random(2)]);
  }

  FLayout.AddControl(nil, 3, 0, 3, 0, Colors[0]);
  FLayout.AddControl(nil, 2, 1, 3, 1, Colors[0]);
  FLayout.AddControl(nil, 1, 2, 3, 2, Colors[0]);
  FLayout.AddControl(nil, 0, 3, 3, 3, Colors[0]);

  FLayout.AddControl(nil, 0, 5, 0, 8, Colors[0]);
  FLayout.AddControl(nil, 1, 5, 1, 7, Colors[0]);
  FLayout.AddControl(nil, 2, 5, 2, 6, Colors[0]);
  FLayout.AddControl(nil, 3, 5, 3, 5, Colors[0]);

  //+
  FLayout.AddControl(nil, 5, 8, 9, 8, Colors[0]);
  FLayout.AddControl(nil, 5, 9, 6, 9, Colors[0]);
  FLayout.AddControl(nil, 8, 9, 9, 9, Colors[0]);
  FLayout.AddControl(nil, 5, 10, 5, 10, Colors[0]);
  FLayout.AddControl(nil, 9, 10, 9, 10, Colors[0]);
  FLayout.AddControl(nil, 5, 11, 6, 11, Colors[0]);
  FLayout.AddControl(nil, 8, 11, 9, 11, Colors[0]);
  FLayout.AddControl(nil, 5, 12, 9, 12, Colors[0]);
  //S
  FLayout.AddControl(nil, 5, 0, 8, 0, Colors[0]);
  FLayout.AddControl(nil, 5, 1, 5, 1, Colors[0]);
  FLayout.AddControl(nil, 8, 1, 8, 1, Colors[0]);
  FLayout.AddControl(nil, 5, 2, 5, 2, Colors[0]);
  FLayout.AddControl(nil, 7, 2, 8, 2, Colors[0]);
  FLayout.AddControl(nil, 5, 3, 5, 3, Colors[0]);
  FLayout.AddControl(nil, 8, 3, 8, 3, Colors[0]);
  FLayout.AddControl(nil, 5, 4, 6, 4, Colors[0]);
  FLayout.AddControl(nil, 8, 4, 8, 4, Colors[0]);
  FLayout.AddControl(nil, 5, 5, 5, 5, Colors[0]);
  FLayout.AddControl(nil, 8, 5, 8, 5, Colors[0]);
  FLayout.AddControl(nil, 5, 6, 8, 6, Colors[0]);
  //W
  FLayout.AddControl(nil, 10, 0, 16, 0, Colors[0]);
  FLayout.AddControl(nil, 10, 1, 10, 1, Colors[0]);
  FLayout.AddControl(nil, 12, 1, 14, 1, Colors[0]);
  FLayout.AddControl(nil, 16, 1, 16, 1, Colors[0]);
  FLayout.AddControl(nil, 10, 2, 10, 2, Colors[0]);
  FLayout.AddControl(nil, 12, 2, 12, 2, Colors[0]);
  FLayout.AddControl(nil, 14, 2, 14, 2, Colors[0]);
  FLayout.AddControl(nil, 16, 2, 16, 2, Colors[0]);
  FLayout.AddControl(nil, 10, 3, 11, 3, Colors[0]);
  FLayout.AddControl(nil, 13, 3, 13, 3, Colors[0]);
  FLayout.AddControl(nil, 15, 3, 16, 3, Colors[0]);
  FLayout.AddControl(nil, 10, 4, 16, 4, Colors[0]);
end;

function MaximizeMain(Sender: TBaseOperation; CmdID: Integer; const Params: array of Variant): Variant;
begin
  with AppCore.MainView do
  begin
    if BorderStyle = bsNone then
    begin
      BorderStyle := bsSizeable;
      WindowState := wsNormal;
    end
    else begin
      Left := 0;
      Top := 0;
      BorderStyle := bsNone;
      WindowState := wsMaximized;
    end;
  end;
end;

initialization

  with TViewOperation.Create('TAppWelcomeForm') do
  begin
    Caption := '首页';
    Order := '0001';
    Category := '系统';
    ImageName := 'home';
    ViewClass := TAppWelcomeForm;
  end;


end.

