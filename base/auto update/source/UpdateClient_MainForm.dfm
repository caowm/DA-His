object UpdateClientMainForm: TUpdateClientMainForm
  Left = 385
  Top = 105
  Width = 618
  Height = 451
  Color = clBtnFace
  Constraints.MinHeight = 400
  Constraints.MinWidth = 500
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  DesignSize = (
    602
    413)
  PixelsPerInch = 96
  TextHeight = 14
  object DownButton: TButton
    Left = 490
    Top = 376
    Width = 99
    Height = 29
    Anchors = [akRight, akBottom]
    Caption = #24320#22987#21319#32423
    TabOrder = 0
    OnClick = DownButtonClick
  end
  object PageControl1: TPageControl
    Left = 8
    Top = 8
    Width = 586
    Height = 361
    ActivePage = TabSheet1
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = #24120#35268
      DesignSize = (
        578
        332)
      object Label1: TLabel
        Left = 6
        Top = 11
        Width = 40
        Height = 14
        Caption = #36719#20214'ID:'
      end
      object Label2: TLabel
        Left = 6
        Top = 69
        Width = 52
        Height = 14
        Caption = #19979#36733#22320#22336':'
      end
      object Label3: TLabel
        Left = 6
        Top = 41
        Width = 52
        Height = 14
        Caption = #36719#20214#30446#24405':'
      end
      object AppIDEdit: TEdit
        Left = 82
        Top = 8
        Width = 489
        Height = 22
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
      end
      object ServerEdit: TEdit
        Left = 82
        Top = 66
        Width = 491
        Height = 22
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
      end
      object AppPathEdit: TEdit
        Left = 82
        Top = 38
        Width = 491
        Height = 22
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
      end
      object ProgressBar: TProgressBar
        Left = 5
        Top = 93
        Width = 568
        Height = 17
        Anchors = [akLeft, akTop, akRight]
        Smooth = True
        TabOrder = 3
      end
      object LogMemo: TMemo
        Left = 5
        Top = 117
        Width = 568
        Height = 211
        Anchors = [akLeft, akTop, akRight, akBottom]
        Lines.Strings = (
          #25552#31034#65306#21319#32423#21069#35831#20808#20851#38381#36719#20214'!')
        ReadOnly = True
        ScrollBars = ssBoth
        TabOrder = 4
        WordWrap = False
      end
    end
  end
  object AllCheckBox: TCheckBox
    Left = 16
    Top = 379
    Width = 97
    Height = 17
    Anchors = [akLeft, akBottom]
    Caption = #24378#21046#26356#26032
    TabOrder = 2
  end
  object CancelButton: TButton
    Left = 386
    Top = 376
    Width = 99
    Height = 29
    Anchors = [akRight, akBottom]
    Caption = #20851#38381
    TabOrder = 3
    OnClick = CancelButtonClick
  end
  object XPManifest1: TXPManifest
    Left = 196
    Top = 8
  end
end
