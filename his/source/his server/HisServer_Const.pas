unit HisServer_Const;

interface

const
  sAppID = 'DA-HIS-SERVER';
  sAppVer = '2020.09';

  // 更新Schema时需要等待的时间
  iWaitTimeBeforeUpdateSchema = 3000;

  // 数据库名称
  sDBNameHis = 'HIS_Base';

  // 程序业务类别
  sOperationCategorySys = '系统';
  sOperationCategoryFile = '文件';
  sOperationCategoryData = '数据服务';
  sOperationCategoryHelp = '帮助';

  // 程序业务编号
  sOperationIDHome = 'home';
  sOperationIDLogger = 'logger';
  sOperationIDReport = 'report';
  sOperationIDMaintain = 'maintaining';
  sOperationIDOption = 'option';
  sOperationIDRefreshSchemaSystem = 'schema_system';
  sOperationIDRefreshSchemaBase = 'schema_base';
  sOperationIDRefreshSchemaDict = 'schema_dict';
  sOperationIDRefreshSchemaClinic = 'schema_clinic';
  sOperationIDRefreshSchemaHosp = 'schema_hosp';
  sOperationIDRefreshSchemaMedicine = 'schema_medicine';
  sOperationIDRefreshSchemaStat = 'schema_stat';
  sOperationIDRefreshSchemaExtend = 'schema_extend';
  sOperationIDRefreshSchemaYB = 'schema_yb';
  sOperationIDRefreshSchemaXNH = 'schema_xnh';

  // 图片名称
  sImagePreferences = 'preferences';
  sImageLogger = 'log';
  sImageSchema = 'schema';

implementation

end.
