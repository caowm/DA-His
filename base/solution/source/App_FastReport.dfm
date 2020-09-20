object ReportModule: TReportModule
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 315
  Width = 627
  object frxADOComponents1: TfrxADOComponents
    Left = 520
    Top = 152
  end
  object frxReport: TfrxReport
    Version = '6.2.11'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.AllowEdit = False
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbNoEmail]
    PreviewOptions.OutlineVisible = True
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    PrintOptions.ShowDialog = False
    ReportOptions.CreateDate = 39265.463354872700000000
    ReportOptions.LastChange = 44081.908130011570000000
    ScriptLanguage = 'PascalScript'
    StoreInDFM = False
    Left = 29
    Top = 31
  end
  object frxBarCodeObject1: TfrxBarCodeObject
    Left = 128
    Top = 88
  end
  object frxOLEObject1: TfrxOLEObject
    Left = 232
    Top = 88
  end
  object frxChartObject1: TfrxChartObject
    Left = 235
    Top = 32
  end
  object frxRichObject1: TfrxRichObject
    Left = 319
    Top = 32
  end
  object frxCrossObject1: TfrxCrossObject
    Left = 419
    Top = 32
  end
  object frxCheckBoxObject1: TfrxCheckBoxObject
    Left = 510
    Top = 32
  end
  object frxGradientObject1: TfrxGradientObject
    Left = 316
    Top = 88
  end
  object frxDialogControls1: TfrxDialogControls
    Left = 420
    Top = 88
  end
  object frxXLSExport1: TfrxXLSExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    ExportEMF = True
    AsText = False
    Background = True
    FastExport = True
    PageBreaks = True
    EmptyLines = True
    SuppressPageHeadersFooters = False
    Left = 131
    Top = 150
  end
  object frxDesigner: TfrxDesigner
    DefaultScriptLanguage = 'PascalScript'
    DefaultFont.Charset = GB2312_CHARSET
    DefaultFont.Color = clWindowText
    DefaultFont.Height = -13
    DefaultFont.Name = #23435#20307
    DefaultFont.Style = []
    DefaultLeftMargin = 10.000000000000000000
    DefaultRightMargin = 10.000000000000000000
    DefaultTopMargin = 10.000000000000000000
    DefaultBottomMargin = 10.000000000000000000
    DefaultPaperSize = 9
    DefaultOrientation = poPortrait
    GradientEnd = 11982554
    GradientStart = clWindow
    TemplatesExt = 'fr3'
    Restrictions = []
    RTLLanguage = True
    MemoParentFont = False
    Left = 29
    Top = 92
  end
  object frxDBDataset: TfrxDBDataset
    UserName = 'frxDBDataset'
    CloseDataSource = False
    BCDToCurrency = False
    Left = 517
    Top = 87
  end
  object frxPDFExport1: TfrxPDFExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    OpenAfterExport = False
    PrintOptimized = False
    Outline = False
    Background = False
    HTMLTags = True
    Quality = 95
    Transparency = False
    Author = 'FastReport'
    Subject = 'FastReport PDF export'
    ProtectionFlags = [ePrint, eModify, eCopy, eAnnot]
    HideToolbar = False
    HideMenubar = False
    HideWindowUI = False
    FitWindow = False
    CenterWindow = False
    PrintScaling = False
    PdfA = False
    Left = 232
    Top = 152
  end
  object frxHTMLExport1: TfrxHTMLExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    OpenAfterExport = False
    FixedWidth = True
    Background = False
    Centered = False
    EmptyLines = True
    Print = False
    PictureType = gpPNG
    Left = 320
    Top = 152
  end
  object frxJPEGExport1: TfrxJPEGExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    Left = 416
    Top = 152
  end
  object frxRTFExport1: TfrxRTFExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    PictureType = gpPNG
    OpenAfterExport = False
    Wysiwyg = True
    Creator = 'FastReport'
    SuppressPageHeadersFooters = False
    HeaderFooterMode = hfText
    AutoSize = False
    Left = 24
    Top = 152
  end
  object fsScript: TfsScript
    SyntaxType = 'PascalScript'
    Left = 128
    Top = 32
  end
  object frxFDComponents1: TfrxFDComponents
    Left = 128
    Top = 208
  end
end
