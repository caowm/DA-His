program IdeaServer;

{#ROGEN:IdeaLibrary.RODL} // RemObjects SDK: Careful, do not remove!

uses
  uROComInit,
  uROComboService,
  Forms,
  fServerForm in 'fServerForm.pas' {ServerForm},
  IdeaService_Impl in 'IdeaService_Impl.pas' {IdeaService: TDARemoteService},
  fServerDataModule in 'fServerDataModule.pas' {ServerDataModule: TDataModule},
  IdeaLibrary_Intf in 'IdeaLibrary_Intf.pas',
  IdeaLibrary_Invk in 'IdeaLibrary_Invk.pas',
  App_Common in '..\..\solution\source\App_Common.pas';

{$R *.res}
{$R RODLFile.res}

begin
  if ROStartService('IdeaServer', 'IdeaServer') then begin
    ROService.CreateForm(TServerDataModule, ServerDataModule);
    ROService.Run;
    Exit;
  end;

  Application.Initialize;
  Application.CreateForm(TServerDataModule, ServerDataModule);
  Application.CreateForm(TServerForm, ServerForm);
  Application.Run;
end.
