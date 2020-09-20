program DAHisServer;

uses
  FastMM4,
  uROCOMInit,
  Forms,
  App_Function in '..\..\..\base\solution\source\App_Function.pas',
  App_Common in '..\..\..\base\solution\source\App_Common.pas',
  App_ROCipher in '..\..\..\base\solution\source\App_ROCipher.pas',
  App_FastReport in '..\..\..\base\solution\source\App_FastReport.pas' {ReportModule: TDataModule},
  App_DAServer in '..\..\..\base\solution\source\App_DAServer.pas' {RemoteServer: TDataModule},
  App_BaseMain in '..\..\..\base\solution\source\App_BaseMain.pas' {AppBaseMain},
  App_ToolBar in '..\..\..\base\solution\source\App_ToolBar.pas' {SimpleToolBar},
  IdeaLibrary_Intf in '..\..\..\base\ideas\source\IdeaLibrary_Intf.pas',
  IdeaLibrary_Invk in '..\..\..\base\ideas\source\IdeaLibrary_Invk.pas',
  IdeaService_Impl in '..\..\..\base\ideas\source\IdeaService_Impl.pas' {IdeaService: TDataAbstractService},
  HisLibrary_Intf in 'HisLibrary_Intf.pas',
  HisLibrary_Invk in 'HisLibrary_Invk.pas',
  HisServer_Const in 'HisServer_Const.pas',
  HisServer_Classes in 'HisServer_Classes.pas' {BaseBackend: TBaseBackend},
  HisService_Report_Impl in 'HisService_Report_Impl.pas' {ReportService: TRORemoteDataModule},
  HisService_Login_Impl in 'HisService_Login_Impl.pas' {HisService_Login: TRORemoteDataModule},
  HisService_Base_Impl in 'HisService_Base_Impl.pas' {HisService_Base: TDataAbstractService},
  HisService_Dict_Impl in 'HisService_Dict_Impl.pas' {HisService_Dict: TDataAbstractService},
  HisService_System_Impl in 'HisService_System_Impl.pas' {SystemService: TDataAbstractService},
  HisService_Clinic_Impl in 'HisService_Clinic_Impl.pas' {HisService_Clinic: TDataAbstractService},
  HisService_Hosp_Impl in 'HisService_Hosp_Impl.pas' {HisService_Hosp: TDataAbstractService},
  HisService_Medicine_Impl in 'HisService_Medicine_Impl.pas' {HisService_Medicine: TDataAbstractService},
  HisService_Extend_Impl in 'HisService_Extend_Impl.pas' {HisService_Extend: TDataAbstractService},
  HisService_YB_Impl in 'HisService_YB_Impl.pas' {HisService_YB: TDataAbstractService},
  HisService_XNH_Impl in 'HisService_XNH_Impl.pas' {HisService_XNH: TDataAbstractService},
  HisService_Stat_Impl in 'HisService_Stat_Impl.pas' {HisService_Stat: TDataAbstractService},
  HisService_System_Backend in 'HisService_System_Backend.pas' {SystemBackend: TDataModule},
  HisService_Base_Backend in 'HisService_Base_Backend.pas' {BaseDataBackend: TDataModule},
  HisService_Dict_Backend in 'HisService_Dict_Backend.pas' {DictBackend: TDataModule},
  HisService_Clinic_Backend in 'HisService_Clinic_Backend.pas' {ClinicBackend: TDataModule},
  HisService_Hosp_Backend in 'HisService_Hosp_Backend.pas' {HospBackend: TDataModule},
  HisService_Medicine_Backend in 'HisService_Medicine_Backend.pas' {MedicineBackend: TDataModule},
  HisService_Extend_Backend in 'HisService_Extend_Backend.pas' {ExtendBackend: TDataModule},
  HisService_XNH_Backend in 'HisService_XNH_Backend.pas' {XNHBackend: TDataModule},
  HisService_YB_Backend in 'HisService_YB_Backend.pas' {YBBackend: TDataModule},
  HisService_Stat_Backend in 'HisService_Stat_Backend.pas' {StatBackend: TDataModule},
  HisServer_Organizer in 'HisServer_Organizer.pas';

{#ROGEN:HisServer.rodl} // RemObjects: Careful, do not remove!
{$R RODLFile.res}

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'DA-HIS·þÎñÆ÷';
  Application.CreateForm(TAppBaseMain, AppBaseMain);
  Application.Run;
end.

