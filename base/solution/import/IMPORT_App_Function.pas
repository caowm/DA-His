unit IMPORT_App_Function;
interface
uses
  Classes,
  SysUtils,
  Windows,
  Messages,
  Forms,
  Dialogs,
  ZLib,
  jpeg,
  Menus,
  Controls,
  ActnList,
  Graphics,
  StdCtrls,
  TypInfo,
  StrUtils,
  IniFiles,
  ShellAPI,
  DB,
  Math,
  Types,
  Nb30,
  WinSock,
  App_Function,
  Variants,
  PaxCompiler,
  PaxRegister;
procedure RegisterIMPORT_App_Function;
implementation
function GetTempFile1(APrefix: string): string; 
begin
  result := App_Function.GetTempFile(APREFIX);
end;
function GetTempFile2(ATempPath, APrefix: string): string; 
begin
  result := App_Function.GetTempFile(ATEMPPATH,APREFIX);
end;
procedure RegisterIMPORT_App_Function;
var G, H: Integer;
begin
  H := RegisterNamespace(0, 'App_Function');
  RegisterHeader(H, 'procedure EnumDataSet(ADataSet: TDataSet; AEnumProc: TDatasetEnumProc; AParam: Variant);', @EnumDataSet);
  RegisterHeader(H, 'function DamerauLevenshteinDistance(const Str1, Str2: string): Integer;', @DamerauLevenshteinDistance);
  RegisterHeader(H, 'function StringSimilarityRatio(const Str1, Str2: string; IgnoreCase: Boolean): Double;', @StringSimilarityRatio);
  RegisterHeader(H, 'function MakeMethod(ACode: Pointer): TMethod;', @MakeMethod);
  RegisterHeader(H, 'function GetTempFile(APrefix: string): string; overload;', @GetTempFile1);
  RegisterHeader(H, 'function GetTempFile(ATempPath, APrefix: string): string; overload;', @GetTempFile2);
  RegisterHeader(H, 'function GetTempDirectory(): string;', @GetTempDirectory);
  RegisterHeader(H, 'function DelDirectory(const Source: string): Integer;', @DelDirectory);
  RegisterHeader(H, 'function SelectFile(const AFilter: string; var AFileName: string): Boolean;', @SelectFile);
  RegisterHeader(H, 'function RefString(const S: string): Pointer;', @RefString);
  RegisterHeader(H, 'procedure ReleaseString(P: Pointer);', @ReleaseString);
  RegisterHeader(H, 'procedure Compress(Source, Dest: TStream; BlockSize: Integer; OnProgress: TOnProgress = nil);', @Compress);
  RegisterHeader(H, 'procedure Decompress(Source, Dest: TStream; OnProgress: TOnProgress = nil);', @Decompress);
  RegisterHeader(H, 'procedure ShowOK(Msg: string);', @ShowOK);
  RegisterHeader(H, 'procedure ShowHelp(Content: string);', @ShowHelp);
  RegisterHeader(H, 'procedure ShowAbout(Content: string);', @ShowAbout);
  RegisterHeader(H, 'procedure ShowWarning(Msg: string);', @ShowWarning);
  RegisterHeader(H, 'procedure ShowError(Msg: string);', @ShowError);
  RegisterHeader(H, 'function ShowYesNo(Msg: string; YesOrNo: Boolean = True): Boolean;', @ShowYesNo);
  RegisterHeader(H, 'function ShowYesNoCancel(Msg: string): Integer;', @ShowYesNoCancel);
  RegisterHeader(H, 'function ShowSave(ATitle, AFilter: string; var AFileName: string; ADefaultExt: string = ''xls''): Boolean;', @ShowSave);
  RegisterHeader(H, 'function ShowOpen(ATitle, AFilter: string; var AFileName: string): Boolean;', @ShowOpen);
  RegisterHeader(H, 'function AlreadyRunning(): Boolean;', @AlreadyRunning);
  RegisterHeader(H, 'procedure AllowProgramTwiceOpen();', @AllowProgramTwiceOpen);
  RegisterHeader(H, 'function StrToXML(const s: string): string;', @StrToXML);
  RegisterHeader(H, 'procedure GetComponents(Owner: TComponent; ClassRef: TClass; List: TStrings; Skip: TComponent);', @GetComponents);
  RegisterHeader(H, 'function RMB(Num: Currency): string;', @RMB);
  RegisterHeader(H, 'function CreateLabel(AOwner: TComponent; AParent: TWinControl; const ATitle: string; ABounds: TRect): TLabel;', @CreateLabel);
  RegisterHeader(H, 'function CreateControl(AOwner: TComponent; AParent: TWinControl; AClass: TControlClass; ABounds: TRect): TControl;', @CreateControl);
  RegisterHeader(H, 'function CreateForm(AOwner: TComponent; AParent: TWinControl; const ATitle: string; ABounds: TRect; ABorderStyle: TBorderStyle): TForm;', @CreateForm);
  RegisterHeader(H, 'function CreateEdit(AOwner: TComponent; AParent: TWinControl; ABounds: TRect): TEdit;', @CreateEdit);
  RegisterHeader(H, 'function CreateButton(AOwner: TComponent; AParent: TWinControl; const ATitle: string; ABounds: TRect): TButton;', @CreateButton);
  RegisterHeader(H, 'function CreateGroupBox(AOwner: TComponent; AParent: TWinControl; const ATitle: string; ABounds: TRect): TGroupBox;', @CreateGroupBox);
  RegisterHeader(H, 'procedure ReadFromIni(Self: TPersistent; IniFile: TIniFile; const Section: string);', @ReadFromIni);
  RegisterHeader(H, 'procedure WriteToIni(Self: TPersistent; IniFile: TIniFile; const Section: string);', @WriteToIni);
  RegisterHeader(H, 'function GetPyOfHz(HzChar: PChar): string;', @GetPyOfHz);
  RegisterHeader(H, 'function GetPyHeadOfHz(HzChar: PChar): string;', @GetPyHeadOfHz);
  RegisterHeader(H, 'function GetPyHeadOfHzs(HzChars: string): string;', @GetPyHeadOfHzs);
  RegisterHeader(H, 'function GetPyOfHzs(HzChars, Seperator: string): string;', @GetPyOfHzs);
  RegisterHeader(H, 'function IsDouByte(C: Char): Boolean;', @IsDouByte);
  RegisterHeader(H, 'function GetPY(AStr: WideString): string;', @GetPY);
  RegisterHeader(H, 'function GetLocalName(): string;', @GetLocalName);
  RegisterHeader(H, 'function GetLocalIP: string;', @GetLocalIP);
  RegisterHeader(H, 'function GetNetBIOSAddress: string;', @GetNetBIOSAddress);
  RegisterHeader(H, 'function Inch2Cm(const Inch: Extended): Extended;', @Inch2Cm);
  RegisterHeader(H, 'function Cm2Inch(const Cm: Extended): Extended;', @Cm2Inch);
  RegisterHeader(H, 'procedure GetJpgResolution(JPGFile: string; var HorzRes, VertRes: Word);', @GetJpgResolution);
  RegisterHeader(H, 'procedure SetJpgResolution(JPGFile: string; dpix, dpiy: Word);', @SetJpgResolution);
  RegisterHeader(H, 'function GetCmdLineParam(const Param: string): string;', @GetCmdLineParam);
  RegisterHeader(H, 'function GetTextWidth(const AText: string; AFont: TFont): Integer;', @GetTextWidth);
  RegisterHeader(H, 'function HexToString(str: string): string;', @HexToString);
  RegisterHeader(H, 'function StringToHex(str: string): string;', @StringToHex);
  RegisterHeader(H, 'function GetCharCount(const AText: string): Integer;', @GetCharCount);
  RegisterHeader(H, 'function StringListToArray(Source: TStrings): TStringDynArray;', @StringListToArray);
  RegisterHeader(H, 'function DelimitedTextToArray(DelimitedText: string; Delimiter: Char='';''): TStringDynArray;', @DelimitedTextToArray);
  RegisterHeader(H, 'procedure PlaceFormBelowControl(ATarget: TForm; AControl: TControl);', @PlaceFormBelowControl);
end;
initialization
  RegisterIMPORT_App_Function;
end.

