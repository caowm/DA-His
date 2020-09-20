unit HisService_Medicine_Backend;

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
  TMedicineBackend = class(TBaseBackend)
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
  MedicineBackend: TMedicineBackend;

implementation

{$R *.dfm}

{ TBaseBackend1 }

function TMedicineBackend.GetSchemaFileName: string;
begin
  Result := 'HisService_Medicine.daSchema'
end;

function TMedicineBackend.InternalGetSchema: TDASchema;
begin
  Result := DASchema;
end;

initialization
  MedicineBackend := TMedicineBackend.Create(nil);

finalization
  FreeAndNil(MedicineBackend);

end.

