object DevOperationTree: TDevOperationTree
  Left = 470
  Top = 172
  BorderStyle = bsNone
  Caption = #25805#20316#30446#24405
  ClientHeight = 451
  ClientWidth = 262
  Color = clBtnFace
  ParentFont = True
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object OperationTree: TcxTreeList
    Left = 0
    Top = 0
    Width = 262
    Height = 451
    Align = alClient
    Bands = <
      item
      end>
    Navigator.Buttons.CustomButtons = <>
    OptionsData.Editing = False
    OptionsData.Deleting = False
    OptionsSelection.InvertSelect = False
    OptionsView.ColumnAutoWidth = True
    OptionsView.DynamicIndent = True
    OptionsView.Headers = False
    Preview.Visible = True
    TabOrder = 0
    OnContextPopup = OperationTreeContextPopup
    OnCustomDrawDataCell = OperationTreeCustomDrawDataCell
    OnDblClick = OperationTreeDblClick
    OnFocusedNodeChanged = OperationTreeFocusedNodeChanged
    OnKeyPress = OperationTreeKeyPress
    object cxTreeList1Column1: TcxTreeListColumn
      Caption.Text = #25805#20316#30446#24405
      DataBinding.ValueType = 'String'
      Width = 100
      Position.ColIndex = 0
      Position.RowIndex = 0
      Position.BandIndex = 0
      Summary.FooterSummaryItems = <>
      Summary.GroupFooterSummaryItems = <>
    end
  end
end
