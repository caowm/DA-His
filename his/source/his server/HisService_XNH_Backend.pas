unit HisService_XNH_Backend;

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
  TXNHBackend = class(TBaseBackend)
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
  XNHBackend: TXNHBackend;

implementation

{$R *.dfm}

{ TBaseBackend1 }

function TXNHBackend.GetSchemaFileName: string;
begin
  Result := 'HisService_XNH.daSchema'
end;

function TXNHBackend.InternalGetSchema: TDASchema;
begin
  Result := DASchema;
end;

initialization
  XNHBackend := TXNHBackend.Create(nil);

finalization
  FreeAndNil(XNHBackend);

end.

