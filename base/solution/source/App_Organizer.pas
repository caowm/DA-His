unit App_Organizer;

interface

uses Classes, SysUtils, Menus, App_Common;


const
  // operation category 操作类别
  socSys = '系统';
  socData = '数据';
  socView = '视图';

  // operation ID
  soidHome = 'home';
  soidLogger = 'logger';
  soidFileClient = 'file';

type

  TLogView = class(TBaseView)
  protected
    function DoExecute(CommandID: Integer; const Param: array of Variant): Variant; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy(); override;
  end;

implementation

uses App_RemoteClient;


{ TLogView }

constructor TLogView.Create(AOwner: TComponent);
begin
  CreateNew(AOwner);
end;

destructor TLogView.Destroy;
begin
  AppCore.Logger.Hide;
  inherited;
end;

function TLogView.DoExecute(CommandID: Integer;
  const Param: array of Variant): Variant;
begin
  Result := inherited DoExecute(CommandID, Param);
  AppCore.Logger.Show(Self);
end;

procedure OrganizeOperations();
begin
  {
  TViewOperation.Create(soidLogger, '运行记录', 'S02', socSys, soidLogger,
    0, ShortCut(WORD('L'), [ssCtrl]), TLogView);
  }
end;
          
procedure InitApp();
begin
  OrganizeOperations();
end;

initialization
  InitApp();

end.
