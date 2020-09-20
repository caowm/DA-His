unit App_ROCipher;

{
  ¼ÓÃÜ¿â

  Written by caowm (remobjects@qq.com)
  2014Äê9ÔÂ
}

interface

uses
  Classes,
  SysUtils,
  uROClasses,
  uRODECUtil,
  uROEncryption,
  uROHash,
  uROCipher,
  uROHCMngr;

function EncryptString(const PlainText, Algorithm, Password: string;
  StrFormat: Integer=fmtUU): string;

function DecryptString(const CipherText, Algorithm, Password: string;
  StrFormat: Integer=fmtUU): string;

var
  HashManager: TROHashManager;
  CipherManager: TROCipherManager;

implementation


function EncryptString(const PlainText, Algorithm, Password: string;
  StrFormat: Integer): string;
begin
  CipherManager.Algorithm := Algorithm;
  CipherManager.InitKey(Password, nil);
  Result := CipherManager.Cipher.CodeString(PlainText, paEncode, StrFormat);
end;

function DecryptString(const CipherText, Algorithm, Password: string;
  StrFormat: Integer): string;
begin
  CipherManager.Algorithm := Algorithm;
  CipherManager.InitKey(Password, nil);
  Result := CipherManager.Cipher.CodeString(CipherText, paDecode, StrFormat);
end;


initialization
  HashManager := TROHashManager.Create(nil);
  CipherManager := TROCipherManager.Create(nil);

finalization
  FreeAndNil(CipherManager);
  FreeAndNil(HashManager);

end.
