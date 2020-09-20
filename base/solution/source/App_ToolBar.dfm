object SimpleToolBar: TSimpleToolBar
  Left = 441
  Top = 216
  Align = alTop
  BorderStyle = bsNone
  Caption = #24037#20855#26639
  ClientHeight = 40
  ClientWidth = 444
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  DesignSize = (
    444
    40)
  PixelsPerInch = 96
  TextHeight = 13
  object ViewImage: TImage
    Left = 4
    Top = 8
    Width = 25
    Height = 25
    AutoSize = True
    Visible = False
  end
  object ViewLabel: TLabel
    Left = 16
    Top = 10
    Width = 81
    Height = 16
    Caption = 'ViewLabel'
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #24188#22278
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Bevel1: TBevel
    Left = 0
    Top = 36
    Width = 444
    Height = 4
    Align = alBottom
    Shape = bsBottomLine
  end
  object ToolBar: TToolBar
    Left = 328
    Top = 4
    Width = 116
    Height = 19
    Align = alNone
    Anchors = [akTop, akRight]
    AutoSize = True
    ButtonHeight = 19
    ButtonWidth = 36
    Caption = 'Common'
    TabOrder = 0
    Transparent = True
    object ToolButton4: TToolButton
      Left = 0
      Top = 0
      Width = 8
      Caption = 'ToolButton4'
      ImageIndex = 0
      Style = tbsSeparator
      Visible = False
    end
    object ToolButton1: TToolButton
      Left = 8
      Top = 0
      Action = CloseAction
    end
    object ToolButton2: TToolButton
      Left = 44
      Top = 0
      Action = BackAction
    end
    object ToolButton3: TToolButton
      Left = 80
      Top = 0
      Action = ForwardAction
    end
  end
  object ActionList: TActionList
    Left = 154
    Top = 65534
    object CloseAction: TAction
      Category = #31995#32479
      Caption = #20851#38381
      Hint = #20851#38381#35270#22270
      ShortCut = 32856
      OnExecute = CloseActionExecute
    end
    object BackAction: TAction
      Category = #31995#32479
      Caption = #21518#36864
      Hint = #21518#19968#20010#35270#22270
      ShortCut = 16421
      OnExecute = BackActionExecute
    end
    object ForwardAction: TAction
      Category = #31995#32479
      Caption = #21069#36827
      Hint = #21069#19968#20010#35270#22270
      ShortCut = 16423
      OnExecute = ForwardActionExecute
    end
    object LoggerAction: TAction
      Category = #31995#32479
      Caption = #31243#24207#36816#34892#35760#24405
      Hint = #31243#24207#36816#34892#35760#24405
      ShortCut = 16460
      OnExecute = LoggerActionExecute
    end
    object TreeAction: TAction
      Category = #31995#32479
      Caption = #25805#20316#26641
      Hint = #25805#20316#26641
    end
  end
end
