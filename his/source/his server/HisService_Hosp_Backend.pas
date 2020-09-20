unit HisService_Hosp_Backend;

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
  App_DAServer,
  HisServer_Classes,
  uROClient,
  uDASchema, uROComponent, uDAStreamableComponent, uDAClientSchema;

type
  THospBackend = class(TBaseBackend)
    DASchema: TDASchema;
  private
    { Private declarations }
  protected
    function InternalGetSchema(): TDASchema; override;
    function GetSchemaFileName(): string; override;
  public
    { Public declarations }
  end;

var
  HospBackend: THospBackend;

implementation

{$R *.dfm}

{ TBaseBackend1 }

function THospBackend.GetSchemaFileName: string;
begin
  Result := 'HisService_Hosp.daSchema'
end;

function THospBackend.InternalGetSchema: TDASchema;
begin
  Result := DASchema;
end;

initialization
  HospBackend := THospBackend.Create(nil);

finalization
  FreeAndNil(HospBackend);

end.

