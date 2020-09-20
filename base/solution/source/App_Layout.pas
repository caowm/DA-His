
unit App_Layout;

interface

uses
  Classes,
  SysUtils,
  Graphics,
  Controls,
  Forms,
  Windows,
  Messages,
  Variants,
  Contnrs,
  IniFiles,
  ImgList,
  Menus,
  ExtCtrls,
  StdCtrls;

const
  cLayoutBorderWidth = 16;
  cLayoutRowGap = 4;
  cLayoutColGap = 5;
  cLayoutDefaultHeight = 32;
  cLayoutDefaultWidth = 192;

type

  TLayoutItem = class(TPersistent)
  private
    FStartCol, FStartRow, FEndCol, FEndRow: Integer;
    FLeft, FTop, FWidth, FHeight: Integer;
    FControl: TControl;
    FColor: TColor;
  public
    constructor Create(AControl: TControl; AStartCol, AStartRow, AEndCol,
      AEndRow: Integer; AColor: TColor = clDefault);
    property Control: TControl read FControl;
    property StartCol: Integer read FStartCol;
    property StartRow: Integer read FStartRow;
    property EndCol: Integer read FEndCol;
    property EndRow: Integer read FEndRow;
    property Left: Integer read FLeft write FLeft;
    property Top: Integer read FTop write FTop;
    property Width: Integer read FWidth write FWidth;
    property Height: Integer read FHeight write FHeight;
    property Color: TColor read FColor write FColor;
  end;

  TTableLayout = class(TCustomControl)
  private
    FRowCount, FColCount: Integer;
    FColSetting: array of Integer; // 每一列的设置
    FRowSetting: array of Integer; // 每一行的设置
    FColWidth: array of Integer; // 存放每一列的实际宽度
    FRowHeight: array of Integer; // 存放每一行的实际高度
    FColGap, FRowGap: Integer;
    FBorderWidth: Integer;
    FItems: TObjectList;
    FUpdateCount: Integer;

    procedure WMSize(var Message: TWMSize); message WM_SIZE;
  protected
    procedure CalcLayout();
    procedure SetItem(AItem: TLayoutItem);
    procedure Paint(); override;
  public
    constructor Create(AOwner: TComponent; ABorderWidth: Integer = cLayoutBorderWidth;
      AColGap: Integer = cLayoutColGap; ARowGap: Integer = cLayoutRowGap); reintroduce;
    destructor Destroy(); override;
    procedure SetLayout(ACols, ARows: Integer; AColWidth, ARowHeight: array of Integer);
    procedure AddRow(ARowHeight: Integer);
    procedure AddCol(AColWidth: Integer);
    procedure SetColWidth(ACol: Integer; AWidth: Integer);
    procedure SetRowHeight(ARow: Integer; AHeight: Integer);
    procedure AddControl(AControl: TControl; AStartCol, AStartRow, AEndCol,
      AEndRow: Integer; AColor: TColor = clDefault);
    procedure RemoveControl(AControl: TControl);
    procedure BeginUpdate();
    procedure EndUpdate();
    procedure UpdateLayout(); virtual;
    property BorderWidth: Integer read FBorderWidth write FBorderWidth;
    property ColGap: Integer read FColGap write FColGap;
    property RowGap: Integer read FRowGap write FRowGap;
    property Color;
  end;

function RandomColor(): TColor;

implementation

function RandomColor(): TColor;
begin
  Result := (Random(256) shl 16) or (Random(256) shl 8) or Random(256)
end;

{ TLayoutItem }

constructor TLayoutItem.Create(AControl: TControl; AStartCol, AStartRow,
  AEndCol, AEndRow: Integer; AColor: TColor = clDefault);
begin
  FControl := AControl;
  FStartCol := AStartCol;
  FStartRow := AStartRow;
  FEndCol := AEndCol;
  FEndRow := AEndRow;
  FColor := AColor;
end;

{ TTableLayout }

procedure TTableLayout.AddCol(AColWidth: Integer);
begin
  Inc(FColCount);
  SetLength(FColSetting, FColCount);
  SetLength(FColWidth, FColCount);
  FColSetting[FColCount - 1] := AColWidth;
  UpdateLayout;
end;

procedure TTableLayout.AddControl(AControl: TControl; AStartCol, AStartRow,
  AEndCol, AEndRow: Integer; AColor: TColor = clDefault);
var
  Item: TLayoutItem;
begin
  Item := TLayoutItem.Create(AControl, AStartCol, AStartRow, AEndCol, AEndRow, AColor);
  FItems.Add(Item);
  if AControl is TWinControl then
    TWinControl(AControl).TabOrder := FItems.Count - 1;
  if FUpdateCount = 0 then SetItem(Item);
end;

procedure TTableLayout.AddRow(ARowHeight: Integer);
begin
  Inc(FRowCount);
  SetLength(FRowSetting, FRowCount);
  SetLength(FRowHeight, FRowCount);
  FRowSetting[FRowCount - 1] := ARowHeight;
  UpdateLayout;
end;

procedure TTableLayout.BeginUpdate;
begin
  Inc(FUpdateCount);
end;

procedure TTableLayout.CalcLayout;
var
  I: Integer;
  Remain: Integer;
begin
  Remain := Width - 2 * FBorderWidth;
  for I := 0 to Length(FColSetting) - 1 do
    if FColSetting[I] >= 0 then
    begin
      if FColSetting[I] = 0 then
        FColWidth[I] := cLayoutDefaultWidth
      else
        FColWidth[I] := FColSetting[I];
      Remain := Remain - FColWidth[I];
    end;

  for I := 0 to Length(FColSetting) - 1 do
    if FColSetting[I] < 0 then
    begin
      if Remain < 0 then Remain := 0;
      FColWidth[I] := Remain * Abs(FColSetting[I]) div 100;
      //Remain := Remain - FColWidth[I];
    end;

  Remain := Height - 2 * FBorderWidth;
  for I := 0 to Length(FRowSetting) - 1 do
    if FRowSetting[I] >= 0 then
    begin
      if FRowSetting[I] = 0 then
        FRowHeight[I] := cLayoutDefaultHeight
      else
        FRowHeight[I] := FRowSetting[I];
      Remain := Remain - FRowHeight[I];
    end;

  for I := 0 to Length(FRowSetting) - 1 do
    if FRowSetting[I] < 0 then
    begin
      if Remain < 0 then Remain := 0;
      FRowHeight[I] := Remain * Abs(FRowSetting[I]) div 100;
      //Remain := Remain - FRowHeight[I];
    end; 
end;

constructor TTableLayout.Create(AOwner: TComponent;
  ABorderWidth: Integer = cLayoutBorderWidth;
  AColGap: Integer = cLayoutColGap; ARowGap: Integer = cLayoutRowGap);
begin
  inherited Create(AOwner);
  SetBounds(0, 0, 200, 200);
  FBorderWidth := ABorderWidth;
  FColGap := AColGap;
  FRowGap := ARowGap;
  FRowCount := 0;
  FColCount := 0;
  FItems := TObjectList.Create(True);
end;

destructor TTableLayout.Destroy;
begin
  FItems.Free;
  inherited;
end;

procedure TTableLayout.EndUpdate;
begin
  Dec(FUpdateCount);
  if (FUpdateCount = 0) then UpdateLayout;
end;

procedure TTableLayout.Paint();
var
  I: Integer;
  R: TRect;
begin
  inherited;
  Canvas.Brush.Color := Color;
  Canvas.FillRect(Rect(0, 0, Width, Height));
  for I := 0 to FItems.Count - 1 do
  begin
    with TLayoutItem(FItems[I]) do
    begin
      if Color <> clDefault then
      begin
        R := Rect(Left - 2, Top - 2,
          Left + Width + 3, Top + Height + 3);
        Canvas.Brush.Color := Color;
        Canvas.FillRect(R);
      end;
    end;
  end;
end;

procedure TTableLayout.RemoveControl(AControl: TControl);
var
  I: Integer;
begin
  for I := 0 to FItems.Count - 1 do
    if (TLayoutItem(FItems[I]).Control = AControl) then
    begin
      FItems.Delete(I);
      if AControl <> nil then
        AControl.Parent := Parent;
      Break;
    end;
end;

procedure TTableLayout.SetColWidth(ACol, AWidth: Integer);
begin
  FColSetting[ACol] := AWidth;
  UpdateLayout;
end;

procedure TTableLayout.SetItem(AItem: TLayoutItem);

  function CalcLeft(): Integer;
  var
    I: Integer;
  begin
    Result := FBorderWidth;
    for I := 0 to AItem.StartCol - 1 do
      Result := Result + FColWidth[I];
    Inc(Result, FColGap);
  end;

  function CalcTop(): Integer;
  var
    I: Integer;
  begin
    Result := FBorderWidth;
    for I := 0 to AItem.StartRow - 1 do
      Result := Result + FRowHeight[I];
    Inc(Result, FRowGap);
  end;

  function CalcWidth(): Integer;
  var
    I: Integer;
  begin
    Result := 0;
    for I := AItem.StartCol to AItem.EndCol do
      Result := Result + FColWidth[I];
    Result := Result - 2 * FColGap;
  end;

  function CalcHeight(): Integer;
  var
    I: Integer;
  begin
    Result := 0;
    for I := AItem.StartRow to AItem.EndRow do
      Result := Result + FRowHeight[I];
    Result := Result - 2 * FRowGap;
  end;

begin
  AItem.Left := CalcLeft;
  AItem.Top := CalcTop;
  AItem.Width := CalcWidth;
  AItem.Height := CalcHeight;
  if AItem.Control = nil then Exit;
  AItem.Control.Align := alNone;
  AItem.Control.SetBounds(AItem.Left, AItem.Top, AItem.Width, AItem.Height);
  AItem.Control.Parent := Self;
end;

procedure TTableLayout.SetLayout(ACols, ARows: Integer; AColWidth, ARowHeight: array of Integer);
var
  I: Integer;
begin
  FColCount := ACols;
  FRowCount := ARows;
  SetLength(FColWidth, ACols);
  SetLength(FRowHeight, ARows);
  SetLength(FColSetting, ACols);
  SetLength(FRowSetting, ARows);

  for I := 0 to ACols - 1 do
    if Length(AColWidth) = 0 then
      FColSetting[I] := -100 div ACols
    else if Length(AColWidth) = 1 then
      FColSetting[I] := AColWidth[0]
    else
      FColSetting[I] := AColWidth[I];
  for I := 0 to ARows - 1 do
    if Length(ARowHeight) = 0 then
      FRowSetting[I] := -100 div ARows
    else if Length(ARowHeight) = 1 then
      FRowSetting[I] := ARowHeight[0]
    else
      FRowSetting[I] := ARowHeight[I];
  UpdateLayout;
end;

procedure TTableLayout.SetRowHeight(ARow, AHeight: Integer);
begin
  FRowSetting[ARow] := AHeight;
  UpdateLayout;
end;

procedure TTableLayout.UpdateLayout;
var
  I: Integer;
begin
  if FUpdateCount > 0 then Exit;
  CalcLayout;
  for I := 0 to FItems.Count - 1 do
    SetItem(TLayoutItem(FItems[I]));
end;

procedure TTableLayout.WMSize(var Message: TWMSize);
begin
  inherited;
  UpdateLayout;
end;

end.

