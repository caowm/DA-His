unit FileClient_Organizer;

interface

uses
  Classes,
  SysUtils,
  Menus,

  dxCore,
     
  uROSOAPMessage,
  uROXmlRpcMessage,
  uROIndyHTTPChannel,
  uROIndyTCPChannel,
  uROSuperTCPChannel,

  dxSkinsdxBarPainter,
  dxSkinsdxStatusBarPainter,
  dxSkinBlue, 
  dxSkinDarkSide,
  dxSkinLilian,

  App_Common,
  App_DevOptions,
  App_Dev_Toolbar;

const
  // operation category 业务类别
  socSys = '系统';
  socData = '数据';
  socView = '视图';
  socFile = '文件';

  // operation ID  业务ID
  soidHome = 'home';
  soidLogger = 'logger';
  soidFileClient = 'file';
  soidOption = 'option';

  // 图片名称
  sinPreferences = 'preferences';

implementation

uses FileClient_MainForm;

procedure OrganizeOperations();
begin
  with TViewOperation.Create(soidFileClient) do
  begin
    Category := socSys;
    Caption := '文件管理';
    ImageName :=soidFileClient;
    Order := 'S01';
    ShortKey := ShortCut(WORD('F'), [ssCtrl]);
    ViewClass := TFileClientForm;
  end;
  with TViewOperation.Create(soidLogger) do
  begin
    Category := socSys;
    Caption := '运行记录';
    ImageName :=soidLogger;
    Order := 'S02';
    ShortKey := ShortCut(WORD('L'), [ssCtrl]);
    ViewClass := TLogView;
  end;
  with TViewOperation.Create(soidOption) do
  begin
    Category := socSys;
    Caption := '界面设置';
    ImageName :=sinPreferences;
    Order := 'S03';
    ViewClass := TOptionSetForm;
  end;
end;

procedure InitApp();
begin
  OrganizeOperations;
end;

initialization
  InitApp();

end.

