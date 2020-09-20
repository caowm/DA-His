object DevLayoutToolbar: TDevLayoutToolbar
  Left = 354
  Top = 239
  HorzScrollBar.Visible = False
  Align = alTop
  BorderStyle = bsNone
  Caption = 'DevLayoutToolbar'
  ClientHeight = 35
  ClientWidth = 941
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clBlack
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 12
  object Layout: TdxLayoutControl
    Left = 0
    Top = 0
    Width = 941
    Height = 35
    Align = alClient
    FocusOnClick = False
    TabOrder = 0
    ShowDesignSelectors = False
    OptionsItem.SizableHorz = True
    OptionsItem.SizableVert = True
    object LayoutGroup_Root: TdxLayoutGroup
      AlignHorz = ahLeft
      AlignVert = avClient
      Offsets.Bottom = 1
      Offsets.Left = 1
      Offsets.Right = 1
      Offsets.Top = 1
      SizeOptions.Height = 1
      SizeOptions.Width = 1
      ButtonOptions.Buttons = <>
      Hidden = True
      Padding.Bottom = 1
      Padding.Left = 1
      Padding.Right = 1
      Padding.Top = 1
      Padding.AssignedValues = [lpavBottom, lpavLeft, lpavRight, lpavTop]
      ShowBorder = False
      Index = -1
    end
    object ViewActionGroup: TdxLayoutGroup
      Parent = LayoutGroup_Root
      CaptionOptions.Text = 'New Group'
      ButtonOptions.Buttons = <>
      ShowBorder = False
      Index = 0
    end
  end
end
