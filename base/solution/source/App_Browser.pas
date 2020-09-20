unit App_Browser;

interface

{
  项目开头加上uROCOMInit单元后，会报错：
    Could not obtain OLE control window handle.
  why?
  
}


uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, ActnList,
  Dialogs, App_Common, StdCtrls, ExtCtrls, OleCtrls, SHDocVw, Menus;

const
  BrowserID = '{E37A6898-3793-42FE-BE77-F9E59B54DB12}';

type
  TBrowserForm = class(TBaseView)
    Browser: TWebBrowser;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    FActions: TActionList;
    procedure DoRefresh(Sender: TObject);
  protected
    function GetActionList(): TActionList; override;
    function DoExecute(CommandID: Integer; const Param: array of Variant): Variant; override;
  public
    { Public declarations }
  end;

  THelpOperation = class(TBaseOperation)
  private
    FFileName: string;
  protected
    function DoExecute(CommandID: Integer; const Param: array of Variant): Variant; override;
  public
    constructor Create(const AID, ACaption, AOrder, ACategory, AImageName: string;
      const AFileName: string; AOwner: TOperations = nil); reintroduce;
  end;


implementation

{$R *.dfm}

var
  HelpView: TBrowserForm;

{ TWebBrowserForm }

function TBrowserForm.DoExecute(CommandID: Integer;
  const Param: array of Variant): Variant;
begin
  Result := inherited DoExecute(CommandID, Param);

  if Length(Param) > 0 then
    Browser.Navigate(AppCore.AppPath + 'help\' + Param[0]);
end;

function TBrowserForm.GetActionList: TActionList;
begin
  Result := FActions;
end;

procedure TBrowserForm.FormCreate(Sender: TObject);
begin
  FActions := TActionList.Create(Self);
  FActions.Images := AppCore.LargeImage.ImageList;
  with TAction.Create(Self) do
  begin
    Caption := '刷新';
    ActionList := FActions;
    OnExecute := DoRefresh;
    ShortCut := Menus.ShortCut(VK_F5, []);
    ImageIndex := AppCore.LargeImage.IndexOf('refresh');
  end;
end;
 
procedure TBrowserForm.DoRefresh(Sender: TObject);
begin
  Browser.Refresh;
end;

{ THelpOperation }

constructor THelpOperation.Create(const AID, ACaption, AOrder, ACategory,
  AImageName, AFileName: string; AOwner: TOperations);
begin
  inherited Create(AID, ACaption, AOrder, ACategory, AImageName, 0, 0);
  FFileName := AFileName;
end;

function THelpOperation.DoExecute(CommandID: Integer;
  const Param: array of Variant): Variant;
begin
  if HelpView = nil then
    HelpView := TBrowserForm.Create(Application);
  HelpView.FOperation := Self;
  HelpView.Caption := Caption;
  HelpView.DoExecute(0, [FFileName]);
end;


procedure TBrowserForm.FormDestroy(Sender: TObject);
begin
  HelpView := nil;
end;

initialization
  THelpOperation.Create('Help01', '内容', 'Z0', '帮助', '', 'main.htm');
  THelpOperation.Create('Help02', '关于', 'Z1', '帮助', '', 'about.htm');

end.
