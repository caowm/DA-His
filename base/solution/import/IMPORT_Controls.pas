{$I PaxCompiler.def}

unit IMPORT_Controls;
interface
uses
//  MultiMon,
  Classes,
  SysUtils,
{$IFDEF DPULSAR}
  {$IFDEF MACOS}
  FMX.Messages,
  FMX.Menus,
  FMX.ActnList,
  FMX.Controls,
  {$ELSE}
  Winapi.Messages,
  Winapi.Windows,
  Vcl.Graphics,
  Vcl.Menus,
  Vcl.ImgList,
  Vcl.ActnList,
  Vcl.Controls,
  Winapi.CommCtrl,
  {$ENDIF}
{$ELSE}
  Messages,
  Windows,
  Graphics,
  Menus,
  ImgList,
  ActnList,
  Controls,
  CommCtrl,
{$ENDIF}
  Variants,
  PaxRegister,
  PaxCompiler;
procedure Register_Controls;
implementation
{$IFDEF MACOS}
{$ELSE}
function TDragObject_GetCancelling(Self:TDragObject):Boolean;
begin
  result := Self.Cancelling;
end;
procedure TDragObject_PutCancelling(Self:TDragObject;const Value: Boolean);
begin
  Self.Cancelling := Value;
end;
function TDragObject_GetDragPos(Self:TDragObject):TPoint;
begin
  result := Self.DragPos;
end;
procedure TDragObject_PutDragPos(Self:TDragObject;const Value: TPoint);
begin
  Self.DragPos := Value;
end;
function TDragObject_GetDragTargetPos(Self:TDragObject):TPoint;
begin
  result := Self.DragTargetPos;
end;
procedure TDragObject_PutDragTargetPos(Self:TDragObject;const Value: TPoint);
begin
  Self.DragTargetPos := Value;
end;
function TDragObject_GetDragTarget(Self:TDragObject):Pointer;
begin
  result := Self.DragTarget;
end;
procedure TDragObject_PutDragTarget(Self:TDragObject;const Value: Pointer);
begin
  Self.DragTarget := Value;
end;
function TDragObject_GetDropped(Self:TDragObject):Boolean;
begin
  result := Self.Dropped;
end;
function TDragObject_GetMouseDeltaX(Self:TDragObject):Double;
begin
  result := Self.MouseDeltaX;
end;
function TDragObject_GetMouseDeltaY(Self:TDragObject):Double;
begin
  result := Self.MouseDeltaY;
end;
function TBaseDragControlObject_GetControl(Self:TBaseDragControlObject):TControl;
begin
  result := Self.Control;
end;
procedure TBaseDragControlObject_PutControl(Self:TBaseDragControlObject;const Value: TControl);
begin
  Self.Control := Value;
end;
function TDragDockObject_GetDockRect(Self:TDragDockObject):TRect;
begin
  result := Self.DockRect;
end;
procedure TDragDockObject_PutDockRect(Self:TDragDockObject;const Value: TRect);
begin
  Self.DockRect := Value;
end;
function TDragDockObject_GetDropAlign(Self:TDragDockObject):TAlign;
begin
  result := Self.DropAlign;
end;
function TDragDockObject_GetDropOnControl(Self:TDragDockObject):TControl;
begin
  result := Self.DropOnControl;
end;
function TDragDockObject_GetFloating(Self:TDragDockObject):Boolean;
begin
  result := Self.Floating;
end;
procedure TDragDockObject_PutFloating(Self:TDragDockObject;const Value: Boolean);
begin
  Self.Floating := Value;
end;
function TDragDockObject_GetFrameWidth(Self:TDragDockObject):Integer;
begin
  result := Self.FrameWidth;
end;
function TControlCanvas_GetControl(Self:TControlCanvas):TControl;
begin
  result := Self.Control;
end;
procedure TControlCanvas_PutControl(Self:TControlCanvas;const Value: TControl);
begin
  Self.Control := Value;
end;
{$ENDIF}
function TControl_GetEnabled(Self:TControl):Boolean;
begin
  result := Self.Enabled;
end;
procedure TControl_PutEnabled(Self:TControl;const Value: Boolean);
begin
  Self.Enabled := Value;
end;
function TControl_GetAlign(Self:TControl):TAlign;
begin
  result := Self.Align;
end;
procedure TControl_PutAlign(Self:TControl;const Value: TAlign);
begin
  Self.Align := Value;
end;
function TControl_GetBoundsRect(Self:TControl):TRect;
begin
  result := Self.BoundsRect;
end;
procedure TControl_PutBoundsRect(Self:TControl;const Value: TRect);
begin
  Self.BoundsRect := Value;
end;
function TControl_GetClientHeight(Self:TControl):Integer;
begin
  result := Self.ClientHeight;
end;
procedure TControl_PutClientHeight(Self:TControl;const Value: Integer);
begin
  Self.ClientHeight := Value;
end;
function TControl_GetClientOrigin(Self:TControl):TPoint;
begin
  result := Self.ClientOrigin;
end;
function TControl_GetClientRect(Self:TControl):TRect;
begin
  result := Self.ClientRect;
end;
function TControl_GetClientWidth(Self:TControl):Integer;
begin
  result := Self.ClientWidth;
end;
procedure TControl_PutClientWidth(Self:TControl;const Value: Integer);
begin
  Self.ClientWidth := Value;
end;
function TControl_GetConstraints(Self:TControl):TSizeConstraints;
begin
  result := Self.Constraints;
end;
procedure TControl_PutConstraints(Self:TControl;const Value: TSizeConstraints);
begin
  Self.Constraints := Value;
end;
function TControl_GetControlState(Self:TControl):TControlState;
begin
  result := Self.ControlState;
end;
procedure TControl_PutControlState(Self:TControl;const Value: TControlState);
begin
  Self.ControlState := Value;
end;
function TControl_GetControlStyle(Self:TControl):TControlStyle;
begin
  result := Self.ControlStyle;
end;
procedure TControl_PutControlStyle(Self:TControl;const Value: TControlStyle);
begin
  Self.ControlStyle := Value;
end;
function TControl_GetDockOrientation(Self:TControl):TDockOrientation;
begin
  result := Self.DockOrientation;
end;
procedure TControl_PutDockOrientation(Self:TControl;const Value: TDockOrientation);
begin
  Self.DockOrientation := Value;
end;
function TControl_GetFloating(Self:TControl):Boolean;
begin
  result := Self.Floating;
end;
function TControl_GetFloatingDockSiteClass(Self:TControl):TWinControlClass;
begin
  result := Self.FloatingDockSiteClass;
end;
procedure TControl_PutFloatingDockSiteClass(Self:TControl;const Value: TWinControlClass);
begin
  Self.FloatingDockSiteClass := Value;
end;
function TControl_GetHostDockSite(Self:TControl):TWinControl;
begin
  result := Self.HostDockSite;
end;
procedure TControl_PutHostDockSite(Self:TControl;const Value: TWinControl);
begin
  Self.HostDockSite := Value;
end;
function TControl_GetLRDockWidth(Self:TControl):Integer;
begin
  result := Self.LRDockWidth;
end;
procedure TControl_PutLRDockWidth(Self:TControl;const Value: Integer);
begin
  Self.LRDockWidth := Value;
end;
function TControl_GetParent(Self:TControl):TWinControl;
begin
  result := Self.Parent;
end;
procedure TControl_PutParent(Self:TControl;const Value: TWinControl);
begin
  Self.Parent := Value;
end;
function TControl_GetShowHint(Self:TControl):Boolean;
begin
  result := Self.ShowHint;
end;
procedure TControl_PutShowHint(Self:TControl;const Value: Boolean);
begin
  Self.ShowHint := Value;
end;
function TControl_GetTBDockHeight(Self:TControl):Integer;
begin
  result := Self.TBDockHeight;
end;
procedure TControl_PutTBDockHeight(Self:TControl;const Value: Integer);
begin
  Self.TBDockHeight := Value;
end;
function TControl_GetUndockHeight(Self:TControl):Integer;
begin
  result := Self.UndockHeight;
end;
procedure TControl_PutUndockHeight(Self:TControl;const Value: Integer);
begin
  Self.UndockHeight := Value;
end;
function TControl_GetUndockWidth(Self:TControl):Integer;
begin
  result := Self.UndockWidth;
end;
procedure TControl_PutUndockWidth(Self:TControl;const Value: Integer);
begin
  Self.UndockWidth := Value;
end;
function TControl_GetVisible(Self:TControl):Boolean;
begin
  result := Self.Visible;
end;
procedure TControl_PutVisible(Self:TControl;const Value: Boolean);
begin
  Self.Visible := Value;
end;
function TWinControl_GetDockClientCount(Self:TWinControl):Integer;
begin
  result := Self.DockClientCount;
end;
function TWinControl_GetDockClients(Self:TWinControl;Index: Integer):TControl;
begin
  result := Self.DockClients[Index];
end;
function TWinControl_GetDoubleBuffered(Self:TWinControl):Boolean;
begin
  result := Self.DoubleBuffered;
end;
procedure TWinControl_PutDoubleBuffered(Self:TWinControl;const Value: Boolean);
begin
  Self.DoubleBuffered := Value;
end;
function TWinControl_GetAlignDisabled(Self:TWinControl):Boolean;
begin
  result := Self.AlignDisabled;
end;
function TWinControl_GetVisibleDockClientCount(Self:TWinControl):Integer;
begin
  result := Self.VisibleDockClientCount;
end;
function TWinControl_GetControls(Self:TWinControl;Index: Integer):TControl;
begin
  result := Self.Controls[Index];
end;
function TWinControl_GetControlCount(Self:TWinControl):Integer;
begin
  result := Self.ControlCount;
end;
function TWinControl_GetShowing(Self:TWinControl):Boolean;
begin
  result := Self.Showing;
end;
function TWinControl_GetTabOrder(Self:TWinControl):TTabOrder;
begin
  result := Self.TabOrder;
end;
procedure TWinControl_PutTabOrder(Self:TWinControl;const Value: TTabOrder);
begin
  Self.TabOrder := Value;
end;
function TWinControl_GetTabStop(Self:TWinControl):Boolean;
begin
  result := Self.TabStop;
end;
procedure TWinControl_PutTabStop(Self:TWinControl;const Value: Boolean);
begin
  Self.TabStop := Value;
end;
function TDragImageList_GetDragCursor(Self:TDragImageList):TCursor;
begin
  result := Self.DragCursor;
end;
procedure TDragImageList_PutDragCursor(Self:TDragImageList;const Value: TCursor);
begin
  Self.DragCursor := Value;
end;
function TDragImageList_GetDragging(Self:TDragImageList):Boolean;
begin
  result := Self.Dragging;
end;
function TDockZone_GetChildCount(Self:TDockZone):Integer;
begin
  result := Self.ChildCount;
end;
function TDockZone_GetHeight(Self:TDockZone):Integer;
begin
  result := Self.Height;
end;
function TDockZone_GetLeft(Self:TDockZone):Integer;
begin
  result := Self.Left;
end;
function TDockZone_GetLimitBegin(Self:TDockZone):Integer;
begin
  result := Self.LimitBegin;
end;
function TDockZone_GetLimitSize(Self:TDockZone):Integer;
begin
  result := Self.LimitSize;
end;
function TDockZone_GetTop(Self:TDockZone):Integer;
begin
  result := Self.Top;
end;
function TDockZone_GetVisible(Self:TDockZone):Boolean;
begin
  result := Self.Visible;
end;
function TDockZone_GetVisibleChildCount(Self:TDockZone):Integer;
begin
  result := Self.VisibleChildCount;
end;
function TDockZone_GetWidth(Self:TDockZone):Integer;
begin
  result := Self.Width;
end;
function TDockZone_GetZoneLimit(Self:TDockZone):Integer;
begin
  result := Self.ZoneLimit;
end;
procedure TDockZone_PutZoneLimit(Self:TDockZone;const Value: Integer);
begin
  Self.ZoneLimit := Value;
end;
function TMouse_GetCursorPos(Self:TMouse):TPoint;
begin
  result := Self.CursorPos;
end;
procedure TMouse_PutCursorPos(Self:TMouse;const Value: TPoint);
begin
  Self.CursorPos := Value;
end;
function TMouse_GetDragImmediate(Self:TMouse):Boolean;

begin
  result := Self.DragImmediate;
end;
procedure TMouse_PutDragImmediate(Self:TMouse;const Value: Boolean);
begin
  Self.DragImmediate := Value;
end;
function TMouse_GetDragThreshold(Self:TMouse):Integer;
begin
  result := Self.DragThreshold;
end;
procedure TMouse_PutDragThreshold(Self:TMouse;const Value: Integer);
begin
  Self.DragThreshold := Value;
end;
function TMouse_GetMousePresent(Self:TMouse):Boolean;
begin
  result := Self.MousePresent;
end;
function TMouse_GetIsDragging(Self:TMouse):Boolean;
begin
  result := Self.IsDragging;
end;
function TMouse_GetWheelPresent(Self:TMouse):Boolean;
begin
  result := Self.WheelPresent;
end;
function TMouse_GetWheelScrollLines(Self:TMouse):Integer;
begin
  result := Self.WheelScrollLines;
end;
function TCustomListControl_GetItemIndex(Self:TCustomListControl):Integer;
begin
  result := Self.ItemIndex;
end;
procedure TCustomListControl_PutItemIndex(Self:TCustomListControl;const Value: Integer);
begin
  Self.ItemIndex := Value;
end;
function TCustomMultiSelectListControl_GetMultiSelect(Self:TCustomMultiSelectListControl):Boolean;
begin
  result := Self.MultiSelect;
end;
procedure TCustomMultiSelectListControl_PutMultiSelect(Self:TCustomMultiSelectListControl;const Value: Boolean);
begin
  Self.MultiSelect := Value;
end;
function TCustomMultiSelectListControl_GetSelCount(Self:TCustomMultiSelectListControl):Integer;
begin
  result := Self.SelCount;
end;
procedure Register_Controls;
var G, H: Integer;
begin
  H := RegisterNamespace(0, 'Controls');
  RegisterConstant(H, 'CM_BASE', $B000);
  RegisterConstant(H, 'CN_BASE', $BC00);
  RegisterConstant(H, 'mrNone', 0);
  RegisterRTTIType(H, TypeInfo(TCursor));
  // Begin of class TDragObject
  G := RegisterClassType(H, TDragObject);
  // End of class TDragObject
  // Begin of class TControl
  G := RegisterClassType(H, TControl);
  // End of class TControl
  // Begin of class TWinControl
  G := RegisterClassType(H, TWinControl);
  // End of class TWinControl
  // Begin of class TDragImageList
  G := RegisterClassType(H, TDragImageList);
  // End of class TDragImageList
  RegisterClassReferenceType(H, 'TWinControlClass');
  RegisterRTTIType(H, TypeInfo(TDragMessage));
  // Begin of class TDragDockObject
  G := RegisterClassType(H, TDragDockObject);
  // End of class TDragDockObject
  RegisterRTTIType(H, TypeInfo(TAlign));
  RegisterRTTIType(H, TypeInfo(TAlignSet));
  // Begin of class TDragObject
  G := RegisterClassType(H, TDragObject);
  RegisterHeader(G, 
       'procedure AfterConstruction; override;',
       @TDragObject.AfterConstruction);
  RegisterHeader(G, 
       'procedure Assign(Source: TDragObject); virtual;',
       @TDragObject.Assign);
  RegisterHeader(G, 
       'procedure BeforeDestruction; override;',
       @TDragObject.BeforeDestruction);
  RegisterHeader(G, 
       'function GetName: string; virtual;',
       @TDragObject.GetName);
  RegisterHeader(G, 
       'procedure HideDragImage; virtual;',
       @TDragObject.HideDragImage);
  RegisterHeader(G, 
       'function Instance: THandle; virtual;',
       @TDragObject.Instance);
  RegisterHeader(G, 
       'procedure ShowDragImage; virtual;',
       @TDragObject.ShowDragImage);
  RegisterFakeHeader(G,
       'function TDragObject_GetCancelling:Boolean;',
       @TDragObject_GetCancelling);
  RegisterFakeHeader(G,
       'procedure TDragObject_PutCancelling(const Value: Boolean);',
       @TDragObject_PutCancelling);
  RegisterProperty(G,
       'property Cancelling:Boolean read TDragObject_GetCancelling write TDragObject_PutCancelling;');
  RegisterFakeHeader(G,
       'function TDragObject_GetDragPos:TPoint;',
       @TDragObject_GetDragPos);
  RegisterFakeHeader(G,
       'procedure TDragObject_PutDragPos(const Value: TPoint);',
       @TDragObject_PutDragPos);
  RegisterProperty(G,
       'property DragPos:TPoint read TDragObject_GetDragPos write TDragObject_PutDragPos;');
  RegisterFakeHeader(G,
       'function TDragObject_GetDragTargetPos:TPoint;',
       @TDragObject_GetDragTargetPos);
  RegisterFakeHeader(G,
       'procedure TDragObject_PutDragTargetPos(const Value: TPoint);',
       @TDragObject_PutDragTargetPos);
  RegisterProperty(G,
       'property DragTargetPos:TPoint read TDragObject_GetDragTargetPos write TDragObject_PutDragTargetPos;');
  RegisterFakeHeader(G,
       'function TDragObject_GetDragTarget:Pointer;',
       @TDragObject_GetDragTarget);
  RegisterFakeHeader(G,
       'procedure TDragObject_PutDragTarget(const Value: Pointer);',
       @TDragObject_PutDragTarget);
  RegisterProperty(G,
       'property DragTarget:Pointer read TDragObject_GetDragTarget write TDragObject_PutDragTarget;');
  RegisterFakeHeader(G,
       'function TDragObject_GetDropped:Boolean;',
       @TDragObject_GetDropped);
  RegisterProperty(G,
       'property Dropped:Boolean read TDragObject_GetDropped;');
  RegisterFakeHeader(G,
       'function TDragObject_GetMouseDeltaX:Double;',
       @TDragObject_GetMouseDeltaX);
  RegisterProperty(G,
       'property MouseDeltaX:Double read TDragObject_GetMouseDeltaX;');
  RegisterFakeHeader(G,
       'function TDragObject_GetMouseDeltaY:Double;',
       @TDragObject_GetMouseDeltaY);
  RegisterProperty(G,
       'property MouseDeltaY:Double read TDragObject_GetMouseDeltaY;');
  RegisterHeader(G,
       'constructor Create;',
       @TDragObject.Create);
  // End of class TDragObject
  RegisterClassReferenceType(H, 'TDragObjectClass');
  // Begin of class TDragObjectEx
  G := RegisterClassType(H, TDragObjectEx);
  RegisterHeader(G, 
       'procedure BeforeDestruction; override;',
       @TDragObjectEx.BeforeDestruction);
  RegisterHeader(G,
       'constructor Create;',
       @TDragObjectEx.Create);
  // End of class TDragObjectEx
  // Begin of class TBaseDragControlObject
  G := RegisterClassType(H, TBaseDragControlObject);
  RegisterHeader(G, 
       'constructor Create(AControl: TControl); virtual;',
       @TBaseDragControlObject.Create);
  RegisterHeader(G, 
       'procedure Assign(Source: TDragObject); override;',
       @TBaseDragControlObject.Assign);
  RegisterFakeHeader(G,
       'function TBaseDragControlObject_GetControl:TControl;',
       @TBaseDragControlObject_GetControl);
  RegisterFakeHeader(G,
       'procedure TBaseDragControlObject_PutControl(const Value: TControl);',
       @TBaseDragControlObject_PutControl);
  RegisterProperty(G,
       'property Control:TControl read TBaseDragControlObject_GetControl write TBaseDragControlObject_PutControl;');
  // End of class TBaseDragControlObject
  // Begin of class TDragControlObject
  G := RegisterClassType(H, TDragControlObject);
  RegisterHeader(G, 
       'procedure HideDragImage; override;',
       @TDragControlObject.HideDragImage);
  RegisterHeader(G, 
       'procedure ShowDragImage; override;',
       @TDragControlObject.ShowDragImage);
  RegisterHeader(G,
       'constructor Create(AControl: TControl); virtual;',
       @TDragControlObject.Create);
  // End of class TDragControlObject
  // Begin of class TDragControlObjectEx
  G := RegisterClassType(H, TDragControlObjectEx);
  RegisterHeader(G, 
       'procedure BeforeDestruction; override;',
       @TDragControlObjectEx.BeforeDestruction);
  RegisterHeader(G,
       'constructor Create(AControl: TControl); virtual;',
       @TDragControlObjectEx.Create);
  // End of class TDragControlObjectEx
  // Begin of class TDragDockObject
  G := RegisterClassType(H, TDragDockObject);
  RegisterHeader(G, 
       'constructor Create(AControl: TControl); override;',
       @TDragDockObject.Create);
  RegisterHeader(G, 
       'destructor Destroy; override;',
       @TDragDockObject.Destroy);
  RegisterHeader(G, 
       'procedure Assign(Source: TDragObject); override;',
       @TDragDockObject.Assign);
  RegisterFakeHeader(G,
       'function TDragDockObject_GetDockRect:TRect;',
       @TDragDockObject_GetDockRect);
  RegisterFakeHeader(G,
       'procedure TDragDockObject_PutDockRect(const Value: TRect);',
       @TDragDockObject_PutDockRect);
  RegisterProperty(G,
       'property DockRect:TRect read TDragDockObject_GetDockRect write TDragDockObject_PutDockRect;');
  RegisterFakeHeader(G,
       'function TDragDockObject_GetDropAlign:TAlign;',
       @TDragDockObject_GetDropAlign);
  RegisterProperty(G,
       'property DropAlign:TAlign read TDragDockObject_GetDropAlign;');
  RegisterFakeHeader(G,
       'function TDragDockObject_GetDropOnControl:TControl;',
       @TDragDockObject_GetDropOnControl);
  RegisterProperty(G,
       'property DropOnControl:TControl read TDragDockObject_GetDropOnControl;');
  RegisterFakeHeader(G,
       'function TDragDockObject_GetFloating:Boolean;',
       @TDragDockObject_GetFloating);
  RegisterFakeHeader(G,
       'procedure TDragDockObject_PutFloating(const Value: Boolean);',
       @TDragDockObject_PutFloating);
  RegisterProperty(G,
       'property Floating:Boolean read TDragDockObject_GetFloating write TDragDockObject_PutFloating;');
  RegisterFakeHeader(G,
       'function TDragDockObject_GetFrameWidth:Integer;',
       @TDragDockObject_GetFrameWidth);
  RegisterProperty(G,
       'property FrameWidth:Integer read TDragDockObject_GetFrameWidth;');
  // End of class TDragDockObject
  // Begin of class TDragDockObjectEx
  G := RegisterClassType(H, TDragDockObjectEx);
  RegisterHeader(G,
       'procedure BeforeDestruction; override;',
       @TDragDockObjectEx.BeforeDestruction);
  RegisterHeader(G,
       'constructor Create;',
       @TDragDockObjectEx.Create);
  // End of class TDragDockObjectEx
  // Begin of class TControlCanvas
  G := RegisterClassType(H, TControlCanvas);
  RegisterHeader(G,
       'destructor Destroy; override;',
       @TControlCanvas.Destroy);
  RegisterHeader(G, 
       'procedure FreeHandle;',
       @TControlCanvas.FreeHandle);
  RegisterHeader(G, 
       'procedure UpdateTextFlags;',
       @TControlCanvas.UpdateTextFlags);
  RegisterFakeHeader(G,
       'function TControlCanvas_GetControl:TControl;',
       @TControlCanvas_GetControl);
  RegisterFakeHeader(G,
       'procedure TControlCanvas_PutControl(const Value: TControl);',
       @TControlCanvas_PutControl);
  RegisterProperty(G,
       'property Control:TControl read TControlCanvas_GetControl write TControlCanvas_PutControl;');
  RegisterHeader(G,
       'constructor Create(AOwner: TComponent); virtual;',
       @TControlCanvas.Create);
  // End of class TControlCanvas
  // Begin of class TControlActionLink
  G := RegisterClassType(H, TControlActionLink);
  RegisterHeader(G,
       'constructor Create(AOwner: TComponent); virtual;',
       @TControlActionLink.Create);
  // End of class TControlActionLink
  RegisterClassReferenceType(H, 'TControlActionLinkClass');
  RegisterRTTIType(H, TypeInfo(TControlState));
  RegisterRTTIType(H, TypeInfo(TControlStyle));
  RegisterRTTIType(H, TypeInfo(TMouseButton));
  RegisterRTTIType(H, TypeInfo(TDragMode));
  RegisterRTTIType(H, TypeInfo(TDragState));
  RegisterRTTIType(H, TypeInfo(TDragKind));
  RegisterRTTIType(H, TypeInfo(TTabOrder));
  RegisterTypeAlias(H, 'TCaption:string');
  RegisterTypeAlias(H, 'TDate:TDateTime');
  RegisterTypeAlias(H, 'TTime:TDateTime');
  RegisterRTTIType(H, TypeInfo(TScalingFlags));
  RegisterRTTIType(H, TypeInfo(TAnchorKind));
  RegisterRTTIType(H, TypeInfo(TAnchors));
  RegisterRTTIType(H, TypeInfo(TConstraintSize));
  // Begin of class TSizeConstraints
  G := RegisterClassType(H, TSizeConstraints);
  RegisterHeader(G, 
       'constructor Create(Control: TControl); virtual;',
       @TSizeConstraints.Create);
  // End of class TSizeConstraints
  RegisterRTTIType(H, TypeInfo(TDockOrientation));
  // Begin of class TControl
  G := RegisterClassType(H, TControl);
  RegisterHeader(G, 
       'constructor Create(AOwner: TComponent); override;',
       @TControl.Create);
  RegisterHeader(G, 
       'destructor Destroy; override;',
       @TControl.Destroy);
  RegisterHeader(G, 
       'procedure BeginDrag(Immediate: Boolean; Threshold: Integer = -1);',
       @TControl.BeginDrag);
  RegisterHeader(G, 
       'procedure BringToFront;',
       @TControl.BringToFront);
  RegisterHeader(G, 
       'function ClientToScreen(const Point: TPoint): TPoint;',
       @TControl.ClientToScreen);
  RegisterHeader(G, 
       'function ClientToParent(const Point: TPoint; AParent: TWinControl = nil): TPoint;',
       @TControl.ClientToParent);
  RegisterHeader(G, 
       'procedure Dock(NewDockSite: TWinControl; ARect: TRect); dynamic;',
       @TControl.Dock);
  RegisterHeader(G, 
       'procedure DefaultHandler(var Message); override;',
       @TControl.DefaultHandler);
  RegisterHeader(G, 
       'function Dragging: Boolean;',
       @TControl.Dragging);
  RegisterHeader(G, 
       'procedure DragDrop(Source: TObject; X, Y: Integer); dynamic;',
       @TControl.DragDrop);
  RegisterHeader(G, 
       'function DrawTextBiDiModeFlags(Flags: Longint): Longint;',
       @TControl.DrawTextBiDiModeFlags);
  RegisterHeader(G, 
       'function DrawTextBiDiModeFlagsReadingOnly: Longint;',
       @TControl.DrawTextBiDiModeFlagsReadingOnly);
  RegisterFakeHeader(G,
       'function TControl_GetEnabled:Boolean;',
       @TControl_GetEnabled);
  RegisterFakeHeader(G,
       'procedure TControl_PutEnabled(const Value: Boolean);',
       @TControl_PutEnabled);
  RegisterProperty(G,
       'property Enabled:Boolean read TControl_GetEnabled write TControl_PutEnabled;');
  RegisterHeader(G, 
       'procedure EndDrag(Drop: Boolean);',
       @TControl.EndDrag);
  RegisterHeader(G, 
       'function GetParentComponent: TComponent; override;',
       @TControl.GetParentComponent);
  RegisterHeader(G, 
       'function GetTextBuf(Buffer: PChar; BufSize: Integer): Integer;',
       @TControl.GetTextBuf);
  RegisterHeader(G, 
       'function GetTextLen: Integer;',
       @TControl.GetTextLen);
  RegisterHeader(G, 
       'function HasParent: Boolean; override;',
       @TControl.HasParent);
  RegisterHeader(G, 
       'procedure Hide;',
       @TControl.Hide);
  RegisterHeader(G, 
       'procedure InitiateAction; virtual;',
       @TControl.InitiateAction);
  RegisterHeader(G, 
       'procedure Invalidate; virtual;',
       @TControl.Invalidate);
  RegisterHeader(G, 
       'function IsRightToLeft: Boolean;',
       @TControl.IsRightToLeft);
  RegisterHeader(G, 
       'function ManualFloat(ScreenPos: TRect): Boolean;',
       @TControl.ManualFloat);
  RegisterHeader(G, 
       'function Perform(Msg: Cardinal; WParam, LParam: Longint): Longint;',
       @TControl.Perform);
  RegisterHeader(G, 
       'procedure Refresh;',
       @TControl.Refresh);
  RegisterHeader(G, 
       'procedure Repaint; virtual;',
       @TControl.Repaint);
  RegisterHeader(G, 
       'function ReplaceDockedControl(Control: TControl; NewDockSite: TWinControl;      DropControl: TControl; ControlSide: TAlign): Boolean;',
       @TControl.ReplaceDockedControl);
  RegisterHeader(G, 
       'function ScreenToClient(const Point: TPoint): TPoint;',
       @TControl.ScreenToClient);
  RegisterHeader(G, 
       'function ParentToClient(const Point: TPoint; AParent: TWinControl = nil): TPoint;',
       @TControl.ParentToClient);
  RegisterHeader(G, 
       'procedure SendToBack;',
       @TControl.SendToBack);
  RegisterHeader(G, 
       'procedure SetBounds(ALeft, ATop, AWidth, AHeight: Integer); virtual;',
       @TControl.SetBounds);
  RegisterHeader(G, 
       'procedure SetTextBuf(Buffer: PChar);',
       @TControl.SetTextBuf);
  RegisterHeader(G, 
       'procedure Show;',
       @TControl.Show);
  RegisterHeader(G, 
       'procedure Update; virtual;',
       @TControl.Update);
  RegisterHeader(G, 
       'function UseRightToLeftAlignment: Boolean; dynamic;',
       @TControl.UseRightToLeftAlignment);
  RegisterHeader(G, 
       'function UseRightToLeftReading: Boolean;',
       @TControl.UseRightToLeftReading);
  RegisterHeader(G, 
       'function UseRightToLeftScrollBar: Boolean;',
       @TControl.UseRightToLeftScrollBar);
  RegisterFakeHeader(G,
       'function TControl_GetAlign:TAlign;',
       @TControl_GetAlign);
  RegisterFakeHeader(G,
       'procedure TControl_PutAlign(const Value: TAlign);',
       @TControl_PutAlign);
  RegisterProperty(G,
       'property Align:TAlign read TControl_GetAlign write TControl_PutAlign;');
  RegisterFakeHeader(G,
       'function TControl_GetBoundsRect:TRect;',
       @TControl_GetBoundsRect);
  RegisterFakeHeader(G,
       'procedure TControl_PutBoundsRect(const Value: TRect);',
       @TControl_PutBoundsRect);
  RegisterProperty(G,
       'property BoundsRect:TRect read TControl_GetBoundsRect write TControl_PutBoundsRect;');
  RegisterFakeHeader(G,
       'function TControl_GetClientHeight:Integer;',
       @TControl_GetClientHeight);
  RegisterFakeHeader(G,
       'procedure TControl_PutClientHeight(const Value: Integer);',
       @TControl_PutClientHeight);
  RegisterProperty(G,
       'property ClientHeight:Integer read TControl_GetClientHeight write TControl_PutClientHeight;');
  RegisterFakeHeader(G,
       'function TControl_GetClientOrigin:TPoint;',
       @TControl_GetClientOrigin);
  RegisterProperty(G,
       'property ClientOrigin:TPoint read TControl_GetClientOrigin;');
  RegisterFakeHeader(G,
       'function TControl_GetClientRect:TRect;',
       @TControl_GetClientRect);
  RegisterProperty(G,
       'property ClientRect:TRect read TControl_GetClientRect;');
  RegisterFakeHeader(G,
       'function TControl_GetClientWidth:Integer;',
       @TControl_GetClientWidth);
  RegisterFakeHeader(G,
       'procedure TControl_PutClientWidth(const Value: Integer);',
       @TControl_PutClientWidth);
  RegisterProperty(G,
       'property ClientWidth:Integer read TControl_GetClientWidth write TControl_PutClientWidth;');
  RegisterFakeHeader(G,
       'function TControl_GetConstraints:TSizeConstraints;',
       @TControl_GetConstraints);
  RegisterFakeHeader(G,
       'procedure TControl_PutConstraints(const Value: TSizeConstraints);',
       @TControl_PutConstraints);
  RegisterProperty(G,
       'property Constraints:TSizeConstraints read TControl_GetConstraints write TControl_PutConstraints;');
  RegisterFakeHeader(G,
       'function TControl_GetControlState:TControlState;',
       @TControl_GetControlState);
  RegisterFakeHeader(G,
       'procedure TControl_PutControlState(const Value: TControlState);',
       @TControl_PutControlState);
  RegisterProperty(G,
       'property ControlState:TControlState read TControl_GetControlState write TControl_PutControlState;');
  RegisterFakeHeader(G,
       'function TControl_GetControlStyle:TControlStyle;',
       @TControl_GetControlStyle);
  RegisterFakeHeader(G,
       'procedure TControl_PutControlStyle(const Value: TControlStyle);',
       @TControl_PutControlStyle);
  RegisterProperty(G,
       'property ControlStyle:TControlStyle read TControl_GetControlStyle write TControl_PutControlStyle;');
  RegisterFakeHeader(G,
       'function TControl_GetDockOrientation:TDockOrientation;',
       @TControl_GetDockOrientation);
  RegisterFakeHeader(G,
       'procedure TControl_PutDockOrientation(const Value: TDockOrientation);',
       @TControl_PutDockOrientation);
  RegisterProperty(G,
       'property DockOrientation:TDockOrientation read TControl_GetDockOrientation write TControl_PutDockOrientation;');
  RegisterFakeHeader(G,
       'function TControl_GetFloating:Boolean;',
       @TControl_GetFloating);
  RegisterProperty(G,
       'property Floating:Boolean read TControl_GetFloating;');
  RegisterFakeHeader(G,
       'function TControl_GetFloatingDockSiteClass:TWinControlClass;',
       @TControl_GetFloatingDockSiteClass);
  RegisterFakeHeader(G,
       'procedure TControl_PutFloatingDockSiteClass(const Value: TWinControlClass);',
       @TControl_PutFloatingDockSiteClass);
  RegisterProperty(G,
       'property FloatingDockSiteClass:TWinControlClass read TControl_GetFloatingDockSiteClass write TControl_PutFloatingDockSiteClass;');
  RegisterFakeHeader(G,
       'function TControl_GetHostDockSite:TWinControl;',
       @TControl_GetHostDockSite);
  RegisterFakeHeader(G,
       'procedure TControl_PutHostDockSite(const Value: TWinControl);',
       @TControl_PutHostDockSite);
  RegisterProperty(G,
       'property HostDockSite:TWinControl read TControl_GetHostDockSite write TControl_PutHostDockSite;');
  RegisterFakeHeader(G,
       'function TControl_GetLRDockWidth:Integer;',
       @TControl_GetLRDockWidth);
  RegisterFakeHeader(G,
       'procedure TControl_PutLRDockWidth(const Value: Integer);',
       @TControl_PutLRDockWidth);
  RegisterProperty(G,
       'property LRDockWidth:Integer read TControl_GetLRDockWidth write TControl_PutLRDockWidth;');
  RegisterFakeHeader(G,
       'function TControl_GetParent:TWinControl;',
       @TControl_GetParent);
  RegisterFakeHeader(G,
       'procedure TControl_PutParent(const Value: TWinControl);',
       @TControl_PutParent);
  RegisterProperty(G,
       'property Parent:TWinControl read TControl_GetParent write TControl_PutParent;');
  RegisterFakeHeader(G,
       'function TControl_GetShowHint:Boolean;',
       @TControl_GetShowHint);
  RegisterFakeHeader(G,
       'procedure TControl_PutShowHint(const Value: Boolean);',
       @TControl_PutShowHint);
  RegisterProperty(G,
       'property ShowHint:Boolean read TControl_GetShowHint write TControl_PutShowHint;');
  RegisterFakeHeader(G,
       'function TControl_GetTBDockHeight:Integer;',
       @TControl_GetTBDockHeight);
  RegisterFakeHeader(G,
       'procedure TControl_PutTBDockHeight(const Value: Integer);',
       @TControl_PutTBDockHeight);
  RegisterProperty(G,
       'property TBDockHeight:Integer read TControl_GetTBDockHeight write TControl_PutTBDockHeight;');
  RegisterFakeHeader(G,
       'function TControl_GetUndockHeight:Integer;',
       @TControl_GetUndockHeight);
  RegisterFakeHeader(G,
       'procedure TControl_PutUndockHeight(const Value: Integer);',
       @TControl_PutUndockHeight);
  RegisterProperty(G,
       'property UndockHeight:Integer read TControl_GetUndockHeight write TControl_PutUndockHeight;');
  RegisterFakeHeader(G,
       'function TControl_GetUndockWidth:Integer;',
       @TControl_GetUndockWidth);
  RegisterFakeHeader(G,
       'procedure TControl_PutUndockWidth(const Value: Integer);',
       @TControl_PutUndockWidth);
  RegisterProperty(G,
       'property UndockWidth:Integer read TControl_GetUndockWidth write TControl_PutUndockWidth;');
  RegisterFakeHeader(G,
       'function TControl_GetVisible:Boolean;',
       @TControl_GetVisible);
  RegisterFakeHeader(G,
       'procedure TControl_PutVisible(const Value: Boolean);',
       @TControl_PutVisible);
  RegisterProperty(G,
       'property Visible:Boolean read TControl_GetVisible write TControl_PutVisible;');
  // End of class TControl
  RegisterClassReferenceType(H, 'TControlClass');
  // Begin of class TWinControlActionLink
  G := RegisterClassType(H, TWinControlActionLink);
  RegisterHeader(G,
       'constructor Create(AOwner: TComponent); virtual;',
       @TWinControlActionLink.Create);
  // End of class TWinControlActionLink
  RegisterClassReferenceType(H, 'TWinControlActionLinkClass');
  RegisterRTTIType(H, TypeInfo(TImeMode));
  RegisterTypeAlias(H, 'TImeName:string');
  RegisterRTTIType(H, TypeInfo(TBorderWidth));
  RegisterRTTIType(H, TypeInfo(TBevelCut));
  RegisterRTTIType(H, TypeInfo(TBevelEdge));
  RegisterRTTIType(H, TypeInfo(TBevelEdges));
  RegisterRTTIType(H, TypeInfo(TBevelKind));
  RegisterRTTIType(H, TypeInfo(TBevelWidth));
  // Begin of interface IDockManager
  G := RegisterInterfaceType(H, 'IDockManager',IDockManager);
  RegisterHeader(G, 
       'procedure BeginUpdate;', nil,4);
  RegisterHeader(G, 
       'procedure EndUpdate;', nil,5);
  RegisterHeader(G, 
       'procedure GetControlBounds(Control: TControl; out CtlBounds: TRect);', nil,6);
  RegisterHeader(G, 
       'procedure InsertControl(Control: TControl; InsertAt: TAlign;      DropCtl: TControl);', nil,7);
  RegisterHeader(G, 
       'procedure PositionDockRect(Client, DropCtl: TControl; DropAlign: TAlign;      var DockRect: TRect);', nil,10);
  RegisterHeader(G, 
       'procedure RemoveControl(Control: TControl);', nil,11);
  RegisterHeader(G, 
       'procedure ResetBounds(Force: Boolean);', nil,12);
  RegisterHeader(G, 
       'procedure SetReplacingControl(Control: TControl);', nil,14);
  // End of interface IDockManager
  // Begin of class TWinControl
  G := RegisterClassType(H, TWinControl);
  RegisterHeader(G, 
       'constructor Create(AOwner: TComponent); override;',
       @TWinControl.Create);
  RegisterHeader(G, 
       'destructor Destroy; override;',
       @TWinControl.Destroy);
  RegisterHeader(G, 
       'procedure Broadcast(var Message);',
       @TWinControl.Broadcast);
  RegisterHeader(G, 
       'function CanFocus: Boolean; dynamic;',
       @TWinControl.CanFocus);
  RegisterHeader(G, 
       'function ContainsControl(Control: TControl): Boolean;',
       @TWinControl.ContainsControl);
  RegisterHeader(G, 
       'function ControlAtPos(const Pos: TPoint; AllowDisabled: Boolean;      AllowWinControls: Boolean = False): TControl;',
       @TWinControl.ControlAtPos);
  RegisterHeader(G, 
       'procedure DefaultHandler(var Message); override;',
       @TWinControl.DefaultHandler);
  RegisterHeader(G, 
       'procedure DisableAlign;',
       @TWinControl.DisableAlign);
  RegisterFakeHeader(G,
       'function TWinControl_GetDockClientCount:Integer;',
       @TWinControl_GetDockClientCount);
  RegisterProperty(G,
       'property DockClientCount:Integer read TWinControl_GetDockClientCount;');
  RegisterFakeHeader(G,
       'function TWinControl_GetDockClients(Index: Integer):TControl;',
       @TWinControl_GetDockClients);
  RegisterProperty(G,
       'property DockClients[Index: Integer]:TControl read TWinControl_GetDockClients;');
  RegisterHeader(G,
       'procedure DockDrop(Source: TDragDockObject; X, Y: Integer); dynamic;',
       @TWinControl.DockDrop);
  RegisterFakeHeader(G,
       'function TWinControl_GetDoubleBuffered:Boolean;',
       @TWinControl_GetDoubleBuffered);
  RegisterFakeHeader(G,
       'procedure TWinControl_PutDoubleBuffered(const Value: Boolean);',
       @TWinControl_PutDoubleBuffered);
  RegisterProperty(G,
       'property DoubleBuffered:Boolean read TWinControl_GetDoubleBuffered write TWinControl_PutDoubleBuffered;');
  RegisterHeader(G, 
       'procedure EnableAlign;',
       @TWinControl.EnableAlign);
  RegisterHeader(G, 
       'function FindChildControl(const ControlName: string): TControl;',
       @TWinControl.FindChildControl);
  RegisterHeader(G, 
       'procedure FlipChildren(AllLevels: Boolean); dynamic;',
       @TWinControl.FlipChildren);
  RegisterHeader(G, 
       'function Focused: Boolean; dynamic;',
       @TWinControl.Focused);
  RegisterHeader(G, 
       'function HandleAllocated: Boolean;',
       @TWinControl.HandleAllocated);
  RegisterHeader(G, 
       'procedure HandleNeeded;',
       @TWinControl.HandleNeeded);
  RegisterHeader(G, 
       'procedure InsertControl(AControl: TControl);',
       @TWinControl.InsertControl);
  RegisterHeader(G, 
       'procedure Invalidate; override;',
       @TWinControl.Invalidate);
  RegisterHeader(G, 
       'procedure RemoveControl(AControl: TControl);',
       @TWinControl.RemoveControl);
  RegisterHeader(G, 
       'procedure Realign;',
       @TWinControl.Realign);
  RegisterHeader(G, 
       'procedure Repaint; override;',
       @TWinControl.Repaint);
  RegisterHeader(G, 
       'procedure ScaleBy(M, D: Integer);',
       @TWinControl.ScaleBy);
  RegisterHeader(G, 
       'procedure ScrollBy(DeltaX, DeltaY: Integer);',
       @TWinControl.ScrollBy);
  RegisterHeader(G, 
       'procedure SetBounds(ALeft, ATop, AWidth, AHeight: Integer); override;',
       @TWinControl.SetBounds);
  RegisterHeader(G, 
       'procedure SetFocus; virtual;',
       @TWinControl.SetFocus);
  RegisterHeader(G, 
       'procedure Update; override;',
       @TWinControl.Update);
  RegisterHeader(G, 
       'procedure UpdateControlState;',
       @TWinControl.UpdateControlState);
  RegisterFakeHeader(G,
       'function TWinControl_GetAlignDisabled:Boolean;',
       @TWinControl_GetAlignDisabled);
  RegisterProperty(G,
       'property AlignDisabled:Boolean read TWinControl_GetAlignDisabled;');
  RegisterFakeHeader(G,
       'function TWinControl_GetVisibleDockClientCount:Integer;',
       @TWinControl_GetVisibleDockClientCount);
  RegisterProperty(G,
       'property VisibleDockClientCount:Integer read TWinControl_GetVisibleDockClientCount;');
  RegisterFakeHeader(G,
       'function TWinControl_GetControls(Index: Integer):TControl;',
       @TWinControl_GetControls);
  RegisterProperty(G,
       'property Controls[Index: Integer]:TControl read TWinControl_GetControls;');
  RegisterFakeHeader(G,
       'function TWinControl_GetControlCount:Integer;',
       @TWinControl_GetControlCount);
  RegisterProperty(G,
       'property ControlCount:Integer read TWinControl_GetControlCount;');
  RegisterFakeHeader(G,
       'function TWinControl_GetShowing:Boolean;',
       @TWinControl_GetShowing);
  RegisterProperty(G,
       'property Showing:Boolean read TWinControl_GetShowing;');
  RegisterFakeHeader(G,
       'function TWinControl_GetTabOrder:TTabOrder;',
       @TWinControl_GetTabOrder);
  RegisterFakeHeader(G,
       'procedure TWinControl_PutTabOrder(const Value: TTabOrder);',
       @TWinControl_PutTabOrder);
  RegisterProperty(G,
       'property TabOrder:TTabOrder read TWinControl_GetTabOrder write TWinControl_PutTabOrder;');
  RegisterFakeHeader(G,
       'function TWinControl_GetTabStop:Boolean;',
       @TWinControl_GetTabStop);
  RegisterFakeHeader(G,
       'procedure TWinControl_PutTabStop(const Value: Boolean);',
       @TWinControl_PutTabStop);
  RegisterProperty(G,
       'property TabStop:Boolean read TWinControl_GetTabStop write TWinControl_PutTabStop;');
  // End of class TWinControl
  // Begin of class TGraphicControl
  G := RegisterClassType(H, TGraphicControl);
  RegisterHeader(G,
       'constructor Create(AOwner: TComponent); override;',
       @TGraphicControl.Create);
  RegisterHeader(G,
       'destructor Destroy; override;',
       @TGraphicControl.Destroy);
  // End of class TGraphicControl
  // Begin of class TCustomControl
  G := RegisterClassType(H, TCustomControl);
  RegisterHeader(G, 
       'constructor Create(AOwner: TComponent); override;',
       @TCustomControl.Create);
  RegisterHeader(G, 
       'destructor Destroy; override;',
       @TCustomControl.Destroy);
  // End of class TCustomControl
  // Begin of class THintWindow
  G := RegisterClassType(H, THintWindow);
  RegisterHeader(G, 
       'constructor Create(AOwner: TComponent); override;',
       @THintWindow.Create);
  RegisterHeader(G, 
       'procedure ActivateHint(Rect: TRect; const AHint: string); virtual;',
       @THintWindow.ActivateHint);
  RegisterHeader(G, 
       'procedure ActivateHintData(Rect: TRect; const AHint: string; AData: Pointer); virtual;',
       @THintWindow.ActivateHintData);
  RegisterHeader(G, 
       'function CalcHintRect(MaxWidth: Integer; const AHint: string;      AData: Pointer): TRect; virtual;',
       @THintWindow.CalcHintRect);
  RegisterHeader(G, 
       'procedure ReleaseHandle;',
       @THintWindow.ReleaseHandle);
  // End of class THintWindow
  RegisterClassReferenceType(H, 'THintWindowClass');
  // Begin of class TDragImageList
  G := RegisterClassType(H, TDragImageList);
  RegisterHeader(G, 
       'function DragMove(X, Y: Integer): Boolean;',
       @TDragImageList.DragMove);
  RegisterHeader(G, 
       'procedure DragUnlock;',
       @TDragImageList.DragUnlock);
  RegisterHeader(G, 
       'function EndDrag: Boolean;',
       @TDragImageList.EndDrag);
  RegisterHeader(G, 
       'function GetHotSpot: TPoint; override;',
       @TDragImageList.GetHotSpot);
  RegisterHeader(G, 
       'procedure HideDragImage;',
       @TDragImageList.HideDragImage);
  RegisterHeader(G, 
       'function SetDragImage(Index, HotSpotX, HotSpotY: Integer): Boolean;',
       @TDragImageList.SetDragImage);
  RegisterHeader(G, 
       'procedure ShowDragImage;',
       @TDragImageList.ShowDragImage);
  RegisterFakeHeader(G,
       'function TDragImageList_GetDragCursor:TCursor;',
       @TDragImageList_GetDragCursor);
  RegisterFakeHeader(G,
       'procedure TDragImageList_PutDragCursor(const Value: TCursor);',
       @TDragImageList_PutDragCursor);
  RegisterProperty(G,
       'property DragCursor:TCursor read TDragImageList_GetDragCursor write TDragImageList_PutDragCursor;');
  RegisterFakeHeader(G,
       'function TDragImageList_GetDragging:Boolean;',
       @TDragImageList_GetDragging);
  RegisterProperty(G,
       'property Dragging:Boolean read TDragImageList_GetDragging;');
  RegisterHeader(G,
       'constructor Create(AOwner: TComponent); virtual;',
       @TDragImageList.Create);
  // End of class TDragImageList
  // Begin of class TImageList
  G := RegisterClassType(H, TImageList);
  RegisterHeader(G,
       'constructor Create;',
       @TImageList.Create);
  // End of class TImageList
  // Begin of class TDockTree
  G := RegisterClassType(H, TDockTree);
  // End of class TDockTree
  // Begin of class TDockZone
  G := RegisterClassType(H, TDockZone);
  RegisterHeader(G, 
       'constructor Create(Tree: TDockTree);',
       @TDockZone.Create);
  RegisterHeader(G, 
       'procedure ExpandZoneLimit(NewLimit: Integer);',
       @TDockZone.ExpandZoneLimit);
  RegisterHeader(G, 
       'function FirstVisibleChild: TDockZone;',
       @TDockZone.FirstVisibleChild);
  RegisterHeader(G, 
       'function NextVisible: TDockZone;',
       @TDockZone.NextVisible);
  RegisterHeader(G, 
       'function PrevVisible: TDockZone;',
       @TDockZone.PrevVisible);
  RegisterHeader(G, 
       'procedure ResetChildren;',
       @TDockZone.ResetChildren);
  RegisterHeader(G, 
       'procedure ResetZoneLimits;',
       @TDockZone.ResetZoneLimits);
  RegisterHeader(G, 
       'procedure Update;',
       @TDockZone.Update);
  RegisterFakeHeader(G,
       'function TDockZone_GetChildCount:Integer;',
       @TDockZone_GetChildCount);
  RegisterProperty(G,
       'property ChildCount:Integer read TDockZone_GetChildCount;');
  RegisterFakeHeader(G,
       'function TDockZone_GetHeight:Integer;',
       @TDockZone_GetHeight);
  RegisterProperty(G,
       'property Height:Integer read TDockZone_GetHeight;');
  RegisterFakeHeader(G,
       'function TDockZone_GetLeft:Integer;',
       @TDockZone_GetLeft);
  RegisterProperty(G,
       'property Left:Integer read TDockZone_GetLeft;');
  RegisterFakeHeader(G,
       'function TDockZone_GetLimitBegin:Integer;',
       @TDockZone_GetLimitBegin);
  RegisterProperty(G,
       'property LimitBegin:Integer read TDockZone_GetLimitBegin;');
  RegisterFakeHeader(G,
       'function TDockZone_GetLimitSize:Integer;',
       @TDockZone_GetLimitSize);
  RegisterProperty(G,
       'property LimitSize:Integer read TDockZone_GetLimitSize;');
  RegisterFakeHeader(G,
       'function TDockZone_GetTop:Integer;',
       @TDockZone_GetTop);
  RegisterProperty(G,
       'property Top:Integer read TDockZone_GetTop;');
  RegisterFakeHeader(G,
       'function TDockZone_GetVisible:Boolean;',
       @TDockZone_GetVisible);
  RegisterProperty(G,
       'property Visible:Boolean read TDockZone_GetVisible;');
  RegisterFakeHeader(G,
       'function TDockZone_GetVisibleChildCount:Integer;',
       @TDockZone_GetVisibleChildCount);
  RegisterProperty(G,
       'property VisibleChildCount:Integer read TDockZone_GetVisibleChildCount;');
  RegisterFakeHeader(G,
       'function TDockZone_GetWidth:Integer;',
       @TDockZone_GetWidth);
  RegisterProperty(G,
       'property Width:Integer read TDockZone_GetWidth;');
  RegisterFakeHeader(G,
       'function TDockZone_GetZoneLimit:Integer;',
       @TDockZone_GetZoneLimit);
  RegisterFakeHeader(G,
       'procedure TDockZone_PutZoneLimit(const Value: Integer);',
       @TDockZone_PutZoneLimit);
  RegisterProperty(G,
       'property ZoneLimit:Integer read TDockZone_GetZoneLimit write TDockZone_PutZoneLimit;');
  // End of class TDockZone
  RegisterClassReferenceType(H, 'TDockTreeClass');
  // Begin of class TDockTree
  G := RegisterClassType(H, TDockTree);
  RegisterHeader(G,
       'constructor Create(DockSite: TWinControl); virtual;',
       @TDockTree.Create);
  RegisterHeader(G, 
       'destructor Destroy; override;',
       @TDockTree.Destroy);
  // End of class TDockTree
  // Begin of class TMouse
  G := RegisterClassType(H, TMouse);
  RegisterHeader(G, 
       'constructor Create;',
       @TMouse.Create);
  RegisterHeader(G, 
       'destructor Destroy; override;',
       @TMouse.Destroy);
  RegisterHeader(G, 
       'procedure SettingChanged(Setting: Integer);',
       @TMouse.SettingChanged);
  RegisterFakeHeader(G,
       'function TMouse_GetCursorPos:TPoint;',
       @TMouse_GetCursorPos);
  RegisterFakeHeader(G,
       'procedure TMouse_PutCursorPos(const Value: TPoint);',
       @TMouse_PutCursorPos);
  RegisterProperty(G,
       'property CursorPos:TPoint read TMouse_GetCursorPos write TMouse_PutCursorPos;');
  RegisterFakeHeader(G,
       'function TMouse_GetDragImmediate:Boolean;',
       @TMouse_GetDragImmediate);
  RegisterFakeHeader(G,
       'procedure TMouse_PutDragImmediate(const Value: Boolean);',
       @TMouse_PutDragImmediate);
  RegisterProperty(G,
       'property DragImmediate:Boolean read TMouse_GetDragImmediate write TMouse_PutDragImmediate;');
  RegisterFakeHeader(G,
       'function TMouse_GetDragThreshold:Integer;',
       @TMouse_GetDragThreshold);
  RegisterFakeHeader(G,
       'procedure TMouse_PutDragThreshold(const Value: Integer);',
       @TMouse_PutDragThreshold);
  RegisterProperty(G,
       'property DragThreshold:Integer read TMouse_GetDragThreshold write TMouse_PutDragThreshold;');
  RegisterFakeHeader(G,
       'function TMouse_GetMousePresent:Boolean;',
       @TMouse_GetMousePresent);
  RegisterProperty(G,
       'property MousePresent:Boolean read TMouse_GetMousePresent;');
  RegisterFakeHeader(G,
       'function TMouse_GetIsDragging:Boolean;',
       @TMouse_GetIsDragging);
  RegisterProperty(G,
       'property IsDragging:Boolean read TMouse_GetIsDragging;');
  RegisterFakeHeader(G,
       'function TMouse_GetWheelPresent:Boolean;',
       @TMouse_GetWheelPresent);
  RegisterProperty(G,
       'property WheelPresent:Boolean read TMouse_GetWheelPresent;');
  RegisterFakeHeader(G,
       'function TMouse_GetWheelScrollLines:Integer;',
       @TMouse_GetWheelScrollLines);
  RegisterProperty(G,
       'property WheelScrollLines:Integer read TMouse_GetWheelScrollLines;');
  // End of class TMouse
  // Begin of class TCustomListControl
  G := RegisterClassType(H, TCustomListControl);
  RegisterHeader(G,
       'procedure MoveSelection(Destination: TCustomListControl); virtual;',
       @TCustomListControl.MoveSelection);
  RegisterFakeHeader(G,
       'function TCustomListControl_GetItemIndex:Integer;',
       @TCustomListControl_GetItemIndex);
  RegisterFakeHeader(G,
       'procedure TCustomListControl_PutItemIndex(const Value: Integer);',
       @TCustomListControl_PutItemIndex);
  RegisterProperty(G,
       'property ItemIndex:Integer read TCustomListControl_GetItemIndex write TCustomListControl_PutItemIndex;');
  RegisterHeader(G,
       'constructor Create;',
       @TCustomListControl.Create);
  // End of class TCustomListControl
  // Begin of class TCustomMultiSelectListControl
  G := RegisterClassType(H, TCustomMultiSelectListControl);
  RegisterFakeHeader(G,
       'function TCustomMultiSelectListControl_GetMultiSelect:Boolean;',
       @TCustomMultiSelectListControl_GetMultiSelect);
  RegisterFakeHeader(G,
       'procedure TCustomMultiSelectListControl_PutMultiSelect(const Value: Boolean);',
       @TCustomMultiSelectListControl_PutMultiSelect);
  RegisterProperty(G,
       'property MultiSelect:Boolean read TCustomMultiSelectListControl_GetMultiSelect write TCustomMultiSelectListControl_PutMultiSelect;');
  RegisterFakeHeader(G,
       'function TCustomMultiSelectListControl_GetSelCount:Integer;',
       @TCustomMultiSelectListControl_GetSelCount);
  RegisterProperty(G,
       'property SelCount:Integer read TCustomMultiSelectListControl_GetSelCount;');
  RegisterHeader(G,
       'constructor Create;',
       @TCustomMultiSelectListControl.Create);
  // End of class TCustomMultiSelectListControl
  RegisterVariable(H, 'Mouse: TMouse;',@Mouse);
  RegisterHeader(H, 'function IsDragObject(Sender: TObject): Boolean;', @IsDragObject);
  RegisterHeader(H, 'function FindVCLWindow(const Pos: TPoint): TWinControl;', @FindVCLWindow);
  RegisterHeader(H, 'function FindDragTarget(const Pos: TPoint; AllowDisabled: Boolean): TControl;', @FindDragTarget);
  RegisterHeader(H, 'function GetCaptureControl: TControl;', @GetCaptureControl);
  RegisterHeader(H, 'procedure SetCaptureControl(Control: TControl);', @SetCaptureControl);
  RegisterHeader(H, 'procedure CancelDrag;', @CancelDrag);
  RegisterHeader(H, 'function CursorToString(Cursor: TCursor): string;', @CursorToString);
  RegisterHeader(H, 'function StringToCursor(const S: string): TCursor;', @StringToCursor);
  RegisterHeader(H, 'function CursorToIdent(Cursor: Longint; var Ident: string): Boolean;', @CursorToIdent);
  RegisterHeader(H, 'function IdentToCursor(const Ident: string; var Cursor: Longint): Boolean;', @IdentToCursor);
  RegisterHeader(H, 'function GetShortHint(const Hint: string): string;', @GetShortHint);
  RegisterHeader(H, 'function GetLongHint(const Hint: string): string;', @GetLongHint);
  RegisterConstant(H, 'CTL3D_ALL', $FFFF);
  RegisterVariable(H, 'NewStyleControls: Boolean;',@NewStyleControls);
  RegisterHeader(H, 'function SendAppMessage(Msg: Cardinal; WParam, LParam: Longint): Longint;', @SendAppMessage);
  RegisterHeader(H, 'procedure SetImeName(Name: TImeName);', @SetImeName);
  RegisterHeader(H, 'procedure DragDone(Drop: Boolean);', @DragDone);
end;
end.
