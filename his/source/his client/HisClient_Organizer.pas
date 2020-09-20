unit HisClient_Organizer;

{
  HIS客户端组织者

  Written by caowm (remobjects@qq.com)
  2014年10月
}

interface

uses
  Classes,
  SysUtils,
  Menus,
  Forms,
  App_Common,
  App_DAModel,
  App_DAView,
  App_PaxCompiler,
  IMPORT_App_Function,
  Import_App_Common,
  IMPORT_App_DAModel,
  IMPORT_App_DAView,
  Import_App_DevExpress,
  Import_App_Class,
  Import_App_FastReport,
  IMPORT_dxLayoutContainer,
  // IMPORT_dxLayoutControl,
  // IMPORT_cxGraphics,
  // Import_dxGDIPlusAPI,
  // Import_dxGDIPlusClasses,
  // IMPORT_cxGridCustomTableView,
  // IMPORT_cxGridTableView,
  // IMPORT_cxGridDBTableView,
  uROXmlRpcMessage,
  uROSOAPMessage,
  HisClient_Const,
  HisClient_Classes,
  HisClient_System,
  HisClient_Base,
  HisClient_Clinic,
  HisClient_Medicine,
  HisClient_Hosp,
  HisClient_Plugin,
  HisClient_YB,
  HisClient_XNH;

type

  THisClientOrganizer = class(THisBaseOrganizer)
  private
    FScriptLoader: TDBScriptLoader;
  protected
    procedure DoAppEvent(Sender: TObject); override;
    procedure DefineCommonData; override;
    procedure OrganizeOperations; override;
    procedure DoAfterLogin(); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy(); override;
  end;

implementation

{ THisClientOrganizer }

procedure THisClientOrganizer.OrganizeOperations();
begin
  inherited;
  OrganizeBaseOperations();
  OrganizeSysOperations();
  OrganizeClinicOperations();
  OrganizeHospOperations();
  OrganizeMedicineOperation();
  OrganizeYBOperations();
  OrganizeXNHOperations();
  OrganizePluginOperations();
end;

procedure THisClientOrganizer.DefineCommonData();
begin
  SystemService := THisSysService(HisConnection.RegisterDataService
    (sDataServiceSystem, THisSysService));
  ClinicService := THisClinService(HisConnection.RegisterDataService
    (sDataServiceClin, THisClinService));
  HospService := THisHospService(HisConnection.RegisterDataService
    (sDataServiceHosp, THisHospService));
  MedService := THisMedService(HisConnection.RegisterDataService
    (sDataServiceMedicine, THisMedService));
  YBService := TYBService(HisConnection.RegisterDataService(sDataServiceYB,
    TYBService));
  XNHService := TXNHService(HisConnection.RegisterDataService(sDataServiceXNH,
    TXNHService));

  inherited;

  DefineBaseCommonData(DataContainer);
  DefineSysCommonData(DataContainer);
  DefineClinicCommonData(DataContainer);
  DefineHospCommonData(DataContainer);
  DefineYBCommonData(DataContainer);
  DefineXNHCommonData(DataContainer);
end;

constructor THisClientOrganizer.Create(AOwner: TComponent);
begin
  AppCore.ID := sAppID;
  AppCore.Version := sAppVer;
  AppCore.ResourceVersion := AppCore.Config.ReadString(sAppSection,
    'ResourceVersion', '');

  FScriptLoader := TDBScriptLoader.Create(Self);
  FScriptLoader.ScriptData := TCustomData.Create(Self, HisConnection,
    sDataServiceSystem, sDataNameSysScript);
  inherited;
end;

procedure THisClientOrganizer.DoAppEvent(Sender: TObject);
begin
  inherited;
  case AppCore.State of
    asBeginning:
      begin
        FScriptLoader.LoadScriptOperation;
        LoadMedicineInOutOperation;
        HisUser.EnableOperations;
      end;
  end;
end;

destructor THisClientOrganizer.Destroy;
begin
  FScriptLoader.Free;
  inherited;
end;

procedure THisClientOrganizer.DoAfterLogin;
begin

  inherited;
end;

initialization

HisOrganizer := THisClientOrganizer.Create(Application);

end.
