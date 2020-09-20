unit App_DevOptions;

{
  DevExpress样式配置

  Written by caowm (remobjects@qq.com)
  2014年9月
}

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
  Menus,
  StdCtrls,
  App_Common,
  App_DevExpress,
  dxLayoutControl,
  dxLayoutContainer,
  cxControls,
  cxButtons,
  cxContainer,
  cxEdit,
  cxTextEdit,
  cxGraphics,
  cxCheckBox,
  cxMaskEdit,
  cxDropDownEdit,
  cxFontNameComboBox,
  cxColorComboBox,
  cxLookAndFeelPainters,
  dxLayoutcxEditAdapters,
  cxLookAndFeels,
  dxLayoutControlAdapters, cxClasses;

type

  TOptionSetForm = class(TBaseView)
    LayoutGroup_Root: TdxLayoutGroup;
    Layout: TdxLayoutControl;
    StyleCombo: TcxComboBox;
    LayoutItem4: TdxLayoutItem;
    SizeCombo: TcxComboBox;
    LayoutItem1: TdxLayoutItem;
    FontNameCombo: TcxFontNameComboBox;
    LayoutItem5: TdxLayoutItem;
    ColorCombo: TcxColorComboBox;
    LayoutItem6: TdxLayoutItem;
    SkinCombo: TcxComboBox;
    LayoutItem7: TdxLayoutItem;
    LayoutGroup1: TdxLayoutGroup;
    cxButton1: TcxButton;
    LayoutItem2: TdxLayoutItem;
    procedure FormCreate(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
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
  DevExpress.SetSkinIndex(SkinCombo.ItemIndex);
  DevExpress.GridStyle := StyleCombo.ItemIndex - 1;

  DevExpress.EditStyleController.Style.Font.Size := SizeCombo.ItemIndex + 8;
  DevExpress.EditStyleController.Style.Font.Name := FontNameCombo.Text;
  DevExpress.EditStyleController.Style.Font.Color := ColorCombo.ColorValue;

  AppCore.MainView.Font.Size := SizeCombo.ItemIndex + 8;
  AppCore.MainView.Font.Name := FontNameCombo.Text;
  AppCore.MainView.Font.Color := ColorCombo.ColorValue;
end;

procedure TOptionSetForm.DoShowView;
begin
  DevExpress.FillSkinNames(SkinCombo.Properties.Items);
  SkinCombo.ItemIndex := DevExpress.GetSkinIndex;

  StyleCombo.ItemIndex := DevExpress.GridStyle + 1;
  SizeCombo.ItemIndex := AppCore.MainView.Font.Size - 8;
  FontNameCombo.Text := AppCore.MainView.Font.Name;
  ColorCombo.ColorValue := AppCore.MainView.Font.Color;
end;

procedure TOptionSetForm.FormCreate(Sender: TObject);
begin
  Layout.LayoutLookAndFeel := DevExpress.dxLayoutPage;
end;

procedure TOptionSetForm.cxButton1Click(Sender: TObject);
begin
  DoHideView;
end;


end.

