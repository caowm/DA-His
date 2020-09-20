unit fServerDataModule;

{$I DataAbstract.inc}

interface

uses
  SysUtils, Classes,
  uROClient, uROPoweredByRemObjectsButton, uROClientIntf, uROServer,
  uROBinMessage, uROIndyHTTPServer,
  uDAEngine, uDADriverManager, uDAClasses, uROSessions,
  uDAIBXDriver, uDAADODriver, uROBaseHTTPServer;

type
  TServerDataModule = class(TDataModule)
    Server: TROIndyHTTPServer;
    Message: TROBinMessage;
    ConnectionManager: TDAConnectionManager;
    DriverManager: TDADriverManager;
    ADODriver: TDAADODriver;
    DataDictionary: TDADataDictionary;
    SessionManager: TROInMemorySessionManager;
    
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ServerDataModule: TServerDataModule;

implementation

{$IFDEF DELPHIXE2UP}
{%CLASSGROUP 'System.Classes.TPersistent'}
{$ENDIF}

{$R *.dfm}

procedure TServerDataModule.DataModuleCreate(Sender: TObject);
begin
  Server.Active := true;
end;

end.
