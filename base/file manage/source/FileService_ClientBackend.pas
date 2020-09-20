unit FileService_ClientBackend;

{
  文件服务客户端库
  v1.0 2013-1-5 曹伟民

  1. 可同时创建多个TFileServiceClient, 并设置不同的RemoteService，即可与多个
     服务器通讯。
}

interface

uses
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  uRORemoteService,
  uROClasses,
  uROTypes,
  App_Common,
  App_Function,
  App_DAModel,
  FileServiceLib_Intf;

const
  sFileMoveError = '%s文件更新失败';
  sProcessCanceled = '操作被取消';

  // 上传下载文件传输块大小，64K=$10000
  iTransferBlockSize = $20000;

type
  TOnDownloadFile = procedure(Sender: TObject; Info: FileInfo) of object;

  TFileServiceClient = class(TComponent)
  private
    FRemoteService: TRORemoteService;
    procedure DoCheck();
    function GetFileMD5(const FileName: string): string;
    procedure AssignFiles(Source, Dest: FileArray; const RootPath: string);
  public
    procedure InitService(ARemoteService: TRORemoteService);

    function FindLocalPath(const LocalPath: AnsiString): FileArray;
    function LocalFileAttr(const LocalFile: AnsiString): FileInfo;

    function FindPath(const ServerPath: AnsiString): FileArray;
    function UploadFile(const ClientFile, ServerFile: string; OnProgress: TOnProgress): Boolean;
    function UploadStream(Stream: TStream; const ServerFile: string; OnProgress: TOnProgress): Boolean;
    function UploadPath(const ServerPath, ClientPath: string; OnUploadFile: TOnDownloadFile;
      OnAllProgress, OnFileProgress: TOnProgress): Boolean;

    function DownloadFile(const ServerFile, ClientFile: string; FileSize: Integer=0; OnProgress: TOnProgress=nil): Boolean;
    function DownloadStream(const ServerFile: string; Stream: TStream; FileSize: Integer=0; OnProgress: TOnProgress=nil): Boolean;
    function DownloadPath(const ServerPath, ClientPath: string; OnDownloadFile: TOnDownloadFile;
      OnAllProgress, OnFileProgress: TOnProgress): Boolean;
    procedure UpdateClientFiles(const ServerPath, ClientPath: string;
      OnDownloadFile: TOnDownloadFile; OnAllProgress, OnFileProgress: TOnProgress);

    function RenameFile(const OldName: AnsiString; const NewName: AnsiString): Integer;
    function RemoveFile(const ServerFile: AnsiString): Integer;
    function FileAttr(const ServerFile: AnsiString): FileInfo;
    function ServiceValue(const ValueName: AnsiString): Variant;
  end;


implementation

{ TFileServiceClient }

procedure TFileServiceClient.AssignFiles(Source, Dest: FileArray; const RootPath: string);
var
  I: Integer;
begin
  for I := 0 to Source.Count - 1 do
  begin
    with Dest.Add do
    begin
      Assign(Source[I]);
      // 附上全名
      Name := RootPath + '\' + Name;
    end;
  end;
end;

procedure TFileServiceClient.DoCheck;
begin
  Check(FRemoteService = nil, '请先设置远程服务');
end;

{
  从服务器下载单个文件，放在指定目录
}

function TFileServiceClient.DownloadFile(const ServerFile, ClientFile: string;
  FileSize: Integer; OnProgress: TOnProgress): Boolean;
var
  Stream: TFileStream;
begin
  DoCheck();
  // 确保目录已经存在
  ForceDirectories(ExtractFilePath(ClientFile));
  Stream := TFileStream.Create(ClientFile, fmCreate);
  try
    Result := DownloadStream(ServerFile, Stream, FileSize, OnProgress);
    AppCore.Logger.WriteFmt('%s下载完成.', [ClientFile], mtInfo, 0);
  finally
    FreeAndNil(Stream);
    // 删除下载失败时文件
    if not Result then
      SysUtils.DeleteFile(ClientFile);
  end;
end;

{
  从服务器下载整个目录，直接放在目标目录，不放在临时目录中
  有错误时直接退出
}

function TFileServiceClient.DownloadPath(const ServerPath,
  ClientPath: string; OnDownloadFile: TOnDownloadFile;
  OnAllProgress, OnFileProgress: TOnProgress): Boolean;
var
  ServerFiles, TempFiles: FileArray;
  ClientFileName: string;
  CurrentIndex: Integer;
  Canceled: Boolean;
begin
  DoCheck();
  CurrentIndex := 0;
  ServerFiles := FileArray.Create;
  with ServerFiles.Add do
  begin
    Name := ServerPath;
    Attr := faDirectory;
  end;
  try
    Canceled := False;
    while not Canceled and (CurrentIndex < ServerFiles.Count) do
    begin
      if Assigned(OnAllProgress) then
        OnAllProgress(ServerFiles.Count, CurrentIndex, Canceled);
      Check(Canceled, sProcessCanceled);

      if ((ServerFiles[CurrentIndex].Attr and faDirectory) <> 0) then
      begin
        TempFiles := FindPath(ServerFiles[CurrentIndex].Name);
        // 记录服务器上所有找到的文件
        AssignFiles(TempFiles, ServerFiles, ServerFiles[CurrentIndex].Name);
        FreeAndNil(TempFiles);
      end
      else if ((ServerFiles[CurrentIndex].Attr and faArchive) <> 0) then
      begin
        if Assigned(OnDownloadFile) then
          OnDownloadFile(Self, ServerFiles[CurrentIndex]);

        ClientFileName := StringReplace(ServerFiles[CurrentIndex].Name, ServerPath, ClientPath, [rfIgnoreCase]);
        Result := DownloadFile(ServerFiles[CurrentIndex].Name,
          ClientFileName,
          ServerFiles[CurrentIndex].Size,
          OnFileProgress);
        // 设置文件时间
        SysUtils.FileSetDate(ClientFileName, ServerFiles[CurrentIndex].Time)
      end;

      Inc(CurrentIndex);
    end;
  finally
    ServerFiles.Free;
  end;
end;

function TFileServiceClient.DownloadStream(const ServerFile: string;
  Stream: TStream; FileSize: Integer; OnProgress: TOnProgress): Boolean;
var
  Block: Binary;
  Canceled: Boolean;
  Info: FileInfo;
begin
  Result := False;
  Canceled := False;

  // 获取文件大小
  if FileSize <= 0 then
  begin
    Info := (FRemoteService as IFileService).FileAttr(ServerFile);
    FileSize := Info.Size;
    FreeAndNil(Info);
  end;
  // 一块块下载，直到文件末尾
  while not Canceled and (Stream.Size < FileSize) do
  begin
    Block := (FRemoteService as IFileService).DownloadFile(ServerFile, Stream.Size, iTransferBlockSize);
    Stream.CopyFrom(Block, Block.Size);
    Block.Free; // 返回的块大小可能不等于cBlockSize
    if Assigned(OnProgress) then
      OnProgress(FileSize, Stream.Size, Canceled);
    Check(Canceled and (Stream.Size < FileSize), sProcessCanceled);
  end;
  Result := True; 
end;

function TFileServiceClient.FileAttr(const ServerFile: AnsiString): FileInfo;
begin
  DoCheck();
  Result := (FRemoteService as IFileService).FileAttr(ServerFile);
end;

// 搜索本地目录
// LocalPath带通配符

function TFileServiceClient.FindLocalPath(
  const LocalPath: AnsiString): FileArray;
var
  SR: TSearchRec;
begin
  Result := FileArray.Create;
  // 开始搜索
  if FindFirst(LocalPath, faDirectory or faArchive, SR) = 0 then
  try
    repeat
      if SR.Name = '.' then
        Continue;
      if SR.Name = '..' then
        Continue;

      with Result.Add do
      begin
        Name := SR.Name;
        Size := SR.Size;
        Time := SR.Time;
        Attr := SR.Attr;
        if ((Attr and faDirectory) <> 0) then
          MD5 := GetFileMD5(LocalPath + '\' + SR.Name)
        else
          MD5 := '';
      end;
    until FindNext(SR) <> 0;
  finally
    SysUtils.FindClose(SR);
  end;
end;

function TFileServiceClient.FindPath(const ServerPath: AnsiString): FileArray;
begin
  DoCheck();
  Result := (FRemoteService as IFileService).FindPath(ServerPath);
end;

function TFileServiceClient.GetFileMD5(const FileName: string): string;
begin
  // todo:
end;

procedure TFileServiceClient.InitService(ARemoteService: TRORemoteService);
begin
  FRemoteService := ARemoteService;
end;

// 本地文件属性

function TFileServiceClient.LocalFileAttr(
  const LocalFile: AnsiString): FileInfo;
var
  SR: TSearchRec;
begin
  if FileExists(LocalFile) then
  begin
    Result := FileInfo.Create;
    if FindFirst(LocalFile, faArchive, SR) = 0 then
    begin
      Result.Name := SR.Name;
      Result.Size := SR.Size;
      Result.Time := SR.Time;
      Result.Attr := SR.Attr;
      Result.MD5 := GetFileMD5(LocalFile);
    end;
    SysUtils.FindClose(SR);
  end
  else
    Result := nil;
end;

function TFileServiceClient.RemoveFile(
  const ServerFile: AnsiString): Integer;
begin
  DoCheck();
  Result := (FRemoteService as IFileService).RemoveFile(ServerFile);
end;

function TFileServiceClient.RenameFile(const OldName,
  NewName: AnsiString): Integer;
begin
  DoCheck();
  Result := (FRemoteService as IFileService).RenameFile(OldName, NewName);
end;

function TFileServiceClient.ServiceValue(
  const ValueName: AnsiString): Variant;
begin
  DoCheck();
  Result := (FRemoteService as IFileService).ServiceValue(ValueName);
end;

{
  智能更新

  1. 对比客户端和服务器上的文件的修改时间或者大小，不同则下载
  2. 只有全部下载成功才能更新客户端文件
}

procedure TFileServiceClient.UpdateClientFiles(const ServerPath, ClientPath: string;
  OnDownloadFile: TOnDownloadFile; OnAllProgress, OnFileProgress: TOnProgress);
var
  ServerFiles, TempFiles: FileArray;
  DownloadedFiles: FileArray;
  TempPath, TempFileName: string;

  LocalAttr: FileInfo;
  CurrentIndex: Integer;
  Canceled: Boolean;
begin
  DoCheck();
  CurrentIndex := 0;
  DownloadedFiles := FileArray.Create;
  ServerFiles := FileArray.Create;
  {
    临时目录建在目标目录中，避免目标目录和临时目录在不同卷上，
    在最后下载完成时可快速完成文件移动
  }
  TempPath := IncludeTrailingBackslash(ClientPath) + 'temp\AutoUpdate';
  with ServerFiles.Add do
  begin
    Name := ServerPath;
    Attr := faDirectory;
  end;
  try
    // 清除临时目录
    DelDirectory(TempPath);
    Canceled := False;
    while not Canceled and (CurrentIndex < ServerFiles.Count) do
    begin
      if Assigned(OnAllProgress) then
        OnAllProgress(ServerFiles.Count, CurrentIndex, Canceled);

      Check(Canceled, sProcessCanceled);

      if ((ServerFiles[CurrentIndex].Attr and faDirectory) <> 0) then
      begin
        TempFiles := FindPath(ServerFiles[CurrentIndex].Name);
        // 记录服务器上所有找到的文件
        AssignFiles(TempFiles, ServerFiles, ServerFiles[CurrentIndex].Name);
        FreeAndNil(TempFiles);
      end
      else if ((ServerFiles[CurrentIndex].Attr and faArchive) <> 0) then
      begin
          // 获取对应本地文件属性
        LocalAttr := LocalFileAttr(StringReplace(ServerFiles[CurrentIndex].Name,
          ServerPath, ClientPath, []));
        try
          if (LocalAttr = nil) or
            (LocalAttr.Size <> ServerFiles[CurrentIndex].Size) or
            (LocalAttr.Time <> ServerFiles[CurrentIndex].Time) then
          begin
            if Assigned(OnDownloadFile) then
              OnDownloadFile(Self, ServerFiles[CurrentIndex]);

            // 下载到临时目录
            TempFileName := StringReplace(ServerFiles[CurrentIndex].Name, ServerPath, TempPath, []);
            DownloadFile(ServerFiles[CurrentIndex].Name,
              TempFileName,
              ServerFiles[CurrentIndex].Size,
              OnFileProgress);

              // 记录下载的文件，便于后面移动到目标文件夹
            with DownloadedFiles.Add do
            begin
              Assign(ServerFiles[CurrentIndex]);
              Name := TempFileName;
            end;
          end;
        finally
          FreeAndNil(LocalAttr);
        end;
      end;

      Inc(CurrentIndex);
    end;

    // 移动临时目录到指定目录
    for CurrentIndex := 0 to DownloadedFiles.Count - 1 do
    begin
      // 目标文件
      TempFileName := StringReplace(DownloadedFiles[CurrentIndex].Name, TempPath, ClientPath, []);

      SysUtils.DeleteFile(TempFileName + '~');
      if not SysUtils.DeleteFile(TempFileName) then
        SysUtils.RenameFile(TempFileName, TempFileName + '~');

      ForceDirectories(ExtractFilePath(TempFileName));
      {
      if not Windows.MoveFileEx(PChar(DownloadedFiles[CurrentIndex].Name),
        PChar(TempFileName),
        MOVEFILE_COPY_ALLOWED or MOVEFILE_REPLACE_EXISTING) then
      begin
        raise Exception.CreateFmt(sFileMoveError, [TempFileName]);
      end;
      }
      Windows.MoveFileEx(PChar(DownloadedFiles[CurrentIndex].Name),
        PChar(TempFileName),
        MOVEFILE_COPY_ALLOWED or MOVEFILE_REPLACE_EXISTING);
      SysUtils.FileSetDate(TempFileName, DownloadedFiles[CurrentIndex].Time);

    end;
  finally
    ServerFiles.Free;
    DownloadedFiles.Free;
  end;
end;

{
  上传单个文件
}

function TFileServiceClient.UploadFile(const ClientFile, ServerFile: string;
  OnProgress: TOnProgress): Boolean;
var
  Stream: TFileStream;
begin
  DoCheck();
  Stream := TFileStream.Create(ClientFile, fmOpenRead);
  try
    Result := UploadStream(Stream, ServerFile, OnProgress);
  finally
    FreeAndNil(Stream);
  end;
end;

{
  上传整个目录
}

function TFileServiceClient.UploadPath(const ServerPath,
  ClientPath: string; OnUploadFile: TOnDownloadFile; OnAllProgress,
  OnFileProgress: TOnProgress): Boolean;
var
  ClientFiles, TempFiles: FileArray;
  CurrentIndex: Integer;
  Canceled: Boolean;
begin
  DoCheck();
  CurrentIndex := 0;
  ClientFiles := FileArray.Create;
  with ClientFiles.Add do
  begin
    Name := ClientPath;
    Attr := faDirectory;
  end;
  try
    Canceled := False;
    while not Canceled and (CurrentIndex < ClientFiles.Count) do
    begin
      if Assigned(OnAllProgress) then
        OnAllProgress(ClientFiles.Count, CurrentIndex, Canceled);
      Check(Canceled, sProcessCanceled);

      if ((ClientFiles[CurrentIndex].Attr and faDirectory) <> 0) then
      begin
        TempFiles := FindLocalPath(ClientFiles[CurrentIndex].Name + '\*.*');
        // 记录找到的文件
        AssignFiles(TempFiles, ClientFiles, ClientFiles[CurrentIndex].Name);
        FreeAndNil(TempFiles);
      end
      else if ((ClientFiles[CurrentIndex].Attr and faArchive) <> 0) then
      begin
        if Assigned(OnUploadFile) then
          OnUploadFile(Self, ClientFiles[CurrentIndex]);

        Result := UploadFile(ClientFiles[CurrentIndex].Name,
          StringReplace(ClientFiles[CurrentIndex].Name, ClientPath, ServerPath, [rfIgnoreCase]),
          OnFileProgress);
      end;

      Inc(CurrentIndex);
    end;
  finally
    ClientFiles.Free;
  end;
end;

function TFileServiceClient.UploadStream(Stream: TStream;
  const ServerFile: string; OnProgress: TOnProgress): Boolean;
var
  BlockSize: Integer;
  Canceled: Boolean;
  Block: Binary;
begin
  DoCheck();
  Result := False;
  Block := Binary.Create;
  Canceled := False;
  try
    // 一块块上传
    while not Canceled and (Stream.Position < Stream.Size) do
    begin
      BlockSize := Stream.Size - Stream.Position;
      if BlockSize > iTransferBlockSize then
        BlockSize := iTransferBlockSize;
      Block.SetSize(BlockSize);
      Block.Position := 0;

      Block.CopyFrom(Stream, BlockSize);
      (FRemoteService as IFileService).UploadFile(ServerFile, Stream.Size,
        Stream.Position - Block.Size, Block);
      if Assigned(OnProgress) then
        OnProgress(Stream.Size, Stream.Position, Canceled);
      Check(Canceled and (Stream.Position < Stream.Size), sProcessCanceled);
    end;
    Result := True;
  finally
    FreeAndNil(Block);
  end;
end;

end.

