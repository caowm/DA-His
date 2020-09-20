unit HisClient_Plugin_Drug;

{
  HIS处方审核插件

  Written by caowm (remobjects@qq.com)
  2014年10月
}

interface

uses
  SysUtils,
  Classes,
  Forms,
  Messages,
  Menus,
  Controls,
  Variants,
  ActnList,
  StdCtrls,
  DB,
  Graphics,
  StrUtils,
  Math,
  Contnrs,
  Windows,
  ShellAPI,
  App_Common,
  App_DAModel,
  App_DAView,
  App_Class,
  uROClasses,
  HisClient_Const,
  HisClient_Classes,
  HisClient_System,
  HisClient_Clinic,
  HisClient_Hosp;

const
  sDrugOperationID = 'plugin_drug';

  sDrugDLL = 'KNRTClient.dll';
  sDrugEXE = 'KNRTClientFrame.exe';
  sPatientType_Clin = 'OUTPATIENT';
  sPatientType_Hosp = 'INPATIENT';

  sXmlRequest = '<?xml version=''1.0'' encoding=''GB2312''?>' +
    '<SubmitBasicRxRequest>' + '<AdmissionDate></AdmissionDate>' +
    '<hinCode>%s</hinCode>' + '<hinFacilityCode>%s</hinFacilityCode>' +
    '<PatientTypeCode>%s</PatientTypeCode>' + '<RXCode>%s</RXCode>' +
    '</SubmitBasicRxRequest>';

type

  TDrugCheckProc = function(AURL, AXmlRequest: PChar; ATimeOut: Integer)
    : PChar; stdcall;
  TDrugResultProc = function(AURL, AHospCode, ASubCode, AResponseXml: PChar)
    : Integer; stdcall;
  TDrugResultProc2 = function(AURL, AHospCode, ASubCode, AResponseXml: PChar)
    : PChar; stdcall;
  TDrugDirectProc = function(AURL, AHospCode, ASubCode, ADrugID,
    ARequestType: PChar): Integer; stdcall;

  TPluginDrug = class
  private
    FAppObserver: TObserver;
    FURL: string;
    FHospCode: string;
    FSubCode: string;
    FTimeout: Integer;
    FClientOpened: Boolean;
    FXmlResponse: string;
    FCheckResult: Integer;

    FDLL: THandle;
    FCheckProc: TDrugCheckProc;
    FResultProc: TDrugResultProc2;
    FDirectProc: TDrugDirectProc;

    procedure DoInit();
    procedure LoadDLL();
    procedure DoAppEvent(Sender: TObject);
    function GetResult(ACheckResult: string): Integer;
  public
    constructor Create();
    destructor Destroy(); override;

    procedure OpenClient(AMustOpen: Boolean = False);
    procedure CloseClient();

    procedure DoClinRecipeCheck(Sender: TObject);
    procedure DoHospAdviceCheck(Sender: TObject);
  end;

var
  DrugPlugin: TPluginDrug;

implementation

function Operation_Plugin_Drug(Sender: TBaseOperation; AID: Integer;
  const AParam: array of Variant): Variant;
begin
  DrugPlugin.OpenClient(True);
end;

{ TPluginDrug }

constructor TPluginDrug.Create;
begin
  FAppObserver := TObserver.Create(DoAppEvent);
  AppCore.StateSubject.Attach(FAppObserver);

  if FileExists(AppCore.BinPath + sDrugDLL) then
  begin
    ClinicService.OnRecipeCheck := DoClinRecipeCheck;
    HospService.OnAdviceCheck := DoHospAdviceCheck;
  end;

  with TProcOperation.Create(sDrugOperationID) do
  begin
    Category := sOperationCategoryHelp;
    Caption := '药事客户端';
    ImageName := sDrugOperationID;
    Order := 'z05';
    Flag := iOperationFlag_NoTree;
    OnExecute := Operation_Plugin_Drug;
  end;
end;

destructor TPluginDrug.Destroy;
begin
  FAppObserver.Free;
  if FDLL <> 0 then
    FreeLibrary(FDLL);
  CloseClient;

  inherited;
end;

procedure TPluginDrug.DoAppEvent(Sender: TObject);
begin
  case AppCore.State of
    asBeginning:
      begin
        // if HisUser.IsDoctor then OpenClient(False);
      end;
  end;
end;

procedure TPluginDrug.DoClinRecipeCheck(Sender: TObject);
var
  LRequest, LRecipeID: string;
  LResponse: PChar;
begin
  LoadDLL;
  OpenClient(False);

  LRecipeID := TCustomData(Sender).AsString[sFieldRecipeID];

  if LRecipeID = '' then
    Exit;

  if Assigned(FCheckProc) then
  begin
    LRequest := Format(sXmlRequest, [FHospCode, FSubCode, sPatientType_Clin,
      LRecipeID]);

    AppCore.Logger.WriteFmt('门诊审方开始|%s|%s', [LRecipeID, LRequest], mtInfo, 0);

    LResponse := FCheckProc(PChar(FURL), PChar(LRequest), FTimeout);

    SetLength(FXmlResponse, StrLen(LResponse));
    StrCopy(PChar(FXmlResponse), LResponse);

    AppCore.Logger.WriteFmt('门诊审方结束|%s|%s', [LRecipeID, FXmlResponse],
      mtInfo, 0);

    if Assigned(FResultProc) then
    begin
      FCheckResult := GetResult(FResultProc(PChar(FURL), PChar(FHospCode),
        PChar(FSubCode), PChar(FXmlResponse)));

      ClinicService.WriteRecipeDrugCheck(StrToInt(LRecipeID), FCheckResult);

      TcdRecMaster(Sender).CheckSign := FCheckResult;

      AppCore.Logger.WriteFmt('门诊审方完成|%s', [LRecipeID], mtInfo, 1);
    end;
  end;
end;

procedure TPluginDrug.DoHospAdviceCheck(Sender: TObject);
var
  LRequest, LHospID: string;
  LResponse: PChar;
begin
  LoadDLL;
  OpenClient(False);

  LHospID := TCustomData(Sender).AsString[sFieldHospID];

  if LHospID = '' then
    Exit;

  if Assigned(FCheckProc) then
  begin

    LRequest := Format(sXmlRequest, [FHospCode, FSubCode, sPatientType_Hosp,
      LHospID]);

    AppCore.Logger.WriteFmt('住院审方开始|%s|%s', [LHospID, LRequest], mtInfo, 0);

    LResponse := FCheckProc(PChar(FURL), PChar(LRequest), FTimeout);

    SetLength(FXmlResponse, StrLen(LResponse));
    StrCopy(PChar(FXmlResponse), LResponse);

    AppCore.Logger.WriteFmt('住院审方结束|%s|%s', [LHospID, FXmlResponse], mtInfo, 0);

    if Assigned(FResultProc) then
    begin
      FCheckResult := GetResult(FResultProc(PChar(FURL), PChar(FHospCode),
        PChar(FSubCode), LResponse));
    end;
  end;
end;

procedure TPluginDrug.DoInit;
begin
  if FURL = '' then
  begin
    FHospCode := AppCore.Config.ReadString(sDrugDLL, 'HospCode', '430');
    FSubCode := AppCore.Config.ReadString(sDrugDLL, 'SubCode', '430');
    FURL := AppCore.Config.ReadString(sDrugDLL, 'URL',
      'http://10.1.100.99:8001/ServiceModule/Service/');

    FTimeout := AppCore.Config.ReadInteger(sDrugDLL, 'Timeout', 10000);
  end;
end;

procedure TPluginDrug.CloseClient;
begin
  if FClientOpened then
    ShellExecute(0, nil, 'TaskKill', PChar('/F /IM ' + sDrugEXE), nil, 0);
end;

procedure TPluginDrug.LoadDLL;
begin
  if (FDLL = 0) and FileExists(AppCore.BinPath + sDrugDLL) then
  begin
    FDLL := LoadLibrary(PChar(AppCore.BinPath + sDrugDLL));
    FCheckProc := TDrugCheckProc(GetProcAddress(FDLL, 'CommitBasicRX'));
    FResultProc := TDrugResultProc2(GetProcAddress(FDLL, 'ShowWarnWindow2'));
    FDirectProc := TDrugDirectProc(GetProcAddress(FDLL, 'ShowDrugMonograph'));
  end;

end;

procedure TPluginDrug.OpenClient(AMustOpen: Boolean);
var
  DrugClient: string;
  ShellParam: string;
begin
  if not AMustOpen and FClientOpened then
    Exit;

  DoInit;

  DrugClient := AppCore.BinPath + sDrugEXE;
  Check(not FileExists(DrugClient), '未找到药事客户端程序(%s)', [DrugClient]);

  ShellParam := Format('%s %s %s %s %s 0 0', [FURL, FHospCode, FSubCode,
    AppCore.User.ID, AppCore.User.Name]);
  ShellExecute(0, nil, PChar(DrugClient), PChar(ShellParam), nil, 0);

  FClientOpened := True;
end;

function TPluginDrug.GetResult(ACheckResult: string): Integer;
begin
  if SameText(ACheckResult, 'DENIED') then
    Result := 2
  else
    Result := 1;
end;

initialization

DrugPlugin := TPluginDrug.Create;

finalization

FreeAndNil(DrugPlugin);

end.
