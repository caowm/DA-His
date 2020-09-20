unit App_PaxCompiler;

{
  PaxCompiler库

  Written by caowm (remobjects@qq.com)
  2014年9月
}

interface

uses
  Classes,
  SysUtils,
  IniFiles,
  Forms,
  Menus,
  Import_Common,
  App_Common,
  App_DAModel,
  PaxProgram,              
  PaxCompiler,
  PaxInvoke,
  PaxRegister;

type

  TOnLoadScript = procedure(const ScriptID: string; var Script: string) of object;

  TPaxExecProc = function(CommandID: Integer; const Param: array of Variant): Variant;

  {
    PaxCompiler脚本操作类

    利用TBaseOperation.Execute过程可实现脚本之间相互调用!!!
    需编写一个脚本加载类
  }

  TPaxOperation = class(TBaseOperation)
  private
    FProgram: TPaxProgram;
    FScript: string;
    FCompiled: Boolean;
    FOnNeedScript: TOnLoadScript;
    FSelfVariable: TBaseOperation;
    procedure SetScript(const Value: string);
  protected
    function DoExecute(CommandID: Integer; const Param: array of Variant): Variant; override;
  public
    constructor Create(const AID: string; AOwner: TOperations = nil); override;
    destructor Destroy(); override;
    procedure ClearProgram();

    property Script: string read FScript write SetScript;
    property OnLoadScript: TOnLoadScript read FOnNeedScript write FOnNeedScript;
  end;

  TCustomScriptLoader = class(TComponent)
  public
    procedure LoadScriptOperation(); virtual; abstract;
    procedure DoLoadScript(const ScriptID: string; var Script: string); virtual; abstract;
  end;

  {
    数据库脚本加载器

    必须包含的字段:
      ScriptID, Category, Caption, Flag, ShortKey, ImageName,
      CustomAttributes, Script, OrderNum, Memo
  }
  TDBScriptLoader = class(TCustomScriptLoader)
  private
    FScriptData: TCustomData;
  public
    procedure LoadScriptOperation(); override;
    procedure DoLoadScript(const ScriptID: string; var Script: string); override;

    property ScriptData: TCustomData read FScriptData write FScriptData;
  end;

  {
    todo: 本地脚本加载器，适合扩展服务端功能
  }
  TLocalScriptLoader = class(TCustomScriptLoader)
  private
    FScriptFile: string;
  public
    procedure LoadScriptOperation(); override;
    procedure DoLoadScript(const ScriptID: string; var Script: string); override;

    property ScriptFile: string read FScriptFile write FScriptFile;
  end;


  function CompileProgram(AScript: string; AProgram: TPaxProgram; var MyOperation: TBaseOperation): Boolean;
  procedure OutputCompileError;

var
  Compiler: TPaxCompiler;
  PasLanguage: TPaxPascalLanguage;

implementation

procedure Println(Text: Variant);
begin
  AppCore.Logger.Write(Text, mtInfo, 0);
end;

procedure Initialize();
begin
  if Compiler = nil then
  begin
    Compiler := TPaxCompiler.Create(Application);
    PasLanguage := TPaxPascalLanguage.Create(Application);
    RegisterHeader(0, 'procedure Println(Text: Variant)', @Println);
  end;
end;

procedure OutputCompileError;
var
  I: Integer;
  S: string;
begin
  S := '编译出错: ';
  for I := 0 to Compiler.ErrorCount - 1 do
    S := S + #13#10 + Format('%s-[%d, %d]: %s'#13#10'%s',
      [Compiler.ErrorModuleName[I], Compiler.ErrorLineNumber[I],
      Compiler.ErrorLinePos[I], Compiler.ErrorLine[I],
        Compiler.ErrorMessage[I]]);
  raise Exception.Create(S);
end;

function CompileProgram(AScript: string; AProgram: TPaxProgram; var MyOperation: TBaseOperation): Boolean;
begin
  Initialize;

  Compiler.Reset;
  Compiler.RegisterLanguage(PasLanguage);
  Compiler.OnInclude := nil;
  Compiler.OnUsedUnit := nil;
  Compiler.RegisterVariable(0, 'MyOperation: TBaseOperation;', @MyOperation);
  Compiler.AddModule('main', PasLanguage.LanguageName);
  Compiler.AddCode('main', AScript);

  Result := Compiler.Compile(AProgram);
end;

{ TPaxOperation }

procedure TPaxOperation.ClearProgram;
var
  P: Pointer;
begin
  if FProgram.CodePtr <> nil then
  begin
    FCompiled := False;
    P := FProgram.GetAddress('DOCLEAR');
    if P <> nil then TProcedure(p)();
  end;
end;

constructor TPaxOperation.Create(const AID: string; AOwner: TOperations);
begin
  FProgram := TPaxProgram.Create(nil);
  FSelfVariable := Self;
  inherited;
end;

destructor TPaxOperation.Destroy;
begin
  ClearProgram;
  FProgram.Free;
  inherited;
end;

function TPaxOperation.DoExecute(CommandID: Integer; const Param: array of Variant): Variant;
var
  P: Pointer;

  procedure CompileAndExecute();
  begin
    if not FCompiled or (FProgram.CodePtr = nil) then
    begin
      AppCore.Logger.Write('正在编译脚本:' + Caption, mtInfo, 0);

      if (FScript = '') and Assigned(FOnNeedScript) then
        FOnNeedScript(GUID, FScript);

      if (FScript = '') then
        raise Exception.CreateFmt('%s-%s:说好的脚本呢', [Category, Caption]);

      if CompileProgram(FScript, FProgram, FSelfVariable) then
      begin
        FCompiled := True;
        FProgram.Run; //初始化
      end
      else begin
        FScript := ''; // 自动清空脚本后可重新加载
        OutputCompileError();
      end
    end;

    //全名是这种形式: 'UnitName.Something', 这里源文件不能带单元名!!!
    P := FProgram.GetAddress('DOEXECUTE');  // 注意：运行错误不会重新加载脚本
    if Assigned(P) then
      Result := TPaxExecProc(P)(CommandID, Param);
  end;

begin
  case CommandID of
    iOperationCommand_Clear: ClearProgram;
  else
    CompileAndExecute();
  end;
end;

procedure TPaxOperation.SetScript(const Value: string);
begin
  ClearProgram;
  FScript := Value;
end;


{ TDBScriptLoader }

procedure TDBScriptLoader.DoLoadScript(const ScriptID: string;
  var Script: string);
begin
  with FScriptData do
  begin
    OpenByKeyValue(ScriptID);
    if not Eof then
      Script := AsString['Script']
    else
      Script := '';
  end;
end;

procedure TDBScriptLoader.LoadScriptOperation;
begin
  AppCore.Logger.Write('正在加载脚本...', mtInfo, 0);
  with FScriptData do
  begin
    // 打开没有停用的
    OpenByFieldValue('Disabled', 0);
    while not Eof do
    begin
      with TPaxOperation.Create(AsString['ScriptID']) do
      begin
        Category := AsString['Category'];
        Caption := AsString['Caption'];
        Access := AsString['Access'];
        ImageName := AsString['ImageName'];
        ShortKey := TextToShortCut(AsString['ShortKey']);
        Flag := AsInteger['Flag'];
        Order := AsString['OrderNum'];
        CustomAttributes.Text := AsString['CustomAttributes'];
        Script := AsString['Script'];
        OnLoadScript := DoLoadScript;
      end;
      Next;
    end;
    Close;
  end;
end;

{ TLocalScriptLoader }

procedure TLocalScriptLoader.DoLoadScript(const ScriptID: string;
  var Script: string);
begin

end;

procedure TLocalScriptLoader.LoadScriptOperation;
begin

end;

end.

