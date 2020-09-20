object ReportPreviewForm: TReportPreviewForm
  Left = 133
  Top = 129
  Width = 960
  Height = 554
  Caption = 'Report'#25991#26723#39044#35272
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object dxLayoutControl1: TdxLayoutControl
    Left = 0
    Top = 0
    Width = 944
    Height = 516
    Align = alClient
    TabOrder = 0
    LayoutLookAndFeel = DevExpressModule.dxLayoutFeel
    object ReportPreview: TfrxPreview
      Left = 11
      Top = 42
      Width = 100
      Height = 96
      BorderStyle = bsNone
      OutlineVisible = True
      OutlineWidth = 121
      ThumbnailVisible = False
      UseReportHints = True
    end
    object EditBtn: TcxButton
      Left = 91
      Top = 10
      Width = 75
      Height = 25
      Caption = #32534#36753
      TabOrder = 1
      OnClick = EditBtnClick
    end
    object PrintBtn: TcxButton
      Left = 10
      Top = 10
      Width = 75
      Height = 25
      Caption = #25171#21360
      TabOrder = 0
      OnClick = PrintBtnClick
    end
    object DelBtn: TcxButton
      Left = 172
      Top = 10
      Width = 75
      Height = 25
      Caption = #21024#38500#39029
      TabOrder = 2
      OnClick = DelBtnClick
    end
    object AddBtn: TcxButton
      Left = 253
      Top = 10
      Width = 75
      Height = 25
      Caption = #25554#20837#39029
      TabOrder = 3
      OnClick = AddBtnClick
    end
    object SaveBtn: TcxButton
      Left = 334
      Top = 10
      Width = 75
      Height = 25
      Caption = #20445#23384
      TabOrder = 4
      OnClick = SaveBtnClick
    end
    object dxLayoutControl1Group_Root: TdxLayoutGroup
      AlignHorz = ahClient
      AlignVert = avClient
      ButtonOptions.Buttons = <>
      Hidden = True
      ShowBorder = False
      Index = -1
    end
    object dxLayoutControl1Group1: TdxLayoutGroup
      Parent = dxLayoutControl1Group_Root
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 0
    end
    object dxLayoutControl1Item1: TdxLayoutItem
      AlignVert = avClient
      Parent = dxLayoutControl1Group_Root
      Control = ReportPreview
      Index = 1
    end
    object dxLayoutControl1Item2: TdxLayoutItem
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      Parent = dxLayoutControl1Group1
      Control = EditBtn
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutControl1Item3: TdxLayoutItem
      CaptionOptions.Text = 'cxButton2'
      CaptionOptions.Visible = False
      Parent = dxLayoutControl1Group1
      Control = PrintBtn
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutControl1Item4: TdxLayoutItem
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      Parent = dxLayoutControl1Group1
      Control = DelBtn
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutControl1Item5: TdxLayoutItem
      CaptionOptions.Text = 'cxButton2'
      CaptionOptions.Visible = False
      Parent = dxLayoutControl1Group1
      Control = AddBtn
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object dxLayoutControl1Item6: TdxLayoutItem
      CaptionOptions.Text = 'cxButton3'
      CaptionOptions.Visible = False
      Parent = dxLayoutControl1Group1
      Control = SaveBtn
      ControlOptions.ShowBorder = False
      Index = 4
    end
  end
end
