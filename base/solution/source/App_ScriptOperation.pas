unit App_ScriptOperation;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Classes,
  Graphics,
  Controls,
  Forms,
  Variants,
  uPSComponent,
  uPSCompiler,
  uPSRuntime,
  uPSComponent_Default,
  uROPSServerLink,
  uPSComponent_StdCtrls,
  uPSComponent_Controls,
  uPSComponent_Forms,
  uPSComponent_DB,
  uPSComponent_COM,
  uPSI_APP_Common,
  App_Common;

{

  脚本之间如何相互调用
  1 通过AppCore.Operations找到要调用的脚本
  2 执行TOperation.Execute;

  //todo: 如何自动指定Scripts目录下的脚本文件作为TScriptOperation?
}

type

  TScriptOperation = class(TOperation)
  private
    FScript: TPSScript;
    FCompiled: Boolean;
    FScriptFile: string;
    procedure LoadScript();
    function OnNeedFile(Sender: TObject; const OriginFileName: string;
      var FileName, Output: string): Boolean;
    procedure OnCompImport(Sender: TObject; x: TPSPascalCompiler);
    procedure OnExecImport(Sender: TObject; Exec: TPSExec; x:
      TPSRuntimeClassImporter);
    procedure OnCompile(Sender: TPSScript);
    procedure OnExecute(Sender: TPSScript);
  protected
    function DoExecute(ID: Integer; const Param: array of variant): Variant; override;
  public
    constructor Create(const AID, AOrder, ACategory, ACaption,
      AImageName: string; AFlag: Integer; AShortCut: TShortCut;
      const AScriptFile: string); reintroduce;
    destructor Destroy(); override;
  end;

implementation

var
  PSRemObjectsSdkPlugin: TPSRemObjectsSdkPlugin;
  PSImport_StdCtrls: TPSImport_StdCtrls;
  PSImport_Controls: TPSImport_Controls;
  PSImport_Forms: TPSImport_Forms;
  PSImport_DB: TPSImport_DB;
  PSImport_DateUtils: TPSImport_DateUtils;
  PSDllPlugin: TPSDllPlugin;
  PSImport_Classes: TPSImport_Classes;
  PSImport_ComObj: TPSImport_ComObj;
  PSImport_App_Common: TPSImport_App_Common;

procedure Writeln(const S: Variant);
begin
  AppCore.Logger.Write(mtDebug, S);
end;

{ TScriptOperation }

procedure TScriptOperation.LoadScript();
begin
  FScript.MainFileName := AppCore.AppPath + 'Scripts\' + FScriptFile;
  FScript.Script.LoadFromFile(FScript.MainFileName);
end;

constructor TScriptOperation.Create(const AID, AOrder, ACategory, ACaption,
  AImageName: string; AFlag: Integer; AShortCut: TShortCut;
  const AScriptFile: string);
begin
  inherited Create(AID, ACaption, AOrder, ACategory, AImageName, AFlag, AShortCut, nil);
  FScript := TPSScript.Create(nil);
  FScript.UsePreProcessor := True;
  FScriptFile := AScriptFile;
  FScript.OnNeedFile := OnNeedFile;
  FScript.OnCompile := OnCompile;
  FScript.OnExecute := OnExecute;
  FScript.OnCompImport := OnCompImport;
  FScript.OnExecImport := OnExecImport;
  TPSPluginItem(FScript.Plugins.Add).Plugin := PSImport_Classes;
  TPSPluginItem(FScript.Plugins.Add).Plugin := PSImport_Controls;
  TPSPluginItem(FScript.Plugins.Add).Plugin := PSImport_StdCtrls;
  TPSPluginItem(FScript.Plugins.Add).Plugin := PSImport_Forms;
  TPSPluginItem(FScript.Plugins.Add).Plugin := PSImport_DB;
  TPSPluginItem(FScript.Plugins.Add).Plugin := PSImport_DateUtils;
  TPSPluginItem(FScript.Plugins.Add).Plugin := PSDllPlugin;
  TPSPluginItem(FScript.Plugins.Add).Plugin := PSImport_ComObj;
  TPSPluginItem(FScript.Plugins.Add).Plugin := PSRemObjectsSdkPlugin;
  TPSPluginItem(FScript.Plugins.Add).Plugin := PSImport_App_Common;
end;

destructor TScriptOperation.Destroy;
begin
  if FCompiled and (FScript.Comp.FindProc('FINALIZE') <> Cardinal(-1)) then
    //try
    FScript.ExecuteFunction([], 'FINALIZE');
  //except
  //end;
  FScript.Free;
  inherited;
end;

type
  TVariantArray = array of Variant;

function TScriptOperation.DoExecute(ID: Integer; const Param: array of Variant): Variant;

  procedure OutputMessages;
  var
    I: Integer;
    S: string;
  begin
    for I := 0 to FScript.CompilerMessageCount - 1 do
      S := S + #13#10 + FScript.CompilerErrorToStr(I);
    AppCore.Logger.Write(mtDebug, '编译信息: ' + S);
    if not FCompiled then
      raise Exception.Create('编译出错');
  end;

  // TVariantArray为什么不能换成TVarDataArray???

  function MakeParamVariant(): TVariantArray;
  var
    I: Integer;
  begin
    //Result := VarArrayCreate([0, High(Param)], varVariant);
    SetLength(Result, Length(Param));
    for I := 0 to High(Param) do
      Result[I] := Param[I];
  end;

begin
  if not FCompiled then
  begin
    LoadScript();
    FCompiled := FScript.Compile();
    OutputMessages;
    if FCompiled then
      //if FScript.Comp.FindProc('INITIALIZE') <> Cardinal(-1) then
        //FScript.ExecuteFunction([], 'INITIALIZE');
      FScript.Execute;
  end;
  Result := FScript.ExecuteFunction([MakeParamVariant], 'EXECUTE');
end;

procedure TScriptOperation.OnCompile(Sender: TPSScript);
begin
  Sender.AddFunction(@Writeln, 'procedure Writeln(const s: Variant);');
  //Sender.AddRegisteredVariable('Self', 'TForm');
  Sender.AddRegisteredVariable('Application', 'TApplication');
  Sender.AddRegisteredVariable('AppCore', 'TAppCore');
end;

procedure TScriptOperation.OnCompImport(Sender: TObject;
  x: TPSPascalCompiler);
begin

end;

procedure TScriptOperation.OnExecImport(Sender: TObject; Exec: TPSExec;
  x: TPSRuntimeClassImporter);
begin

end;

procedure TScriptOperation.OnExecute(Sender: TPSScript);
begin
  Sender.SetVarToInstance('APPLICATION', Application);
  Sender.SetVarToInstance('AppCore', AppCore);
end;

function TScriptOperation.OnNeedFile(Sender: TObject;
  const OriginFileName: string; var FileName, Output: string): Boolean;
var
  Stream: TStream;
begin
  FileName := ExtractFilePath(OriginFileName) + FileName;

  Stream := TFileStream.Create(Filename, fmOpenRead or fmShareDenyWrite);
  try
    SetLength(Output, Stream.Size);
    Stream.Read(Output[1], Length(Output));
  finally
    Stream.Free;
  end;
  Result := True;
end;

procedure CreateScriptPlugin();
begin
  PSRemObjectsSdkPlugin := TPSRemObjectsSdkPlugin.Create(nil);
  PSImport_StdCtrls := TPSImport_StdCtrls.Create(nil);
  PSImport_Controls := TPSImport_Controls.Create(nil);
  PSImport_Forms := TPSImport_Forms.Create(nil);
  PSImport_DB := TPSImport_DB.Create(nil);
  PSImport_DateUtils := TPSImport_DateUtils.Create(nil);
  PSDllPlugin := TPSDllPlugin.Create(nil);
  PSImport_Classes := TPSImport_Classes.Create(nil);
  PSImport_ComObj := TPSImport_ComObj.Create(nil);
  PSImport_App_Common := TPSImport_App_Common.Create(nil);
end;

procedure FreeScriptPlugin();
begin
  PSRemObjectsSdkPlugin.Free;
  PSImport_StdCtrls.Free;
  PSImport_Controls.Free;
  PSImport_Forms.Free;
  PSImport_DB.Free;
  PSImport_DateUtils.Free;
  PSDllPlugin.Free;
  PSImport_Classes.Free;
  PSImport_ComObj.Free;
  PSImport_App_Common.Free;
end;

procedure CreateScriptOperation();
begin
  AppCore.Operations.Add(TScriptOperation.Create('for', '0201', '', '脚本,For',
    'script.bmp', 0, 0, 'for.pas'));
  AppCore.Operations.Add(TScriptOperation.Create('dll', '0202', '', '脚本,DLL',
    'script.bmp', 0, 0, 'dll.pas'));
end;

initialization
  CreateScriptPlugin();
  CreateScriptOperation();

finalization
  FreeScriptPlugin();

end.

