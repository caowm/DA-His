unit UpdateServer_Organizer;

{
  服务器配置方法：
    在服务器AppStore目录下为每个可升级的App建立一个子目录，目录名称是App的ID
}

interface

uses Classes,
  SysUtils,
  Menus,
  Forms,
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

uses
  FileService_ServerBackend;


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
  // 注册软件升级目录
  FileServiceManager.RegisterLogicalName('AppStore', AppCore.AppPath + 'AppStore');
end;

initialization
  OrganizeOperations();

end.

