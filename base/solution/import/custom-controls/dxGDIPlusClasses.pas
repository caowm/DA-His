
unit dxGDIPlusClasses;

interface

uses
  Windows, Classes, SysUtils, Graphics, ActiveX, Types,
  dxCore, cxGeometry, dxGDIPlusAPI;

type
  TdxPNGImage = class;
  TdxGPImage = class;

  TdxImageDataFormat = (dxImageUnknown, dxImageBitmap, dxImageJpeg, dxImagePng,
    dxImageTiff, dxImageGif);

  TdxGPInterpolationMode = (
    imDefault = InterpolationModeDefault,
    imLowQuality = InterpolationModeLowQuality,
    imHighQuality = InterpolationModeHighQuality,
    imBilinear = InterpolationModeBilinear,
    imBicubic = InterpolationModeBicubic,
    imNearestNeighbor = InterpolationModeNearestNeighbor,
    imHighQualityBilinear = InterpolationModeHighQualityBilinear,
    imHighQualityBicubic = InterpolationModeHighQualityBicubic);

  TdxGPSmoothingMode = (smDefault, smHighSpeed, smHighQuality, smNone, smAntiAlias);

  { TdxGPBrush }

  TdxGPBrush = class(TdxGPBase)
  private
    FNativeBrush: GpBrush;
    FLastResult: TdxGPStatus;
  protected
    constructor CreateNative (nativeBrush: GpBrush; AStatus: Status);
    procedure SetNativeBrush(ANativeBrush: GpBrush);
    function SetStatus(AStatus: TdxGPStatus): TdxGPStatus;
  public
    constructor Create;
    destructor Destroy; override;
    function Clone: TdxGPBrush; virtual;
    function GetType: BrushType;
    function GetLastStatus: Status;
  end;

  { TdxGPSolidBrush }

  TdxGPSolidBrush = class(TdxGPBrush)
  private
    function GetColor: DWORD;
    procedure SetColor(const Value: DWORD);
  public
    constructor Create; overload;
    constructor Create(color: TColor); overload;
    property Color: DWORD read GetColor write SetColor;
  end;

  { TdxGPTextureBrush }

  TdxGPTextureBrush = class(TdxGPBrush)
  end;

  { TdxGPLinearGradientBrush }

  TdxGPLinearGradientBrush = class(TdxGPBrush)
  private
    procedure SetWrapMode(const Value: TdxGPWrapMode);
    function GetWrapMode: TdxGPWrapMode;
  public
    constructor Create; overload;
    constructor Create(rect: TdxGPRect; color1, color2: DWORD; mode: TdxGPLinearGradientMode); overload;
    function SetLinearColors(color1, color2: DWORD): TdxGPStatus;
    function GetLinearColors(out color1, color2: DWORD): TdxGPStatus;
    function GetRectangle: TdxGPRect; overload;
    property WrapMode: TdxGPWrapMode read GetWrapMode write SetWrapMode;
  end;

  { TdxGPHatchBrush }

  TdxGPHatchBrush = class(TdxGPBrush)
  public
    constructor Create; overload;
    constructor Create(hatchStyle: TdxGPHatchStyle; foreColor: DWORD; backColor: DWORD); overload;
    function GetHatchStyle: TdxGPHatchStyle;
    function GetForegroundColor: DWORD;
    function GetBackgroundColor: DWORD;
  end;

  { TdxGPPen }

  TdxGPPen = class(TdxGPBase)
  private
    FNativePen: GpPen;
    FLastResult: TdxGPStatus;

    function GetAlignment: TdxGPPenAlignment;
    function GetColor: DWORD;
    function GetBrush: TdxGPBrush;
    function GetWidth: Single;
    procedure SetAlignment(const Value: TdxGPPenAlignment);
    procedure SetColor(const Value: DWORD);
    procedure SetBrush(const Value: TdxGPBrush);
    procedure SetWidth(const Value: Single);
  protected
    procedure SetNativePen(ANativePen: GpPen);
    function SetStatus(AStatus: TdxGPStatus): TdxGPStatus;
  public
    constructor Create(color: DWORD; width: Single = 1.0); overload;
    constructor Create(brush: TdxGPBrush; width: Single = 1.0); overload;
    destructor Destroy; override;
    function GetLastStatus: TdxGPStatus;
    function GetPenType: TdxGPPenType;
    //
    property ALignment: TdxGPPenAlignment read GetAlignment write SetAlignment;
    property Brush: TdxGPBrush read GetBrush write SetBrush;
    property Color: DWORD read GetColor write SetColor;
    property Width: Single read GetWidth write SetWidth;
  end;

  { TdxGPCanvas }

  TdxGPCanvas = class(TdxGPBase)
  private
    FHandle: GpGraphics;
    function GetInterpolationMode: TdxGPInterpolationMode;
    function GetSmoothingMode: TdxGPSmoothingMode;
    procedure SetInterpolationMode(AValue: TdxGPInterpolationMode);
    procedure SetSmoothingMode(AValue: TdxGPSmoothingMode);
  protected
    procedure CheckDestRect(var R: TRect);
    procedure CreateHandle(DC: HDC);
    procedure FreeHandle;
  public
    constructor Create(AHandle: GpGraphics); overload;
    constructor Create(DC: THandle); overload;
    destructor Destroy; override;
    //
    function GetHDC: HDC;
    procedure ReleaseHDC(DC: HDC);
    procedure Clear(AColor: TColor);
    //
    procedure Draw(AGraphic: TdxGPImage; const ADestRect, ASourceRect: TRect; AAlpha: Byte = 255); overload;
    procedure Draw(AGraphic: TdxGPImage; const R: TRect; AAlpha: Byte = 255); overload;
    procedure DrawBitmap(ABitmap: TBitmap; const R: TRect; AAlpha: Byte = 255); // deprecated
    procedure DrawTile(AGraphic: TdxGPImage; const R: TRect; AAlpha: Byte = 255); overload;
    //
    procedure Arc(R: TRect; AStartAngle, ASweepAngle: Single; APenColor: TColor;
      APenWidth: Single = 1; APenStyle: TPenStyle = psSolid; APenColorAlpha: Byte = 255);
    procedure Ellipse(R: TRect; APenColor, ABrushColor: TColor; APenWidth: Single = 1;
      APenStyle: TPenStyle = psSolid; APenColorAlpha: Byte = 255; ABrushColorAlpha: Byte = 255);
    procedure Line(X1, Y1, X2, Y2: Integer; APenColor: TColor; APenWidth: Single = 1;
      APenStyle: TPenStyle = psSolid; APenColorAlpha: Byte = 255);
    procedure Pie(R: TRect; AStartAngle, ASweepAngle: Single; APenColor: TColor;
      ABrushColor: TColor; APenWidth: Single = 1; APenStyle: TPenStyle = psSolid;
      APenColorAlpha: Byte = 255; ABrushColorAlpha: Byte = 255);
    procedure Polygon(const APoints: array of TPoint; APenColor: TColor;
      ABrushColor: TColor; APenWidth: Single = 1; APenStyle: TPenStyle = psSolid;
      APenColorAlpha: Byte = 255; ABrushColorAlpha: Byte = 255); overload;
    procedure Polygon(const APoints: array of TdxPointF; APenColor: TColor;
      ABrushColor: TColor; APenWidth: Single = 1; APenStyle: TPenStyle = psSolid;
      APenColorAlpha: Byte = 255; ABrushColorAlpha: Byte = 255); overload;
    procedure Polyline(const APoints: array of TPoint; APenColor: TColor;
      APenWidth: Single = 1; APenStyle: TPenStyle = psSolid; APenColorAlpha: Byte = 255);
    procedure Rectangle(R: TRect; APenColor, ABrushColor: TColor; APenWidth: Single = 1;
      APenStyle: TPenStyle = psSolid; APenColorAlpha: Byte = 255; ABrushColorAlpha: Byte = 255);
    procedure RoundRect(const R: TRect; APenColor, ABrushColor: TColor; ARadiusX, ARadiusY: Integer;
      APenWidth: Integer = 1; APenColorAlpha: Byte = 255; ABrushColorAlpha: Byte = 255);
    //
    property Handle: GpGraphics read FHandle;
    property InterpolationMode: TdxGPInterpolationMode read GetInterpolationMode write SetInterpolationMode;
    property SmoothingMode: TdxGPSmoothingMode read GetSmoothingMode write SetSmoothingMode;
  end;

  TdxGPGraphics = class(TdxGPCanvas);

  { TdxGPCustomPaintCanvas }

  TdxGPPaintCanvasState = record
    Handle: GpGraphics;
    Buffer: TBitmap;
    DrawRect: TRect;
    DC: HDC;
  end;
  TdxGPPaintCanvasStates = array of TdxGPPaintCanvasState;

  TdxGPCustomPaintCanvas = class(TdxGPGraphics)
  private
    FBuffer: TBitmap;
    FDrawRect: TRect;
    FDrawDC: HDC;

    procedure CreateBuffer(DC: HDC; const R: TRect);
    procedure FreeBuffer;
    procedure OutputBuffer;
  protected
    procedure SaveState; virtual;
    procedure RestoreState; virtual;
  public
    procedure BeginPaint(DC: HDC; const R: TRect); overload;
    procedure BeginPaint(AHandle: GpGraphics); overload;
    procedure EndPaint;
  end;

  { TdxGPPaintCanvas }

  TdxGPPaintCanvas = class(TdxGPCustomPaintCanvas)
  private
    FCounter: Integer;
    FSavedStates: TdxGPPaintCanvasStates;

    procedure SetCapacity(AValue: Integer);
  protected
    procedure SaveState; override;
    procedure RestoreState; override;
  public
    destructor Destroy; override;
  end;

  { TdxGPMemoryStream }

  TdxGPMemoryStream = class(TMemoryStream)
  protected
    function Realloc(var ANewCapacity: Integer): Pointer; override;
  end;

  { TdxGPStreamAdapter }

  TdxGPStreamAdapter = class(TStreamAdapter)
  public
    function Stat(out StatStg: TStatStg; StatFlag: Integer): HRESULT; override; stdcall;
  end;

  { TdxGPImageData }

  TdxGPImageData = class(TObject)
  private
    function GetIsEmpty: Boolean;
  protected
    FBits: TRGBColors;
    FBitsBounds: TSize;
    FData: TdxGPMemoryStream;
    FNewSize: TSize;
    procedure Assign(AData: TdxGPImageData);
    procedure FreeImageData;
    procedure LoadFromBits(const ABits: TRGBColors; const ASize: TSize; AHasAlphaChannel: Boolean);
    procedure LoadFromStream(AStream: TStream);
  public
    destructor Destroy; override;
    //
    property Empty: Boolean read GetIsEmpty;
  end;

  { TdxGPImage }

  TdxGPImage = class(TGraphic)
  private
    FHandle: GpImage;
    FImageData: TdxGPImageData;
    FImageDataFormat: TdxImageDataFormat;
    FIsAlphaUsed: Boolean;
    FIsAlphaUsedAssigned: Boolean;
    function CheckAlphaUsed: Boolean;
    function GetClientRect: TRect;
    function GetHandle: GpImage;
    function GetHandleAllocated: Boolean;
    function GetImageDataFormat: TdxImageDataFormat;
    function GetIsAlphaUsed: Boolean;
    procedure RecognizeImageRawDataFormat;
    procedure SetImageDataFormat(AValue: TdxImageDataFormat);
  protected
    procedure CreateHandleFromBitmap(ABitmap: TBitmap);
    procedure CreateHandleFromBits(AWidth, AHeight: Integer;
      const ABits: TRGBColors; AHasAlphaChannel: Boolean);
    procedure CreateHandleFromHBITMAP(ABitmap: HBITMAP; APalette: HPALETTE);
    procedure CreateHandleFromImageData;
    procedure CreateHandleFromStream(AStream: TStream);

    procedure AssignFromGpImage(AGpImage: TdxGPImage); virtual;
    procedure AssignFromGraphic(AGraphic: TGraphic); virtual;
    procedure AssignTo(ADest: TPersistent); override;
    procedure Draw(ACanvas: TCanvas; const ARect: TRect); override;
    procedure FreeHandle;
    function GetEmpty: Boolean; override;
    function GetHeight: Integer; override;
    function GetLoaded: Boolean; virtual;
    function GetSize: TSize;
    function GetTransparent: Boolean; override;
    function GetWidth: Integer; override;
    procedure SetHandle(AValue: GPImage);
    procedure SetHeight(Value: Integer); override;
    procedure SetWidth(Value: Integer); override;
    procedure Changed(Sender: TObject); override;
    //
    property Loaded: Boolean read GetLoaded;  
    property ImageData: TdxGPImageData read FImageData;
  public
    constructor Create; override;
    constructor CreateSize(const ASize: TSize; AColor: ARGB = 255); overload; virtual;
    constructor CreateSize(const R: TRect; AColor: ARGB = 255); overload;
    constructor CreateSize(AWidth, AHeight: Integer; AColor: ARGB = 255); overload;
    constructor CreateFromBitmap(ABitmap: TBitmap); virtual;
    constructor CreateFromHBitmap(ABitmap: HBitmap); virtual;
    constructor CreateFromBits(AWidth, AHeight: Integer;
      const ABits: TRGBColors; AHasAlphaChannel: Boolean); virtual;
    constructor CreateFromStream(AStream: TStream); virtual;
    destructor Destroy; override;

    procedure Assign(ASource: TPersistent); override;
    procedure LoadFromBits(AWidth, AHeight: Integer; const ABits: TRGBColors; AHasAlphaChannel: Boolean);
    procedure LoadFromClipboardFormat(AFormat: Word; AData: THandle; APalette: HPALETTE); override;
    procedure LoadFromFieldValue(const AValue: Variant);
    procedure LoadFromResource(AInstance: THandle; const AResName: string; AResType: PChar);
    procedure LoadFromStream(AStream: TStream); override;
    procedure SaveToClipboardFormat(var AFormat: Word; var AData: THandle; var APalette: HPALETTE); override;
    procedure SaveToStream(AStream: TStream); override;
    procedure SaveToStreamByCodec(AStream: TStream; AImageFormat: TdxImageDataFormat);

    function Clone: TdxGPImage; virtual;
    procedure ChangeColor(AColor: TColor); virtual;
    function Compare(AImage: TdxGPImage): Boolean; virtual;
    procedure ConvertToBitmap;
    procedure Clear; virtual;
    function GetAsBitmap: TBitmap; virtual;
    function GetBitmapBits: TRGBColors;
    function MakeComposition(AOverlayImage: TdxGPImage; AOverlayAlpha: Byte): TdxGPImage; overload;
    function MakeComposition(AOverlayImage: TdxGPImage; AOverlayAlpha, ASourceAlpha: Byte): TdxGPImage; overload;
    procedure HandleNeeded;
    procedure Resize(const AWidth, AHeight: Integer); overload; virtual;
    procedure Resize(const ASize: TSize); overload;
    procedure SetBitmap(ABitmap: TBitmap); virtual;
    procedure Scale(const M, D: Integer);
    procedure StretchDraw(DC: HDC; const ADest, ASource: TRect; AAlpha: Byte = 255); overload; // deprecated
    procedure StretchDraw(DC: HDC; const ADest: TRect; AAlpha: Byte = 255); overload; // deprecated

    property ClientRect: TRect read GetClientRect;
    property Handle: GpImage read GetHandle write SetHandle;
    property HandleAllocated: Boolean read GetHandleAllocated;
    property ImageDataFormat: TdxImageDataFormat read GetImageDataFormat write SetImageDataFormat;
    property IsAlphaUsed: Boolean read GetIsAlphaUsed;
    property Size: TSize read GetSize;
  end;

  TdxGPImageClass = class of TdxGPImage;

  { TdxSmartImage }

  TdxSmartImage = class(TdxGPImage)
  protected
    procedure ReadData(Stream: TStream); override;
    procedure WriteData(Stream: TStream); override;
  end;

  { TdxPNGImage }

  TdxPNGImage = class(TdxSmartImage)
  public
    procedure SaveToStream(AStream: TStream); override;
  end;

  { TdxJPEGImage }

  TdxJPEGImage = class(TdxSmartImage)
  public
    procedure SaveToStream(AStream: TStream); override;
  end;

  { TdxGIFImage }

  TdxGIFImage = class(TdxSmartImage)
  public
    procedure SaveToStream(AStream: TStream); override;
  end;

  { TdxTIFFImage }

  TdxTIFFImage = class(TdxSmartImage)
  public
    procedure SaveToStream(AStream: TStream); override;
  end;

  { TdxBMPImage }

  TdxBMPImage = class(TdxSmartImage)
  public
    procedure SaveToStream(AStream: TStream); override;
  end;

function dxGpIsDoubleBufferedNeeded(DC: HDC): Boolean;
function dxGpIsRectVisible(AGraphics: GpGraphics; const R: TRect): LongBool;

procedure dxGpDrawImage(AGraphics: GpGraphics; const ADestRect: TRect;
  const ASourceRect: TRect; AImage: GpImage; AAlpha: Byte = 255); overload;
procedure dxGPDrawText(AGraphics: TdxGPGraphics; const AText: string;
  const ARect: TRect; AFont: TFont; ATextColor: TColor;
  AHorzAlignment: TAlignment = taLeftJustify; AVertAlignment: TVerticalAlignment = taVerticalCenter;
  AWordWrap: Boolean = False; ARendering: TdxGpTextRenderingHint = TextRenderingHintSystemDefault;
  AAlpha: Integer = 255);
procedure dxGpFillRect(DC: HDC; const R: TRect; AColor: TColor; AColorAlpha: Byte = 255); overload;
procedure dxGpFillRect(AGraphics: GpGraphics; const R: TRect; AColor: ARGB); overload;
procedure dxGpFillRectByGradient(AGraphics: GpGraphics; const R: TRect;
  AColor1, AColor2: ARGB; AMode: TdxGPLinearGradientMode); overload;
procedure dxGpFillRectByGradient(DC: HDC; const R: TRect;
  AColor1, AColor2: TColor; AMode: TdxGPLinearGradientMode;
  AColor1Alpha: Byte = 255; AColor2Alpha: Byte = 255); overload;
procedure dxGpTilePart(DC: HDC; const ADestRect, ASourceRect: TRect; AImage: GpBitmap);
procedure dxGpTilePartEx(AGraphics: GpGraphics;
  const ADestRect, ASourceRect: TRect; AImage: GpBitmap; AAlpha: Byte = 255);
procedure dxGpResetRect(AGraphics: GpGraphics; const R: TRect);
procedure dxGpRoundRect(DC: HDC; const R: TRect;
  APenColor: TColor; ABrushColor: TColor; ARadius: Integer; APenWidth: Integer = 1;
  APenColorAlpha: Byte = 255; ABrushColorAlpha: Byte = 255);

function dxGpBeginPaint(AHandle: GpGraphics): TdxGPGraphics; overload;
function dxGpBeginPaint(DC: HDC; const R: TRect): TdxGPGraphics; overload;
procedure dxGpEndPaint(var AGraphics: TdxGPGraphics);

function dxGetImageDataFormat(const AFormatId: TGUID): TdxImageDataFormat;
function dxGetImageEncoder(AImageDataFormat: TdxImageDataFormat): TGUID; overload;

function dxGPPaintCanvas: TdxGPPaintCanvas;

implementation

end.
