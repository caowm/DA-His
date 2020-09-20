unit IMPORT_App_Common;
interface
uses
  Windows,
  Classes,
  SysUtils,
  Graphics,
  Controls,
  Forms,
  Messages,
  Variants,
  Contnrs,
  IniFiles,
  ImgList,
  Jpeg,
  Types,
  Menus,
  cxGraphics,
  dxGDIPlusClasses,
  ExtCtrls,
  StdCtrls,
  SyncObjs,
  ActnList,
  App_Common,
  PaxCompiler,
  PaxRegister;
procedure RegisterIMPORT_App_Common;
implementation
function TFileImageList_GetImageList(Self:TFileImageList):TcxImageList;
begin
  result := Self.ImageList;
end;
function TFileImageList_GetDisabledImages(Self:TFileImageList):TcxImageList;
begin
  result := Self.DisabledImages;
end;
function TFileImageList_GetImagePath(Self:TFileImageList):string;
begin
  result := Self.ImagePath;
end;
function TFileImageList_GetImageNames(Self:TFileImageList):TStrings;
begin
  result := Self.ImageNames;
end;
function TFileImageList_GetDefaultIndex(Self:TFileImageList):Integer;
begin
  result := Self.DefaultIndex;
end;
function TLogInfo_GetTime(Self:TLogInfo):TDateTime;
begin
  result := Self.Time;
end;
procedure TLogInfo_PutTime(Self:TLogInfo;const Value: TDateTime);
begin
  Self.Time := Value;
end;
function TLogInfo_GetLogType(Self:TLogInfo):TLogType;
begin
  result := Self.LogType;
end;
procedure TLogInfo_PutLogType(Self:TLogInfo;const Value: TLogType);
begin
  Self.LogType := Value;
end;
function TLogInfo_GetCode(Self:TLogInfo):Integer;
begin
  result := Self.Code;
end;
procedure TLogInfo_PutCode(Self:TLogInfo;const Value: Integer);
begin
  Self.Code := Value;
end;
function TLogInfo_GetText(Self:TLogInfo):string;
begin
  result := Self.Text;
end;
procedure TLogInfo_PutText(Self:TLogInfo;const Value: string);
begin
  Self.Text := Value;
end;
function TLogger_GetEnabled(Self:TLogger):Boolean;
begin
  result := Self.Enabled;
end;
procedure TLogger_PutEnabled(Self:TLogger;const Value: Boolean);
begin
  Self.Enabled := Value;
end;
function TLogger_GetRewrite(Self:TLogger):Boolean;
begin
  result := Self.Rewrite;
end;
procedure TLogger_PutRewrite(Self:TLogger;const Value: Boolean);
begin
  Self.Rewrite := Value;
end;
function TLogger_GetLogLevel(Self:TLogger):Integer;
begin
  result := Self.LogLevel;
end;
procedure TLogger_PutLogLevel(Self:TLogger;const Value: Integer);
begin
  Self.LogLevel := Value;
end;
function TLogger_GetMaxCount(Self:TLogger):Integer;
begin
  result := Self.MaxCount;
end;
procedure TLogger_PutMaxCount(Self:TLogger;const Value: Integer);
begin
  Self.MaxCount := Value;
end;
function TLogger_GetLogSubject(Self:TLogger):TSubject;
begin
  result := Self.LogSubject;
end;
function TLogger_GetLogList(Self:TLogger):TStrings;
begin
  result := Self.LogList;
end;
function TLogger_GetLogCriticalSection(Self:TLogger):TCriticalSection;
begin
  result := Self.LogCriticalSection;
end;
function TLogger_GetTime(Self:TLogger):TDateTime;
begin
  result := Self.Time;
end;
function TLogger_GetLogType(Self:TLogger):TLogType;
begin
  result := Self.LogType;
end;
function TLogger_GetCode(Self:TLogger):Integer;
begin
  result := Self.Code;
end;
function TLogger_GetText(Self:TLogger):string;
begin
  result := Self.Text;
end;
function TBaseView_GetFreeOnClose(Self:TBaseView):Boolean;
begin
  result := Self.FreeOnClose;
end;
function TBaseView_GetOperation(Self:TBaseView):TBaseOperation;
begin
  result := Self.Operation;
end;
procedure TBaseView_PutOperation(Self:TBaseView;const Value: TBaseOperation);
begin
  Self.Operation := Value;
end;
function TBaseView_GetViewActions(Self:TBaseView):TActionList;
begin
  result := Self.ViewActions;
end;
procedure TBaseView_PutViewActions(Self:TBaseView;const Value: TActionList);
begin
  Self.ViewActions := Value;
end;
function TBaseView_GetImageName(Self:TBaseView):string;
begin
  result := Self.ImageName;
end;
function TBaseView_GetHelpContent(Self:TBaseView):string;
begin
  result := Self.HelpContent;
end;
procedure TBaseView_PutHelpContent(Self:TBaseView;const Value: string);
begin
  Self.HelpContent := Value;
end;
function TBaseView_GetState(Self:TBaseView):TViewState;
begin
  result := Self.State;
end;
procedure TBaseView_PutState(Self:TBaseView;const Value: TViewState);
begin
  Self.State := Value;
end;
function TBaseViewPluginManager_GetPluginContainer(Self:TBaseViewPluginManager):TBaseView;
begin
  result := Self.PluginContainer;
end;
procedure TBaseViewPluginManager_PutPluginContainer(Self:TBaseViewPluginManager;const Value: TBaseView);
begin
  Self.PluginContainer := Value;
end;
function TBaseViewPluginManager_GetPluginFlag(Self:TBaseViewPluginManager):Integer;
begin
  result := Self.PluginFlag;
end;
procedure TBaseViewPluginManager_PutPluginFlag(Self:TBaseViewPluginManager;const Value: Integer);
begin
  Self.PluginFlag := Value;
end;
function TBaseViewPluginManager_GetPluginList(Self:TBaseViewPluginManager):TList;
begin
  result := Self.PluginList;
end;
function TBaseViewPluginManager_GetDefaultOperation(Self:TBaseViewPluginManager):TBaseOperation;
begin
  result := Self.DefaultOperation;
end;
function TMainView_GetMainMenu(Self:TMainView):TMainMenu;
begin
  result := Self.MainMenu;
end;
function TMainView_GetActionList(Self:TMainView):TActionList;
begin
  result := Self.ActionList;
end;
function TMainView_GetViewCount(Self:TMainView):Integer;
begin
  result := Self.ViewCount;
end;
function TMainView_GetActiveView(Self:TMainView):TBaseView;
begin
  result := Self.ActiveView;
end;
function TMainView_GetViewSubject(Self:TMainView):TSubject;
begin
  result := Self.ViewSubject;
end;
function TOperationAction_GetOperation(Self:TOperationAction):TBaseOperation;
begin
  result := Self.Operation;
end;
procedure TOperationAction_PutOperation(Self:TOperationAction;const Value: TBaseOperation);
begin
  Self.Operation := Value;
end;
function TOperationAction_GetNotifySender(Self:TOperationAction):TObject;
begin
  result := Self.NotifySender;
end;
procedure TOperationAction_PutNotifySender(Self:TOperationAction;const Value: TObject);
begin
  Self.NotifySender := Value;
end;
function TBaseOperation_GetGUID(Self:TBaseOperation):string;
begin
  result := Self.GUID;
end;
function TBaseOperation_GetEnabled(Self:TBaseOperation):Boolean;
begin
  result := Self.Enabled;
end;
procedure TBaseOperation_PutEnabled(Self:TBaseOperation;const Value: Boolean);
begin
  Self.Enabled := Value;
end;
function TBaseOperation_GetCaption(Self:TBaseOperation):string;
begin
  result := Self.Caption;
end;
procedure TBaseOperation_PutCaption(Self:TBaseOperation;const Value: string);
begin
  Self.Caption := Value;
end;
function TBaseOperation_GetHint(Self:TBaseOperation):string;
begin
  result := Self.Hint;
end;
procedure TBaseOperation_PutHint(Self:TBaseOperation;const Value: string);
begin
  Self.Hint := Value;
end;
function TBaseOperation_GetChecked(Self:TBaseOperation):Boolean;
begin
  result := Self.Checked;
end;
procedure TBaseOperation_PutChecked(Self:TBaseOperation;const Value: Boolean);
begin
  Self.Checked := Value;
end;
function TBaseOperation_GetVisible(Self:TBaseOperation):Boolean;
begin
  result := Self.Visible;
end;
procedure TBaseOperation_PutVisible(Self:TBaseOperation;const Value: Boolean);
begin
  Self.Visible := Value;
end;
function TBaseOperation_GetCategory(Self:TBaseOperation):string;
begin
  result := Self.Category;
end;
procedure TBaseOperation_PutCategory(Self:TBaseOperation;const Value: string);
begin
  Self.Category := Value;
end;
function TBaseOperation_GetImageName(Self:TBaseOperation):string;
begin
  result := Self.ImageName;
end;
procedure TBaseOperation_PutImageName(Self:TBaseOperation;const Value: string);
begin
  Self.ImageName := Value;
end;
function TBaseOperation_GetOrder(Self:TBaseOperation):string;
begin
  result := Self.Order;
end;
procedure TBaseOperation_PutOrder(Self:TBaseOperation;const Value: string);
begin
  Self.Order := Value;
end;
function TBaseOperation_GetShortKey(Self:TBaseOperation):TShortCut;
begin
  result := Self.ShortKey;
end;
procedure TBaseOperation_PutShortKey(Self:TBaseOperation;const Value: TShortCut);
begin
  Self.ShortKey := Value;
end;
function TBaseOperation_GetFlag(Self:TBaseOperation):Integer;
begin
  result := Self.Flag;
end;
procedure TBaseOperation_PutFlag(Self:TBaseOperation;const Value: Integer);
begin
  Self.Flag := Value;
end;
function TBaseOperation_GetAccess(Self:TBaseOperation):string;
begin
  result := Self.Access;
end;
procedure TBaseOperation_PutAccess(Self:TBaseOperation;const Value: string);
begin
  Self.Access := Value;
end;
function TBaseOperation_GetData(Self:TBaseOperation):TObject;
begin
  result := Self.Data;
end;
procedure TBaseOperation_PutData(Self:TBaseOperation;const Value: TObject);
begin
  Self.Data := Value;
end;
function TBaseOperation_GetClicks(Self:TBaseOperation):Integer;
begin
  result := Self.Clicks;
end;
procedure TBaseOperation_PutClicks(Self:TBaseOperation;const Value: Integer);
begin
  Self.Clicks := Value;
end;
function TBaseOperation_GetOwner(Self:TBaseOperation):TOperations;
begin
  result := Self.Owner;
end;
procedure TBaseOperation_PutOwner(Self:TBaseOperation;const Value: TOperations);
begin
  Self.Owner := Value;
end;
function TBaseOperation_GetCustomAttributes(Self:TBaseOperation):TStrings;
begin
  result := Self.CustomAttributes;
end;
function TBaseOperation_GetState(Self:TBaseOperation):TOperationState;
begin
  result := Self.State;
end;
procedure TBaseOperation_PutState(Self:TBaseOperation;const Value: TOperationState);
begin
  Self.State := Value;
end;
function TBaseOperation_GetActions(Self:TBaseOperation):TActionList;
begin
  result := Self.Actions;
end;
function TViewOperation_GetView(Self:TViewOperation):TBaseView;
begin
  result := Self.View;
end;
function TViewOperation_GetViewClass(Self:TViewOperation):TBaseViewClass;
begin
  result := Self.ViewClass;
end;
procedure TViewOperation_PutViewClass(Self:TViewOperation;const Value: TBaseViewClass);
begin
  Self.ViewClass := Value;
end;
function TOperations_GetBeforeExecute(Self:TOperations):TSubject;
begin
  result := Self.BeforeExecute;
end;
function TOperations_GetAfterExecute(Self:TOperations):TSubject;
begin
  result := Self.AfterExecute;
end;
function TOperations_GetOperationChanged(Self:TOperations):TSubject;
begin
  result := Self.OperationChanged;
end;
function TOperations_GetCount(Self:TOperations):Integer;
begin
  result := Self.Count;
end;
function TOperations_GetItems(Self:TOperations;Index: Integer):TBaseOperation;
begin
  result := Self.Items[Index];
end;
procedure TOperations_PutItems(Self:TOperations;Index: Integer;const Value: TBaseOperation);
begin
  Self.Items[Index] := Value;
end;
function TBaseUser_GetIsLogined(Self:TBaseUser):Boolean;
begin
  result := Self.IsLogined;
end;
procedure TBaseUser_PutIsLogined(Self:TBaseUser;const Value: Boolean);
begin
  Self.IsLogined := Value;
end;
function TBaseUser_GetID(Self:TBaseUser):string;
begin
  result := Self.ID;
end;
procedure TBaseUser_PutID(Self:TBaseUser;const Value: string);
begin
  Self.ID := Value;
end;
function TBaseUser_GetName(Self:TBaseUser):string;
begin
  result := Self.Name;
end;
procedure TBaseUser_PutName(Self:TBaseUser;const Value: string);
begin
  Self.Name := Value;
end;
function TBaseUser_GetPassword(Self:TBaseUser):string;
begin
  result := Self.Password;
end;
procedure TBaseUser_PutPassword(Self:TBaseUser;const Value: string);
begin
  Self.Password := Value;
end;
function TBaseUser_GetIsAdmin(Self:TBaseUser):Boolean;
begin
  result := Self.IsAdmin;
end;
procedure TBaseUser_PutIsAdmin(Self:TBaseUser;const Value: Boolean);
begin
  Self.IsAdmin := Value;
end;
function TBaseUser_GetOfficeID(Self:TBaseUser):string;
begin
  result := Self.OfficeID;
end;
procedure TBaseUser_PutOfficeID(Self:TBaseUser;const Value: string);
begin
  Self.OfficeID := Value;
end;
function TBaseUser_GetOfficeName(Self:TBaseUser):string;
begin
  result := Self.OfficeName;
end;
procedure TBaseUser_PutOfficeName(Self:TBaseUser;const Value: string);
begin
  Self.OfficeName := Value;
end;
function TBaseUser_GetLoginSubject(Self:TBaseUser):TSubject;
begin
  result := Self.LoginSubject;
end;
function TAppCore_GetID(Self:TAppCore):string;
begin
  result := Self.ID;
end;
procedure TAppCore_PutID(Self:TAppCore;const Value: string);
begin
  Self.ID := Value;
end;
function TAppCore_GetVersion(Self:TAppCore):string;
begin
  result := Self.Version;
end;
procedure TAppCore_PutVersion(Self:TAppCore;const Value: string);
begin
  Self.Version := Value;
end;
function TAppCore_GetExeName(Self:TAppCore):string;
begin
  result := Self.ExeName;
end;
function TAppCore_GetLogFileName(Self:TAppCore):string;
begin
  result := Self.LogFileName;
end;
function TAppCore_GetAppPath(Self:TAppCore):string;
begin
  result := Self.AppPath;
end;
function TAppCore_GetBinPath(Self:TAppCore):string;
begin
  result := Self.BinPath;
end;
function TAppCore_GetDataPath(Self:TAppCore):string;
begin
  result := Self.DataPath;
end;
function TAppCore_GetImagePath(Self:TAppCore):string;
begin
  result := Self.ImagePath;
end;
function TAppCore_GetTempPath(Self:TAppCore):string;
begin
  result := Self.TempPath;
end;
function TAppCore_GetOperations(Self:TAppCore):TOperations;
begin
  result := Self.Operations;
end;
function TAppCore_GetFunctions(Self:TAppCore):TFunctionContainer;
begin
  result := Self.Functions;
end;
function TAppCore_GetIniFile(Self:TAppCore):TIniFile;
begin
  result := Self.IniFile;
end;
function TAppCore_GetConfig(Self:TAppCore):TIniFile;
begin
  result := Self.Config;
end;
function TAppCore_GetUserIni(Self:TAppCore):TIniFile;
begin
  result := Self.UserIni;
end;
function TAppCore_GetMainView(Self:TAppCore):TMainView;
begin
  result := Self.MainView;
end;
procedure TAppCore_PutMainView(Self:TAppCore;const Value: TMainView);
begin
  Self.MainView := Value;
end;
function TAppCore_GetSmallImage(Self:TAppCore):TFileImageList;
begin
  result := Self.SmallImage;
end;
function TAppCore_GetLargeImage(Self:TAppCore):TFileImageList;
begin
  result := Self.LargeImage;
end;
function TAppCore_GetToolBarImage(Self:TAppCore):TFileImageList;
begin
  result := Self.ToolBarImage;
end;
procedure TAppCore_PutToolBarImage(Self:TAppCore;const Value: TFileImageList);
begin
  Self.ToolBarImage := Value;
end;
function TAppCore_GetImageCenter(Self:TAppCore):TImageCenter;
begin
  result := Self.ImageCenter;
end;
function TAppCore_GetLogger(Self:TAppCore):TLogger;
begin
  result := Self.Logger;
end;
function TAppCore_GetState(Self:TAppCore):TAppState;
begin
  result := Self.State;
end;
procedure TAppCore_PutState(Self:TAppCore;const Value: TAppState);
begin
  Self.State := Value;
end;
function TAppCore_GetStateSubject(Self:TAppCore):TSubject;
begin
  result := Self.StateSubject;
end;
function TAppCore_GetUser(Self:TAppCore):TBaseUser;
begin
  result := Self.User;
end;
procedure TAppCore_PutUser(Self:TAppCore;const Value: TBaseUser);
begin
  Self.User := Value;
end;
procedure RegisterIMPORT_App_Common;
var G, H: Integer;
begin
  H := RegisterNamespace(0, 'App_Common');
  RegisterConstant(H, 'sAppCommonVersion', '0.9');
  RegisterConstant(H, 'sRootImageName', 'root');
  RegisterConstant(H, 'sFolderImageName', 'folder');
  RegisterConstant(H, 'sDefaultImageName', 'default');
  RegisterConstant(H, 'sAppSection', 'Application');
  RegisterConstant(H, 'iOperationFlag_NoMenu', $0001);
  RegisterConstant(H, 'iOperationFlag_NoTree', $0002);
  RegisterConstant(H, 'iOperationFlag_Start', $0004);
  RegisterConstant(H, 'iOperationCommand_Default', 0);
  RegisterConstant(H, 'iOperationCommand_Start', 1);
  RegisterConstant(H, 'iOperationCommand_Clear', 2);
  RegisterConstant(H, 'iOperationCommand_Notify', 3);
  RegisterConstant(H, 'iOperationCommand_PluginControl', 4);
  RegisterConstant(H, 'iOperationCommand_Custom', 255);
  RegisterConstant(H, 'BTN_SHOWCAPTION', $0001);
  RegisterConstant(H, 'BTN_NOTFLAT', $0002);
  RegisterConstant(H, 'BTN_CANBEFOCUSED', $0004);
  RegisterConstant(H, 'BTN_NOTTRANSPARENT', $0008);
  RegisterConstant(H, 'BTN_NOPOPUPMENU', $0010);
  RegisterConstant(H, 'BTN_NOTOOLBAR', $0020);
  RegisterConstant(H, 'iFunctionID_UpdateApp', 1);
  RegisterConstant(H, 'sMessageSuccess', '²Ù×÷³É¹¦.');
  // Begin of class TObserver
  G := RegisterClassType(H, TObserver);
  RegisterHeader(G, 
       'constructor Create(OnUpdate: TNotifyEvent);',
       @TObserver.Create);
  RegisterHeader(G, 
       'destructor Destroy(); override;',
       @TObserver.Destroy);
  // End of class TObserver
  // Begin of class TSubject
  G := RegisterClassType(H, TSubject);
  RegisterHeader(G, 
       'constructor Create();',
       @TSubject.Create);
  RegisterHeader(G, 
       'destructor Destroy; override;',
       @TSubject.Destroy);
  RegisterHeader(G, 
       'procedure Attach(Observer: TObserver);',
       @TSubject.Attach);
  RegisterHeader(G, 
       'procedure Detach(Observer: TObserver);',
       @TSubject.Detach);
  RegisterHeader(G, 
       'procedure Notify(Sender: TObject); virtual;',
       @TSubject.Notify);
  // End of class TSubject
  // Begin of class TFileImageList
  G := RegisterClassType(H, TFileImageList);
  RegisterHeader(G, 
       'constructor Create(AOwner: TComponent; const AImagePath, AImageNamePostfix,      ADefaultImageName: string; AImageWidth, AImageHeight: Integer);',
       @TFileImageList.Create);
  RegisterHeader(G, 
       'destructor Destroy(); override;',
       @TFileImageList.Destroy);
  RegisterHeader(G, 
       'function IndexOf(const AImageName: string): Integer;',
       @TFileImageList.IndexOf);
  RegisterFakeHeader(G, 
       'function TFileImageList_GetImageList:TcxImageList;',
       @TFileImageList_GetImageList);
  RegisterProperty(G, 
       'property ImageList:TcxImageList read TFileImageList_GetImageList;');
  RegisterFakeHeader(G, 
       'function TFileImageList_GetDisabledImages:TcxImageList;',
       @TFileImageList_GetDisabledImages);
  RegisterProperty(G, 
       'property DisabledImages:TcxImageList read TFileImageList_GetDisabledImages;');
  RegisterFakeHeader(G, 
       'function TFileImageList_GetImagePath:string;',
       @TFileImageList_GetImagePath);
  RegisterProperty(G, 
       'property ImagePath:string read TFileImageList_GetImagePath;');
  RegisterFakeHeader(G, 
       'function TFileImageList_GetImageNames:TStrings;',
       @TFileImageList_GetImageNames);
  RegisterProperty(G, 
       'property ImageNames:TStrings read TFileImageList_GetImageNames;');
  RegisterFakeHeader(G, 
       'function TFileImageList_GetDefaultIndex:Integer;',
       @TFileImageList_GetDefaultIndex);
  RegisterProperty(G, 
       'property DefaultIndex:Integer read TFileImageList_GetDefaultIndex;');
  // End of class TFileImageList
  // Begin of class TImageCenter
  G := RegisterClassType(H, TImageCenter);
  RegisterHeader(G, 
       'constructor Create(const AImagePath: string);',
       @TImageCenter.Create);
  RegisterHeader(G, 
       'destructor Destroy(); override;',
       @TImageCenter.Destroy);
  RegisterHeader(G, 
       'function Get(const AImageName: string): TPicture;',
       @TImageCenter.Get);
  RegisterHeader(G, 
       'function GetBitmap(const AImageName: string): TBitmap;',
       @TImageCenter.GetBitmap);
  // End of class TImageCenter
  RegisterRTTIType(H, TypeInfo(TLogType));
  // Begin of class TLogInfo
  G := RegisterClassType(H, TLogInfo);
  RegisterHeader(G, 
       'procedure Assign(Source: TPersistent); override;',
       @TLogInfo.Assign);
  RegisterHeader(G, 
       'function AddRef(): Integer;',
       @TLogInfo.AddRef);
  RegisterHeader(G, 
       'function ReleaseRef(): Integer;',
       @TLogInfo.ReleaseRef);
  RegisterFakeHeader(G, 
       'function TLogInfo_GetTime:TDateTime;',
       @TLogInfo_GetTime);
  RegisterFakeHeader(G, 
       'procedure TLogInfo_PutTime(const Value: TDateTime);',
       @TLogInfo_PutTime);
  RegisterProperty(G, 
       'property Time:TDateTime read TLogInfo_GetTime write TLogInfo_PutTime;');
  RegisterFakeHeader(G, 
       'function TLogInfo_GetLogType:TLogType;',
       @TLogInfo_GetLogType);
  RegisterFakeHeader(G, 
       'procedure TLogInfo_PutLogType(const Value: TLogType);',
       @TLogInfo_PutLogType);
  RegisterProperty(G, 
       'property LogType:TLogType read TLogInfo_GetLogType write TLogInfo_PutLogType;');
  RegisterFakeHeader(G, 
       'function TLogInfo_GetCode:Integer;',
       @TLogInfo_GetCode);
  RegisterFakeHeader(G, 
       'procedure TLogInfo_PutCode(const Value: Integer);',
       @TLogInfo_PutCode);
  RegisterProperty(G, 
       'property Code:Integer read TLogInfo_GetCode write TLogInfo_PutCode;');
  RegisterFakeHeader(G, 
       'function TLogInfo_GetText:string;',
       @TLogInfo_GetText);
  RegisterFakeHeader(G, 
       'procedure TLogInfo_PutText(const Value: string);',
       @TLogInfo_PutText);
  RegisterProperty(G, 
       'property Text:string read TLogInfo_GetText write TLogInfo_PutText;');
  RegisterHeader(G,
       'constructor Create;',
       @TLogInfo.Create);
  // End of class TLogInfo
  // Begin of class TLogger
  G := RegisterClassType(H, TLogger);
  RegisterHeader(G, 
       'constructor Create();',
       @TLogger.Create);
  RegisterHeader(G, 
       'destructor Destroy(); override;',
       @TLogger.Destroy);
  RegisterHeader(G, 
       'procedure LoadState(AIniFile: TIniFile);',
       @TLogger.LoadState);
  RegisterHeader(G, 
       'procedure SaveState(AIniFile: TIniFile);',
       @TLogger.SaveState);
  RegisterHeader(G, 
       'procedure SaveLog(const AFileName: string);',
       @TLogger.SaveLog);
  RegisterHeader(G, 
       'procedure Write(AValue: Variant; AType: TLogType; ACode: Integer);',
       @TLogger.Write);
  RegisterHeader(G, 
       'procedure WriteFmt(const AFormat: string; AValues: array of const; AType: TLogType; ACode: Integer);',
       @TLogger.WriteFmt);
  RegisterFakeHeader(G, 
       'function TLogger_GetEnabled:Boolean;',
       @TLogger_GetEnabled);
  RegisterFakeHeader(G, 
       'procedure TLogger_PutEnabled(const Value: Boolean);',
       @TLogger_PutEnabled);
  RegisterProperty(G, 
       'property Enabled:Boolean read TLogger_GetEnabled write TLogger_PutEnabled;');
  RegisterFakeHeader(G, 
       'function TLogger_GetRewrite:Boolean;',
       @TLogger_GetRewrite);
  RegisterFakeHeader(G, 
       'procedure TLogger_PutRewrite(const Value: Boolean);',
       @TLogger_PutRewrite);
  RegisterProperty(G, 
       'property Rewrite:Boolean read TLogger_GetRewrite write TLogger_PutRewrite;');
  RegisterFakeHeader(G, 
       'function TLogger_GetLogLevel:Integer;',
       @TLogger_GetLogLevel);
  RegisterFakeHeader(G, 
       'procedure TLogger_PutLogLevel(const Value: Integer);',
       @TLogger_PutLogLevel);
  RegisterProperty(G, 
       'property LogLevel:Integer read TLogger_GetLogLevel write TLogger_PutLogLevel;');
  RegisterFakeHeader(G, 
       'function TLogger_GetMaxCount:Integer;',
       @TLogger_GetMaxCount);
  RegisterFakeHeader(G, 
       'procedure TLogger_PutMaxCount(const Value: Integer);',
       @TLogger_PutMaxCount);
  RegisterProperty(G, 
       'property MaxCount:Integer read TLogger_GetMaxCount write TLogger_PutMaxCount;');
  RegisterFakeHeader(G, 
       'function TLogger_GetLogSubject:TSubject;',
       @TLogger_GetLogSubject);
  RegisterProperty(G, 
       'property LogSubject:TSubject read TLogger_GetLogSubject;');
  RegisterFakeHeader(G, 
       'function TLogger_GetLogList:TStrings;',
       @TLogger_GetLogList);
  RegisterProperty(G, 
       'property LogList:TStrings read TLogger_GetLogList;');
  RegisterFakeHeader(G, 
       'function TLogger_GetLogCriticalSection:TCriticalSection;',
       @TLogger_GetLogCriticalSection);
  RegisterProperty(G, 
       'property LogCriticalSection:TCriticalSection read TLogger_GetLogCriticalSection;');
  RegisterFakeHeader(G, 
       'function TLogger_GetTime:TDateTime;',
       @TLogger_GetTime);
  RegisterProperty(G, 
       'property Time:TDateTime read TLogger_GetTime;');
  RegisterFakeHeader(G, 
       'function TLogger_GetLogType:TLogType;',
       @TLogger_GetLogType);
  RegisterProperty(G, 
       'property LogType:TLogType read TLogger_GetLogType;');
  RegisterFakeHeader(G, 
       'function TLogger_GetCode:Integer;',
       @TLogger_GetCode);
  RegisterProperty(G, 
       'property Code:Integer read TLogger_GetCode;');
  RegisterFakeHeader(G, 
       'function TLogger_GetText:string;',
       @TLogger_GetText);
  RegisterProperty(G, 
       'property Text:string read TLogger_GetText;');
  // End of class TLogger
  RegisterRTTIType(H, TypeInfo(TOperationState));
  RegisterRTTIType(H, TypeInfo(TViewState));
  // Begin of class TBaseView
  G := RegisterClassType(H, TBaseView);
  RegisterHeader(G, 
       'constructor Create(AOwner: TComponent); override;',
       @TBaseView.Create);
  RegisterHeader(G, 
       'destructor Destroy(); override;',
       @TBaseView.Destroy);
  RegisterHeader(G, 
       'function DoExecute(CommandID: Integer; const Param: array of Variant): Variant; virtual;',
       @TBaseView.DoExecute);
  RegisterHeader(G, 
       'function BuildAction(ACaption, AImageName, AHint: string;      AOnUpdate, AOnExecute: TNotifyEvent; AShortCut: TShortCut;      ATag: Integer): TAction;',
       @TBaseView.BuildAction);
  RegisterFakeHeader(G, 
       'function TBaseView_GetFreeOnClose:Boolean;',
       @TBaseView_GetFreeOnClose);
  RegisterProperty(G, 
       'property FreeOnClose:Boolean read TBaseView_GetFreeOnClose;');
  RegisterFakeHeader(G, 
       'function TBaseView_GetOperation:TBaseOperation;',
       @TBaseView_GetOperation);
  RegisterFakeHeader(G, 
       'procedure TBaseView_PutOperation(const Value: TBaseOperation);',
       @TBaseView_PutOperation);
  RegisterProperty(G, 
       'property Operation:TBaseOperation read TBaseView_GetOperation write TBaseView_PutOperation;');
  RegisterFakeHeader(G, 
       'function TBaseView_GetViewActions:TActionList;',
       @TBaseView_GetViewActions);
  RegisterFakeHeader(G, 
       'procedure TBaseView_PutViewActions(const Value: TActionList);',
       @TBaseView_PutViewActions);
  RegisterProperty(G, 
       'property ViewActions:TActionList read TBaseView_GetViewActions write TBaseView_PutViewActions;');
  RegisterFakeHeader(G, 
       'function TBaseView_GetImageName:string;',
       @TBaseView_GetImageName);
  RegisterProperty(G, 
       'property ImageName:string read TBaseView_GetImageName;');
  RegisterFakeHeader(G, 
       'function TBaseView_GetHelpContent:string;',
       @TBaseView_GetHelpContent);
  RegisterFakeHeader(G, 
       'procedure TBaseView_PutHelpContent(const Value: string);',
       @TBaseView_PutHelpContent);
  RegisterProperty(G, 
       'property HelpContent:string read TBaseView_GetHelpContent write TBaseView_PutHelpContent;');
  RegisterFakeHeader(G, 
       'function TBaseView_GetState:TViewState;',
       @TBaseView_GetState);
  RegisterFakeHeader(G, 
       'procedure TBaseView_PutState(const Value: TViewState);',
       @TBaseView_PutState);
  RegisterProperty(G, 
       'property State:TViewState read TBaseView_GetState write TBaseView_PutState;');
  // End of class TBaseView
  // Begin of class TBaseViewPluginManager
  G := RegisterClassType(H, TBaseViewPluginManager);
  RegisterHeader(G, 
       'constructor Create(AOwner: TComponent); override;',
       @TBaseViewPluginManager.Create);
  RegisterHeader(G, 
       'destructor Destroy(); override;',
       @TBaseViewPluginManager.Destroy);
  RegisterHeader(G, 
       'procedure PluginOperations(AOperations: TOperations);',
       @TBaseViewPluginManager.PluginOperations);
  RegisterHeader(G, 
       'procedure PluginOperation(AOperation: TBaseOperation); virtual;',
       @TBaseViewPluginManager.PluginOperation);
  RegisterHeader(G, 
       'procedure ForEach(AEnumProc: TOperationEnumProc);',
       @TBaseViewPluginManager.ForEach);
  RegisterFakeHeader(G, 
       'function TBaseViewPluginManager_GetPluginContainer:TBaseView;',
       @TBaseViewPluginManager_GetPluginContainer);
  RegisterFakeHeader(G, 
       'procedure TBaseViewPluginManager_PutPluginContainer(const Value: TBaseView);',
       @TBaseViewPluginManager_PutPluginContainer);
  RegisterProperty(G, 
       'property PluginContainer:TBaseView read TBaseViewPluginManager_GetPluginContainer write TBaseViewPluginManager_PutPluginContainer;');
  RegisterFakeHeader(G, 
       'function TBaseViewPluginManager_GetPluginFlag:Integer;',
       @TBaseViewPluginManager_GetPluginFlag);
  RegisterFakeHeader(G, 
       'procedure TBaseViewPluginManager_PutPluginFlag(const Value: Integer);',
       @TBaseViewPluginManager_PutPluginFlag);
  RegisterProperty(G, 
       'property PluginFlag:Integer read TBaseViewPluginManager_GetPluginFlag write TBaseViewPluginManager_PutPluginFlag;');
  RegisterFakeHeader(G, 
       'function TBaseViewPluginManager_GetPluginList:TList;',
       @TBaseViewPluginManager_GetPluginList);
  RegisterProperty(G, 
       'property PluginList:TList read TBaseViewPluginManager_GetPluginList;');
  RegisterFakeHeader(G, 
       'function TBaseViewPluginManager_GetDefaultOperation:TBaseOperation;',
       @TBaseViewPluginManager_GetDefaultOperation);
  RegisterProperty(G, 
       'property DefaultOperation:TBaseOperation read TBaseViewPluginManager_GetDefaultOperation;');
  // End of class TBaseViewPluginManager
  // Begin of class TLogView
  G := RegisterClassType(H, TLogView);
  RegisterHeader(G, 
       'constructor Create(AOwner: TComponent); override;',
       @TLogView.Create);
  RegisterHeader(G, 
       'destructor Destroy(); override;',
       @TLogView.Destroy);
  // End of class TLogView
  RegisterRTTIType(H, TypeInfo(TMainSide));
  // Begin of class TMainView
  G := RegisterClassType(H, TMainView);
  RegisterHeader(G, 
       'procedure ShowView(View: TBaseView); virtual;',
       @TMainView.ShowView);
  RegisterHeader(G, 
       'procedure CloseView(); virtual;',
       @TMainView.CloseView);
  RegisterHeader(G, 
       'procedure PreviousView(); virtual;',
       @TMainView.PreviousView);
  RegisterHeader(G, 
       'procedure NextView(); virtual;',
       @TMainView.NextView);
  RegisterHeader(G, 
       'procedure HideAllView(); virtual;',
       @TMainView.HideAllView);
  RegisterFakeHeader(G, 
       'function TMainView_GetMainMenu:TMainMenu;',
       @TMainView_GetMainMenu);
  RegisterProperty(G, 
       'property MainMenu:TMainMenu read TMainView_GetMainMenu;');
  RegisterFakeHeader(G, 
       'function TMainView_GetActionList:TActionList;',
       @TMainView_GetActionList);
  RegisterProperty(G, 
       'property ActionList:TActionList read TMainView_GetActionList;');
  RegisterFakeHeader(G, 
       'function TMainView_GetViewCount:Integer;',
       @TMainView_GetViewCount);
  RegisterProperty(G, 
       'property ViewCount:Integer read TMainView_GetViewCount;');
  RegisterFakeHeader(G, 
       'function TMainView_GetActiveView:TBaseView;',
       @TMainView_GetActiveView);
  RegisterProperty(G, 
       'property ActiveView:TBaseView read TMainView_GetActiveView;');
  RegisterFakeHeader(G, 
       'function TMainView_GetViewSubject:TSubject;',
       @TMainView_GetViewSubject);
  RegisterProperty(G, 
       'property ViewSubject:TSubject read TMainView_GetViewSubject;');
  RegisterHeader(G,
       'constructor Create(AOwner: TComponent); virtual;',
       @TMainView.Create);
  // End of class TMainView
  // Begin of class TOperationAction
  G := RegisterClassType(H, TOperationAction);
  RegisterFakeHeader(G, 
       'function TOperationAction_GetOperation:TBaseOperation;',
       @TOperationAction_GetOperation);
  RegisterFakeHeader(G, 
       'procedure TOperationAction_PutOperation(const Value: TBaseOperation);',
       @TOperationAction_PutOperation);
  RegisterProperty(G, 
       'property Operation:TBaseOperation read TOperationAction_GetOperation write TOperationAction_PutOperation;');
  RegisterFakeHeader(G, 
       'function TOperationAction_GetNotifySender:TObject;',
       @TOperationAction_GetNotifySender);
  RegisterFakeHeader(G, 
       'procedure TOperationAction_PutNotifySender(const Value: TObject);',
       @TOperationAction_PutNotifySender);
  RegisterProperty(G, 
       'property NotifySender:TObject read TOperationAction_GetNotifySender write TOperationAction_PutNotifySender;');
  RegisterHeader(G,
       'constructor Create(AOwner: TComponent); virtual;',
       @TOperationAction.Create);
  // End of class TOperationAction
  // Begin of class TBaseOperation
  G := RegisterClassType(H, TBaseOperation);
  RegisterHeader(G, 
       'constructor Create(const AID: string; AOwner: TOperations = nil); virtual;',
       @TBaseOperation.Create);
  RegisterHeader(G, 
       'destructor Destroy(); override;',
       @TBaseOperation.Destroy);
  RegisterHeader(G, 
       'function NewSeparator(const AID, ACategory, AOrder: string): TBaseOperation;',
       @TBaseOperation.NewSeparator);
  RegisterHeader(G, 
       'function BuildAction(const ACaption, AImageName: string; AOnUpdate,      AOnExecute: TNotifyEvent; ATag: Integer): TOperationAction;',
       @TBaseOperation.BuildAction);
  RegisterHeader(G, 
       'function GetOperationAction(AOwner: TBaseView): TOperationAction;',
       @TBaseOperation.GetOperationAction);
  RegisterHeader(G, 
       'procedure LoadState(AIniFile: TIniFile); virtual;',
       @TBaseOperation.LoadState);
  RegisterHeader(G, 
       'procedure SaveState(AIniFile: TIniFile); virtual;',
       @TBaseOperation.SaveState);
  RegisterHeader(G, 
       'function Execute(CommandID: Integer; const Param: array of Variant): Variant; virtual;',
       @TBaseOperation.Execute);
  RegisterFakeHeader(G, 
       'function TBaseOperation_GetGUID:string;',
       @TBaseOperation_GetGUID);
  RegisterProperty(G, 
       'property GUID:string read TBaseOperation_GetGUID;');
  RegisterFakeHeader(G, 
       'function TBaseOperation_GetEnabled:Boolean;',
       @TBaseOperation_GetEnabled);
  RegisterFakeHeader(G, 
       'procedure TBaseOperation_PutEnabled(const Value: Boolean);',
       @TBaseOperation_PutEnabled);
  RegisterProperty(G, 
       'property Enabled:Boolean read TBaseOperation_GetEnabled write TBaseOperation_PutEnabled;');
  RegisterFakeHeader(G, 
       'function TBaseOperation_GetCaption:string;',
       @TBaseOperation_GetCaption);
  RegisterFakeHeader(G, 
       'procedure TBaseOperation_PutCaption(const Value: string);',
       @TBaseOperation_PutCaption);
  RegisterProperty(G, 
       'property Caption:string read TBaseOperation_GetCaption write TBaseOperation_PutCaption;');
  RegisterFakeHeader(G, 
       'function TBaseOperation_GetHint:string;',
       @TBaseOperation_GetHint);
  RegisterFakeHeader(G, 
       'procedure TBaseOperation_PutHint(const Value: string);',
       @TBaseOperation_PutHint);
  RegisterProperty(G, 
       'property Hint:string read TBaseOperation_GetHint write TBaseOperation_PutHint;');
  RegisterFakeHeader(G, 
       'function TBaseOperation_GetChecked:Boolean;',
       @TBaseOperation_GetChecked);
  RegisterFakeHeader(G, 
       'procedure TBaseOperation_PutChecked(const Value: Boolean);',
       @TBaseOperation_PutChecked);
  RegisterProperty(G, 
       'property Checked:Boolean read TBaseOperation_GetChecked write TBaseOperation_PutChecked;');
  RegisterFakeHeader(G, 
       'function TBaseOperation_GetVisible:Boolean;',
       @TBaseOperation_GetVisible);
  RegisterFakeHeader(G, 
       'procedure TBaseOperation_PutVisible(const Value: Boolean);',
       @TBaseOperation_PutVisible);
  RegisterProperty(G, 
       'property Visible:Boolean read TBaseOperation_GetVisible write TBaseOperation_PutVisible;');
  RegisterFakeHeader(G, 
       'function TBaseOperation_GetCategory:string;',
       @TBaseOperation_GetCategory);
  RegisterFakeHeader(G, 
       'procedure TBaseOperation_PutCategory(const Value: string);',
       @TBaseOperation_PutCategory);
  RegisterProperty(G, 
       'property Category:string read TBaseOperation_GetCategory write TBaseOperation_PutCategory;');
  RegisterFakeHeader(G, 
       'function TBaseOperation_GetImageName:string;',
       @TBaseOperation_GetImageName);
  RegisterFakeHeader(G, 
       'procedure TBaseOperation_PutImageName(const Value: string);',
       @TBaseOperation_PutImageName);
  RegisterProperty(G, 
       'property ImageName:string read TBaseOperation_GetImageName write TBaseOperation_PutImageName;');
  RegisterFakeHeader(G, 
       'function TBaseOperation_GetOrder:string;',
       @TBaseOperation_GetOrder);
  RegisterFakeHeader(G, 
       'procedure TBaseOperation_PutOrder(const Value: string);',
       @TBaseOperation_PutOrder);
  RegisterProperty(G, 
       'property Order:string read TBaseOperation_GetOrder write TBaseOperation_PutOrder;');
  RegisterFakeHeader(G, 
       'function TBaseOperation_GetShortKey:TShortCut;',
       @TBaseOperation_GetShortKey);
  RegisterFakeHeader(G, 
       'procedure TBaseOperation_PutShortKey(const Value: TShortCut);',
       @TBaseOperation_PutShortKey);
  RegisterProperty(G, 
       'property ShortKey:TShortCut read TBaseOperation_GetShortKey write TBaseOperation_PutShortKey;');
  RegisterFakeHeader(G, 
       'function TBaseOperation_GetFlag:Integer;',
       @TBaseOperation_GetFlag);
  RegisterFakeHeader(G, 
       'procedure TBaseOperation_PutFlag(const Value: Integer);',
       @TBaseOperation_PutFlag);
  RegisterProperty(G, 
       'property Flag:Integer read TBaseOperation_GetFlag write TBaseOperation_PutFlag;');
  RegisterFakeHeader(G, 
       'function TBaseOperation_GetAccess:string;',
       @TBaseOperation_GetAccess);
  RegisterFakeHeader(G, 
       'procedure TBaseOperation_PutAccess(const Value: string);',
       @TBaseOperation_PutAccess);
  RegisterProperty(G, 
       'property Access:string read TBaseOperation_GetAccess write TBaseOperation_PutAccess;');
  RegisterFakeHeader(G, 
       'function TBaseOperation_GetData:TObject;',
       @TBaseOperation_GetData);
  RegisterFakeHeader(G, 
       'procedure TBaseOperation_PutData(const Value: TObject);',
       @TBaseOperation_PutData);
  RegisterProperty(G, 
       'property Data:TObject read TBaseOperation_GetData write TBaseOperation_PutData;');
  RegisterFakeHeader(G, 
       'function TBaseOperation_GetClicks:Integer;',
       @TBaseOperation_GetClicks);
  RegisterFakeHeader(G, 
       'procedure TBaseOperation_PutClicks(const Value: Integer);',
       @TBaseOperation_PutClicks);
  RegisterProperty(G, 
       'property Clicks:Integer read TBaseOperation_GetClicks write TBaseOperation_PutClicks;');
  RegisterFakeHeader(G, 
       'function TBaseOperation_GetOwner:TOperations;',
       @TBaseOperation_GetOwner);
  RegisterFakeHeader(G, 
       'procedure TBaseOperation_PutOwner(const Value: TOperations);',
       @TBaseOperation_PutOwner);
  RegisterProperty(G, 
       'property Owner:TOperations read TBaseOperation_GetOwner write TBaseOperation_PutOwner;');
  RegisterFakeHeader(G, 
       'function TBaseOperation_GetCustomAttributes:TStrings;',
       @TBaseOperation_GetCustomAttributes);
  RegisterProperty(G, 
       'property CustomAttributes:TStrings read TBaseOperation_GetCustomAttributes;');
  RegisterFakeHeader(G, 
       'function TBaseOperation_GetState:TOperationState;',
       @TBaseOperation_GetState);
  RegisterFakeHeader(G, 
       'procedure TBaseOperation_PutState(const Value: TOperationState);',
       @TBaseOperation_PutState);
  RegisterProperty(G, 
       'property State:TOperationState read TBaseOperation_GetState write TBaseOperation_PutState;');
  RegisterFakeHeader(G, 
       'function TBaseOperation_GetActions:TActionList;',
       @TBaseOperation_GetActions);
  RegisterProperty(G, 
       'property Actions:TActionList read TBaseOperation_GetActions;');
  // End of class TBaseOperation
  // Begin of class TProcOperation
  G := RegisterClassType(H, TProcOperation);
  RegisterHeader(G,
       'constructor Create(const AID: string; AOwner: TOperations = nil); virtual;',
       @TProcOperation.Create);
  // End of class TProcOperation
  // Begin of class TViewOperation
  G := RegisterClassType(H, TViewOperation);
  RegisterHeader(G, 
       'destructor Destroy(); override;',
       @TViewOperation.Destroy);
  RegisterFakeHeader(G, 
       'function TViewOperation_GetView:TBaseView;',
       @TViewOperation_GetView);
  RegisterProperty(G, 
       'property View:TBaseView read TViewOperation_GetView;');
  RegisterFakeHeader(G, 
       'function TViewOperation_GetViewClass:TBaseViewClass;',
       @TViewOperation_GetViewClass);
  RegisterFakeHeader(G, 
       'procedure TViewOperation_PutViewClass(const Value: TBaseViewClass);',
       @TViewOperation_PutViewClass);
  RegisterProperty(G, 
       'property ViewClass:TBaseViewClass read TViewOperation_GetViewClass write TViewOperation_PutViewClass;');
  RegisterHeader(G,
       'constructor Create(const AID: string; AOwner: TOperations = nil); virtual;',
       @TViewOperation.Create);
  // End of class TViewOperation
  // Begin of class TOperations
  G := RegisterClassType(H, TOperations);
  RegisterHeader(G, 
       'constructor Create();',
       @TOperations.Create);
  RegisterHeader(G, 
       'destructor Destroy(); override;',
       @TOperations.Destroy);
  RegisterHeader(G, 
       'procedure LoadOperation(AConfig: TIniFile); virtual;',
       @TOperations.LoadOperation);
  RegisterHeader(G, 
       'procedure SaveOperation(AConfig: TIniFile); virtual;',
       @TOperations.SaveOperation);
  RegisterHeader(G, 
       'procedure SortByClick();',
       @TOperations.SortByClick);
  RegisterHeader(G, 
       'procedure SortByOrder();',
       @TOperations.SortByOrder);
  RegisterHeader(G, 
       'procedure SortByCaption();',
       @TOperations.SortByCaption);
  RegisterHeader(G, 
       'procedure ForEach(AEnumProc: TOperationEnumProc);',
       @TOperations.ForEach);
  RegisterHeader(G, 
       'function SearchOperation(const OperationID: string): TBaseOperation;',
       @TOperations.SearchOperation);
  RegisterHeader(G, 
       'procedure StartOperation();',
       @TOperations.StartOperation);
  RegisterFakeHeader(G, 
       'function TOperations_GetBeforeExecute:TSubject;',
       @TOperations_GetBeforeExecute);
  RegisterProperty(G, 
       'property BeforeExecute:TSubject read TOperations_GetBeforeExecute;');
  RegisterFakeHeader(G, 
       'function TOperations_GetAfterExecute:TSubject;',
       @TOperations_GetAfterExecute);
  RegisterProperty(G, 
       'property AfterExecute:TSubject read TOperations_GetAfterExecute;');
  RegisterFakeHeader(G, 
       'function TOperations_GetOperationChanged:TSubject;',
       @TOperations_GetOperationChanged);
  RegisterProperty(G, 
       'property OperationChanged:TSubject read TOperations_GetOperationChanged;');
  RegisterFakeHeader(G, 
       'function TOperations_GetCount:Integer;',
       @TOperations_GetCount);
  RegisterProperty(G, 
       'property Count:Integer read TOperations_GetCount;');
  RegisterFakeHeader(G, 
       'function TOperations_GetItems(Index: Integer):TBaseOperation;',
       @TOperations_GetItems);
  RegisterFakeHeader(G, 
       'procedure TOperations_PutItems(Index: Integer;const Value: TBaseOperation);',
       @TOperations_PutItems);
  RegisterProperty(G, 
       'property Items[Index: Integer]:TBaseOperation read TOperations_GetItems write TOperations_PutItems;default;');
  // End of class TOperations
  // Begin of class TFunctionContainer
  G := RegisterClassType(H, TFunctionContainer);
  RegisterHeader(G, 
       'constructor Create();',
       @TFunctionContainer.Create);
  RegisterHeader(G, 
       'destructor Destroy(); override;',
       @TFunctionContainer.Destroy);
  RegisterHeader(G, 
       'procedure Register(AFunctionID: Integer; AFunction: TFunctionDefinition);',
       @TFunctionContainer.Register);
  RegisterHeader(G, 
       'function Execute(AFunctionID: Integer; const AParam: array of Variant): Variant;',
       @TFunctionContainer.Execute);
  // End of class TFunctionContainer
  // Begin of class TBaseUser
  G := RegisterClassType(H, TBaseUser);
  RegisterHeader(G, 
       'constructor Create(); virtual;',
       @TBaseUser.Create);
  RegisterHeader(G, 
       'destructor Destroy(); override;',
       @TBaseUser.Destroy);
  RegisterHeader(G, 
       'function DoLogin(const AUserID, APassword: string): Boolean; virtual;',
       @TBaseUser.DoLogin);
  RegisterHeader(G, 
       'function DoChangePassword(const AOldPassword, ANewPassword: string): Boolean; virtual;',
       @TBaseUser.DoChangePassword);
  RegisterHeader(G, 
       'procedure Logout(); virtual;',
       @TBaseUser.Logout);
  RegisterHeader(G, 
       'function HaveAccess(const AAccessID: string): Boolean; virtual;',
       @TBaseUser.HaveAccess);
  RegisterHeader(G, 
       'procedure CheckAccess(AAccessID: string); virtual;',
       @TBaseUser.CheckAccess);
  RegisterFakeHeader(G, 
       'function TBaseUser_GetIsLogined:Boolean;',
       @TBaseUser_GetIsLogined);
  RegisterFakeHeader(G, 
       'procedure TBaseUser_PutIsLogined(const Value: Boolean);',
       @TBaseUser_PutIsLogined);
  RegisterProperty(G, 
       'property IsLogined:Boolean read TBaseUser_GetIsLogined write TBaseUser_PutIsLogined;');
  RegisterFakeHeader(G, 
       'function TBaseUser_GetID:string;',
       @TBaseUser_GetID);
  RegisterFakeHeader(G, 
       'procedure TBaseUser_PutID(const Value: string);',
       @TBaseUser_PutID);
  RegisterProperty(G, 
       'property ID:string read TBaseUser_GetID write TBaseUser_PutID;');
  RegisterFakeHeader(G, 
       'function TBaseUser_GetName:string;',
       @TBaseUser_GetName);
  RegisterFakeHeader(G, 
       'procedure TBaseUser_PutName(const Value: string);',
       @TBaseUser_PutName);
  RegisterProperty(G, 
       'property Name:string read TBaseUser_GetName write TBaseUser_PutName;');
  RegisterFakeHeader(G, 
       'function TBaseUser_GetPassword:string;',
       @TBaseUser_GetPassword);
  RegisterFakeHeader(G, 
       'procedure TBaseUser_PutPassword(const Value: string);',
       @TBaseUser_PutPassword);
  RegisterProperty(G, 
       'property Password:string read TBaseUser_GetPassword write TBaseUser_PutPassword;');
  RegisterFakeHeader(G, 
       'function TBaseUser_GetIsAdmin:Boolean;',
       @TBaseUser_GetIsAdmin);
  RegisterFakeHeader(G, 
       'procedure TBaseUser_PutIsAdmin(const Value: Boolean);',
       @TBaseUser_PutIsAdmin);
  RegisterProperty(G, 
       'property IsAdmin:Boolean read TBaseUser_GetIsAdmin write TBaseUser_PutIsAdmin;');
  RegisterFakeHeader(G, 
       'function TBaseUser_GetOfficeID:string;',
       @TBaseUser_GetOfficeID);
  RegisterFakeHeader(G, 
       'procedure TBaseUser_PutOfficeID(const Value: string);',
       @TBaseUser_PutOfficeID);
  RegisterProperty(G, 
       'property OfficeID:string read TBaseUser_GetOfficeID write TBaseUser_PutOfficeID;');
  RegisterFakeHeader(G, 
       'function TBaseUser_GetOfficeName:string;',
       @TBaseUser_GetOfficeName);
  RegisterFakeHeader(G, 
       'procedure TBaseUser_PutOfficeName(const Value: string);',
       @TBaseUser_PutOfficeName);
  RegisterProperty(G, 
       'property OfficeName:string read TBaseUser_GetOfficeName write TBaseUser_PutOfficeName;');
  RegisterFakeHeader(G, 
       'function TBaseUser_GetLoginSubject:TSubject;',
       @TBaseUser_GetLoginSubject);
  RegisterProperty(G, 
       'property LoginSubject:TSubject read TBaseUser_GetLoginSubject;');
  // End of class TBaseUser
  RegisterRTTIType(H, TypeInfo(TAppState));
  // Begin of class TAppCore
  G := RegisterClassType(H, TAppCore);
  RegisterHeader(G, 
       'constructor Create(); virtual;',
       @TAppCore.Create);
  RegisterHeader(G, 
       'destructor Destroy(); override;',
       @TAppCore.Destroy);
  RegisterFakeHeader(G, 
       'function TAppCore_GetID:string;',
       @TAppCore_GetID);
  RegisterFakeHeader(G, 
       'procedure TAppCore_PutID(const Value: string);',
       @TAppCore_PutID);
  RegisterProperty(G, 
       'property ID:string read TAppCore_GetID write TAppCore_PutID;');
  RegisterFakeHeader(G, 
       'function TAppCore_GetVersion:string;',
       @TAppCore_GetVersion);
  RegisterFakeHeader(G, 
       'procedure TAppCore_PutVersion(const Value: string);',
       @TAppCore_PutVersion);
  RegisterProperty(G, 
       'property Version:string read TAppCore_GetVersion write TAppCore_PutVersion;');
  RegisterFakeHeader(G, 
       'function TAppCore_GetExeName:string;',
       @TAppCore_GetExeName);
  RegisterProperty(G, 
       'property ExeName:string read TAppCore_GetExeName;');
  RegisterFakeHeader(G, 
       'function TAppCore_GetLogFileName:string;',
       @TAppCore_GetLogFileName);
  RegisterProperty(G, 
       'property LogFileName:string read TAppCore_GetLogFileName;');
  RegisterFakeHeader(G, 
       'function TAppCore_GetAppPath:string;',
       @TAppCore_GetAppPath);
  RegisterProperty(G, 
       'property AppPath:string read TAppCore_GetAppPath;');
  RegisterFakeHeader(G, 
       'function TAppCore_GetBinPath:string;',
       @TAppCore_GetBinPath);
  RegisterProperty(G, 
       'property BinPath:string read TAppCore_GetBinPath;');
  RegisterFakeHeader(G, 
       'function TAppCore_GetDataPath:string;',
       @TAppCore_GetDataPath);
  RegisterProperty(G, 
       'property DataPath:string read TAppCore_GetDataPath;');
  RegisterFakeHeader(G, 
       'function TAppCore_GetImagePath:string;',
       @TAppCore_GetImagePath);
  RegisterProperty(G, 
       'property ImagePath:string read TAppCore_GetImagePath;');
  RegisterFakeHeader(G, 
       'function TAppCore_GetTempPath:string;',
       @TAppCore_GetTempPath);
  RegisterProperty(G, 
       'property TempPath:string read TAppCore_GetTempPath;');
  RegisterFakeHeader(G, 
       'function TAppCore_GetOperations:TOperations;',
       @TAppCore_GetOperations);
  RegisterProperty(G, 
       'property Operations:TOperations read TAppCore_GetOperations;');
  RegisterFakeHeader(G, 
       'function TAppCore_GetFunctions:TFunctionContainer;',
       @TAppCore_GetFunctions);
  RegisterProperty(G, 
       'property Functions:TFunctionContainer read TAppCore_GetFunctions;');
  RegisterFakeHeader(G, 
       'function TAppCore_GetIniFile:TIniFile;',
       @TAppCore_GetIniFile);
  RegisterProperty(G, 
       'property IniFile:TIniFile read TAppCore_GetIniFile;');
  RegisterFakeHeader(G, 
       'function TAppCore_GetConfig:TIniFile;',
       @TAppCore_GetConfig);
  RegisterProperty(G, 
       'property Config:TIniFile read TAppCore_GetConfig;');
  RegisterFakeHeader(G, 
       'function TAppCore_GetUserIni:TIniFile;',
       @TAppCore_GetUserIni);
  RegisterProperty(G, 
       'property UserIni:TIniFile read TAppCore_GetUserIni;');
  RegisterFakeHeader(G, 
       'function TAppCore_GetMainView:TMainView;',
       @TAppCore_GetMainView);
  RegisterFakeHeader(G, 
       'procedure TAppCore_PutMainView(const Value: TMainView);',
       @TAppCore_PutMainView);
  RegisterProperty(G, 
       'property MainView:TMainView read TAppCore_GetMainView write TAppCore_PutMainView;');
  RegisterFakeHeader(G, 
       'function TAppCore_GetSmallImage:TFileImageList;',
       @TAppCore_GetSmallImage);
  RegisterProperty(G, 
       'property SmallImage:TFileImageList read TAppCore_GetSmallImage;');
  RegisterFakeHeader(G, 
       'function TAppCore_GetLargeImage:TFileImageList;',
       @TAppCore_GetLargeImage);
  RegisterProperty(G, 
       'property LargeImage:TFileImageList read TAppCore_GetLargeImage;');
  RegisterFakeHeader(G, 
       'function TAppCore_GetToolBarImage:TFileImageList;',
       @TAppCore_GetToolBarImage);
  RegisterFakeHeader(G, 
       'procedure TAppCore_PutToolBarImage(const Value: TFileImageList);',
       @TAppCore_PutToolBarImage);
  RegisterProperty(G, 
       'property ToolBarImage:TFileImageList read TAppCore_GetToolBarImage write TAppCore_PutToolBarImage;');
  RegisterFakeHeader(G, 
       'function TAppCore_GetImageCenter:TImageCenter;',
       @TAppCore_GetImageCenter);
  RegisterProperty(G, 
       'property ImageCenter:TImageCenter read TAppCore_GetImageCenter;');
  RegisterFakeHeader(G, 
       'function TAppCore_GetLogger:TLogger;',
       @TAppCore_GetLogger);
  RegisterProperty(G, 
       'property Logger:TLogger read TAppCore_GetLogger;');
  RegisterFakeHeader(G, 
       'function TAppCore_GetState:TAppState;',
       @TAppCore_GetState);
  RegisterFakeHeader(G, 
       'procedure TAppCore_PutState(const Value: TAppState);',
       @TAppCore_PutState);
  RegisterProperty(G, 
       'property State:TAppState read TAppCore_GetState write TAppCore_PutState;');
  RegisterFakeHeader(G, 
       'function TAppCore_GetStateSubject:TSubject;',
       @TAppCore_GetStateSubject);
  RegisterProperty(G, 
       'property StateSubject:TSubject read TAppCore_GetStateSubject;');
  RegisterFakeHeader(G, 
       'function TAppCore_GetUser:TBaseUser;',
       @TAppCore_GetUser);
  RegisterFakeHeader(G, 
       'procedure TAppCore_PutUser(const Value: TBaseUser);',
       @TAppCore_PutUser);
  RegisterProperty(G, 
       'property User:TBaseUser read TAppCore_GetUser write TAppCore_PutUser;');
  // End of class TAppCore
  RegisterVariable(H, 'AppCore: TAppCore;',@AppCore);
end;
initialization
  RegisterIMPORT_App_Common;
end.
