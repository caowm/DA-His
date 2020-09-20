inherited DevMain: TDevMain
  Left = 631
  Top = 174
  Caption = 'DevExpressMain'
  Menu = nil
  PixelsPerInch = 96
  TextHeight = 13
  object LeftSplitter: TcxSplitter [0]
    Left = 185
    Top = 28
    Width = 8
    Height = 218
    HotZoneClassName = 'TcxXPTaskBarStyle'
    ResizeUpdate = True
    Control = LeftPanel
  end
  object RightSplitter: TcxSplitter [1]
    Left = 489
    Top = 28
    Width = 8
    Height = 218
    HotZoneClassName = 'TcxXPTaskBarStyle'
    AlignSplitter = salRight
    Control = RightPanel
    Visible = False
  end
  object BottomSplitter: TcxSplitter [2]
    Left = 0
    Top = 246
    Width = 682
    Height = 8
    HotZoneClassName = 'TcxXPTaskBarStyle'
    AlignSplitter = salBottom
    Control = BottomPanel
    Visible = False
  end
  object LeftPanel: TPanel [3]
    Left = 0
    Top = 28
    Width = 185
    Height = 218
    Align = alLeft
    BevelOuter = bvNone
    ParentColor = True
    TabOrder = 3
    Visible = False
    object LeftPage: TcxPageControl
      Left = 0
      Top = 0
      Width = 185
      Height = 218
      Align = alClient
      TabOrder = 0
      Properties.CustomButtons.Buttons = <>
      Properties.HideTabs = True
      Properties.TabPosition = tpBottom
      ClientRectBottom = 214
      ClientRectLeft = 4
      ClientRectRight = 181
      ClientRectTop = 4
    end
  end
  object RightPanel: TPanel [4]
    Left = 497
    Top = 28
    Width = 185
    Height = 218
    Align = alRight
    BevelOuter = bvNone
    ParentColor = True
    TabOrder = 4
    Visible = False
    object RightPage: TcxPageControl
      Left = 0
      Top = 0
      Width = 185
      Height = 218
      Align = alClient
      TabOrder = 0
      Properties.CustomButtons.Buttons = <>
      Properties.HideTabs = True
      Properties.TabPosition = tpBottom
      ClientRectBottom = 214
      ClientRectLeft = 4
      ClientRectRight = 181
      ClientRectTop = 4
    end
  end
  object BottomPanel: TPanel [5]
    Left = 0
    Top = 254
    Width = 682
    Height = 120
    Align = alBottom
    BevelOuter = bvNone
    ParentColor = True
    TabOrder = 5
    Visible = False
    object BottomPage: TcxPageControl
      Left = 0
      Top = 0
      Width = 682
      Height = 120
      Align = alClient
      TabOrder = 0
      Properties.CustomButtons.Buttons = <>
      Properties.TabPosition = tpBottom
      ClientRectBottom = 116
      ClientRectLeft = 4
      ClientRectRight = 678
      ClientRectTop = 4
    end
  end
  object ClientPanel: TPanel [6]
    Left = 193
    Top = 28
    Width = 296
    Height = 218
    Align = alClient
    BevelOuter = bvNone
    ParentColor = True
    TabOrder = 6
    object ClientPage: TcxPageControl
      Left = 0
      Top = 0
      Width = 296
      Height = 218
      Align = alClient
      TabOrder = 0
      Properties.AllowTabDragDrop = True
      Properties.CustomButtons.Buttons = <>
      OnChange = ClientPageChange
      OnDblClick = ClientPageDblClick
      OnPageChanging = ClientPagePageChanging
      ClientRectBottom = 214
      ClientRectLeft = 4
      ClientRectRight = 292
      ClientRectTop = 4
    end
  end
  inherited MainMenu: TMainMenu
    Left = 61
  end
  object BarManager: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #24494#36719#38597#40657
    Font.Style = []
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    ImageOptions.StretchGlyphs = False
    PopupMenuLinks = <>
    UseSystemFont = True
    Left = 209
    Top = 72
    PixelsPerInch = 96
    DockControlHeights = (
      0
      0
      28
      0)
    object MenuBar: TdxBar
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      AllowReset = False
      Caption = #20027#33756#21333
      CaptionButtons = <>
      DockedDockingStyle = dsTop
      DockedLeft = 0
      DockedTop = 0
      DockingStyle = dsTop
      FloatLeft = 297
      FloatTop = 159
      FloatClientWidth = 0
      FloatClientHeight = 0
      IsMainMenu = True
      ItemLinks = <>
      MultiLine = True
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = True
    end
  end
end
