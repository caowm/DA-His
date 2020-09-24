unit uDAStreamableComponent;
{----------------------------------------------------------------------------}
{ Data Abstract Library - Core Library                                       }
{                                                                            }
{ (c)opyright RemObjects Software. all rights reserved.                      }
{                                                                            }
{ Using this code requires a valid license of the Data Abstract              }
{ which can be obtained at http://www.remobjects.com.                        }
{----------------------------------------------------------------------------}

{$I DataAbstract.inc}

interface

uses
  {$IFDEF DELPHIXE2UP}
    System.SysUtils, System.Classes, 
  {$ELSE}
    SysUtils, Classes,
  {$ENDIF}
  uROComponent,uROTypesNextGen;

type
  TDAPersistFormat = (pfBinary, pfXML);

  { TStreamableComponent }
  TPointerArray = array of pointer;

  TDAStreamableComponent = class(TROComponent)
  private
    fTempPropertiesSaved: boolean;
    fTempStorage: TPointerArray;
  protected
    procedure SaveNonStreamableProperties(var TempStorage: TPointerArray); virtual;
    procedure RestoreNonStreamableProperties(const TempStorage: TPointerArray); virtual;
  public
    procedure Clear; virtual;
    procedure LoadFromStream(aStream: TStream; aFormat: TDAPersistFormat = pfXML); virtual;
    procedure LoadFromXml(aXML: string); overload;
    procedure SaveToStream(aStream: TStream; aFormat: TDAPersistFormat = pfXML); virtual;
    procedure LoadFromFile(const aFileName: string; aFormat: TDAPersistFormat = pfXML);
    procedure SaveToFile(const aFileName: string; aFormat: TDAPersistFormat = pfXML);
  end;

implementation

uses
  uROBinaryMemoryStream,
  uDAXMLUtils;

{$IFDEF DELPHI10UP}{$REGION 'TDAStreamableComponent'}{$ENDIF}
{ TDAStreamableComponent }

procedure TDAStreamableComponent.LoadFromStream(aStream: TStream; aFormat: TDAPersistFormat);
var
  oldname: string;
begin
  Clear;

  oldname := Name;
  try Name := ''; except end;
  try
    case aFormat of
      pfBinary: aStream.ReadComponent(Self);
      pfXML: LoadObjectFromStream(aStream, Self, ['Name']);
    end;

    if fTempPropertiesSaved then begin
      RestoreNonStreamableProperties(fTempStorage);
      SetLength(fTempStorage, 0);
    end;
  finally
    fTempPropertiesSaved := FALSE;
    try Name := oldname; except end;
  end;
end;

procedure TDAStreamableComponent.LoadFromXml(aXML: string);
var lStream:TStringStream;
begin
  lStream := TStringStream.Create(aXML, TEncoding.UTF8); // caowm 2019-2-22 原始用的默认编码Ansi
  try
    lStream.Seek(0,TSeekOrigin(soFromBeginning));
    LoadFromStream(lStream,pfXML);
  finally
    lStream.Free();
  end;
end;

procedure TDAStreamableComponent.SaveToStream(aStream: TStream; aFormat: TDAPersistFormat);
var
  oldname: string;
begin
  fTempPropertiesSaved := TRUE;

  oldname := Name;
  //Name := '';
  try
    try
      SaveNonStreamableProperties(fTempStorage);

      case aFormat of
        pfBinary: aStream.WriteComponent(Self);
        pfXML: SaveObjectToStream(Self, aStream, ['Name']);
      end;
    finally
      Name := oldname;
    end;
  except
    fTempPropertiesSaved := FALSE;
    raise;
  end;
end;

procedure TDAStreamableComponent.SaveToFile(const aFileName: string;
  aFormat: TDAPersistFormat);
var
  fs: TFileStream;
begin
  fs := TFileStream.Create(aFileName, fmCreate);
  try
    SaveToStream(fs, aFormat);
  finally
    fs.Free;
  end;
end;

procedure TDAStreamableComponent.LoadFromFile(const aFileName: string;
  aFormat: TDAPersistFormat);
var
  fs: TFileStream;
begin
  fs := TFileStream.Create(aFileName, fmOpenRead OR fmShareDenyWrite);
  try
    LoadFromStream(fs, aFormat);
  finally
    fs.Free;
  end;
end;

procedure TDAStreamableComponent.RestoreNonStreamableProperties(
  const TempStorage: TPointerArray);
begin
end;

procedure TDAStreamableComponent.SaveNonStreamableProperties(
  var TempStorage: TPointerArray);
begin
end;

procedure TDAStreamableComponent.Clear;
begin
end;
{$IFDEF DELPHI10UP}{$ENDREGION}{$ENDIF}

end.
