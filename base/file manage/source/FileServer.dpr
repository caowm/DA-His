program FileServer;

uses
  uROCOMInit,
  Forms,
  App_Common in '..\..\solution\source\App_Common.pas',
  App_Function in '..\..\solution\source\App_Function.pas',
  App_DelphiMain in '..\..\solution\source\App_DelphiMain.pas' {DelphiMain},
  App_BaseMain in '..\..\solution\source\App_BaseMain.pas' {AppBaseMain},
  App_Main in '..\..\solution\source\App_Main.pas' {AppMainForm},
  App_RemoteServer in '..\..\solution\source\App_RemoteServer.pas' {ROServer: TDataModule},
  FileServiceLib_Intf in 'FileServiceLib_Intf.pas',
  FileServiceLib_Invk in 'FileServiceLib_Invk.pas',
  FileService_Impl in 'FileService_Impl.pas' {FileService: TRORemoteDataModule},
  FileService_ServerBackend in 'FileService_ServerBackend.pas',
  FileServer_Organizer in 'FileServer_Organizer.pas';

{#ROGEN:FileService.rodl} // RemObjects: Careful, do not remove!
{$R RODLFile.res}

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '文件管理服务器';
  Application.CreateForm(TAppBaseMain, AppBaseMain);
  //Application.CreateForm(TDelphiMain, DelphiMain);
//  Application.CreateForm(TAppMainForm, AppMainForm);
  Application.Run;
end.

