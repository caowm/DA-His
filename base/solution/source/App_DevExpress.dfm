object DevExpressModule: TDevExpressModule
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 309
  Width = 475
  object cxEditRepository: TcxEditRepository
    Left = 40
    Top = 83
    PixelsPerInch = 96
    object cxEditCheckBox: TcxEditRepositoryCheckBoxItem
    end
    object cxEditCurrencyEdit: TcxEditRepositoryCurrencyItem
      Properties.DisplayFormat = ',0.00;-,0.00'
      Properties.Nullable = False
    end
    object cxEditDateEdit: TcxEditRepositoryDateItem
    end
    object cxEditSpinEdit: TcxEditRepositorySpinItem
      Properties.UseCtrlIncrement = True
      Properties.ValueType = vtInt
    end
    object cxEditTextEdit: TcxEditRepositoryTextItem
    end
    object cxEditTimeEdit: TcxEditRepositoryTimeItem
    end
    object cxEditCalcEdit: TcxEditRepositoryCalcItem
      Properties.DisplayFormat = '0.00'
    end
    object cxEditImageComboBox: TcxEditRepositoryImageComboBoxItem
      Properties.Items = <>
    end
    object cxEditMemo: TcxEditRepositoryMemoItem
      Properties.ScrollBars = ssVertical
      Properties.VisibleLineCount = 1
    end
    object cxEditColorComboBox: TcxEditRepositoryColorComboBox
      Properties.AllowSelectColor = True
      Properties.CustomColors = <>
    end
    object cxEditMaskEdit: TcxEditRepositoryMaskItem
      Properties.MaskKind = emkRegExpr
    end
    object cxEditBlobEdit: TcxEditRepositoryBlobItem
      Properties.BlobEditKind = bekPict
      Properties.PictureGraphicClassName = 'TdxSmartImage'
    end
    object cxEditImage: TcxEditRepositoryImageItem
      Properties.GraphicClassName = 'TdxSmartImage'
    end
    object cxEditRichEdit: TcxEditRepositoryRichItem
      Properties.ScrollBars = ssVertical
    end
    object cxEditLookupComboBox: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownSizeable = True
      Properties.ListColumns = <>
    end
    object cxEditButtonEdit: TcxEditRepositoryButtonItem
      Properties.Buttons = <
        item
        end>
    end
    object cxEditCheckComboBox: TcxEditRepositoryCheckComboBox
      Properties.EmptySelectionText = ' '
      Properties.Items = <>
    end
    object cxEditComboBox: TcxEditRepositoryComboBoxItem
    end
    object cxEditHyperLinkEdit: TcxEditRepositoryHyperLinkItem
    end
    object cxEditFontNameComboBox: TcxEditRepositoryFontNameComboBox
    end
    object cxEditLabel: TcxEditRepositoryLabel
    end
    object cxEditProgressBar: TcxEditRepositoryProgressBar
    end
    object cxEditRadioGroup: TcxEditRepositoryRadioGroupItem
      Properties.Items = <>
    end
    object cxEditShellComboBox: TcxEditRepositoryShellComboBoxItem
    end
    object cxEditPopupEdit: TcxEditRepositoryPopupItem
    end
    object cxEditColorEdit: TcxEditRepositoryColorEdit
    end
  end
  object cxLookAndFeel: TcxLookAndFeelController
    Kind = lfFlat
    Left = 41
    Top = 13
  end
  object ExportDialog: TSaveDialog
    DefaultExt = '*xls'
    Filter = 'Excel'#25991#20214'|*.xls|'#25991#26412#25991#20214'|*.txt|Html'#25991#20214'|*.html|Xml'#25991#20214'|*.xml'
    FilterIndex = 0
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Left = 39
    Top = 157
  end
  object cxStyleRepository: TcxStyleRepository
    Left = 135
    Top = 84
    PixelsPerInch = 96
    object cxStyle1: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 16247513
      TextColor = clBlack
    end
    object cxStyle3: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 16247513
      TextColor = clBlack
    end
    object cxStyle4: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 16247513
      TextColor = clBlack
    end
    object cxStyle5: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 14811135
      TextColor = clBlack
    end
    object cxStyle6: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 14811135
      TextColor = clNavy
    end
    object cxStyle7: TcxStyle
      AssignedValues = [svColor]
      Color = 14872561
    end
    object cxStyle8: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle9: TcxStyle
      AssignedValues = [svColor]
      Color = 12937777
    end
    object cxStyle10: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle11: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle12: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 15451300
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object cxStyle13: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 14811135
      TextColor = clNavy
    end
    object cxStyle14: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 12937777
      TextColor = clWhite
    end
    object cxStyle15: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 15461375
      TextColor = clBlack
    end
    object cxStyle16: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 15461375
      TextColor = clBlack
    end
    object cxStyle17: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 15461375
      TextColor = clBlack
    end
    object cxStyle18: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 13158655
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle19: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 3552892
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      TextColor = 14540253
    end
    object cxStyle20: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 3552892
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle21: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 13158655
      TextColor = clBlack
    end
    object cxStyle22: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 5855675
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle23: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 13158655
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Times New Roman'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle24: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      TextColor = 7364767
    end
    object cxStyle25: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 5855675
      TextColor = clWhite
    end
    object cxStyle26: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clWhite
      TextColor = clBlack
    end
    object cxStyle27: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 10343916
      TextColor = clBlack
    end
    object cxStyle28: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 13626101
      TextColor = clBlack
    end
    object cxStyle29: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 10343916
      TextColor = clBlack
    end
    object cxStyle30: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 3122647
      TextColor = 13626101
    end
    object cxStyle31: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4325442
      TextColor = clWhite
    end
    object cxStyle32: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 10343916
      TextColor = clBlack
    end
    object cxStyle33: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4944971
      TextColor = clWhite
    end
    object cxStyle34: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 10343916
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle35: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clWhite
      TextColor = 3122647
    end
    object cxStyle36: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4944971
      TextColor = clWhite
    end
    object cxStyle37: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle38: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle39: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 12937777
      TextColor = clWhite
    end
    object cxStyle40: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 16247513
      TextColor = clBlack
    end
    object cxStyle41: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 16247513
      TextColor = clBlack
    end
    object cxStyle42: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 16247513
      TextColor = clBlack
    end
    object cxStyle43: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 14811135
      TextColor = clBlack
    end
    object cxStyle44: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 14811135
      TextColor = clNavy
    end
    object cxStyle45: TcxStyle
      AssignedValues = [svColor]
      Color = 14872561
    end
    object cxStyle46: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle47: TcxStyle
      AssignedValues = [svColor]
      Color = 12937777
    end
    object cxStyle48: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle49: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle50: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 15451300
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object cxStyle51: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 14811135
      TextColor = clNavy
    end
    object cxStyle52: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 12937777
      TextColor = clWhite
    end
    object cxStyle53: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 13158655
      TextColor = clBlack
    end
    object cxStyle54: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 15461375
      TextColor = clBlack
    end
    object cxStyle55: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 15461375
      TextColor = clBlack
    end
    object cxStyle56: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 15461375
      TextColor = clBlack
    end
    object cxStyle57: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 13158655
      TextColor = clBlack
    end
    object cxStyle58: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 3552892
      TextColor = 14540253
    end
    object cxStyle59: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 3552892
      TextColor = clWhite
    end
    object cxStyle60: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 13158655
      TextColor = clBlack
    end
    object cxStyle61: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 5855675
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle62: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 13158655
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Times New Roman'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle63: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      TextColor = 7364767
    end
    object cxStyle64: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 5855675
      TextColor = clWhite
    end
    object cxStyle65: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 10343916
      TextColor = clBlack
    end
    object cxStyle66: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clWhite
      TextColor = clBlack
    end
    object cxStyle67: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 10343916
      TextColor = clBlack
    end
    object cxStyle68: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 13626101
      TextColor = clBlack
    end
    object cxStyle69: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 10343916
      TextColor = clBlack
    end
    object cxStyle70: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 3122647
      TextColor = 13626101
    end
    object cxStyle71: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4325442
      TextColor = clWhite
    end
    object cxStyle72: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 10343916
      TextColor = clBlack
    end
    object cxStyle73: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4944971
      TextColor = clWhite
    end
    object cxStyle74: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 10343916
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle75: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clWhite
      TextColor = 3122647
    end
    object cxStyle76: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4944971
      TextColor = clWhite
    end
    object cxStyle77: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle78: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 12937777
      TextColor = clWhite
    end
    object cxStyle79: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 12937777
      TextColor = clWhite
    end
    object cxStyle80: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 16247513
      TextColor = clBlack
    end
    object cxStyle81: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 16247513
      TextColor = clBlack
    end
    object cxStyle82: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 16247513
      TextColor = clBlack
    end
    object cxStyle83: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle84: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle85: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 16749885
      TextColor = clWhite
    end
    object cxStyle86: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 12937777
      TextColor = clWhite
    end
    object cxStyle87: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 13158655
      TextColor = clBlack
    end
    object cxStyle88: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 15461375
      TextColor = clBlack
    end
    object cxStyle89: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 15461375
      TextColor = clBlack
    end
    object cxStyle90: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 15461375
      TextColor = clBlack
    end
    object cxStyle91: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 5855675
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle92: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 13158655
      TextColor = clBlack
    end
    object cxStyle93: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 5855675
      TextColor = clWhite
    end
    object cxStyle94: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 10343916
      TextColor = clBlack
    end
    object cxStyle95: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clWhite
      TextColor = clBlack
    end
    object cxStyle96: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 10343916
      TextColor = clBlack
    end
    object cxStyle97: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 13626101
      TextColor = clBlack
    end
    object cxStyle98: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4944971
      TextColor = clWhite
    end
    object cxStyle99: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 10343916
      TextColor = clBlack
    end
    object cxStyle100: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4944971
      TextColor = clWhite
    end
    object cxStyle101: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clWhite
      TextColor = clBlack
    end
    object cxStyle102: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 11126946
      TextColor = clBlack
    end
    object cxStyle103: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 13886416
      TextColor = clBlack
    end
    object cxStyle104: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 11126946
      TextColor = clBlack
    end
    object cxStyle105: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 6592345
      TextColor = 13886416
    end
    object cxStyle106: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 2178849
      TextColor = clWhite
    end
    object cxStyle107: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 11126946
      TextColor = clBlack
    end
    object cxStyle108: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 6592345
      TextColor = clWhite
    end
    object cxStyle109: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 11126946
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle110: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clWhite
      TextColor = 6592345
    end
    object cxStyle111: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 6592345
      TextColor = clWhite
    end
    object cxStyle112: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 11126946
      TextColor = clBlack
    end
    object cxStyle113: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clWhite
      TextColor = clBlack
    end
    object cxStyle114: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 11126946
      TextColor = clBlack
    end
    object cxStyle115: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 13886416
      TextColor = clBlack
    end
    object cxStyle116: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 11126946
      TextColor = clBlack
    end
    object cxStyle117: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 6592345
      TextColor = 13886416
    end
    object cxStyle118: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 2178849
      TextColor = clWhite
    end
    object cxStyle119: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 11126946
      TextColor = clBlack
    end
    object cxStyle120: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 6592345
      TextColor = clWhite
    end
    object cxStyle121: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 11126946
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle122: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clWhite
      TextColor = 6592345
    end
    object cxStyle123: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 6592345
      TextColor = clWhite
    end
    object cxStyle124: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 11126946
      TextColor = clBlack
    end
    object cxStyle125: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clWhite
      TextColor = clBlack
    end
    object cxStyle126: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 11126946
      TextColor = clBlack
    end
    object cxStyle127: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 13886416
      TextColor = clBlack
    end
    object cxStyle128: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 6592345
      TextColor = clWhite
    end
    object cxStyle129: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 11126946
      TextColor = clBlack
    end
    object cxStyle130: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 6592345
      TextColor = clWhite
    end
    object cxStyle131: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 15461375
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle132: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 13158655
      TextColor = clBlack
    end
    object cxStyle133: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 15461375
      TextColor = clBlack
    end
    object cxStyle134: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 13158655
      TextColor = clBlack
    end
    object cxStyle135: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 5855675
      TextColor = clWhite
    end
    object cxStyle136: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 13158655
      TextColor = clBlack
    end
    object cxStyle137: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 5855675
      TextColor = clWhite
    end
    object cxStyle138: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clWhite
      TextColor = clBlack
    end
    object cxStyle139: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 11126946
      TextColor = clBlack
    end
    object cxStyle140: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clWhite
      TextColor = clBlack
    end
    object cxStyle141: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 11126946
      TextColor = clBlack
    end
    object cxStyle142: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 6592345
      TextColor = clWhite
    end
    object cxStyle143: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 11126946
      TextColor = clBlack
    end
    object cxStyle144: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 6592345
      TextColor = clWhite
    end
    object cxStyle145: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clWhite
      TextColor = clBlack
    end
    object cxStyle146: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 10343916
      TextColor = clBlack
    end
    object cxStyle147: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clWhite
      TextColor = clBlack
    end
    object cxStyle148: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 10343916
      TextColor = clBlack
    end
    object cxStyle149: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4944971
      TextColor = clWhite
    end
    object cxStyle150: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 10343916
      TextColor = clBlack
    end
    object cxStyle151: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4944971
      TextColor = clWhite
    end
    object cxStyle152: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 16247513
      TextColor = clBlack
    end
    object cxStyle153: TcxStyle
      AssignedValues = [svColor]
      Color = 12937777
    end
    object cxStyle154: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 16247513
      TextColor = clBlack
    end
    object cxStyle155: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 12937777
      TextColor = clWhite
    end
    object cxStyle156: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle157: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle158: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 12937777
      TextColor = clWhite
    end
    object cxStyle159: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 12937777
      TextColor = clWhite
    end
    object cxStyle160: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle161: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle162: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 12937777
      TextColor = clWhite
    end
    object cxStyle163: TcxStyle
      AssignedValues = [svColor]
      Color = 12937777
    end
    object cxStyle164: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 16247513
      TextColor = clBlack
    end
    object cxStyle165: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 16445924
      TextColor = clBlack
    end
    object cxStyle166: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 15850688
      TextColor = clBlack
    end
    object cxStyle167: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 12937777
      TextColor = clWhite
    end
    object cxStyle168: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle169: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle170: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle171: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 16711164
      TextColor = clSilver
    end
    object cxStyle172: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 12937777
      TextColor = clWhite
    end
    object cxStyle173: TcxStyle
      AssignedValues = [svColor]
      Color = clWhite
    end
    object cxStyle174: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 10343916
      TextColor = clBlack
    end
    object cxStyle175: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 10343916
      TextColor = clBlack
    end
    object cxStyle176: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clWhite
      TextColor = clBlack
    end
    object cxStyle177: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 10343916
      TextColor = clBlack
    end
    object cxStyle178: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 13626101
      TextColor = clBlack
    end
    object cxStyle179: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 10343916
      TextColor = clBlack
    end
    object cxStyle180: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 8825791
      TextColor = clWhite
    end
    object cxStyle181: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 10343916
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle182: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clWhite
      TextColor = 3122647
    end
    object cxStyle183: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 5341849
      TextColor = clWhite
    end
    object cxStyle184: TcxStyle
      AssignedValues = [svColor]
      Color = clWhite
    end
    object cxStyle185: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 13158655
      TextColor = clMaroon
    end
    object cxStyle186: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 13158655
      TextColor = clMaroon
    end
    object cxStyle187: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 15461375
      TextColor = clBlack
    end
    object cxStyle188: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 15461375
      TextColor = clBlack
    end
    object cxStyle189: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 15461375
      TextColor = clBlack
    end
    object cxStyle190: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 13158655
      TextColor = clMaroon
    end
    object cxStyle191: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 8289995
      TextColor = clWhite
    end
    object cxStyle192: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 13158655
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Times New Roman'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle193: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clWhite
      TextColor = 7364767
    end
    object cxStyle194: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 5855675
      TextColor = clWhite
    end
    object cxStyle195: TcxStyle
      AssignedValues = [svColor]
      Color = 15725290
    end
    object cxStyle196: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 11126946
      TextColor = clTeal
    end
    object cxStyle197: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 11126946
      TextColor = clTeal
    end
    object cxStyle198: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clWhite
      TextColor = clBlack
    end
    object cxStyle199: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 11126946
      TextColor = clBlack
    end
    object cxStyle200: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 13886416
      TextColor = clBlack
    end
    object cxStyle201: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 11126946
      TextColor = clBlack
    end
    object cxStyle202: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 8170097
      TextColor = clWhite
    end
    object cxStyle203: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 11126946
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle204: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clWhite
      TextColor = 6592345
    end
    object cxStyle205: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 6592345
      TextColor = clWhite
    end
    object GridDevExpress: TcxGridTableViewStyleSheet
      Caption = 'DevExpress'
      Styles.Background = cxStyle1
      Styles.Content = cxStyle2
      Styles.ContentEven = cxStyle3
      Styles.ContentOdd = cxStyle166
      Styles.FilterBox = cxStyle5
      Styles.IncSearch = cxStyle11
      Styles.Footer = cxStyle6
      Styles.Group = cxStyle7
      Styles.GroupByBox = cxStyle8
      Styles.Header = cxStyle9
      Styles.Inactive = cxStyle10
      Styles.Indicator = cxStyle12
      Styles.Preview = cxStyle13
      Styles.Selection = cxStyle14
      BuiltIn = True
    end
    object GridRose: TcxGridTableViewStyleSheet
      Caption = 'Rose'
      Styles.Content = cxStyle15
      Styles.ContentEven = cxStyle16
      Styles.ContentOdd = cxStyle17
      Styles.Footer = cxStyle18
      Styles.Group = cxStyle19
      Styles.GroupByBox = cxStyle20
      Styles.Header = cxStyle21
      Styles.Inactive = cxStyle22
      Styles.Indicator = cxStyle23
      Styles.Preview = cxStyle24
      Styles.Selection = cxStyle25
      BuiltIn = True
    end
    object GridPumpkinlarge: TcxGridTableViewStyleSheet
      Caption = 'Pumpkin (large)'
      Styles.Content = cxStyle26
      Styles.ContentEven = cxStyle27
      Styles.ContentOdd = cxStyle28
      Styles.Footer = cxStyle29
      Styles.Group = cxStyle30
      Styles.GroupByBox = cxStyle31
      Styles.Header = cxStyle32
      Styles.Inactive = cxStyle33
      Styles.Indicator = cxStyle34
      Styles.Preview = cxStyle35
      Styles.Selection = cxStyle36
      BuiltIn = True
    end
    object BandDevExpress: TcxGridBandedTableViewStyleSheet
      Caption = 'DevExpress'
      Styles.Background = cxStyle37
      Styles.Content = cxStyle40
      Styles.ContentEven = cxStyle41
      Styles.ContentOdd = cxStyle166
      Styles.FilterBox = cxStyle43
      Styles.IncSearch = cxStyle49
      Styles.Footer = cxStyle44
      Styles.Group = cxStyle45
      Styles.GroupByBox = cxStyle46
      Styles.Header = cxStyle47
      Styles.Inactive = cxStyle48
      Styles.Indicator = cxStyle50
      Styles.Preview = cxStyle51
      Styles.Selection = cxStyle52
      Styles.BandBackground = cxStyle38
      Styles.BandHeader = cxStyle39
      BuiltIn = True
    end
    object BandRose: TcxGridBandedTableViewStyleSheet
      Caption = 'Rose'
      Styles.Content = cxStyle54
      Styles.ContentEven = cxStyle55
      Styles.ContentOdd = cxStyle56
      Styles.Footer = cxStyle57
      Styles.Group = cxStyle58
      Styles.GroupByBox = cxStyle59
      Styles.Header = cxStyle60
      Styles.Inactive = cxStyle61
      Styles.Indicator = cxStyle62
      Styles.Preview = cxStyle63
      Styles.Selection = cxStyle64
      Styles.BandHeader = cxStyle53
      BuiltIn = True
    end
    object BandPumpkinlarge: TcxGridBandedTableViewStyleSheet
      Caption = 'Pumpkin (large)'
      Styles.Content = cxStyle66
      Styles.ContentEven = cxStyle67
      Styles.ContentOdd = cxStyle68
      Styles.Footer = cxStyle69
      Styles.Group = cxStyle70
      Styles.GroupByBox = cxStyle71
      Styles.Header = cxStyle72
      Styles.Inactive = cxStyle73
      Styles.Indicator = cxStyle74
      Styles.Preview = cxStyle75
      Styles.Selection = cxStyle76
      Styles.BandHeader = cxStyle65
      BuiltIn = True
    end
    object CardDevExpress: TcxGridCardViewStyleSheet
      Caption = 'DevExpress'
      Styles.Background = cxStyle77
      Styles.Content = cxStyle80
      Styles.ContentEven = cxStyle81
      Styles.ContentOdd = cxStyle166
      Styles.IncSearch = cxStyle84
      Styles.CaptionRow = cxStyle78
      Styles.CardBorder = cxStyle79
      Styles.Inactive = cxStyle83
      Styles.RowCaption = cxStyle85
      Styles.Selection = cxStyle86
      BuiltIn = True
    end
    object CardRose: TcxGridCardViewStyleSheet
      Caption = 'Rose'
      Styles.Content = cxStyle88
      Styles.ContentEven = cxStyle89
      Styles.ContentOdd = cxStyle90
      Styles.CaptionRow = cxStyle87
      Styles.Inactive = cxStyle91
      Styles.RowCaption = cxStyle92
      Styles.Selection = cxStyle93
      BuiltIn = True
    end
    object CardPumpkinlarge: TcxGridCardViewStyleSheet
      Caption = 'Pumpkin (large)'
      Styles.Content = cxStyle95
      Styles.ContentEven = cxStyle96
      Styles.ContentOdd = cxStyle97
      Styles.CaptionRow = cxStyle94
      Styles.Inactive = cxStyle98
      Styles.RowCaption = cxStyle99
      Styles.Selection = cxStyle100
      BuiltIn = True
    end
    object GridSpruce: TcxGridTableViewStyleSheet
      Caption = 'Spruce'
      Styles.Content = cxStyle101
      Styles.ContentEven = cxStyle102
      Styles.ContentOdd = cxStyle103
      Styles.Footer = cxStyle104
      Styles.Group = cxStyle105
      Styles.GroupByBox = cxStyle106
      Styles.Header = cxStyle107
      Styles.Inactive = cxStyle108
      Styles.Indicator = cxStyle109
      Styles.Preview = cxStyle110
      Styles.Selection = cxStyle111
      BuiltIn = True
    end
    object BandSpruce: TcxGridBandedTableViewStyleSheet
      Caption = 'Spruce'
      Styles.Content = cxStyle113
      Styles.ContentEven = cxStyle114
      Styles.ContentOdd = cxStyle115
      Styles.Footer = cxStyle116
      Styles.Group = cxStyle117
      Styles.GroupByBox = cxStyle118
      Styles.Header = cxStyle119
      Styles.Inactive = cxStyle120
      Styles.Indicator = cxStyle121
      Styles.Preview = cxStyle122
      Styles.Selection = cxStyle123
      Styles.BandHeader = cxStyle112
      BuiltIn = True
    end
    object CardSpruce: TcxGridCardViewStyleSheet
      Caption = 'Spruce'
      Styles.Content = cxStyle125
      Styles.ContentEven = cxStyle126
      Styles.ContentOdd = cxStyle127
      Styles.CaptionRow = cxStyle124
      Styles.Inactive = cxStyle128
      Styles.RowCaption = cxStyle129
      Styles.Selection = cxStyle130
      BuiltIn = True
    end
    object PivotRose: TcxPivotGridStyleSheet
      Caption = 'Rose'
      Styles.Background = cxStyle131
      Styles.ColumnHeader = cxStyle132
      Styles.Content = cxStyle133
      Styles.FieldHeader = cxStyle134
      Styles.Inactive = cxStyle135
      Styles.RowHeader = cxStyle136
      Styles.Selected = cxStyle137
      BuiltIn = True
    end
    object PivotSpruce: TcxPivotGridStyleSheet
      Caption = 'Spruce'
      Styles.Background = cxStyle138
      Styles.ColumnHeader = cxStyle139
      Styles.Content = cxStyle140
      Styles.FieldHeader = cxStyle141
      Styles.Inactive = cxStyle142
      Styles.RowHeader = cxStyle143
      Styles.Selected = cxStyle144
      BuiltIn = True
    end
    object PivotPumpkinlarge: TcxPivotGridStyleSheet
      Caption = 'Pumpkin (large)'
      Styles.Background = cxStyle145
      Styles.ColumnHeader = cxStyle146
      Styles.Content = cxStyle147
      Styles.FieldHeader = cxStyle148
      Styles.Inactive = cxStyle149
      Styles.RowHeader = cxStyle150
      Styles.Selected = cxStyle151
      BuiltIn = True
    end
    object PivotDevExpress: TcxPivotGridStyleSheet
      Caption = 'DevExpress'
      Styles.Background = cxStyle152
      Styles.ColumnHeader = cxStyle153
      Styles.Content = cxStyle154
      Styles.FieldHeader = cxStyle155
      Styles.HeaderBackground = cxStyle156
      Styles.Inactive = cxStyle157
      Styles.RowHeader = cxStyle158
      Styles.Selected = cxStyle159
      BuiltIn = True
    end
    object TreeDevExpress: TcxTreeListStyleSheet
      Caption = 'DevExpress'
      Styles.Background = cxStyle160
      Styles.Content = cxStyle164
      Styles.Inactive = cxStyle168
      Styles.Selection = cxStyle172
      Styles.BandBackground = cxStyle161
      Styles.BandHeader = cxStyle162
      Styles.ColumnHeader = cxStyle163
      Styles.ContentEven = cxStyle165
      Styles.ContentOdd = cxStyle166
      Styles.Footer = cxStyle167
      Styles.IncSearch = cxStyle169
      Styles.Indicator = cxStyle170
      Styles.Preview = cxStyle171
      BuiltIn = True
    end
    object TreePumpkinLarge: TcxTreeListStyleSheet
      Caption = 'Pumpkin (large)'
      Styles.Content = cxStyle176
      Styles.Inactive = cxStyle180
      Styles.Selection = cxStyle183
      Styles.BandBackground = cxStyle173
      Styles.BandHeader = cxStyle174
      Styles.ColumnHeader = cxStyle175
      Styles.ContentEven = cxStyle177
      Styles.ContentOdd = cxStyle178
      Styles.Footer = cxStyle179
      Styles.Indicator = cxStyle181
      Styles.Preview = cxStyle182
      BuiltIn = True
    end
    object TreeRose: TcxTreeListStyleSheet
      Caption = 'Rose'
      Styles.Content = cxStyle187
      Styles.Inactive = cxStyle191
      Styles.Selection = cxStyle194
      Styles.BandBackground = cxStyle184
      Styles.BandHeader = cxStyle185
      Styles.ColumnHeader = cxStyle186
      Styles.ContentEven = cxStyle188
      Styles.ContentOdd = cxStyle189
      Styles.Footer = cxStyle190
      Styles.Indicator = cxStyle192
      Styles.Preview = cxStyle193
      BuiltIn = True
    end
    object TreeSpruce: TcxTreeListStyleSheet
      Caption = 'Spruce'
      Styles.Content = cxStyle198
      Styles.Inactive = cxStyle202
      Styles.Selection = cxStyle205
      Styles.BandBackground = cxStyle195
      Styles.BandHeader = cxStyle196
      Styles.ColumnHeader = cxStyle197
      Styles.ContentEven = cxStyle199
      Styles.ContentOdd = cxStyle200
      Styles.Footer = cxStyle201
      Styles.Indicator = cxStyle203
      Styles.Preview = cxStyle204
      BuiltIn = True
    end
  end
  object dxLayoutLook: TdxLayoutLookAndFeelList
    Left = 134
    Top = 15
    object dxLayoutFeelToolbar: TdxLayoutCxLookAndFeel
      GroupOptions.Padding.AssignedValues = [lpavBottom, lpavLeft, lpavRight, lpavTop]
      GroupOptions.Padding.Bottom = 0
      GroupOptions.Padding.Left = 0
      GroupOptions.Padding.Right = 0
      GroupOptions.Padding.Top = 0
      ItemOptions.Padding.AssignedValues = [lpavLeft]
      ItemOptions.Padding.Left = 0
      Offsets.ControlOffsetHorz = 0
      Offsets.ControlOffsetVert = 0
      Offsets.ItemOffset = 1
      Offsets.RootItemsAreaOffsetHorz = 0
      Offsets.RootItemsAreaOffsetVert = 0
      PixelsPerInch = 96
    end
    object dxLayoutWebFeel: TdxLayoutWebLookAndFeel
      PixelsPerInch = 96
    end
    object dxLayoutPage: TdxLayoutSkinLookAndFeel
      GroupOptions.CaptionOptions.Font.Charset = DEFAULT_CHARSET
      GroupOptions.CaptionOptions.Font.Color = clWindowText
      GroupOptions.CaptionOptions.Font.Height = -11
      GroupOptions.CaptionOptions.Font.Name = 'Tahoma'
      GroupOptions.CaptionOptions.Font.Style = [fsBold]
      GroupOptions.CaptionOptions.UseDefaultFont = False
      GroupOptions.Padding.AssignedValues = [lpavBottom, lpavTop]
      GroupOptions.Padding.Bottom = 0
      GroupOptions.Padding.Top = 0
      Offsets.ControlOffsetHorz = 2
      Offsets.ControlOffsetVert = 2
      Offsets.ItemOffset = 2
      Offsets.RootItemsAreaOffsetHorz = 3
      Offsets.RootItemsAreaOffsetVert = 3
      PixelsPerInch = 96
    end
    object dxLayoutDialog: TdxLayoutSkinLookAndFeel
      Offsets.ControlOffsetHorz = 2
      Offsets.ControlOffsetVert = 2
      Offsets.ItemOffset = 2
      Offsets.ItemsAreaOffsetHorz = 2
      Offsets.RootItemsAreaOffsetHorz = 5
      Offsets.RootItemsAreaOffsetVert = 5
      PixelsPerInch = 96
    end
    object dxLayoutPageEmbed: TdxLayoutSkinLookAndFeel
      GroupOptions.CaptionOptions.Font.Charset = DEFAULT_CHARSET
      GroupOptions.CaptionOptions.Font.Color = clWindowText
      GroupOptions.CaptionOptions.Font.Height = -11
      GroupOptions.CaptionOptions.Font.Name = 'Tahoma'
      GroupOptions.CaptionOptions.Font.Style = [fsBold]
      GroupOptions.CaptionOptions.UseDefaultFont = False
      Offsets.ControlOffsetHorz = 2
      Offsets.ControlOffsetVert = 2
      Offsets.ItemOffset = 2
      Offsets.RootItemsAreaOffsetHorz = 0
      Offsets.RootItemsAreaOffsetVert = 0
      PixelsPerInch = 96
    end
  end
  object GridPopupMenu: TcxGridPopupMenu
    PopupMenus = <
      item
        HitTypes = []
        Index = 0
      end>
    Left = 132
    Top = 156
  end
  object EditStyleController: TcxDefaultEditStyleController
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clBlack
    Style.Font.Height = -16
    Style.Font.Name = #23435#20307
    Style.Font.Style = []
    Style.IsFontAssigned = True
    StyleFocused.Color = 16772812
    Left = 229
    Top = 15
    PixelsPerInch = 96
  end
  object ViewRepository: TcxGridViewRepository
    Left = 336
    Top = 15
    object ViewRepositoryTableView1: TcxGridTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
    end
  end
  object cxLocalizer: TcxLocalizer
    Active = True
    StorageType = lstResource
    Left = 232
    Top = 156
  end
  object dxSkinController: TdxSkinController
    Kind = lfFlat
    Left = 232
    Top = 84
  end
end
