program UpdateServer;

uses
  uROCOMInit,
  Forms,
  App_Function in '..\..\solution\source\App_Function.pas',
  App_BaseMain in '..\..\solution\source\App_BaseMain.pas' {AppBaseMain},
  App_Common in '..\..\solution\source\App_Common.pas',
  App_RemoteServer in '..\..\solution\source\App_RemoteServer.pas' {ROServer: TDataModule},
  FileService_Impl in '..\..\file manage\source\FileService_Impl.pas' {FileService: TRORemoteDataModule},
  FileService_ServerBackend in '..\..\file manage\source\FileService_ServerBackend.pas',
  FileServiceLib_Intf in '..\..\file manage\source\FileServiceLib_Intf.pas',
  FileServiceLib_Invk in '..\..\file manage\source\FileServiceLib_Invk.pas',
  UpdateServer_Organizer in 'UpdateServer_Organizer.pas',
  UpdateAppLib_Intf in 'UpdateAppLib_Intf.pas',
  UpdateAppLib_Invk in 'UpdateAppLib_Invk.pas',
  UpdateAppService_Impl in 'UpdateAppService_Impl.pas' {UpdateAppService: TRORemoteDataModule};

{#ROGEN:UpdateServer.rodl} // RemObjects: Careful, do not remove!
{$R RODLFile.res}

{$R *.res}

begin
  Application.Initialize;    
  Application.Title := '软件升级服务器';
  Application.CreateForm(TAppBaseMain, AppBaseMain);
  Application.Run;
end.

