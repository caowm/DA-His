program FileClient;

uses
  Forms,
  App_Common in '..\..\solution\source\App_Common.pas',
  App_Function in '..\..\solution\source\App_Function.pas',
  App_Class in '..\..\solution\source\App_Class.pas',  
  App_DAModel in '..\..\solution\source\App_DAModel.pas',     
  App_DAView in '..\..\solution\source\App_DAView.pas',
  App_BaseMain in '..\..\solution\source\App_BaseMain.pas' {AppBaseMain},
  App_DevExpress in '..\..\solution\source\App_DevExpress.pas' {DevExpressModule: TDataModule},
  App_DevOptions in '..\..\solution\source\App_DevOptions.pas' {OptionSetForm},
  App_Dev_Main in '..\..\solution\source\App_Dev_Main.pas' {DevMain},
  App_Dev_Toolbar in '..\..\solution\source\App_Dev_Toolbar.pas' {DevToolbar},
  FileServiceLib_Intf in 'FileServiceLib_Intf.pas',
  FileService_ClientBackend in 'FileService_ClientBackend.pas',
  FileClient_MainForm in 'FileClient_MainForm.pas' {FileClientForm},
  FileClient_Organizer in 'FileClient_Organizer.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '文件服务客户端';
  Application.CreateForm(TDevMain, DevMain);
  Application.Run;
end.
