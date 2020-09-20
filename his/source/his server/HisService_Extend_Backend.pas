unit HisService_Extend_Backend;

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
  TExtendBackend = class(TBaseBackend)
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
  ExtendBackend: TExtendBackend;

implementation

{$R *.dfm}

{ TBaseBackend1 }

function TExtendBackend.GetSchemaFileName: string;
begin
  Result := 'HisService_Extend.daSchema'
end;

function TExtendBackend.InternalGetSchema: TDASchema;
begin
  Result := DASchema;
end;

initialization
  ExtendBackend := TExtendBackend.Create(nil);

finalization
  FreeAndNil(ExtendBackend);

end.

