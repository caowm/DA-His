{$I PaxCompiler.def}

unit IMPORT_Forms;
interface
uses
  SysUtils,
  Classes,
{$IFDEF DPULSAR}
  Winapi.Messages,
  Winapi.Windows,
  Vcl.Graphics,
  Vcl.Menus,
  Vcl.Controls,
  Vcl.ActnList,
  Vcl.Forms,
{$ELSE}
  Messages,
  Windows,
  Graphics,
  Menus,
  Controls,
  ActnList,
  Forms,
{$ENDIF}
  HelpIntfs,
  Variants,
  PaxRegister,
  PaxCompiler;
procedure Register_Forms;
implementation
function TControlScrollBar_GetKind(Self:TControlScrollBar):TScrollBarKind;
begin
  result := Self.Kind;
end;
function TControlScrollBar_GetScrollPos(Self:TControlScrollBar):Integer;
begin
  result := Self.ScrollPos;
end;
function TCustomForm_GetActive(Self:TCustomForm):Boolean;
begin
  result := Self.Active;
end;
function TCustomForm_GetBorderStyle(Self:TCustomForm):TFormBorderStyle;
begin
  result := Self.BorderStyle;
end;
procedure TCustomForm_PutBorderStyle(Self:TCustomForm;const Value: TFormBorderStyle);
begin
  Self.BorderStyle := Value;
end;
function TCustomForm_GetDesigner(Self:TCustomForm):IDesignerHook;
begin
  result := Self.Designer;
end;
procedure TCustomForm_PutDesigner(Self:TCustomForm;const Value: IDesignerHook);
begin
  Self.Designer := Value;
end;
function TCustomForm_GetDropTarget(Self:TCustomForm):Boolean;
begin
  result := Self.DropTarget;
end;
procedure TCustomForm_PutDropTarget(Self:TCustomForm;const Value: Boolean);
begin
  Self.DropTarget := Value;
end;
function TCustomForm_GetFormState(Self:TCustomForm):TFormState;
begin
  result := Self.FormState;
end;
function TCustomForm_GetHelpFile(Self:TCustomForm):string;
begin
  result := Self.HelpFile;
end;
procedure TCustomForm_PutHelpFile(Self:TCustomForm;const Value: string);
begin
  Self.HelpFile := Value;
end;
function TCustomForm_GetKeyPreview(Self:TCustomForm):Boolean;
begin
  result := Self.KeyPreview;
end;
procedure TCustomForm_PutKeyPreview(Self:TCustomForm;const Value: Boolean);
begin
  Self.KeyPreview := Value;
end;
function TCustomForm_GetMonitor(Self:TCustomForm):TMonitor;
begin
  result := Self.Monitor;
end;
function TCustomForm_GetOleFormObject(Self:TCustomForm):IOleForm;
begin
  result := Self.OleFormObject;
end;
procedure TCustomForm_PutOleFormObject(Self:TCustomForm;const Value: IOleForm);
begin
  Self.OleFormObject := Value;
end;
function TCustomForm_GetScreenSnap(Self:TCustomForm):Boolean;
begin
  result := Self.ScreenSnap;
end;
procedure TCustomForm_PutScreenSnap(Self:TCustomForm;const Value: Boolean);
begin
  Self.ScreenSnap := Value;
end;
function TCustomForm_GetSnapBuffer(Self:TCustomForm):Integer;
begin
  result := Self.SnapBuffer;
end;
procedure TCustomForm_PutSnapBuffer(Self:TCustomForm;const Value: Integer);
begin
  Self.SnapBuffer := Value;
end;
function TCustomForm_GetWindowState(Self:TCustomForm):TWindowState;
begin
  result := Self.WindowState;
end;
procedure TCustomForm_PutWindowState(Self:TCustomForm;const Value: TWindowState);
begin
  Self.WindowState := Value;
end;
function TMonitor_GetMonitorNum(Self:TMonitor):Integer;
begin
  result := Self.MonitorNum;
end;
function TMonitor_GetLeft(Self:TMonitor):Integer;
begin
  result := Self.Left;
end;
function TMonitor_GetHeight(Self:TMonitor):Integer;
begin
  result := Self.Height;
end;
function TMonitor_GetTop(Self:TMonitor):Integer;
begin
  result := Self.Top;
end;
function TMonitor_GetWidth(Self:TMonitor):Integer;
begin
  result := Self.Width;
end;
function TMonitor_GetBoundsRect(Self:TMonitor):TRect;
begin
  result := Self.BoundsRect;
end;
function TMonitor_GetWorkareaRect(Self:TMonitor):TRect;
begin
  result := Self.WorkareaRect;
end;
function TMonitor_GetPrimary(Self:TMonitor):Boolean;
begin
  result := Self.Primary;
end;
function TScreen_GetActiveCustomForm(Self:TScreen):TCustomForm;
begin
  result := Self.ActiveCustomForm;
end;
function TScreen_GetActiveForm(Self:TScreen):TForm;
begin
  result := Self.ActiveForm;
end;
function TScreen_GetCustomFormCount(Self:TScreen):Integer;
begin
  result := Self.CustomFormCount;
end;
function TScreen_GetCustomForms(Self:TScreen;Index: Integer):TCustomForm;
begin
  result := Self.CustomForms[Index];
end;
function TScreen_GetDataModuleCount(Self:TScreen):Integer;
begin
  result := Self.DataModuleCount;
end;
function TScreen_GetMonitorCount(Self:TScreen):Integer;
begin
  result := Self.MonitorCount;
end;
function TScreen_GetMonitors(Self:TScreen;Index: Integer):TMonitor;
begin
  result := Self.Monitors[Index];
end;
function TScreen_GetDesktopRect(Self:TScreen):TRect;
begin
  result := Self.DesktopRect;
end;
function TScreen_GetDesktopHeight(Self:TScreen):Integer;
begin
  result := Self.DesktopHeight;
end;
function TScreen_GetDesktopLeft(Self:TScreen):Integer;
begin
  result := Self.DesktopLeft;
end;
function TScreen_GetDesktopTop(Self:TScreen):Integer;
begin
  result := Self.DesktopTop;
end;
function TScreen_GetDesktopWidth(Self:TScreen):Integer;
begin
  result := Self.DesktopWidth;
end;
function TScreen_GetWorkAreaRect(Self:TScreen):TRect;
begin
  result := Self.WorkAreaRect;
end;
function TScreen_GetWorkAreaHeight(Self:TScreen):Integer;
begin
  result := Self.WorkAreaHeight;
end;
function TScreen_GetWorkAreaLeft(Self:TScreen):Integer;
begin
  result := Self.WorkAreaLeft;
end;
function TScreen_GetWorkAreaTop(Self:TScreen):Integer;
begin
  result := Self.WorkAreaTop;
end;
function TScreen_GetWorkAreaWidth(Self:TScreen):Integer;
begin
  result := Self.WorkAreaWidth;
end;
function TScreen_GetFormCount(Self:TScreen):Integer;
begin
  result := Self.FormCount;
end;
function TScreen_GetForms(Self:TScreen;Index: Integer):TForm;
begin
  result := Self.Forms[Index];
end;
function TScreen_GetDefaultIme(Self:TScreen):string;
begin
  result := Self.DefaultIme;
end;
function TScreen_GetHeight(Self:TScreen):Integer;
begin
  result := Self.Height;
end;
function TScreen_GetPixelsPerInch(Self:TScreen):Integer;
begin
  result := Self.PixelsPerInch;
end;
function TScreen_GetWidth(Self:TScreen):Integer;
begin
  result := Self.Width;
end;
function TApplication_GetActive(Self:TApplication):Boolean;
begin
  result := Self.Active;
end;
function TApplication_GetAllowTesting(Self:TApplication):Boolean;
begin
  result := Self.AllowTesting;
end;
procedure TApplication_PutAllowTesting(Self:TApplication;const Value: Boolean);
begin
  Self.AllowTesting := Value;
end;
function TApplication_GetAutoDragDocking(Self:TApplication):Boolean;
begin
  result := Self.AutoDragDocking;
end;
procedure TApplication_PutAutoDragDocking(Self:TApplication;const Value: Boolean);
begin
  Self.AutoDragDocking := Value;
end;
function TApplication_GetCurrentHelpFile(Self:TApplication):string;
begin
  result := Self.CurrentHelpFile;
end;
function TApplication_GetExeName(Self:TApplication):string;
begin
  result := Self.ExeName;
end;
function TApplication_GetHelpFile(Self:TApplication):string;
begin
  result := Self.HelpFile;
end;
procedure TApplication_PutHelpFile(Self:TApplication;const Value: string);
begin
  Self.HelpFile := Value;
end;
function TApplication_GetHint(Self:TApplication):string;
begin
  result := Self.Hint;
end;
procedure TApplication_PutHint(Self:TApplication;const Value: string);
begin
  Self.Hint := Value;
end;
function TApplication_GetHintHidePause(Self:TApplication):Integer;
begin
  result := Self.HintHidePause;
end;
procedure TApplication_PutHintHidePause(Self:TApplication;const Value: Integer);
begin
  Self.HintHidePause := Value;
end;
function TApplication_GetHintPause(Self:TApplication):Integer;
begin
  result := Self.HintPause;
end;
procedure TApplication_PutHintPause(Self:TApplication;const Value: Integer);
begin
  Self.HintPause := Value;
end;
function TApplication_GetHintShortCuts(Self:TApplication):Boolean;
begin
  result := Self.HintShortCuts;
end;
procedure TApplication_PutHintShortCuts(Self:TApplication;const Value: Boolean);
begin
  Self.HintShortCuts := Value;
end;
function TApplication_GetHintShortPause(Self:TApplication):Integer;
begin
  result := Self.HintShortPause;
end;
procedure TApplication_PutHintShortPause(Self:TApplication;const Value: Integer);
begin
  Self.HintShortPause := Value;
end;
function TApplication_GetMainForm(Self:TApplication):TForm;
begin
  result := Self.MainForm;
end;
function TApplication_GetBiDiKeyboard(Self:TApplication):string;
begin
  result := Self.BiDiKeyboard;
end;
procedure TApplication_PutBiDiKeyboard(Self:TApplication;const Value: string);
begin
  Self.BiDiKeyboard := Value;
end;
function TApplication_GetNonBiDiKeyboard(Self:TApplication):string;
begin
  result := Self.NonBiDiKeyboard;
end;
procedure TApplication_PutNonBiDiKeyboard(Self:TApplication;const Value: string);
begin
  Self.NonBiDiKeyboard := Value;
end;
function TApplication_GetShowHint(Self:TApplication):Boolean;
begin
  result := Self.ShowHint;
end;
procedure TApplication_PutShowHint(Self:TApplication;const Value: Boolean);
begin
  Self.ShowHint := Value;
end;
function TApplication_GetShowMainForm(Self:TApplication):Boolean;
begin
  result := Self.ShowMainForm;
end;
procedure TApplication_PutShowMainForm(Self:TApplication;const Value: Boolean);
begin
  Self.ShowMainForm := Value;
end;
function TApplication_GetTerminated(Self:TApplication):Boolean;
begin
  result := Self.Terminated;
end;
function TApplication_GetTitle(Self:TApplication):string;
begin
  result := Self.Title;
end;
procedure TApplication_PutTitle(Self:TApplication;const Value: string);
begin
  Self.Title := Value;
end;
function TApplication_GetUpdateFormatSettings(Self:TApplication):Boolean;
begin
  result := Self.UpdateFormatSettings;
end;
procedure TApplication_PutUpdateFormatSettings(Self:TApplication;const Value: Boolean);
begin
  Self.UpdateFormatSettings := Value;
end;
function TApplication_GetUpdateMetricSettings(Self:TApplication):Boolean;
begin
  result := Self.UpdateMetricSettings;
end;
procedure TApplication_PutUpdateMetricSettings(Self:TApplication;const Value: Boolean);
begin
  Self.UpdateMetricSettings := Value;
end;
procedure Register_Forms;
var G, H: Integer;
begin
  H := RegisterNamespace(0, 'Forms');
  // Begin of class TScrollingWinControl
  G := RegisterClassType(H, TScrollingWinControl);
  // End of class TScrollingWinControl
  // Begin of class TCustomForm
  G := RegisterClassType(H, TCustomForm);
  // End of class TCustomForm
  // Begin of class TForm
  G := RegisterClassType(H, TForm);
  // End of class TForm
  // Begin of class TMonitor
  G := RegisterClassType(H, TMonitor);
  // End of class TMonitor
  RegisterRTTIType(H, TypeInfo(TScrollBarKind));
  RegisterRTTIType(H, TypeInfo(TScrollBarInc));
  RegisterRTTIType(H, TypeInfo(TScrollBarStyle));
  // Begin of class TControlScrollBar
  G := RegisterClassType(H, TControlScrollBar);
  RegisterHeader(G, 
       'procedure Assign(Source: TPersistent); override;',
       @TControlScrollBar.Assign);
  RegisterHeader(G, 
       'procedure ChangeBiDiPosition;',
       @TControlScrollBar.ChangeBiDiPosition);
  RegisterFakeHeader(G,
       'function TControlScrollBar_GetKind:TScrollBarKind;',
       @TControlScrollBar_GetKind);
  RegisterProperty(G,
       'property Kind:TScrollBarKind read TControlScrollBar_GetKind;');
  RegisterHeader(G, 
       'function IsScrollBarVisible: Boolean;',
       @TControlScrollBar.IsScrollBarVisible);
  RegisterFakeHeader(G,
       'function TControlScrollBar_GetScrollPos:Integer;',
       @TControlScrollBar_GetScrollPos);
  RegisterProperty(G,
       'property ScrollPos:Integer read TControlScrollBar_GetScrollPos;');
  RegisterHeader(G,
       'constructor Create;',
       @TControlScrollBar.Create);
  // End of class TControlScrollBar
  RegisterRTTIType(H, TypeInfo(TWindowState));
  // Begin of class TScrollingWinControl
  G := RegisterClassType(H, TScrollingWinControl);
  RegisterHeader(G, 
       'constructor Create(AOwner: TComponent); override;',
       @TScrollingWinControl.Create);
  RegisterHeader(G, 
       'destructor Destroy; override;',
       @TScrollingWinControl.Destroy);
  RegisterHeader(G, 
       'procedure DisableAutoRange;',
       @TScrollingWinControl.DisableAutoRange);
  RegisterHeader(G, 
       'procedure EnableAutoRange;',
       @TScrollingWinControl.EnableAutoRange);
  // End of class TScrollingWinControl
  RegisterRTTIType(H, TypeInfo(TFormBorderStyle));
  RegisterRTTIType(H, TypeInfo(TBorderStyle));
  // Begin of class TScrollBox
  G := RegisterClassType(H, TScrollBox);
  RegisterHeader(G, 
       'constructor Create(AOwner: TComponent); override;',
       @TScrollBox.Create);
  // End of class TScrollBox
  // Begin of class TCustomFrame
  G := RegisterClassType(H, TCustomFrame);
  RegisterHeader(G, 
       'constructor Create(AOwner: TComponent); override;',
       @TCustomFrame.Create);
  // End of class TCustomFrame
  RegisterClassReferenceType(H, 'TCustomFrameClass');
  // Begin of class TFrame
  G := RegisterClassType(H, TFrame);
  RegisterHeader(G,
       'constructor Create(AOwner: TComponent); override;',
       @TFrame.Create);
  // End of class TFrame
  // Begin of interface IDesignerHook
  G := RegisterInterfaceType(H, 'IDesignerHook',IDesignerHook);
  RegisterSupportedInterface(G, 'IDesignerNotify', IDesignerNotify);
  RegisterHeader(G, 
       'function GetCustomForm: TCustomForm;', nil,1);
  RegisterHeader(G, 
       'procedure SetCustomForm(Value: TCustomForm);', nil,2);
  RegisterHeader(G, 
       'function GetIsControl: Boolean;', nil,3);
  RegisterHeader(G, 
       'procedure SetIsControl(Value: Boolean);', nil,4);
  RegisterHeader(G, 
       'procedure PaintGrid;', nil,6);
  RegisterHeader(G, 
       'procedure ValidateRename(AComponent: TComponent;      const CurName, NewName: string);', nil,7);
  RegisterHeader(G, 
       'function UniqueName(const BaseName: string): string;', nil,8);
  RegisterHeader(G, 
       'function GetRoot: TComponent;', nil,9);
  RegisterHeader(G,'property IsControl: Boolean read GetIsControl write SetIsControl;', nil);
  RegisterHeader(G,'property Form: TCustomForm read GetCustomForm write SetCustomForm;', nil);
  // End of interface IDesignerHook
  // Begin of interface IOleForm
  G := RegisterInterfaceType(H, 'IOleForm',IOleForm);
  RegisterHeader(G, 
       'procedure OnDestroy;', nil,4);
  RegisterHeader(G, 
       'procedure OnResize;', nil,5);
  // End of interface IOleForm
  RegisterRTTIType(H, TypeInfo(TFormStyle));
  RegisterRTTIType(H, TypeInfo(TBorderIcon));
  RegisterRTTIType(H, TypeInfo(TBorderIcons));
  RegisterRTTIType(H, TypeInfo(TPosition));
  RegisterRTTIType(H, TypeInfo(TDefaultMonitor));
  RegisterRTTIType(H, TypeInfo(TPrintScale));
  RegisterRTTIType(H, TypeInfo(TShowAction));
  RegisterRTTIType(H, TypeInfo(TTileMode));
  RegisterRTTIType(H, TypeInfo(TCloseAction));
  RegisterRTTIType(H, TypeInfo(TFormState));
  // Begin of class TCustomForm
  G := RegisterClassType(H, TCustomForm);
  RegisterHeader(G, 
       'constructor Create(AOwner: TComponent); override;',
       @TCustomForm.Create);
  RegisterHeader(G, 
       'constructor CreateNew(AOwner: TComponent; Dummy: Integer = 0); virtual;',
       @TCustomForm.CreateNew);
  RegisterHeader(G, 
       'destructor Destroy; override;',
       @TCustomForm.Destroy);
  RegisterHeader(G, 
       'procedure AfterConstruction; override;',
       @TCustomForm.AfterConstruction);
  RegisterHeader(G, 
       'procedure BeforeDestruction; override;',
       @TCustomForm.BeforeDestruction);
  RegisterHeader(G, 
       'procedure Close;',
       @TCustomForm.Close);
  RegisterHeader(G, 
       'function CloseQuery: Boolean; virtual;',
       @TCustomForm.CloseQuery);
  RegisterHeader(G, 
       'procedure DefaultHandler(var Message); override;',
       @TCustomForm.DefaultHandler);
  RegisterHeader(G, 
       'procedure Hide;',
       @TCustomForm.Hide);
  RegisterHeader(G, 
       'procedure MakeFullyVisible(AMonitor: TMonitor = nil);',
       @TCustomForm.MakeFullyVisible);
  RegisterHeader(G, 
       'procedure Print;',
       @TCustomForm.Print);
  RegisterHeader(G, 
       'procedure Release;',
       @TCustomForm.Release);
  RegisterHeader(G, 
       'procedure SetFocus; override;',
       @TCustomForm.SetFocus);
  RegisterHeader(G, 
       'procedure Show;',
       @TCustomForm.Show);
  RegisterHeader(G, 
       'function ShowModal: Integer; virtual;',
       @TCustomForm.ShowModal);
  RegisterFakeHeader(G,
       'function TCustomForm_GetActive:Boolean;',
       @TCustomForm_GetActive);
  RegisterProperty(G,
       'property Active:Boolean read TCustomForm_GetActive;');
  RegisterFakeHeader(G,
       'function TCustomForm_GetBorderStyle:TFormBorderStyle;',
       @TCustomForm_GetBorderStyle);
  RegisterFakeHeader(G,
       'procedure TCustomForm_PutBorderStyle(const Value: TFormBorderStyle);',
       @TCustomForm_PutBorderStyle);
  RegisterProperty(G,
       'property BorderStyle:TFormBorderStyle read TCustomForm_GetBorderStyle write TCustomForm_PutBorderStyle;');
  RegisterFakeHeader(G,
       'function TCustomForm_GetDesigner:IDesignerHook;',
       @TCustomForm_GetDesigner);
  RegisterFakeHeader(G,
       'procedure TCustomForm_PutDesigner(const Value: IDesignerHook);',
       @TCustomForm_PutDesigner);
  RegisterProperty(G,
       'property Designer:IDesignerHook read TCustomForm_GetDesigner write TCustomForm_PutDesigner;');
  RegisterFakeHeader(G,
       'function TCustomForm_GetDropTarget:Boolean;',
       @TCustomForm_GetDropTarget);
  RegisterFakeHeader(G,
       'procedure TCustomForm_PutDropTarget(const Value: Boolean);',
       @TCustomForm_PutDropTarget);
  RegisterProperty(G,
       'property DropTarget:Boolean read TCustomForm_GetDropTarget write TCustomForm_PutDropTarget;');
  RegisterFakeHeader(G,
       'function TCustomForm_GetFormState:TFormState;',
       @TCustomForm_GetFormState);
  RegisterProperty(G,
       'property FormState:TFormState read TCustomForm_GetFormState;');
  RegisterFakeHeader(G,
       'function TCustomForm_GetHelpFile:string;',
       @TCustomForm_GetHelpFile);
  RegisterFakeHeader(G,
       'procedure TCustomForm_PutHelpFile(const Value: string);',
       @TCustomForm_PutHelpFile);
  RegisterProperty(G,
       'property HelpFile:string read TCustomForm_GetHelpFile write TCustomForm_PutHelpFile;');
  RegisterFakeHeader(G,
       'function TCustomForm_GetKeyPreview:Boolean;',
       @TCustomForm_GetKeyPreview);
  RegisterFakeHeader(G,
       'procedure TCustomForm_PutKeyPreview(const Value: Boolean);',
       @TCustomForm_PutKeyPreview);
  RegisterProperty(G,
       'property KeyPreview:Boolean read TCustomForm_GetKeyPreview write TCustomForm_PutKeyPreview;');
  RegisterFakeHeader(G,
       'function TCustomForm_GetMonitor:TMonitor;',
       @TCustomForm_GetMonitor);
  RegisterProperty(G,
       'property Monitor:TMonitor read TCustomForm_GetMonitor;');
  RegisterFakeHeader(G,
       'function TCustomForm_GetOleFormObject:IOleForm;',
       @TCustomForm_GetOleFormObject);
  RegisterFakeHeader(G,
       'procedure TCustomForm_PutOleFormObject(const Value: IOleForm);',
       @TCustomForm_PutOleFormObject);
  RegisterProperty(G,
       'property OleFormObject:IOleForm read TCustomForm_GetOleFormObject write TCustomForm_PutOleFormObject;');
  RegisterFakeHeader(G,
       'function TCustomForm_GetScreenSnap:Boolean;',
       @TCustomForm_GetScreenSnap);
  RegisterFakeHeader(G,
       'procedure TCustomForm_PutScreenSnap(const Value: Boolean);',
       @TCustomForm_PutScreenSnap);
  RegisterProperty(G,
       'property ScreenSnap:Boolean read TCustomForm_GetScreenSnap write TCustomForm_PutScreenSnap;');
  RegisterFakeHeader(G,
       'function TCustomForm_GetSnapBuffer:Integer;',
       @TCustomForm_GetSnapBuffer);
  RegisterFakeHeader(G,
       'procedure TCustomForm_PutSnapBuffer(const Value: Integer);',
       @TCustomForm_PutSnapBuffer);
  RegisterProperty(G,
       'property SnapBuffer:Integer read TCustomForm_GetSnapBuffer write TCustomForm_PutSnapBuffer;');
  RegisterFakeHeader(G,
       'function TCustomForm_GetWindowState:TWindowState;',
       @TCustomForm_GetWindowState);
  RegisterFakeHeader(G,
       'procedure TCustomForm_PutWindowState(const Value: TWindowState);',
       @TCustomForm_PutWindowState);
  RegisterProperty(G,
       'property WindowState:TWindowState read TCustomForm_GetWindowState write TCustomForm_PutWindowState;');
  // End of class TCustomForm
  RegisterClassReferenceType(H, 'TCustomFormClass');
  RegisterRTTIType(H, TypeInfo(TActiveFormBorderStyle));
  // Begin of class TCustomActiveForm
  G := RegisterClassType(H, TCustomActiveForm);
  RegisterHeader(G, 
       'constructor Create(AOwner: TComponent); override;',
       @TCustomActiveForm.Create);
  // End of class TCustomActiveForm
  // Begin of class TForm
  G := RegisterClassType(H, TForm);
  RegisterHeader(G, 
       'procedure ArrangeIcons;',
       @TForm.ArrangeIcons);
  RegisterHeader(G, 
       'procedure Cascade;',
       @TForm.Cascade);
  RegisterHeader(G, 
       'procedure Next;',
       @TForm.Next);
  RegisterHeader(G, 
       'procedure Previous;',
       @TForm.Previous);
  RegisterHeader(G, 
       'procedure Tile;',
       @TForm.Tile);
  RegisterHeader(G,
       'constructor CreateNew(AOwner: TComponent; Dummy: Integer = 0); override;',
       @TForm.CreateNew);
  RegisterHeader(G,
       'constructor Create(AOwner: TComponent); override;',
       @TForm.Create);
  // End of class TForm
  RegisterClassReferenceType(H, 'TFormClass');
  // Begin of class TCustomDockForm
  G := RegisterClassType(H, TCustomDockForm);
  RegisterHeader(G, 
       'constructor Create(AOwner: TComponent); override;',
       @TCustomDockForm.Create);
  // End of class TCustomDockForm
  // Begin of class TMonitor
  G := RegisterClassType(H, TMonitor);
  RegisterFakeHeader(G,
       'function TMonitor_GetMonitorNum:Integer;',
       @TMonitor_GetMonitorNum);
  RegisterProperty(G,
       'property MonitorNum:Integer read TMonitor_GetMonitorNum;');
  RegisterFakeHeader(G,
       'function TMonitor_GetLeft:Integer;',
       @TMonitor_GetLeft);
  RegisterProperty(G,
       'property Left:Integer read TMonitor_GetLeft;');
  RegisterFakeHeader(G,
       'function TMonitor_GetHeight:Integer;',
       @TMonitor_GetHeight);
  RegisterProperty(G,
       'property Height:Integer read TMonitor_GetHeight;');
  RegisterFakeHeader(G,
       'function TMonitor_GetTop:Integer;',
       @TMonitor_GetTop);
  RegisterProperty(G,
       'property Top:Integer read TMonitor_GetTop;');
  RegisterFakeHeader(G,
       'function TMonitor_GetWidth:Integer;',
       @TMonitor_GetWidth);
  RegisterProperty(G,
       'property Width:Integer read TMonitor_GetWidth;');
  RegisterFakeHeader(G,
       'function TMonitor_GetBoundsRect:TRect;',
       @TMonitor_GetBoundsRect);
  RegisterProperty(G,
       'property BoundsRect:TRect read TMonitor_GetBoundsRect;');
  RegisterFakeHeader(G,
       'function TMonitor_GetWorkareaRect:TRect;',
       @TMonitor_GetWorkareaRect);
  RegisterProperty(G,
       'property WorkareaRect:TRect read TMonitor_GetWorkareaRect;');
  RegisterFakeHeader(G,
       'function TMonitor_GetPrimary:Boolean;',
       @TMonitor_GetPrimary);
  RegisterProperty(G,
       'property Primary:Boolean read TMonitor_GetPrimary;');
  RegisterHeader(G,
       'constructor Create;',
       @TMonitor.Create);
  // End of class TMonitor
  RegisterRTTIType(H, TypeInfo(TMonitorDefaultTo));
  // Begin of class TScreen
  G := RegisterClassType(H, TScreen);
  RegisterHeader(G, 
       'constructor Create(AOwner: TComponent); override;',
       @TScreen.Create);
  RegisterHeader(G, 
       'destructor Destroy; override;',
       @TScreen.Destroy);
  RegisterHeader(G, 
       'procedure DisableAlign;',
       @TScreen.DisableAlign);
  RegisterHeader(G, 
       'procedure EnableAlign;',
       @TScreen.EnableAlign);
  RegisterHeader(G, 
       'procedure Realign;',
       @TScreen.Realign);
  RegisterHeader(G, 
       'procedure ResetFonts;',
       @TScreen.ResetFonts);
  RegisterFakeHeader(G,
       'function TScreen_GetActiveCustomForm:TCustomForm;',
       @TScreen_GetActiveCustomForm);
  RegisterProperty(G,
       'property ActiveCustomForm:TCustomForm read TScreen_GetActiveCustomForm;');
  RegisterFakeHeader(G,
       'function TScreen_GetActiveForm:TForm;',
       @TScreen_GetActiveForm);
  RegisterProperty(G,
       'property ActiveForm:TForm read TScreen_GetActiveForm;');
  RegisterFakeHeader(G,
       'function TScreen_GetCustomFormCount:Integer;',
       @TScreen_GetCustomFormCount);
  RegisterProperty(G,
       'property CustomFormCount:Integer read TScreen_GetCustomFormCount;');
  RegisterFakeHeader(G,
       'function TScreen_GetCustomForms(Index: Integer):TCustomForm;',
       @TScreen_GetCustomForms);
  RegisterProperty(G,
       'property CustomForms[Index: Integer]:TCustomForm read TScreen_GetCustomForms;');
  RegisterFakeHeader(G,
       'function TScreen_GetDataModuleCount:Integer;',
       @TScreen_GetDataModuleCount);
  RegisterProperty(G,
       'property DataModuleCount:Integer read TScreen_GetDataModuleCount;');
  RegisterFakeHeader(G,
       'function TScreen_GetMonitorCount:Integer;',
       @TScreen_GetMonitorCount);
  RegisterProperty(G,
       'property MonitorCount:Integer read TScreen_GetMonitorCount;');
  RegisterFakeHeader(G,
       'function TScreen_GetMonitors(Index: Integer):TMonitor;',
       @TScreen_GetMonitors);
  RegisterProperty(G,
       'property Monitors[Index: Integer]:TMonitor read TScreen_GetMonitors;');
  RegisterFakeHeader(G,
       'function TScreen_GetDesktopRect:TRect;',
       @TScreen_GetDesktopRect);
  RegisterProperty(G,
       'property DesktopRect:TRect read TScreen_GetDesktopRect;');
  RegisterFakeHeader(G,
       'function TScreen_GetDesktopHeight:Integer;',
       @TScreen_GetDesktopHeight);
  RegisterProperty(G,
       'property DesktopHeight:Integer read TScreen_GetDesktopHeight;');
  RegisterFakeHeader(G,
       'function TScreen_GetDesktopLeft:Integer;',
       @TScreen_GetDesktopLeft);
  RegisterProperty(G,
       'property DesktopLeft:Integer read TScreen_GetDesktopLeft;');
  RegisterFakeHeader(G,
       'function TScreen_GetDesktopTop:Integer;',
       @TScreen_GetDesktopTop);
  RegisterProperty(G,
       'property DesktopTop:Integer read TScreen_GetDesktopTop;');
  RegisterFakeHeader(G,
       'function TScreen_GetDesktopWidth:Integer;',
       @TScreen_GetDesktopWidth);
  RegisterProperty(G,
       'property DesktopWidth:Integer read TScreen_GetDesktopWidth;');
  RegisterFakeHeader(G,
       'function TScreen_GetWorkAreaRect:TRect;',
       @TScreen_GetWorkAreaRect);
  RegisterProperty(G,
       'property WorkAreaRect:TRect read TScreen_GetWorkAreaRect;');
  RegisterFakeHeader(G,
       'function TScreen_GetWorkAreaHeight:Integer;',
       @TScreen_GetWorkAreaHeight);
  RegisterProperty(G,
       'property WorkAreaHeight:Integer read TScreen_GetWorkAreaHeight;');
  RegisterFakeHeader(G,
       'function TScreen_GetWorkAreaLeft:Integer;',
       @TScreen_GetWorkAreaLeft);
  RegisterProperty(G,
       'property WorkAreaLeft:Integer read TScreen_GetWorkAreaLeft;');
  RegisterFakeHeader(G,
       'function TScreen_GetWorkAreaTop:Integer;',
       @TScreen_GetWorkAreaTop);
  RegisterProperty(G,
       'property WorkAreaTop:Integer read TScreen_GetWorkAreaTop;');
  RegisterFakeHeader(G,
       'function TScreen_GetWorkAreaWidth:Integer;',
       @TScreen_GetWorkAreaWidth);
  RegisterProperty(G,
       'property WorkAreaWidth:Integer read TScreen_GetWorkAreaWidth;');
  RegisterFakeHeader(G,
       'function TScreen_GetFormCount:Integer;',
       @TScreen_GetFormCount);
  RegisterProperty(G,
       'property FormCount:Integer read TScreen_GetFormCount;');
  RegisterFakeHeader(G,
       'function TScreen_GetForms(Index: Integer):TForm;',
       @TScreen_GetForms);
  RegisterProperty(G,
       'property Forms[Index: Integer]:TForm read TScreen_GetForms;');
  RegisterFakeHeader(G,
       'function TScreen_GetDefaultIme:string;',
       @TScreen_GetDefaultIme);
  RegisterProperty(G,
       'property DefaultIme:string read TScreen_GetDefaultIme;');
  RegisterFakeHeader(G,
       'function TScreen_GetHeight:Integer;',
       @TScreen_GetHeight);
  RegisterProperty(G,
       'property Height:Integer read TScreen_GetHeight;');
  RegisterFakeHeader(G,
       'function TScreen_GetPixelsPerInch:Integer;',
       @TScreen_GetPixelsPerInch);
  RegisterProperty(G,
       'property PixelsPerInch:Integer read TScreen_GetPixelsPerInch;');
  RegisterFakeHeader(G,
       'function TScreen_GetWidth:Integer;',
       @TScreen_GetWidth);
  RegisterProperty(G,
       'property Width:Integer read TScreen_GetWidth;');
  // End of class TScreen
  RegisterRTTIType(H, TypeInfo(TTimerMode));
  // Begin of class TApplication
  G := RegisterClassType(H, TApplication);
  RegisterHeader(G, 
       'constructor Create(AOwner: TComponent); override;',
       @TApplication.Create);
  RegisterHeader(G, 
       'destructor Destroy; override;',
       @TApplication.Destroy);
  RegisterHeader(G, 
       'procedure ActivateHint(CursorPos: TPoint);',
       @TApplication.ActivateHint);
  RegisterHeader(G, 
       'procedure BringToFront;',
       @TApplication.BringToFront);
  RegisterHeader(G, 
       'procedure CancelHint;',
       @TApplication.CancelHint);
  RegisterHeader(G, 
       'procedure CreateHandle;',
       @TApplication.CreateHandle);
  RegisterHeader(G, 
       'procedure HandleException(Sender: TObject);',
       @TApplication.HandleException);
  RegisterHeader(G, 
       'procedure HandleMessage;',
       @TApplication.HandleMessage);
  RegisterHeader(G, 
       'function HelpCommand(Command: Integer; Data: Longint): Boolean;',
       @TApplication.HelpCommand);
  RegisterHeader(G, 
       'function HelpJump(const JumpID: string): Boolean;',
       @TApplication.HelpJump);
  RegisterHeader(G, 
       'function HelpKeyword(const Keyword: String): Boolean;',
       @TApplication.HelpKeyword);
  RegisterHeader(G, 
       'procedure HideHint;',
       @TApplication.HideHint);
  RegisterHeader(G, 
       'procedure HookSynchronizeWakeup;',
       @TApplication.HookSynchronizeWakeup);
  RegisterHeader(G, 
       'procedure Initialize;',
       @TApplication.Initialize);
  RegisterHeader(G, 
       'function IsRightToLeft: Boolean;',
       @TApplication.IsRightToLeft);
  RegisterHeader(G, 
       'procedure Minimize;',
       @TApplication.Minimize);
  RegisterHeader(G, 
       'procedure ModalStarted;',
       @TApplication.ModalStarted);
  RegisterHeader(G, 
       'procedure ModalFinished;',
       @TApplication.ModalFinished);
  RegisterHeader(G, 
       'procedure NormalizeAllTopMosts;',
       @TApplication.NormalizeAllTopMosts);
  RegisterHeader(G, 
       'procedure NormalizeTopMosts;',
       @TApplication.NormalizeTopMosts);
  RegisterHeader(G, 
       'procedure ProcessMessages;',
       @TApplication.ProcessMessages);
  RegisterHeader(G, 
       'procedure Restore;',
       @TApplication.Restore);
  RegisterHeader(G, 
       'procedure RestoreTopMosts;',
       @TApplication.RestoreTopMosts);
  RegisterHeader(G, 
       'procedure Run;',
       @TApplication.Run);
  RegisterHeader(G, 
       'procedure Terminate;',
       @TApplication.Terminate);
  RegisterHeader(G, 
       'procedure UnhookSynchronizeWakeup;',
       @TApplication.UnhookSynchronizeWakeup);
  RegisterHeader(G, 
       'function UseRightToLeftAlignment: Boolean;',
       @TApplication.UseRightToLeftAlignment);
  RegisterHeader(G, 
       'function UseRightToLeftReading: Boolean;',
       @TApplication.UseRightToLeftReading);
  RegisterHeader(G, 
       'function UseRightToLeftScrollBar: Boolean;',
       @TApplication.UseRightToLeftScrollBar);
  RegisterFakeHeader(G,
       'function TApplication_GetActive:Boolean;',
       @TApplication_GetActive);
  RegisterProperty(G,
       'property Active:Boolean read TApplication_GetActive;');
  RegisterFakeHeader(G,
       'function TApplication_GetAllowTesting:Boolean;',
       @TApplication_GetAllowTesting);
  RegisterFakeHeader(G,
       'procedure TApplication_PutAllowTesting(const Value: Boolean);',
       @TApplication_PutAllowTesting);
  RegisterProperty(G,
       'property AllowTesting:Boolean read TApplication_GetAllowTesting write TApplication_PutAllowTesting;');
  RegisterFakeHeader(G,
       'function TApplication_GetAutoDragDocking:Boolean;',
       @TApplication_GetAutoDragDocking);
  RegisterFakeHeader(G,
       'procedure TApplication_PutAutoDragDocking(const Value: Boolean);',
       @TApplication_PutAutoDragDocking);
  RegisterProperty(G,
       'property AutoDragDocking:Boolean read TApplication_GetAutoDragDocking write TApplication_PutAutoDragDocking;');
  RegisterFakeHeader(G,
       'function TApplication_GetCurrentHelpFile:string;',
       @TApplication_GetCurrentHelpFile);
  RegisterProperty(G,
       'property CurrentHelpFile:string read TApplication_GetCurrentHelpFile;');
  RegisterFakeHeader(G,
       'function TApplication_GetExeName:string;',
       @TApplication_GetExeName);
  RegisterProperty(G,
       'property ExeName:string read TApplication_GetExeName;');
  RegisterFakeHeader(G,
       'function TApplication_GetHelpFile:string;',
       @TApplication_GetHelpFile);
  RegisterFakeHeader(G,
       'procedure TApplication_PutHelpFile(const Value: string);',
       @TApplication_PutHelpFile);
  RegisterProperty(G,
       'property HelpFile:string read TApplication_GetHelpFile write TApplication_PutHelpFile;');
  RegisterFakeHeader(G,
       'function TApplication_GetHint:string;',
       @TApplication_GetHint);
  RegisterFakeHeader(G,
       'procedure TApplication_PutHint(const Value: string);',
       @TApplication_PutHint);
  RegisterProperty(G,
       'property Hint:string read TApplication_GetHint write TApplication_PutHint;');
  RegisterFakeHeader(G,
       'function TApplication_GetHintHidePause:Integer;',
       @TApplication_GetHintHidePause);
  RegisterFakeHeader(G,
       'procedure TApplication_PutHintHidePause(const Value: Integer);',
       @TApplication_PutHintHidePause);
  RegisterProperty(G,
       'property HintHidePause:Integer read TApplication_GetHintHidePause write TApplication_PutHintHidePause;');
  RegisterFakeHeader(G,
       'function TApplication_GetHintPause:Integer;',
       @TApplication_GetHintPause);
  RegisterFakeHeader(G,
       'procedure TApplication_PutHintPause(const Value: Integer);',
       @TApplication_PutHintPause);
  RegisterProperty(G,
       'property HintPause:Integer read TApplication_GetHintPause write TApplication_PutHintPause;');
  RegisterFakeHeader(G,
       'function TApplication_GetHintShortCuts:Boolean;',
       @TApplication_GetHintShortCuts);
  RegisterFakeHeader(G,
       'procedure TApplication_PutHintShortCuts(const Value: Boolean);',
       @TApplication_PutHintShortCuts);
  RegisterProperty(G,
       'property HintShortCuts:Boolean read TApplication_GetHintShortCuts write TApplication_PutHintShortCuts;');
  RegisterFakeHeader(G,
       'function TApplication_GetHintShortPause:Integer;',
       @TApplication_GetHintShortPause);
  RegisterFakeHeader(G,
       'procedure TApplication_PutHintShortPause(const Value: Integer);',
       @TApplication_PutHintShortPause);
  RegisterProperty(G,
       'property HintShortPause:Integer read TApplication_GetHintShortPause write TApplication_PutHintShortPause;');
  RegisterFakeHeader(G,
       'function TApplication_GetMainForm:TForm;',
       @TApplication_GetMainForm);
  RegisterProperty(G,
       'property MainForm:TForm read TApplication_GetMainForm;');
  RegisterFakeHeader(G,
       'function TApplication_GetBiDiKeyboard:string;',
       @TApplication_GetBiDiKeyboard);
  RegisterFakeHeader(G,
       'procedure TApplication_PutBiDiKeyboard(const Value: string);',
       @TApplication_PutBiDiKeyboard);
  RegisterProperty(G,
       'property BiDiKeyboard:string read TApplication_GetBiDiKeyboard write TApplication_PutBiDiKeyboard;');
  RegisterFakeHeader(G,
       'function TApplication_GetNonBiDiKeyboard:string;',
       @TApplication_GetNonBiDiKeyboard);
  RegisterFakeHeader(G,
       'procedure TApplication_PutNonBiDiKeyboard(const Value: string);',
       @TApplication_PutNonBiDiKeyboard);
  RegisterProperty(G,
       'property NonBiDiKeyboard:string read TApplication_GetNonBiDiKeyboard write TApplication_PutNonBiDiKeyboard;');
  RegisterFakeHeader(G,
       'function TApplication_GetShowHint:Boolean;',
       @TApplication_GetShowHint);
  RegisterFakeHeader(G,
       'procedure TApplication_PutShowHint(const Value: Boolean);',
       @TApplication_PutShowHint);
  RegisterProperty(G,
       'property ShowHint:Boolean read TApplication_GetShowHint write TApplication_PutShowHint;');
  RegisterFakeHeader(G,
       'function TApplication_GetShowMainForm:Boolean;',
       @TApplication_GetShowMainForm);
  RegisterFakeHeader(G,
       'procedure TApplication_PutShowMainForm(const Value: Boolean);',
       @TApplication_PutShowMainForm);
  RegisterProperty(G,
       'property ShowMainForm:Boolean read TApplication_GetShowMainForm write TApplication_PutShowMainForm;');
  RegisterFakeHeader(G,
       'function TApplication_GetTerminated:Boolean;',
       @TApplication_GetTerminated);
  RegisterProperty(G,
       'property Terminated:Boolean read TApplication_GetTerminated;');
  RegisterFakeHeader(G,
       'function TApplication_GetTitle:string;',
       @TApplication_GetTitle);
  RegisterFakeHeader(G,
       'procedure TApplication_PutTitle(const Value: string);',
       @TApplication_PutTitle);
  RegisterProperty(G,
       'property Title:string read TApplication_GetTitle write TApplication_PutTitle;');
  RegisterFakeHeader(G,
       'function TApplication_GetUpdateFormatSettings:Boolean;',
       @TApplication_GetUpdateFormatSettings);
  RegisterFakeHeader(G,
       'procedure TApplication_PutUpdateFormatSettings(const Value: Boolean);',
       @TApplication_PutUpdateFormatSettings);
  RegisterProperty(G,
       'property UpdateFormatSettings:Boolean read TApplication_GetUpdateFormatSettings write TApplication_PutUpdateFormatSettings;');
  RegisterFakeHeader(G,
       'function TApplication_GetUpdateMetricSettings:Boolean;',
       @TApplication_GetUpdateMetricSettings);
  RegisterFakeHeader(G,
       'procedure TApplication_PutUpdateMetricSettings(const Value: Boolean);',
       @TApplication_PutUpdateMetricSettings);
  RegisterProperty(G,
       'property UpdateMetricSettings:Boolean read TApplication_GetUpdateMetricSettings write TApplication_PutUpdateMetricSettings;');
  // End of class TApplication
  RegisterVariable(H, 'Application: TApplication;',@Application);
  RegisterVariable(H, 'Screen: TScreen;',@Screen);
  RegisterHeader(H, 'procedure EnableTaskWindows(WindowList: Pointer);', @EnableTaskWindows);
  RegisterHeader(H, 'procedure FreeObjectInstance(ObjectInstance: Pointer);    deprecated;', @FreeObjectInstance);
  RegisterHeader(H, 'function IsAccel(VK: Word; const Str: string): Boolean;', @IsAccel);
  RegisterHeader(H, 'procedure SetAutoSubClass(Enable: Boolean);      deprecated;', @SetAutoSubClass);
  RegisterHeader(H, 'procedure DoneCtl3D;                             deprecated;', @DoneCtl3D);
  RegisterHeader(H, 'procedure InitCtl3D;                             deprecated;', @InitCtl3D);
  RegisterHeader(H, 'function ForegroundTask: Boolean;', @ForegroundTask);
  RegisterTypeAlias(H, 'TFocusState:Pointer');
  RegisterHeader(H, 'function SaveFocusState: TFocusState;', @SaveFocusState);
  RegisterHeader(H, 'procedure RestoreFocusState(FocusState: TFocusState);', @RestoreFocusState);
end;
end.
