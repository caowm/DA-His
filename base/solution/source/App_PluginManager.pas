{*
  插件管理器单元

  Copy from JVCL
*}

unit App_PluginManager;

interface

uses
  Windows,
  Graphics,
  Forms,
  SysUtils,
  Classes,
  App_Plugin;

type
  TNewCommandEvent = procedure(Sender: TObject; Command: TPluginCommand) of object;

  TBeforeLoadEvent = procedure(Sender: TObject; FileName: string; var
    AllowLoad: Boolean) of object;
  TAfterLoadEvent = procedure(Sender: TObject; FileName: string;
    const ALibHandle: THandle; var AllowLoad: Boolean) of object;
  TBeforeCommandsEvent = procedure(Sender: TObject; APlugIn: TPlugIn) of
    object;
  TAfterCommandsEvent = procedure(Sender: TObject; APlugIn: TPlugIn) of object;
  TPlgInErrorEvent = procedure(Sender: TObject; AError: Exception) of object;
  // End of Bianconi

  EPlugInError = class(Exception);
  ELoadPluginError = class(EPlugInError);
  // Bianconi
  EExtensionPlugInError = class(EPlugInError);
  EInitializationPlugInError = class(EPlugInError);
  EInitializationCustomPlugInError = class(EPlugInError);
  ECantRegisterPlugInError = class(EPlugInError);
  // End of Bianconi

  TPluginKind = (plgDLL, plgPackage, plgCustom);

  TPluginInfo = class(TObject)
  public
    PluginKind: TPluginKind;
    Handle: HINST;
    PlugIn: TPlugIn;
  end;

  TPluginManager = class(TComponent)
  private
    FPluginObject: TObject;

    FExtension: string;
    FPluginFolder: string;
    FPluginKind: TPluginKind;
    FPluginInfos: TList;
    FOnBeforeLoad: TBeforeLoadEvent;
    FOnAfterLoad: TAfterLoadEvent;
    FOnNewCommand: TNewCommandEvent;

    FOnBeforeNewCommand: TBeforeCommandsEvent;
    FOnAfterNewCommand: TAfterCommandsEvent;
    FOnPlugInError: TPlgInErrorEvent;
    FShowLoadPluginErrors: Boolean;
    procedure SetPluginKind(const Value: TPluginKind);
    procedure UnloadLibrary(Kind: TPluginKind; LibHandle: Integer);
  protected
    procedure SetExtension(const NewValue: string);
    function GetPlugin(Index: Integer): TPlugIn;
    function GetPluginCount: Integer;
    function DoBeforeLoad(const FileName: string): Boolean; virtual;
    function DoAfterLoad(const FileName: string; LibHandle: THandle): Boolean;
      virtual;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    procedure LoadPlugin(FileName: string; PlgKind: TPluginKind);
    procedure LoadPlugins;
    procedure UnloadPlugin(Index: Integer);
    procedure GetLoadedPlugins(PlugInList: TStrings);
    procedure SendMessage(PluginMessage: Longint; PluginParams: string);
    function AddCustomPlugin(PlugIn: TPlugIn; const FileName: string = ''):
      Boolean;

    property Plugins[Index: Integer]: TPlugIn read GetPlugin;
    property PluginCount: Integer read GetPluginCount;
    property PluginObject: TObject read FPluginObject write FPluginObject;
  published
    property PluginFolder: string read FPluginFolder write FPluginFolder;
    property Extension: string read FExtension write SetExtension;
    property PluginKind: TPluginKind read FPluginKind write SetPluginKind;
    property ShowLoadPluginErrors: Boolean read FShowLoadPluginErrors write
      FShowLoadPluginErrors default False;
    property OnBeforeLoad: TBeforeLoadEvent read FOnBeforeLoad write
      FOnBeforeLoad;
    property OnNewCommand: TNewCommandEvent read FOnNewCommand write
      FOnNewCommand;
    property OnAfterLoad: TAfterLoadEvent read FOnAfterLoad write FOnAfterLoad;
    property OnBeforeNewCommand: TBeforeCommandsEvent read FOnBeforeNewCommand
      write FOnBeforeNewCommand;
    property OnAfterNewCommand: TAfterCommandsEvent read FOnAfterNewCommand
      write FOnAfterNewCommand;
    property OnPlugInError: TPlgInErrorEvent read FOnPlugInError write
      FOnPlugInError;
  end;

implementation

const
  C_REGISTER_PLUGIN = 'RegisterPlugin';
  C_Extensions: array[plgDLL..plgCustom] of PChar = ('dll', 'bpl', 'xxx');

constructor TPluginManager.Create(AOwner: TComponent);
begin
  try
    inherited Create(AOwner);
    FPluginInfos := TList.Create;
    FPluginKind := plgDLL;
    FExtension := C_Extensions[FPluginKind];
  except
    on E: Exception do
    begin
      if not (csDesigning in ComponentState) and Assigned(FOnPlugInError) then
        FOnPlugInError(Self, E)
      else
        raise;
    end;
  end;
end;

destructor TPluginManager.Destroy;
begin
  // Free the loaded plugins
  while FPluginInfos.Count > 0 do
    UnloadPlugin(0);
  FPluginInfos.Free;
  inherited Destroy;
end;

function TPluginManager.DoAfterLoad(const FileName: string; LibHandle:
  THandle): Boolean;
begin
  Result := True;
  if Assigned(FOnAfterLoad) then
    FOnAfterLoad(Self, FileName, LibHandle, Result);
end;

function TPluginManager.DoBeforeLoad(const FileName: string): Boolean;
begin
  Result := True;
  if Assigned(FOnBeforeLoad) then
    FOnBeforeLoad(Self, FileName, Result);
end;

procedure TPluginManager.SetExtension(const NewValue: string);
begin
  try
    if FExtension <> NewValue then
    begin
      // (rb) No reason to block this
      if {(Length(NewValue) > 3) or} Length(NewValue) < 1 then
        raise EPlugInError.Create(RsEErrEmptyExt)
      else
        FExtension := NewValue;
    end;
  except
    on E: Exception do
    begin
      if not (csDesigning in ComponentState) and Assigned(FOnPlugInError) then
        FOnPlugInError(Self, E)
      else
        raise;
    end;
  end;
end;

procedure TPluginManager.SetPluginKind(const Value: TPluginKind);
begin
  if FPluginKind <> Value then
  begin
    if FExtension = C_Extensions[FPluginKind] then
      FExtension := C_Extensions[Value];
    FPluginKind := Value;
  end;
end;

function TPluginManager.GetPluginCount: Integer;
begin
  Result := FPluginInfos.Count;
end;

function TPluginManager.GetPlugin(Index: Integer): TPlugIn;
var
  PlgI: TPluginInfo;
begin
  PlgI := FPluginInfos.Items[Index];
  Result := PlgI.PlugIn;
end;

procedure TPluginManager.GetLoadedPlugins(PlugInList: TStrings);
var
  I: Integer;
begin
  PlugInList.BeginUpdate;
  try
    PlugInList.Clear;
    for I := 0 to FPluginInfos.Count - 1 do
      PlugInList.Add(Plugins[I].Name);
  finally
    PlugInList.EndUpdate;
  end;
end;

// Create and add plugin - if error occurs, the Plugin is not added to list

function TPluginManager.AddCustomPlugin(PlugIn: TPlugIn; const FileName: string
  = ''): Boolean;
var
  PlgInfo: TPluginInfo;
  Counter: Integer;
begin
  Result := False;
  try
    if Length(FileName) = 0 then
      Result := PlugIn.Initialize(Self, Application, 'CustomPlugin')
    else
      Result := PlugIn.Initialize(Self, Application, FileName);

    if not Result then
      Exit;

    PlgInfo := TPluginInfo.Create;
    PlgInfo.PluginKind := plgCustom;
    PlgInfo.PlugIn := PlugIn;

    FPluginInfos.Add(PlgInfo);

    try
      if Assigned(FOnBeforeNewCommand) then
        FOnBeforeNewCommand(Self, PlugIn);

      // Events for all new commands
      if Assigned(FOnNewCommand) then
        for Counter := 0 to PlugIn.Commands.Count - 1 do
          FOnNewCommand(Self, TPluginCommand(PlugIn.Commands[Counter]));
    finally
      if Assigned(FOnAfterNewCommand) then
        FOnAfterNewCommand(Self, PlugIn);
    end;
  except
    on E: Exception do
    begin
      if not (csDesigning in ComponentState) and Assigned(FOnPlugInError) then
        FOnPlugInError(Self, E)
      else
        raise;
    end;
  end;
end;

// Load a Plugin - either DLL or package

procedure TPluginManager.LoadPlugin(FileName: string; PlgKind: TPluginKind);
type
  TSxRegisterPlugin = function(Sender: TObject): TPlugIn; stdcall;
var
  Counter: Integer;
  LibHandle: Integer;
  RegisterProc: TSxRegisterPlugin;
  PlugIn: TPlugIn;
  NumCopies: Integer;
  PlgInfo: TPluginInfo;
begin
  if DoBeforeLoad(FileName) then
  begin
    LibHandle := 0;
    PlgInfo := nil;
    PlugIn := nil;
    try
      case PlgKind of
        plgDLL:
          LibHandle := SafeLoadLibrary(FileName);
        plgPackage:
          LibHandle := LoadPackage(FileName);
      end;

      if LibHandle = 0 then
        raise ELoadPluginError.CreateFmt(RsEPluginPackageNotFound, [FileName]);

      // Load the registration procedure
      RegisterProc := GetProcAddress(LibHandle, C_REGISTER_PLUGIN);

      if not Assigned(RegisterProc) then
        raise ELoadPluginError.CreateFmt(RsERegisterPluginNotFound,
          [C_REGISTER_PLUGIN, FileName]);

      // register the plugin
      PlugIn := RegisterProc(FPluginObject);

      if PlugIn = nil then
        raise ECantRegisterPlugInError.CreateFmt(RsERegisterPluginFailed,
          [C_REGISTER_PLUGIN, FileName]);

      // make sure we don't load more copies of the plugin than allowed
      if PlugIn.InstanceCount > 0 then // 0 = unlimited
      begin
        NumCopies := 0;
        for Counter := 0 to FPluginInfos.Count - 1 do
          if Plugins[Counter].PluginID = PlugIn.PluginID then
            Inc(NumCopies);

        if NumCopies >= PlugIn.InstanceCount then
        begin
          PlugIn.Free;
          Exit; // Todo : Don't know what Skipload does here
        end;
      end; // if Plugin.InstanceCount > 0

      // initialize the plugin and add to list
      if AddCustomPlugin(PlugIn, FileName) then
      begin
        PlgInfo := FPluginInfos.Last;
        PlgInfo.PluginKind := PlgKind;
        PlgInfo.Handle := LibHandle;
      end;

      if not DoAfterLoad(FileName, LibHandle) then
        UnloadPlugin(FPluginInfos.IndexOf(PlgInfo));
    except
      //!11    if - for whatever reason - an exception has occurred
      //            free Plugin and library
      // (rom) statements used twice could be wrapped in method
      on E: Exception do
      begin
        if PlgInfo <> nil then
          UnloadPlugin(FPluginInfos.IndexOf(PlgInfo))
        else
        begin
          FreeAndNil(PlugIn);
          if LibHandle <> 0 then
            UnloadLibrary(PlgKind, LibHandle);
        end;
        if not (csDesigning in ComponentState) and Assigned(FOnPlugInError) then
          FOnPlugInError(Self, E)
        else
          raise;
      end;
    end;
  end;
end;

// Load all plugins in the plugin-folder
// exceptions can only be seen through the OnErrorLoading-Event

procedure TPluginManager.LoadPlugins;
var
  FileName: string;
  Found: Integer;
  Path: string;
  Sr: TSearchRec;
begin
  // if the PluginPath is blank, we load from the app's folder.
  if FPluginFolder = '' then
    Path := ExtractFilePath(Application.ExeName)
  else
    Path := FPluginFolder;
  Path := IncludeTrailingPathDelimiter(Path);

  Found := FindFirst(Path + '*.' + FExtension, 0, Sr);
  try
    while Found = 0 do
    begin
      FileName := Sr.Name;
      //! If one plugin made problems -> no other plugins where loaded
      //! To avoid that the try-except block was wrapped around here...
      try
        LoadPlugin(Path + FileName, PluginKind);
      except
        // OnPluginError is already triggered in LoadPlugin if available
        {if not (csDesigning in ComponentState) and Assigned(FOnPlugInError) then
          FOnPlugInError(Self, E)
        else}
        if ShowLoadPluginErrors then
          Application.HandleException(Self);
      end;
      Found := FindNext(Sr);
    end;
  finally
    FindClose(Sr);
  end;
end;

procedure TPluginManager.UnloadPlugin(Index: Integer);
var
  PlgI: TPluginInfo;
begin
  PlgI := FPluginInfos.Items[Index];
  PlgI.PlugIn.Free;
  UnloadLibrary(PlgI.PluginKind, PlgI.Handle);
  PlgI.Free;
  FPluginInfos.Delete(Index);
end;

procedure TPluginManager.SendMessage(PluginMessage: Longint; PluginParams:
  string);
var
  I: Integer;
begin
  for I := 0 to FPluginInfos.Count - 1 do
    Plugins[I].SendPluginMessage(PluginMessage, PluginParams);
end;

procedure TPluginManager.UnloadLibrary(Kind: TPluginKind; LibHandle: Integer);
begin
  case Kind of
    plgDLL:
      FreeLibrary(LibHandle);
    plgPackage:
      UnloadPackage(LibHandle);
  end;
end;

end.

