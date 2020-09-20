unit HisService_Dict_Backend;

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
  uDASchema,
  uDAServerInterfaces, uROComponent, uDAStreamableComponent, uDAClientSchema;

type
  TDictBackend = class(TBaseBackend)
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
  DictBackend: TDictBackend;

implementation

{$R *.dfm}

{ TBaseBackend1 }

function TDictBackend.GetSchemaFileName: string;
begin
  Result := 'HisService_Dict.daSchema'
end;

function TDictBackend.InternalGetSchema: TDASchema;
begin
  Result := DASchema;
end;

initialization
  DictBackend := TDictBackend.Create(nil);

finalization
  FreeAndNil(DictBackend);

end.

