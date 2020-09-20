unit HisClient_XNHUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ADODB, App_Function;


type
  TVar = array of Variant;
  TVarArray = array of array of Variant;

 T_XNH_01 =  Record  //病人信息
    CoopmedCode : String; //0户编号
    PersonOrder : String; //1人员序号
    AreaCode : String;     //2 区划代码
    PersonName : String;   // 3人员姓名
    Ime_PY : String; //4拼音码
    Ime_WB :String; //5五笔码
    Sex : String; //6性别
    BirthDay : String; //7出生日期
    HomeAdrress : String; //8 家庭住址
    RelationNameCode : String; //9亲属关系代码
    RelationName : String; //10亲属关系名称
    PersonCode : String; //11身份证号
    OpPersonCode : String;//12 承办人代码
    OpPersonName : String; //13承办人姓名
    HouseType : String; //14 户属性//  [1－一般农户；2－五保户；3－贫困户；4－特困户；5－烈军属；9－其他；24表示既是五保户又是特困户]
    HouseHolder : String; //15是否户主//  [1－是；2－否]
    HouseIsXHN : String; //16是否参合 //[1－是；2－否]
    HouseState : String; //17人员状态//[1－正常；2－迁入；4－迁出；4－死亡]
    KindDay : String; //18异动日期
    InXHNYear : String; //19参合年份
    Holder20 : String;  //20保留
    Holder21 : String; //21 保留
    Holder22 : String; //22 保留
    Holder23 : String; //23 保留
    Holder24 : String; //24 保留
    Holder25 : String; //25 保留
    Holder26 : String; //26 保留
 end;


Type
  T_XNH_02 =  Record          //入院登记
    AsOrganID	: String;       //行政区划
    AsAreaCode : string;      //病人所属区划(省级转诊用)
    AsCoopMedCode : String;   //户编号
    AsExpressionsID	: String; //报销公式ID
    AsPatientName	: String;   //入院病人姓名
    AiIDNo: Integer;          //户个人序号
   //AiDiagNo : Integer:       //就医序号
    AsTurnID : Integer;       //转诊序号
    AsIllCode:String;         //入院诊断(合管办提供的疾病代码)
    AsIllName	: String;       //入院诊断(合管办提供的疾病名称)
    AInDate	: TDatetime;      //入院日期
    Adke : String;            //扣额
    AdLimitDef : String;      //限额定义(0－不限；1－限额；2－定额
    AsDoctorName : String;    //主治医生
    AsPatientId	: String;     //住院号
    AsFlag : String;          //是入院还是修改住院信息
    AiDiagNo : String;        //就诊次数
    AsExpenseKind	: String;   //21--住院类型
    AsLimitIllCode : String;  //单病种疾病编码
    DataBuffer: String;       //返回值
    AsBrithday : String;      //出生日期
    AsPersonCode : String;    //身份证号 
  end;

Type
  T_XNH_03 =  Record        //费用明细录入
    AsOrganID:String;     //行政区划
    AsCoopMedCode:String; //合作医疗证号
    AiIDNo:Integer;        //户个人序号
    AiDiagNo:Integer;      //就医序号
    AsItemCode:String;    //新合项目编码
    AsHosCode:String;    //医院项目编码
    ADInputDate : TDateTime;   //录入时间
    AfPrice	: Double;      //单价
    AfNum : Double;        //数量
    AfFee	: Double;        //金额
    AsUnit : String;      //单位量
    AsOfficeName: String;//科室名称
    AsDoctor: String;    //医生
    AsCompound: String;  //单/复方处方标致
    DataBuffer: String;    //
   end;

Type
  T_XNH_04 =  Record          //新农合病人结算、预结算
    AsOrganID	 : String;      //行政区划
    AsCoopMedCode	: String;  //合作医疗证号
    AiIDNo: Integer;       //户个人序号
    AiDiagNo	: Integer;     //就医序号
    APreClearFlag	 : Integer; //预/结算标致（0-预结算，1-结算）
    ADayCount : Integer;     //住院天数
    AOutDate	: TDatetime;   //出院时间
    AJsDate	: TDatetime;     //结算时间
    AOutStatus	: String;    //出院状态（1－治愈；2－好转；3－未愈；4－死亡；9－其他)
    ATotalPrice : Currency;  //费用金额
    ACanPrice : Currency;    //可报销费用
    APrice : Currency;       //报销费用
    DataBuffer :	String;
   end;

Type
  T_XNH_05 =  Record          //取消住院结算
   AsOrganID	: String;       //行政区划
   AsCoopMedCode : String;    //合作医疗证号
   AiIDNo	: Integer;          //户个人序号
   AiDiagNo	: Integer;        //就医序号
   DataBuffer	: String;       //
end;


Type
  T_XNH_06 =  Record          //读取住院结算信息和审批表算
    AsOrganID	: String;       //行政区划
    AsCoopMedCode	: String;   //合作医疗证号
    AiIDNo	: Integer;        //户个人序号
    AiDiagNo	: Integer;      //就医序号
    DataBuffer	: String;     //
   end;

Type
  T_XNH_07 =  Record          //取消入院登记
    AsOrganID	: String;       //行政区划
    AsCoopMedCode	: String;   //合作医疗证号
    AiIDNo	: Integer;        //户个人序号
    AiDiagNo	: Integer;      //就医序号
    DataBuffer	: String;     //
   end;

Type
  T_XNH_08 =  Record          //读省农合卡
    AsAreaID	: String;       //行政区划
    AsCardID	: String;       //卡号
    DataBuffer	: String;     //如果卡号长度大于 10 时 则前6 位 为病人所属区划号，从第七位开始为卡号
   end;

Type
  T_XNH_09 =  Record          //获取转诊病人信息
    AsGrade  :String;         //转诊区划等级 '1' 省级 '2' 地(市)级
    AsOrganID	: String;       //行政区划
    AsAreaID	: String;       //病人所属区划
    AsCardID	: String;       //卡号
    AsCoopmedcode : String;   //农合证号
    AsIDNo  : String;         //个人序号
    DataBuffer	: String;     //如果卡号长度大于 10 时 则前6 位 为病人所属区划号，从第七位开始为卡号
   end;


//Dll Info
function InitDLL(StrError:pchar):integer;stdcall;external 'LxClient.dll';
function GetHzPersonInfo(AsOrganID:pchar;AsCoopMedCode:pchar;DataBuffer:pchar):Integer; stdcall;external 'LxClient.dll';


function SaveInHosInfo(AsOrganID : pchar; AsCoopMedCode :pchar; AsExpressionsID : pchar; AsPatientName:pchar; AiIDNo: Integer;
                       AsIllCode : pchar; AsIllName: pchar; AInDate: pchar; Adke: pchar;AdLimitDef: pchar; AsDoctorName: pchar;
                       AsPatientid : pchar; Asflag : pchar; AiDiagNo: pchar; AsExpenseKind : PChar;
                       AsLimitIllCode :PChar; DataBuffer:pchar): Integer; stdcall; external 'LxClient.dll';
function SaveFreeList(AsOrganID :pchar; AsCoopMedCode:pchar;AiIDNo : Integer ; AiDiagNo : Integer;
                      AsItemCode : pchar; AsHosCode : pchar; ADInputDate: pchar;
                      AfPrice : Double; AfNum : Double; AfFee : Double;
                      AsUnit :pchar; AsOfficeName : pchar; AsDoctor : pchar; AsCompound: pchar;
                      DataBuffer: pchar): Integer; stdcall;external 'LxClient.dll';
//读取转诊基本信息                      
function GetParmItem(AsOrganID:pchar;AsKind:pchar;DataBuffer:pchar):Integer; stdcall; external 'LxClient.dll';
function GetCheckItem(AsOrganID:pchar):Integer; stdcall; external 'LxClient.dll';
function PreClearing(AsOrganID, AsCoopMedCode: pchar; AiIDNo, AiDiagNo, APreClearFlag: Integer; ADayCount: Integer;
                     AOutDate, AJsDate, AOutStatus,DataBuffer : pchar): Integer; stdcall;external 'LxClient.dll';
function GetCalcFee(AsOrganID, AsCoopMedCode: pchar;AiIDNo, AiDiagNo:integer;DataBuffer:pchar): Integer; stdcall; external 'LxClient.dll';
function CanceCalcFee(AsOrganID :pchar;AsCoopMedCode:pchar;AiIDNo : Integer; AiDiagNo:Integer;DataBuffer:pchar): Integer; stdcall; external 'LxClient.dll';
function DeleteHosInfo(AsOrganID :pchar;AsCoopMedCode : pchar; AiIDNo : Integer;AiDiagNo : Integer;DataBuffer : pchar):Integer; stdcall; external 'LxClient.dll';
function TestComConn(ComI:Integer):Integer; stdcall;external 'LxClient.dll';
function zzUser_ReadCard(COMI: integer; rData: PChar):Integer; stdcall;external 'LxClient.dll';
function GetCoopMedCodeByCardID(aOrganID, aCardID: PChar; DataBuffer: PChar): Integer;stdcall;external 'LxClient.dll';
function zzGetCoopMedCodeByCardID(aOrganID,aAreaCode,aCardID:PChar;DataBuffer:PChar): Integer;stdcall;external 'LxClient.dll';
function GetZzinfo_zz(aGrade, aAreaCode: pchar; DataBuffer: pchar): Integer; stdcall;external 'LxClient.dll';
function DeleteFeeList(AsOrganID, AsCoopMedCode: pchar; AiIDNo, AiDiagNo: integer;
DataBuffer: pchar): Integer; stdcall;external 'LxClient.dll';
//用于省级转诊入院
function zzSaveInHosInfo(AsOrganID, aAreaCode, AsCoopMedCode, AsExpressionsID: pchar;AiIDNo, aTurnID: Integer;
                         AsIllCode, AsIllName, AInDate, Adke, AdLimitDef, AsDoctor, AsPatientId, AsExpenseKind,AsLimitIllCode,
                         DataBuffer: Pchar): Integer; stdcall; external 'LxClient.dll';


//内部函数
//输入农合数组返回<>
//分解返回值
function ExChangeXNHText(DataBuffer : Pchar; FCount : Integer) : TVarArray;
//分解返回值
function ExChangeText(DataBuffer : Pchar; FCount : Integer; TextKind : string = '|') : TVar; overload;
function ExChangeText(DataBuffer : Pchar; TextKind : string = '|') : TVarArray; overload;
function ExChangeText(DataBuffer : Pchar; LineKind : string = '##'; TextKind : String ='@@') : TVarArray; overload;


//动态链接库初始化
function XNH_Init : Boolean;
//获取病人信息
function XNH_GetHzPersonInfo(AsOrganID : String; AsCoopMedCode: String;
          ModifySign : Boolean=True) : Boolean;
//入院病人登记
function XNH_SaveInHosInfo : Boolean;
//取消入院病人登记
function XNH_DeleteInHosInfo : Boolean;
//清除病人基本信息数组
procedure XNH_ClearInHospInfo;
//费用明细录入
function XNH_SaveFreeList : Boolean;
//新农合病人结算、预结算
function XNH_OutReg(var RFile : TVar) : Boolean;
//新农合病人取消结算
function XNH_CancelOutReg : Boolean;
//指定新农合入院信息
function XNH_GetInHosoInfo(InHospID : Integer) : Boolean;
//读取住院结算信息
function XNH_GetCalcFee : Boolean;
//测试读卡器
function XNH_TestComConn(ComID : Integer) : Boolean;
//读取刷卡信息并解密获得卡号
function XNH_zzUser_ReadCard(COMI: integer):Boolean;
//根据卡号获得农合证号
function XNH_ZZGetCoopMedCodeByCardID(DefaultOrgerID:string;GradeID : String):Boolean;
//获取转诊病人信息(省级1，地市级2)
function XNH_GetZzinfo_zz:Boolean;
// 读取转诊基本信息
function XNH_GetParmItem : Boolean;
//省级转诊入院病人登记
function XNH_zzSaveInHosInfo : Boolean;



var
  G_NHOrganID : String;                    //新农合区域ID
  G_NHCoopMedCode : String;                //合作医疗证号
  G_NHIDNo : Integer;                      //户个人序号
  G_NHDiagNo : Integer;                    //就医序号
  G_NHInHosp : T_XNH_02;                   //新农合入院信息
  G_NHCurrInHosp : T_XNH_02;               //指定新农合入院信息
  G_NHDeteleInHosp : T_XNH_07;             //取消新农合入院信息
  G_NHFeeDetail : T_XNH_03;
  G_NHBalance : T_XNH_04;                  //农合结算
  G_NHReadCardID : T_XNH_08;               //读卡信息
  G_NHZZInfo : T_XNH_09;                   //省农合转诊信息
  // G_NHPubInfo : T_XNH_06;               //农合公共基本信息(用于)


implementation


function ExChangeXNHText(DataBuffer : Pchar; FCount : Integer) : TVarArray;
Var I,RCount : Integer;
    S ,S1: String;
    FStrPos : Array of Integer;
    RCountStr : Array of String;  //记录数
begin

 S := PChar(DataBuffer);
 S := Trim(S) + '$$|';
 RCount := 0;
//按$$进行分解
 while Pos('$$|',S) > 1 do
 begin
   SetLength(RCountStr,RCount+1);
   RCountStr[RCount]:= Copy(S,1,Pos('$$|',S)-1);
   S := Copy(S,Pos('$$|',S)+3,(length(S)+3-Pos('$$|',S)));
   Inc(RCount);
 end;

 // ShowOK(InttoStr(RCount));
 //按|对分解行进行拆分
   SetLength(Result,RCount,FCount); //对返回值进行列表设置
 for RCount := Low(RCountStr) to High(RCountStr) do
   begin
     //if (Copy(S,I,1) = '|') and (I <> 1) then  //第一个字符不能为"|"
      S := RCountStr[RCount];
      for I := 0 to FCount - 1 do
      begin
        Result[RCount,I] := Copy(S,1,Pos('|',S)-1);
        S := Copy(S,Pos('|',S)+1,(length(S)-Pos('|',S)));
      end;
   end;

end;


function ExChangeText(DataBuffer : Pchar; FCount : Integer; TextKind : string = '|') : TVar;
Var I,RCount,TextLength : Integer;
    S ,S1,Kind: String;
    FStrPos : Array of Integer;
    RCountStr : Array of String;  //记录数
begin
  //1
  S := PChar(DataBuffer);
  Kind := TextKind;
  TextLength := Length(TextKind);
  S := Trim(S) + TextKind;
  SetLength(Result,0);
  SetLength(Result,FCount); //对返回值进行列表设置
  for I := Low(Result) to High(Result) do
   begin
     Result[I] := Trim(Copy(S,TextLength,Pos(TextKind,S)-TextLength));
     S := Copy(S,Pos(TextKind,S)+TextLength,(length(S)-Pos(TextKind,S)));
   end;
end;


function ExChangeText(DataBuffer : Pchar; TextKind : string = '|') : TVarArray; overload;
Var I,RCount,TextLength : Integer;
    S ,S1,Kind: String;
    FStrPos : Array of Integer;
    RCountStr : Array of String;  //记录数
begin
 try
   //2
  S := PChar(DataBuffer);
  //去除 Chr(13)
  while Pos(Chr(13),S) > 1 do
  begin
    I := Pos(Chr(13),S);
    Insert('|',S,Pos(Chr(13),S));
    Delete(S,I+1,Length(Chr(13)));
    //'从1500至5000部分        @@3500@@55%@@1925
    // ||从5000至999999部分      @@33023.8021@@60%@@19814.2813
    //|| || || || || ##超过公式定义年度封顶线：17158.71元'
  end;

  //按||进行分解
  Kind := '|';
  TextLength := Length(Kind);
  S := S + Kind;
  RCount := 0;
 while Pos(Kind,S) > 1 do
 begin
   SetLength(RCountStr,RCount+1);
   RCountStr[RCount]:= Copy(S,1,Pos(Kind,S)-1);
   S := Copy(S,Pos(Kind,S)+TextLength,(length(S)+TextLength-Pos(Kind,S)));
   Inc(RCount);
 end;

  //按@@对分解行进行拆分
 SetLength(Result,RCount,4); //对返回值进行列表设置
 Kind := '@@';
 TextLength := Length(Kind);
 for RCount := 0 to RCount - 1 do
   begin
      S := RCountStr[RCount]+Kind;
      for I := 0 to 3 do
      begin
        Result[RCount,I] := Trim(Copy(S,1,Pos(Kind,S)-TextLength+1));
        S := Copy(S,Pos(Kind,S)+TextLength,(length(S)-Pos(Kind,S)));
      end;
   end;
 except
  ShowError('折分公式出错!');
 end;

end;


function ExChangeText(DataBuffer : Pchar; LineKind : string = '##'; TextKind : string ='@@') : TVarArray; overload;
Var I,RCount,TextLength : Integer;
    S ,S1,Kind: String;
    FStrPos : Array of Integer;
    RCountStr : Array of String;  //记录数
begin
 try
   //3
  S := PChar(DataBuffer);
  //去除 Chr(13)
 { while Pos(Chr(13),S) > 1 do
  begin
    I := Pos(Chr(13),S);
    Insert('|',S,Pos(Chr(13),S));
    Delete(S,I+1,Length(Chr(13)));
    //'从1500至5000部分        @@3500@@55%@@1925
    // ||从5000至999999部分      @@33023.8021@@60%@@19814.2813
    //|| || || || || ##超过公式定义年度封顶线：17158.71元'
  end;  }

  //按##进行分解  按行
  Kind := LineKind;
  TextLength := Length(Kind);
  S := S + Kind;
  S := Trim(S);
  RCount := 0;
  while Pos(Kind,S) > 0 do
  begin
   SetLength(RCountStr,RCount+1);
   RCountStr[RCount]:= Copy(S,1,Pos(Kind,S)-1);
   S := Copy(S,Pos(Kind,S)+TextLength,(length(S)+TextLength-Pos(Kind,S)));
   Inc(RCount);
  end;

  //按@@对分解行进行拆分  按列
 SetLength(Result,RCount,4); //对返回值进行列表设置
 Kind := TextKind;
 TextLength := Length(Kind);
 for RCount := 0 to RCount - 1 do
   begin
      S := RCountStr[RCount]+Kind;
      for I := 0 to 3 do
      begin
        Result[RCount,I] := Trim(Copy(S,1,Pos(Kind,S)-TextLength+1));
        S := Copy(S,Pos(Kind,S)+TextLength,(length(S)-Pos(Kind,S)));
      end;
   end;
 except
  ShowError('折分公式出错!');
 end;

end;

function XNH_Init : Boolean;
Var OutPchar : PChar;
begin
try
  GetMem(OutPchar,1024);
 if InitDLL(OutPchar) <> 0 then
   begin
    ShowError('农合前置机启动出错:'+Pchar(OutPchar));
    Result := False;
   end
   else
    Result := True;
finally
  FreeMem(OutPchar);
end;

end;


function XNH_GetHzPersonInfo(AsOrganID : String; AsCoopMedCode: String; ModifySign : Boolean) : Boolean;
Var OutPchar : PChar;
    ReList : TVarArray;
    RCount,I ,J: Integer;
    S : String;
begin
  try
     Result := False;
     GetMem(OutPchar,2024);
     XNH_Init;
    if GetHzPersonInfo(PChar(AsOrganID),Pchar(AsCoopMedCode),OutPchar) <> 0 then
     begin
       ShowError(Pchar(OutPchar));
       //FreeMem(OutPchar);
       Exit;
     end;

     ReList := ExChangeXNHText(OutPchar,27);

    if ModifySign then  //修改数据库中的数据
      begin
       S := 'Delete from XNH_PersonInfo where CoopmedCode = '''+AsCoopMedCode+''''+
            ' and  AreaCode = '''+ AsOrganID+'''';
//       Dm.PubQryExec1(S);
      end;

//       with Dm_Xnh.Q_XNH_PersonInfo do
//       begin
//         if Active then Active := false;
//         Parameters.ParamByName('CoopmedCode').Value := AsCoopMedCode;
//         Parameters.ParamByName('AreaCode').Value := AsOrganID;
//         Active := True;
//
//          for J := Low(ReList) to High(ReList) do
//          begin
//            Append;
//             for I := 0 to 25 do
//              begin
//               Fields[I+1].Value := Trim(ReList[J,I]);
//              end;
//            Post;
//           end;
//         UpdateBatch(arAll);
//       end;

     Result := True;

  finally
     //FreeMem(OutPchar);
  end;
end;



function XNH_SaveInHosInfo : Boolean;
Var OutPchar : PChar;
begin
      Result := False;
      GetMem(OutPchar,1024);
  if  SaveInHosInfo(PChar(G_NHInHosp.AsOrganID),
                    PChar(G_NHInHosp.AsCoopMedCode),
                    PChar(G_NHInHosp.AsExpressionsID),
                    PChar(G_NHInHosp.AsPatientName),
                    G_NHInHosp.AiIDNo,
                    PChar(G_NHInHosp.AsIllCode),
                    PChar(G_NHInHosp.AsIllName),
                    PChar(FormatDateTime('YYYY-MM-DD HH:MM:SS',G_NHInHosp.AInDate)),
                    PChar(G_NHInHosp.Adke),
                    PChar(G_NHInHosp.AdLimitDef),
                    PChar(G_NHInHosp.AsDoctorName),
                    PChar(G_NHInHosp.AsPatientId),
                    PChar(G_NHInHosp.AsFlag),
                    PChar(G_NHInHosp.AiDiagNo),
                    PChar(G_NHInHosp.AsExpenseKind),
                    PChar(G_NHInHosp.AsLimitIllCode),
                    OutPchar) <> 0 then
         begin
          ShowError(Pchar(OutPchar));
          Exit;
         end;
      G_NHInHosp.DataBuffer := PChar(OutPchar);
      Result := True;
end;


function XNH_DeleteInHosInfo : Boolean;
Var OutPchar : PChar;
begin
    Result := False;
    GetMem(OutPchar,1024);
    if DeleteHosInfo(PChar(G_NHDeteleInHosp.AsOrganID),
                     PChar(G_NHDeteleInHosp.AsCoopMedCode),
                           G_NHDeteleInHosp.AiIDNo,
                           G_NHDeteleInHosp.AiDiagNo,
                           OutPchar) <> 0 then
       begin
        ShowError(Pchar(OutPchar));
        Exit;
       end;
    Result := True;
end;


procedure XNH_ClearInHospInfo;
begin
G_NHInHosp.AsOrganID := '';
G_NHInHosp.AsCoopMedCode := '';   //户编号
G_NHInHosp.AsExpressionsID := ''; //报销公式ID
G_NHInHosp.AsPatientName := '';   //入院病人姓名
G_NHInHosp.AiIDNo := 0;          //户个人序号
G_NHInHosp.AsIllCode := '';       //入院诊断(合管办提供的疾病代码)
G_NHInHosp.AsIllName := '';       //入院诊断(合管办提供的疾病名称)
G_NHInHosp.AInDate := date;      //入院日期
G_NHInHosp.Adke := '';            //扣额
G_NHInHosp.AdLimitDef := '';      //限额定义(0－不限；1－限额；2－定额
G_NHInHosp.AsDoctorName := '';    //主治医生
G_NHInHosp.AsPatientId := '';     //住院号
G_NHInHosp.AsFlag := '0';         //是入院还是修改住院信息
G_NHInHosp.AiDiagNo := '';        //就诊次数
G_NHInHosp.AsExpenseKind	:= '';  //21--住院类型
G_NHInHosp.AsTurnID := 0;         //转诊序号 (省级转诊)
G_NHInHosp.DataBuffer := '';      //返回值

end;



//费用明细录入
function XNH_SaveFreeList : Boolean;
Var I,J : Integer;
    OutPchar : PChar;
begin
   Result := False;
   GetMem(OutPchar,1024);
  // for I := Low(G_NHFeeDetail) to High(G_NHFeeDetail) do
  // begin
    if SaveFreeList(PChar(G_NHFeeDetail.AsOrganID),
                    PChar(G_NHFeeDetail.AsCoopMedCode),
                    G_NHFeeDetail.AiIDNo,
                    G_NHFeeDetail.AiDiagNo,
                    PChar(G_NHFeeDetail.AsItemCode),
                    PChar(G_NHFeeDetail.AsHosCode),
                    PChar(FormatDateTime('YYYY-MM-DD HH:MM:SS',G_NHFeeDetail.ADInputDate)),
                    G_NHFeeDetail.AfPrice,
                    G_NHFeeDetail.AfNum,
                    G_NHFeeDetail.AfFee,
                    PChar(G_NHFeeDetail.AsUnit),
                    PChar(G_NHFeeDetail.AsOfficeName),
                    PChar(G_NHFeeDetail.AsDoctor),
                    PChar(G_NHFeeDetail.AsCompound),
                    OutPchar) <> 0 then
      begin
        ShowError(Pchar(OutPchar));
        ShowError('编号：'+G_NHFeeDetail.AsHosCode+','+G_NHFeeDetail.DataBuffer);
        Exit;
       end;
 //  end;
    Result := True;
end;


//新农合病人结算、预结算
function XNH_OutReg(var RFile : TVar) : Boolean;
Var OutPchar : PChar;
begin
    Result := False;
    GetMem(OutPchar,1024);
    if PreClearing(PChar(G_NHBalance.AsOrganID),
                   PChar(G_NHBalance.AsCoopMedCode),
                   G_NHBalance.AiIDNo,
                   G_NHBalance.AiDiagNo,
                   G_NHBalance.APreClearFlag,
                   G_NHBalance.ADayCount,
                   PChar(FormatDateTime('YYYY-MM-DD HH:MM:SS',G_NHBalance.AOutDate)),
                   PChar(FormatDateTime('YYYY-MM-DD HH:MM:SS',G_NHBalance.AJsDate)),
                   PChar(G_NHBalance.AOutStatus),
                   OutPchar) <> 0 then
      begin
        ShowError(Pchar(OutPchar));
        Exit;
       end;

    G_NHBalance.DataBuffer := Pchar(OutPchar);
    RFile := ExChangeText(Pchar(OutPchar),10);
    Result := True;
end;



//新农合病人取消结算
function XNH_CancelOutReg : Boolean;
Var OutPchar : PChar;
begin
    Result := False;
    GetMem(OutPchar,1024);
   if CanceCalcFee(PChar(G_NHBalance.AsOrganID),
                   PChar(G_NHBalance.AsCoopMedCode),
                   G_NHBalance.AiIDNo,
                   G_NHBalance.AiDiagNo,
                   OutPchar) <> 0 then
      begin
        ShowError(Pchar(OutPchar));
        Exit;
       end;

    G_NHBalance.DataBuffer := Pchar(OutPchar);

    Result := True;


    if ShowYesNo('您确定删除当前病人已上传记录吗?') then
      begin
       if DeleteFeeList(PChar(G_NHBalance.AsOrganID),
                        PChar(G_NHBalance.AsCoopMedCode),
                        G_NHBalance.AiIDNo,
                        G_NHBalance.AiDiagNo,OutPchar) <> 0 then
          begin
            ShowError(Pchar(OutPchar));
            Exit;
          end
          else ShowOK('病人已上传记录删除成功！');
      end;
end;    



//指定新农合入院信息
function XNH_GetInHosoInfo(InHospID : Integer) : Boolean;
Var S : string;
begin
 Result := False;
 S := 'Select * from XNH_InHosp where InHospID = ' + IntToStr(InHospID);
// Dm.PubQry2(S);
//
// if Dm.PubQuery2.RecordCount <= 0 then
//   begin
//     ShowWarning('当前农合病人入院信息不存在，请核对后输入！');
//     Exit;
//   end;
//
// with Dm.PubQuery2 do
// begin
//   G_NHCurrInHosp.AsOrganID := FieldByName('AsOrganID').AsString;
//   G_NHCurrInHosp.AsCoopMedCode := FieldByName('AsCoopMedCode').AsString;
//   G_NHCurrInHosp.AsExpressionsID := FieldByName('AsExpressionsID').AsString;
//   G_NHCurrInHosp.AsPatientName := FieldByName('AsPatientName').AsString;
//   G_NHCurrInHosp.AiIDNo := FieldByName('AiIDNo').AsInteger;
//   G_NHCurrInHosp.AsIllCode := FieldByName('AsIllCode').AsString;
//   G_NHCurrInHosp.AsIllName := FieldByName('AsIllName').AsString;
//   G_NHCurrInHosp.AInDate := FieldByName('AInDate').AsDateTime;
//   G_NHCurrInHosp.Adke := FieldByName('Adke').AsString;
//   G_NHCurrInHosp.AdLimitDef := FieldByName('AdLimitDef').AsString;
//   G_NHCurrInHosp.AsDoctorName := FieldByName('AsDoctorName').AsString;
//   G_NHCurrInHosp.AsPatientId := FieldByName('AsPatientId').AsString;
//   G_NHCurrInHosp.AsFlag := FieldByName('AsFlag').AsString;
//   G_NHCurrInHosp.AiDiagNo := FieldByName('AiDiagNo').AsString;
//   G_NHCurrInHosp.AsExpenseKind := FieldByName('AsExpenseKind').AsString;
//   G_NHCurrInHosp.DataBuffer := FieldByName('DataBuffer').AsString;
// end;

 Result := True;

end;


//读取住院结算信息
function XNH_GetCalcFee : Boolean;
const LineText1 = '$$';
      LineText3 = '@@';

Var OutPchar : PChar;
    I,J,RCount : Integer;
    S ,S1: String;
    FStrPos : Array of Integer;
    RCountStr : Array of String;  //记录数
    ReFileStr,ReFile : TVar;  //记录字段信息
    ReArrayFlieStr : TVarArray;
begin
  {
 1003001047|马茂红|马茂红|男||本人或户主||武汉市长航总院|2010-11-02|2010-12-15|43||前列腺增生|4|12992.02|7870.79|4030.22|0||||||||$$##00|药品费|2670.44|847.435|0##01|住院费|221|195|0##02|一般检查费|812.7|691.2|0##03|大型检查费|216|108|0##04|手术费|4065|3915|0##05|治疗费|1248.35|1081.41|0##06|诊疗费|459.5|171.5|0##07|其他|3299.03|861.24|0$$##从0至999999部分@@7870.785@@51%@@4014.1004##国家基本药物@@322.427@@5%@@16.1214##########同一疾病同一医院多次住院减免起付线；'
  }
 try
    Result := False;
    GetMem(OutPchar,1024);
   if GetCalcFee(PChar(G_NHBalance.AsOrganID),
                 PChar(G_NHBalance.AsCoopMedCode),
                 G_NHBalance.AiIDNo,
                 G_NHBalance.AiDiagNo,
                 OutPchar) <> 0 then
      begin
        ShowError(Pchar(OutPchar));
        G_NHBalance.DataBuffer := '';
        Exit;
      end;
    G_NHBalance.DataBuffer := Pchar(OutPchar);

   //--------------------------------------------------------->>分解线段
    S := PChar(G_NHBalance.DataBuffer);
    S := Trim(S) + LineText1;
    RCount := 0;
   //按$$进行分解
   while Pos(LineText1,S) > 1 do
   begin
     SetLength(RCountStr,RCount+1);
     RCountStr[RCount]:= Copy(S,1,Pos(LineText1,S)-1);
     S := Copy(S,Pos(LineText1,S)+2,(length(S)+2-Pos(LineText1,S)));
     Inc(RCount);
   end;

//   Dm_XNH.XNHClearOutHospInfo := G_CurrHospID; //清空结算审批表信息
//   //--------------------------------------------------------->>更新第一线段
//   ReFileStr := ExChangeText(PChar(RCountStr[0]),22,'|');
//   ReFileStr[11] := G_CurrHospID;
//
//   with Dm_XNH.Q_XNH_OutHospInfo1 do
//     begin
//       Append;
//       for I := Low(ReFileStr) to High(ReFileStr) do
//       begin
//         Fields.Fields[I].Value := IsNullRv(ReFileStr[I],null);
//       end;
//       Post;
//       UpdateBatch(arall);
//       G_NHBalance.ATotalPrice := FieldByName('TotalPrice').AsCurrency;
//       G_NHBalance.ACanPrice := FieldByName('CanPrice').AsCurrency;
//       G_NHBalance.APrice := FieldByName('Price').AsCurrency;
//     end;

   //--------------------------------------------------------->>更新第二线段
   ReFileStr := ExChangeText(PChar(Copy(RCountStr[1],3,Length(RCountStr[1])-2)),8,'##');

   for I := Low(ReFileStr) to High(ReFileStr) do
       begin
         ReFile := ExChangeText(PChar(VarToStr(ReFileStr[I])),5,'|');
//         with Dm_XNH.Q_XNH_OutHospInfo2 do
//           begin
//             Append;
//             for J := Low(ReFile) to High(ReFile) do
//             begin
//               Fields.Fields[J+1].Value := ReFile[J];
//             end;
//             Fields.Fields[0].Value := G_CurrHospID;
//             Post;
//             UpdateBatch(arall);
//           end;
       end;

   //--------------------------------------------------------->>更新第三线段
    ReArrayFlieStr := ExChangeText(PChar(RCountStr[2]),'##','@@');

//     with Dm_XNH.Q_XNH_OutHospInfo3 do
//     begin
//       Append;
//       for I := Low(ReArrayFlieStr) to High(ReArrayFlieStr) do
//       begin
//         if ReArrayFlieStr[I,0] <> '' then
//          begin
//           Append;
//           FieldByName('HospID').Value := G_CurrHospID;
//           FieldByName('Line').AsString := ReArrayFlieStr[I,0];
//           IF ReArrayFlieStr[I,1] = '' then
//             FieldByName('CanPrice').AsCurrency := 0
//            ELSE
//             FieldByName('CanPrice').AsString := IsNullRv(ReArrayFlieStr[I,1],'0');
//
//            IF ReArrayFlieStr[I,2] = '' then
//             FieldByName('CanRatio').AsString := '0%'
//            ELSE
//             FieldByName('CanRatio').AsString := IsNullRv(ReArrayFlieStr[I,2],'0');
//
//           //FieldByName('CanRatio').AsString := ReArrayFlieStr[I,2];
//
//           if ReArrayFlieStr[I,3] = '' then
//             FieldByName('Price').AsCurrency := 0
//            else
//             FieldByName('Price').AsString := IsNullRv(ReArrayFlieStr[I,3],'0');
//           Post;
//          end;
//         UpdateBatch(arall);
//      end;
//       if State in [dsEdit, dsInsert] then Post;
//       UpdateBatch(arall);
//     end;

    Result := True;
   except
    abort;
   end;

end;

function XNH_TestComConn(ComID : Integer) : Boolean;
begin
 if TestComConn(ComID) <>0 then
   begin
    ShowError('读卡器Com口指定出错，请先设置为Com4。');
    Result := False
   end
  else Result := True; 
end;

function XNH_zzUser_ReadCard(COMI : integer):Boolean;
var I : Integer;
 S: String;
 OutPchar : PChar;
begin
 if not XNH_TestComConn(COMI) then Exit;
 ShowWarning('读卡器红灯亮后请读卡！');

try
  GetMem(OutPchar,1024);
 if zzUser_ReadCard(COMI,OutPchar) <> 0 then
   begin
    ShowError('读卡启动出错:'+Pchar(OutPchar));
    G_NHReadCardID.DataBuffer := '';
    Result := False;
   end
   else
    begin
     S := Pchar(OutPchar);
     G_NHReadCardID.AsAreaID:= Trim(Copy(S,0,6));
     G_NHReadCardID.AsCardID := Trim(Copy(S,7,10));
     Result := True;
     ShowOK('读卡成功！');
    end;
finally
  FreeMem(OutPchar);
end;
end;


function XNH_ZZGetCoopMedCodeByCardID(DefaultOrgerID:string;GradeID:String):Boolean;
var I : Integer;
 S: String;
 OutPchar,aAreaCode,aCardID,aOrganID : PChar;
 OutPut : TVar;
begin
try
 if GradeID = '3' then
   begin
    GradeID := '1';  //3为非读卡 转为1省级
   end
  else
   begin
    if not XNH_zzUser_ReadCard(4) then Exit;
   end; 

  aOrganID := PChar(DefaultOrgerID);
  aAreaCode := PChar(G_NHReadCardID.AsAreaID);
  aCardID := PChar(G_NHReadCardID.AsCardID);

//手工办省农合
 { aOrganID := PChar('420000');
  aAreaCode := PChar('420922');
  aCardID := PChar('116949');
 }
  GetMem(OutPchar,1024);
  //省级转诊
 if (GradeID='1') and (zzGetCoopMedCodeByCardID(aOrganID,aAreaCode,aCardID,OutPchar) <> 0) then
   begin
    ShowError('读卡启动出错:'+Pchar(OutPchar));
    Result := False;
   end
   //市级
  else if (GradeID='2') and (GetCoopMedCodeByCardID(aOrganID,aCardID,OutPchar) <> 0) then
   begin
    ShowError('读卡启动出错:'+Pchar(OutPchar));
    Result := False;
   end
 else
    begin
     S := Pchar(OutPchar);
     OutPut := ExChangeText(OutPchar,2,'|');
     //成功后写入转诊病人信息
     G_NHZZInfo.AsGrade := GradeID;     //省级1 ,地(市)级2
     G_NHZZInfo.AsOrganID := aOrganID;
     G_NHZZInfo.AsAreaID :=  aAreaCode;
     G_NHZZInfo.AsCardID := aCardID;
     G_NHZZInfo.AsCoopmedcode := OutPut[0];    //新合号：
     G_NHZZInfo.AsIDNo := OutPut[1];           //个人序号：
     Result := True;
    end;
finally
  FreeMem(OutPchar);
end;

end;


function XNH_GetZzinfo_zz:Boolean;
var
 S: String;
 OutPchar,AsGrade,AsAreaCode: PChar;
 AsIDNo : Integer;
 ReList : TVarArray;
begin
try
  //if PutOutPchar <> nil then FreeMem(OutPchar);

  GetMem(OutPchar,10240);

 //G_NHZZInfo.AsGrade := '1';
 //G_NHZZInfo.AsOrganID :='420000';;
 //G_NHZZInfo.AsAreaID := '429901';
 //G_NHZZInfo.AsCoopmedcode :='0101010107';
 //G_NHZZInfo.AsIDNo := '1';

 AsGrade := PChar(G_NHZZInfo.AsGrade);
 AsAreaCode := PChar(Trim(G_NHZZInfo.AsOrganID)+'$$'+
               Trim(G_NHZZInfo.AsAreaID)+'$$'+
               Trim(G_NHZZInfo.AsCoopmedcode)+'$$'+
               Trim(G_NHZZInfo.AsIDNo));


{ AsOrganID := PChar(G_NHZZInfo.AsOrganID);
 AsAreaID := PChar(G_NHZZInfo.AsAreaID);
 AsCoopmedcode := PChar(G_NHZZInfo.AsCoopmedcode);
 AsIDNo  := StrToInt(G_NHZZInfo.AsIDNo);
 }
 if GetZzinfo_zz(AsGrade,AsAreaCode,OutPchar) <> 0 then
   begin
    ShowError('获取转诊病人信息:'+Pchar(OutPchar));
    Result := False;
   end
 else
    begin
     if OutPchar = nil then
       begin
        ShowError('数据传输出错，请重试！');
        Result := False;
        Exit;
       end;
     S := Pchar(OutPchar);
     ReList := ExChangeXNHText(OutPchar,19);
     G_NHInHosp.AsCoopMedCode :=ReList[0,0];       //0新合号
     G_NHInHosp.AsPatientName :=ReList[0,1];   //1病人姓名
     G_NHInHosp.AiIDNo :=ReList[0,2];          //2个人序号
     G_NHInHosp.AsAreaCode :=ReList[0,3];      //3病人所属区划
     G_NHInHosp.AsTurnID :=ReList[0,4];         //4转诊序号
     G_NHInHosp.AsIllCode :=ReList[0,5];       //5疾病编号
     G_NHInHosp.AsIllName :=ReList[0,6];       //6疾病名称
     //G_NHInHosp. :=ReList[0,7];              //7转前医院
     //G_NHInHosp.AsOrganID :=ReList[0,8];       //8转诊原因
     //G_NHInHosp.AsOrganID :=ReList[0,9];       //9审批意见
     //G_NHInHosp.AsOrganID :=ReList[0,10];      //10审批单位
     //G_NHInHosp.AsOrganID :=ReList[0,11];      //11审批日期
     G_NHInHosp.AsPersonCode :=ReList[0,12];      //12身份证号
     G_NHInHosp.AsBrithday :=ReList[0,13];      //13出生日期
     //G_NHInHosp.AsOrganID :=ReList[0,14];      //14预留
     //G_NHInHosp.AsOrganID :=ReList[0,15];      //15预留
     //G_NHInHosp.AsOrganID :=ReList[0,16];      //16预留
     //G_NHInHosp.AsOrganID :=ReList[0,17];      //17预留
     //G_NHInHosp.AsOrganID :=ReList[0,18];      //18预留
     Result := True;
    end;
finally
   FreeMem(OutPchar);
end;


end;


function XNH_GetParmItem : Boolean;
{类型
1：疾病代码表；
2：报销公式目录；
3：报销项目目录；
4：医院对应项目；
5：行政区划；
6：单病种信息表；
7：统计科室 }
var
 S: String;
 OutPchar : PChar;
begin
 GetMem(OutPchar,50000);
 GetParmItem('420000','2',OutPchar);
 S := Pchar(OutPchar);
end;



function XNH_zzSaveInHosInfo : Boolean;
Var OutPchar : PChar;
begin
      Result := False;
      GetMem(OutPchar,1024);
  if  zzSaveInHosInfo(PChar(G_NHInHosp.AsOrganID),
                    PChar(G_NHInHosp.AsAreaCode),
                    PChar(G_NHInHosp.AsCoopMedCode),
                    PChar(G_NHInHosp.AsExpressionsID),
                    G_NHInHosp.AiIDNo,
                    G_NHInHosp.AsTurnID,
                    PChar(G_NHInHosp.AsIllCode),
                    PChar(G_NHInHosp.AsIllName),
                    PChar(FormatDateTime('YYYY-MM-DD HH:MM:SS',G_NHInHosp.AInDate)),
                    PChar(G_NHInHosp.Adke),
                    PChar(G_NHInHosp.AdLimitDef),
                    PChar(G_NHInHosp.AsDoctorName),
                    PChar(G_NHInHosp.AsPatientId),
                    PChar(G_NHInHosp.AsExpenseKind),
                    PChar(G_NHInHosp.AsLimitIllCode),
                    OutPchar) <> 0 then
         begin
          ShowError(Pchar(OutPchar));
          Exit;
         end;
      G_NHInHosp.DataBuffer := PChar(OutPchar);
      Result := True;
end;



end.





