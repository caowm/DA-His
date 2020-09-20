object DataWizard: TDataWizard
  OldCreateOrder = False
  OnDestroy = DataModuleDestroy
  Height = 325
  Width = 254
  object QImport3Wizard: TQImport3Wizard
    Formats.DecimalSeparator = '.'
    Formats.ThousandSeparator = ','
    Formats.DateSeparator = '-'
    Formats.TimeSeparator = ':'
    Formats.BooleanTrue.Strings = (
      #30495)
    Formats.BooleanFalse.Strings = (
      #20551)
    Formats.NullValues.Strings = (
      #31354)
    Formats.ShortDateFormat = 'yyyy-M-d'
    Formats.LongDateFormat = 'yyyy'#39#24180#39'M'#39#26376#39'd'#39#26085#39
    Formats.ShortTimeFormat = 'h:mm'
    Formats.LongTimeFormat = 'h:mm:ss'
    FieldFormats = <>
    HelpFile = 'AImportWizard.hlp'
    ErrorLogFileName = 'error.log'
    ShowErrorLog = True
    AddType = qatInsert
    Left = 40
    Top = 24
  end
  object QExport4Dialog: TQExport4Dialog
    HelpFile = 'AExportDialog.hlp'
    Formats.DecimalSeparator = '.'
    Formats.ThousandSeparator = ','
    Formats.DateSeparator = '-'
    Formats.TimeSeparator = ':'
    Formats.BooleanTrue = 'true'
    Formats.BooleanFalse = 'false'
    Formats.IntegerFormat = '#,###,##0'
    Formats.FloatFormat = '#,###,##0.00'
    Formats.DateFormat = 'yyyy/M/d'
    Formats.TimeFormat = 'h:mm'
    Formats.DateTimeFormat = 'yyyy/M/d h:mm:ss'
    Formats.CurrencyFormat = #165'#,###,##0.00'
    RTFOptions.CaptionStyle.Font.Charset = DEFAULT_CHARSET
    RTFOptions.CaptionStyle.Font.Color = clBlack
    RTFOptions.CaptionStyle.Font.Height = -13
    RTFOptions.CaptionStyle.Font.Name = 'Arial'
    RTFOptions.CaptionStyle.Font.Style = [fsBold]
    RTFOptions.CaptionStyle.AllowHighlight = True
    RTFOptions.CaptionStyle.Alignment = talCenter
    RTFOptions.DataStyle.Font.Charset = DEFAULT_CHARSET
    RTFOptions.DataStyle.Font.Color = clBlack
    RTFOptions.DataStyle.Font.Height = -13
    RTFOptions.DataStyle.Font.Name = 'Arial'
    RTFOptions.DataStyle.Font.Style = []
    RTFOptions.DataStyle.AllowHighlight = True
    RTFOptions.FooterStyle.Font.Charset = DEFAULT_CHARSET
    RTFOptions.FooterStyle.Font.Color = clBlack
    RTFOptions.FooterStyle.Font.Height = -13
    RTFOptions.FooterStyle.Font.Name = 'Arial'
    RTFOptions.FooterStyle.Font.Style = []
    RTFOptions.FooterStyle.AllowHighlight = True
    RTFOptions.HeaderStyle.Font.Charset = DEFAULT_CHARSET
    RTFOptions.HeaderStyle.Font.Color = clBlack
    RTFOptions.HeaderStyle.Font.Height = -13
    RTFOptions.HeaderStyle.Font.Name = 'Arial'
    RTFOptions.HeaderStyle.Font.Style = []
    RTFOptions.HeaderStyle.AllowHighlight = True
    RTFOptions.StripStyles = <>
    HTMLPageOptions.TextFont.Charset = DEFAULT_CHARSET
    HTMLPageOptions.TextFont.Color = clWhite
    HTMLPageOptions.TextFont.Height = -11
    HTMLPageOptions.TextFont.Name = 'Arial'
    HTMLPageOptions.TextFont.Style = []
    CSVOptions.Comma = ','
    PDFOptions.PageOptions.MarginLeft = 1.170000000000000000
    PDFOptions.PageOptions.MarginRight = 0.570000000000000000
    PDFOptions.PageOptions.MarginTop = 0.780000000000000000
    PDFOptions.PageOptions.MarginBottom = 0.780000000000000000
    PDFOptions.HeaderFont.UserFont.Charset = DEFAULT_CHARSET
    PDFOptions.HeaderFont.UserFont.Color = clWindowText
    PDFOptions.HeaderFont.UserFont.Height = -13
    PDFOptions.HeaderFont.UserFont.Name = 'Arial'
    PDFOptions.HeaderFont.UserFont.Style = []
    PDFOptions.HeaderFont.Charset = ANSI_CHARSET
    PDFOptions.CaptionFont.UserFont.Charset = DEFAULT_CHARSET
    PDFOptions.CaptionFont.UserFont.Color = clWindowText
    PDFOptions.CaptionFont.UserFont.Height = -13
    PDFOptions.CaptionFont.UserFont.Name = 'Arial'
    PDFOptions.CaptionFont.UserFont.Style = []
    PDFOptions.CaptionFont.Charset = ANSI_CHARSET
    PDFOptions.DataFont.UserFont.Charset = DEFAULT_CHARSET
    PDFOptions.DataFont.UserFont.Color = clWindowText
    PDFOptions.DataFont.UserFont.Height = -13
    PDFOptions.DataFont.UserFont.Name = 'Arial'
    PDFOptions.DataFont.UserFont.Style = []
    PDFOptions.DataFont.Charset = ANSI_CHARSET
    PDFOptions.FooterFont.UserFont.Charset = DEFAULT_CHARSET
    PDFOptions.FooterFont.UserFont.Color = clWindowText
    PDFOptions.FooterFont.UserFont.Height = -13
    PDFOptions.FooterFont.UserFont.Name = 'Arial'
    PDFOptions.FooterFont.UserFont.Style = []
    PDFOptions.FooterFont.Charset = ANSI_CHARSET
    XLSOptions.PageFooter = 'Page &P of &N'
    XLSOptions.SheetTitle = 'Sheet 1'
    XLSOptions.CaptionFormat.Font.Style = [xfsBold]
    XLSOptions.HyperlinkFormat.Font.Color = clrBlue
    XLSOptions.HyperlinkFormat.Font.Underline = fulSingle
    XLSOptions.NoteFormat.Alignment.Horizontal = halLeft
    XLSOptions.NoteFormat.Alignment.Vertical = valTop
    XLSOptions.NoteFormat.Font.Size = 8
    XLSOptions.NoteFormat.Font.Style = [xfsBold]
    XLSOptions.NoteFormat.Font.Name = 'Tahoma'
    XLSOptions.FieldFormats = <>
    XLSOptions.StripStyles = <>
    XLSOptions.Hyperlinks = <>
    XLSOptions.Notes = <>
    XLSOptions.Charts = <>
    XLSOptions.Pictures = <>
    XLSOptions.Images = <>
    XLSOptions.Cells = <>
    XLSOptions.MergedCells = <>
    XLSOptions.DefRowHeight = 12.750000000000000000
    ODSOptions.HeaderStyle.Font.Charset = DEFAULT_CHARSET
    ODSOptions.HeaderStyle.Font.Color = clBlack
    ODSOptions.HeaderStyle.Font.Height = -13
    ODSOptions.HeaderStyle.Font.Name = 'Arial'
    ODSOptions.HeaderStyle.Font.Style = []
    ODSOptions.FooterStyle.Font.Charset = DEFAULT_CHARSET
    ODSOptions.FooterStyle.Font.Color = clBlack
    ODSOptions.FooterStyle.Font.Height = -13
    ODSOptions.FooterStyle.Font.Name = 'Arial'
    ODSOptions.FooterStyle.Font.Style = []
    ODSOptions.CaptionRowStyle.Font.Charset = DEFAULT_CHARSET
    ODSOptions.CaptionRowStyle.Font.Color = clBlack
    ODSOptions.CaptionRowStyle.Font.Height = -13
    ODSOptions.CaptionRowStyle.Font.Name = 'Arial'
    ODSOptions.CaptionRowStyle.Font.Style = []
    ODSOptions.DataStyle.Font.Charset = DEFAULT_CHARSET
    ODSOptions.DataStyle.Font.Color = clBlack
    ODSOptions.DataStyle.Font.Height = -13
    ODSOptions.DataStyle.Font.Name = 'Arial'
    ODSOptions.DataStyle.Font.Style = []
    ODSOptions.StripStylesList = <>
    ODTOptions.HeaderStyle.Font.Charset = DEFAULT_CHARSET
    ODTOptions.HeaderStyle.Font.Color = clBlack
    ODTOptions.HeaderStyle.Font.Height = -13
    ODTOptions.HeaderStyle.Font.Name = 'Arial'
    ODTOptions.HeaderStyle.Font.Style = []
    ODTOptions.FooterStyle.Font.Charset = DEFAULT_CHARSET
    ODTOptions.FooterStyle.Font.Color = clBlack
    ODTOptions.FooterStyle.Font.Height = -13
    ODTOptions.FooterStyle.Font.Name = 'Arial'
    ODTOptions.FooterStyle.Font.Style = []
    ODTOptions.CaptionRowStyle.Font.Charset = DEFAULT_CHARSET
    ODTOptions.CaptionRowStyle.Font.Color = clBlack
    ODTOptions.CaptionRowStyle.Font.Height = -13
    ODTOptions.CaptionRowStyle.Font.Name = 'Arial'
    ODTOptions.CaptionRowStyle.Font.Style = []
    ODTOptions.DataStyle.Font.Charset = DEFAULT_CHARSET
    ODTOptions.DataStyle.Font.Color = clBlack
    ODTOptions.DataStyle.Font.Height = -13
    ODTOptions.DataStyle.Font.Name = 'Arial'
    ODTOptions.DataStyle.Font.Style = []
    ODTOptions.StripStylesList = <>
    ODTOptions.Border.BorderStyle = bsODFSolid
    XlsxOptions.HeaderStyle.Font.Charset = DEFAULT_CHARSET
    XlsxOptions.HeaderStyle.Font.Color = clBlack
    XlsxOptions.HeaderStyle.Font.Height = -15
    XlsxOptions.HeaderStyle.Font.Name = 'Calibri'
    XlsxOptions.HeaderStyle.Font.Style = []
    XlsxOptions.CaptionRowStyle.Font.Charset = DEFAULT_CHARSET
    XlsxOptions.CaptionRowStyle.Font.Color = clBlack
    XlsxOptions.CaptionRowStyle.Font.Height = -15
    XlsxOptions.CaptionRowStyle.Font.Name = 'Calibri'
    XlsxOptions.CaptionRowStyle.Font.Style = []
    XlsxOptions.DataStyle.Font.Charset = DEFAULT_CHARSET
    XlsxOptions.DataStyle.Font.Color = clBlack
    XlsxOptions.DataStyle.Font.Height = -15
    XlsxOptions.DataStyle.Font.Name = 'Calibri'
    XlsxOptions.DataStyle.Font.Style = []
    XlsxOptions.FooterStyle.Font.Charset = DEFAULT_CHARSET
    XlsxOptions.FooterStyle.Font.Color = clBlack
    XlsxOptions.FooterStyle.Font.Height = -15
    XlsxOptions.FooterStyle.Font.Name = 'Calibri'
    XlsxOptions.FooterStyle.Font.Style = []
    XlsxOptions.StripStylesList = <>
    DocxOptions.HeaderStyle.Font.Charset = DEFAULT_CHARSET
    DocxOptions.HeaderStyle.Font.Color = clBlack
    DocxOptions.HeaderStyle.Font.Height = -15
    DocxOptions.HeaderStyle.Font.Name = 'Calibri'
    DocxOptions.HeaderStyle.Font.Style = []
    DocxOptions.CaptionRowStyle.Font.Charset = DEFAULT_CHARSET
    DocxOptions.CaptionRowStyle.Font.Color = clBlack
    DocxOptions.CaptionRowStyle.Font.Height = -15
    DocxOptions.CaptionRowStyle.Font.Name = 'Calibri'
    DocxOptions.CaptionRowStyle.Font.Style = []
    DocxOptions.DataStyle.Font.Charset = DEFAULT_CHARSET
    DocxOptions.DataStyle.Font.Color = clBlack
    DocxOptions.DataStyle.Font.Height = -15
    DocxOptions.DataStyle.Font.Name = 'Calibri'
    DocxOptions.DataStyle.Font.Style = []
    DocxOptions.StripStylesList = <>
    DocxOptions.FooterStyle.Font.Charset = DEFAULT_CHARSET
    DocxOptions.FooterStyle.Font.Color = clBlack
    DocxOptions.FooterStyle.Font.Height = -15
    DocxOptions.FooterStyle.Font.Name = 'Calibri'
    DocxOptions.FooterStyle.Font.Style = []
    AccessOptions.TableName = 'EXPORT_TABLE'
    Left = 128
    Top = 24
  end
  object QExport4Docx: TQExport4Docx
    About = '(About EMS AdvancedExport)'
    _Version = '4.1.0.7'
    DocxOptions.HeaderStyle.Font.Charset = DEFAULT_CHARSET
    DocxOptions.HeaderStyle.Font.Color = clBlack
    DocxOptions.HeaderStyle.Font.Height = -15
    DocxOptions.HeaderStyle.Font.Name = 'Calibri'
    DocxOptions.HeaderStyle.Font.Style = []
    DocxOptions.CaptionRowStyle.Font.Charset = DEFAULT_CHARSET
    DocxOptions.CaptionRowStyle.Font.Color = clBlack
    DocxOptions.CaptionRowStyle.Font.Height = -15
    DocxOptions.CaptionRowStyle.Font.Name = 'Calibri'
    DocxOptions.CaptionRowStyle.Font.Style = []
    DocxOptions.DataStyle.Font.Charset = DEFAULT_CHARSET
    DocxOptions.DataStyle.Font.Color = clBlack
    DocxOptions.DataStyle.Font.Height = -15
    DocxOptions.DataStyle.Font.Name = 'Calibri'
    DocxOptions.DataStyle.Font.Style = []
    DocxOptions.StripStylesList = <>
    DocxOptions.FooterStyle.Font.Charset = DEFAULT_CHARSET
    DocxOptions.FooterStyle.Font.Color = clBlack
    DocxOptions.FooterStyle.Font.Height = -15
    DocxOptions.FooterStyle.Font.Name = 'Calibri'
    DocxOptions.FooterStyle.Font.Style = []
    Left = 128
    Top = 72
  end
  object QImport3XMLDoc: TQImport3XMLDoc
    ImportMode = qimUpdateOrInsert
    Formats.DecimalSeparator = '.'
    Formats.ThousandSeparator = ','
    Formats.DateSeparator = '-'
    Formats.TimeSeparator = ':'
    Formats.BooleanTrue.Strings = (
      #30495)
    Formats.BooleanFalse.Strings = (
      #20551)
    Formats.NullValues.Strings = (
      #31354)
    Formats.ShortDateFormat = 'yyyy-M-d'
    Formats.LongDateFormat = 'yyyy'#39#24180#39'M'#39#26376#39'd'#39#26085#39
    Formats.ShortTimeFormat = 'h:mm'
    Formats.LongTimeFormat = 'h:mm:ss'
    FieldFormats = <>
    ErrorLogFileName = 'error.log'
    AddType = qatInsert
    DataLocation = tlAttributes
    Left = 40
    Top = 72
  end
  object QImport3XML: TQImport3XML
    ImportMode = qimUpdateOrInsert
    Formats.DecimalSeparator = '.'
    Formats.ThousandSeparator = ','
    Formats.DateSeparator = '-'
    Formats.TimeSeparator = ':'
    Formats.BooleanTrue.Strings = (
      #30495)
    Formats.BooleanFalse.Strings = (
      #20551)
    Formats.NullValues.Strings = (
      #31354)
    Formats.ShortDateFormat = 'yyyy-M-d'
    Formats.LongDateFormat = 'yyyy'#39#24180#39'M'#39#26376#39'd'#39#26085#39
    Formats.ShortTimeFormat = 'h:mm'
    Formats.LongTimeFormat = 'h:mm:ss'
    FieldFormats = <>
    ErrorLogFileName = 'error.log'
    AddType = qatInsert
    Left = 40
    Top = 120
  end
  object QExport4XML: TQExport4XML
    About = '(About EMS AdvancedExport)'
    _Version = '4.1.0.7'
    Options.Version = '1.0'
    Options.ExportXSDSchema = False
    Left = 128
    Top = 120
  end
  object QImport3XLS: TQImport3XLS
    ImportMode = qimUpdateOrInsert
    Formats.DecimalSeparator = '.'
    Formats.ThousandSeparator = ','
    Formats.DateSeparator = '-'
    Formats.TimeSeparator = ':'
    Formats.BooleanTrue.Strings = (
      'True'
      '1'
      '-1')
    Formats.BooleanFalse.Strings = (
      'False'
      '0')
    Formats.NullValues.Strings = (
      'Null')
    Formats.ShortDateFormat = 'yyyy-M-d'
    Formats.LongDateFormat = 'yyyy'#39#24180#39'M'#39#26376#39'd'#39#26085#39
    Formats.ShortTimeFormat = 'h:mm'
    Formats.LongTimeFormat = 'h:mm:ss'
    FieldFormats = <>
    ErrorLogFileName = 'error.log'
    ShowErrorLog = True
    AddType = qatInsert
    SkipFirstRows = 1
    Left = 40
    Top = 168
  end
  object QImport3ASCII: TQImport3ASCII
    ImportMode = qimUpdateOrInsert
    Formats.DecimalSeparator = '.'
    Formats.ThousandSeparator = ','
    Formats.DateSeparator = '-'
    Formats.TimeSeparator = ':'
    Formats.BooleanTrue.Strings = (
      'True')
    Formats.BooleanFalse.Strings = (
      'False')
    Formats.NullValues.Strings = (
      'Null')
    Formats.ShortDateFormat = 'yyyy-M-d'
    Formats.LongDateFormat = 'yyyy'#39#24180#39'M'#39#26376#39'd'#39#26085#39
    Formats.ShortTimeFormat = 'h:mm'
    Formats.LongTimeFormat = 'h:mm:ss'
    FieldFormats = <>
    ErrorLog = True
    ErrorLogFileName = 'error.log'
    ShowErrorLog = True
    AddType = qatInsert
    SkipFirstRows = 1
    Comma = ','
    Quote = '"'
    Left = 40
    Top = 216
  end
  object QExport4XLS: TQExport4XLS
    About = '(About EMS AdvancedExport)'
    _Version = '4.8.1.1'
    Formats.DecimalSeparator = '.'
    Formats.ThousandSeparator = ','
    Formats.DateSeparator = '-'
    Formats.TimeSeparator = ':'
    Formats.BooleanTrue = 'true'
    Formats.BooleanFalse = 'false'
    Formats.IntegerFormat = '#,###,##0'
    Formats.FloatFormat = '#,###,##0.00'
    Formats.DateFormat = 'yyyy/M/d'
    Formats.TimeFormat = 'h:mm'
    Formats.DateTimeFormat = 'yyyy/M/d h:mm:ss'
    Formats.CurrencyFormat = #165'#,###,##0.00'
    Options.PageFooter = 'Page &P of &N'
    Options.SheetTitle = 'Sheet 1'
    Options.CaptionsFormat.Font.Style = [xfsBold]
    Options.HyperlinkFormat.Font.Color = clrBlue
    Options.HyperlinkFormat.Font.Underline = fulSingle
    Options.NoteFormat.Alignment.Horizontal = halLeft
    Options.NoteFormat.Alignment.Vertical = valTop
    Options.NoteFormat.Font.Size = 8
    Options.NoteFormat.Font.Style = [xfsBold]
    Options.NoteFormat.Font.Name = 'Tahoma'
    FieldFormats = <>
    StripStyles = <>
    Hyperlinks = <>
    Notes = <>
    Charts = <>
    Sheets = <>
    Pictures = <>
    Images = <>
    Cells = <>
    Aggregates = <>
    MergedCells = <>
    Left = 128
    Top = 168
  end
  object QExport4ASCII: TQExport4ASCII
    About = '(About EMS AdvancedExport)'
    _Version = '4.8.1.1'
    Formats.DecimalSeparator = '.'
    Formats.ThousandSeparator = ','
    Formats.DateSeparator = '-'
    Formats.TimeSeparator = ':'
    Formats.BooleanTrue = 'true'
    Formats.BooleanFalse = 'false'
    Formats.IntegerFormat = '#,###,##0'
    Formats.FloatFormat = '#,###,##0.00'
    Formats.DateFormat = 'yyyy/M/d'
    Formats.TimeFormat = 'h:mm'
    Formats.DateTimeFormat = 'yyyy/M/d h:mm:ss'
    Formats.CurrencyFormat = #165'#,###,##0.00'
    ExportType = etCSV
    CSVComma = ','
    Left = 128
    Top = 216
  end
end
