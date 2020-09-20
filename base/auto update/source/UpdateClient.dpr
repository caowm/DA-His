program UpdateClient;

uses
  Forms,
  UpdateClient_MainForm in 'UpdateClient_MainForm.pas' {UpdateClientMainForm},
  App_Common in '..\..\solution\source\App_Common.pas',
  App_Function in '..\..\solution\source\App_Function.pas',
  App_DAModel in '..\..\solution\source\App_DAModel.pas',
  FileService_ClientBackend in '..\..\file manage\source\FileService_ClientBackend.pas',
  FileServiceLib_Intf in '..\..\file manage\source\FileServiceLib_Intf.pas',
  UpdateAppLib_Intf in 'UpdateAppLib_Intf.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '软件升级客户端';
  Application.CreateForm(TUpdateClientMainForm, UpdateClientMainForm);
  Application.Run;
end.
