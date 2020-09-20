unit fServerForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls,
  uDAPoweredByDataAbstractButton, uROPoweredByRemObjectsButton;

type
  TServerForm = class(TForm)
    DAPoweredByDataAbstractButton1: TDAPoweredByDataAbstractButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ServerForm: TServerForm;

implementation

{$R *.dfm}

end.
