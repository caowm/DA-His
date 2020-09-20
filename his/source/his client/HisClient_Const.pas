unit HisClient_Const;

{
  由于风格单元问题，此文件要放在App_DevExpress之前。

  命名规则
  ============================================
  单元名称：Xxxxx_Yyyyyy;  (下划线连接)
  字符常量：sXxxxxYyyyyy;  (s开头+...)
  数字常量：iXxxxxYyyyyy;  (i开头+...)
  数组常量：dXxxxxYyyyyy;  (a开头+...)

  全局对象：XxxxxxYyyyyy;  (形容词+名词+...)
  类名称：  TXxxxxYyyyyy;  (T开头+名词...)
  参数名称：AXxxxx;        (A开头+...)
  函数名称：XxxxxxYyyyyy;  (动词+名词+...)
  =============================================
}

interface

uses
  App_Common,
  uROSOAPMessage,
  uROXmlRpcMessage,
  uROIndyHTTPChannel,
  uROIndyTCPChannel,
  uROSuperTCPChannel,
  dxSkinsdxBarPainter,
  dxSkinsdxStatusBarPainter,
  dxSkiniMaginary,
  dxSkinDarkSide,
  dxSkinSpringTime,
  dxSkinLilian;

const
  sAppID = 'DAHis';
  sAppVer = '2020.09.18';
  sAppDesigner = 'caowm';

const
  // HIS功能号
  iFunctionID_HisBase = 256;
  iFunctionID_InputClinID = iFunctionID_HisBase + 1;
  iFunctionID_InputHospID = iFunctionID_HisBase + 2;

const
  iOperationFlag_ClinPatient = $00000100;
  iOperationFlag_ClinFee = $00000200;
  iOperationFlag_ClinReg = $00000400;
  iOperationFlag_HospReg = $00010000;
  iOperationFlag_HospPatient = $00020000;
  iOperationFlag_HospInOut = $00040000;
  iOperationFlag_HospPatientMisc = $00080000;
  iOperationFlag_MedStock = $00100000;

  iOperationCommand_HisBase = iOperationCommand_Custom + 255;
  iOperationCommand_ClinID = iOperationCommand_HisBase + 1;
  iOperationCommand_BalanceID = iOperationCommand_HisBase + 2;
  iOperationCommand_ClinFeeID = iOperationCommand_HisBase + 3;
  iOperationCommand_HospID = iOperationCommand_HisBase + 10;
  iOperationCommand_HospFeeID = iOperationCommand_HisBase + 11;

const
  iFeeSign_Medicine = 1;
  iFeeSign_Treatment = 2;

  iFeeBalanceType_ClinReg = 0;
  iFeeBalanceType_ClinFee = 1;
  iFeeBalanceType_HospPay = 2;
  iFeeBalanceType_HospFee = 3;

  iUseArea_All = 0;
  iUseArea_Clin = 1;
  iUseArea_Hosp = 2;
  iUseArea_Office = 3;
  iUseArea_Person = 4;

  sRecipeType_ClinMedX = '10';
  sRecipeType_ClinMedZ = '11';
  sRecipeType_ClinMedC = '1102';
  sRecipeType_ClinTreat = '13';
  sRecipeType_HospMed = '15';
  sRecipeType_LIS = '20';
  sRecipeType_PACS = '30';
  sRecipeType_Treat = '40';

  sOfficeUsage_Clin = '100';
  sOfficeUsage_Hosp = '200';
  sOfficeUsage_Tech = '300';
  sOfficeUsage_Tech_LIS = '310';
  sOfficeUsage_Tech_PACS = '320';
  sOfficeUsage_Med = '4';
  sOfficeUsage_Med_Stock = '410';
  sOfficeUsage_Med_Clin = '420';
  sOfficeUsage_Med_Hosp = '430';
  sOfficeUsage_Good = '500';
  sOfficeUsage_Admin = '900';

const
  iClinRegSign_Norm = 0;
  iClinRegSign_Cancel = 1;
  iClinRegSign_Minus = 2;

  iClinFeeType_Norm = 0;
  iClinFeeType_YB4005 = 1;
  iClinFeeType_YB4006 = 2;
  iClinFeeType_YB4007 = 3;
  iClinFeeType_YB4008 = 4;
  iClinFeeType_YB4009 = 5;
  iClinFeeType_YB4010 = 6;

  iClinFeeSign_Norm = 1;
  iClinFeeSign_Cancel = 2;

const
  iHospSign_Reg = 0;
  iHospSign_Normal = 1;
  iHospSign_ChangeOffice = 2;
  iHospSign_OutApply = 3;
  iHospSign_OutLock = 4;
  iHospSign_OutUnlock = 5;
  iHospSign_Balance = 6;
  iHospSign_OutReturn = 9;
  iHospSign_Out = 10;

  iHospPatientType_Normal = 1;
  iHospPatientType_YB = 2;
  iHospPatientType_XNH = 3;
  iHospPatientType_YB_Fake = 4;
  iHospPatientType_XNH_Fake = 5;
  iHospPatientType_SYB = 6;
  iHospPatientType_SYB_Fake = 7;

  iHospAdviceType_LongTerm = 0;
  iHospAdviceType_Regular = 1;
  iHospAdviceType_Temp = 2;

  iHospFeeSign_Normal = 1;
  iHospFeeSign_Cancel = 2;
  iHospFeeSign_NoSign = 3;

  iHospFeeType_Norm = 100;
  iHospFeeType_YB4001 = 201;
  iHospFeeType_YB4002 = 202;
  iHospFeeType_YB4003 = 203;
  iHospFeeType_YB4004 = 204;
  iHospFeeType_XNH = 300;
  iHospFeeType_SYB = 400;

const
  iMedInOutSign_In = 1;
  iMedInOutSign_Out = -1;

  iMedInOutState_Editing = 0;
  iMedInOutState_Applying = 1;
  iMedInOutState_Finished = 10;

const
  sPrinterClinReg = '挂号单';
  sPrinterInvoice = '发票';
  sPrinterInjection = '注射单';
  sPrinterGlue = '瓶贴';
  sPrinterHospDayFee = '住院日清单';
  sPrinterHospPay = '住院预收';
  sPrinterHospFee = '住院发票';

const
  // 数据服务名称
  sRemoteServiceLogin = 'HisService_Login';
  sRemoteServiceReport = 'HisService_Report';
  sDataServiceSystem = 'HisService_System';
  sDataServiceDict = 'HisService_Dict';
  sDataServiceBase = 'HisService_Base';
  sDataServiceClin = 'HisService_Clinic';
  sDataServiceHosp = 'HisService_Hosp';
  sDataServiceMedicine = 'HisService_Medicine';
  sDataServiceExtend = 'HisService_Extend';
  sDataServiceYB = 'HisService_YB';
  sDataServiceXNH = 'HisService_XNH';
  sDataServiceSYB = 'HisService_SYB';

  // 程序业务类别
  sOperationCategorySys = '系统';
  sOperationCategoryView = '视图';
  sOperationCategoryBase = '基础数据';
  sOperationCategoryFee = '财务';
  sOperationCategoryClinic = '门诊';
  sOperationCategoryClinFee = '门诊,财务';
  sOperationCategoryHosp = '住院';
  sOperationCategoryHospFee = '住院,财务';
  sOperationCategoryMedicine = '药品';
  sOperationCategoryYB = '医保';
  sOperationCategoryXNH = '新农合';
  sOperationCategoryCenter = '综合查询';
  sOperationCategoryBusiness = '日常业务';
  sOperationCategoryHelp = '帮助';
  // ****************************************************************************

  sDataNameDictCertificate = 'D_Certificate';
  sDataNameDictMarryState = 'D_MarryState';
  sDataNameDictNation = 'D_Nation';
  sDataNameDictNational = 'D_National';
  sDataNameDictOccupation = 'D_Occupation';
  sDataNameDictPosition = 'D_Position';
  sDataNameDictProfession = 'D_Profession';
  sDataNameDictProTitle = 'D_ProTitle';
  sDataNameDictRelation = 'D_Relation';
  sDataNameDictSexType = 'D_SexType';
  sDataNameDictBloodType = 'D_BloodType';
  sDataNameDictDrugAllergic = 'D_DrugAllergic';
  sDataNameDictDrugUse = 'D_DrugUse';
  sDataNameDictDrugDoseRatio = 'D_DrugDoseRatio';
  sDataNameDictFrequency = 'D_Frequency';
  sDataNameDictIllnessState = 'D_IllnessState';
  sDataNameDictLookAfterLevel = 'D_LookAfterLevel';
  sDataNameDictSickness = 'D_Sickness';
  sDataNameDictICD10 = 'D_ICD10';
  sDataNameDictOperation = 'D_Operation';
  sDataNameDictAnesthesiaMethod = 'D_AnesthesiaMethod';

  sDataNameDictMFactory = 'D_MFactory';
  sDataNameDictMOrigin = 'D_MOrigin';
  sDataNameDictMPackageUnit = 'D_MPackageUnit';
  sDataNameDictMPlace = 'D_MPlace';
  sDataNameDictMProperty = 'D_MProperty';
  sDataNameDictMShape = 'D_MShape';
  sDataNameDictMSupply = 'D_MSupply';

  sDataNameDictPayType = 'D_PayType';
  sDataNameDictPayTypeHospPay = 'D_HospPrepayType';
  sDataNameDictPayTypeHospBalance = 'D_HospFeeType';
  sDataNameDictPatientType = 'D_PatientType';
  sDataNameDictAgreementUnit = 'D_AgreementUnit';
  sDataNameDictAgreementDiscount = 'D_AgreementDiscount';
  sDataNameDictClinPayType = 'D_ClinPayType';
  sDataNameDictIncomeType = 'D_IncomeType';

  sDataNameBaseStatType = 'Base_StatType';
  sDataNameBaseRecipeType = 'Base_RecipeType';
  sDataNameBaseItemMedicine = 'Base_ItemMedicine';
  sDataNameBaseItemTreatment = 'Base_ItemTreatment';
  sDataNameBaseItemYB = 'Base_ItemYB';
  sDataNameBaseItemYBTable = 'Base_ItemYBTable';
  sDataNameBaseFeeGroupMaster = 'Base_FeeGroupMaster';
  sDataNameBaseFeeGroupDetail = 'Base_FeeGroupDetail';
  sDataNameBaseRecipeGroupMaster = 'Base_RecipeGroupMaster';
  sDataNameBaseRecipeGroupDetail = 'Base_RecipeGroupDetail';

  sDataNameBaseFeeInfo = 'Base_FeeInfo';
  sDataNameBaseFeeMedicine = 'Base_FeeMedicine';
  sDataNameBaseFeeTreatment = 'Base_FeeTreatment';
  sDataNameBaseFeeMedicineYB = 'Base_FeeMedicineYB';
  sDataNameBaseFeeTreatmentYB = 'Base_FeeTreatmentYB';
  sDataNameBaseItemInfo = 'Base_ItemInfo';
  sDataNameBaseClinFeeItem = 'Pro_Clin_FeeItem';
  sDataNameBaseHospFeeItem = 'Pro_Hosp_FeeItem';

  sDataNameBaseStockInOutType = 'Base_StockInOutType';
  sDataNameBaseStockInOutTypeOffice = 'Base_StockInOutTypeOffice';
  sDataNameBaseStockInOutItem = 'Base_StockInOutItem';

  { 系统部分 system }
  sDataNameSysOffice = 'Sys_Office';
  sDataNameSysUser = 'Sys_Op';
  sDataNameSysUserSign = 'Sys_OpSign';
  sDataNameSysUserOffice = 'Sys_OpOffice';
  sDataNameSysPower = 'Sys_Power';
  sDataNameSysWorkGroup = 'Sys_WorkGroup';
  sDataNameSysWorkGroupPower = 'Sys_WorkGroupPower';
  sDataNameSysWorkGroupUser = 'Sys_WorkGroupOp';
  sDataNameSysLog = 'Sys_Log';
  sDataNameSysParam = 'Sys_Param';
  sDataNameSysScript = 'Sys_Script';

  sDataNameSysClinOffice = 'Sys_ClinicOffice';
  sDataNameSysClinDoctor = 'Sys_ClinicDoctor';
  sDataNameSysHospOffice = 'Sys_HospOffice';
  sDataNameSysHospDoctor = 'Sys_HospDoctor';
  sDataNameSysMedOffice = 'Sys_MedicineOffice';

  { 药品部分 medicine }
  sDataNameMedInOutMaster = 'Med_InOutMaster';
  sDataNameMedInOutDetail = 'Med_InOutDetail';
  sDataNameMedStock = 'Med_Stock'; // 库存表
  sDataNameMedCheckMaster = 'Med_CheckMaster';
  sDataNameMedCheckDetail = 'Med_CheckDetail';

  { 门诊部分 clinic }
  sDataNameClinCenter = 'Pro_Clin_Center';
  sDataNameClinPatient = 'Clin_Patient';
  sDataNameClinRegType = 'Clin_RegType';
  sDataNameClinReg = 'Clin_Reg';
  sDataNameClinRegDict = 'Clin_Reg_Dict';
  sDataNameClinRecMaster = 'Clin_RecMaster';
  sDataNameClinRecMasterProc = 'Pro_Clin_RecMaster_Query';
  sDataNameClinRecDetail = 'Clin_RecDetail';
  sDataNameClinRecDetailProc = 'Pro_Clin_RecDetail_Query';
  sDataNameClinFeeMaster = 'Clin_FeeMaster';
  sDataNameClinFeeMasterReturn = 'Clin_FeeMaster_Return';
  sDataNameClinFeeDetail = 'Clin_FeeDetail';
  sDataNameFeeBalance = 'Fee_Balance';

  sDataNameHospPatient = 'Hosp_Patient';
  sDataNameHospPatientReg = 'Hosp_Patient_Reg';
  sDataNameHospAdviceType = 'Hosp_AdviceType';
  sDataNameHospAdvice = 'Hosp_Advice';
  sDataNameHospFeeDetail = 'Hosp_FeeDetail';
  sDataNameHospFeeMaster = 'Hosp_FeeMaster';
  sDataNameHospPayment = 'Hosp_Payment';
  sDataNameHospApplyMaster = 'Hosp_ApplyMaster';
  sDataNameHospOfficeChange = 'Hosp_OfficeChange';
  sDataNameHospCreditAdjust = 'Hosp_CreditAdjust';
  sDataNameHospOfficeBed = 'Hosp_OfficeBed';
  sDataNameHospOfficeBedMy = 'Hosp_OfficeBed_My';
  sDataNameHospOperation = 'Hosp_Operation';

  { 财务部分 Financial }

  { 医保部分 YB }
  sDataNameYBType = 'YB_FeeType';
  sDataNameYBStatType = 'YB_StatType';
  sDataNameYBJZLB = 'D_YB_05_JZLB';

  sDataNameXNHFee = 'XNH_Fee';
  sDataNameXNHArea = 'XNH_Area';
  sDataNameXNHBXGS = 'XNH_BXGS';
  sDataNameXNHIllness = 'XNH_Illness';
  sDataNameXNHHospType = 'XNH_HospType';

  sDataNameBusinessFeedback = 'OutSite_Feedback';

  sFieldFeeID = 'FeeID';
  sFieldClinID = 'ClinID';
  sFieldRecipeID = 'RecipeID';
  sFieldHospID = 'HospID';
  sFieldOpID = 'OpID';
  sFieldOfficeID = 'OfficeID';
  sFieldExecOfficeID = 'ExecOfficeID';
  sFieldOfficeName = 'OfficeName';
  sFieldDoctorID = 'DoctorID';
  sFieldDoctorName = 'DoctorName';
  sFieldPatientID = 'PatientID';
  sFieldPatientName = 'PatientName';
  sFieldBedID = 'BedID';
  sFieldPatientTypeID = 'PatientTypeID';
  sFieldHospFeeID = 'HospFeeID';
  sFieldYBID = 'YBID';

  sAccessSys = '10';
  sAccessSysMaintain = '1010';
  sAccessSysWorker = '101010';
  sAccessSysReportDesign = '101020';
  sAccessSysReportEdit = '101021';
  sAccessSysDict = '101030';

  sAccessBase = '1020';
  sAccessBaseMedicineFee = '102010';
  sAccessBaseTreatmentFee = '102020';
  sAccessBaseFeeGroup = '102030';
  sAccessBaseRecipeGroup = '102040';
  sAccessBaseRecipeGroupClin = '102050';
  sAccessBaseRecipeGroupHosp = '102060';

  sAccessYB = '1030';
  sAccessYBQuery = '103001';
  sAccessYBSeverePatient = '103002';
  sAccessSYBSevereTrade = '103003';

  sAccessMed = '20';
  sAccessMedInOut = '2010';
  sAccessMedHospExec = '2012';
  sAccessMedStock = '2020';

  sAccessFee = '30';
  sAccessFeeBalance = '3010';
  sAccessFeeBalanceCheck = '3020';

  sAccessClin = '40';
  sAccessClinReg = '4010';
  sAccessClinPatient = '4020';
  sAccessClinDoctor = '4021';
  sAccessClinExec = '4022';
  sAccessClinFee = '4030';
  sAccessClinQuery = '4040';
  sAccessClinStat = '4050';

  sAccessHosp = '50';
  sAccessHospCenter = '5001';
  sAccessHospInOut = '5010';
  sAccessHospPatient = '5020';
  sAccessHospAdviceEdit = '5021';
  sAccessHospAdviceExec = '5022';
  sAccessHospCheckApply = '5023';
  sAccessHospFee = '5030';
  sAccessHospFeeCancel = '5031';
  sAccessHospQuery = '5040';
  sAccessHospStat = '5050';

  sAccessBusiness = '60';
  sAccessBusinessOutSite = '6010';

  sOperationIDHome = 'sys_home';
  sOperationIDLog = 'sys_log';
  sOperationIDStyle = 'sys_style';
  sOperationIDSoftUpdate = 'sys_soft_update';
  sOperationIDChangePwd = 'sys_change_pwd';
  sOperationIDReport = 'sys_report';
  sOperationIDDefaultPrinter = 'sys_defaultprinter';
  sOperationIDBusinessPrinter = 'sys_businessprinter';
  sOperationIDDictManage = 'sys_dict';
  sOperationIDDictSetPY = 'sys_dict_py';

  sOperationIDSysWorker = 'sys_worker';
  sOperationIDSysOffice = 'sys_office';
  sOperationIDSysAccess = 'sys_access';
  sOperationIDSysRole = 'sys_role';
  sOperationIDSysRoleAccess = 'sys_role_access';
  sOperationIDSysRoleWorker = 'sys_role_worker';
  sOperationIDSysParam = 'sys_param';
  sOperationIDSysLog = 'sys_log';
  sOperationIDSysScript = 'sys_script';

  sOperationIDPrevView = 'view_prior';
  sOperationIDNextView = 'view_next';
  sOperationIDCloseView = 'view_close';

  sOperationIDBaseMedicine = 'base_medicine';
  sOperationIDBaseTreatment = 'base_treatment';
  sOperationIDBaseYBMedicine = 'base_ybmedicine';
  sOperationIDBaseYBTreatment = 'base_ybtreatment';
  sOperationIDBaseFeeGroup = 'base_fee_group';
  sOperationIDBaseRecipeGroup = 'base_recipe_group';
  sOperationIDFeeBalanceCheck = 'fee_balance_check';

  sOperationIDClinICCard = 'card_create';
  sOperationIDClinClearCard = 'card_clear';
  sOperationIDClinReg = 'clin_reg';
  sOperationIDClinReg2 = 'clin_reg2';
  sOperationIDClinRegQuery = 'clin_reg_query';
  sOperationIDClinRegBalance = 'clin_reg_balance';
  sOperationIDClinCenter = 'clin_center';
  sOperationIDClinRecipe = 'clin_recipe';
  sOperationIDClinRecipeExec = 'clin_recipe_exec';
  sOperationIDClinFee = 'clin_fee';
  sOperationIDClinFeeReturn = 'clin_fee_return';
  sOperationIDClinFeeQuery = 'clin_fee_query';
  sOperationIDClinFeeBalance = 'clin_fee_balance';
  sOperationIDClinFeeDetailQry = 'clin_fee_detail_qry';

  sOperationIDHospReg = 'hosp_reg';
  sOperationIDHospPatient = 'hosp_patient';
  sOperationIDHospOfficeMed = 'hosp_office_med';
  sOperationIDHospApply = 'hosp_apply';
  sOperationIDHospAdviceEdit = 'hosp_advice_edit';
  sOperationIDHospAdviceExec = 'hosp_advice_exec';
  sOperationIDHospDayBusiness = 'hosp_patient_business';
  sOperationIDHospMiscBusiness = 'hosp_patient_misc';
  sOperationIDHospFeeDetailQuery = 'hosp_feedetail_query';
  sOperationIDHospOfficeChange = 'hosp_office_change';
  sOperationIDHospPatientInOut = 'hosp_patient_inout';
  sOperationIDHospPatientOutCheck = 'hosp_patient_outcheck';
  sOperationIDHospPayment = 'hosp_payment';
  sOperationIDHospPaymentAdd = 'hosp_payment_add';
  sOperationIDHospPaymentBalance = 'hosp_payment_balance';
  sOperationIDHospFeeMasterQuery = 'hosp_feemaster_query';
  sOperationIDHospFeeMasterBalance = 'hosp_feemaster_balance';
  sOperationIDHospFeeMasterTake = 'hosp_feemaster_take';
  sOperationIDHospMedExec = 'hosp_med_exec';
  sOperationIDHospApplyQuery = 'hosp_apply_query';
  sOperationIDHospCenter = 'hosp_center';
  sOperationIDHospOperation = 'hosp_operation';

  sOperationIDMedStock = 'med_stock';
  sOperationIDMedCheckMaster = 'med_check_master';
  sOperationIDMedCheckDetail = 'med_check_detail';
  sOperationIDMedCheckBatch = 'med_check_batch';

  sOperationIDYBReadCard = 'yb_read_card';
  sOperationIDYBClinTakeFee = 'yb_clin_take_fee';
  sOperationIDYBHospReg = 'yb_hosp_reg';
  sOperationIDYBHospRegCancel = 'yb_hosp_reg_cancel';
  sOperationIDYBHospItemUpload = 'yb_hosp_item_upload';
  sOperationIDYBHospItemUpload2 = 'yb_hosp_item_upload2';
  sOperationIDYBHospOutReg = 'yb_hosp_out_reg';
  sOperationIDYBHospCalcFee = 'yb_hosp_calc_fee';
  sOperationIDYBHospOutRegCancel = 'yb_hosp_out_reg_cancel';
  sOperationIDYBClinMaster = 'yb_clin_master';
  sOperationIDYBHospMaster = 'yb_hosp_master';
  sOperationIDYBSeverePatient = 'yb_severe_patient';

  sOperationIDXNHInit = 'xnh_init';
  sOperationIDXNHHospReg = 'xnh_regin';
  sOperationIDXNHHospItemUpload = 'xnh_upload';
  sOperationIDXNHHospOutReg = 'xnh_regout';
  sOperationIDXNHInOutInfo = 'xnh_inoutinfo';

  sOperationIDSYBHospReg = 'syb_hosp_reg';
  sOperationIDSYBHospUpload = 'syb_hosp_upload';
  sOperationIDSYBHospRegOut = 'syb_hosp_reg_out';
  sOperationIDSYBHospRegOutCancel = 'syb_hosp_out_reg_cancel';
  sOperationIDSYBHospBalance = 'syb_hosp_balance';
  sOperationIDSYBHospBalanceQuery = 'syb_hosp_balance_query';
  sOperationIDSYBHospUncertainTrade = 'syb_hosp_uncertain_trade';

  sOperationIDBusinessOutSite = 'bus_outsite';
  sOperationIDBusinessSoftManage = 'bus_software';

  sImageStyle = 'style';
  sImageLogger = 'log';

  sFieldValueExists = '%s字段值已经存在';

  sSectionHisSystem = 'SystemSection';
  sSectionBase = 'BaseSection';
  sSectionHisMedicine = 'MedicineSection';
  sSectionClinic = 'ClinicSection';
  sSectionHosp = 'HospSection';
  sSectionYB = 'YBSection';
  sSectionXNH = 'XNHSection';

implementation

end.
