unit IMPORT_cxGraphics;
interface
uses
  Types,
  Windows,
  Classes,
  SysUtils,
  Controls,
  Graphics,
  Menus,
  CommCtrl,
  ComCtrls,
  ImgList,
  dxCore,
  dxMessages,
  cxClasses,
  cxGraphics,
  cxImageList,
  Variants,
  PaxCompiler,
  PaxRegister;
procedure RegisterIMPORT_cxGraphics;
implementation
function TcxRegion_IsEqual7(Self: TcxRegion;ARegion: TcxRegion): Boolean; 
begin
  result := Self.IsEqual(AREGION);
end;
procedure TcxRegion_Offset10(Self: TcxRegion;DX, DY: Integer); 
begin
  Self.Offset(DX,DY);
end;
function TcxRegion_PtInRegion12(Self: TcxRegion;X, Y: Integer): Boolean; 
begin
  result := Self.PtInRegion(X,Y);
end;
function TcxRegion_RectInRegion14(Self: TcxRegion;ALeft, ATop, ARight, ABottom: Integer): Boolean; 
begin
  result := Self.RectInRegion(ALEFT,ATOP,ARIGHT,ABOTTOM);
end;
function TcxRegion_GetBoundsRect(Self:TcxRegion):TRect;
begin
  result := Self.BoundsRect;
end;
function TcxRegion_GetHandle(Self:TcxRegion):TcxRegionHandle;
begin
  result := Self.Handle;
end;
procedure TcxRegion_PutHandle(Self:TcxRegion;const Value: TcxRegionHandle);
begin
  Self.Handle := Value;
end;
function TcxRegion_GetIsEmpty(Self:TcxRegion):Boolean;
begin
  result := Self.IsEmpty;
end;
procedure TcxCanvas_Rectangle23(Self: TcxCanvas;X1, Y1, X2, Y2: Integer); 
begin
  Self.Rectangle(X1,Y1,X2,Y2);
end;
function TcxCanvas_GetBrush(Self:TcxCanvas):TBrush;
begin
  result := Self.Brush;
end;
procedure TcxCanvas_PutBrush(Self:TcxCanvas;const Value: TBrush);
begin
  Self.Brush := Value;
end;
function TcxCanvas_GetCanvas(Self:TcxCanvas):TCanvas;
begin
  result := Self.Canvas;
end;
procedure TcxCanvas_PutCanvas(Self:TcxCanvas;const Value: TCanvas);
begin
  Self.Canvas := Value;
end;
function TcxCanvas_GetCopyMode(Self:TcxCanvas):TCopyMode;
begin
  result := Self.CopyMode;
end;
procedure TcxCanvas_PutCopyMode(Self:TcxCanvas;const Value: TCopyMode);
begin
  Self.CopyMode := Value;
end;
function TcxCanvas_GetDCOrigin(Self:TcxCanvas):TPoint;
begin
  result := Self.DCOrigin;
end;
function TcxCanvas_GetFont(Self:TcxCanvas):TFont;
begin
  result := Self.Font;
end;
procedure TcxCanvas_PutFont(Self:TcxCanvas;const Value: TFont);
begin
  Self.Font := Value;
end;
function TcxCanvas_GetHandle(Self:TcxCanvas):HDC;
begin
  result := Self.Handle;
end;
function TcxCanvas_GetPen(Self:TcxCanvas):TPen;
begin
  result := Self.Pen;
end;
procedure TcxCanvas_PutPen(Self:TcxCanvas;const Value: TPen);
begin
  Self.Pen := Value;
end;
procedure TcxCanvas_PutPixels(Self:TcxCanvas;X, Y: Integer;const Value: TColor);
begin
  Self.Pixels[X, Y] := Value;
end;
function TcxCanvas_GetViewportOrg(Self:TcxCanvas):TPoint;
begin
  result := Self.ViewportOrg;
end;
procedure TcxCanvas_PutViewportOrg(Self:TcxCanvas;const Value: TPoint);
begin
  Self.ViewportOrg := Value;
end;
function TcxCanvas_GetWindowOrg(Self:TcxCanvas):TPoint;
begin
  result := Self.WindowOrg;
end;
procedure TcxCanvas_PutWindowOrg(Self:TcxCanvas;const Value: TPoint);
begin
  Self.WindowOrg := Value;
end;
function TcxBitmap_GetCompressData(Self:TcxBitmap):Boolean;
begin
  result := Self.CompressData;
end;
procedure TcxBitmap_PutCompressData(Self:TcxBitmap;const Value: Boolean);
begin
  Self.CompressData := Value;
end;
function TcxBitmap_GetClientRect(Self:TcxBitmap):TRect;
begin
  result := Self.ClientRect;
end;
function TcxBitmap_GetcxCanvas(Self:TcxBitmap):TcxCanvas;
begin
  result := Self.cxCanvas;
end;
function TcxBitmap32_GetIsAlphaUsed(Self:TcxBitmap32):Boolean;
begin
  result := Self.IsAlphaUsed;
end;
procedure TcxAlphaBitmap_RefreshImage40(Self: TcxAlphaBitmap;AWidth, AHeight: Integer); 
begin
  Self.RefreshImage(AWIDTH,AHEIGHT);
end;
function TcxImageInfo_GetImage(Self:TcxImageInfo):TGraphic;
begin
  result := Self.Image;
end;
procedure TcxImageInfo_PutImage(Self:TcxImageInfo;const Value: TBitmap);
begin
  Self.Image := Value;
end;
function TcxImageInfo_GetMask(Self:TcxImageInfo):TBitmap;
begin
  result := Self.Mask;
end;
procedure TcxImageInfo_PutMask(Self:TcxImageInfo;const Value: TBitmap);
begin
  Self.Mask := Value;
end;
function TcxImageInfo_GetMaskColor(Self:TcxImageInfo):TColor;
begin
  result := Self.MaskColor;
end;
procedure TcxImageInfo_PutMaskColor(Self:TcxImageInfo;const Value: TColor);
begin
  Self.MaskColor := Value;
end;
function TcxImageList_GetAlphaBlending(Self:TcxImageList):Boolean;
begin
  result := Self.AlphaBlending;
end;
procedure TcxImageList_PutAlphaBlending(Self:TcxImageList;const Value: Boolean);
begin
  Self.AlphaBlending := Value;
end;
function TcxImageList_GetHandle(Self:TcxImageList):HImageList;
begin
  result := Self.Handle;
end;
procedure TcxImageList_PutHandle(Self:TcxImageList;const Value: HImageList);
begin
  Self.Handle := Value;
end;
function TcxImageCollectionItem_GetClientRect(Self:TcxImageCollectionItem):TRect;
begin
  result := Self.ClientRect;
end;
function TcxImageCollectionItem_GetHeight(Self:TcxImageCollectionItem):Integer;
begin
  result := Self.Height;
end;
function TcxImageCollectionItem_GetWidth(Self:TcxImageCollectionItem):Integer;
begin
  result := Self.Width;
end;
function TcxImageCollectionItems_GetItems(Self:TcxImageCollectionItems;Index: Integer):TcxImageCollectionItem;
begin
  result := Self.Items[Index];
end;
procedure TcxImageCollectionItems_PutItems(Self:TcxImageCollectionItems;Index: Integer;const Value: TcxImageCollectionItem);
begin
  Self.Items[Index] := Value;
end;
function TcxImageCollection_GetCount(Self:TcxImageCollection):Integer;
begin
  result := Self.Count;
end;
procedure RegisterIMPORT_cxGraphics;
var G, H: Integer;
begin
  H := RegisterNamespace(0, 'cxGraphics');
  RegisterConstant(H, 'dxMeasurePattern', 'Zq');
  RegisterConstant(H, 'cxAlignLeft', 1);
  RegisterConstant(H, 'cxAlignRight', 2);
  RegisterConstant(H, 'cxAlignHCenter', 4);
  RegisterConstant(H, 'cxAlignTop', 8);
  RegisterConstant(H, 'cxAlignBottom', 16);
  RegisterConstant(H, 'cxAlignVCenter', 32);
  RegisterConstant(H, 'cxAlignCenter', 36);
  RegisterConstant(H, 'cxSingleLine', 64);
  RegisterConstant(H, 'cxDontClip', 128);
  RegisterConstant(H, 'cxExpandTabs', 256);
  RegisterConstant(H, 'cxShowPrefix', 512);
  RegisterConstant(H, 'cxWordBreak', 1024);
  RegisterConstant(H, 'cxShowEndEllipsis', 2048);
  RegisterConstant(H, 'cxCalcRect', 4096);
  RegisterConstant(H, 'cxShowPathEllipsis', 8192);
  RegisterConstant(H, 'cxDontBreakChars', 16384);
  RegisterConstant(H, 'cxNoFullWidthCharBreak', 32768);
  RegisterConstant(H, 'clcxLightGray', $CFCFCF);
  RegisterConstant(H, 'cxDesignSelectionWidth', 2);
  RegisterConstant(H, 'cxDefaultAlphaValue', 200);
  // Begin of interface IcxFontListener
  G := RegisterInterfaceType(H, 'IcxFontListener',IcxFontListener,'IUnknown',IUnknown);
  RegisterHeader(G, 
       'procedure Changed(Sender: TObject; AFont: TFont);',
       nil, -1);
  // End of interface IcxFontListener
  RegisterRTTIType(H, TypeInfo(TcxBorder));
  RegisterRTTIType(H, TypeInfo(TcxBorders));
  RegisterTypeAlias(H, 'TBrushHandle:HBRUSH');
  RegisterRTTIType(H, TypeInfo(TcxColorPart));
  RegisterRTTIType(H, TypeInfo(TcxGridLines));
  // Begin of interface IcxPaintControlsHelper
  G := RegisterInterfaceType(H, 'IcxPaintControlsHelper',IcxPaintControlsHelper,'IUnknown',IUnknown);
  RegisterHeader(G, 
       'function AllowDrawEdgesAndBorders: Boolean;',
       nil, -1);
  // End of interface IcxPaintControlsHelper
  // Begin of interface IcxImageCollectionListener
  G := RegisterInterfaceType(H, 'IcxImageCollectionListener',IcxImageCollectionListener,'IUnknown',IUnknown);
  RegisterHeader(G, 
       'procedure ImageCollectionChanged;',
       nil, -1);
  RegisterHeader(G, 
       'procedure ImageCollectionDestroyed;',
       nil, -2);
  // End of interface IcxImageCollectionListener
  RegisterTypeAlias(H, 'TcxRegionHandle:HRGN');
  RegisterRTTIType(H, TypeInfo(TcxRegionOperation));
  // Begin of class TcxRegion
  G := RegisterClassType(H, TcxRegion);
  RegisterHeader(G, 
       'destructor Destroy; override;',
       @TcxRegion.Destroy);
  RegisterHeader(G, 
       'procedure Combine(ARegion: TcxRegion; AOperation: TcxRegionOperation;      ADestroyRegion: Boolean = True);',
       @TcxRegion.Combine);
  RegisterHeader(G, 
       'function IsEqual(ARegion: TcxRegion): Boolean; overload;',
       @TcxRegion_IsEqual7);
  RegisterHeader(G, 'procedure Offset(DX, DY: Integer); overload;', @TcxRegion_Offset10);
  RegisterHeader(G, 
       'function PtInRegion(X, Y: Integer): Boolean; overload;',
       @TcxRegion_PtInRegion12);
  RegisterHeader(G, 
       'function RectInRegion(ALeft, ATop, ARight, ABottom: Integer): Boolean; overload;',
       @TcxRegion_RectInRegion14);
  RegisterHeader(G, 
       'function TcxRegion_GetBoundsRect:TRect;',
       @TcxRegion_GetBoundsRect);
  RegisterProperty(G, 
       'property BoundsRect:TRect read TcxRegion_GetBoundsRect;');
  RegisterHeader(G, 
       'function TcxRegion_GetHandle:TcxRegionHandle;',
       @TcxRegion_GetHandle);
  RegisterHeader(G, 
       'procedure TcxRegion_PutHandle(const Value: TcxRegionHandle);',
       @TcxRegion_PutHandle);
  RegisterProperty(G, 
       'property Handle:TcxRegionHandle read TcxRegion_GetHandle write TcxRegion_PutHandle;');
  RegisterHeader(G, 
       'function TcxRegion_GetIsEmpty:Boolean;',
       @TcxRegion_GetIsEmpty);
  RegisterProperty(G, 
       'property IsEmpty:Boolean read TcxRegion_GetIsEmpty;');
  RegisterHeader(G,
       'constructor Create;',
       @TcxRegion.Create);
  // End of class TcxRegion
  RegisterRTTIType(H, TypeInfo(TcxRotationAngle));
  // Begin of class TcxCanvas
  G := RegisterClassType(H, TcxCanvas);
  RegisterHeader(G, 
       'constructor Create(ACanvas: TCanvas); virtual;',
       @TcxCanvas.Create);
  RegisterHeader(G, 
       'destructor Destroy; override;',
       @TcxCanvas.Destroy);
  RegisterHeader(G, 
       'procedure AlignMultiLineTextRectVertically(var R: TRect; const AText: string;      AAlignmentVert: TcxAlignmentVert; AWordBreak, AShowPrefix: Boolean;      AEnabled: Boolean = True; ADontBreakChars: Boolean = False; AEndEllipsis: Boolean = False);',
       @TcxCanvas.AlignMultiLineTextRectVertically);
  RegisterHeader(G, 
       'procedure CopyRect(const Dest: TRect; ACanvas: TCanvas; const Source: TRect);',
       @TcxCanvas.CopyRect);
  RegisterHeader(G, 
       'procedure Draw(X, Y: Integer; Graphic: TGraphic);',
       @TcxCanvas.Draw);
  RegisterHeader(G, 
       'procedure DrawFocusRect(const R: TRect);',
       @TcxCanvas.DrawFocusRect);
  RegisterHeader(G, 
       'procedure DrawFocusRectEx(const R: TRect; ABorders: TcxBorders; AExclude: Boolean = False);',
       @TcxCanvas.DrawFocusRectEx);
  RegisterHeader(G, 
       'procedure DrawImage(Images: TCustomImageList; X, Y, Index: Integer;      Enabled: Boolean = True);',
       @TcxCanvas.DrawImage);
  RegisterHeader(G, 
       'procedure DrawDesignSelection(ARect: TRect; AWidth: Integer = cxDesignSelectionWidth);',
       @TcxCanvas.DrawDesignSelection);
  RegisterHeader(G, 
       'procedure FlipHorizontally(ABitmap: TBitmap);',
       @TcxCanvas.FlipHorizontally);
  RegisterHeader(G, 
       'function FontHeight(AFont: TFont): Integer;',
       @TcxCanvas.FontHeight);
  RegisterHeader(G, 
       'procedure InvertFrame(const R: TRect; ABorderSize: Integer);',
       @TcxCanvas.InvertFrame);
  RegisterHeader(G, 
       'procedure InvertRect(const R: TRect);',
       @TcxCanvas.InvertRect);
  RegisterHeader(G, 
       'procedure LineTo(X, Y: Integer);',
       @TcxCanvas.LineTo);
  RegisterHeader(G, 
       'procedure MoveTo(X, Y: Integer);',
       @TcxCanvas.MoveTo);
  RegisterHeader(G, 
       'procedure Polygon(const Points: array of TPoint);',
       @TcxCanvas.Polygon);
  RegisterHeader(G, 
       'procedure Polyline(const Points: array of TPoint);',
       @TcxCanvas.Polyline);
  RegisterHeader(G, 'procedure Rectangle(X1, Y1, X2, Y2: Integer); overload;', @TcxCanvas_Rectangle23);
  RegisterHeader(G, 
       'procedure RotateBitmap(ABitmap: TBitmap; ARotationAngle: TcxRotationAngle;      AFlipVertically: Boolean = False);',
       @TcxCanvas.RotateBitmap);
  RegisterHeader(G, 
       'function TextHeight(const Text: string): Integer;',
       @TcxCanvas.TextHeight);
  RegisterHeader(G, 
       'function TextWidth(const Text: string): Integer;',
       @TcxCanvas.TextWidth);
  RegisterHeader(G, 
       'procedure TransparentDraw(X, Y: Integer; ABitmap: TBitmap; AAlpha: Byte;      ABackground: TBitmap = nil);',
       @TcxCanvas.TransparentDraw);
  RegisterHeader(G, 
       'procedure RestoreDC;',
       @TcxCanvas.RestoreDC);
  RegisterHeader(G, 
       'procedure SaveDC;',
       @TcxCanvas.SaveDC);
  RegisterHeader(G, 
       'procedure RestoreClipRegion;',
       @TcxCanvas.RestoreClipRegion);
  RegisterHeader(G, 
       'procedure SaveClipRegion;',
       @TcxCanvas.SaveClipRegion);
  RegisterHeader(G, 
       'procedure RestoreState;',
       @TcxCanvas.RestoreState);
  RegisterHeader(G, 
       'procedure SaveState;',
       @TcxCanvas.SaveState);
  RegisterHeader(G, 
       'procedure GetParams(var AParams: TcxViewParams);',
       @TcxCanvas.GetParams);
  RegisterHeader(G, 
       'procedure SetParams(const AParams: TcxViewParams);',
       @TcxCanvas.SetParams);
  RegisterHeader(G, 
       'procedure SetBrushColor(Value: TColor);',
       @TcxCanvas.SetBrushColor);
  RegisterHeader(G, 
       'procedure SetFontAngle(Value: Integer);',
       @TcxCanvas.SetFontAngle);
  RegisterHeader(G, 
       'procedure GetTextStringsBounds(Text: string; R: TRect; Flags: Integer;      Enabled: Boolean; var ABounds: TRectArray);',
       @TcxCanvas.GetTextStringsBounds);
  RegisterHeader(G, 
       'procedure BeginPath;',
       @TcxCanvas.BeginPath);
  RegisterHeader(G, 
       'procedure EndPath;',
       @TcxCanvas.EndPath);
  RegisterHeader(G, 
       'function PathToRegion(AConsiderOrigin: Boolean = True): TcxRegion;',
       @TcxCanvas.PathToRegion);
  RegisterHeader(G, 
       'procedure WidenPath;',
       @TcxCanvas.WidenPath);
  RegisterHeader(G, 
       'procedure ExcludeClipRect(const R: TRect);',
       @TcxCanvas.ExcludeClipRect);
  RegisterHeader(G, 
       'procedure IntersectClipRect(const R: TRect);',
       @TcxCanvas.IntersectClipRect);
  RegisterHeader(G, 
       'function GetClipRegion(AConsiderOrigin: Boolean = True): TcxRegion;',
       @TcxCanvas.GetClipRegion);
  RegisterHeader(G, 
       'procedure SetClipRegion(ARegion: TcxRegion; AOperation: TcxRegionOperation;      ADestroyRegion: Boolean = True; AConsiderOrigin: Boolean = True);',
       @TcxCanvas.SetClipRegion);
  RegisterHeader(G, 
       'function RectFullyVisible(const R: TRect): Boolean;',
       @TcxCanvas.RectFullyVisible);
  RegisterHeader(G, 
       'function RectVisible(const R: TRect): Boolean;',
       @TcxCanvas.RectVisible);
  RegisterHeader(G, 
       'function TcxCanvas_GetBrush:TBrush;',
       @TcxCanvas_GetBrush);
  RegisterHeader(G, 
       'procedure TcxCanvas_PutBrush(const Value: TBrush);',
       @TcxCanvas_PutBrush);
  RegisterProperty(G, 
       'property Brush:TBrush read TcxCanvas_GetBrush write TcxCanvas_PutBrush;');
  RegisterHeader(G, 
       'function TcxCanvas_GetCanvas:TCanvas;',
       @TcxCanvas_GetCanvas);
  RegisterHeader(G, 
       'procedure TcxCanvas_PutCanvas(const Value: TCanvas);',
       @TcxCanvas_PutCanvas);
  RegisterProperty(G, 
       'property Canvas:TCanvas read TcxCanvas_GetCanvas write TcxCanvas_PutCanvas;');
  RegisterHeader(G, 
       'function TcxCanvas_GetCopyMode:TCopyMode;',
       @TcxCanvas_GetCopyMode);
  RegisterHeader(G, 
       'procedure TcxCanvas_PutCopyMode(const Value: TCopyMode);',
       @TcxCanvas_PutCopyMode);
  RegisterProperty(G, 
       'property CopyMode:TCopyMode read TcxCanvas_GetCopyMode write TcxCanvas_PutCopyMode;');
  RegisterHeader(G, 
       'function TcxCanvas_GetDCOrigin:TPoint;',
       @TcxCanvas_GetDCOrigin);
  RegisterProperty(G, 
       'property DCOrigin:TPoint read TcxCanvas_GetDCOrigin;');
  RegisterHeader(G, 
       'function TcxCanvas_GetFont:TFont;',
       @TcxCanvas_GetFont);
  RegisterHeader(G, 
       'procedure TcxCanvas_PutFont(const Value: TFont);',
       @TcxCanvas_PutFont);
  RegisterProperty(G, 
       'property Font:TFont read TcxCanvas_GetFont write TcxCanvas_PutFont;');
  RegisterHeader(G, 
       'function TcxCanvas_GetHandle:HDC;',
       @TcxCanvas_GetHandle);
  RegisterProperty(G, 
       'property Handle:HDC read TcxCanvas_GetHandle;');
  RegisterHeader(G, 
       'function TcxCanvas_GetPen:TPen;',
       @TcxCanvas_GetPen);
  RegisterHeader(G, 
       'procedure TcxCanvas_PutPen(const Value: TPen);',
       @TcxCanvas_PutPen);
  RegisterProperty(G, 
       'property Pen:TPen read TcxCanvas_GetPen write TcxCanvas_PutPen;');
  RegisterHeader(G, 
       'procedure TcxCanvas_PutPixels(X, Y: Integer;const Value: TColor);',
       @TcxCanvas_PutPixels);
  RegisterProperty(G, 
       'property Pixels[X, Y: Integer]:TColor write TcxCanvas_PutPixels;');
  RegisterHeader(G, 
       'function TcxCanvas_GetViewportOrg:TPoint;',
       @TcxCanvas_GetViewportOrg);
  RegisterHeader(G, 
       'procedure TcxCanvas_PutViewportOrg(const Value: TPoint);',
       @TcxCanvas_PutViewportOrg);
  RegisterProperty(G, 
       'property ViewportOrg:TPoint read TcxCanvas_GetViewportOrg write TcxCanvas_PutViewportOrg;');
  RegisterHeader(G, 
       'function TcxCanvas_GetWindowOrg:TPoint;',
       @TcxCanvas_GetWindowOrg);
  RegisterHeader(G, 
       'procedure TcxCanvas_PutWindowOrg(const Value: TPoint);',
       @TcxCanvas_PutWindowOrg);
  RegisterProperty(G, 
       'property WindowOrg:TPoint read TcxCanvas_GetWindowOrg write TcxCanvas_PutWindowOrg;');
  // End of class TcxCanvas
  // Begin of class TcxScreenCanvas
  G := RegisterClassType(H, TcxScreenCanvas);
  RegisterHeader(G, 
       'constructor Create; reintroduce; virtual;',
       @TcxScreenCanvas.Create);
  RegisterHeader(G, 
       'destructor Destroy; override;',
       @TcxScreenCanvas.Destroy);
  RegisterHeader(G, 
       'procedure Dormant;',
       @TcxScreenCanvas.Dormant);
  // End of class TcxScreenCanvas
  // Begin of class TcxPaintCanvas
  G := RegisterClassType(H, TcxPaintCanvas);
  RegisterHeader(G, 
       'constructor Create; reintroduce;',
       @TcxPaintCanvas.Create);
  RegisterHeader(G, 
       'destructor Destroy; override;',
       @TcxPaintCanvas.Destroy);
  RegisterHeader(G, 
       'procedure EndPaint;',
       @TcxPaintCanvas.EndPaint);
  // End of class TcxPaintCanvas
  // Begin of class TcxBitmap
  G := RegisterClassType(H, TcxBitmap);
  RegisterHeader(G, 
       'destructor Destroy; override;',
       @TcxBitmap.Destroy);
  RegisterHeader(G, 
       'procedure BeginUpdate;',
       @TcxBitmap.BeginUpdate);
  RegisterHeader(G, 
       'procedure CancelUpdate;',
       @TcxBitmap.CancelUpdate);
  RegisterHeader(G, 
       'procedure EndUpdate(AForceUpdate: Boolean = True);',
       @TcxBitmap.EndUpdate);
  RegisterHeader(G, 
       'procedure Rotate(ARotationAngle: TcxRotationAngle; AFlipVertically: Boolean = False);',
       @TcxBitmap.Rotate);
  RegisterHeader(G, 
       'function TcxBitmap_GetCompressData:Boolean;',
       @TcxBitmap_GetCompressData);
  RegisterHeader(G, 
       'procedure TcxBitmap_PutCompressData(const Value: Boolean);',
       @TcxBitmap_PutCompressData);
  RegisterProperty(G, 
       'property CompressData:Boolean read TcxBitmap_GetCompressData write TcxBitmap_PutCompressData;');
  RegisterHeader(G, 
       'function TcxBitmap_GetClientRect:TRect;',
       @TcxBitmap_GetClientRect);
  RegisterProperty(G, 
       'property ClientRect:TRect read TcxBitmap_GetClientRect;');
  RegisterHeader(G, 
       'function TcxBitmap_GetcxCanvas:TcxCanvas;',
       @TcxBitmap_GetcxCanvas);
  RegisterProperty(G, 
       'property cxCanvas:TcxCanvas read TcxBitmap_GetcxCanvas;');
  RegisterHeader(G,
       'constructor Create(AOwner: TComponent); virtual;',
       @TcxBitmap.Create);
  // End of class TcxBitmap
  RegisterRTTIType(H, TypeInfo(TcxImageDrawMode));
  RegisterRTTIType(H, TypeInfo(TcxBitmapTransformationMode));
  // Begin of class TcxBitmap32
  G := RegisterClassType(H, TcxBitmap32);
  RegisterHeader(G, 
       'procedure GetBitmapColors(out AColors: TRGBColors);',
       @TcxBitmap32.GetBitmapColors);
  RegisterHeader(G, 
       'procedure SetBitmapColors(const AColors: TRGBColors);',
       @TcxBitmap32.SetBitmapColors);
  RegisterHeader(G, 
       'procedure AlphaBlend(ADestBitmap: TcxBitmap32; const ARect: TRect; ASmoothImage: Boolean; AConstantAlpha: Byte = $FF);',
       @TcxBitmap32.AlphaBlend);
  RegisterHeader(G, 
       'procedure Clear; virtual;',
       @TcxBitmap32.Clear);
  RegisterHeader(G, 
       'procedure Darken(APercent: Byte);',
       @TcxBitmap32.Darken);
  RegisterHeader(G, 
       'procedure Filter(AMaskBitmap: TcxBitmap32);',
       @TcxBitmap32.Filter);
  RegisterHeader(G, 
       'procedure Invert;',
       @TcxBitmap32.Invert);
  RegisterHeader(G, 
       'procedure Lighten(APercent: Byte);',
       @TcxBitmap32.Lighten);
  RegisterHeader(G, 
       'procedure LoadFromStream(Stream: TStream); override;',
       @TcxBitmap32.LoadFromStream);
  RegisterHeader(G, 
       'procedure MakeOpaque;',
       @TcxBitmap32.MakeOpaque);
  RegisterHeader(G, 
       'procedure RecoverTransparency(ATransparentColor: TColor);',
       @TcxBitmap32.RecoverTransparency);
  RegisterHeader(G, 
       'procedure SetAlphaChannel(Alpha: Byte);',
       @TcxBitmap32.SetAlphaChannel);
  RegisterHeader(G, 
       'function TcxBitmap32_GetIsAlphaUsed:Boolean;',
       @TcxBitmap32_GetIsAlphaUsed);
  RegisterProperty(G, 
       'property IsAlphaUsed:Boolean read TcxBitmap32_GetIsAlphaUsed;');
  RegisterHeader(G,
       'constructor Create(AOwner: TComponent); virtual;',
       @TcxBitmap32.Create);
  // End of class TcxBitmap32
  // Begin of class TcxColorList
  G := RegisterClassType(H, TcxColorList);
  RegisterHeader(G, 
       'function Add(AColor: TColor): Integer;',
       @TcxColorList.Add);
  RegisterHeader(G,
       'constructor Create(AOwner: TComponent); virtual;',
       @TcxColorList.Create);
  // End of class TcxColorList
  // Begin of class TcxAlphaBitmap
  G := RegisterClassType(H, TcxAlphaBitmap);
  RegisterHeader(G, 
       'destructor Destroy; override;',
       @TcxAlphaBitmap.Destroy);
  RegisterHeader(G, 
       'procedure Clear; override;',
       @TcxAlphaBitmap.Clear);
  RegisterHeader(G, 
       'procedure DrawShadow(AMaskBitmap: TcxAlphaBitmap; AShadowSize: Integer; AShadowColor: TColor; AInflateSize: Boolean = False);',
       @TcxAlphaBitmap.DrawShadow);
  RegisterHeader(G, 
       'procedure RecoverAlphaChannel(ATransparentColor: TColor);',
       @TcxAlphaBitmap.RecoverAlphaChannel);
  RegisterHeader(G, 
       'procedure Shade(AMaskBitmap: TcxAlphaBitmap);',
       @TcxAlphaBitmap.Shade);
  RegisterHeader(G, 
       'procedure TransformBitmap(AMode: TcxBitmapTransformationMode);',
       @TcxAlphaBitmap.TransformBitmap);
  RegisterHeader(G, 'procedure RefreshImage(AWidth, AHeight: Integer); overload;', @TcxAlphaBitmap_RefreshImage40);
  RegisterHeader(G,
       'constructor Create(AOwner: TComponent); virtual;',
       @TcxAlphaBitmap.Create);
  // End of class TcxAlphaBitmap
  // Begin of class TcxImageInfo
  G := RegisterClassType(H, TcxImageInfo);
  RegisterHeader(G, 
       'constructor Create;',
       @TcxImageInfo.Create);
  RegisterHeader(G, 
       'destructor Destroy; override;',
       @TcxImageInfo.Destroy);
  RegisterHeader(G, 
       'procedure Assign(Source: TPersistent); override;',
       @TcxImageInfo.Assign);
  RegisterHeader(G, 
       'function TcxImageInfo_GetImage:TBitmap;',
       @TcxImageInfo_GetImage);
  RegisterHeader(G, 
       'procedure TcxImageInfo_PutImage(const Value: TBitmap);',
       @TcxImageInfo_PutImage);
  RegisterProperty(G, 
       'property Image:TBitmap read TcxImageInfo_GetImage write TcxImageInfo_PutImage;');
  RegisterHeader(G, 
       'function TcxImageInfo_GetMask:TBitmap;',
       @TcxImageInfo_GetMask);
  RegisterHeader(G, 
       'procedure TcxImageInfo_PutMask(const Value: TBitmap);',
       @TcxImageInfo_PutMask);
  RegisterProperty(G, 
       'property Mask:TBitmap read TcxImageInfo_GetMask write TcxImageInfo_PutMask;');
  RegisterHeader(G, 
       'function TcxImageInfo_GetMaskColor:TColor;',
       @TcxImageInfo_GetMaskColor);
  RegisterHeader(G, 
       'procedure TcxImageInfo_PutMaskColor(const Value: TColor);',
       @TcxImageInfo_PutMaskColor);
  RegisterProperty(G, 
       'property MaskColor:TColor read TcxImageInfo_GetMaskColor write TcxImageInfo_PutMaskColor;');
  // End of class TcxImageInfo
  // Begin of class TcxImageList
  G := RegisterClassType(H, TcxImageList);
  RegisterHeader(G, 
       'destructor Destroy; override;',
       @TcxImageList.Destroy);
  RegisterHeader(G, 
       'procedure Assign(Source: TPersistent); override;',
       @TcxImageList.Assign);
  RegisterHeader(G, 
       'function Add(AImage, AMask: TBitmap): Integer;',
       @TcxImageList.Add);
  RegisterHeader(G, 
       'function AddIcon(AIcon: TIcon): Integer;',
       @TcxImageList.AddIcon);
  RegisterHeader(G, 
       'function AddMasked(AImage: TBitmap; AMaskColor: TColor): Integer;',
       @TcxImageList.AddMasked);
  RegisterHeader(G, 
       'procedure Move(ACurIndex, ANewIndex: Integer);',
       @TcxImageList.Move);
  RegisterHeader(G, 
       'procedure Delete(AIndex: Integer);',
       @TcxImageList.Delete);
  RegisterHeader(G, 
       'function AddBitmap(AImage, AMask: TBitmap; AMaskColor: TColor; AStretch, ASmooth: Boolean): Integer;',
       @TcxImageList.AddBitmap);
  RegisterHeader(G, 
       'function AddImage(AValue: TCustomImageList; AIndex: Integer): Integer;',
       @TcxImageList.AddImage);
  RegisterHeader(G, 
       'procedure AddImages(AImages: TCustomImageList);',
       @TcxImageList.AddImages);
  RegisterHeader(G, 
       'procedure CopyImages(AImages: TCustomImageList; AStartIndex: Integer = 0; AEndIndex: Integer = -1);',
       @TcxImageList.CopyImages);
  RegisterHeader(G, 
       'procedure Clear;',
       @TcxImageList.Clear);
  RegisterHeader(G, 
       'procedure Insert(AIndex: Integer; AImage, AMask: TBitmap);',
       @TcxImageList.Insert);
  RegisterHeader(G, 
       'procedure InsertIcon(AIndex: Integer; AIcon: TIcon);',
       @TcxImageList.InsertIcon);
  RegisterHeader(G, 
       'procedure InsertMasked(AIndex: Integer; AImage: TBitmap; AMaskColor: TColor);',
       @TcxImageList.InsertMasked);
  RegisterHeader(G, 
       'procedure Replace(AIndex: Integer; AImage, AMask: TBitmap);',
       @TcxImageList.Replace);
  RegisterHeader(G, 
       'procedure ReplaceIcon(AIndex: Integer; AIcon: TIcon);',
       @TcxImageList.ReplaceIcon);
  RegisterHeader(G, 
       'procedure ReplaceMasked(AIndex: Integer; AImage: TBitmap; AMaskColor: TColor);',
       @TcxImageList.ReplaceMasked);
  RegisterHeader(G, 
       'function FileLoad(AResType: TResType; const AName: string; AMaskColor: TColor): Boolean;',
       @TcxImageList.FileLoad);
  RegisterHeader(G, 
       'function GetResource(AResType: TResType; const AName: string;      AWidth: Integer; ALoadFlags: TLoadResources; AMaskColor: TColor): Boolean;',
       @TcxImageList.GetResource);
  RegisterHeader(G, 
       'function ResourceLoad(AResType: TResType; const AName: string;      AMaskColor: TColor): Boolean;',
       @TcxImageList.ResourceLoad);
  RegisterHeader(G, 
       'function ResInstLoad(AInstance: THandle; AResType: TResType;      const AName: string; AMaskColor: TColor): Boolean;',
       @TcxImageList.ResInstLoad);
  RegisterHeader(G, 
       'procedure BeginUpdate;',
       @TcxImageList.BeginUpdate);
  RegisterHeader(G, 
       'procedure CancelUpdate;',
       @TcxImageList.CancelUpdate);
  RegisterHeader(G, 
       'procedure EndUpdate;',
       @TcxImageList.EndUpdate);
  RegisterHeader(G, 
       'procedure GetImage(AIndex: Integer; AImage: TBitmap);',
       @TcxImageList.GetImage);
  RegisterHeader(G, 
       'procedure GetMask(AIndex: Integer; AMask: TBitmap);',
       @TcxImageList.GetMask);
  RegisterHeader(G, 
       'function GetPixelFormat(AHandle: HIMAGELIST): Integer;',
       @TcxImageList.GetPixelFormat);
  RegisterHeader(G, 
       'procedure SetSize(AWidth, AHeight: Integer);',
       @TcxImageList.SetSize);
  RegisterHeader(G, 
       'function TcxImageList_GetAlphaBlending:Boolean;',
       @TcxImageList_GetAlphaBlending);
  RegisterHeader(G, 
       'procedure TcxImageList_PutAlphaBlending(const Value: Boolean);',
       @TcxImageList_PutAlphaBlending);
  RegisterProperty(G, 
       'property AlphaBlending:Boolean read TcxImageList_GetAlphaBlending write TcxImageList_PutAlphaBlending;');
  RegisterHeader(G, 
       'function TcxImageList_GetHandle:HImageList;',
       @TcxImageList_GetHandle);
  RegisterHeader(G, 
       'procedure TcxImageList_PutHandle(const Value: HImageList);',
       @TcxImageList_PutHandle);
  RegisterProperty(G, 
       'property Handle:HImageList read TcxImageList_GetHandle write TcxImageList_PutHandle;');
  RegisterHeader(G,
       'constructor Create(AOwner: TComponent); virtual;',
       @TcxImageList.Create);
  // End of class TcxImageList
  // Begin of class TcxImageCollectionItem
  G := RegisterClassType(H, TcxImageCollectionItem);
  RegisterHeader(G, 
       'constructor Create(AOwner: TComponent); override;',
       @TcxImageCollectionItem.Create);
  RegisterHeader(G, 
       'destructor Destroy; override;',
       @TcxImageCollectionItem.Destroy);
  RegisterHeader(G, 
       'procedure Assign(Source: TPersistent); override;',
       @TcxImageCollectionItem.Assign);
  RegisterHeader(G, 
       'function TcxImageCollectionItem_GetClientRect:TRect;',
       @TcxImageCollectionItem_GetClientRect);
  RegisterProperty(G, 
       'property ClientRect:TRect read TcxImageCollectionItem_GetClientRect;');
  RegisterHeader(G, 
       'function TcxImageCollectionItem_GetHeight:Integer;',
       @TcxImageCollectionItem_GetHeight);
  RegisterProperty(G, 
       'property Height:Integer read TcxImageCollectionItem_GetHeight;');
  RegisterHeader(G, 
       'function TcxImageCollectionItem_GetWidth:Integer;',
       @TcxImageCollectionItem_GetWidth);
  RegisterProperty(G, 
       'property Width:Integer read TcxImageCollectionItem_GetWidth;');
  // End of class TcxImageCollectionItem
  // Begin of class TcxImageCollectionItems
  G := RegisterClassType(H, TcxImageCollectionItems);
  RegisterHeader(G, 
       'constructor Create(ACollection: TcxImageCollection); reintroduce;',
       @TcxImageCollectionItems.Create);
  RegisterHeader(G, 
       'function Add: TcxImageCollectionItem;',
       @TcxImageCollectionItems.Add);
  RegisterHeader(G, 
       'function FindItemByName(const AName: string; out AItem: TcxImageCollectionItem): Boolean;',
       @TcxImageCollectionItems.FindItemByName);
  RegisterHeader(G, 
       'function FindItemByID(ID: Integer): TcxImageCollectionItem;',
       @TcxImageCollectionItems.FindItemByID);
  RegisterHeader(G, 
       'function Insert(Index: Integer): TcxImageCollectionItem;',
       @TcxImageCollectionItems.Insert);
  RegisterHeader(G, 
       'function TcxImageCollectionItems_GetItems(Index: Integer):TcxImageCollectionItem;',
       @TcxImageCollectionItems_GetItems);
  RegisterHeader(G, 
       'procedure TcxImageCollectionItems_PutItems(Index: Integer;const Value: TcxImageCollectionItem);',
       @TcxImageCollectionItems_PutItems);
  RegisterProperty(G, 
       'property Items[Index: Integer]:TcxImageCollectionItem read TcxImageCollectionItems_GetItems write TcxImageCollectionItems_PutItems;default;');
  // End of class TcxImageCollectionItems
  // Begin of class TcxImageCollection
  G := RegisterClassType(H, TcxImageCollection);
  RegisterHeader(G, 
       'constructor Create(AOwner: TComponent); override;',
       @TcxImageCollection.Create);
  RegisterHeader(G, 
       'destructor Destroy; override;',
       @TcxImageCollection.Destroy);
  RegisterHeader(G, 
       'procedure AddListener(AListener: IcxImageCollectionListener);',
       @TcxImageCollection.AddListener);
  RegisterHeader(G, 
       'procedure RemoveListener(AListener: IcxImageCollectionListener);',
       @TcxImageCollection.RemoveListener);
  RegisterHeader(G, 
       'function TcxImageCollection_GetCount:Integer;',
       @TcxImageCollection_GetCount);
  RegisterProperty(G, 
       'property Count:Integer read TcxImageCollection_GetCount;');
  // End of class TcxImageCollection
  // Begin of class TcxBrushCache
  G := RegisterClassType(H, TcxBrushCache);
  RegisterHeader(G, 
       'destructor Destroy; override;',
       @TcxBrushCache.Destroy);
  RegisterHeader(G, 
       'procedure BeginUpdate;',
       @TcxBrushCache.BeginUpdate);
  RegisterHeader(G, 
       'procedure EndUpdate;',
       @TcxBrushCache.EndUpdate);
  RegisterHeader(G, 
       'procedure ReleaseBrush(var ABrush: TBrush);',
       @TcxBrushCache.ReleaseBrush);
  RegisterHeader(G, 
       'procedure SetBrushColor(var ABrush: TBrush; AColor: TColor);',
       @TcxBrushCache.SetBrushColor);
  RegisterHeader(G,
       'constructor Create;',
       @TcxBrushCache.Create);
  // End of class TcxBrushCache
end;
initialization
  RegisterIMPORT_cxGraphics;
end.
