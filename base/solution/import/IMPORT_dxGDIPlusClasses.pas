unit IMPORT_dxGDIPlusClasses;
interface
uses
  Windows,
  Classes,
  SysUtils,
  Graphics,
  ActiveX,
  Types,
  dxCore,
  cxGeometry,
  dxGDIPlusAPI,
  dxGDIPlusClasses,
  dxShapeBrushes,
  Variants,
  PaxCompiler,
  PaxRegister;
procedure RegisterIMPORT_dxGDIPlusClasses;
implementation
function TdxGPSolidBrush_GetColor(Self:TdxGPSolidBrush):DWORD;
begin
  result := Self.Color;
end;
procedure TdxGPSolidBrush_PutColor(Self:TdxGPSolidBrush;const Value: DWORD);
begin
  Self.Color := Value;
end;
//function TdxGPLinearGradientBrush_GetWrapMode(Self:TdxGPLinearGradientBrush):TdxGPWrapMode;
//begin
//  result := Self.WrapMode;
//end;
//procedure TdxGPLinearGradientBrush_PutWrapMode(Self:TdxGPLinearGradientBrush;const Value: TdxGPWrapMode);
//begin
//  Self.WrapMode := Value;
//end;
//function TdxGPPen_GetALignment(Self:TdxGPPen):TdxGPPenAlignment;
//begin
//  result := Self.ALignment;
//end;
//procedure TdxGPPen_PutALignment(Self:TdxGPPen;const Value: TdxGPPenAlignment);
//begin
//  Self.ALignment := Value;
//end;
function TdxGPPen_GetBrush(Self:TdxGPPen):TdxGPBrush;
begin
  result := Self.Brush;
end;
procedure TdxGPPen_PutBrush(Self:TdxGPPen;const Value: TdxGPBrush);
begin
  Self.Brush := Value;
end;
//function TdxGPPen_GetColor(Self:TdxGPPen):DWORD;
//begin
//  result := Self.Color;
//end;
//procedure TdxGPPen_PutColor(Self:TdxGPPen;const Value: DWORD);
//begin
//  Self.Color := Value;
//end;
function TdxGPPen_GetWidth(Self:TdxGPPen):Single;
begin
  result := Self.Width;
end;
procedure TdxGPPen_PutWidth(Self:TdxGPPen;const Value: Single);
begin
  Self.Width := Value;
end;
function TdxGPCanvas_GetHandle(Self:TdxGPCanvas):GpGraphics;
begin
  result := Self.Handle;
end;
function TdxGPCanvas_GetInterpolationMode(Self:TdxGPCanvas):TdxGPInterpolationMode;
begin
  result := Self.InterpolationMode;
end;
procedure TdxGPCanvas_PutInterpolationMode(Self:TdxGPCanvas;const Value: TdxGPInterpolationMode);
begin
  Self.InterpolationMode := Value;
end;
function TdxGPCanvas_GetSmoothingMode(Self:TdxGPCanvas):TdxGPSmoothingMode;
begin
  result := Self.SmoothingMode;
end;
procedure TdxGPCanvas_PutSmoothingMode(Self:TdxGPCanvas;const Value: TdxGPSmoothingMode);
begin
  Self.SmoothingMode := Value;
end;
//function TdxGPImageData_GetEmpty(Self:TdxGPImageData):Boolean;
//begin
//  result := Self.Empty;
//end;
function TdxGPImage_MakeComposition20(Self: TdxGPImage;AOverlayImage: TdxGPImage; AOverlayAlpha: Byte): TdxGPImage; 
begin
  result := Self.MakeComposition(AOVERLAYIMAGE,AOVERLAYALPHA);
end;
function TdxGPImage_MakeComposition21(Self: TdxGPImage;AOverlayImage: TdxGPImage; AOverlayAlpha, ASourceAlpha: Byte): TdxGPImage; 
begin
  result := Self.MakeComposition(AOVERLAYIMAGE,AOVERLAYALPHA,ASOURCEALPHA);
end;
procedure TdxGPImage_Resize22(Self: TdxGPImage;const AWidth, AHeight: Integer); 
begin
  Self.Resize(AWIDTH,AHEIGHT);
end;
function TdxGPImage_GetClientRect(Self:TdxGPImage):TRect;
begin
  result := Self.ClientRect;
end;
function TdxGPImage_GetHandle(Self:TdxGPImage):GpImage;
begin
  result := Self.Handle;
end;
procedure TdxGPImage_PutHandle(Self:TdxGPImage;const Value: GpImage);
begin
  Self.Handle := Value;
end;
function TdxGPImage_GetHandleAllocated(Self:TdxGPImage):Boolean;
begin
  result := Self.HandleAllocated;
end;
function TdxGPImage_GetImageDataFormat(Self:TdxGPImage):TdxImageDataFormat;
begin
  result := Self.ImageDataFormat;
end;
procedure TdxGPImage_PutImageDataFormat(Self:TdxGPImage;const Value: TdxImageDataFormat);
begin
  Self.ImageDataFormat := Value;
end;
function TdxGPImage_GetIsAlphaUsed(Self:TdxGPImage):Boolean;
begin
  result := Self.IsAlphaUsed;
end;
function TdxGPImage_GetSize(Self:TdxGPImage):TSize;
begin
  result := Self.Size;
end;
procedure RegisterIMPORT_dxGDIPlusClasses;
var G, H: Integer;
begin
  H := RegisterNamespace(0, 'dxGDIPlusClasses');
  RegisterRTTIType(H, TypeInfo(TdxImageDataFormat));
  RegisterRTTIType(H, TypeInfo(TdxGPInterpolationMode));
  RegisterRTTIType(H, TypeInfo(TdxGPSmoothingMode));
  // Begin of class TdxGPBrush
  G := RegisterClassType(H, TdxGPBrush);
  RegisterHeader(G, 
       'constructor Create;',
       @TdxGPBrush.Create);
  RegisterHeader(G, 
       'destructor Destroy; override;',
       @TdxGPBrush.Destroy);
//  RegisterHeader(G,
//       'function Clone: TdxGPBrush; virtual;',
//       @TdxGPBrush.Clone);
//  RegisterHeader(G,
//       'function GetType: BrushType;',
//       @TdxGPBrush.GetType);
//  RegisterHeader(G,
//       'function GetLastStatus: Status;',
//       @TdxGPBrush.GetLastStatus);
  // End of class TdxGPBrush
  // Begin of class TdxGPSolidBrush
  G := RegisterClassType(H, TdxGPSolidBrush);
  RegisterFakeHeader(G, 
       'function TdxGPSolidBrush_GetColor:DWORD;',
       @TdxGPSolidBrush_GetColor);
  RegisterFakeHeader(G, 
       'procedure TdxGPSolidBrush_PutColor(const Value: DWORD);',
       @TdxGPSolidBrush_PutColor);
  RegisterProperty(G, 
       'property Color:DWORD read TdxGPSolidBrush_GetColor write TdxGPSolidBrush_PutColor;');
  RegisterHeader(G,
       'constructor Create;',
       @TdxGPSolidBrush.Create);
  // End of class TdxGPSolidBrush
  // Begin of class TdxGPTextureBrush
  G := RegisterClassType(H, TdxGPTextureBrush);
  RegisterHeader(G,
       'constructor Create;',
       @TdxGPTextureBrush.Create);
  // End of class TdxGPTextureBrush
  // Begin of class TdxGPLinearGradientBrush
  G := RegisterClassType(H, TdxGPLinearGradientBrush);
//  RegisterHeader(G,
//       'function SetLinearColors(color1, color2: DWORD): TdxGPStatus;',
//       @TdxGPLinearGradientBrush.SetLinearColors);
//  RegisterHeader(G,
//       'function GetLinearColors(out color1, color2: DWORD): TdxGPStatus;',
//       @TdxGPLinearGradientBrush.GetLinearColors);
//  RegisterFakeHeader(G,
//       'function TdxGPLinearGradientBrush_GetWrapMode:TdxGPWrapMode;',
//       @TdxGPLinearGradientBrush_GetWrapMode);
//  RegisterFakeHeader(G,
//       'procedure TdxGPLinearGradientBrush_PutWrapMode(const Value: TdxGPWrapMode);',
//       @TdxGPLinearGradientBrush_PutWrapMode);
  RegisterProperty(G, 
       'property WrapMode:TdxGPWrapMode read TdxGPLinearGradientBrush_GetWrapMode write TdxGPLinearGradientBrush_PutWrapMode;');
  RegisterHeader(G,
       'constructor Create;',
       @TdxGPLinearGradientBrush.Create);
  // End of class TdxGPLinearGradientBrush
  // Begin of class TdxGPHatchBrush
  G := RegisterClassType(H, TdxGPHatchBrush);
//  RegisterHeader(G,
//       'function GetHatchStyle: TdxGPHatchStyle;',
//       @TdxGPHatchBrush.GetHatchStyle);
//  RegisterHeader(G,
//       'function GetForegroundColor: DWORD;',
//       @TdxGPHatchBrush.GetForegroundColor);
//  RegisterHeader(G,
//       'function GetBackgroundColor: DWORD;',
//       @TdxGPHatchBrush.GetBackgroundColor);
  RegisterHeader(G,
       'constructor Create;',
       @TdxGPHatchBrush.Create);
  // End of class TdxGPHatchBrush
  // Begin of class TdxGPPen
  G := RegisterClassType(H, TdxGPPen);
  RegisterHeader(G, 
       'destructor Destroy; override;',
       @TdxGPPen.Destroy);
//  RegisterHeader(G,
//       'function GetLastStatus: TdxGPStatus;',
//       @TdxGPPen.GetLastStatus);
//  RegisterHeader(G,
//       'function GetPenType: TdxGPPenType;',
//       @TdxGPPen.GetPenType);
//  RegisterFakeHeader(G,
//       'function TdxGPPen_GetALignment:TdxGPPenAlignment;',
//       @TdxGPPen_GetALignment);
//  RegisterFakeHeader(G,
//       'procedure TdxGPPen_PutALignment(const Value: TdxGPPenAlignment);',
//       @TdxGPPen_PutALignment);
  RegisterProperty(G, 
       'property ALignment:TdxGPPenAlignment read TdxGPPen_GetALignment write TdxGPPen_PutALignment;');
  RegisterFakeHeader(G, 
       'function TdxGPPen_GetBrush:TdxGPBrush;',
       @TdxGPPen_GetBrush);
  RegisterFakeHeader(G, 
       'procedure TdxGPPen_PutBrush(const Value: TdxGPBrush);',
       @TdxGPPen_PutBrush);
  RegisterProperty(G, 
       'property Brush:TdxGPBrush read TdxGPPen_GetBrush write TdxGPPen_PutBrush;');
//  RegisterFakeHeader(G,
//       'function TdxGPPen_GetColor:DWORD;',
//       @TdxGPPen_GetColor);
//  RegisterFakeHeader(G,
//       'procedure TdxGPPen_PutColor(const Value: DWORD);',
//       @TdxGPPen_PutColor);
  RegisterProperty(G, 
       'property Color:DWORD read TdxGPPen_GetColor write TdxGPPen_PutColor;');
  RegisterFakeHeader(G, 
       'function TdxGPPen_GetWidth:Single;',
       @TdxGPPen_GetWidth);
  RegisterFakeHeader(G, 
       'procedure TdxGPPen_PutWidth(const Value: Single);',
       @TdxGPPen_PutWidth);
  RegisterProperty(G, 
       'property Width:Single read TdxGPPen_GetWidth write TdxGPPen_PutWidth;');
  RegisterHeader(G,
       'constructor Create(AOwner: TComponent); virtual;',
       @TdxGPPen.Create);
  // End of class TdxGPPen
  // Begin of class TdxGPCanvas
  G := RegisterClassType(H, TdxGPCanvas);
  RegisterHeader(G, 
       'destructor Destroy; override;',
       @TdxGPCanvas.Destroy);
  RegisterHeader(G, 
       'function GetHDC: HDC;',
       @TdxGPCanvas.GetHDC);
  RegisterHeader(G, 
       'procedure ReleaseHDC(DC: HDC);',
       @TdxGPCanvas.ReleaseHDC);
  RegisterHeader(G, 
       'procedure Clear(AColor: TColor);',
       @TdxGPCanvas.Clear);
  RegisterHeader(G, 
       'procedure DrawBitmap(ABitmap: TBitmap; const R: TRect; AAlpha: Byte = 255);',
       @TdxGPCanvas.DrawBitmap);
  RegisterHeader(G, 
       'procedure RoundRect(const R: TRect; APenColor, ABrushColor: TColor; ARadiusX, ARadiusY: Integer;      APenWidth: Integer = 1; APenColorAlpha: Byte = 255; ABrushColorAlpha: Byte = 255);',
       @TdxGPCanvas.RoundRect);
  RegisterFakeHeader(G, 
       'function TdxGPCanvas_GetHandle:GpGraphics;',
       @TdxGPCanvas_GetHandle);
  RegisterProperty(G, 
       'property Handle:GpGraphics read TdxGPCanvas_GetHandle;');
  RegisterFakeHeader(G, 
       'function TdxGPCanvas_GetInterpolationMode:TdxGPInterpolationMode;',
       @TdxGPCanvas_GetInterpolationMode);
  RegisterFakeHeader(G, 
       'procedure TdxGPCanvas_PutInterpolationMode(const Value: TdxGPInterpolationMode);',
       @TdxGPCanvas_PutInterpolationMode);
  RegisterProperty(G, 
       'property InterpolationMode:TdxGPInterpolationMode read TdxGPCanvas_GetInterpolationMode write TdxGPCanvas_PutInterpolationMode;');
  RegisterFakeHeader(G, 
       'function TdxGPCanvas_GetSmoothingMode:TdxGPSmoothingMode;',
       @TdxGPCanvas_GetSmoothingMode);
  RegisterFakeHeader(G, 
       'procedure TdxGPCanvas_PutSmoothingMode(const Value: TdxGPSmoothingMode);',
       @TdxGPCanvas_PutSmoothingMode);
  RegisterProperty(G, 
       'property SmoothingMode:TdxGPSmoothingMode read TdxGPCanvas_GetSmoothingMode write TdxGPCanvas_PutSmoothingMode;');
  RegisterHeader(G,
       'constructor Create(AOwner: TComponent); virtual;',
       @TdxGPCanvas.Create);
  // End of class TdxGPCanvas
  // Begin of class TdxGPCustomPaintCanvas
  G := RegisterClassType(H, TdxGPCustomPaintCanvas);
  RegisterHeader(G, 
       'procedure EndPaint;',
       @TdxGPCustomPaintCanvas.EndPaint);
  RegisterHeader(G,
       'constructor Create(AOwner: TComponent); virtual;',
       @TdxGPCustomPaintCanvas.Create);
  // End of class TdxGPCustomPaintCanvas
  // Begin of class TdxGPPaintCanvas
  G := RegisterClassType(H, TdxGPPaintCanvas);
  RegisterHeader(G, 
       'destructor Destroy; override;',
       @TdxGPPaintCanvas.Destroy);
  RegisterHeader(G,
       'constructor Create(AOwner: TComponent); virtual;',
       @TdxGPPaintCanvas.Create);
  // End of class TdxGPPaintCanvas
  // Begin of class TdxGPMemoryStream
  G := RegisterClassType(H, TdxGPMemoryStream);
  RegisterHeader(G,
       'constructor Create(AOwner: TComponent); virtual;',
       @TdxGPMemoryStream.Create);
  // End of class TdxGPMemoryStream
  // Begin of class TdxGPStreamAdapter
  G := RegisterClassType(H, TdxGPStreamAdapter);
  RegisterHeader(G, 
       'function Stat(out StatStg: TStatStg; StatFlag: Integer): HRESULT; override; stdcall;',
       @TdxGPStreamAdapter.Stat);
  RegisterHeader(G,
       'constructor Create(AOwner: TComponent); virtual;',
       @TdxGPStreamAdapter.Create);
  // End of class TdxGPStreamAdapter
  // Begin of class TdxGPImageData
  G := RegisterClassType(H, TdxGPImageData);
  RegisterHeader(G, 
       'destructor Destroy; override;',
       @TdxGPImageData.Destroy);
  RegisterFakeHeader(G, 
       'function TdxGPImageData_GetEmpty:Boolean;',
       @TdxGPImageData_GetEmpty);
  RegisterProperty(G, 
       'property Empty:Boolean read TdxGPImageData_GetEmpty;');
  RegisterHeader(G,
       'constructor Create;',
       @TdxGPImageData.Create);
  // End of class TdxGPImageData
  // Begin of class TdxGPImage
  G := RegisterClassType(H, TdxGPImage);
  RegisterHeader(G, 
       'constructor Create; override;',
       @TdxGPImage.Create);
  RegisterHeader(G, 
       'constructor CreateFromBitmap(ABitmap: TBitmap); virtual;',
       @TdxGPImage.CreateFromBitmap);
  RegisterHeader(G, 
       'constructor CreateFromHBitmap(ABitmap: HBitmap); virtual;',
       @TdxGPImage.CreateFromHBitmap);
  RegisterHeader(G, 
       'constructor CreateFromBits(AWidth, AHeight: Integer;      const ABits: TRGBColors; AHasAlphaChannel: Boolean); virtual;',
       @TdxGPImage.CreateFromBits);
  RegisterHeader(G, 
       'constructor CreateFromStream(AStream: TStream); virtual;',
       @TdxGPImage.CreateFromStream);
  RegisterHeader(G, 
       'destructor Destroy; override;',
       @TdxGPImage.Destroy);
  RegisterHeader(G, 
       'procedure Assign(ASource: TPersistent); override;',
       @TdxGPImage.Assign);
  RegisterHeader(G, 
       'procedure LoadFromBits(AWidth, AHeight: Integer; const ABits: TRGBColors; AHasAlphaChannel: Boolean);',
       @TdxGPImage.LoadFromBits);
  RegisterHeader(G, 
       'procedure LoadFromClipboardFormat(AFormat: Word; AData: THandle; APalette: HPALETTE); override;',
       @TdxGPImage.LoadFromClipboardFormat);
  RegisterHeader(G, 
       'procedure LoadFromFieldValue(const AValue: Variant);',
       @TdxGPImage.LoadFromFieldValue);
  RegisterHeader(G, 
       'procedure LoadFromResource(AInstance: THandle; const AResName: string; AResType: PChar);',
       @TdxGPImage.LoadFromResource);
  RegisterHeader(G, 
       'procedure LoadFromStream(AStream: TStream); override;',
       @TdxGPImage.LoadFromStream);
  RegisterHeader(G, 
       'procedure SaveToClipboardFormat(var AFormat: Word; var AData: THandle; var APalette: HPALETTE); override;',
       @TdxGPImage.SaveToClipboardFormat);
  RegisterHeader(G, 
       'procedure SaveToStream(AStream: TStream); override;',
       @TdxGPImage.SaveToStream);
  RegisterHeader(G, 
       'procedure SaveToStreamByCodec(AStream: TStream; AImageFormat: TdxImageDataFormat);',
       @TdxGPImage.SaveToStreamByCodec);
  RegisterHeader(G, 
       'function Clone: TdxGPImage; virtual;',
       @TdxGPImage.Clone);
  RegisterHeader(G, 
       'procedure ChangeColor(AColor: TColor); virtual;',
       @TdxGPImage.ChangeColor);
  RegisterHeader(G, 
       'function Compare(AImage: TdxGPImage): Boolean; virtual;',
       @TdxGPImage.Compare);
  RegisterHeader(G, 
       'procedure ConvertToBitmap;',
       @TdxGPImage.ConvertToBitmap);
  RegisterHeader(G, 
       'procedure Clear; virtual;',
       @TdxGPImage.Clear);
  RegisterHeader(G, 
       'function GetAsBitmap: TBitmap; virtual;',
       @TdxGPImage.GetAsBitmap);
  RegisterHeader(G, 
       'function GetBitmapBits: TRGBColors;',
       @TdxGPImage.GetBitmapBits);
  RegisterHeader(G, 
       'function MakeComposition(AOverlayImage: TdxGPImage; AOverlayAlpha: Byte): TdxGPImage; overload;',
       @TdxGPImage_MakeComposition20);
  RegisterHeader(G, 
       'function MakeComposition(AOverlayImage: TdxGPImage; AOverlayAlpha, ASourceAlpha: Byte): TdxGPImage; overload;',
       @TdxGPImage_MakeComposition21);
  RegisterHeader(G, 
       'procedure HandleNeeded;',
       @TdxGPImage.HandleNeeded);
  RegisterHeader(G, 'procedure Resize(const AWidth, AHeight: Integer); overload; virtual;', @TdxGPImage_Resize22);
  RegisterHeader(G, 
       'procedure SetBitmap(ABitmap: TBitmap); virtual;',
       @TdxGPImage.SetBitmap);
  RegisterHeader(G, 
       'procedure Scale(const M, D: Integer);',
       @TdxGPImage.Scale);
  RegisterFakeHeader(G, 
       'function TdxGPImage_GetClientRect:TRect;',
       @TdxGPImage_GetClientRect);
  RegisterProperty(G, 
       'property ClientRect:TRect read TdxGPImage_GetClientRect;');
  RegisterFakeHeader(G, 
       'function TdxGPImage_GetHandle:GpImage;',
       @TdxGPImage_GetHandle);
  RegisterFakeHeader(G, 
       'procedure TdxGPImage_PutHandle(const Value: GpImage);',
       @TdxGPImage_PutHandle);
  RegisterProperty(G, 
       'property Handle:GpImage read TdxGPImage_GetHandle write TdxGPImage_PutHandle;');
  RegisterFakeHeader(G, 
       'function TdxGPImage_GetHandleAllocated:Boolean;',
       @TdxGPImage_GetHandleAllocated);
  RegisterProperty(G, 
       'property HandleAllocated:Boolean read TdxGPImage_GetHandleAllocated;');
  RegisterFakeHeader(G, 
       'function TdxGPImage_GetImageDataFormat:TdxImageDataFormat;',
       @TdxGPImage_GetImageDataFormat);
  RegisterFakeHeader(G, 
       'procedure TdxGPImage_PutImageDataFormat(const Value: TdxImageDataFormat);',
       @TdxGPImage_PutImageDataFormat);
  RegisterProperty(G, 
       'property ImageDataFormat:TdxImageDataFormat read TdxGPImage_GetImageDataFormat write TdxGPImage_PutImageDataFormat;');
  RegisterFakeHeader(G, 
       'function TdxGPImage_GetIsAlphaUsed:Boolean;',
       @TdxGPImage_GetIsAlphaUsed);
  RegisterProperty(G, 
       'property IsAlphaUsed:Boolean read TdxGPImage_GetIsAlphaUsed;');
  RegisterFakeHeader(G, 
       'function TdxGPImage_GetSize:TSize;',
       @TdxGPImage_GetSize);
  RegisterProperty(G, 
       'property Size:TSize read TdxGPImage_GetSize;');
  // End of class TdxGPImage
  RegisterClassReferenceType(H, 'TdxGPImageClass');
  // Begin of class TdxSmartImage
  G := RegisterClassType(H, TdxSmartImage);
  RegisterHeader(G,
       'constructor CreateFromStream(AStream: TStream); virtual;',
       @TdxSmartImage.Create);
  // End of class TdxSmartImage
  // Begin of class TdxPNGImage
  G := RegisterClassType(H, TdxPNGImage);
  RegisterHeader(G, 
       'procedure SaveToStream(AStream: TStream); override;',
       @TdxPNGImage.SaveToStream);
  RegisterHeader(G,
       'constructor CreateFromStream(AStream: TStream); virtual;',
       @TdxPNGImage.Create);
  // End of class TdxPNGImage
  // Begin of class TdxJPEGImage
  G := RegisterClassType(H, TdxJPEGImage);
  RegisterHeader(G, 
       'procedure SaveToStream(AStream: TStream); override;',
       @TdxJPEGImage.SaveToStream);
  RegisterHeader(G,
       'constructor CreateFromStream(AStream: TStream); virtual;',
       @TdxJPEGImage.Create);
  // End of class TdxJPEGImage
  // Begin of class TdxGIFImage
  G := RegisterClassType(H, TdxGIFImage);
  RegisterHeader(G, 
       'procedure SaveToStream(AStream: TStream); override;',
       @TdxGIFImage.SaveToStream);
  RegisterHeader(G,
       'constructor CreateFromStream(AStream: TStream); virtual;',
       @TdxGIFImage.Create);
  // End of class TdxGIFImage
  // Begin of class TdxTIFFImage
  G := RegisterClassType(H, TdxTIFFImage);
  RegisterHeader(G, 
       'procedure SaveToStream(AStream: TStream); override;',
       @TdxTIFFImage.SaveToStream);
  RegisterHeader(G,
       'constructor CreateFromStream(AStream: TStream); virtual;',
       @TdxTIFFImage.Create);
  // End of class TdxTIFFImage
  // Begin of class TdxBMPImage
  G := RegisterClassType(H, TdxBMPImage);
  RegisterHeader(G, 
       'procedure SaveToStream(AStream: TStream); override;',
       @TdxBMPImage.SaveToStream);
  RegisterHeader(G,
       'constructor CreateFromStream(AStream: TStream); virtual;',
       @TdxBMPImage.Create);
  // End of class TdxBMPImage
  RegisterHeader(H, 'function dxGpIsDoubleBufferedNeeded(DC: HDC): Boolean;', @dxGpIsDoubleBufferedNeeded);
  RegisterHeader(H, 'function dxGpIsRectVisible(AGraphics: GpGraphics; const R: TRect): LongBool;', @dxGpIsRectVisible);
  RegisterHeader(H, 'procedure dxGpTilePart(DC: HDC; const ADestRect, ASourceRect: TRect; AImage: GpBitmap);', @dxGpTilePart);
  RegisterHeader(H, 'procedure dxGpTilePartEx(AGraphics: GpGraphics;  const ADestRect, ASourceRect: TRect; AImage: GpBitmap; AAlpha: Byte = 255);', @dxGpTilePartEx);
  RegisterHeader(H, 'procedure dxGpResetRect(AGraphics: GpGraphics; const R: TRect);', @dxGpResetRect);
  RegisterHeader(H, 'procedure dxGpRoundRect(DC: HDC; const R: TRect;  APenColor: TColor; ABrushColor: TColor; ARadius: Integer; APenWidth: Integer = 1;  APenColorAlpha: Byte = 255; ABrushColorAlpha: Byte = 255);', @dxGpRoundRect);
  RegisterHeader(H, 'procedure dxGpEndPaint(var AGraphics: TdxGPGraphics);', @dxGpEndPaint);
  RegisterHeader(H, 'function dxGetImageDataFormat(const AFormatId: TGUID): TdxImageDataFormat;', @dxGetImageDataFormat);
  RegisterHeader(H, 'function dxGPPaintCanvas: TdxGPPaintCanvas;', @dxGPPaintCanvas);
end;
initialization
  RegisterIMPORT_dxGDIPlusClasses;
end.
