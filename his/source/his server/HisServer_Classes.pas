unit HisServer_Classes;

{
  HIS后台基础类库

  Written by caowm (remobjects@qq.com)
  2014年10月
}

interface

uses
  SysUtils,
  Classes,
  Variants,
  SyncObjs,
  uROXMLIntf,
  uROClientIntf,
  uROTypes,
  uROServer,
  uROServerIntf,
  uROSessions,
  uRORemoteDataModule,
  uDADataStreamer,
  uDAInterfaces,
  DataAbstractService_Impl,
  DataAbstract4_Intf,
  uDASchema,
  uROClient,
  App_Common,
  App_DAServer,
  HisServer_Const;

type

  {
     服务器后台基础支持类

     1 在多线程并发访问Schema的情况下, 高效实现动态加载Schema
     2 DataStreamer目前统一
  }
  TBaseBackend = class(TDataModule)
  private
    FSchemaCritical: TCriticalSection;
    FSchemaUpdating: Boolean;
    FDAStreamer: TDADataStreamer;
  protected
    function InternalGetSchema(): TDASchema; virtual; abstract;
    function GetSchemaFileName(): string; virtual; abstract;
  public
    destructor Destroy(); override;
    function GetSchema(): TDASchema; virtual;
    function GetDAStreamer(): TDADataStreamer;
    procedure RefreshSchema(AIsFirstTime: Boolean = False);
    procedure AfterConstruction(); override;
  end;

implementation

{$R *.dfm}

{ TBaseBackend }

procedure TBaseBackend.AfterConstruction;
begin
  inherited;
  FSchemaCritical := TCriticalSection.Create;
  FDAStreamer := RemoteServer.NewDAStreamer(Self);
  RefreshSchema(True);
end;

destructor TBaseBackend.Destroy;
begin
  FreeAndNil(FSchemaCritical);
  inherited;
end;

{ 考虑在多线程访问的并发问题 }
function TBaseBackend.GetDAStreamer: TDADataStreamer;
begin
  Result := FDAStreamer;
end;

function TBaseBackend.GetSchema: TDASchema;
begin
  if FSchemaUpdating then
  begin
    try
      // 等待Schema更新完毕
      FSchemaCritical.Enter;
    finally
      FSchemaCritical.Leave;
    end;
  end;
  Result := InternalGetSchema;
end;

{ 重新加载Schema }

procedure TBaseBackend.RefreshSchema(AIsFirstTime: Boolean);
var
  SchemaFileName: string;
begin
  FSchemaCritical.Enter;
  FSchemaUpdating := True;
  try
    // 等待所有处理完成，时间越长故障概率越低
    // 所有的DataService必须通过GetSchema来获取Schema，这样可保证在Schema更新
    // 期间不会出现故障
    if not AIsFirstTime then
      Sleep(iWaitTimeBeforeUpdateSchema);

    InternalGetSchema.Clear;
    SchemaFileName := AppCore.BinPath + GetSchemaFileName;
    if FileExists(SchemaFileName) then
    begin
      try
        InternalGetSchema.LoadFromFile(SchemaFileName);
        AppCore.Logger.Write(SchemaFileName + '重载完成.', mtInfo, 0);
      except
        on E: Exception do
          AppCore.Logger.Write('系统服务Schema加载失败，原因：' + E.Message, mtError, 0);
      end;
    end
    else
      AppCore.Logger.WriteFmt('%s系统服务文件未找到', [SchemaFileName], mtError, 0);
  finally
    FSchemaCritical.Leave;
    FSchemaUpdating := False;
  end; 
end;

end.
