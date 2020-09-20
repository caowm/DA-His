unit FileService_ServerBackend;

{
  文件服务服务端库
  曹伟民 (remobjects@qq.com)
  v1.0 2013-1-5 

  1 在配置文件的FileService节下定义逻辑目录和对应物理目录
  2 其他对象也可通过RegisterLogicalName来增加目录

  todo: trigger event
}

interface

uses Classes,
  SysUtils,
  StrUtils,
  App_Common,
  App_Function,
  uROClasses,
  ShellAPI,
  SyncObjs,
  DateUtils,
  uROXMLIntf,
  uROClientIntf,
  uROTypes,
  uROServer,
  uROServerIntf,
  uROSessions,
  {Required:} uRORemoteDataModule,
  FileServiceLib_Intf;

const
  // file operation string
  sfoFileNotExists = '%s文件不存在';
  sfoFolderNotExists = '%s目录不存在';
  sfoFileRenameError = '%s文件重命名失败';
  sfoFolderRenameError = '%s目录重命名失败';
  sfoFileRemoveError = '%s删除失败';
  sfoFileMoveError = '%s文件移动失败';
  sfoLogicalIsEmpty = '[文件服务]没有指定逻辑名称';
  sfoLogicalNotExists = '[文件服务]找不到逻辑名称';
  sfoFileDeleteError = '%s文件删除失败，代码%d';
  sfoFolderDelteError = '%s目录删除失败';
  sfoDownloadNotMatch = '%s文件下载大小不匹配';
  sfoDownloadBlockEqualZero = '下载文件块等于0';
  sfoUploadConflict = '上传文件冲突';
  sfoUploadNoMatch = '上传的文件大小或者位置、名称与上次不匹配';

  // 上传文件失效时间10秒
  ifoCleanTimeout = 10000;
  ifoMaxFileSize = $10000000;

type
  TUploadingFile = class;

  TFileServiceManager = class
  private
    FLogicalList: TStrings;
    // 文件上传相关字段
    FUploadFiles: TStrings;
    FCritical: TCriticalSection;
    FCleanTimer: TROThreadTimer;
    // 文件上传相关函数
    procedure CleanUploadFiles();
    function GetUploadingFile(ID: string): TUploadingFile;
    procedure RemoveUploadFile(ID: string);
    function AddUploadingFile(const ClientID, LogicalName: string; FileSize: Integer): TUploadingFile;
    procedure CleanTimerEvent(CurrentTickCount: cardinal);

    function GetFileMD5(const PhysicalName: string): string;
    procedure CheckExists(const PhysicalName: string);
  public
    constructor Create();
    destructor Destroy(); override;

    procedure RegisterLogicalName(const LogicalName, PhysicalPath: string);
    function LogicalToPhysical(const LogicalName: string): string;

    function FindPath(Sender: TRORemoteDataModule; const Path: AnsiString): FileArray;
    function FileAttr(Sender: TRORemoteDataModule; const FileName: AnsiString): FileInfo;
    function UploadFile(Sender: TRORemoteDataModule; const FileName: AnsiString; const FileSize, StartPos: Integer; const Block: Binary): Integer;
    function DownloadFile(Sender: TRORemoteDataModule; const FileName: AnsiString; const StartPos: Integer; const BlockSize: Integer): Binary;
    function RenameFile(Sender: TRORemoteDataModule; const OldName: AnsiString; const NewName: AnsiString): Integer;
    function RemoveFile(Sender: TRORemoteDataModule; const FileName: AnsiString): Integer;
    function ServiceValue(Sender: TRORemoteDataModule; const ValueName: AnsiString): Variant;
  end;

  // 正在上传的文件对象, 存放在临时目录中
  TUploadingFile = class
  private
    FClientID: string;
    FLogicalName: string;
    FPhysicalName: string;
    FTempFileName: string;
    FTempFileStream: TFileStream;
    FFileSize: Integer;
    FLastTime: TDateTime;
  public
    constructor Create(const AClientID, ALogicalName, APhysicalName: string; AFileSize: Integer);
    destructor Destroy(); override;
  end;

var
  FileServiceManager: TFileServiceManager;

implementation

uses Windows;

{ TFileServiceManager }

procedure TFileServiceManager.CheckExists(const PhysicalName: string);
begin
  Check(not FileExists(PhysicalName), sfoFileNotExists, [PhysicalName]);
end;

constructor TFileServiceManager.Create;
begin
  // 逻辑名列表
  FLogicalList := TStringList.Create;
  // 正在上传的文件列表
  FUploadFiles := TStringList.Create;
  FCritical := TCriticalSection.Create;
  // 定时器：检查失效的上传文件
  FCleanTimer := TROThreadTimer.Create(CleanTimerEvent, ifoCleanTimeout div 4);
  // 读取逻辑名列表
  AppCore.IniFile.ReadSectionValues('FileService', FLogicalList);
end;

destructor TFileServiceManager.Destroy;
begin
  FreeAndNil(FCleanTimer);
  FreeAndNil(FLogicalList);
  CleanUploadFiles();
  FreeAndNil(FUploadFiles);
  FreeAndNil(FCritical);
end;

// 下载文件

function TFileServiceManager.DownloadFile(Sender: TRORemoteDataModule;
  const FileName: AnsiString; const StartPos, BlockSize: Integer): Binary;
var
  FileSize: Int64;
  MemStream: TFileStream;
  Physical: string;
begin
  Physical := LogicalToPhysical(FileName);
  CheckExists(Physical);

  MemStream := TFileStream.Create(Physical, fmShareDenyWrite); // fmOpenRead;
  Result := Binary.Create;
  try
    FileSize := MemStream.Size;
    // 检查参数
    Check(BlockSize <= 0, sfoDownloadBlockEqualZero);
    Check(StartPos >= FileSize, sfoDownloadNotMatch);

    MemStream.Position := StartPos;
    if StartPos + BlockSize > FileSize then
      Result.CopyFrom(MemStream, FileSize - StartPos)
    else
      Result.CopyFrom(MemStream, BlockSize);
  finally
    MemStream.Free;
  end;
end;

// 获取文件属性

function TFileServiceManager.FileAttr(Sender: TRORemoteDataModule;
  const FileName: AnsiString): FileInfo;
var
  Physical: string;
  SR: TSearchRec;
begin
  Physical := LogicalToPhysical(FileName);
  CheckExists(Physical);

  Result := FileInfo.Create;
  if FindFirst(Physical, faArchive, SR) = 0 then
  begin
    Result.Name := SR.Name;
    Result.Size := SR.Size;
    Result.Time := SR.Time;
    Result.Attr := SR.Attr;
  end;
  SysUtils.FindClose(SR);
end;

// 搜索目录：列举目录下的所有文件和目录, 不包含子目录

function TFileServiceManager.FindPath(Sender: TRORemoteDataModule;
  const Path: AnsiString): FileArray;
var
  I: Integer;
  SR: TSearchRec;
  Physical: string;
begin
  Result := FileArray.Create;
  if Path = '' then
  begin
    // 如果没指定任何名称，返回逻辑列表
    for I := 0 to FLogicalList.Count - 1 do
    begin
      with Result.Add do
      begin
        Name := FLogicalList.Names[I];
        Size := 0;
        Attr := faDirectory;
        Time := DateTimeToFileDate(Now());
        MD5 := '';
      end;
    end;
  end
  else
  begin
    Physical := LogicalToPhysical(Path);
    Check(not DirectoryExists(Physical), sfoFolderNotExists, [Path]);

    // 开始搜索
    if FindFirst(Physical + '\*.*', faDirectory or faArchive, SR) = 0 then
    try
      repeat
        if SR.Name = '.' then Continue;
        if SR.Name = '..' then Continue;

        with Result.Add do
        begin
          Name := SR.Name;
          Size := SR.Size;
          Time := SR.Time;
          Attr := SR.Attr;
          if ((Attr and faDirectory) <> 0) then
            MD5 := GetFileMD5(Physical + '\' + SR.Name)
          else
            MD5 := '';
        end;
      until FindNext(SR) <> 0;
    finally
      SysUtils.FindClose(SR);
    end;
  end;
end;

// 获取文件的MD5值, 用于判断客户端和服务器上的文件是否一致
// 另外一种判断方式：用文件修改时和大小

function TFileServiceManager.GetFileMD5(const PhysicalName: string): string;
begin
  // todo:
  Result := '';
end;

// 转换逻辑名到物理名
// 逻辑名形式：logicalname\dir1\dir2\filename.ext

function TFileServiceManager.LogicalToPhysical(const LogicalName: string): string;
var
  Logical: string;
  Physical: string;
begin
  Logical := StringReplace(Trim(LogicalName), '/', '\', [rfReplaceAll]);
  if (Pos('\', Logical) > 0) then
    Logical := LeftStr(Logical, Pos('\', Logical) - 1);
  Check(Logical = '', sfoLogicalIsEmpty);
  Physical := FLogicalList.Values[Logical];
  Check(Physical = '', sfoLogicalNotExists, [Logical]);
  Result := StringReplace(Trim(LogicalName), Logical, Physical, []);
end;

procedure TFileServiceManager.RegisterLogicalName(const LogicalName,
  PhysicalPath: string);
begin
  // todo: 多个客户端管理的时候需考虑线程安全
  FLogicalList.Values[LogicalName] := ExcludeTrailingBackslash(PhysicalPath);
  AppCore.Logger.WriteFmt('[文件服务]注册了逻辑目录%s=%s', [LogicalName, PhysicalPath], mtInfo, 0);
end;

// 删除文件或者目录

function TFileServiceManager.RemoveFile(Sender: TRORemoteDataModule;
  const FileName: AnsiString): Integer;
var
  Physical: string;
begin
  Physical := LogicalToPhysical(FileName);
  if FileExists(Physical) then
  begin
    if not SysUtils.DeleteFile(Physical) then
      raise Exception.CreateFmt(sfoFileDeleteError, [FileName, GetLastError()]);
  end
  else if DirectoryExists(Physical) then
  begin
    if (DelDirectory(Physical) <> 0) then
      raise Exception.CreateFmt(sfoFolderDelteError, [FileName]);
  end
  else
    raise Exception.CreateFmt(sfoFileNotExists, [FileName]);
  Result := 0;
end;

// 文件或者目录重命名

function TFileServiceManager.RenameFile(Sender: TRORemoteDataModule;
  const OldName, NewName: AnsiString): Integer;
var
  Physical1, Physical2: string;
begin
  Physical1 := LogicalToPhysical(OldName);
  Physical2 := ExtractFilePath(Physical1) + '\' + NewName;
  if FileExists(Physical1) or DirectoryExists(Physical1) then
  begin
    if not SysUtils.RenameFile(Physical1, Physical2) then
      raise Exception.CreateFmt(sfoFileRenameError, [OldName]);
  end
  else
    raise Exception.CreateFmt(sfoFileNotExists, [OldName]);
  Result := 0;
end;

// todo: 与客户端通讯相关的服务参数值

function TFileServiceManager.ServiceValue(Sender: TRORemoteDataModule;
  const ValueName: AnsiString): Variant;
begin

end;

// 上传文件，客户端只能单线程上传同一个文件，不能开多线程上传同一个文件
// 但可以多线程上传多个文件

function TFileServiceManager.UploadFile(Sender: TRORemoteDataModule;
  const FileName: AnsiString; const FileSize, StartPos: Integer;
  const Block: Binary): Integer;
var
  UploadingFile: TUploadingFile;
  ClientID, PhysicalName: string;
begin
  Result := 0;

  ClientID := GUIDToString(Sender.ClientID);
  // 用文件名作为上传文件的唯一标识
  UploadingFile := GetUploadingFile(FileName);
  // 如果是第1块上传的数据，UploadingFile为空，则必须新建
  if UploadingFile = nil then
    UploadingFile := AddUploadingFile(ClientID, Filename, FileSize);

  // 判断两个客户端是否上传相同文件
  Check(UploadingFile.FClientID <> ClientID, sfoUploadConflict);

  try
    // 检查参数. 不匹配时，说明上传出现混乱
    if ((UploadingFile.FFileSize <> FileSize) or
      (UploadingFile.FLogicalName <> FileName) or
      (UploadingFile.FTempFileStream.Size <> StartPos) or
      (UploadingFile.FTempFileStream.Size + Block.Size > FileSize)) then
    begin
      raise Exception.Create(sfoUploadNoMatch);
    end;

    // 复制
    UploadingFile.FTempFileStream.CopyFrom(Block, Block.Size);
    // 更新访问时间
    UploadingFile.FLastTime := Now();

    // 如果上传完成
    if FileSize = UploadingFile.FTempFileStream.Size then
    try
      // 释放临时流，以便移动
      FreeAndNil(UploadingFile.FTempFileStream);
      // 临时文件移动到指定目录
      // 问题：如果临时目录和目标目录不在同一卷上，移动大文件耗时会比较长
      if not Windows.MoveFileEx(PChar(UploadingFile.FTempFileName),
        PChar(UploadingFile.FPhysicalName),
        MOVEFILE_COPY_ALLOWED or MOVEFILE_REPLACE_EXISTING) then
      begin
        raise Exception.CreateFmt(sfoFileMoveError, [FileName]);
      end;
    finally
      // 不管最后结果成功与否，清除正在上传的文件对象
      RemoveUploadFile(FileName);
    end;
  except
    // 一旦发生错误即清除上传文件
    RemoveUploadFile(FileName);
    raise;
  end;
end;

// 清除未完成的上传文件

procedure TFileServiceManager.CleanUploadFiles;
begin
  FCritical.Enter;
  try
    while FUploadFiles.Count > 0 do
    begin
      FUploadFiles.Objects[FUploadFiles.Count - 1].Free;
      FUploadFiles.Delete(FUploadFiles.Count - 1);
    end;
  finally
    FCritical.Leave;
  end;
end;

// 根据ID获取正在上传的文件

function TFileServiceManager.GetUploadingFile(ID: string): TUploadingFile;
var
  I: Integer;
begin
  FCritical.Enter;
  try
    I := FUploadFiles.IndexOf(ID);
    if I > -1 then
      Result := TUploadingFile(FUploadFiles.Objects[I])
    else
      Result := nil;
  finally
    FCritical.Leave;
  end;
end;

// 定时清理失效的上传文件

procedure TFileServiceManager.CleanTimerEvent(CurrentTickCount: cardinal);
var
  I: Integer;
begin
  FCritical.Enter;
  try
    for I := FUploadFiles.Count - 1 downto 0 do
    begin
      with TUploadingFile(FUploadFiles.Objects[I]) do
      begin
        // 超时未上传，且未上传完成(上传完成的大文件可能正在移动)
        if (SecondsBetween(Now, FLastTime) * 1000 > ifoCleanTimeout) and
          (FTempFileStream <> nil) then
        begin
          Free;
          FUploadFiles.Delete(I);
        end;
      end;
    end;
  finally
    FCritical.Leave;
  end;
end;

// 删除上传的文件对象

procedure TFileServiceManager.RemoveUploadFile(ID: string);
var
  I: Integer;
begin
  FCritical.Enter;
  try
    I := FUploadFiles.IndexOf(ID);
    if I > -1 then
    begin
      FUploadFiles.Objects[I].Free;
      FUploadFiles.Delete(I);
    end;
  finally
    FCritical.Leave;
  end
end;

// 新建上传文件

function TFileServiceManager.AddUploadingFile(const ClientID,
  LogicalName: string; FileSize: Integer): TUploadingFile;
var
  PhysicalName: string;
begin
  FCritical.Enter;
  try
    if FUploadFiles.IndexOf(LogicalName) < 0 then
    begin
      // 检查逻辑名是否正确
      PhysicalName := LogicalToPhysical(LogicalName);
      Result := TUploadingFile.Create(ClientID, LogicalName, PhysicalName, FileSize);
      FUploadFiles.AddObject(LogicalName, Result);
    end
    else
      raise Exception.Create(sfoUploadConflict);
  finally
    FCritical.Leave;
  end;
end;

{ TUploadingFile }

constructor TUploadingFile.Create(const AClientID, ALogicalName, APhysicalName: string; AFileSize: Integer);
begin
  // 上次上传时间，长时间未上传的文件，将被自动清除
  FLastTime := Now;
  FFileSize := AFileSize;
  FClientID := AClientID;
  FLogicalName := ALogicalName;
  FPhysicalName := APhysicalName;
  // 上传的文件直接放在指定目录中，不用临时文件，解决最后要移动文件的问题
  ForceDirectories(ExtractFilePath(APhysicalName));
  FTempFileName := APhysicalName + '.tmp';
  FTempFileStream := TFileStream.Create(FTempFileName, fmCreate);
end;

destructor TUploadingFile.Destroy;
begin
  FreeAndNil(FTempFileStream);      
  // 如果释放前没有重命名文件，将被清除。
  SysUtils.DeleteFile(FTempFileName + '.tmp');
  inherited;
end;

initialization
  FileServiceManager := TFileServiceManager.Create;

finalization
  FreeAndNil(FileServiceManager);

end.

