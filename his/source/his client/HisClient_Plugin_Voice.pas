unit HisClient_Plugin_Voice;

{
  唱收唱付

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
  App_Common,
  App_DAModel,
  App_DAView,
  App_Class,
  uROClasses,
  uDACore,
  uDAFields,
  uDAWhere,
  HisClient_Const,
  HisClient_Classes,
  HisClient_System,
  HisClient_Clinic,
  HisClient_Hosp;

const
  sMoneyVoiceDLL = 'TdBjq_server.dll';
  sSectionVoice = 'Voice';
  sVoiceEnabled = 'VoiceEnabled';
  sEvaluateEnabled = 'EvaluateEnabled';
  sVoiceOperationID = 'Plugin_Voice_ONOFF';
  sEvaluateOperationID = 'Plugin_Voice_EvaluteONOFF';

type
  TVoiceProc = function(ComPort: integer; OutString: PChar): integer; stdcall;
  TEvaluateProc = function(ComPort: integer): integer; stdcall;
  TOnEvaluate = procedure(Value: integer) of object;

  TVoiceDevice = class(TInterfacedObject)
  private
    FDLL: THandle;
    FVoiceProc: TVoiceProc;
    FEvaluateProc: TEvaluateProc;
    FEvaluateTimer: TROThreadTimer;
    FInEvaluate: Boolean;
    FOnEvaluate: TOnEvaluate;
    FEvaluationTick: integer;
    FVoiceEnabled: Boolean;
    FEvaluateEnabled: Boolean;
    procedure DoAppEvent(Sender: TObject);
    procedure DoInit();
    procedure TimerProc(CurrentTickCount: cardinal);
    procedure CallVoice(OutString: string);
    function CallEvaluate(): integer;
    procedure SetEvaluateEnabled(const Value: Boolean);
    procedure CreateEvaluateTimer();
  public
    constructor Create();
    destructor Destroy(); override;
    function LoadDLL(): Boolean;

    procedure Cmd_Stop();
    procedure Cmd_Clear();
    procedure Cmd_Content(Row: integer; Content: string);
    procedure Cmd_Memo(Row: integer; Memo: string);
    procedure Cmd_Image(Path: string);
    procedure Cmd_Evaluate1();
    procedure Cmd_Evaluate2();
    procedure Cmd_EvaluteParam(Item: integer; Content: string);
    function Cmd_EvaluateResult(): integer;
    procedure Cmd_Voice_SumMoney(Value: Currency);
    procedure Cmd_Voice_GetMoney(Value: Currency);
    procedure Cmd_Voice_ChangeMoney(Value: Currency);
    procedure Cmd_Voice_Money(Value: Currency);
    procedure Cmd_Voice_Thanks();
    procedure Cmd_Voice_PrePay(Value: Currency);
    procedure Cmd_Voice_PrePay_Finished();
    procedure Cmd_Voice_Hello();
    procedure Cmd_Voice_Wait();
    procedure Cmd_Voice_CheckName();
    procedure Cmd_Voice_AskName();
    procedure Cmd_Voice_InputPassword();

    property VoiceEnabled: Boolean read FVoiceEnabled write FVoiceEnabled;
    property EvaluateEnabled: Boolean read FEvaluateEnabled
      write SetEvaluateEnabled;
    property OnEvaluation: TOnEvaluate read FOnEvaluate write FOnEvaluate;
  end;

  TEvaluateType = (etClinReg, etClinFee, etHospPrepay, etHospFee);

  TVoicePlugin = class(TComponent, IVoiceClinReg, IVoiceClinFee,
    IVoiceHospPrepay, IVoiceHospFee)
  private
    FAppObserver: TObserver;
    FVoiceDevice: TVoiceDevice;
    FInClinReg: Boolean;
    FInClinFee: Boolean;
    FInHospPrepay: Boolean;
    FInHospFee: Boolean;
    FPhotoFileName: string;
    FEvaluateType: TEvaluateType;
    procedure LoadUserPhoto();
    procedure SendUserPhoto();
    procedure Init();
    procedure DoAppEvent(Sender: TObject);
    procedure DoEvaluate(Value: integer);
    { IVoiceClinReg }
    procedure ClinRegOpen();
    procedure ClinRegBegin();
    procedure ClinRegNameChange(RegData: TCustomData);
    procedure ClinRegPriceChange(RegData: TCustomData);
    procedure ClinRegEnd(RegData: TCustomData);

    procedure ClinFeeOpen();
    procedure ClinFeeBegin(RegData: TCustomData);
    procedure ClinFeeSumMoney(FeeData: TCustomData);
    procedure ClinFeePOSMoney(FeeData: TCustomData);
    procedure ClinFeeGetMoney(FeeData: TCustomData);
    procedure ClinFeeETCMoney(FeeData: TCustomData);
    procedure ClinFeeEnd(FeeData: TCustomData);

    procedure HospPrepayOpen();
    procedure HospPrepayBegin(PrepayData: TCustomData);
    procedure HospPrepayMoneyChange(PrepayData: TCustomData);
    procedure HospPrepayEnd(PrepayData: TCustomData; Success: Boolean);

    procedure HospFeeOpen();
    procedure HospFeeBegin(PatientData: TCustomData);
    procedure HospFeeSumMoney(FeeData: TCustomData);
    procedure HospFeeDiscountMoney(FeeData: TCustomData);
    procedure HospFeePrepayMoney(FeeData: TCustomData);
    procedure HospFeePayMoney(FeeData: TCustomData);
    procedure HospFeeGetMoney(FeeData: TCustomData);
    procedure HospFeeEnd(FeeData: TCustomData; Success: Boolean);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy(); override;
  end;

var
  VoicePlugin: TVoicePlugin;

implementation

function Operation_Plugin_Voice(Sender: TBaseOperation; AID: integer;
  const AParam: array of Variant): Variant;
begin
  Sender.Checked := not Sender.Checked;
  VoicePlugin.FVoiceDevice.VoiceEnabled := Sender.Checked;
end;

function Operation_Plugin_Evaluate(Sender: TBaseOperation; AID: integer;
  const AParam: array of Variant): Variant;
begin
  Sender.Checked := not Sender.Checked;
  VoicePlugin.FVoiceDevice.EvaluateEnabled := Sender.Checked;
end;

{ TVoiceDevice }

procedure TVoiceDevice.Cmd_Clear;
begin
  CallVoice('&Sc$');
end;

procedure TVoiceDevice.Cmd_Content(Row: integer; Content: string);
begin
  CallVoice('&C' + IntToStr(Row) + '1' + Content + '$');
end;

procedure TVoiceDevice.Cmd_Image(Path: string);
begin
  CallVoice('&B' + Path + '$');
end;

procedure TVoiceDevice.Cmd_Memo(Row: integer; Memo: string);
begin
  CallVoice('&L' + IntToStr(Row) + '1' + Memo + '$');
end;

procedure TVoiceDevice.Cmd_Stop;
begin
  CallVoice('&Stop$');
end;

constructor TVoiceDevice.Create;
begin
  FVoiceEnabled := True;
end;

destructor TVoiceDevice.Destroy;
begin
  FEvaluateTimer.Free;
  if FDLL <> 0 then
    FreeLibrary(FDLL);
  inherited;
end;

procedure TVoiceDevice.DoAppEvent(Sender: TObject);
begin

end;

procedure TVoiceDevice.DoInit;
begin

end;

function TVoiceDevice.LoadDLL: Boolean;
begin
  if (FDLL = 0) and FileExists(AppCore.BinPath + sMoneyVoiceDLL) then
  begin
    FDLL := LoadLibrary(PChar(AppCore.BinPath + sMoneyVoiceDLL));
    FVoiceProc := TVoiceProc(GetProcAddress(FDLL, 'dsbdll'));
    FEvaluateProc := TEvaluateProc(GetProcAddress(FDLL, 'revaluation'));
  end;
  Result := FDLL <> 0;
end;

procedure TVoiceDevice.TimerProc(CurrentTickCount: cardinal);
var
  Temp: integer;
begin
  if FInEvaluate and FEvaluateEnabled then
  begin
    Temp := Cmd_EvaluateResult();
    if (Temp <> 0) and Assigned(FOnEvaluate) then
      FOnEvaluate(Temp);
  end;
end;

procedure TVoiceDevice.Cmd_Voice_Money(Value: Currency);
begin
  if (Value > 0) then
    CallVoice(FormatCurr('0.00', Value) + 'P');
end;

procedure TVoiceDevice.Cmd_Voice_ChangeMoney(Value: Currency);
begin
  CallVoice(FormatCurr('0.00', Value) + 'Z');
end;

procedure TVoiceDevice.Cmd_Voice_GetMoney(Value: Currency);
begin
  CallVoice(FormatCurr('0.00', Value) + 'Y');
end;

procedure TVoiceDevice.Cmd_Voice_SumMoney(Value: Currency);
begin
  CallVoice(FormatCurr('0.00', Value) + 'J');
end;

procedure TVoiceDevice.Cmd_Voice_Thanks;
begin
  CallVoice('D5');
end;

procedure TVoiceDevice.Cmd_Voice_PrePay(Value: Currency);
begin
  CallVoice('E3');
  Cmd_Voice_Money(Value);
end;

procedure TVoiceDevice.Cmd_Voice_PrePay_Finished;
begin
  CallVoice('D9');
end;

procedure TVoiceDevice.Cmd_Evaluate1;
begin
  CallVoice('&SE$');
  FEvaluationTick := 0;
  FInEvaluate := True;
end;

procedure TVoiceDevice.Cmd_Evaluate2;
begin
  CallVoice('&Se$');
  FEvaluationTick := 0;
  FInEvaluate := True;
end;

procedure TVoiceDevice.Cmd_EvaluteParam(Item: integer; Content: string);
begin
  // 配合UDP服务器使用
  CallVoice('&ITEM' + IntToStr(Item) + Content + '$');
end;

function TVoiceDevice.Cmd_EvaluateResult: integer;
begin
  Result := 0;
  if FInEvaluate then
  begin
    Result := FEvaluateProc(0);
    Inc(FEvaluationTick);
    FInEvaluate := not(Result <> 0) and (FEvaluationTick < 31);
  end;
end;

procedure TVoiceDevice.CreateEvaluateTimer;
begin
  if LoadDLL and (FEvaluateTimer = nil) then
    FEvaluateTimer := TROThreadTimer.Create(TimerProc, 1000, True);
end;

procedure TVoiceDevice.Cmd_Voice_Hello;
begin
  CallVoice('F1');
end;

procedure TVoiceDevice.Cmd_Voice_CheckName;
begin
  CallVoice('AB');
end;

procedure TVoiceDevice.Cmd_Voice_InputPassword;
begin
  CallVoice('B2');
end;

function TVoiceDevice.CallEvaluate: integer;
begin
  if Assigned(FEvaluateProc) then
    Result := FEvaluateProc(0);
end;

procedure TVoiceDevice.CallVoice(OutString: string);
begin
  if FVoiceEnabled and Assigned(FVoiceProc) then
    FVoiceProc(0, PChar(OutString));
end;

procedure TVoiceDevice.Cmd_Voice_AskName;
begin
  CallVoice('BA');
end;

procedure TVoiceDevice.Cmd_Voice_Wait;
begin
  CallVoice('W');
end;

procedure TVoiceDevice.SetEvaluateEnabled(const Value: Boolean);
begin
  FEvaluateEnabled := Value;
  if Value then
    CreateEvaluateTimer;
end;

{ TVoicePlugin }

procedure TVoicePlugin.ClinFeeBegin(RegData: TCustomData);
begin
  if RegData.AsString['PatientName'] = '' then
    Exit;
  FVoiceDevice.Cmd_Clear;
  FVoiceDevice.Cmd_Voice_Hello;
  FVoiceDevice.Cmd_Content(5, RegData.AsString['PatientName'] + ' 您好！');
end;

procedure TVoicePlugin.ClinFeeEnd(FeeData: TCustomData);
begin
  // FVoiceDevice.Cmd_Clear;
  // FVoiceDevice.Cmd_Voice_Thanks;
  FInClinFee := False;
  FEvaluateType := etClinFee;
  FVoiceDevice.Cmd_Evaluate1();
end;

procedure TVoicePlugin.ClinFeeGetMoney(FeeData: TCustomData);
begin
  if not FInClinFee then
    Exit;
  FVoiceDevice.Cmd_Voice_GetMoney(FeeData.AsCurrency['GetMoney']);
  FVoiceDevice.Cmd_Voice_ChangeMoney(FeeData.AsCurrency['ChargeMoney']);
end;

procedure TVoicePlugin.ClinFeeOpen;
begin
  Init();
end;

procedure TVoicePlugin.ClinFeeETCMoney(FeeData: TCustomData);
begin
  if not FInClinFee then
    Exit;

  FVoiceDevice.Cmd_Voice_SumMoney(FeeData.AsCurrency['CashMoney']);

  FVoiceDevice.Cmd_Content(5, 'POS支付:' + FeeData.AsString['POSMoney'] + ' 其他支付:'
    + FeeData.AsString['ETCMoney1']);
end;

procedure TVoicePlugin.ClinFeePOSMoney(FeeData: TCustomData);
begin
  ClinFeeETCMoney(FeeData);
end;

procedure TVoicePlugin.ClinFeeSumMoney(FeeData: TCustomData);
begin
  // if not FInClinFee then Exit;
  FVoiceDevice.Cmd_Voice_SumMoney(FeeData.AsCurrency['CashMoney']);

  FVoiceDevice.Cmd_Content(1, '总额:' + FeeData.AsString['SumPrice'] + ' 优惠:' +
    FeeData.AsString['DiscountMoney'] + ' 医保:' + FeeData.AsString['YBMoney']);

  FInClinFee := True;
end;

procedure TVoicePlugin.ClinRegBegin;
begin
  FVoiceDevice.Cmd_Clear;
  FVoiceDevice.Cmd_Voice_Hello;
  FVoiceDevice.Cmd_Content(2, '您好！正在服务中...');
  FInClinReg := True;
end;

procedure TVoicePlugin.ClinRegEnd(RegData: TCustomData);
begin
  FVoiceDevice.Cmd_Clear;
  FVoiceDevice.Cmd_Voice_Thanks;
  FInClinReg := False;
end;

procedure TVoicePlugin.ClinRegNameChange(RegData: TCustomData);
begin
  if not FInClinReg then
    Exit;
  if RegData.AsString['PatientName'] <> '' then
    FVoiceDevice.Cmd_Content(1, '请核对您的姓名: ' + RegData.AsString['PatientName']);
  // FVoiceDevice.Cmd_Voice_CheckName;
end;

procedure TVoicePlugin.ClinRegOpen;
begin
  Init();
end;

procedure TVoicePlugin.ClinRegPriceChange(RegData: TCustomData);
begin
  if not FInClinReg then
    Exit;
  if RegData.AsString['RegType'] <> '' then
    FVoiceDevice.Cmd_Voice_SumMoney(RegData.AsCurrency['SumPrice']);
end;

constructor TVoicePlugin.Create(AOwner: TComponent);
begin
  inherited;
  FAppObserver := TObserver.Create(DoAppEvent);
  AppCore.StateSubject.Attach(FAppObserver);
end;

destructor TVoicePlugin.Destroy;
begin
  FAppObserver.Free;
  ClinicService.VoiceClinReg := nil;
  ClinicService.VoiceClinFee := nil;

  if FVoiceDevice <> nil then
  begin
    AppCore.IniFile.WriteBool(sSectionVoice, sVoiceEnabled,
      FVoiceDevice.VoiceEnabled);
    AppCore.IniFile.WriteBool(sSectionVoice, sEvaluateEnabled,
      FVoiceDevice.EvaluateEnabled);
    FVoiceDevice.Free;
  end;

  inherited;
end;

procedure TVoicePlugin.DoAppEvent(Sender: TObject);
begin
  case AppCore.State of
    asBeginning:
      begin
        if AppCore.Config.ReadBool(sSectionVoice, sVoiceEnabled, True) and
          HisUser.HaveAccess(sAccessClinFee) then
        begin
          FVoiceDevice := TVoiceDevice.Create;
          FVoiceDevice.OnEvaluation := DoEvaluate;
          ClinicService.VoiceClinReg := Self;
          ClinicService.VoiceClinFee := Self;
          HospService.VoiceHospPrepay := Self;
          HospService.VoiceHospFee := Self;
          FVoiceDevice.VoiceEnabled := AppCore.IniFile.ReadBool(sSectionVoice,
            sVoiceEnabled, True);
          FVoiceDevice.EvaluateEnabled := AppCore.IniFile.ReadBool
            (sSectionVoice, sEvaluateEnabled, False);

          with TProcOperation.Create(sVoiceOperationID) do
          begin
            Category := sOperationCategorySys + '';
            Caption := '唱收唱付开关';
            Order := 'z06';
            Access := sAccessClinFee;
            Checked := FVoiceDevice.VoiceEnabled;
            Flag := iOperationFlag_NoTree;
            OnExecute := Operation_Plugin_Voice;
          end;

          with TProcOperation.Create(sEvaluateOperationID) do
          begin
            Category := sOperationCategorySys + '';
            Caption := '评价开关';
            Order := 'z07';
            Access := sAccessClinFee;
            Checked := FVoiceDevice.EvaluateEnabled;
            Flag := iOperationFlag_NoTree;
            OnExecute := Operation_Plugin_Evaluate;
          end;
        end;
      end;
  end;
end;

procedure TVoicePlugin.Init;
begin
  LoadUserPhoto;
  FVoiceDevice.LoadDLL;
  SendUserPhoto;
end;

procedure TVoicePlugin.LoadUserPhoto;
begin
  if FPhotoFileName = '' then
  begin
    FPhotoFileName := AppCore.UserPath + HisUser.ID + '\photo.jpg';
    try
      ForceDirectories(AppCore.UserPath + HisUser.ID);
      SystemService.LoadUserPhoto(HisUser.ID, FPhotoFileName);
    except
    end;
  end;
end;

procedure TVoicePlugin.SendUserPhoto;
begin
  FVoiceDevice.Cmd_Image(FPhotoFileName);
  FVoiceDevice.Cmd_Memo(1, '工号：' + HisUser.ID);
  FVoiceDevice.Cmd_Memo(2, '姓名：' + HisUser.Name);
end;

procedure TVoicePlugin.DoEvaluate(Value: integer);
begin
  // todo: save result
end;

procedure TVoicePlugin.HospPrepayBegin(PrepayData: TCustomData);
begin
  FVoiceDevice.Cmd_Clear;
  FVoiceDevice.Cmd_Voice_Hello;
  FVoiceDevice.Cmd_Content(1, PrepayData.AsString[sFieldPatientName] + ', 您好！');
  FInHospPrepay := True;
end;

procedure TVoicePlugin.HospPrepayEnd(PrepayData: TCustomData; Success: Boolean);
begin
  FVoiceDevice.Cmd_Clear;
  if Success and (PrepayData.AsCurrency['PayMoney'] > 0) then
    FVoiceDevice.Cmd_Voice_PrePay_Finished();
  FVoiceDevice.Cmd_Voice_Thanks;
  FVoiceDevice.Cmd_Content(2, '正在服务...');
  FInHospPrepay := False;
end;

procedure TVoicePlugin.HospPrepayMoneyChange(PrepayData: TCustomData);
begin
  if not FInHospPrepay then
    Exit;
  FVoiceDevice.Cmd_Content(3, '预收：' + PrepayData.AsString['PayMoney']);
  FVoiceDevice.Cmd_Voice_PrePay(PrepayData.AsCurrency['PayMoney']);
end;

procedure TVoicePlugin.HospPrepayOpen;
begin
  Init();
end;

procedure TVoicePlugin.HospFeeBegin(PatientData: TCustomData);
begin
  if PatientData.AsString['PatientName'] = '' then
    Exit;
  FVoiceDevice.Cmd_Clear;
  FVoiceDevice.Cmd_Voice_Hello;
  FVoiceDevice.Cmd_Content(5, PatientData.AsString['PatientName'] + ' 您好！');
end;

procedure TVoicePlugin.HospFeeDiscountMoney(FeeData: TCustomData);
begin

end;

procedure TVoicePlugin.HospFeeEnd(FeeData: TCustomData; Success: Boolean);
begin

end;

procedure TVoicePlugin.HospFeeGetMoney(FeeData: TCustomData);
begin

end;

procedure TVoicePlugin.HospFeeOpen;
begin
  Init();
end;

procedure TVoicePlugin.HospFeePayMoney(FeeData: TCustomData);
begin

end;

procedure TVoicePlugin.HospFeePrepayMoney(FeeData: TCustomData);
begin

end;

procedure TVoicePlugin.HospFeeSumMoney(FeeData: TCustomData);
begin

end;

initialization

VoicePlugin := TVoicePlugin.Create(nil);

finalization

VoicePlugin.Free;

end.
