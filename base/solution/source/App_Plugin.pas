{*
  ฒๅผþตฅิช

  Copy from JVCL
*}

unit App_Plugin;

interface

uses
  SysUtils,
  Forms,
  Graphics,
  Classes,
  ActnList;

const
  RsEFmtResNotFound = 'Resource not found: %s';
  RsEErrEmptyExt = 'Extension may not be empty';
  RsEPluginPackageNotFound = 'Plugin package not found: %s';
  RsERegisterPluginNotFound = 'Plugin function %0:s not found in %1:s';
  RsERegisterPluginFailed = 'Calling %0:s in %1:s failed';

type
  TPluginMessageEvent = procedure(Sender: TObject; APluginMessage: Longint; AMessageText: string) of
    object;
  TPluginInitializeEvent = procedure(Sender: TObject; var AllowLoad: Boolean) of object;
  TPluginCommand = class;
  TPluginCommands = class;

  TPlugIn = class(TComponent)
  private
    FPluginID: string;
    FAuthor: string;
    FCopyright: string;
    FDescription: string;
    FFileName: TFileName;
    FCommands: TPluginCommands;
    FHostApplication: TApplication;
    FManager: TComponent;
    FInstanceCount: Integer;
    FOnPluginMessage: TPluginMessageEvent;
    FOnInitialize: TPluginInitializeEvent;
    FOnConfigure: TNotifyEvent;
    FPluginVersion: string;
    //    function GetVersion: string;
    //    procedure SetVersion(newValue: string);
  protected
    procedure SetCommands(NewValue: TPluginCommands); virtual;
    procedure TriggerPluginMessageEvent(APluginMessage: Longint; AMessageText: string); virtual;
    procedure TriggerInitializeEvent(var AllowLoad: Boolean); virtual;
    procedure TriggerConfigureEvent; virtual;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Configure; virtual; stdcall;
    function Initialize(Manager: TComponent; HostApplication: TApplication;
      FileName: string): Boolean; virtual; stdcall;
    procedure SendPluginMessage(APluginMessage: Longint; AMessageText: string);
    property HostApplication: TApplication read FHostApplication;
    property Manager: TComponent read FManager;
    property FileName: TFileName read FFileName;
  published
    property Author: string read FAuthor write FAuthor;
    property Commands: TPluginCommands read FCommands write SetCommands;
    property Description: string read FDescription write FDescription;
    property Copyright: string read FCopyright write FCopyright;
    property InstanceCount: Integer read FInstanceCount write FInstanceCount default 1;
    property PluginID: string read FPluginID write FPluginID;
    //    property Version: string read GetVersion write SetVersion;
    property PluginVersion: string read FPluginVersion write FPluginVersion;
    property OnPluginMessage: TPluginMessageEvent read FOnPluginMessage write FOnPluginMessage;
    property OnInitialize: TPluginInitializeEvent read FOnInitialize write FOnInitialize;
    property OnConfigure: TNotifyEvent read FOnConfigure write FOnConfigure;
  end;

  TPluginCommand = class(TCollectionItem)
  private
    FName: string;
    FEnabled: Boolean;
    FCaption: string;
    FHint: string;
    FShortCut: TShortCut;
    FBitmap: TBitmap;
    FOnExecute: TNotifyEvent;
    FData: TObject;
    FTag: Integer;
    FOnChange: TNotifyEvent;
    procedure SetBitmap(Value: TBitmap);
    procedure SetEnabled(Value: Boolean);
    procedure SetCaption(const Value: string);
  protected
    function GetDisplayName: string; override;
    procedure DoChange(); virtual;
  published
    constructor Create(Collection: TCollection); override;
    destructor Destroy; override;
    procedure Execute(); virtual;

    property Enabled: Boolean read FEnabled write SetEnabled;
    property Bitmap: TBitmap read FBitmap write SetBitmap;
    property Caption: string read FCaption write SetCaption;
    property Hint: string read FHint write FHint;
    property ShortCut: TShortCut read FShortCut write FShortCut;
    property OnExecute: TNotifyEvent read FOnExecute write FOnExecute;
    property Name: string read FName write FName;
    property Data: TObject read FData write FData;
    property Tag: Integer read FTag write FTag;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
  end;

  TPluginCommands = class(TCollection)
  private
    FPlugin: TPlugIn;
  protected
    function GetItem(Index: Integer): TPluginCommand;
    procedure SetItem(Index: Integer; Value: TPluginCommand);
    function GetOwner: TPersistent; override;
    procedure SetItemName(AItem: TCollectionItem); override;
  public
    constructor Create(APlugIn: TPlugIn);
    property Items[index: Integer]: TPluginCommand read GetItem write SetItem; default;
  end;

implementation

//=== { TPlugin } ==========================================================

constructor TPlugIn.Create(AOwner: TComponent);
begin
  {
    // Create datamodule
    CreateNew(AOwner);
    DesignSize := Point(100, 100);

    // Create commands-collection
    FCommands := TPluginCommands.Create(Self);

    FInstanceCount := 1;
    if (ClassType <> TPlugIn) and not (csDesigning in ComponentState) then
    begin
      if not InitInheritedComponent(Self, TPlugIn) then
        raise EResNotFound.CreateFmt(RsEFmtResNotFound, [ClassName]);

      if OldCreateOrder then
        DoCreate;
    end;
  }
  inherited;

  FCommands := TPluginCommands.Create(Self);

  FInstanceCount := 1;
end;

destructor TPlugIn.Destroy;
begin
  Commands.Free;
  inherited Destroy;
end;

procedure TPlugIn.SetCommands(NewValue: TPluginCommands);
begin
  FCommands.Assign(NewValue);
end;

// Show Versionsstring defined in PlugCommon

{function TPlugin.GetVersion: string;
begin
  Result := C_VersionString;
end;

procedure TPlugin.SetVersion(newValue: string);
begin
end;}

// Here the plugin should verify if it CAN be loaded (e.g. Main application implements correct interface,
//      Dongle is there....)

function TPlugIn.Initialize(Manager: TComponent; HostApplication: TApplication; FileName: string):
  Boolean;
begin
  Result := True;
  FHostApplication := HostApplication;
  FFileName := FileName;
  FManager := Manager;
  TriggerInitializeEvent(Result);
end;

procedure TPlugIn.Configure;
begin
  TriggerConfigureEvent;
end;

procedure TPlugIn.TriggerPluginMessageEvent(APluginMessage: Longint; AMessageText: string);
begin
  if Assigned(FOnPluginMessage) then
    FOnPluginMessage(Self, APluginMessage, AMessageText);
end;

procedure TPlugIn.TriggerInitializeEvent(var AllowLoad: Boolean);
begin
  if Assigned(FOnInitialize) then
    FOnInitialize(Self, AllowLoad);
end;

procedure TPlugIn.TriggerConfigureEvent;
begin
  if Assigned(FOnConfigure) then
    FOnConfigure(Self);
end;

procedure TPlugIn.SendPluginMessage(APluginMessage: Integer; AMessageText: string);
begin
  TriggerPluginMessageEvent(APluginMessage, AMessageText);
end;

//=== { TPluginCommand } ===================================================

constructor TPluginCommand.Create(Collection: TCollection);
begin
  inherited Create(Collection);
  FEnabled := True;
  FBitmap := TBitmap.Create;
  FShortCut := 0;
end;

destructor TPluginCommand.Destroy;
begin
  FBitmap.Free;
  inherited Destroy;
end;

procedure TPluginCommand.DoChange();
begin
  if Assigned(FOnChange) then
    FOnChange(Self);
end;

procedure TPluginCommand.Execute;
begin
  if Assigned(FOnExecute) then
    FOnExecute(Self);
end;

function TPluginCommand.GetDisplayName: string;
begin
  Result := Name;
  if Result = '' then
    Result := inherited GetDisplayName;
end;

procedure TPluginCommand.SetBitmap(Value: TBitmap);
begin
  FBitmap.Assign(Value)
end;

//=== { TPluginCommands } ==================================================

constructor TPluginCommands.Create(APlugIn: TPlugIn);
begin
  inherited Create(TPluginCommand);
  FPlugin := APlugIn;
end;

function TPluginCommands.GetItem(Index: Integer): TPluginCommand;
begin
  Result := TPluginCommand(inherited GetItem(Index));
end;

function TPluginCommands.GetOwner: TPersistent;
begin
  Result := FPlugin;
end;

procedure TPluginCommands.SetItem(Index: Integer; Value: TPluginCommand);
begin
  inherited SetItem(Index, Value);
end;

procedure TPluginCommands.SetItemName(AItem: TCollectionItem);
var
  I: Integer;
  J: Integer;

  function NameUsed: Boolean;
  var
    AName: string;
  begin
    AName := Format('Command%d', [I]);
    J := AItem.Collection.Count - 1;
    while (J > -1) and not AnsiSameText(TPluginCommand(AItem.Collection.Items[J]).Name, AName) do
      Dec(J);
    Result := J > -1;
  end;

  procedure FindCmdIdx;
  begin
    I := 1;
    while (I < MaxInt) and NameUsed do
      Inc(I);
  end;

begin
  with TPluginCommand(AItem) do
    if Name = '' then
    begin
      FindCmdIdx;
      Name := Format('Command%d', [I]);
    end;
end;

procedure TPluginCommand.SetCaption(const Value: string);
begin
  FCaption := Value;
  DoChange;
end;

procedure TPluginCommand.SetEnabled(Value: Boolean);
begin
  if Value <> FEnabled then
  begin
    FEnabled := Value;
    DoChange;
  end;
end;

end.

