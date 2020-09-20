{$I PaxCompiler.def}

unit IMPORT_Menus;
interface
uses
  SysUtils,
  Classes,
  Contnrs,
{$IFDEF DPULSAR}
  Winapi.Windows,
  Winapi.Messages,
  Vcl.Graphics,
  Vcl.ImgList,
  Vcl.ActnList,
  Vcl.Menus,
{$ELSE}
  Windows,
  Messages,
  Graphics,
  ImgList,
  ActnList,
  Menus,
{$ENDIF}
  Variants,
  PaxRegister,
  PaxCompiler;
procedure Register_Menus;
implementation
procedure TMenuItem_Add1(Self: TMenuItem;Item: TMenuItem); 
begin
  Self.Add(Item);
end;
procedure TMenuItem_Add2(Self: TMenuItem;const AItems: array of TMenuItem); 
begin
  Self.Add(AItems);
end;
function TMenuItem_GetCommand(Self:TMenuItem):Word;
begin
  result := Self.Command;
end;
function TMenuItem_GetCount(Self:TMenuItem):Integer;
begin
  result := Self.Count;
end;
function TMenuItem_GetItems(Self:TMenuItem;Index: Integer):TMenuItem;
begin
  result := Self.Items[Index];
end;
function TMenuItem_GetMenuIndex(Self:TMenuItem):Integer;
begin
  result := Self.MenuIndex;
end;
procedure TMenuItem_PutMenuIndex(Self:TMenuItem;const Value: Integer);
begin
  Self.MenuIndex := Value;
end;
function TMenuItem_GetParent(Self:TMenuItem):TMenuItem;
begin
  result := Self.Parent;
end;
procedure TMenu_ParentBiDiModeChanged3(Self: TMenu); 
begin
  Self.ParentBiDiModeChanged();
end;
procedure TMenu_ParentBiDiModeChanged4(Self: TMenu;AControl: TObject); 
begin
  Self.ParentBiDiModeChanged(AControl);
end;
function TMenu_GetAutoHotkeys(Self:TMenu):TMenuAutoFlag;
begin
  result := Self.AutoHotkeys;
end;
procedure TMenu_PutAutoHotkeys(Self:TMenu;const Value: TMenuAutoFlag);
begin
  Self.AutoHotkeys := Value;
end;
function TMenu_GetAutoLineReduction(Self:TMenu):TMenuAutoFlag;
begin
  result := Self.AutoLineReduction;
end;
procedure TMenu_PutAutoLineReduction(Self:TMenu;const Value: TMenuAutoFlag);
begin
  Self.AutoLineReduction := Value;
end;
function TMenu_GetOwnerDraw(Self:TMenu):Boolean;
begin
  result := Self.OwnerDraw;
end;
procedure TMenu_PutOwnerDraw(Self:TMenu;const Value: Boolean);
begin
  Self.OwnerDraw := Value;
end;
function TMenu_GetParentBiDiMode(Self:TMenu):Boolean;
begin
  result := Self.ParentBiDiMode;
end;
procedure TMenu_PutParentBiDiMode(Self:TMenu;const Value: Boolean);
begin
  Self.ParentBiDiMode := Value;
end;
function TPopupMenu_GetPopupComponent(Self:TPopupMenu):TComponent;
begin
  result := Self.PopupComponent;
end;
procedure TPopupMenu_PutPopupComponent(Self:TPopupMenu;const Value: TComponent);
begin
  Self.PopupComponent := Value;
end;
function TPopupMenu_GetPopupPoint(Self:TPopupMenu):TPoint;
begin
  result := Self.PopupPoint;
end;
procedure Register_Menus;
var G, H: Integer;
begin
  H := RegisterNamespace(0, 'Menus');
  // Begin of class TMenuItem
  G := RegisterClassType(H, TMenuItem);
  // End of class TMenuItem
  // Begin of class EMenuError
  G := RegisterClassType(H, EMenuError);
  // End of class EMenuError
  // Begin of class TMenu
  G := RegisterClassType(H, TMenu);
  // End of class TMenu
  RegisterRTTIType(H, TypeInfo(TMenuBreak));
  RegisterRTTIType(H, TypeInfo(TMenuItemAutoFlag));
  RegisterRTTIType(H, TypeInfo(TMenuAutoFlag));
  // Begin of class TMenuActionLink
  G := RegisterClassType(H, TMenuActionLink);
  RegisterHeader(G,
       'constructor Create(AOwner: TComponent); virtual;',
       @TMenuActionLink.Create);
  // End of class TMenuActionLink
  RegisterClassReferenceType(H, 'TMenuActionLinkClass');
  // Begin of class TMenuItem
  G := RegisterClassType(H, TMenuItem);
  RegisterHeader(G, 
       'constructor Create(AOwner: TComponent); override;',
       @TMenuItem.Create);
  RegisterHeader(G, 
       'destructor Destroy; override;',
       @TMenuItem.Destroy);
  RegisterHeader(G, 
       'procedure InitiateAction; virtual;',
       @TMenuItem.InitiateAction);
  RegisterHeader(G, 
       'procedure Insert(Index: Integer; Item: TMenuItem);',
       @TMenuItem.Insert);
  RegisterHeader(G, 
       'procedure Delete(Index: Integer);',
       @TMenuItem.Delete);
  RegisterHeader(G, 
       'procedure Clear;',
       @TMenuItem.Clear);
  RegisterHeader(G, 
       'procedure Click; virtual;',
       @TMenuItem.Click);
  RegisterHeader(G, 
       'function Find(ACaption: string): TMenuItem;',
       @TMenuItem.Find);
  RegisterHeader(G, 
       'function IndexOf(Item: TMenuItem): Integer;',
       @TMenuItem.IndexOf);
  RegisterHeader(G, 
       'function IsLine: Boolean;',
       @TMenuItem.IsLine);
  RegisterHeader(G, 
       'function GetParentComponent: TComponent; override;',
       @TMenuItem.GetParentComponent);
  RegisterHeader(G, 
       'function GetParentMenu: TMenu;',
       @TMenuItem.GetParentMenu);
  RegisterHeader(G, 
       'function HasParent: Boolean; override;',
       @TMenuItem.HasParent);
  RegisterHeader(G, 
       'function NewTopLine: Integer;',
       @TMenuItem.NewTopLine);
  RegisterHeader(G, 
       'function NewBottomLine: Integer;',
       @TMenuItem.NewBottomLine);
  RegisterHeader(G, 
       'function InsertNewLineBefore(AItem: TMenuItem): Integer;',
       @TMenuItem.InsertNewLineBefore);
  RegisterHeader(G, 
       'function InsertNewLineAfter(AItem: TMenuItem): Integer;',
       @TMenuItem.InsertNewLineAfter);
  RegisterHeader(G, 'procedure Add(Item: TMenuItem); overload;', @TMenuItem_Add1);
  RegisterHeader(G, 'procedure Add(const AItems: array of TMenuItem); overload;', @TMenuItem_Add2);
  RegisterHeader(G, 
       'procedure Remove(Item: TMenuItem);',
       @TMenuItem.Remove);
  RegisterHeader(G, 
       'function RethinkHotkeys: Boolean;',
       @TMenuItem.RethinkHotkeys);
  RegisterHeader(G, 
       'function RethinkLines: Boolean;',
       @TMenuItem.RethinkLines);
  RegisterFakeHeader(G,
       'function TMenuItem_GetCommand:Word;',
       @TMenuItem_GetCommand);
  RegisterProperty(G,
       'property Command:Word read TMenuItem_GetCommand;');
  RegisterFakeHeader(G,
       'function TMenuItem_GetCount:Integer;',
       @TMenuItem_GetCount);
  RegisterProperty(G,
       'property Count:Integer read TMenuItem_GetCount;');
  RegisterFakeHeader(G,
       'function TMenuItem_GetItems(Index: Integer):TMenuItem;',
       @TMenuItem_GetItems);
  RegisterProperty(G,
       'property Items[Index: Integer]:TMenuItem read TMenuItem_GetItems;default;');
  RegisterFakeHeader(G,
       'function TMenuItem_GetMenuIndex:Integer;',
       @TMenuItem_GetMenuIndex);
  RegisterFakeHeader(G,
       'procedure TMenuItem_PutMenuIndex(const Value: Integer);',
       @TMenuItem_PutMenuIndex);
  RegisterProperty(G,
       'property MenuIndex:Integer read TMenuItem_GetMenuIndex write TMenuItem_PutMenuIndex;');
  RegisterFakeHeader(G,
       'function TMenuItem_GetParent:TMenuItem;',
       @TMenuItem_GetParent);
  RegisterProperty(G,
       'property Parent:TMenuItem read TMenuItem_GetParent;');
  // End of class TMenuItem
  RegisterRTTIType(H, TypeInfo(TFindItemKind));
  // Begin of class TMenu
  G := RegisterClassType(H, TMenu);
  RegisterHeader(G,
       'constructor Create(AOwner: TComponent); override;',
       @TMenu.Create);
  RegisterHeader(G, 
       'destructor Destroy; override;',
       @TMenu.Destroy);
  RegisterHeader(G, 
       'function DispatchCommand(ACommand: Word): Boolean;',
       @TMenu.DispatchCommand);
  RegisterHeader(G, 
       'function FindItem(Value: Integer; Kind: TFindItemKind): TMenuItem;',
       @TMenu.FindItem);
  RegisterHeader(G, 
       'function IsRightToLeft: Boolean;',
       @TMenu.IsRightToLeft);
  RegisterHeader(G, 'procedure ParentBiDiModeChanged; overload;', @TMenu_ParentBiDiModeChanged3);
  RegisterHeader(G, 'procedure ParentBiDiModeChanged(AControl: TObject); overload;', @TMenu_ParentBiDiModeChanged4);
  RegisterFakeHeader(G,
       'function TMenu_GetAutoHotkeys:TMenuAutoFlag;',
       @TMenu_GetAutoHotkeys);
  RegisterFakeHeader(G,
       'procedure TMenu_PutAutoHotkeys(const Value: TMenuAutoFlag);',
       @TMenu_PutAutoHotkeys);
  RegisterProperty(G,
       'property AutoHotkeys:TMenuAutoFlag read TMenu_GetAutoHotkeys write TMenu_PutAutoHotkeys;');
  RegisterFakeHeader(G,
       'function TMenu_GetAutoLineReduction:TMenuAutoFlag;',
       @TMenu_GetAutoLineReduction);
  RegisterFakeHeader(G,
       'procedure TMenu_PutAutoLineReduction(const Value: TMenuAutoFlag);',
       @TMenu_PutAutoLineReduction);
  RegisterProperty(G,
       'property AutoLineReduction:TMenuAutoFlag read TMenu_GetAutoLineReduction write TMenu_PutAutoLineReduction;');
  RegisterFakeHeader(G,
       'function TMenu_GetOwnerDraw:Boolean;',
       @TMenu_GetOwnerDraw);
  RegisterFakeHeader(G,
       'procedure TMenu_PutOwnerDraw(const Value: Boolean);',
       @TMenu_PutOwnerDraw);
  RegisterProperty(G,
       'property OwnerDraw:Boolean read TMenu_GetOwnerDraw write TMenu_PutOwnerDraw;');
  RegisterFakeHeader(G,
       'function TMenu_GetParentBiDiMode:Boolean;',
       @TMenu_GetParentBiDiMode);
  RegisterFakeHeader(G,
       'procedure TMenu_PutParentBiDiMode(const Value: Boolean);',
       @TMenu_PutParentBiDiMode);
  RegisterProperty(G,
       'property ParentBiDiMode:Boolean read TMenu_GetParentBiDiMode write TMenu_PutParentBiDiMode;');
  // End of class TMenu
  // Begin of class TMainMenu
  G := RegisterClassType(H, TMainMenu);
  RegisterHeader(G,
       'procedure Merge(Menu: TMainMenu);',
       @TMainMenu.Merge);
  RegisterHeader(G,
       'procedure Unmerge(Menu: TMainMenu);',
       @TMainMenu.Unmerge);
  RegisterHeader(G,
       'constructor Create(Owner: TComponent);',
       @TMainMenu.Create);
  // End of class TMainMenu
  RegisterRTTIType(H, TypeInfo(TPopupAlignment));
  RegisterRTTIType(H, TypeInfo(TTrackButton));
  RegisterRTTIType(H, TypeInfo(TMenuAnimations));
  RegisterRTTIType(H, TypeInfo(TMenuAnimation));
  // Begin of class TPopupMenu
  G := RegisterClassType(H, TPopupMenu);
  RegisterHeader(G, 
       'constructor Create(AOwner: TComponent); override;',
       @TPopupMenu.Create);
  RegisterHeader(G, 
       'destructor Destroy; override;',
       @TPopupMenu.Destroy);
  RegisterHeader(G, 
       'procedure Popup(X, Y: Integer); virtual;',
       @TPopupMenu.Popup);
  RegisterFakeHeader(G,
       'function TPopupMenu_GetPopupComponent:TComponent;',
       @TPopupMenu_GetPopupComponent);
  RegisterFakeHeader(G,
       'procedure TPopupMenu_PutPopupComponent(const Value: TComponent);',
       @TPopupMenu_PutPopupComponent);
  RegisterProperty(G,
       'property PopupComponent:TComponent read TPopupMenu_GetPopupComponent write TPopupMenu_PutPopupComponent;');
  RegisterFakeHeader(G,
       'function TPopupMenu_GetPopupPoint:TPoint;',
       @TPopupMenu_GetPopupPoint);
  RegisterProperty(G,
       'property PopupPoint:TPoint read TPopupMenu_GetPopupPoint;');
  // End of class TPopupMenu
  // Begin of class TPopupList
  G := RegisterClassType(H, TPopupList);
  RegisterHeader(G, 
       'procedure Add(Popup: TPopupMenu);',
       @TPopupList.Add);
  RegisterHeader(G, 
       'procedure Remove(Popup: TPopupMenu);',
       @TPopupList.Remove);
  RegisterHeader(G,
       'constructor Create(AOwner: TComponent); virtual;',
       @TPopupList.Create);
  // End of class TPopupList
  // Begin of class TMenuItemStack
  G := RegisterClassType(H, TMenuItemStack);
  RegisterHeader(G, 
       'procedure ClearItem(AItem: TMenuItem);',
       @TMenuItemStack.ClearItem);
  RegisterHeader(G,
       'constructor Create(AOwner: TComponent); virtual;',
       @TMenuItemStack.Create);
  // End of class TMenuItemStack
  RegisterVariable(H, 'PopupList: TPopupList;',@PopupList);
  RegisterVariable(H, 'ShortCutItems: TMenuItemStack;',@ShortCutItems);
  RegisterHeader(H, 'function NewMenu(Owner: TComponent; const AName: string; const Items: array of TMenuItem): TMainMenu;', @NewMenu);
  RegisterHeader(H, 'function NewPopupMenu(Owner: TComponent; const AName: string;  Alignment: TPopupAlignment; AutoPopup: Boolean; const Items: array of TMenuItem): TPopupMenu;', @NewPopupMenu);
  RegisterHeader(H, 'function NewLine: TMenuItem;', @NewLine);
  RegisterConstant(H, 'cHotkeyPrefix', '&');
  RegisterConstant(H, 'cLineCaption', '-');
  RegisterConstant(H, 'cDialogSuffix', '...');
  RegisterHeader(H, 'function StripHotkey(const Text: string): string;', @StripHotkey);
  RegisterHeader(H, 'function GetHotkey(const Text: string): string;', @GetHotkey);
  RegisterHeader(H, 'function AnsiSameCaption(const Text1, Text2: string): Boolean;', @AnsiSameCaption);
end;
end.
