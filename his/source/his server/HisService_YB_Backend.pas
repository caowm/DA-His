unit HisService_YB_Backend;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  App_DAServer,
  HisServer_Classes,
  uROClient,
  uDASchema, uROComponent, uDAStreamableComponent, uDAClientSchema;

type
  TYBBackend = class(TBaseBackend)
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
  YBBackend: TYBBackend;

implementation

{$R *.dfm}

{ TBaseBackend1 }

function TYBBackend.GetSchemaFileName: string;
begin
  Result := 'HisService_YB.daSchema'
end;

function TYBBackend.InternalGetSchema: TDASchema;
begin
  Result := DASchema;
end;

initialization
  YBBackend := TYBBackend.Create(nil);

finalization
  FreeAndNil(YBBackend);

end.

