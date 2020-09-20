object TestForm1: TTestForm1
  Left = 308
  Top = 232
  Width = 1138
  Height = 563
  Caption = 'TestForm1'
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = #26032#23435#20307
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 16
  object dxLayoutControl1: TdxLayoutControl
    Left = 0
    Top = 0
    Width = 1122
    Height = 525
    Align = alClient
    TabOrder = 0
    LayoutLookAndFeel = DevExpressModule.dxLayoutPage
    object cxGrid1: TcxGrid
      Left = 17
      Top = 37
      Width = 405
      Height = 221
      TabOrder = 3
      object TableView: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        object TableViewColumn1: TcxGridDBColumn
          PropertiesClassName = 'TcxPopupEditProperties'
          Properties.OnPopup = TableViewColumn1PropertiesPopup
        end
        object TableViewColumn2: TcxGridDBColumn
          PropertiesClassName = 'TcxTextEditProperties'
          Styles.Content = DevExpressModule.cxStyle93
        end
      end
      object cxGrid1DBBandedTableView1: TcxGridDBBandedTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        Bands = <
          item
          end
          item
          end>
        object cxGrid1DBBandedTableView1Column1: TcxGridDBBandedColumn
          Position.BandIndex = 0
          Position.ColIndex = 0
          Position.RowIndex = 0
        end
        object cxGrid1DBBandedTableView1Column2: TcxGridDBBandedColumn
          Position.BandIndex = 0
          Position.ColIndex = 1
          Position.RowIndex = 0
        end
        object cxGrid1DBBandedTableView1Column3: TcxGridDBBandedColumn
          Position.BandIndex = 0
          Position.ColIndex = 2
          Position.RowIndex = 0
        end
        object cxGrid1DBBandedTableView1Column4: TcxGridDBBandedColumn
          Position.BandIndex = 0
          Position.ColIndex = 3
          Position.RowIndex = 0
        end
      end
      object cxGrid1DBChartView1: TcxGridDBChartView
        DiagramColumn.Active = True
        DiagramPie.Values.CaptionPosition = pdvcpOutsideEnd
        DiagramPie.Values.CaptionItems = [pdvciValue, pdvciPercentage]
        object cxGrid1DBChartView1DataGroup1: TcxGridDBChartDataGroup
        end
        object cxGrid1DBChartView1Series1: TcxGridDBChartSeries
        end
      end
      object cxGrid1DBCardView1: TcxGridDBCardView
        Navigator.Buttons.CustomButtons = <>
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsBehavior.FocusFirstCellOnNewRecord = True
        OptionsBehavior.GoToNextCellOnEnter = True
        OptionsView.CardIndent = 7
        object cxGrid1DBCardView1Row1: TcxGridDBCardViewRow
          Position.BeginsLayer = True
        end
        object cxGrid1DBCardView1Row3: TcxGridDBCardViewRow
          Position.BeginsLayer = False
        end
        object cxGrid1DBCardView1Row2: TcxGridDBCardViewRow
          PropertiesClassName = 'TcxLookupComboBoxProperties'
          Properties.ListColumns = <>
          Position.BeginsLayer = False
        end
        object cxGrid1DBCardView1Row4: TcxGridDBCardViewRow
          PropertiesClassName = 'TcxButtonEditProperties'
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end>
          Position.BeginsLayer = True
        end
        object cxGrid1DBCardView1Row5: TcxGridDBCardViewRow
          PropertiesClassName = 'TcxMemoProperties'
          Position.BeginsLayer = True
        end
      end
      object cxGrid1Level1: TcxGridLevel
        GridView = TableView
      end
      object cxGrid1Level2: TcxGridLevel
        GridView = cxGrid1DBBandedTableView1
      end
      object cxGrid1Level3: TcxGridLevel
        GridView = cxGrid1DBChartView1
      end
      object cxGrid1Level4: TcxGridLevel
        Caption = 'CardView'
        GridView = cxGrid1DBCardView1
      end
    end
    object ParamGrid: TStringGrid
      Left = 10000
      Top = 10000
      Width = 294
      Height = 441
      BorderStyle = bsNone
      ColCount = 2
      FixedCols = 0
      RowCount = 16
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goEditing]
      TabOrder = 1
      Visible = False
      ColWidths = (
        145
        123)
    end
    object PrintBtn: TBitBtn
      Left = 10000
      Top = 10000
      Width = 99
      Height = 25
      Caption = #25171#21360#39044#35272
      TabOrder = 2
      Visible = False
      OnClick = PrintBtnClick
    end
    object ReportEdit: TEdit
      Left = 10000
      Top = 10000
      Width = 211
      Height = 20
      BorderStyle = bsNone
      TabOrder = 0
      Text = 'test1.fr3'
      Visible = False
    end
    object Button1: TButton
      Left = 17
      Top = 262
      Width = 170
      Height = 25
      Caption = 'Write Config'
      TabOrder = 4
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 191
      Top = 262
      Width = 172
      Height = 25
      Caption = 'Read Config'
      TabOrder = 5
      OnClick = Button2Click
    end
    object cxPopupEdit1: TcxPopupEdit
      Left = 134
      Top = 291
      ParentFont = False
      Properties.PopupControl = cxGrid1
      Properties.OnCloseQuery = cxPopupEdit1PropertiesCloseQuery
      Properties.OnCloseUp = cxPopupEdit1PropertiesCloseUp
      Properties.OnInitPopup = cxPopupEdit1PropertiesInitPopup
      Properties.OnPopup = cxPopupEdit1PropertiesPopup
      Style.HotTrack = False
      TabOrder = 6
      Text = 'cxPopupEdit1'
      Width = 288
    end
    object cxDBPopupEdit1: TcxDBPopupEdit
      Left = 134
      Top = 319
      ParentFont = False
      Style.HotTrack = False
      TabOrder = 7
      Width = 288
    end
    object cxDBTextEdit1: TcxDBTextEdit
      Left = 134
      Top = 347
      ParentFont = False
      Style.HotTrack = False
      TabOrder = 8
      Width = 288
    end
    object Button3: TButton
      Left = 10000
      Top = 10000
      Width = 75
      Height = 25
      Caption = 'Remove Operation'
      TabOrder = 10
      Visible = False
      OnClick = Button3Click
    end
    object Button4: TButton
      Left = 10000
      Top = 10000
      Width = 192
      Height = 25
      Caption = 'Create Operation'
      TabOrder = 9
      Visible = False
      OnClick = Button4Click
    end
    object dxLayoutControl1Group_Root: TdxLayoutGroup
      AlignHorz = ahCenter
      AlignVert = avCenter
      ButtonOptions.Buttons = <>
      Hidden = True
      ItemIndex = 1
      LayoutDirection = ldTabbed
      ShowBorder = False
      Index = -1
    end
    object dxLayoutControl1Group2: TdxLayoutGroup
      CaptionOptions.Text = #34920#26684#27979#35797
      Parent = dxLayoutControl1Group_Root
      ButtonOptions.Buttons = <>
      Hidden = True
      ShowBorder = False
      Index = 1
    end
    object dxLayoutControl1Item1: TdxLayoutItem
      Parent = dxLayoutControl1Group2
      Control = cxGrid1
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutControl1Item2: TdxLayoutItem
      AlignHorz = ahLeft
      AlignVert = avClient
      Parent = dxLayoutControl1Group3
      Control = ParamGrid
      Index = 1
    end
    object dxLayoutControl1Group1: TdxLayoutGroup
      CaptionOptions.Text = #25253#34920#27979#35797
      Parent = dxLayoutControl1Group_Root
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      Index = 0
    end
    object dxLayoutControl1Item4: TdxLayoutItem
      CaptionOptions.Text = 'BitBtn1'
      CaptionOptions.Visible = False
      Parent = dxLayoutControl1Group1
      Control = PrintBtn
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutControl1Item5: TdxLayoutItem
      CaptionOptions.Text = #25253#34920#21517#31216#65306
      Parent = dxLayoutControl1Group3
      Control = ReportEdit
      Index = 0
    end
    object dxLayoutControl1Group3: TdxLayoutGroup
      AlignHorz = ahLeft
      CaptionOptions.Text = 'Hidden Group'
      Parent = dxLayoutControl1Group1
      ButtonOptions.Buttons = <>
      Hidden = True
      ShowBorder = False
      Index = 0
    end
    object dxLayoutControl1Item6: TdxLayoutItem
      CaptionOptions.Text = 'Button1'
      CaptionOptions.Visible = False
      Parent = dxLayoutControl1Group4
      Control = Button1
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutControl1Item7: TdxLayoutItem
      CaptionOptions.Text = 'Button2'
      CaptionOptions.Visible = False
      Parent = dxLayoutControl1Group4
      Control = Button2
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutControl1Group4: TdxLayoutGroup
      CaptionOptions.Text = 'Hidden Group'
      Parent = dxLayoutControl1Group2
      ButtonOptions.Buttons = <>
      Hidden = True
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 1
    end
    object dxLayoutControl1Item3: TdxLayoutItem
      CaptionOptions.Text = 'cxPopupEdit1'
      Parent = dxLayoutControl1Group2
      Control = cxPopupEdit1
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutControl1Item8: TdxLayoutItem
      CaptionOptions.Text = 'cxDBPopupEdit1'
      Parent = dxLayoutControl1Group2
      Control = cxDBPopupEdit1
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object dxLayoutControl1Item9: TdxLayoutItem
      CaptionOptions.Text = 'cxDBTextEdit1'
      Parent = dxLayoutControl1Group2
      Control = cxDBTextEdit1
      ControlOptions.ShowBorder = False
      Index = 4
    end
    object dxLayoutControl1Item10: TdxLayoutItem
      CaptionOptions.Text = 'Button3'
      CaptionOptions.Visible = False
      Parent = dxLayoutControl1Group5
      Control = Button3
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutControl1Item11: TdxLayoutItem
      CaptionOptions.Text = 'Button4'
      CaptionOptions.Visible = False
      Parent = dxLayoutControl1Group5
      Control = Button4
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutControl1Group5: TdxLayoutGroup
      AlignHorz = ahLeft
      CaptionOptions.Text = 'New Group'
      Parent = dxLayoutControl1Group_Root
      ButtonOptions.Buttons = <>
      Index = 2
    end
  end
end
