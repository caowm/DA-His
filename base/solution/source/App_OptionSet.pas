unit App_OptionSet;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  StdCtrls,                               
  App_Common,
  App_DevExpress,
  dxLayoutControl,
  dxLayoutContainer,
  cxControls,
  cxContainer,
  cxEdit,
  cxTextEdit,
  cxGraphics,
  cxCheckBox,
  cxMaskEdit,
  cxDropDownEdit,
  cxFontNameComboBox,
  cxColorComboBox,
  cxLookAndFeels,
  cxLookAndFeelPainters,
  dxLayoutcxEditAdapters;

type

  TOptionSetForm = class(TBaseView)
    dxLayoutControl1Group_Root: TdxLayoutGroup;
    dxLayoutControl1: TdxLayoutControl;
    LookKindCombo: TcxComboBox;
    dxLayoutControl1Item2: TdxLayoutItem;
    NativeCheckBox: TcxCheckBox;
    dxLayoutControl1Item3: TdxLayoutItem;
    StyleCombo: TcxComboBox;
    dxLayoutControl1Item4: TdxLayoutItem;
    SizeCombo: TcxComboBox;
    dxLayoutControl1Item1: TdxLayoutItem;
    FontNameCombo: TcxFontNameComboBox;
    dxLayoutControl1Item5: TdxLayoutItem;
    ColorCombo: TcxColorComboBox;
    dxLayoutControl1Item6: TdxLayoutItem;
  private
  public
    procedure DoShowView(); override;
    procedure DoHideView(); override;
  end;

var
  OptionSetForm: TOptionSetForm;

implementation

{$R *.dfm}

{ TOptionSetForm }

procedure TOptionSetForm.DoHideView;
begin
  DevExpress.cxLookAndFeel.Kind := TcxLookAndFeelKind(LookKindCombo.ItemIndex);
  DevExpress.cxLookAndFeel.NativeStyle := NativeCheckBox.Checked;
  DevExpress.GridStyle := StyleCombo.ItemIndex - 1;
  //DevExpress.dxLayoutFeel.LookAndFeel.Kind := DevExpress.cxLookAndFeel.Kind;
  //DevExpress.dxLayoutFeel.LookAndFeel.NativeStyle := DevExpress.cxLookAndFeel.NativeStyle;
  DevExpress.EditStyleController.Style.Font.Size := SizeCombo.ItemIndex + 8;
  DevExpress.EditStyleController.Style.Font.Name := FontNameCombo.Text;
  DevExpress.EditStyleController.Style.Font.Color := ColorCombo.ColorValue;

  AppCore.MainView.Font.Size := SizeCombo.ItemIndex + 8;
  AppCore.MainView.Font.Name := FontNameCombo.Text;
  AppCore.MainView.Font.Color := ColorCombo.ColorValue;

end;

procedure TOptionSetForm.DoShowView;
begin
  LookKindCombo.ItemIndex := Integer(DevExpress.cxLookAndFeel.Kind);
  NativeCheckBox.Checked := DevExpress.cxLookAndFeel.NativeStyle;
  StyleCombo.ItemIndex := DevExpress.GridStyle + 1;
  SizeCombo.ItemIndex := AppCore.MainView.Font.Size - 8;
  FontNameCombo.Text := AppCore.MainView.Font.Name;
  ColorCombo.ColorValue := AppCore.MainView.Font.Color;
end;

end.

