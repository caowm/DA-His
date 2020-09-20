unit HisService_Base_Backend;

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
  uDASchema, uDAServerInterfaces,
  uROComponent, uDAStreamableComponent, uDAClientSchema;

type
  TBaseDataBackend = class(TBaseBackend)
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
  BaseDataBackend: TBaseDataBackend;

implementation

{$R *.dfm}

{ TBaseBackend1 }

function TBaseDataBackend.GetSchemaFileName: string;
begin
  Result := 'HisService_Base.daSchema'
end;

function TBaseDataBackend.InternalGetSchema: TDASchema;
begin
  Result := DASchema;
end;

initialization
  BaseDataBackend := TBaseDataBackend.Create(nil);

finalization
  FreeAndNil(BaseDataBackend);

end.

