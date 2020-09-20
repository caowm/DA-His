{$I PaxCompiler.def}

unit IMPORT_ActiveX;
interface
{$IFDEF MACOS}
procedure Register_ActiveX;
implementation
procedure Register_ActiveX;
begin
end;
end.
{$ENDIF}

uses
{$IFDEF DPULSAR}
  Winapi.ActiveX,
  System.Win.ComObj,
{$ELSE}
  ActiveX,
  ComObj,
{$ENDIF}
  PAXCOMP_OLE,
  PAXCOMP_CONSTANTS,
  PAXCOMP_BASESYMBOL_TABLE,
  PaxRegister,
  PaxCompiler;

procedure Register_ActiveX;



implementation

procedure Register_ActiveX;
begin
  CoInitialize(nil);

  RegisterHeader(0, 'function CreateOleObject(const ClassName: string): IDispatch;',
    @CreateOleObject);
  RegisterHeader(0, 'function GetActiveOleObject(const ClassName: string): IDispatch;',
    @GetActiveOleObject);

  RegisterRoutine(0, _strGetOLEProperty, _typeVOID, @ _GetOLEProperty, _ccSTDCALL);
  RegisterRoutine(0, _strSetOLEProperty, _typeVOID, @ _SetOLEProperty, _ccSTDCALL);

  GetOlePropProc := _GetOLEProperty;
  PutOlePropProc := _SetOLEProperty;
end;

end.
