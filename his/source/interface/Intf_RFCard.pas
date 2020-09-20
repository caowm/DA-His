unit Intf_RFCard;

{
  IC卡接口
}

interface

uses
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  StdCtrls,
  ExtCtrls,
  DateUtils,
  Menus,
  StrUtils,
  uROClasses,
  App_Common;

const
  sMWRFDLL = 'mwrf32.dll';
  sControlBits = 'FF078069';

  { comm function. }
function rf_init(port: smallint; baud: longint): longint; stdcall;
  external sMWRFDLL name 'rf_init';
function rf_exit(icdev: longint): smallint; stdcall;
  external sMWRFDLL name 'rf_exit';
//
function rf_card(icdev: longint; mode: smallint; snr: pChar): smallint; stdcall;
  external sMWRFDLL name 'rf_card';
function rf_load_key(icdev: longint; mode, secnr: smallint; nkey: pChar)
  : smallint; stdcall; external sMWRFDLL name 'rf_load_key';
function rf_load_key_hex(icdev: longint; mode, secnr: smallint; nkey: pChar)
  : smallint; stdcall; external sMWRFDLL name 'rf_load_key_hex';
function rf_authentication(icdev: longint; mode, secnr: smallint): smallint;
  stdcall; external sMWRFDLL name 'rf_authentication';
function rf_request(icdev: longint; mode: smallint; var tagtype: word)
  : smallint; stdcall; external sMWRFDLL name 'rf_request';
function rf_anticoll(icdev: longint; cnt: smallint; var _Snr: longword)
  : smallint; stdcall; external sMWRFDLL name 'rf_anticoll';
function rf_select(icdev: longint; _Snr: longword; var _Size: smallint)
  : smallint; stdcall; external sMWRFDLL name 'rf_select';
function rf_authentication_key(icdev: longint; _Mode, _BlockNr: smallint;
  _Key: pChar): smallint; stdcall;
  external sMWRFDLL name 'rf_authentication_key';

//
function rf_read(icdev: longint; adr: smallint; data: pChar): smallint; stdcall;
  external sMWRFDLL name 'rf_read';
function rf_read_hex(icdev: longint; adr: smallint; data: pChar): smallint;
  stdcall; external sMWRFDLL name 'rf_read_hex';
function rf_write(icdev: longint; adr: smallint; data: pChar): smallint;
  stdcall; external sMWRFDLL name 'rf_write';
function rf_write_hex(icdev: longint; adr: smallint; data: pChar): smallint;
  stdcall; external sMWRFDLL name 'rf_write_hex';
function rf_halt(icdev: longint): smallint; stdcall;
  external sMWRFDLL name 'rf_halt';
function rf_reset(icdev: longint; msec: smallint): smallint; stdcall;
  external sMWRFDLL name 'rf_reset';
function rf_beep(icdev: longint; time: smallint): smallint; stdcall;
  external sMWRFDLL name 'rf_beep';
function rf_get_status(icdev: longint; status: pChar): smallint; stdcall;
  external sMWRFDLL name 'rf_get_status';

// M1 CARD
function rf_initval(icdev: longint; adr: smallint; value: longint): smallint;
  stdcall; external sMWRFDLL name 'rf_initval';
function rf_readval(icdev: longint; adr: smallint; value: pChar): smallint;
  stdcall; external sMWRFDLL name 'rf_readval';
function rf_increment(icdev: longint; adr: smallint; value: longint): smallint;
  stdcall; external sMWRFDLL name 'rf_increment';
function rf_decrement(icdev: longint; adr: smallint; value: longint): smallint;
  stdcall; external sMWRFDLL name 'rf_decrement';
function rf_restore(icdev: longint; adr: smallint): smallint; stdcall;
  external sMWRFDLL name 'rf_restore';
function rf_transfer(icdev: longint; adr: smallint): smallint; stdcall;
  external sMWRFDLL name 'rf_transfer';
function rf_check_write(icdev, snr: longint; adr, authmode: smallint;
  data: pChar): smallint; stdcall; far; external sMWRFDLL name 'rf_check_write';
function rf_check_writehex(icdev, snr: longint; adr, authmode: smallint;
  data: pChar): smallint; stdcall; external sMWRFDLL name 'rf_check_writehex';

{
  function rf_encrypt(key: pchar; ptrsource: pchar; msglen: smallint; ptrdest: pchar): smallint; stdcall; external sMWRFDLL name 'rf_encrypt';
  function rf_decrypt(key: pchar; ptrsource: pchar; msglen: smallint; ptrdest: pchar): smallint; stdcall; external sMWRFDLL name 'rf_decrypt';
  //M1 CARD HIGH FUNCTION
  function rf_HL_initval(icdev: longint; mode: smallint; secnr: smallint; value: longint; snr: pchar): smallint; stdcall; external sMWRFDLL name 'rf_HL_initval';
  function rf_HL_increment(icdev: longint; mode: smallint; secnr: smallint; value, snr: longint; svalue, ssnr: pchar): smallint; stdcall;  external sMWRFDLL name 'rf_HL_increment';
  function rf_HL_decrement(icdev: longint; mode: smallint; secnr: smallint; value: longint; snr: longint; svalue, ssnr: pchar): smallint; stdcall;  external sMWRFDLL name 'rf_HL_decrement';
  function rf_HL_write(icdev: longint; mode, adr: smallint; ssnr, sdata: pchar): smallint; stdcall;  external sMWRFDLL name 'rf_HL_write';
  function rf_HL_read(icdev: longint; mode, adr: smallint; snr: longint; sdata, ssnr: pchar): smallint; stdcall; external sMWRFDLL name 'rf_HL_read';
  function rf_changeb3(Adr: pchar; keyA: pchar; B0: pchar; B1: pchar; B2: pchar; B3: pchar; Bk: pchar; KeyB: pchar): smallint; stdcall; external sMWRFDLL name 'rf_changeb3';
  //DEVICE
  function rf_ctl_mode(icdev: longint; ctlmode: smallint): smallint; stdcall; external sMWRFDLL name 'rf_ctl_mode';
  function rf_disp_mode(icdev: longint; mode: smallint): smallint; stdcall; external sMWRFDLL name 'rf_disp_mode';
  function rf_disp8(icdev: longint; len: longint; disp: pchar): smallint; stdcall; external sMWRFDLL name 'rf_disp8';
  function rf_disp(icdev: longint; pt_mode: smallint; disp: longint): smallint; stdcall; external sMWRFDLL name 'rf_disp';
  //
  function rf_settimehex(icdev: longint; dis_time: pchar): smallint; stdcall; external sMWRFDLL name 'rf_settimehex';
  function rf_gettimehex(icdev: longint; dis_time: pchar): smallint; stdcall;  external sMWRFDLL name 'rf_gettimehex';
  function rf_swr_eeprom(icdev: longint; offset, len: smallint; data: pchar): smallint; stdcall; external sMWRFDLL name 'rf_swr_eeprom';
  function rf_srd_eeprom(icdev: longint; offset, len: smallint; data: pchar): smallint; stdcall; external sMWRFDLL name 'rf_srd_eeprom';
  //ML CARD
  function rf_authentication_2(icdev: longint; mode, keyNum, secnr: smallint): smallint; stdcall; external sMWRFDLL name 'rf_authentication_2';
  function rf_initval_ml(icdev: longint; value: longint): smallint; stdcall; external sMWRFDLL name 'rf_initval_ml';
  function rf_readval_ml(icdev: longint; rvalue: pchar): smallint; stdcall; external sMWRFDLL name 'rf_readval_ml';
  function rf_decrement_transfer(icdev: longint; adr: smallint; value: longint): smallint; stdcall; external sMWRFDLL name 'rf_decrement_transfer';
  function rf_sam_rst(icdev: longint; baud: smallint; samack: pChar): smallint; stdcall; external sMWRFDLL name 'rf_sam_rst';
  function rf_sam_trn(icdev: longint; samblock, recv: pChar): smallint; stdcall; external sMWRFDLL name 'rf_sam_trn';
  function rf_sam_off(icdev: longint): smallint; stdcall; external sMWRFDLL name 'rf_sam_off';
  function rf_cpu_rst(icdev: longint; baud: smallint; cpuack: pChar): smallint; stdcall; external sMWRFDLL name 'rf_cpu_rst';
  function rf_cpu_trn(icdev: longint; cpublock, recv: pChar): smallint; stdcall; external sMWRFDLL name 'rf_cpu_trn';
  function rf_pro_rst(icdev: longint; _Data: pChar): smallint; stdcall; external sMWRFDLL name 'rf_pro_rst';
  function rf_pro_trn(icdev: longint; problock, recv: pChar): smallint; stdcall; external sMWRFDLL name 'rf_pro_trn';
  function rf_pro_halt(icdev: longint): smallint; stdcall;  external sMWRFDLL name 'rf_pro_halt';
  function hex_a(hex, a: pChar; length: smallint): smallint; stdcall; external sMWRFDLL name 'hex_a';
  function a_hex(a, hex: pChar; length: smallint): smallint; stdcall; external sMWRFDLL name 'a_hex';
}

type

  TRFData = array [0 .. 15] of Char;
  TRFKey = array [0 .. 5] of Char;

  TRFReader = class
  private
    FPort: Integer;
    FBaud: Cardinal;
    FICDev: Integer;
    FSerialNumber: longword;
    procedure CheckResult(ACode: Integer);
    function GetErrorText(ACode: Integer): string;
  public
    procedure Open(APort: Integer = 0; ABaud: Cardinal = 9600);
    procedure Close();
    procedure DoInit();
    procedure Beep(AMSec: Integer = 10);
    function GetStatus(): string;
    procedure LoadKey(ASector: Integer; AKey: string);
    procedure Halt();
    procedure Request();
    procedure Anticoll();
    procedure Select();
    procedure Authentication_Key(_Mode, BlockNumber: Integer;
      APassword: string);
    procedure Authentication_Key_Hex(_Mode, BlockNumber: Integer;
      APassword: string);
    function Read(BlockNumber: Integer): string; // 验证后再读或写
    function Read_Hex(BlockNumber: Integer): string;
    procedure Write(BlockNumber: Integer; Buffer: string);
    procedure Write_Hex(BlockNumber: Integer; Buffer: string);
  end;

var
  RFReader: TRFReader;

implementation

{ TRFReader }

procedure TRFReader.Anticoll;
begin
  if (rf_anticoll(FICDev, 0, FSerialNumber) <> 0) then
    raise Exception.Create('IC卡防冲突错误');
end;

// 注意：RF-35中只区分密码A或密码B, 0~2中任何一个值表示密码A，4～6中任何一个值表示密码B。

procedure TRFReader.Authentication_Key(_Mode, BlockNumber: Integer;
  APassword: string);
begin
  if Length(APassword) <> 6 then
    raise Exception.Create('IC卡密码长度必须是6位');

  DoInit;
  Halt;
  Request;
  Anticoll;
  Select;

  if rf_authentication_key(FICDev, _Mode, BlockNumber, pChar(APassword)) <> 0
  then
    raise Exception.CreateFmt('IC卡第%d块密码验证错误', [BlockNumber]);
end;

procedure TRFReader.Authentication_Key_Hex(_Mode, BlockNumber: Integer;
  APassword: string);
begin
  Authentication_Key(_Mode, BlockNumber, StringFromHexString(APassword))
end;

procedure TRFReader.Beep(AMSec: Integer = 10);
begin
  if rf_beep(FICDev, AMSec) <> 0 then
    AppCore.Logger.Write('rf_beep error', mtWarning, 0);
end;

procedure TRFReader.CheckResult(ACode: Integer);
begin
  if ACode <> 0 then
    raise Exception.Create(GetErrorText(ACode));
end;

procedure TRFReader.DoInit;
begin
  if FICDev <= 0 then
  begin
    FICDev := rf_init(FPort, FBaud);
    if FICDev <= 0 then
      CheckResult(FICDev);
  end;
end;

function TRFReader.GetErrorText(ACode: Integer): string;
begin
  case ACode of
    1:
      Result := '无卡';
    2:
      Result := 'CRC校验错';
    3:
      Result := '值溢出';
    4:
      Result := '未验证密码';
    5:
      Result := '奇偶校验错';
    6:
      Result := '通讯出错';
    8:
      Result := '错误的序列号';
    10:
      Result := '验证密码失败';
    11:
      Result := '接收的数据位错误';
    12:
      Result := '接收的数据字节错误';
    14:
      Result := 'Transfer错误';
    15:
      Result := '写失败';
    16:
      Result := '加值失败';
    17:
      Result := '减值失败';
    18:
      Result := '读失败';
    -$10:
      Result := 'PC与读写器通讯错误';
    -$11:
      Result := '通讯超时';
    -$20:
      Result := '打开通信口失败';
    -$24:
      Result := '串口已被占用';
    -$30:
      Result := '地址格式错误';
    -$31:
      Result := '该块数据不是值格式';
    -$32:
      Result := '长度错误';
    -$40:
      Result := '值操作失败';
    -$50:
      Result := '卡中的值不够减';
  else
    Result := '未知错误';
  end;
end;

function TRFReader.GetStatus: string;
var
  Buffer: array [0 .. 18] of Char;
begin
  FillChar(Buffer[0], Length(Buffer), 0);
  if rf_get_status(FICDev, Buffer) = 0 then
  begin
    Result := Buffer;
  end
  else
  begin
    Close;
    RaiseError('rf_get_status error');
  end;
end;

procedure TRFReader.Open(APort: Integer; ABaud: Cardinal);
begin
  FPort := APort;
  FBaud := ABaud;
  Close;
  DoInit;
end;

procedure TRFReader.LoadKey(ASector: Integer; AKey: string);
begin

end;

{
  寻卡模式分三种情况：IDLE模式、ALL模式及指定卡模式。

  0——表示IDLE模式，一次只对一张卡操作；
  1——表示ALL模式，一次可对多张卡操作；
  2——表示指定卡模式，只对序列号等于snr的卡操作（高级函数才有）
}
procedure TRFReader.Request;
var
  tagtype: word;
begin
  if rf_request(FICDev, 1, tagtype) <> 0 then
    raise Exception.Create('IC寻卡错误');
end;

procedure TRFReader.Close;
begin
  if FICDev <> 0 then
    rf_exit(FICDev);
  FICDev := 0;
end;

procedure TRFReader.Select;
var
  _Size: smallint;
begin
  if rf_select(FICDev, FSerialNumber, _Size) <> 0 then
    raise Exception.Create('IC选卡错误');
end;

procedure TRFReader.Halt;
begin
  if FICDev > 0 then
    rf_halt(FICDev);
end;

function TRFReader.Read(BlockNumber: Integer): string;
begin
  SetLength(Result, 16);
  if rf_read(FICDev, BlockNumber, @Result[1]) <> 0 then
    raise Exception.Create('IC读卡出错');
end;

function TRFReader.Read_Hex(BlockNumber: Integer): string;
var
  Temp: string;
begin
  Result := Read(BlockNumber);
  SetLength(Temp, 2 * Length(Result));
  BinToHex(PAnsiChar(Result), PWideChar(Temp), Length(Result));
  Result := Temp;
end;

procedure TRFReader.Write(BlockNumber: Integer; Buffer: string);
begin
  Check(Length(Buffer) <> 16, 'IC卡数据块长度必须是16');

  if rf_write(FICDev, BlockNumber, @Buffer[1]) <> 0 then
    raise Exception.Create('IC写卡出错');
end;

procedure TRFReader.Write_Hex(BlockNumber: Integer; Buffer: string);
begin
  Buffer := StringFromHexString(Buffer);
  write(BlockNumber, Buffer);
end;

initialization

RFReader := TRFReader.Create;

finalization

FreeAndNil(RFReader);

end.
