{$I PaxCompiler.def}

unit IMPORT_StdCtrls;
interface
uses
  SysUtils,
  Classes,
{$IFDEF DPULSAR}
  Winapi.Messages,
  Winapi.Windows,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Menus,
  Vcl.Graphics,
  Vcl.StdCtrls,
{$ELSE}
  Messages,
  Windows,
  Controls,
  Forms,
  Menus,
  Graphics,
  StdCtrls,
{$ENDIF}
  Variants,
  PaxRegister,
  PaxCompiler;

procedure Register_StdCtrls;
implementation

type
  TMemoStrings = class(TStrings)
   private
     Memo: TCustomMemo;
   public
  //  procedure Clear; override;
   end;

  // procedure TMemoStrings.Clear;
  // begin
  //  Memo.Clear;
  // end;

  procedure TMemoStrings_Clear(Self: TMemoStrings); // fake method
  begin
   Self.Memo.Clear;
  end;

type
  TListBoxStrings = class(TStrings)
  private
    ListBox: TCustomListBox;
  public
//  procedure Clear; override;
  end;

  // procedure TListBoxStrings.Clear;
  // begin
  //   ListBox.Clear;
  // end;

  procedure TListBoxStrings_Clear(Self: TListBoxStrings); // fake method
  begin
    Self.ListBox.Clear;
  end;



function TCustomEdit_GetCanUndo(Self:TCustomEdit):Boolean;
begin
  result := Self.CanUndo;
end;
function TCustomEdit_GetModified(Self:TCustomEdit):Boolean;
begin
  result := Self.Modified;
end;
procedure TCustomEdit_PutModified(Self:TCustomEdit;const Value: Boolean);
begin
  Self.Modified := Value;
end;
function TCustomEdit_GetSelLength(Self:TCustomEdit):Integer;
begin
  result := Self.SelLength;
end;
procedure TCustomEdit_PutSelLength(Self:TCustomEdit;const Value: Integer);
begin
  Self.SelLength := Value;
end;
function TCustomEdit_GetSelStart(Self:TCustomEdit):Integer;
begin
  result := Self.SelStart;
end;
procedure TCustomEdit_PutSelStart(Self:TCustomEdit;const Value: Integer);
begin
  Self.SelStart := Value;
end;
function TCustomEdit_GetSelText(Self:TCustomEdit):string;
begin
  result := Self.SelText;
end;
procedure TCustomEdit_PutSelText(Self:TCustomEdit;const Value: string);
begin
  Self.SelText := Value;
end;
function TCustomMemo_GetCaretPos(Self:TCustomMemo):TPoint;
begin
  result := Self.CaretPos;
end;
procedure TCustomMemo_PutCaretPos(Self:TCustomMemo;const Value: TPoint);
begin
  Self.CaretPos := Value;
end;
function TCustomCombo_GetDroppedDown(Self:TCustomCombo):Boolean;
begin
  result := Self.DroppedDown;
end;
procedure TCustomCombo_PutDroppedDown(Self:TCustomCombo;const Value: Boolean);
begin
  Self.DroppedDown := Value;
end;
function TCustomCombo_GetSelLength(Self:TCustomCombo):Integer;
begin
  result := Self.SelLength;
end;
procedure TCustomCombo_PutSelLength(Self:TCustomCombo;const Value: Integer);
begin
  Self.SelLength := Value;
end;
function TCustomCombo_GetSelStart(Self:TCustomCombo):Integer;
begin
  result := Self.SelStart;
end;
procedure TCustomCombo_PutSelStart(Self:TCustomCombo;const Value: Integer);
begin
  Self.SelStart := Value;
end;
function TCustomComboBox_GetAutoComplete(Self:TCustomComboBox):Boolean;
begin
  result := Self.AutoComplete;
end;
procedure TCustomComboBox_PutAutoComplete(Self:TCustomComboBox;const Value: Boolean);
begin
  Self.AutoComplete := Value;
end;
function TCustomComboBox_GetAutoCloseUp(Self:TCustomComboBox):Boolean;
begin
  result := Self.AutoCloseUp;
end;
procedure TCustomComboBox_PutAutoCloseUp(Self:TCustomComboBox;const Value: Boolean);
begin
  Self.AutoCloseUp := Value;
end;
function TCustomComboBox_GetAutoDropDown(Self:TCustomComboBox):Boolean;
begin
  result := Self.AutoDropDown;
end;
procedure TCustomComboBox_PutAutoDropDown(Self:TCustomComboBox;const Value: Boolean);
begin
  Self.AutoDropDown := Value;
end;
function TCustomComboBox_GetCharCase(Self:TCustomComboBox):TEditCharCase;
begin
  result := Self.CharCase;
end;
procedure TCustomComboBox_PutCharCase(Self:TCustomComboBox;const Value: TEditCharCase);
begin
  Self.CharCase := Value;
end;
function TCustomComboBox_GetSelText(Self:TCustomComboBox):string;
begin
  result := Self.SelText;
end;
procedure TCustomComboBox_PutSelText(Self:TCustomComboBox;const Value: string);
begin
  Self.SelText := Value;
end;
function TCustomListBox_GetAutoComplete(Self:TCustomListBox):Boolean;
begin
  result := Self.AutoComplete;
end;
procedure TCustomListBox_PutAutoComplete(Self:TCustomListBox;const Value: Boolean);
begin
  Self.AutoComplete := Value;
end;
function TCustomListBox_GetCount(Self:TCustomListBox):Integer;
begin
  result := Self.Count;
end;
procedure TCustomListBox_PutCount(Self:TCustomListBox;const Value: Integer);
begin
  Self.Count := Value;
end;
function TCustomListBox_GetSelected(Self:TCustomListBox;Index: Integer):Boolean;
begin
  result := Self.Selected[Index];
end;
procedure TCustomListBox_PutSelected(Self:TCustomListBox;Index: Integer;const Value: Boolean);
begin
  Self.Selected[Index] := Value;
end;
function TCustomListBox_GetScrollWidth(Self:TCustomListBox):Integer;
begin
  result := Self.ScrollWidth;
end;
procedure TCustomListBox_PutScrollWidth(Self:TCustomListBox;const Value: Integer);
begin
  Self.ScrollWidth := Value;
end;
function TCustomListBox_GetTopIndex(Self:TCustomListBox):Integer;
begin
  result := Self.TopIndex;
end;
procedure TCustomListBox_PutTopIndex(Self:TCustomListBox;const Value: Integer);
begin
  Self.TopIndex := Value;
end;
procedure Register_StdCtrls;
var G, H: Integer;
begin
  H := RegisterNamespace(0, 'StdCtrls');
  // Begin of class TCustomGroupBox
  G := RegisterClassType(H, TCustomGroupBox);
  RegisterHeader(G, 
       'constructor Create(AOwner: TComponent); override;',
       @TCustomGroupBox.Create);
  // End of class TCustomGroupBox
  // Begin of class TGroupBox
  G := RegisterClassType(H, TGroupBox);
  RegisterHeader(G,
       'constructor Create(AOwner: TComponent); override;',
       @TGroupBox.Create);
  // End of class TGroupBox
  RegisterRTTIType(H, TypeInfo(TTextLayout));
  // Begin of class TCustomLabel
  G := RegisterClassType(H, TCustomLabel);
  RegisterHeader(G, 
       'constructor Create(AOwner: TComponent); override;',
       @TCustomLabel.Create);
  // End of class TCustomLabel
  // Begin of class TLabel
  G := RegisterClassType(H, TLabel);
  RegisterHeader(G,
       'constructor Create(AOwner: TComponent); override;',
       @TLabel.Create);
  // End of class TLabel
  RegisterRTTIType(H, TypeInfo(TEditCharCase));
  // Begin of class TCustomEdit
  G := RegisterClassType(H, TCustomEdit);
  RegisterHeader(G, 
       'constructor Create(AOwner: TComponent); override;',
       @TCustomEdit.Create);
  RegisterHeader(G, 
       'procedure Clear; virtual;',
       @TCustomEdit.Clear);
  RegisterHeader(G, 
       'procedure ClearSelection;',
       @TCustomEdit.ClearSelection);
  RegisterHeader(G, 
       'procedure CopyToClipboard;',
       @TCustomEdit.CopyToClipboard);
  RegisterHeader(G, 
       'procedure CutToClipboard;',
       @TCustomEdit.CutToClipboard);
  RegisterHeader(G, 
       'procedure DefaultHandler(var Message); override;',
       @TCustomEdit.DefaultHandler);
  RegisterHeader(G, 
       'procedure PasteFromClipboard;',
       @TCustomEdit.PasteFromClipboard);
  RegisterHeader(G, 
       'procedure Undo;',
       @TCustomEdit.Undo);
  RegisterHeader(G, 
       'procedure ClearUndo;',
       @TCustomEdit.ClearUndo);
  RegisterHeader(G, 
       'function GetSelTextBuf(Buffer: PChar; BufSize: Integer): Integer; virtual;',
       @TCustomEdit.GetSelTextBuf);
  RegisterHeader(G, 
       'procedure SelectAll;',
       @TCustomEdit.SelectAll);
  RegisterHeader(G, 
       'procedure SetSelTextBuf(Buffer: PChar);',
       @TCustomEdit.SetSelTextBuf);
  RegisterFakeHeader(G,
       'function TCustomEdit_GetCanUndo:Boolean;',
       @TCustomEdit_GetCanUndo);
  RegisterProperty(G,
       'property CanUndo:Boolean read TCustomEdit_GetCanUndo;');
  RegisterFakeHeader(G,
       'function TCustomEdit_GetModified:Boolean;',
       @TCustomEdit_GetModified);
  RegisterFakeHeader(G,
       'procedure TCustomEdit_PutModified(const Value: Boolean);',
       @TCustomEdit_PutModified);
  RegisterProperty(G,
       'property Modified:Boolean read TCustomEdit_GetModified write TCustomEdit_PutModified;');
  RegisterFakeHeader(G,
       'function TCustomEdit_GetSelLength:Integer;',
       @TCustomEdit_GetSelLength);
  RegisterFakeHeader(G,
       'procedure TCustomEdit_PutSelLength(const Value: Integer);',
       @TCustomEdit_PutSelLength);
  RegisterProperty(G,
       'property SelLength:Integer read TCustomEdit_GetSelLength write TCustomEdit_PutSelLength;');
  RegisterFakeHeader(G,
       'function TCustomEdit_GetSelStart:Integer;',
       @TCustomEdit_GetSelStart);
  RegisterFakeHeader(G,
       'procedure TCustomEdit_PutSelStart(const Value: Integer);',
       @TCustomEdit_PutSelStart);
  RegisterProperty(G,
       'property SelStart:Integer read TCustomEdit_GetSelStart write TCustomEdit_PutSelStart;');
  RegisterFakeHeader(G,
       'function TCustomEdit_GetSelText:string;',
       @TCustomEdit_GetSelText);
  RegisterFakeHeader(G,
       'procedure TCustomEdit_PutSelText(const Value: string);',
       @TCustomEdit_PutSelText);
  RegisterProperty(G,
       'property SelText:string read TCustomEdit_GetSelText write TCustomEdit_PutSelText;');
  // End of class TCustomEdit
  // Begin of class TEdit
  G := RegisterClassType(H, TEdit);
  RegisterHeader(G,
       'constructor Create(AOwner: TComponent); override;',
       @TEdit.Create);
  // End of class TEdit
  RegisterRTTIType(H, TypeInfo(TScrollStyle));
  // Begin of class TCustomMemo
  G := RegisterClassType(H, TCustomMemo);
  RegisterHeader(G, 
       'constructor Create(AOwner: TComponent); override;',
       @TCustomMemo.Create);
  RegisterHeader(G, 
       'destructor Destroy; override;',
       @TCustomMemo.Destroy);
  RegisterFakeHeader(G,
       'function TCustomMemo_GetCaretPos:TPoint;',
       @TCustomMemo_GetCaretPos);
  RegisterFakeHeader(G,
       'procedure TCustomMemo_PutCaretPos(const Value: TPoint);',
       @TCustomMemo_PutCaretPos);
  RegisterProperty(G,
       'property CaretPos:TPoint read TCustomMemo_GetCaretPos write TCustomMemo_PutCaretPos;');
  // End of class TCustomMemo
  // Begin of class TMemo
  G := RegisterClassType(H, TMemo);
  RegisterHeader(G,
       'constructor Create(AOwner: TComponent); override;',
       @TMemo.Create);
  // End of class TMemo
  // Begin of class TCustomCombo
  G := RegisterClassType(H, TCustomCombo);
  // End of class TCustomCombo
  // Begin of class TCustomComboBoxStrings
  G := RegisterClassType(H, TCustomComboBoxStrings);
  RegisterHeader(G, 
       'procedure Clear; override;',
       @TCustomComboBoxStrings.Clear);
  RegisterHeader(G, 
       'procedure Delete(Index: Integer); override;',
       @TCustomComboBoxStrings.Delete);
  RegisterHeader(G, 
       'function IndexOf(const S: string): Integer; override;',
       @TCustomComboBoxStrings.IndexOf);
  RegisterHeader(G,
       'constructor Create(AOwner: TComponent); virtual;',
       @TCustomComboBoxStrings.Create);
  // End of class TCustomComboBoxStrings
  RegisterClassReferenceType(H, 'TCustomComboBoxStringsClass');
  // Begin of class TCustomCombo
  G := RegisterClassType(H, TCustomCombo);
  RegisterHeader(G, 
       'constructor Create(AOwner: TComponent); override;',
       @TCustomCombo.Create);
  RegisterHeader(G, 
       'destructor Destroy; override;',
       @TCustomCombo.Destroy);
  RegisterHeader(G, 
       'procedure AddItem(Item: String; AObject: TObject); override;',
       @TCustomCombo.AddItem);
  RegisterHeader(G, 
       'procedure Clear; override;',
       @TCustomCombo.Clear);
  RegisterHeader(G, 
       'procedure ClearSelection; override;',
       @TCustomCombo.ClearSelection);
  RegisterHeader(G, 
       'procedure CopySelection(Destination: TCustomListControl); override;',
       @TCustomCombo.CopySelection);
  RegisterHeader(G, 
       'procedure DeleteSelected; override;',
       @TCustomCombo.DeleteSelected);
  RegisterHeader(G, 
       'function Focused: Boolean; override;',
       @TCustomCombo.Focused);
  RegisterHeader(G, 
       'procedure SelectAll; override;',
       @TCustomCombo.SelectAll);
  RegisterFakeHeader(G,
       'function TCustomCombo_GetDroppedDown:Boolean;',
       @TCustomCombo_GetDroppedDown);
  RegisterFakeHeader(G,
       'procedure TCustomCombo_PutDroppedDown(const Value: Boolean);',
       @TCustomCombo_PutDroppedDown);
  RegisterProperty(G,
       'property DroppedDown:Boolean read TCustomCombo_GetDroppedDown write TCustomCombo_PutDroppedDown;');
  RegisterFakeHeader(G,
       'function TCustomCombo_GetSelLength:Integer;',
       @TCustomCombo_GetSelLength);
  RegisterFakeHeader(G,
       'procedure TCustomCombo_PutSelLength(const Value: Integer);',
       @TCustomCombo_PutSelLength);
  RegisterProperty(G,
       'property SelLength:Integer read TCustomCombo_GetSelLength write TCustomCombo_PutSelLength;');
  RegisterFakeHeader(G,
       'function TCustomCombo_GetSelStart:Integer;',
       @TCustomCombo_GetSelStart);
  RegisterFakeHeader(G,
       'procedure TCustomCombo_PutSelStart(const Value: Integer);',
       @TCustomCombo_PutSelStart);
  RegisterProperty(G,
       'property SelStart:Integer read TCustomCombo_GetSelStart write TCustomCombo_PutSelStart;');
  // End of class TCustomCombo
  RegisterRTTIType(H, TypeInfo(TComboBoxStyle));
  // Begin of class TCustomComboBox
  G := RegisterClassType(H, TCustomComboBox);
  RegisterHeader(G,
       'constructor Create(AOwner: TComponent); override;',
       @TCustomComboBox.Create);
  RegisterHeader(G,
       'destructor Destroy; override;',
       @TCustomComboBox.Destroy);
  RegisterFakeHeader(G,
       'function TCustomComboBox_GetAutoComplete:Boolean;',
       @TCustomComboBox_GetAutoComplete);
  RegisterFakeHeader(G,
       'procedure TCustomComboBox_PutAutoComplete(const Value: Boolean);',
       @TCustomComboBox_PutAutoComplete);
  RegisterProperty(G,
       'property AutoComplete:Boolean read TCustomComboBox_GetAutoComplete write TCustomComboBox_PutAutoComplete;');
  RegisterFakeHeader(G,
       'function TCustomComboBox_GetAutoCloseUp:Boolean;',
       @TCustomComboBox_GetAutoCloseUp);
  RegisterFakeHeader(G,
       'procedure TCustomComboBox_PutAutoCloseUp(const Value: Boolean);',
       @TCustomComboBox_PutAutoCloseUp);
  RegisterProperty(G,
       'property AutoCloseUp:Boolean read TCustomComboBox_GetAutoCloseUp write TCustomComboBox_PutAutoCloseUp;');
  RegisterFakeHeader(G,
       'function TCustomComboBox_GetAutoDropDown:Boolean;',
       @TCustomComboBox_GetAutoDropDown);
  RegisterFakeHeader(G,
       'procedure TCustomComboBox_PutAutoDropDown(const Value: Boolean);',
       @TCustomComboBox_PutAutoDropDown);
  RegisterProperty(G,
       'property AutoDropDown:Boolean read TCustomComboBox_GetAutoDropDown write TCustomComboBox_PutAutoDropDown;');
  RegisterFakeHeader(G,
       'function TCustomComboBox_GetCharCase:TEditCharCase;',
       @TCustomComboBox_GetCharCase);
  RegisterFakeHeader(G,
       'procedure TCustomComboBox_PutCharCase(const Value: TEditCharCase);',
       @TCustomComboBox_PutCharCase);
  RegisterProperty(G,
       'property CharCase:TEditCharCase read TCustomComboBox_GetCharCase write TCustomComboBox_PutCharCase;');
  RegisterFakeHeader(G,
       'function TCustomComboBox_GetSelText:string;',
       @TCustomComboBox_GetSelText);
  RegisterFakeHeader(G,
       'procedure TCustomComboBox_PutSelText(const Value: string);',
       @TCustomComboBox_PutSelText);
  RegisterProperty(G,
       'property SelText:string read TCustomComboBox_GetSelText write TCustomComboBox_PutSelText;');
  // End of class TCustomComboBox
  // Begin of class TComboBox
  G := RegisterClassType(H, TComboBox);
  RegisterHeader(G,
       'constructor Create(AOwner: TComponent); override;',
       @TComboBox.Create);
  // End of class TComboBox
  // Begin of class TButtonControl
  G := RegisterClassType(H, TButtonControl);
  // End of class TButtonControl
  // Begin of class TButtonActionLink
  G := RegisterClassType(H, TButtonActionLink);
  RegisterHeader(G,
       'constructor Create(AOwner: TComponent); virtual;',
       @TButtonActionLink.Create);
  // End of class TButtonActionLink
  RegisterClassReferenceType(H, 'TButtonActionLinkClass');
  // Begin of class TButtonControl
  G := RegisterClassType(H, TButtonControl);
  RegisterHeader(G, 
       'constructor Create(AOwner: TComponent); override;',
       @TButtonControl.Create);
  // End of class TButtonControl
  // Begin of class TButton
  G := RegisterClassType(H, TButton);
  RegisterHeader(G, 
       'constructor Create(AOwner: TComponent); override;',
       @TButton.Create);
  RegisterHeader(G, 
       'procedure Click; override;',
       @TButton.Click);
  RegisterHeader(G, 
       'function UseRightToLeftAlignment: Boolean; override;',
       @TButton.UseRightToLeftAlignment);
  // End of class TButton
  RegisterRTTIType(H, TypeInfo(TCheckBoxState));
  // Begin of class TCustomCheckBox
  G := RegisterClassType(H, TCustomCheckBox);
  RegisterHeader(G, 
       'constructor Create(AOwner: TComponent); override;',
       @TCustomCheckBox.Create);
  // End of class TCustomCheckBox
  // Begin of class TCheckBox
  G := RegisterClassType(H, TCheckBox);
  RegisterHeader(G,
       'constructor Create(AOwner: TComponent); override;',
       @TCheckBox.Create);
  // End of class TCheckBox
  // Begin of class TRadioButton
  G := RegisterClassType(H, TRadioButton);
  RegisterHeader(G, 
       'constructor Create(AOwner: TComponent); override;',
       @TRadioButton.Create);
  // End of class TRadioButton
  RegisterRTTIType(H, TypeInfo(TListBoxStyle));
  // Begin of class TCustomListBox
  G := RegisterClassType(H, TCustomListBox);
  RegisterHeader(G, 
       'constructor Create(AOwner: TComponent); override;',
       @TCustomListBox.Create);
  RegisterHeader(G, 
       'destructor Destroy; override;',
       @TCustomListBox.Destroy);
  RegisterHeader(G, 
       'procedure AddItem(Item: String; AObject: TObject); override;',
       @TCustomListBox.AddItem);
  RegisterHeader(G, 
       'procedure Clear; override;',
       @TCustomListBox.Clear);
  RegisterHeader(G, 
       'procedure ClearSelection; override;',
       @TCustomListBox.ClearSelection);
  RegisterHeader(G, 
       'procedure CopySelection(Destination: TCustomListControl); override;',
       @TCustomListBox.CopySelection);
  RegisterHeader(G, 
       'procedure DeleteSelected; override;',
       @TCustomListBox.DeleteSelected);
  RegisterHeader(G, 
       'function ItemAtPos(Pos: TPoint; Existing: Boolean): Integer;',
       @TCustomListBox.ItemAtPos);
  RegisterHeader(G, 
       'function ItemRect(Index: Integer): TRect;',
       @TCustomListBox.ItemRect);
  RegisterHeader(G, 
       'procedure SelectAll; override;',
       @TCustomListBox.SelectAll);
  RegisterFakeHeader(G,
       'function TCustomListBox_GetAutoComplete:Boolean;',
       @TCustomListBox_GetAutoComplete);
  RegisterFakeHeader(G,
       'procedure TCustomListBox_PutAutoComplete(const Value: Boolean);',
       @TCustomListBox_PutAutoComplete);
  RegisterProperty(G,
       'property AutoComplete:Boolean read TCustomListBox_GetAutoComplete write TCustomListBox_PutAutoComplete;');
  RegisterFakeHeader(G,
       'function TCustomListBox_GetCount:Integer;',
       @TCustomListBox_GetCount);
  RegisterFakeHeader(G,
       'procedure TCustomListBox_PutCount(const Value: Integer);',
       @TCustomListBox_PutCount);
  RegisterProperty(G,
       'property Count:Integer read TCustomListBox_GetCount write TCustomListBox_PutCount;');
  RegisterFakeHeader(G,
       'function TCustomListBox_GetSelected(Index: Integer):Boolean;',
       @TCustomListBox_GetSelected);
  RegisterFakeHeader(G,
       'procedure TCustomListBox_PutSelected(Index: Integer;const Value: Boolean);',
       @TCustomListBox_PutSelected);
  RegisterProperty(G,
       'property Selected[Index: Integer]:Boolean read TCustomListBox_GetSelected write TCustomListBox_PutSelected;');
  RegisterFakeHeader(G,
       'function TCustomListBox_GetScrollWidth:Integer;',
       @TCustomListBox_GetScrollWidth);
  RegisterFakeHeader(G,
       'procedure TCustomListBox_PutScrollWidth(const Value: Integer);',
       @TCustomListBox_PutScrollWidth);
  RegisterProperty(G,
       'property ScrollWidth:Integer read TCustomListBox_GetScrollWidth write TCustomListBox_PutScrollWidth;');
  RegisterFakeHeader(G,
       'function TCustomListBox_GetTopIndex:Integer;',
       @TCustomListBox_GetTopIndex);
  RegisterFakeHeader(G,
       'procedure TCustomListBox_PutTopIndex(const Value: Integer);',
       @TCustomListBox_PutTopIndex);
  RegisterProperty(G,
       'property TopIndex:Integer read TCustomListBox_GetTopIndex write TCustomListBox_PutTopIndex;');
  // End of class TCustomListBox
  // Begin of class TListBox
  G := RegisterClassType(H, TListBox);
  RegisterHeader(G,
       'constructor Create(AOwner: TComponent); override;',
       @TListBox.Create);
  // End of class TListBox
  RegisterRTTIType(H, TypeInfo(TScrollCode));
  // Begin of class TScrollBar
  G := RegisterClassType(H, TScrollBar);
  RegisterHeader(G,
       'constructor Create(AOwner: TComponent); override;',
       @TScrollBar.Create);
  RegisterHeader(G,
       'procedure SetParams(APosition, AMin, AMax: Integer);',
       @TScrollBar.SetParams);
  // End of class TScrollBar
  RegisterRTTIType(H, TypeInfo(TStaticBorderStyle));
  // Begin of class TCustomStaticText
  G := RegisterClassType(H, TCustomStaticText);
  RegisterHeader(G, 
       'constructor Create(AOwner: TComponent); override;',
       @TCustomStaticText.Create);
  // End of class TCustomStaticText
  // Begin of class TStaticText
  G := RegisterClassType(H, TStaticText);
  RegisterHeader(G,
       'constructor Create(AOwner: TComponent); override;',
       @TStaticText.Create);
  // End of class TStaticText

  G := RegisterClassType(H, TMemoStrings);
  RegisterHeader(G, 'procedure Clear; override;', @TMemoStrings_Clear);

  G := RegisterClassType(H, TListBoxStrings);
  RegisterHeader(G, 'procedure Clear; override;', @TListBoxStrings_Clear);

end;
end.
