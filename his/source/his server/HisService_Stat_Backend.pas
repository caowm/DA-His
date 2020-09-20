unit HisService_Stat_Backend;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  App_DAServer,
  HisServer_Classes,
  uROClient,
  uROComponent, uDAStreamableComponent, uDAClientSchema, uDASchema;

type
  TStatBackend = class(TBaseBackend)
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
  StatBackend: TStatBackend;

implementation

{$R *.dfm}

{ TBaseBackend1 }

function TStatBackend.GetSchemaFileName: string;
begin
  Result := 'HisService_Stat.daSchema'
end;

function TStatBackend.InternalGetSchema: TDASchema;
begin
  Result := DASchema;
end;

initialization
  StatBackend := TStatBackend.Create(nil);

finalization
  FreeAndNil(StatBackend);

end.

