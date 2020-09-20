object AppSimpleForm: TAppSimpleForm
  Left = 108
  Top = 50
  Width = 262
  Height = 498
  Caption = #20027#38754#26495
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object LayoutControl: TdxLayoutControl
    Left = 0
    Top = 0
    Width = 246
    Height = 460
    Align = alClient
    TabOrder = 0
    LayoutLookAndFeel = dxLayoutWebLookAndFeel1
    object LayoutControlGroup_Root: TdxLayoutGroup
      AlignHorz = ahClient
      AlignVert = avClient
      ButtonOptions.Buttons = <>
      Hidden = True
      ShowBorder = False
      Index = -1
    end
  end
  object dxLayoutLookAndFeelList1: TdxLayoutLookAndFeelList
    Left = 192
    Top = 16
    object dxLayoutCxLookAndFeel1: TdxLayoutCxLookAndFeel
      ItemOptions.CaptionOptions.HotTrack = True
      Offsets.RootItemsAreaOffsetVert = 0
    end
    object dxLayoutWebLookAndFeel1: TdxLayoutWebLookAndFeel
      GroupOptions.CaptionOptions.TextColor = clWhite
      GroupOptions.CaptionOptions.Color = clGreen
      GroupOptions.FrameColor = clBlack
      GroupOptions.FrameWidth = 0
      ItemOptions.CaptionOptions.HotTrack = True
      ItemOptions.ControlBorderColor = clNavy
    end
  end
end
