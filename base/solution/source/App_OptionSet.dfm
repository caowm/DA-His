object OptionSetForm: TOptionSetForm
  Left = 142
  Top = 410
  Width = 457
  Height = 263
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object dxLayoutControl1: TdxLayoutControl
    Left = 0
    Top = 0
    Width = 441
    Height = 225
    Align = alClient
    ParentBackground = True
    TabOrder = 0
    OptionsItem.SizableHorz = True
    OptionsItem.SizableVert = True
    object LookKindCombo: TcxComboBox
      Left = 75
      Top = 130
      ParentFont = False
      Properties.DropDownListStyle = lsFixedList
      Properties.Items.Strings = (
        #24179#26495
        #26631#20934
        #32431#24179
        'Office')
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 4
      Text = #24179#26495
      Width = 121
    end
    object NativeCheckBox: TcxCheckBox
      Left = 75
      Top = 160
      Caption = #20351#29992#26412#26426#39118#26684
      ParentFont = False
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      TabOrder = 5
      Transparent = True
      Width = 138
    end
    object StyleCombo: TcxComboBox
      Left = 75
      Top = 100
      ParentFont = False
      Properties.DropDownListStyle = lsFixedList
      Properties.Items.Strings = (
        #26080
        #26222#36890
        #29611#29808
        #21335#29916
        #20113#26441)
      Properties.ReadOnly = False
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 3
      Text = #26080
      Width = 121
    end
    object SizeCombo: TcxComboBox
      Left = 75
      Top = 40
      ParentFont = False
      Properties.DropDownListStyle = lsFixedList
      Properties.Items.Strings = (
        '8'
        '9'
        '10'
        '11'
        '12'
        '13'
        '14'
        '15'
        '16'
        '17'
        '18'
        '19'
        '20')
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 1
      Text = '11'
      Width = 121
    end
    object FontNameCombo: TcxFontNameComboBox
      Left = 75
      Top = 10
      ParentFont = False
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 0
      Width = 234
    end
    object ColorCombo: TcxColorComboBox
      Left = 75
      Top = 70
      ParentFont = False
      Properties.AllowSelectColor = True
      Properties.CustomColors = <>
      Properties.NamingConvention = cxncX11
      Properties.PrepareList = cxplX11Ordered
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 2
      Width = 121
    end
    object dxLayoutControl1Group_Root: TdxLayoutGroup
      AlignHorz = ahCenter
      AlignVert = avCenter
      CaptionOptions.Visible = False
      ButtonOptions.Buttons = <>
      Hidden = True
      ShowBorder = False
      Index = -1
    end
    object dxLayoutControl1Item5: TdxLayoutItem
      CaptionOptions.Text = #23383#20307#65306
      Parent = dxLayoutControl1Group_Root
      Control = FontNameCombo
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutControl1Item1: TdxLayoutItem
      CaptionOptions.Text = #23383#21495#65306
      Parent = dxLayoutControl1Group_Root
      Control = SizeCombo
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutControl1Item6: TdxLayoutItem
      CaptionOptions.Text = #39068#33394
      Parent = dxLayoutControl1Group_Root
      Control = ColorCombo
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutControl1Item4: TdxLayoutItem
      CaptionOptions.Text = #34920#26684#24335#26679#65306
      Parent = dxLayoutControl1Group_Root
      Control = StyleCombo
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object dxLayoutControl1Item2: TdxLayoutItem
      CaptionOptions.Text = #30382#32932#65306
      Parent = dxLayoutControl1Group_Root
      Control = LookKindCombo
      ControlOptions.ShowBorder = False
      Index = 4
    end
    object dxLayoutControl1Item3: TdxLayoutItem
      CaptionOptions.Text = ' '
      Parent = dxLayoutControl1Group_Root
      Control = NativeCheckBox
      ControlOptions.ShowBorder = False
      Index = 5
    end
  end
end
