unit FileServer_HomeForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, App_Common, ExtCtrls;

type
  TServerHomeForm = class(TBaseView)
    Image: TImage;
  private
    { Private declarations }
  protected
    procedure LoadAdvertise();
    procedure DoInitView(); override;
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

{ TFormServerHome }

procedure TServerHomeForm.DoInitView;
begin
  inherited;
  LoadAdvertise;
end;

procedure TServerHomeForm.LoadAdvertise;
begin
  Image.Picture.Bitmap := AppCore.ImageCenter.Get('server.bmp');
end;

end.
