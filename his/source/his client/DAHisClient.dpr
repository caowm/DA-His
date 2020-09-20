program DAHisClient;

uses
  FastMM4,
  Forms,
  HisClient_Const in 'HisClient_Const.pas',
  App_Common in '..\..\..\base\solution\source\App_Common.pas',
  App_Function in '..\..\..\base\solution\source\App_Function.pas',
  App_DAModel in '..\..\..\base\solution\source\App_DAModel.pas',
  App_DAView in '..\..\..\base\solution\source\App_DAView.pas',
  App_Class in '..\..\..\base\solution\source\App_Class.pas',
  App_PaxCompiler in '..\..\..\base\solution\source\App_PaxCompiler.pas',
  App_BaseMain in '..\..\..\base\solution\source\App_BaseMain.pas' {AppBaseMain},
  App_FastReport in '..\..\..\base\solution\source\App_FastReport.pas' {ReportModule: TDataModule},
  App_DataWizard in '..\..\..\base\solution\source\App_DataWizard.pas' {DataWizard: TDataModule},
  App_DevExpress in '..\..\..\base\solution\source\App_DevExpress.pas' {DevExpress: TDataModule},
  App_Dev_Toolbar in '..\..\..\base\solution\source\App_Dev_Toolbar.pas' {DevLayoutToolbar},
  App_Dev_OperationTree in '..\..\..\base\solution\source\App_Dev_OperationTree.pas' {DevOperationTree},
  App_Dev_Main in '..\..\..\base\solution\source\App_Dev_Main.pas' {DevMain},
  App_DevOptions in '..\..\..\base\solution\source\App_DevOptions.pas' {OptionSetForm},
  App_LoginForm in '..\..\..\base\solution\source\App_LoginForm.pas' {LoginForm},
  Intf_IDCard in '..\interface\Intf_IDCard.pas' {IDForm},
  Intf_RFCard in '..\interface\Intf_RFCard.pas',
  HisLibrary_Intf in '..\his server\HisLibrary_Intf.pas',
  HisClient_Classes in 'HisClient_Classes.pas',
  HisClient_Organizer in 'HisClient_Organizer.pas',
  HisClient_System in 'HisClient_System.pas',
  HisClient_Base in 'HisClient_Base.pas',
  HisClient_Clinic in 'HisClient_Clinic.pas',
  HisClient_Hosp in 'HisClient_Hosp.pas',
  HisClient_Medicine in 'HisClient_Medicine.pas',
  HisClient_Plugin in 'HisClient_Plugin.pas',
  HisClient_Plugin_Voice in 'HisClient_Plugin_Voice.pas',
  HisClient_YB in 'HisClient_YB.pas',
  HisClient_XNH in 'HisClient_XNH.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'DA-HIS¿Í»§¶Ë';
  if ShowLoginForm(HisUser) then
    Application.CreateForm(TDevMain, DevMain);
  Application.Run;
end.
