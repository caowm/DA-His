object FileClientForm: TFileClientForm
  Left = 215
  Top = 359
  Width = 1013
  Height = 469
  Caption = 'ock'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object dxLayoutControl1: TdxLayoutControl
    Left = 0
    Top = 0
    Width = 997
    Height = 431
    Align = alClient
    TabOrder = 0
    object FolderTree: TcxTreeList
      Left = 10
      Top = 28
      Width = 250
      Height = 150
      Bands = <
        item
        end>
      Navigator.Buttons.CustomButtons = <>
      Navigator.Buttons.First.Visible = False
      Navigator.Buttons.PriorPage.Visible = False
      Navigator.Buttons.Prior.Visible = False
      Navigator.Buttons.Next.Visible = False
      Navigator.Buttons.NextPage.Visible = False
      Navigator.Buttons.Last.Visible = False
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Refresh.Visible = False
      Navigator.Buttons.SaveBookmark.Visible = False
      Navigator.Buttons.GotoBookmark.Visible = False
      OptionsData.Editing = False
      OptionsData.Deleting = False
      OptionsSelection.InvertSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.Headers = False
      TabOrder = 0
      OnFocusedNodeChanged = FolderTreeFocusedNodeChanged
      object FolderColumn: TcxTreeListColumn
        Caption.Text = #30446#24405
        DataBinding.ValueType = 'String'
        Options.Editing = False
        Position.ColIndex = 0
        Position.RowIndex = 0
        Position.BandIndex = 0
        Summary.FooterSummaryItems = <>
        Summary.GroupFooterSummaryItems = <>
      end
    end
    object cxGrid: TcxGrid
      Left = 274
      Top = 28
      Width = 250
      Height = 200
      TabOrder = 1
      object FileTable: TcxGridTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsData.Deleting = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsView.DataRowHeight = 32
        OptionsView.GroupByBox = False
        object ColumnName: TcxGridColumn
          Caption = #21517#31216
          HeaderAlignmentHorz = taCenter
          Options.Editing = False
          Width = 327
        end
        object ColumnExt: TcxGridColumn
          Caption = #31867#22411
          HeaderAlignmentHorz = taCenter
          Options.Editing = False
          Width = 127
        end
        object ColumnSize: TcxGridColumn
          Caption = #22823#23567
          DataBinding.ValueType = 'Integer'
          PropertiesClassName = 'TcxSpinEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = '#,##0'
          HeaderAlignmentHorz = taCenter
          Options.Editing = False
          Width = 127
        end
        object ColumnTime: TcxGridColumn
          Caption = #20462#25913#26102#38388
          DataBinding.ValueType = 'DateTime'
          PropertiesClassName = 'TcxDateEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = 'YYYY-MM-DD hh:mm:ss'
          HeaderAlignmentHorz = taCenter
          Options.Editing = False
          Width = 205
        end
        object ColumnAttr: TcxGridColumn
          Caption = #23646#24615
          DataBinding.ValueType = 'Integer'
          Visible = False
          HeaderAlignmentHorz = taCenter
          Options.Editing = False
          Width = 153
        end
      end
      object cxGridLevel1: TcxGridLevel
        GridView = FileTable
      end
    end
    object dxLayoutControl1Group_Root: TdxLayoutGroup
      AlignHorz = ahClient
      AlignVert = avClient
      ButtonOptions.Buttons = <>
      Hidden = True
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = -1
    end
    object dxLayoutControl1Item1: TdxLayoutItem
      AlignHorz = ahLeft
      AlignVert = avClient
      CaptionOptions.Text = #30446#24405
      CaptionOptions.Layout = clTop
      Parent = dxLayoutControl1Group_Root
      Control = FolderTree
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutControl1Item2: TdxLayoutItem
      AlignHorz = ahClient
      AlignVert = avClient
      CaptionOptions.Text = #25991#20214#21015#34920
      CaptionOptions.Layout = clTop
      Parent = dxLayoutControl1Group_Root
      Control = cxGrid
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutControl1SplitterItem1: TdxLayoutSplitterItem
      CaptionOptions.Text = 'Splitter'
      Parent = dxLayoutControl1Group_Root
      SizeOptions.AssignedValues = [sovSizableHorz, sovSizableVert]
      SizeOptions.SizableHorz = False
      SizeOptions.SizableVert = False
      Index = 1
    end
  end
  object OpenDialog: TOpenDialog
    Left = 352
    Top = 120
  end
end
