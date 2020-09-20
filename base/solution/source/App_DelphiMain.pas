unit App_DelphiMain;

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
  App_BaseMain,
  ActnList,
  Menus;

type

  TDelphiMain = class(TAppBaseMain)
  private
    procedure OnViewActivate(Sender: TObject);
  protected
    function GetActiveView: TBaseView; override;
  public
    procedure ShowView(View: TBaseView); override;
    procedure CloseView(); override;

    procedure ShowSide(Side: TMainSide; Form: TForm); override;
    procedure CloseSide(Form: TForm); override;
  end;

var
  DelphiMain: TDelphiMain;

implementation

{$R *.dfm}

type
  TBaseViewHack = class(TBaseView);

  { TDelphiForm }

procedure TDelphiMain.CloseSide(Form: TForm);
begin
  Form.Close;
end;

procedure TDelphiMain.CloseView;
begin
  FreeAndNil(FActiveView);
  FViewSubject.Notify(nil);
end;

function TDelphiMain.GetActiveView: TBaseView;
begin
  Result := FActiveView;
end;

procedure TDelphiMain.OnViewActivate(Sender: TObject);
begin
  if FActiveView <> nil then
    TBaseViewHack(FActiveView).DoHideView;

  FActiveView := TBaseView(Sender);
  FLastClicked := FActiveView.Operation;
  TBaseViewHack(FActiveView).DoShowView;

  FViewSubject.Notify(TBaseView(Sender));
end;

procedure TDelphiMain.ShowSide(Side: TMainSide; Form: TForm);
begin
  Form.BorderStyle := bsNone;
  Form.Parent := Self;
  case Side of
    msLeft:
      begin
        Form.Align := alLeft;
      end;
    msRight:
      begin
        Form.Align := alRight;
      end;
    msBottom:
      begin
        Form.Align := alBottom;
      end;
  end;
  Form.Show;
end;

procedure TDelphiMain.ShowView(View: TBaseView);
begin
  View.Font := Font;
  if View.FormStyle <> fsMDIChild then
    View.FormStyle := fsMDIChild;
  View.OnActivate := OnViewActivate;
  if FOpenedViews.IndexOf(View) < 0 then
    FOpenedViews.Add(View);
  View.Show;
  FActiveView := View;
  FLastClicked := FActiveView.Operation;
  TBaseViewHack(FActiveView).DoShowView;

  FViewSubject.Notify(View);
end;

end.

