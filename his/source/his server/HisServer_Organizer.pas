unit HisServer_Organizer;

{
  HIS后台组织者

  Written by caowm (remobjects@qq.com)
  2014年10月
}

interface

uses
  Classes,
  SysUtils,
  Menus,
  Variants,
  App_Common,
  App_FastReport,
  App_DAServer,
  IdeaService_Impl,
  HisServer_Const,
  HisServer_Classes,
  HisService_System_Backend,
  HisService_Base_Backend,
  HisService_Dict_Backend,
  HisService_Clinic_Backend,
  HisService_Hosp_Backend,
  HisService_Medicine_Backend,
  HisService_Stat_Backend,
  HisService_Extend_Backend,
  HisService_YB_Backend,
  HisService_XNH_Backend;

function RefreshSchemaOperation(Sender: TBaseOperation; CommandID: Integer;
  const Param: array of Variant): Variant;

implementation

function RefreshSchemaOperation(Sender: TBaseOperation; CommandID: Integer;
  const Param: array of Variant): Variant;
begin
  TBaseBackend(Sender.Data).RefreshSchema;
end;

{ 打开当前视图定义的报表设计器 }

function DesignReport(Sender: TBaseOperation; AID: Integer;
  const AParam: array of Variant): Variant;
begin
  FastReport.DesignReport('');
end;

function MaintainServer(Sender: TBaseOperation; AID: Integer;
  const AParam: array of Variant): Variant;
const
  MaintainHint: array [Boolean] of string = ('服务器退出维护状态，可以正常使用！',
    '服务器已进入维护状态，用户不可使用！');
begin
  RemoteServer.Maintaining := not RemoteServer.Maintaining;
  AppCore.Logger.Write(MaintainHint[RemoteServer.Maintaining], mtInfo, 0);
  Sender.Checked := RemoteServer.Maintaining;
end;

procedure InitServer();
begin
  AppCore.ID := sAppID;
  AppCore.Version := sAppVer;

  // 动态加载数据服务
  IdeaManager.RegisterServices('Idea.xml');

  with TViewOperation.Create(sOperationIDLogger) do
  begin
    Category := sOperationCategoryFile;
    Caption := '运行记录';
    ImageName := sImageLogger;
    Order := 'S01';
    Flag := iOperationFlag_NoTree; // 不显示在操作树种
    ShortKey := ShortCut(WORD('L'), [ssCtrl]);
    ViewClass := TLogView;
  end;

//  with TProcOperation.Create(sOperationIDReport) do
//  begin
//    Category := sOperationCategoryFile;
//    Caption := '设计报表';
//    ImageName := sOperationIDReport;
//    Order := 's011';
//    Flag := iOperationFlag_NoTree;
//    ShortKey := ShortCut(Ord('R'), [ssCtrl]);
//    OnExecute := DesignReport;
//  end;

  with TProcOperation.Create(sOperationIDReport) do
  begin
    Category := sOperationCategoryFile;
    Caption := '维护状态';
    Order := 's012';
    Flag := iOperationFlag_NoTree;
    OnExecute := MaintainServer;
  end;

  with TProcOperation.Create(sOperationIDRefreshSchemaSystem) do
  begin
    Category := sOperationCategoryData;
    Caption := '重载系统服务Schema';
    ImageName := sImageSchema;
    Order := 'S20';
    Flag := iOperationFlag_NoTree;
    OnExecute := RefreshSchemaOperation;
    Data := SystemBackend;
  end;

  with TProcOperation.Create(sOperationIDRefreshSchemaBase) do
  begin
    Category := sOperationCategoryData;
    Caption := '重载基础服务Schema';
    ImageName := sImageSchema;
    Order := 'S21';
    Flag := iOperationFlag_NoTree;
    OnExecute := RefreshSchemaOperation;
    Data := BaseDataBackend;
  end;

  with TProcOperation.Create(sOperationIDRefreshSchemaDict) do
  begin
    Category := sOperationCategoryData;
    Caption := '重载字典服务Schema';
    ImageName := sImageSchema;
    Order := 'S21';
    Flag := iOperationFlag_NoTree;
    OnExecute := RefreshSchemaOperation;
    Data := DictBackend;
  end;

  with TProcOperation.Create(sOperationIDRefreshSchemaClinic) do
  begin
    Category := sOperationCategoryData;
    Caption := '重载门诊服务Schema';
    ImageName := sImageSchema;
    Order := 'S22';
    Flag := iOperationFlag_NoTree;
    OnExecute := RefreshSchemaOperation;
    Data := ClinicBackend;
  end;

  with TProcOperation.Create(sOperationIDRefreshSchemaHosp) do
  begin
    Category := sOperationCategoryData;
    Caption := '重载住院服务Schema';
    ImageName := sImageSchema;
    Order := 'S23';
    Flag := iOperationFlag_NoTree;
    OnExecute := RefreshSchemaOperation;
    Data := HospBackend;
  end;

  with TProcOperation.Create(sOperationIDRefreshSchemaMedicine) do
  begin
    Category := sOperationCategoryData;
    Caption := '重载药品服务Schema';
    ImageName := sImageSchema;
    Order := 'S24';
    Flag := iOperationFlag_NoTree;
    OnExecute := RefreshSchemaOperation;
    Data := MedicineBackend;
  end;

  with TProcOperation.Create(sOperationIDRefreshSchemaYB) do
  begin
    Category := sOperationCategoryData;
    Caption := '重载医保服务Schema';
    ImageName := sImageSchema;
    Order := 'S25';
    Flag := iOperationFlag_NoTree;
    OnExecute := RefreshSchemaOperation;
    Data := YBBackend;
  end;

  with TProcOperation.Create(sOperationIDRefreshSchemaXNH) do
  begin
    Category := sOperationCategoryData;
    Caption := '重载新农合服务Schema';
    ImageName := sImageSchema;
    Order := 'S26';
    Flag := iOperationFlag_NoTree;
    OnExecute := RefreshSchemaOperation;
    Data := XNHBackend;
  end;

  with TProcOperation.Create(sOperationIDRefreshSchemaStat) do
  begin
    Category := sOperationCategoryData;
    Caption := '重载统计服务Schema';
    ImageName := sImageSchema;
    Order := 'S27';
    Flag := iOperationFlag_NoTree;
    OnExecute := RefreshSchemaOperation;
    Data := StatBackend;
  end;

  with TProcOperation.Create(sOperationIDRefreshSchemaExtend) do
  begin
    Category := sOperationCategoryData;
    Caption := '重载扩展服务Schema';
    ImageName := sImageSchema;
    Order := 'S28';
    Flag := iOperationFlag_NoTree;
    OnExecute := RefreshSchemaOperation;
    Data := ExtendBackend;
  end;

end;

initialization

InitServer;

end.
