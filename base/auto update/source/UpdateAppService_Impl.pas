unit UpdateAppService_Impl;

{
  智能升级服务接口
  曹伟民 (remobjects@qq.com)
}

{$I RemObjects.inc}

interface

uses
  {vcl:} Classes, SysUtils, 
  {RemObjects:} uROXMLIntf, uROClientIntf, uROTypes, uROServer, uROServerIntf, uROSessions,
  {Required:} uRORemoteDataModule,
  {Generated:} UpdateAppLib_Intf;

type
  { TUpdateAppService }
  TUpdateAppService = class(TRORemoteDataModule, IUpdateAppService, IRODispatchNotifier)
  private
    FClientAddress: string;
  protected
    procedure GetDispatchInfo(const aTransport : IROTransport; const aMessage : IROMessage);
    { IUpdateAppService methods }
    function GetUpdateInfo(const AppInfo: string): string;
  end;

implementation

{$IFDEF DELPHIXE2UP}
{%CLASSGROUP 'System.Classes.TPersistent'}
{$ENDIF}

{$IFNDEF FPC}
  {$R *.dfm}
{$ELSE}
  {$R *.lfm}
{$ENDIF}
uses
  {Generated:} UpdateAppLib_Invk, App_Common;

procedure Create_UpdateAppService(out anInstance : IUnknown);
begin
  anInstance := TUpdateAppService.Create(nil);
end;

{ UpdateAppService }
procedure TUpdateAppService.GetDispatchInfo(const aTransport: IROTransport;
  const aMessage: IROMessage);
begin
  FClientAddress := (aTransport as IROTCPTransport).ClientAddress;
end;

function TUpdateAppService.GetUpdateInfo(const AppInfo: string): string;
var
  RequestInfo: TStrings;
  ResultInfo: TStrings;
begin    
  RequestInfo := TStringList.Create;
  ResultInfo := TStringList.Create;
  try
    RequestInfo.Text := AppInfo;
    AppCore.Logger.WriteFmt('%s %s 正在升级...', [FClientAddress, RequestInfo.Values['AppID']], mtInfo, 0);
    ResultInfo.Add('DownloadPath=AppStore\' + RequestInfo.Values['AppID']);
    // todo：添加最新版本信息：读AppStore\AppVer.ini文件
    
    Result := ResultInfo.Text;
  finally
    RequestInfo.Free;
    ResultInfo.Free;
  end;  
end;

var
  fClassFactory: IROClassFactory;
initialization
  fClassFactory := TROClassFactory.Create('UpdateAppService', {$IFDEF FPC}@{$ENDIF}Create_UpdateAppService, TUpdateAppService_Invoker);
  // RegisterForZeroConf(fClassFactory,'_UpdateAppService_rosdk._tcp.');

finalization
  UnRegisterClassFactory(fClassFactory);
  fClassFactory := nil;

end.
