unit HisClient_System;

{
  HIS系统模块

  Written by caowm (remobjects@qq.com)
  2014年10月
}

interface

uses
  Classes,
  Forms,
  SysUtils,
  ActnList,
  Controls,
  Graphics,
  DB,
  PaxProgram,
  SynEditHighlighter,
  SynHighlighterPas,
  SynEdit,
  SynDBEdit,
  App_Function,
  App_Class,
  App_Common,
  App_DAModel,
  App_DAView,
  App_FastReport,
  App_PaxCompiler,
  uDACore,
  uDAInterfaces,
  uDADataTable,
  uDAMemDataTable,
  uRORemoteService,
  uDARemoteDataAdapter,
  dxLayoutControl,
  dxLayoutContainer,
  HisLibrary_Intf,
  HisClient_Const,
  HisClient_Classes;

type
  TSysDataUser = class(THisData)
  protected
  public
    constructor Create(AOwner: TComponent);
  end;

  TSysDataOffice = class(THisData)
  private
    function GetOfficeID: string;
  protected
    procedure InitTableAfterSchema(ATable: TDAMemDataTable); override;
    procedure DoDataCalcFields(Sender: TDADataTable); override;
    procedure DoDataBeforePost(Sender: TDADataTable); override;
  public
    constructor Create(AOwner: TComponent);
    property OfficeID: string read GetOfficeID;
  end;

  TSysDataWorkGroup = class(THisData)
  protected
  public
    constructor Create(AOwner: TComponent);
  end;

  TSysDataPower = class(THisData)
  protected
    procedure DoDataBeforePost(Sender: TDADataTable); override;
  public
    constructor Create(AOwner: TComponent);
  end;

  TSysDataWorkGroupPower = class(THisData)
  protected
  public
    constructor Create(AOwner: TComponent);
  end;

  TSysDataLog = class(TCustomData)
  protected
  public
    constructor Create(AOwner: TComponent);
  end;

  TSysDataParam = class(THisData)
  protected
  public
    constructor Create(AOwner: TComponent);
    function GetParam(const AParamName: string; ADefault: Variant): Variant;
  end;

  TSysDataScript = class(TCustomData)
  public
    constructor Create(AOwner: TComponent);
    function GetScript(const ScriptID: string): string;
  end;

  THisSysService = class(TCustomDataService)
  private
    FSysParamData: TSysDataParam;
    FUnitName: string;
    function GetUnitName: string;
  public
    function GetParam(const AParamName: string; ADefault: Variant): Variant;
    procedure LoadUserPhoto(const UserID: string; const FileName: string);
    property UnitName: string read GetUnitName;
  end;

  TSysViewScript = class(TTableGridDataView)
  private
    FSynEdit: TDBSynEdit;
    FProgram: TPaxProgram;
    procedure DoActionCompile(Sender: TObject);
  protected
    procedure BuildViewLayout(); override;
    procedure BuildViewAction(); override;
  public
  end;

  TSysViewReport = class(TReportConfigView)
  protected
    procedure DoPrintReport(Sender: TObject); override;
  public
  end;

procedure DefineSysCommonData(ADataContainer: TDataContainer);
procedure OrganizeSysOperations();

var
  SystemService: THisSysService;

implementation

uses
  StrUtils;

var
  FPasSyn: TSynPasSyn;

function GetPasSyn(): TSynPasSyn;
begin
  if FPasSyn = nil then
  begin
    FPasSyn := TSynPasSyn.Create(Application);
    with FPasSyn do
    begin
      Name := 'PasSyn';
      DelphiVersion := dvDelphi7;
      CharAttri.Foreground := clYellow;
      CommentAttri.Foreground := clGreen;
      FloatAttri.Foreground := clFuchsia;
      HexAttri.Foreground := clFuchsia;
      IdentifierAttri.Foreground := clWhite;
      KeyAttri.Foreground := clAqua;
      NumberAttri.Foreground := clFuchsia;
      StringAttri.Foreground := clYellow;
      SymbolAttri.Foreground := clAqua;
    end;
  end;
  Result := FPasSyn;
end;

function DesignReport(Sender: TBaseOperation; AID: Integer;
  const AParam: array of Variant): Variant;
begin
  FastReport.DesignReport('');
end;

procedure OrganizeSysOperations();
begin

  with TProcOperation.Create(sOperationIDReport) do
  begin
    Category := sOperationCategorySys;
    Caption := '设计报表';
    ImageName := sOperationIDReport;
    Order := 's011';
    Flag := iOperationFlag_NoTree;
    OnExecute := DesignReport;
  end;

  with TViewOperation.Create(sOperationIDSysScript) do
  begin
    Category := sOperationCategorySys;
    Caption := '脚本维护';
    ImageName := 'script';
    Access := sAccessSys;
    Order := 'C50';
    Flag := iOperationFlag_NoTree;
    ViewClass := TSysViewScript;
  end;

  with TViewOperation.Create(sOperationIDReport) do
  begin
    ViewClass := TSysViewReport;
    Caption := '打印设置';
    Category := '系统';
    Flag := iOperationFlag_NoTree;
    Order := 'C51';
    Access := sAccessSysDict;
  end;
end;

procedure DefineSysCommonData(ADataContainer: TDataContainer);
begin
  with ADataContainer do
  begin
    RegisterData(HisConnection, sDataServiceSystem, sDataNameSysOffice,
      TSysDataOffice, 0, '');
    RegisterData(HisConnection, sDataServiceSystem, sDataNameSysUser,
      TSysDataUser, 0, '');
    RegisterData(HisConnection, sDataServiceSystem, sDataNameSysUserSign,
      TCustomData, 0, '');
    RegisterData(HisConnection, sDataServiceSystem, sDataNameSysUserOffice,
      TCustomData, 0, '');
    RegisterData(HisConnection, sDataServiceSystem, sDataNameSysPower,
      TSysDataPower, 0, '');
    RegisterData(HisConnection, sDataServiceSystem, sDataNameSysWorkGroup,
      TSysDataWorkGroup, 0, '');
    RegisterData(HisConnection, sDataServiceSystem, sDataNameSysWorkGroupPower,
      TSysDataWorkGroupPower, 0, '');
    RegisterData(HisConnection, sDataServiceSystem, sDataNameSysWorkGroupUser,
      TCustomData, 0, '');
    RegisterData(HisConnection, sDataServiceSystem, sDataNameSysParam,
      TSysDataParam, 0, '');

    RegisterData(HisConnection, sDataServiceSystem, sDataNameSysClinOffice,
      TCustomData, 0, '');
    RegisterData(HisConnection, sDataServiceSystem, sDataNameSysClinDoctor,
      TCustomData, 0, '');
    RegisterData(HisConnection, sDataServiceSystem, sDataNameSysHospOffice,
      TCustomData, 0, '');
    RegisterData(HisConnection, sDataServiceSystem, sDataNameSysHospDoctor,
      TCustomData, 0, '');
    RegisterData(HisConnection, sDataServiceSystem, sDataNameSysMedOffice,
      TCustomData, 0, '');
    RegisterData(HisConnection, sDataServiceSystem, sDataNameSysScript, 0, '');

    RegisterData(HisConnection, sDataServiceSystem, sDataNameMiscReport,
      TCustomData, 0, '');
    RegisterData(HisConnection, sDataServiceSystem, sDataNameMiscReportParam,
      TCustomData, 0, '');
  end;
end;

{ TSysDataUser }

constructor TSysDataUser.Create(AOwner: TComponent);
begin
  inherited Create(AOwner, HisConnection, sDataServiceSystem, sDataNameSysUser);
end;

{ TSysDataOffice }

constructor TSysDataOffice.Create(AOwner: TComponent);
begin
  inherited Create(AOwner, HisConnection, sDataServiceSystem,
    sDataNameSysOffice);
end;

procedure TSysDataOffice.DoDataBeforePost(Sender: TDADataTable);
begin
  inherited;
  if Odd(Length(OfficeID)) or (Length(OfficeID) = 0) then
    raise Exception.Create('科室ID必须按2位一级进行编码');
end;

procedure TSysDataOffice.DoDataCalcFields(Sender: TDADataTable);
begin
  inherited;
  Sender.FieldByName('ParentID').AsString := GetStatTypeParentID(OfficeID);
end;

function TSysDataOffice.GetOfficeID: string;
begin
  Result := Table.FieldByName('OfficeID').AsString;
end;

procedure TSysDataOffice.InitTableAfterSchema(ATable: TDAMemDataTable);
begin
  inherited;
  // 添加父ID字段
  with ATable.Fields.Add do
  begin
    Name := 'ParentID';
    DataType := datString;
    DisplayLabel := '上级ID';
    Size := 8;
    Index := 0;
    Calculated := True;
    Visible := False;
    CustomAttributes.Text := 'Options.Editing=False';
  end;
end;

{ TSysDataWorkGroup }

constructor TSysDataWorkGroup.Create(AOwner: TComponent);
begin
  inherited Create(AOwner, HisConnection, sDataServiceSystem,
    sDataNameSysWorkGroup);
end;

{ TSysAccess }

constructor TSysDataPower.Create(AOwner: TComponent);
begin
  inherited Create(AOwner, HisConnection, sDataServiceSystem,
    sDataNameSysPower);
end;

procedure TSysDataPower.DoDataBeforePost(Sender: TDADataTable);
var
  IDLen: Integer;
begin
  inherited;
  IDLen := Length(Sender.FieldByName('PowerID').AsString);
  if (IDLen < 2) or Odd(IDLen) then
    raise Exception.Create('权限编码长度规定为偶数');
  Sender.FieldByName('ParentID').AsString :=
    LeftStr(Sender.FieldByName('PowerID').AsString, IDLen - 2)
end;

{ TSysRoleAccess }

constructor TSysDataWorkGroupPower.Create(AOwner: TComponent);
begin
  inherited Create(AOwner, HisConnection, sDataServiceSystem,
    sDataNameSysWorkGroupPower);
end;

{ TSysLog }

constructor TSysDataLog.Create(AOwner: TComponent);
begin
  inherited Create(AOwner, HisConnection, sDataServiceSystem, sDataNameSysLog);
end;

{ TSysParam }

constructor TSysDataParam.Create(AOwner: TComponent);
begin
  inherited Create(AOwner, HisConnection, sDataServiceSystem,
    sDataNameSysParam);
end;

{ TSysDataParam }

function TSysDataParam.GetParam(const AParamName: string;
  ADefault: Variant): Variant;
begin
  OpenByFieldValue('ParamName', AParamName);
  if Table.EOF then
    Result := ADefault
  else
    Result := Table.FieldByName('ParamValue').AsString;
end;

{ THisSysService }

function THisSysService.GetParam(const AParamName: string;
  ADefault: Variant): Variant;
begin
  if FSysParamData = nil then
    FSysParamData := TSysDataParam.Create(Self);
  Result := FSysParamData.GetParam(AParamName, ADefault);
end;

function THisSysService.GetUnitName: string;
const
  sDefaultName = '未设置';
begin
  if (FUnitName = '') or (FUnitName = sDefaultName) then
  begin
    FUnitName := GetParam('Sys.UnitName', sDefaultName);
  end;
  Result := FUnitName;
end;

procedure THisSysService.LoadUserPhoto(const UserID: string;
  const FileName: string);
var
  PhotoData: TCustomData;
begin
  PhotoData := TCustomData.Create(nil, HisConnection, sDataServiceSystem,
    'Sys_OpSign');
  try
    PhotoData.OpenByFieldValue(sFieldOpID, UserID);
    if not PhotoData.EOF and not PhotoData.FieldByName('Photo').IsNull then
    begin
      PhotoData.FieldByName('Photo').SaveToFile(FileName);
    end;
  finally
    PhotoData.Free;
  end;
end;

{ TSysDataScript }

constructor TSysDataScript.Create(AOwner: TComponent);
begin
  inherited Create(AOwner, HisConnection, sDataServiceSystem,
    sDataNameSysScript);
end;

function TSysDataScript.GetScript(const ScriptID: string): string;
begin
  OpenByKeyValue(ScriptID);
  if not EOF then
    Result := AsString['Script']
  else
    Result := '';
end;

{ TSysViewScript }

procedure TSysViewScript.BuildViewAction;
begin
  inherited;
  BuildAction('编译', 'compile', '', nil, DoActionCompile, 0, BTN_ShowCaption)
end;

procedure TSysViewScript.BuildViewLayout;
begin
  inherited;
  ViewData := TSysDataScript.Create(Self);
  SetDataEditing(True);
  AutoEdit := True;

  FProgram := TPaxProgram.Create(Self);

  FSynEdit := TDBSynEdit.Create(Self);
  with FSynEdit do
  begin
    Width := 800;
    DataSource := ViewData.Source;
    DataField := 'Script';
    Highlighter := GetPasSyn;

    Color := clBlack;
    // ActiveLine.Background := clDefault;
    // ActiveLine.Foreground := clNavy;
    // ActiveLine.Visible := True;
    // LineDivider.Visible := False;
    // LineDivider.Color := clRed;
    // LineDivider.Style := psSolid;
    // RightEdge.MouseMove := False;
    // RightEdge.Visible := True;
    // RightEdge.Position := 80;
    // RightEdge.Color := clSilver;
    // RightEdge.Style := psSolid;
    // LineSpacing := 0;
    // LineSpacingRule := lsSingle;
    // Background.Visible := False;
    // Font.Color := clWindowText;
    // Font.Height := -13;
    // Font.Name := 'Courier New';
    // Font.Style := [];
    // Gutter.ShowLineModified := False;
    // Gutter.LineModifiedColor := clYellow;
    // Gutter.LineNormalColor := clLime;
    Gutter.Font.Color := clWindowText;
    Gutter.Font.Height := -11;
    Gutter.Font.Name := 'Courier New';
    Gutter.Font.Style := [];
    // Gutter.LeftOffsetColor := clNone;
    // Gutter.RightOffsetColor := clNone;
    Gutter.ShowLineNumbers := True;
  end;

  with ClientGroup do
  begin
    LayoutDirection := ldHorizontal;
    CreateItem(TdxLayoutSplitterItem);
    with CreateItemForControl(FSynEdit) do
    begin
      AlignVert := avClient;
      AlignHorz := ahClient;
    end;
  end;
end;

procedure TSysViewScript.DoActionCompile(Sender: TObject);
var
  Temp: TBaseOperation;
begin
  DataSave;
  if not CompileProgram(ViewData.AsString['Script'], FProgram, Temp) then
    OutputCompileError
  else
    AppCore.Logger.Write('编译通过.', mtInfo, 0);
end;

{ TSysViewReport }

procedure TSysViewReport.DoPrintReport(Sender: TObject);
begin
  inherited;
  PrintReportFromServer(ReportName, GetParamNameArray, GetParamValueArray,
    nil, True);
end;

end.
