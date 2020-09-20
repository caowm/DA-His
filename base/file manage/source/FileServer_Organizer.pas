unit FileServer_Organizer;

interface

uses Classes,
  SysUtils,
  Menus,
  App_Common;

const
  // operation category 操作类别
  socSys = '系统';
  socData = '数据';
  socView = '视图';

  // operation ID
  soidHome = 'home';
  soidLogger = 'logger';

implementation

procedure OrganizeOperations();
begin
  with TViewOperation.Create(soidLogger) do
  begin
    Category := socSys;
    Caption := '运行记录';
    ImageName := soidLogger;
    Order := 'S02';
    ShortKey := ShortCut(WORD('L'), [ssCtrl]);
    ViewClass := TLogView;
  end;
end;

initialization
  OrganizeOperations();

end.

