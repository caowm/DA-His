inherited AppMainForm: TAppMainForm
  Left = 399
  Top = 253
  Caption = ''
  Menu = nil
  PixelsPerInch = 96
  TextHeight = 13
  object LeftSplitter: TSplitter [0]
    Left = 185
    Top = 0
    Width = 1
    Height = 248
    Color = clSilver
    ParentColor = False
    Visible = False
  end
  object RightSplitter: TSplitter [1]
    Left = 495
    Top = 0
    Width = 2
    Height = 248
    Align = alRight
    Visible = False
  end
  object BottomSplitter: TSplitter [2]
    Left = 0
    Top = 248
    Width = 682
    Height = 2
    Cursor = crVSplit
    Align = alBottom
    Visible = False
  end
  object LeftPanel: TPanel [3]
    Left = 0
    Top = 0
    Width = 185
    Height = 248
    Align = alLeft
    BevelOuter = bvNone
    ParentColor = True
    TabOrder = 0
    Visible = False
  end
  object RightPanel: TPanel [4]
    Tag = 1
    Left = 497
    Top = 0
    Width = 185
    Height = 248
    Align = alRight
    BevelOuter = bvNone
    ParentColor = True
    TabOrder = 1
    Visible = False
  end
  object BottomPanel: TPanel [5]
    Tag = 2
    Left = 0
    Top = 250
    Width = 682
    Height = 124
    Align = alBottom
    BevelOuter = bvNone
    ParentColor = True
    TabOrder = 2
    Visible = False
  end
  object ClientPanel: TPanel [6]
    Left = 186
    Top = 0
    Width = 309
    Height = 248
    Align = alClient
    BevelOuter = bvNone
    ParentColor = True
    TabOrder = 3
  end
end
