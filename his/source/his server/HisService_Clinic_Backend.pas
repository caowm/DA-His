unit HisService_Clinic_Backend;

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
  App_DAServer,
  HisServer_Classes,
  uROClient,
  uROComponent, uDAStreamableComponent, uDAClientSchema, uDASchema;

type
  TClinicBackend = class(TBaseBackend)
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
  ClinicBackend: TClinicBackend;

implementation

{$R *.dfm}

{ TBaseBackend1 }

function TClinicBackend.GetSchemaFileName: string;
begin
  Result := 'HisService_Clinic.daSchema'
end;

function TClinicBackend.InternalGetSchema: TDASchema;
begin
  Result := DASchema;
end;

initialization
  ClinicBackend := TClinicBackend.Create(nil);

finalization
  FreeAndNil(ClinicBackend);

end.

