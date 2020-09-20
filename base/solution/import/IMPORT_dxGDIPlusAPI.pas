unit IMPORT_dxGDIPlusAPI;
interface
uses
  Windows,
  Graphics,
  Classes,
  SysUtils,
  ActiveX,
  dxCore,
  SysConst,
  dxGDIPlusAPI,
  Variants,
  PaxCompiler,
  PaxRegister;
procedure RegisterIMPORT_dxGDIPlusAPI;
implementation
procedure RegisterIMPORT_dxGDIPlusAPI;
var G, H: Integer;
begin
  H := RegisterNamespace(0, 'dxGDIPlusAPI');
  RegisterConstant(H, 'QualityModeDefault', 0);
  RegisterConstant(H, 'QualityModeLow', 1);
  RegisterConstant(H, 'QualityModeHigh', 2);
  RegisterConstant(H, 'InterpolationModeBilinear', 3);
  RegisterConstant(H, 'InterpolationModeBicubic', 4);
  RegisterConstant(H, 'InterpolationModeNearestNeighbor', 5);
  RegisterConstant(H, 'InterpolationModeHighQualityBilinear', 6);
  RegisterConstant(H, 'InterpolationModeHighQualityBicubic', 7);
  RegisterConstant(H, 'CompositingModeSourceOver', 0);
  RegisterConstant(H, 'CompositingModeSourceCopy', 1);
  RegisterConstant(H, 'CompositingQualityGammaCorrected', 3);
  RegisterConstant(H, 'CompositingQualityAssumeLinear', 4);
  RegisterConstant(H, 'SmoothingModeNone', 3);
  RegisterConstant(H, 'SmoothingModeAntiAlias', 4);
  RegisterConstant(H, 'PixelFormat32bppPARGB', $E200B);
  RegisterConstant(H, 'ImageFormatUndefined : TGUID', '{b96b3ca9-0728-11d3-9d7b-0000f81ef32e}');
  RegisterConstant(H, 'ImageFormatMemoryBMP : TGUID', '{b96b3caa-0728-11d3-9d7b-0000f81ef32e}');
  RegisterConstant(H, 'ImageFormatBMP       : TGUID', '{b96b3cab-0728-11d3-9d7b-0000f81ef32e}');
  RegisterConstant(H, 'ImageFormatEMF       : TGUID', '{b96b3cac-0728-11d3-9d7b-0000f81ef32e}');
  RegisterConstant(H, 'ImageFormatWMF       : TGUID', '{b96b3cad-0728-11d3-9d7b-0000f81ef32e}');
  RegisterConstant(H, 'ImageFormatJPEG      : TGUID', '{b96b3cae-0728-11d3-9d7b-0000f81ef32e}');
  RegisterConstant(H, 'ImageFormatPNG       : TGUID', '{b96b3caf-0728-11d3-9d7b-0000f81ef32e}');
  RegisterConstant(H, 'ImageFormatGIF       : TGUID', '{b96b3cb0-0728-11d3-9d7b-0000f81ef32e}');
  RegisterConstant(H, 'ImageFormatTIFF      : TGUID', '{b96b3cb1-0728-11d3-9d7b-0000f81ef32e}');
  RegisterConstant(H, 'ImageFormatEXIF      : TGUID', '{b96b3cb2-0728-11d3-9d7b-0000f81ef32e}');
  RegisterConstant(H, 'ImageFormatIcon      : TGUID', '{b96b3cb5-0728-11d3-9d7b-0000f81ef32e}');
  // Begin of class TdxGPBase
  G := RegisterClassType(H, TdxGPBase);
  RegisterHeader(G, 
       'procedure AfterConstruction; override;',
       @TdxGPBase.AfterConstruction);
  RegisterHeader(G, 
       'function NewInstance: TObject; override;',
       @TdxGPBase.NewInstance);
  RegisterHeader(G, 
       'procedure FreeInstance; override;',
       @TdxGPBase.FreeInstance);
  RegisterHeader(G,
       'constructor Create;',
       @TdxGPBase.Create);
  // End of class TdxGPBase
  RegisterTypeAlias(H, 'TgpImageAbort:function: Bool');
//  RegisterRTTIType(H, TypeInfo(Unit_));
//  RegisterTypeAlias(H, 'TdxGPUnit:Unit_');
  RegisterRTTIType(H, TypeInfo(FillMode));
  RegisterTypeAlias(H, 'TdxGPFillMode:FillMode');
  RegisterRTTIType(H, TypeInfo(WrapMode));
  RegisterTypeAlias(H, 'TdxGPWrapMode:WrapMode');
  RegisterRTTIType(H, TypeInfo(HatchStyle));
  RegisterTypeAlias(H, 'TdxGPHatchStyle:HatchStyle');
  RegisterRTTIType(H, TypeInfo(DashStyle));
  RegisterTypeAlias(H, 'TdxGPDashStyle:DashStyle');
  RegisterRTTIType(H, TypeInfo(WarpMode));
  RegisterTypeAlias(H, 'TdxGPWarpMode:WarpMode');
  RegisterRTTIType(H, TypeInfo(LinearGradientMode));
  RegisterTypeAlias(H, 'TdxGPLinearGradientMode:LinearGradientMode');
  RegisterRTTIType(H, TypeInfo(PenAlignment));
  RegisterTypeAlias(H, 'TdxGPPenAlignment:PenAlignment');
  RegisterRTTIType(H, TypeInfo(BrushType));
  RegisterTypeAlias(H, 'TdxGPBrushType:BrushType');
  RegisterTypeAlias(H, 'PenType:Integer');
  RegisterConstant(H, 'PenTypeSolidColor', 0);
  RegisterConstant(H, 'PenTypeHatchFill', 1);
  RegisterConstant(H, 'PenTypeTextureFill', 2);
  RegisterConstant(H, 'PenTypePathGradient', 3);
  RegisterConstant(H, 'PenTypeLinearGradient', 4);
  RegisterTypeAlias(H, 'TdxGPPenType:PenType');
  RegisterRTTIType(H, TypeInfo(Status));
  RegisterTypeAlias(H, 'TdxGPStatus:Status');
  RegisterRTTIType(H, TypeInfo(TdxGPColorAdjustType));
  RegisterRTTIType(H, TypeInfo(TdxGPColorMatrixFlags));
  RegisterRTTIType(H, TypeInfo(TGPCombineMode));
  RegisterRTTIType(H, TypeInfo(DebugEventLevel));
  RegisterTypeAlias(H, 'TDebugEventLevel:DebugEventLevel');
  RegisterTypeAlias(H, 'TGdiplusStartupInput:GdiplusStartupInput');
  RegisterTypeAlias(H, 'TGdiplusStartupOutput:GdiplusStartupOutput');
  RegisterTypeAlias(H, 'GpGraphics:Pointer');
  RegisterTypeAlias(H, 'ARGB:DWORD');
  RegisterTypeAlias(H, 'GpBrush:Pointer');
  RegisterTypeAlias(H, 'GpTexture:Pointer');
  RegisterTypeAlias(H, 'GpRegion:Pointer');
  RegisterTypeAlias(H, 'GpSolidFill:Pointer');
  RegisterTypeAlias(H, 'GpLineGradient:Pointer');
  RegisterTypeAlias(H, 'GpPathGradient:Pointer');
  RegisterTypeAlias(H, 'GpPath:Pointer');
  RegisterTypeAlias(H, 'GpHatch:Pointer');
  RegisterTypeAlias(H, 'GpPen:Pointer');
  RegisterTypeAlias(H, 'GpImage:Pointer');
  RegisterTypeAlias(H, 'GpBitmap:Pointer');
  RegisterTypeAlias(H, 'GpCachedBitmap:Pointer');
  RegisterTypeAlias(H, 'GpImageAttributes:Pointer');
  RegisterTypeAlias(H, 'GPStatus:TdxGPStatus');
  RegisterTypeAlias(H, 'GpFillMode:TdxGPFillMode');
  RegisterTypeAlias(H, 'GpWrapMode:TdxGPWrapMode');
  RegisterTypeAlias(H, 'GpUnit:TdxGPUnit');
  RegisterTypeAlias(H, 'GpPointF:PdxGPPointF');
  RegisterTypeAlias(H, 'GpPoint:PdxGPPoint');
  RegisterTypeAlias(H, 'GpRectF:PdxGPRectF');
  RegisterTypeAlias(H, 'GpRect:PdxGPRect');
  RegisterTypeAlias(H, 'GpSizeF:PdxGPSizeF');
  RegisterTypeAlias(H, 'GpHatchStyle:TdxGPHatchStyle');
  RegisterTypeAlias(H, 'GpDashStyle:TdxGPDashStyle');
  RegisterTypeAlias(H, 'GpPenAlignment:TdxGPPenAlignment');
  RegisterTypeAlias(H, 'GpPenType:TdxGPPenType');
  RegisterTypeAlias(H, 'GpBrushType:TdxGPBrushType');
  RegisterTypeAlias(H, 'TBitmapData:BitmapData');
//  RegisterHeader(H, 'function dxGpColorToARGB(AColor: TColor; AAlpha: Byte = 255): ARGB;', @dxGpColorToARGB);
//  RegisterHeader(H, 'function dxGpMakeARGBColor(A, R, G, B: Byte): ARGB;', @dxGpMakeARGBColor);
end;
initialization
  RegisterIMPORT_dxGDIPlusAPI;
end.
