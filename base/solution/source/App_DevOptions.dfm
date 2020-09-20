object OptionSetForm: TOptionSetForm
  Left = 586
  Top = 227
  ClientHeight = 259
  ClientWidth = 507
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Layout: TdxLayoutControl
    Left = 0
    Top = 0
    Width = 507
    Height = 259
    Align = alClient
    TabOrder = 0
    OptionsItem.SizableHorz = True
    OptionsItem.SizableVert = True
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
      Width = 234
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
      Width = 234
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
      Width = 234
    end
    object SkinCombo: TcxComboBox
      Left = 75
      Top = 130
      ParentFont = False
      Properties.DropDownListStyle = lsEditFixedList
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 4
      Width = 234
    end
    object cxButton1: TcxButton
      Left = 234
      Top = 160
      Width = 75
      Height = 25
      Caption = #20445#23384
      TabOrder = 5
      OnClick = cxButton1Click
    end
    object LayoutGroup_Root: TdxLayoutGroup
      AlignHorz = ahClient
      AlignVert = avClient
      CaptionOptions.Visible = False
      ButtonOptions.Buttons = <>
      Hidden = True
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = -1
    end
    object LayoutItem5: TdxLayoutItem
      Parent = LayoutGroup1
      CaptionOptions.Text = #23383#20307#65306
      Control = FontNameCombo
      ControlOptions.OriginalHeight = 24
      ControlOptions.OriginalWidth = 234
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object LayoutItem1: TdxLayoutItem
      Parent = LayoutGroup1
      CaptionOptions.Text = #23383#21495#65306
      Control = SizeCombo
      ControlOptions.OriginalHeight = 24
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object LayoutItem6: TdxLayoutItem
      Parent = LayoutGroup1
      CaptionOptions.Text = #39068#33394
      Control = ColorCombo
      ControlOptions.OriginalHeight = 24
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object LayoutItem4: TdxLayoutItem
      Parent = LayoutGroup1
      CaptionOptions.Text = #34920#26684#26679#24335#65306
      Control = StyleCombo
      ControlOptions.OriginalHeight = 24
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object LayoutItem7: TdxLayoutItem
      Parent = LayoutGroup1
      CaptionOptions.Text = #30382#32932#65306
      Control = SkinCombo
      ControlOptions.OriginalHeight = 24
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 4
    end
    object LayoutGroup1: TdxLayoutGroup
      Parent = LayoutGroup_Root
      CaptionOptions.Text = 'Hidden Group'
      ButtonOptions.Buttons = <>
      ShowBorder = False
      Index = 0
    end
    object LayoutItem2: TdxLayoutItem
      Parent = LayoutGroup1
      AlignHorz = ahRight
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      Control = cxButton1
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 5
    end
  end
end
