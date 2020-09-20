
unit dxGDIPlusAPI;


interface

uses
  Windows, Graphics, Classes, SysUtils, ActiveX, dxCore, SysConst;

const
  QualityModeInvalid                        = -1;
  QualityModeDefault                        = 0;
  QualityModeLow                            = 1; // Best performance
  QualityModeHigh                           = 2; // Best rendering quality

  InterpolationModeInvalid                  = QualityModeInvalid;
  InterpolationModeDefault                  = QualityModeDefault;
  InterpolationModeLowQuality               = QualityModeLow;
  InterpolationModeHighQuality              = QualityModeHigh;
  InterpolationModeBilinear                 = 3;
  InterpolationModeBicubic                  = 4;
  InterpolationModeNearestNeighbor          = 5;
  InterpolationModeHighQualityBilinear      = 6;
  InterpolationModeHighQualityBicubic       = 7;

// Alpha Compositing mode constants
  CompositingModeSourceOver                 = 0;
  CompositingModeSourceCopy                 = 1;

// Alpha Compositing quality constants
  CompositingQualityInvalid                 = QualityModeInvalid;
  CompositingQualityDefault                 = QualityModeDefault;
  CompositingQualityHighSpeed               = QualityModeLow;
  CompositingQualityHighQuality             = QualityModeHigh;
  CompositingQualityGammaCorrected          = 3;
  CompositingQualityAssumeLinear            = 4;

  SmoothingModeInvalid     = QualityModeInvalid;
  SmoothingModeDefault     = QualityModeDefault;
  SmoothingModeHighSpeed   = QualityModeLow;
  SmoothingModeHighQuality = QualityModeHigh;
  SmoothingModeNone        = 3;
  SmoothingModeAntiAlias   = 4;

  PixelFormat32bppPARGB = $E200B;

// Image format IDs
  ImageFormatUndefined : TGUID = '{b96b3ca9-0728-11d3-9d7b-0000f81ef32e}';
  ImageFormatMemoryBMP : TGUID = '{b96b3caa-0728-11d3-9d7b-0000f81ef32e}';
  ImageFormatBMP       : TGUID = '{b96b3cab-0728-11d3-9d7b-0000f81ef32e}';
  ImageFormatEMF       : TGUID = '{b96b3cac-0728-11d3-9d7b-0000f81ef32e}';
  ImageFormatWMF       : TGUID = '{b96b3cad-0728-11d3-9d7b-0000f81ef32e}';
  ImageFormatJPEG      : TGUID = '{b96b3cae-0728-11d3-9d7b-0000f81ef32e}';
  ImageFormatPNG       : TGUID = '{b96b3caf-0728-11d3-9d7b-0000f81ef32e}';
  ImageFormatGIF       : TGUID = '{b96b3cb0-0728-11d3-9d7b-0000f81ef32e}';
  ImageFormatTIFF      : TGUID = '{b96b3cb1-0728-11d3-9d7b-0000f81ef32e}';
  ImageFormatEXIF      : TGUID = '{b96b3cb2-0728-11d3-9d7b-0000f81ef32e}';
  ImageFormatIcon      : TGUID = '{b96b3cb5-0728-11d3-9d7b-0000f81ef32e}';

type
  TSingleDynArray = array of Single;

  // GDI+ base memory allocation class
  TdxGPBase = class(TObject)
  private
    FIsGPUsed: Boolean;
  public
    procedure AfterConstruction; override;
    class function NewInstance: TObject; override;
    procedure FreeInstance; override;
  end;

  TgpImageAbort = function: Bool; 

// Unit constants
  Unit_ = (
    UnitWorld,      // 0 -- World coordinate (non-physical unit)
    UnitDisplay,    // 1 -- Variable -- for PageTransform only
    UnitPixel,      // 2 -- Each unit is one device pixel.
    UnitPoint,      // 3 -- Each unit is a printer's point, or 1/72 inch.
    UnitInch,       // 4 -- Each unit is 1 inch.
    UnitDocument,   // 5 -- Each unit is 1/300 inch.
    UnitMillimeter  // 6 -- Each unit is 1 millimeter.
  );
  TdxGPUnit = Unit_;

// Fill mode constants
  FillMode = (
    FillModeAlternate,        // 0
    FillModeWinding           // 1
  );
  TdxGPFillMode = FillMode;

// Various wrap modes for brushes
  WrapMode = (
    WrapModeTile,        // 0
    WrapModeTileFlipX,   // 1
    WrapModeTileFlipY,   // 2
    WrapModeTileFlipXY,  // 3
    WrapModeClamp        // 4
  );
  TdxGPWrapMode = WrapMode;

// Various hatch styles
  HatchStyle = (
    HatchStyleHorizontal,                  // = 0,
    HatchStyleVertical,                    // = 1,
    HatchStyleForwardDiagonal,             // = 2,
    HatchStyleBackwardDiagonal,            // = 3,
    HatchStyleCross,                       // = 4,
    HatchStyleDiagonalCross,               // = 5,
    HatchStyle05Percent,                   // = 6,
    HatchStyle10Percent,                   // = 7,
    HatchStyle20Percent,                   // = 8,
    HatchStyle25Percent,                   // = 9,
    HatchStyle30Percent,                   // = 10,
    HatchStyle40Percent,                   // = 11,
    HatchStyle50Percent,                   // = 12,
    HatchStyle60Percent,                   // = 13,
    HatchStyle70Percent,                   // = 14,
    HatchStyle75Percent,                   // = 15,
    HatchStyle80Percent,                   // = 16,
    HatchStyle90Percent,                   // = 17,
    HatchStyleLightDownwardDiagonal,       // = 18,
    HatchStyleLightUpwardDiagonal,         // = 19,
    HatchStyleDarkDownwardDiagonal,        // = 20,
    HatchStyleDarkUpwardDiagonal,          // = 21,
    HatchStyleWideDownwardDiagonal,        // = 22,
    HatchStyleWideUpwardDiagonal,          // = 23,
    HatchStyleLightVertical,               // = 24,
    HatchStyleLightHorizontal,             // = 25,
    HatchStyleNarrowVertical,              // = 26,
    HatchStyleNarrowHorizontal,            // = 27,
    HatchStyleDarkVertical,                // = 28,
    HatchStyleDarkHorizontal,              // = 29,
    HatchStyleDashedDownwardDiagonal,      // = 30,
    HatchStyleDashedUpwardDiagonal,        // = 31,
    HatchStyleDashedHorizontal,            // = 32,
    HatchStyleDashedVertical,              // = 33,
    HatchStyleSmallConfetti,               // = 34,
    HatchStyleLargeConfetti,               // = 35,
    HatchStyleZigZag,                      // = 36,
    HatchStyleWave,                        // = 37,
    HatchStyleDiagonalBrick,               // = 38,
    HatchStyleHorizontalBrick,             // = 39,
    HatchStyleWeave,                       // = 40,
    HatchStylePlaid,                       // = 41,
    HatchStyleDivot,                       // = 42,
    HatchStyleDottedGrid,                  // = 43,
    HatchStyleDottedDiamond,               // = 44,
    HatchStyleShingle,                     // = 45,
    HatchStyleTrellis,                     // = 46,
    HatchStyleSphere,                      // = 47,
    HatchStyleSmallGrid,                   // = 48,
    HatchStyleSmallCheckerBoard,           // = 49,
    HatchStyleLargeCheckerBoard,           // = 50,
    HatchStyleOutlinedDiamond,             // = 51,
    HatchStyleSolidDiamond,                // = 52,

    HatchStyleTotal                        // = 53,
  );

const
  HatchStyleLargeGrid = HatchStyleCross; // 4
  HatchStyleMin       = HatchStyleHorizontal;
  HatchStyleMax       = HatchStyleSolidDiamond;

type
  TdxGPHatchStyle = HatchStyle;

// Dash style constants
  DashStyle = (
    DashStyleSolid,          // 0
    DashStyleDash,           // 1
    DashStyleDot,            // 2
    DashStyleDashDot,        // 3
    DashStyleDashDotDot,     // 4
    DashStyleCustom          // 5
  );
  TdxGPDashStyle = DashStyle;

// WarpMode constants
  WarpMode = (
    WarpModePerspective,    // 0
    WarpModeBilinear        // 1
  );
  TdxGPWarpMode = WarpMode;

// LineGradient Mode
  LinearGradientMode = (
    LinearGradientModeHorizontal,         // 0
    LinearGradientModeVertical,           // 1
    LinearGradientModeForwardDiagonal,    // 2
    LinearGradientModeBackwardDiagonal    // 3
  );
  TdxGPLinearGradientMode = LinearGradientMode;

// Pen types
  PenAlignment = (
    PenAlignmentCenter,      // = 0,
    PenAlignmentInset        // = 1
  );
  TdxGPPenAlignment = PenAlignment;

// Brush types
  BrushType = (
   BrushTypeSolidColor,      // = 0,
   BrushTypeHatchFill,       // = 1,
   BrushTypeTextureFill,     // = 2,
   BrushTypePathGradient,    // = 3,
   BrushTypeLinearGradient   // = 4
  );
  TdxGPBrushType = BrushType;

// Pen's Fill types

  PenType = Integer;
const
  PenTypeSolidColor       =  0;
  PenTypeHatchFill        =  1;
  PenTypeTextureFill      =  2;
  PenTypePathGradient     =  3;
  PenTypeLinearGradient   =  4;
  PenTypeUnknown          = -1;

type
  TdxGPPenType = PenType;

// Status return values from GDI+ methods
type
  Status = (
    Ok,
    GenericError,
    InvalidParameter,
    OutOfMemory,
    ObjectBusy,
    InsufficientBuffer,
    NotImplemented,
    Win32Error,
    WrongState,
    Aborted,
    FileNotFound,
    ValueOverflow,
    AccessDenied,
    UnknownImageFormat,
    FontFamilyNotFound,
    FontStyleNotFound,
    NotTrueTypeFont,
    UnsupportedGdiplusVersion,
    GdiplusNotInitialized,
    PropertyNotFound,
    PropertyNotSupported
  );
  TdxGPStatus = Status;

  TdxGPColorAdjustType = (
    ColorAdjustTypeDefault,
    ColorAdjustTypeBitmap,
    ColorAdjustTypeBrush,
    ColorAdjustTypePen,
    ColorAdjustTypeText,
    ColorAdjustTypeCount,
    ColorAdjustTypeAny      // Reserved
  );

  TdxGPColorMatrix = packed array[0..4, 0..4] of Single;
  PdxGPColorMatrix = ^TdxGPColorMatrix;

  TdxGPColorMatrixFlags = (
    ColorMatrixFlagsDefault,
    ColorMatrixFlagsSkipGrays,
    ColorMatrixFlagsAltGray
  );

  TGPCombineMode = (
    CombineModeReplace,
    CombineModeIntersect,
    CombineModeUnion,
    CombineModeXor,
    CombineModeExclude,
    CombineModeComplement
    );

type
  // Represents a dimension in a 2D coordinate system (floating-point coordinates)
  PdxGPSizeF = ^TdxGPSizeF;
  TdxGPSizeF = packed record
    Width  : Single;
    Height : Single;
  end;

  // Represents a dimension in a 2D coordinate system (integer coordinates)
  PdxGPSize = ^TdxGPSize;
  TdxGPSize = packed record
    Width  : Integer;
    Height : Integer;
  end;

  // Represents a location in a 2D coordinate system (floating-point coordinates)
  PdxGPPointF = ^TdxGPPointF;
  TdxGPPointF = packed record
    X : Single;
    Y : Single;
  end;
  TdxGPPointFDynArray = array of TdxGPPointF;

  // Represents a location in a 2D coordinate system (integer coordinates)
  PdxGPPoint = ^TdxGPPoint;
  TdxGPPoint = packed record
    X : Integer;
    Y : Integer;
  end;
  TdxGPPointDynArray = array of TdxGPPoint;

  // Represents a rectangle in a 2D coordinate system (floating-point coordinates)
  PdxGPRectF = ^TdxGPRectF;
  TdxGPRectF = packed record
    X     : Single;
    Y     : Single;
    Width : Single;
    Height: Single;
  end;
  TdxGPRectFDynArray = array of TdxGPRectF;

  PdxGPRect = ^TdxGPRect;
  TdxGPRect = packed record
    X     : Integer;
    Y     : Integer;
    Width : Integer;
    Height: Integer;
  end;
  TdxGPRectDynArray = array of TdxGPRect;

  PdxGPImageCodecInfo = ^TdxGPImageCodecInfo;
  TdxGPImageCodecInfo = packed record
    Clsid: TGUID;
    FormatID: TGUID;
    CodecName: Pointer;
    DllName: Pointer;
    FormatDescription: Pointer;
    FilenameExtension: Pointer;
    MimeType: Pointer;
    Flags: DWORD;
    Version: DWORD;
    SigCount: DWORD;
    SigSize: DWORD;
    SigPattern: PBYTE;
    SigMask: PBYTE;
  end;


  TEncoderParameter = packed record
    Guid           : TGUID;   // GUID of the parameter
    NumberOfValues : ULONG;   // Number of the parameter values
    Type_          : ULONG;   // Value type, like ValueTypeLONG  etc.
    Value          : Pointer; // A pointer to the parameter values
  end;
  PEncoderParameter = ^TEncoderParameter;

  TEncoderParameters = packed record
    Count     : UINT;               // Number of parameters in this structure
    Parameter : array[0..0] of TEncoderParameter;  // Parameter values
  end;
  PEncoderParameters = ^TEncoderParameters;

  DebugEventLevel = (
    DebugEventLevelFatal,
    DebugEventLevelWarning
  );
  TDebugEventLevel = DebugEventLevel;

  DebugEventProc = procedure(level: DebugEventLevel; message: PChar); stdcall;

  NotificationHookProc = function(out token: TdxNativeInt): Status; stdcall;
  NotificationUnhookProc = procedure(token: TdxNativeInt); stdcall;

  // Input structure for GdiplusStartup
  GdiplusStartupInput = {$IFNDEF DELPHI16}packed{$ENDIF} record
    GdiplusVersion          : Cardinal;       // Must be 1
    DebugEventCallback      : DebugEventProc; // Ignored on free builds
    SuppressBackgroundThread: BOOL;           // FALSE unless you're prepared to call
                                              // the hook/unhook functions properly
    SuppressExternalCodecs  : BOOL;           // FALSE unless you want GDI+ only to use
  end;                                        // its internal image codecs.
  TGdiplusStartupInput = GdiplusStartupInput;
  PGdiplusStartupInput = ^TGdiplusStartupInput;
  // Output structure for GdiplusStartup()
  GdiplusStartupOutput = packed record
    NotificationHook  : NotificationHookProc;
    NotificationUnhook: NotificationUnhookProc;
  end;
  TGdiplusStartupOutput = GdiplusStartupOutput;
  PGdiplusStartupOutput = ^TGdiplusStartupOutput;

// Private GDI+ classes for internal type checking
  GpGraphics = Pointer;
  ARGB = DWORD;
  PARGB  = ^ARGB;

  GpBrush = Pointer;
  GpTexture = Pointer;
  GpRegion = Pointer;
  GpSolidFill = Pointer;
  GpLineGradient = Pointer;
  GpPathGradient = Pointer;
  GpPath = Pointer;
  GpHatch = Pointer;
  GpPen = Pointer;
  GpImage = Pointer;
  GpBitmap = Pointer;
  GpCachedBitmap = Pointer;
  GpImageAttributes = Pointer;

  GPStatus          = TdxGPStatus;
  GpFillMode        = TdxGPFillMode;
  GpWrapMode        = TdxGPWrapMode;
  GpUnit            = TdxGPUnit;
  GpPointF          = PdxGPPointF;
  GpPoint           = PdxGPPoint;
  GpRectF           = PdxGPRectF;
  GpRect            = PdxGPRect;
  GpSizeF           = PdxGPSizeF;
  GpHatchStyle      = TdxGPHatchStyle;
  GpDashStyle       = TdxGPDashStyle;
  GpPenAlignment    = TdxGPPenAlignment;
  GpPenType         = TdxGPPenType;
  GpBrushType       = TdxGPBrushType;

  BitmapData = packed record
    Width       : UINT;
    Height      : UINT;
    Stride      : Integer;
    PixelFormat : Integer;
    Scan0       : Pointer;
    Reserved    : UINT;
  end;
  TBitmapData = BitmapData;
  PBitmapData = ^TBitmapData;


function MakePoint(X, Y: Integer): TdxGPPoint; overload;
function MakePoint(X, Y: Single): TdxGPPointF; overload;
function MakeRect(x, y, width, height: Integer): TdxGPRect; overload;
function MakeRect(location: TdxGPPoint; size: TdxGPSize): TdxGPRect; overload;
function MakeRect(Rect: TRect): TdxGPRect; overload;
function MakeRect(x, y, width, height: Single): TdxGPRectF; overload;
function MakeRect(location: TdxGPPointF; size: TdxGPSizeF): TdxGPRectF; overload;
function MakeSize(Width, Height: Single): TdxGPSizeF; overload;
function MakeSize(Width, Height: Integer): TdxGPSize; overload;

// image conversion
function DifferentImage2Bitmap(AStream: TStream): TBitmap; overload;
function DifferentImage2Bitmap(const AFileName: string): TBitmap; overload;
procedure Bitmap2PNG(ABitmap: TBitmap; AStream: TStream); overload;
procedure Bitmap2PNG(ABitmap: TBitmap; const AFileName: string); overload;

function dxGpColorToARGB(AColor: TColor; AAlpha: Byte = 255): ARGB;
function dxGpMakeARGBColor(A, R, G, B: Byte): ARGB;

function dxGpCreateBitmap(AWidth, AHeight: Integer): GpBitmap; overload;
function dxGpCreateBitmap(const ASize: TSize): GpBitmap; overload;
function dxGpCreateBitmap(const R: TRect): GpBitmap; overload;


implementation





end.

