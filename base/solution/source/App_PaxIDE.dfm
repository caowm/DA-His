object PaxIDEForm: TPaxIDEForm
  Left = 312
  Top = 167
  Width = 812
  Height = 522
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object SynEdit: TSynEdit
    Left = 0
    Top = 0
    Width = 804
    Height = 488
    Align = alClient
    CodeFolding.CaseSensitive = False
    CodeFolding.FolderBarLinesColor = 9617866
    ActiveLine.Background = clYellow
    ActiveLine.Foreground = clNavy
    ActiveLine.Visible = True
    LineDivider.Visible = False
    LineDivider.Color = clRed
    LineDivider.Style = psSolid
    RightEdge.MouseMove = False
    RightEdge.Visible = True
    RightEdge.Position = 80
    RightEdge.Color = clSilver
    RightEdge.Style = psSolid
    LineSpacing = 0
    LineSpacingRule = lsSingle
    Background.Visible = False
    Background.RepeatMode = brmNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    TabOrder = 0
    Gutter.ShowLineModified = False
    Gutter.LineModifiedColor = clYellow
    Gutter.LineNormalColor = clLime
    Gutter.Font.Charset = DEFAULT_CHARSET
    Gutter.Font.Color = clWindowText
    Gutter.Font.Height = -11
    Gutter.Font.Name = 'Courier New'
    Gutter.Font.Style = []
    Gutter.LeftOffsetColor = clNone
    Gutter.RightOffsetColor = clNone
    Highlighter = SynPasSyn
    Lines.Strings = (
      '')
    WordWrap.Enabled = False
    WordWrap.Position = 80
    WordWrap.Style = wwsClientWidth
  end
  object SynPasSyn: TSynPasSyn
    Left = 56
    Top = 40
  end
  object ActionList: TActionList
    Left = 88
    Top = 40
    object CompileAct: TAction
      Caption = #32534#35793
      Hint = #32534#35793
      OnExecute = CompileActExecute
    end
    object RunAct: TAction
      Caption = #36816#34892
      Hint = #36816#34892
      OnExecute = RunActExecute
    end
    object SaveAct: TAction
      Caption = #20445#23384
      Hint = #20445#23384
      OnExecute = SaveActExecute
    end
    object OpenAct: TAction
      Caption = #25171#24320
      Hint = #25171#24320
      OnExecute = OpenActExecute
    end
  end
  object OpenDialog: TOpenDialog
    DefaultExt = '*.pas'
    Filter = 'pas|*.pas|*.*|*.*'
    Left = 120
    Top = 40
  end
  object SaveDialog: TSaveDialog
    DefaultExt = '*.pas'
    Filter = 'pas|*.pas|*.*|*.*'
    Left = 152
    Top = 40
  end
end
