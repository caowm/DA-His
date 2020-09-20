unit App_PaxIDE;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  PaxProgram,
  PaxCompiler,
  App_Common,
  App_PaxCompiler,
  SynEditHighlighter,
  SynHighlighterPas,
  SynEdit,
  ActnList;

type
  TPaxIDEForm = class(TBaseView)
    SynEdit: TSynEdit;
    SynPasSyn: TSynPasSyn;
    ActionList: TActionList;
    CompileAct: TAction;
    RunAct: TAction;
    SaveAct: TAction;
    OpenAct: TAction;
    OpenDialog: TOpenDialog;
    SaveDialog: TSaveDialog;
    procedure CompileActExecute(Sender: TObject);
    procedure RunActExecute(Sender: TObject);
    procedure SaveActExecute(Sender: TObject);
    procedure OpenActExecute(Sender: TObject);
  private
    FProgram: TPaxProgram;
    function Compile(): Boolean;
    procedure Run();
  public
    procedure DoInitView(); override;
    function GetActionList(): TActionList; override;
  end;

implementation

{$R *.dfm}

{ TForm1 }

procedure TPaxIDEForm.DoInitView;
begin
  FProgram := TPaxProgram.Create(Self);

  ActionList.Images := AppCore.ToolBarImage.ImageList;
  CompileAct.ImageIndex := AppCore.ToolBarImage.IndexOf('Compile');
  RunAct.ImageIndex := AppCore.ToolBarImage.IndexOf('Run');
  OpenAct.ImageIndex := AppCore.ToolBarImage.IndexOf('Open');
  SaveAct.ImageIndex := AppCore.ToolBarImage.IndexOf('Save');
end;

function TPaxIDEForm.GetActionList: TActionList;
begin
  Result := ActionList;
end;

procedure TPaxIDEForm.CompileActExecute(Sender: TObject);
begin
  Compile;
end;

procedure TPaxIDEForm.RunActExecute(Sender: TObject);
begin
  Run
end;

procedure TPaxIDEForm.SaveActExecute(Sender: TObject);
begin
  if SaveDialog.Execute then
    SynEdit.Lines.SaveToFile(SaveDialog.FileName);
end;

procedure TPaxIDEForm.OpenActExecute(Sender: TObject);
begin
  if OpenDialog.Execute then
    SynEdit.Lines.LoadFromFile(OpenDialog.FileName);
end;

function TPaxIDEForm.Compile: Boolean;
var
  P: Pointer;

  procedure OutputMessages;
  var
    I: Integer;
    S: string;
  begin
    if Compiler.ErrorCount = 0 then
      S := '±‡“Î≥…π¶'
    else
    begin
      S := '±‡“Î≥ˆ¥Ì: ';
      for I := 0 to Compiler.ErrorCount - 1 do
        S := S + #13#10 + Format('%s-[%d, %d]: %s'#13#10'%s',
          [Compiler.ErrorModuleName[I], Compiler.ErrorLineNumber[I],
          Compiler.ErrorLinePos[I], Compiler.ErrorLine[I],
            Compiler.ErrorMessage[I]]);
    end;
    AppCore.Logger.Write(S);
  end;

begin
  Compiler.Reset;
  Compiler.RegisterLanguage(PasLanguage);
  Compiler.OnInclude := nil;
  Compiler.OnUsedUnit := nil;
  Compiler.AddModule('main', PasLanguage.LanguageName);
  Compiler.AddCode('main', SynEdit.Text);
  Result := Compiler.Compile(FProgram);
  OutputMessages();
end;

procedure TPaxIDEForm.Run;
begin
  if Compile then
    FProgram.Run;
end;


initialization
  TViewOperation.Create('PaxIDE', 'Pax IDE', '1010', '',
    'PaxIDE', 0, 0, TPaxIDEForm);
end.

