/*
 Navicat Premium Data Transfer

 Source Server         : sql2008
 Source Server Type    : SQL Server
 Source Server Version : 10501600
 Date: 20/09/2020 12:10:37
*/


-- ----------------------------
-- Table structure for Misc_Report
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Misc_Report]') AND type IN ('U'))
	DROP TABLE [dbo].[Misc_Report]
GO

CREATE TABLE [dbo].[Misc_Report] (
  [ReportName] varchar(100) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [Category] varchar(50) COLLATE Chinese_PRC_CI_AS  NULL,
  [Memo] varchar(200) COLLATE Chinese_PRC_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[Misc_Report] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of Misc_Report
-- ----------------------------
INSERT INTO [dbo].[Misc_Report] VALUES (N'test.fr3', N'测试', N'')
GO

INSERT INTO [dbo].[Misc_Report] VALUES (N'门诊处方单.fr3', N'门诊', N'')
GO

INSERT INTO [dbo].[Misc_Report] VALUES (N'门诊挂号单.fr3', N'门诊', N'')
GO

INSERT INTO [dbo].[Misc_Report] VALUES (N'门诊挂号结算申请单.fr3', N'门诊', N'')
GO

INSERT INTO [dbo].[Misc_Report] VALUES (N'门诊普通发票.fr3', N'门诊', N'')
GO

INSERT INTO [dbo].[Misc_Report] VALUES (N'门诊申请单.fr3', N'门诊', N'暂不用')
GO

INSERT INTO [dbo].[Misc_Report] VALUES (N'门诊收费结算申请单.fr3', N'门诊', N'')
GO

INSERT INTO [dbo].[Misc_Report] VALUES (N'门诊收费清单.fr3', N'门诊', N'')
GO

INSERT INTO [dbo].[Misc_Report] VALUES (N'门诊诊断证明单.fr3', N'门诊', N'')
GO

INSERT INTO [dbo].[Misc_Report] VALUES (N'医保门诊基本结算.fr3', N'医保', N'')
GO

INSERT INTO [dbo].[Misc_Report] VALUES (N'医保门诊重症结算.fr3', N'医保', N'')
GO

INSERT INTO [dbo].[Misc_Report] VALUES (N'住院催款单.fr3', N'住院', N'')
GO

INSERT INTO [dbo].[Misc_Report] VALUES (N'住院口服药执行单.fr3', N'住院', N'')
GO

INSERT INTO [dbo].[Misc_Report] VALUES (N'住院瓶贴.fr3', N'住院', N'')
GO

INSERT INTO [dbo].[Misc_Report] VALUES (N'住院瓶贴临时.fr3', N'住院', N'')
GO

INSERT INTO [dbo].[Misc_Report] VALUES (N'住院一日清单.fr3', N'住院', N'')
GO

INSERT INTO [dbo].[Misc_Report] VALUES (N'住院预收单.fr3', N'住院', N'')
GO

INSERT INTO [dbo].[Misc_Report] VALUES (N'住院证.fr3', N'住院', N'')
GO

INSERT INTO [dbo].[Misc_Report] VALUES (N'住院注射单.fr3', N'住院', N'')
GO

INSERT INTO [dbo].[Misc_Report] VALUES (N'住院注射单临时.fr3', N'住院', N'')
GO


-- ----------------------------
-- Table structure for Misc_ReportParam
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Misc_ReportParam]') AND type IN ('U'))
	DROP TABLE [dbo].[Misc_ReportParam]
GO

CREATE TABLE [dbo].[Misc_ReportParam] (
  [ReportName] varchar(100) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [ParamName] varchar(50) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [ParamTitle] varchar(50) COLLATE Chinese_PRC_CI_AS  NULL,
  [ParamValue] varchar(3000) COLLATE Chinese_PRC_CI_AS  NULL,
  [ParamEditor] varchar(800) COLLATE Chinese_PRC_CI_AS  NULL,
  [ParamSign] int DEFAULT ((0)) NOT NULL,
  [DefaultValue] varchar(300) COLLATE Chinese_PRC_CI_AS  NULL,
  [OrderID] int  NULL,
  [Memo] varchar(200) COLLATE Chinese_PRC_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[Misc_ReportParam] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of Misc_ReportParam
-- ----------------------------
INSERT INTO [dbo].[Misc_ReportParam] VALUES (N'门诊处方.fr3', N'RecipeID', NULL, N'144', NULL, N'0', NULL, NULL, N'处方ID
')
GO

INSERT INTO [dbo].[Misc_ReportParam] VALUES (N'门诊处方单.fr3', N'RecipeID', NULL, N'17', NULL, N'0', NULL, NULL, N'')
GO

INSERT INTO [dbo].[Misc_ReportParam] VALUES (N'门诊挂号单.fr3', N'ClinID', NULL, N'201407030001', NULL, N'0', NULL, NULL, N'')
GO

INSERT INTO [dbo].[Misc_ReportParam] VALUES (N'门诊挂号结算申请单', N'BalanceID', NULL, N'7', NULL, N'0', NULL, NULL, N'')
GO

INSERT INTO [dbo].[Misc_ReportParam] VALUES (N'门诊挂号结算申请单.fr3', N'BalanceID', NULL, N'4', NULL, N'0', NULL, NULL, N'')
GO

INSERT INTO [dbo].[Misc_ReportParam] VALUES (N'门诊普通发票.fr3', N'ClinFeeID', NULL, N'201503180002', NULL, N'0', NULL, NULL, N'收费ID')
GO

INSERT INTO [dbo].[Misc_ReportParam] VALUES (N'门诊申请单.fr3', N'recipeID', NULL, N'164', NULL, N'0', NULL, NULL, N'')
GO

INSERT INTO [dbo].[Misc_ReportParam] VALUES (N'门诊收费结算申请单.fr3', N'BalanceID', NULL, N'22', NULL, N'0', NULL, NULL, N'')
GO

INSERT INTO [dbo].[Misc_ReportParam] VALUES (N'门诊收费清单.fr3', N'ClinFeeID', NULL, N'201407060001', NULL, N'0', NULL, NULL, N'')
GO

INSERT INTO [dbo].[Misc_ReportParam] VALUES (N'门诊诊断证明单.fr3', N'ClinID', NULL, N'201407010001', NULL, N'0', NULL, NULL, N'')
GO

INSERT INTO [dbo].[Misc_ReportParam] VALUES (N'住院催款单.fr3', N'HospID', N'住院号', N'2015001275', N'', N'0', N'', N'0', N'')
GO

INSERT INTO [dbo].[Misc_ReportParam] VALUES (N'住院催款单.fr3', N'HurryMoney', N'催款金额', N'5000', N'Properties=CalcEdit', N'1', N'', N'0', N'')
GO

INSERT INTO [dbo].[Misc_ReportParam] VALUES (N'住院口服药执行单.fr3', N'DrugDate', N'执行日期', N'', N'Properties=DateEdit', N'1', N'Date()', N'0', N'')
GO

INSERT INTO [dbo].[Misc_ReportParam] VALUES (N'住院瓶贴.fr3', N'AdviceTypeID', NULL, N'0', NULL, N'0', NULL, NULL, N'')
GO

INSERT INTO [dbo].[Misc_ReportParam] VALUES (N'住院瓶贴.fr3', N'BeginDate', N'瓶贴日期', NULL, N'Properties=DateEdit', N'1', N'Date()', NULL, N'')
GO

INSERT INTO [dbo].[Misc_ReportParam] VALUES (N'住院瓶贴.fr3', N'HospID', NULL, N'2014000014', NULL, N'0', NULL, NULL, N'')
GO

INSERT INTO [dbo].[Misc_ReportParam] VALUES (N'住院瓶贴.fr3', N'OfficeID', NULL, N'0204', NULL, N'0', NULL, NULL, N'')
GO

INSERT INTO [dbo].[Misc_ReportParam] VALUES (N'住院瓶贴.fr3', N'OfficeName', NULL, N'神经内科一', NULL, N'0', NULL, NULL, N'')
GO

INSERT INTO [dbo].[Misc_ReportParam] VALUES (N'住院瓶贴临时.fr3', N'BeginDate', N'瓶贴日期', NULL, N'Properties=DateEdit', N'1', N'Date()', NULL, N'')
GO

INSERT INTO [dbo].[Misc_ReportParam] VALUES (N'住院瓶贴临时.fr3', N'HospID', NULL, N'2014000014', NULL, N'0', NULL, NULL, N'')
GO

INSERT INTO [dbo].[Misc_ReportParam] VALUES (N'住院瓶贴临时.fr3', N'OfficeID', NULL, N'0204', NULL, N'0', NULL, NULL, N'')
GO

INSERT INTO [dbo].[Misc_ReportParam] VALUES (N'住院瓶贴临时.fr3', N'OfficeName', NULL, N'神经内科一', NULL, N'0', NULL, NULL, N'')
GO

INSERT INTO [dbo].[Misc_ReportParam] VALUES (N'住院一日清单.fr3', N'FeeDate', N'清单日期', N'2014-5-24', N'Properties=DateEdit', N'1', N'Date()-1', NULL, N'')
GO

INSERT INTO [dbo].[Misc_ReportParam] VALUES (N'住院一日清单.fr3', N'HospID', NULL, N'2014000014', NULL, N'0', NULL, NULL, N'')
GO

INSERT INTO [dbo].[Misc_ReportParam] VALUES (N'住院一日清单.fr3', N'OfficeID', NULL, N'0204', NULL, N'0', NULL, NULL, N'')
GO

INSERT INTO [dbo].[Misc_ReportParam] VALUES (N'住院一日清单.fr3', N'OfficeName', NULL, N'神经内科一', NULL, N'0', NULL, NULL, N'')
GO

INSERT INTO [dbo].[Misc_ReportParam] VALUES (N'住院预收单.fr3', N'PayID', NULL, N'201506170025', NULL, N'0', NULL, NULL, N'')
GO

INSERT INTO [dbo].[Misc_ReportParam] VALUES (N'住院证.fr3', N'HospID', NULL, N'2015001275', NULL, N'0', NULL, NULL, N'')
GO

INSERT INTO [dbo].[Misc_ReportParam] VALUES (N'住院注射单.fr3', N'BeginDate', N'注射单日期', NULL, N'Properties=DateEdit', N'1', N'Date()', NULL, N'')
GO

INSERT INTO [dbo].[Misc_ReportParam] VALUES (N'住院注射单.fr3', N'HospID', NULL, N'2014000014', NULL, N'0', NULL, NULL, N'')
GO

INSERT INTO [dbo].[Misc_ReportParam] VALUES (N'住院注射单.fr3', N'OfficeID', NULL, N'0204', NULL, N'0', NULL, NULL, N'')
GO

INSERT INTO [dbo].[Misc_ReportParam] VALUES (N'住院注射单.fr3', N'OfficeName', NULL, N'神经内科一', NULL, N'0', NULL, NULL, N'')
GO

INSERT INTO [dbo].[Misc_ReportParam] VALUES (N'住院注射单.fr3', N'OpID', NULL, N'2369', NULL, N'0', NULL, NULL, N'')
GO

INSERT INTO [dbo].[Misc_ReportParam] VALUES (N'住院注射单临时.fr3', N'BeginDate', N'注射单日期', NULL, N'Properties=DateEdit', N'1', N'Date()', NULL, N'')
GO

INSERT INTO [dbo].[Misc_ReportParam] VALUES (N'住院注射单临时.fr3', N'HospID', NULL, N'2014000014', NULL, N'0', NULL, NULL, N'')
GO

INSERT INTO [dbo].[Misc_ReportParam] VALUES (N'住院注射单临时.fr3', N'OfficeID', NULL, N'0204', NULL, N'0', NULL, NULL, N'')
GO

INSERT INTO [dbo].[Misc_ReportParam] VALUES (N'住院注射单临时.fr3', N'OfficeName', NULL, N'神经内科一', NULL, N'0', NULL, NULL, N'')
GO


-- ----------------------------
-- Table structure for Sys_Log
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Sys_Log]') AND type IN ('U'))
	DROP TABLE [dbo].[Sys_Log]
GO

CREATE TABLE [dbo].[Sys_Log] (
  [LogID] int  IDENTITY(1,1) NOT NULL,
  [LogDate] datetime  NOT NULL,
  [LogType] varchar(10) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [Source] varchar(50) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [UserID] varchar(50) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [Code] int  NULL,
  [Meta1] varchar(100) COLLATE Chinese_PRC_CI_AS  NULL,
  [Meta2] varchar(100) COLLATE Chinese_PRC_CI_AS  NULL,
  [Meta3] varchar(100) COLLATE Chinese_PRC_CI_AS  NULL,
  [Content] varchar(300) COLLATE Chinese_PRC_CI_AS  NULL,
  [IP] varchar(32) COLLATE Chinese_PRC_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[Sys_Log] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for Sys_Office
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Sys_Office]') AND type IN ('U'))
	DROP TABLE [dbo].[Sys_Office]
GO

CREATE TABLE [dbo].[Sys_Office] (
  [OfficeID] varchar(8) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [OfficeName] varchar(30) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [OfficeAddress] varchar(30) COLLATE Chinese_PRC_CI_AS  NULL,
  [OfficeColor] int  NULL,
  [OfficeIcon] image  NULL,
  [BedCount] int DEFAULT ((1)) NOT NULL,
  [StopSign] bit DEFAULT ((0)) NULL,
  [OfficeUse] varchar(3) COLLATE Chinese_PRC_CI_AS  NULL,
  [OfficeHead] varchar(8) COLLATE Chinese_PRC_CI_AS  NULL,
  [OfficePhone] varchar(20) COLLATE Chinese_PRC_CI_AS  NULL,
  [OrderID] int DEFAULT ((0)) NOT NULL,
  [IME_PY] varchar(25) COLLATE Chinese_PRC_CI_AS  NULL,
  [Memo] varchar(20) COLLATE Chinese_PRC_CI_AS  NULL,
  [SmartMedicalID] varchar(20) COLLATE Chinese_PRC_CI_AS  NULL,
  [FGHisOfficeID] varchar(20) COLLATE Chinese_PRC_CI_AS  NULL,
  [FGHisOfficeName] varchar(50) COLLATE Chinese_PRC_CI_AS  NULL,
  [YBOfficeID] varchar(20) COLLATE Chinese_PRC_CI_AS  NULL,
  [EMROfficeID] varchar(20) COLLATE Chinese_PRC_CI_AS  NULL,
  [PACSOfficeID] varchar(50) COLLATE Chinese_PRC_CI_AS  NULL,
  [LISOfficeID] varchar(50) COLLATE Chinese_PRC_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[Sys_Office] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of Sys_Office
-- ----------------------------
INSERT INTO [dbo].[Sys_Office] VALUES (N'01', N'门诊', NULL, N'16777215', NULL, N'1', N'0', N'a', NULL, NULL, N'0', N'mz', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_Office] VALUES (N'0102', N'门诊服务台', N'门诊楼一楼', N'16777215', NULL, N'1', N'0', N'100', NULL, NULL, N'0', N'mzfwt', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_Office] VALUES (N'0104', N'门诊心血管内科', N'门诊楼二楼', N'16777215', NULL, N'1', N'0', N'100', NULL, NULL, N'1002', N'mzxxgnk', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_Office] VALUES (N'0105', N'门诊呼吸消化血液内科专家', N'门诊楼三楼', N'5296274', NULL, N'1', N'0', N'100', NULL, NULL, N'8001', N'mzhxxhxynkzj', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_Office] VALUES (N'0106', N'门诊综合科专家', N'门诊楼二楼', N'16777215', NULL, N'1', N'1', N'100', NULL, NULL, N'0', N'mzzhkzj', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_Office] VALUES (N'0107', N'门诊肿瘤科专家', N'门诊楼二楼', N'16777215', NULL, N'1', N'0', N'100', NULL, NULL, N'0', N'mzzlkzj', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_Office] VALUES (N'0108', N'门诊感染科专家', N'感染科一楼', N'16777215', NULL, N'1', N'0', N'100', NULL, NULL, N'0', N'mzgrkzj', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_Office] VALUES (N'0109', N'门诊肛肠外科', N'门诊楼二楼', N'16777215', NULL, N'1', N'0', N'100', NULL, NULL, N'0', N'mzgcwk', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_Office] VALUES (N'0110', N'门诊骨外科', N'门诊楼二楼', N'16777215', NULL, N'1', N'0', N'100', NULL, NULL, N'0', N'mzgwk', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_Office] VALUES (N'0111', N'门诊手术室', N'门诊楼二楼', N'16777215', NULL, N'1', N'0', N'100', NULL, NULL, N'8002', N'mzsss', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_Office] VALUES (N'0112', N'门诊急诊内科', N'门诊楼一楼', N'12611584', NULL, N'1', N'0', N'100', NULL, NULL, N'1001', N'mzjznk', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_Office] VALUES (N'0113', N'门诊康复医学科', N'康复楼一楼', N'16777215', NULL, N'1', N'0', N'100', NULL, NULL, N'0', N'mzkfyxk', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_Office] VALUES (N'0114', N'门诊口腔科', N'门诊楼二楼', N'5296274', NULL, N'1', N'0', N'100', NULL, NULL, N'6001', N'mzkqk', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_Office] VALUES (N'0115', N'门诊老干科', N'门诊楼二楼', N'16777215', NULL, N'1', N'0', N'100', NULL, NULL, N'6002', N'mzlgk', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_Office] VALUES (N'0116', N'门诊老年病科', N'门诊楼三楼', N'16777215', NULL, N'1', N'0', N'100', NULL, NULL, N'6003', N'mzlnbk', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_Office] VALUES (N'0117', N'门诊麻醉科', NULL, N'16777215', NULL, N'1', N'1', N'100', NULL, NULL, N'0', N'mzmzk', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_Office] VALUES (N'0118', N'门诊康复科', N'门诊楼一楼', N'16777215', NULL, N'1', N'1', N'100', NULL, NULL, N'0', N'mzkfk', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_Office] VALUES (N'0119', N'门诊急诊外科', N'门诊楼一楼', N'12611584', NULL, N'1', N'0', N'100', NULL, NULL, N'2001', N'mzjzwk', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_Office] VALUES (N'0120', N'门诊五官科', N'门诊楼三楼', N'16777215', NULL, N'1', N'0', N'100', NULL, NULL, N'6004', N'mzwgk', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_Office] VALUES (N'0121', N'门诊泌尿外科专家', N'门诊楼三楼', N'16777215', NULL, N'1', N'0', N'100', NULL, NULL, N'8003', N'mzmnwkzj', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_Office] VALUES (N'0122', N'门诊内科', N'门诊楼二楼', N'16777215', NULL, N'1', N'0', N'100', NULL, NULL, N'1002', N'mznk', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_Office] VALUES (N'0123', N'门诊皮肤科', N'门诊楼二楼', N'16777215', NULL, N'1', N'0', N'100', NULL, NULL, N'6005', N'mzpfk', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_Office] VALUES (N'0124', N'门诊普外科', N'门诊楼二楼', N'16777215', NULL, N'1', N'0', N'100', NULL, NULL, N'8004', N'mzpwk', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_Office] VALUES (N'0125', N'门诊腔镜外科专家', N'门诊楼二楼', N'16777215', NULL, N'1', N'0', N'100', NULL, NULL, N'8005', N'mzqjwkzj', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_Office] VALUES (N'0126', N'门诊神经介入科专家', N'门诊楼二楼', N'16777215', NULL, N'1', N'0', N'100', NULL, NULL, N'8006', N'mzsjjrkzj', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_Office] VALUES (N'0127', N'门诊神经内科一', N'门诊楼二楼', N'16777215', NULL, N'1', N'0', N'100', NULL, NULL, N'8007', N'mzsjnky', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_Office] VALUES (N'0128', N'门诊神经内科二', N'门诊楼二楼', N'16777215', NULL, N'1', N'0', N'100', NULL, NULL, N'0', N'mzsjnke', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_Office] VALUES (N'0129', N'门诊神经外科一', N'门诊楼二楼', N'16777215', NULL, N'1', N'0', N'100', NULL, NULL, N'8008', N'mzsjwky', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_Office] VALUES (N'0130', N'门诊神经外科二', N'门诊楼二楼', N'16777215', NULL, N'1', N'0', N'100', NULL, NULL, N'0', N'mzsjwke', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_Office] VALUES (N'0132', N'门诊肾病内分泌科专家', N'门诊楼二楼', N'16777215', NULL, N'1', N'0', N'100', NULL, NULL, N'8009', N'mzsbnfmkzj', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_Office] VALUES (N'0133', N'门诊妇产科', N'门诊楼二楼', N'13421823', NULL, N'1', N'0', N'100', NULL, NULL, N'3001', N'mzfck', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_Office] VALUES (N'0135', N'门诊小儿科', N'门诊楼一楼', N'12611584', NULL, N'1', N'0', N'100', NULL, NULL, N'4001', N'mzxek', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_Office] VALUES (N'0136', N'门诊小儿神经外科', N'门诊楼一楼', N'16777215', NULL, N'1', N'0', N'100', NULL, NULL, N'0', N'mzxesjwk', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_Office] VALUES (N'0137', N'门诊心理咨询专家', N'门诊楼二楼', N'16777215', NULL, N'1', N'0', N'100', NULL, NULL, N'8010', N'mzxlzxzj', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_Office] VALUES (N'0138', N'门诊胸外科', N'门诊楼三楼', N'16777215', NULL, N'1', N'0', N'100', NULL, NULL, N'0', N'mzxwk', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_Office] VALUES (N'0139', N'门诊中医专家', N'门诊楼三楼', N'16777215', NULL, N'1', N'0', N'100', NULL, NULL, N'6006', N'mzzyzj', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_Office] VALUES (N'0141', N'门诊重症医学科', N'门诊楼三楼', N'16777215', NULL, N'1', N'1', N'100', NULL, NULL, N'0', N'mzzzyxk', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_Office] VALUES (N'0147', N'体检中心', N'门诊楼三楼', N'12611584', NULL, N'1', N'0', N'100', NULL, NULL, N'7001', N'tjzx', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_Office] VALUES (N'0151', N'戒烟门诊', N'门诊楼三楼', N'16777215', NULL, N'1', N'1', N'000', NULL, NULL, N'0', N'jymz', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_Office] VALUES (N'0152', N'鼾症门诊', N'门诊楼二楼', N'16777215', NULL, N'1', N'1', N'000', NULL, NULL, N'0', N'hzmz', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_Office] VALUES (N'0153', N'门诊糖尿病专家', N'门诊楼三楼', N'16777215', NULL, N'1', N'0', N'100', NULL, NULL, N'8011', N'mztnbzj', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_Office] VALUES (N'0154', N'门诊眩晕专家', N'门诊楼二楼', N'16777215', NULL, N'1', N'0', N'100', NULL, NULL, N'8012', N'mzxyzj', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_Office] VALUES (N'0155', N'门诊结核科', N'门诊楼一楼', N'16777215', NULL, N'1', N'1', N'100', NULL, NULL, N'0', N'mzjhk', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_Office] VALUES (N'0156', N'门诊治疗室', N'门诊楼一楼', N'16777215', NULL, N'1', N'1', N'', NULL, NULL, N'0', N'mzzls', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_Office] VALUES (N'0157', N'门诊疼痛专家', N'门诊楼二楼', N'16777215', NULL, N'1', N'0', N'100', NULL, NULL, N'8015', N'mzttzj', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_Office] VALUES (N'0159', N'门诊120', N'门诊楼一楼', N'0', NULL, N'1', N'0', N'100', NULL, NULL, N'0', N'mz120', N'', NULL, NULL, NULL, N'', NULL, NULL, N'')
GO

INSERT INTO [dbo].[Sys_Office] VALUES (N'0160', N'门诊122', N'门诊楼一楼', N'0', NULL, N'1', N'0', N'100', NULL, NULL, N'0', N'mz122', N'', NULL, NULL, NULL, N'', NULL, NULL, N'')
GO

INSERT INTO [dbo].[Sys_Office] VALUES (N'0161', N'门诊ICU', N'', N'0', NULL, N'0', N'0', N'100', NULL, NULL, N'0', N'mzICU', N'', NULL, NULL, NULL, N'', NULL, NULL, N'')
GO

INSERT INTO [dbo].[Sys_Office] VALUES (N'0162', N'门诊医保办', N'门诊楼一楼', N'0', NULL, N'0', N'0', N'100', NULL, NULL, N'0', N'mzybb', N'', NULL, NULL, NULL, N'', NULL, NULL, N'')
GO

INSERT INTO [dbo].[Sys_Office] VALUES (N'0163', N'便民门诊', N'门诊楼一楼', N'16777215', NULL, N'0', N'0', N'100', NULL, NULL, N'0', N'bmmz', N'', NULL, NULL, NULL, N'', NULL, NULL, N'')
GO

INSERT INTO [dbo].[Sys_Office] VALUES (N'0164', N'门诊高压氧科', N'门诊楼一楼', N'0', NULL, N'0', N'0', N'100', NULL, NULL, N'0', N'mzgyyk', N'', NULL, NULL, NULL, N'', NULL, NULL, N'')
GO

INSERT INTO [dbo].[Sys_Office] VALUES (N'02', N'住院', NULL, N'16777215', NULL, N'1', N'0', N'a', NULL, NULL, N'0', N'zy', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_Office] VALUES (N'0202', N'神经外科一', N'住院部九楼', N'16777215', NULL, N'40', N'0', N'200', NULL, NULL, N'0', N'sjwky', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_Office] VALUES (N'0203', N'神经外科二', N'住院部八楼', N'16777215', NULL, N'40', N'0', N'200', NULL, NULL, N'0', N'sjwke', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_Office] VALUES (N'0204', N'神经内科一', N'住院部七楼', N'16777215', NULL, N'48', N'0', N'200', NULL, NULL, N'0', N'sjnky', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_Office] VALUES (N'0205', N'神经内科二', N'住院部六楼', N'16777215', NULL, N'48', N'0', N'200', NULL, NULL, N'0', N'sjnke', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_Office] VALUES (N'0206', N'小儿神经外科', N'住院部八楼', N'16777215', NULL, N'15', N'0', N'200', NULL, NULL, N'0', N'xesjwk', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_Office] VALUES (N'0207', N'神经介入科', N'住院部九楼', N'16777215', NULL, N'15', N'0', N'200', NULL, NULL, N'0', N'sjjrk', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_Office] VALUES (N'0208', N'康复医学科一', N'康复楼三楼', N'16777215', NULL, N'48', N'0', N'200', NULL, NULL, N'0', N'kfyxky', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_Office] VALUES (N'0209', N'ICU', N'住院部十楼', N'16777215', NULL, N'8', N'0', N'200', NULL, NULL, N'0', N'ICU', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_Office] VALUES (N'0210', N'心血管内科', N'住院部三楼', N'16777215', NULL, N'50', N'0', N'200', NULL, NULL, N'0', N'xxgnk', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_Office] VALUES (N'0211', N'骨外科', N'住院部五楼', N'16777215', NULL, N'50', N'0', N'200', NULL, NULL, N'0', N'gwk', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_Office] VALUES (N'0212', N'普外科', N'住院部四楼', N'16777215', NULL, N'38', N'0', N'200', NULL, NULL, N'0', N'pwk', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_Office] VALUES (N'0213', N'腔镜外科', N'住院部四楼', N'16777215', NULL, N'10', N'0', N'200', NULL, NULL, N'0', N'qjwk', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_Office] VALUES (N'0214', N'肛肠科', N'住院部四楼', N'16777215', NULL, N'10', N'0', N'200', NULL, NULL, N'0', N'gck', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_Office] VALUES (N'0215', N'泌尿外科', N'住院部十楼', N'16777215', NULL, N'15', N'0', N'200', NULL, NULL, N'0', N'mnwk', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_Office] VALUES (N'0216', N'胸外科', N'住院部十楼', N'16777215', NULL, N'10', N'0', N'200', NULL, NULL, N'0', N'xwk', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_Office] VALUES (N'0218', N'肿瘤科', N'康复楼四楼', N'16777215', NULL, N'47', N'0', N'200', NULL, NULL, N'0', N'zlk', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_Office] VALUES (N'0219', N'妇产科', N'住院部二楼', N'16777215', NULL, N'35', N'0', N'200', NULL, NULL, N'0', N'fck', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_Office] VALUES (N'0220', N'肾内分泌科', N'住院部一楼', N'16777215', NULL, N'19', N'0', N'200', NULL, NULL, N'0', N'snfmk', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_Office] VALUES (N'0221', N'老年病一科', N'内科楼四楼', N'16777215', NULL, N'48', N'0', N'200', NULL, NULL, N'0', N'lnbyk', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_Office] VALUES (N'0222', N'老年病二科', N'内科楼三楼', N'16777215', NULL, N'48', N'0', N'200', NULL, NULL, N'0', N'lnbek', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_Office] VALUES (N'0223', N'呼吸消化血液内科', N'内科楼二楼', N'16777215', NULL, N'50', N'0', N'200', NULL, NULL, N'0', N'hxxhxynk', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_Office] VALUES (N'0224', N'感染科', N'内科楼一楼', N'16777215', NULL, N'40', N'0', N'200', NULL, NULL, N'0', N'grk', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_Office] VALUES (N'0226', N'皮肤科', N'门诊楼二楼', N'16777215', NULL, N'10', N'0', N'200', NULL, NULL, N'0', N'pfk', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_Office] VALUES (N'0227', N'血透析室', N'住院部一楼', N'16777215', NULL, N'0', N'1', N'000', NULL, NULL, N'0', N'xtxs', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_Office] VALUES (N'0228', N'手术室', N'住院部十一楼', N'16777215', NULL, N'0', N'0', N'200', NULL, NULL, N'0', N'sss', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_Office] VALUES (N'0268', N'康复医学科二', N'康复楼二楼', N'16777215', NULL, N'45', N'0', N'200', NULL, NULL, N'0', N'kfyxke', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_Office] VALUES (N'0269', N'口腔科', N'住院楼九楼', N'16777215', NULL, N'5', N'0', N'200', NULL, NULL, N'0', N'kqk', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_Office] VALUES (N'0271', N'急诊部综合病房', N'门诊楼一楼', N'16777215', NULL, N'5', N'0', N'200', NULL, NULL, N'0', N'jzbzhbf', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_Office] VALUES (N'0273', N'中医科', N'康复楼一楼', N'16777215', NULL, N'10', N'1', N'200', NULL, NULL, N'0', N'zyk', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_Office] VALUES (N'0275', N'五官科', N'住院部十楼', N'16777215', NULL, N'10', N'0', N'200', NULL, NULL, N'0', N'wgk', N'', NULL, NULL, NULL, N'', NULL, NULL, N'')
GO

INSERT INTO [dbo].[Sys_Office] VALUES (N'0276', N'疼痛科', N'康复楼二楼', N'16777215', NULL, N'5', N'0', N'200', NULL, NULL, N'0', N'ttk', N'', NULL, NULL, NULL, N'', NULL, NULL, N'')
GO

INSERT INTO [dbo].[Sys_Office] VALUES (N'0277', N'麻醉科', N'', N'16777215', NULL, N'0', N'0', N'200', NULL, NULL, N'0', N'mzk', N'', NULL, NULL, NULL, N'', NULL, NULL, N'')
GO

INSERT INTO [dbo].[Sys_Office] VALUES (N'03', N'医技', NULL, N'16777215', NULL, N'1', N'0', N'a', NULL, NULL, N'0', N'yj', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_Office] VALUES (N'0302', N'高压氧科', N'住院部一楼', N'16777215', NULL, N'1', N'0', N'300', NULL, NULL, N'0', N'gyyk', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_Office] VALUES (N'0309', N'影像科', NULL, N'16777215', NULL, N'1', N'0', N'300', NULL, NULL, N'0', N'yxk', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_Office] VALUES (N'030901', N'CT', N'影像楼三楼', N'16777215', NULL, N'1', N'0', N'300', NULL, NULL, N'1', N'C', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_Office] VALUES (N'030902', N'MR', N'影像楼一楼', N'16777215', NULL, N'1', N'0', N'300', NULL, NULL, N'2', N'M', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_Office] VALUES (N'030903', N'DR', N'影像楼一楼', N'16777215', NULL, N'1', N'0', N'300', NULL, NULL, N'3', N'D', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_Office] VALUES (N'030904', N'B超', N'影像楼二楼', N'16777215', NULL, N'1', N'0', N'300', NULL, NULL, N'4', N'Bc', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_Office] VALUES (N'030905', N'DSA', N'影像楼二楼', N'16777215', NULL, N'1', N'0', N'300', NULL, NULL, N'5', N'DS', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_Office] VALUES (N'030906', N'心电图', N'影像楼二楼', N'16777215', NULL, N'1', N'0', N'300', NULL, NULL, N'6', N'xdt', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_Office] VALUES (N'0311', N'病理科', N'门诊楼二楼', N'16777215', NULL, N'1', N'0', N'300', NULL, NULL, N'0', N'blk', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_Office] VALUES (N'0314', N'脑血流图', N'住院部六楼', N'16777215', NULL, N'1', N'0', N'300', NULL, NULL, N'0', N'nxlt', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_Office] VALUES (N'0315', N'检验科', NULL, N'16777215', NULL, N'1', N'0', N'300', NULL, NULL, N'0', N'jyk', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_Office] VALUES (N'031501', N'临检室', N'门诊楼三楼', N'16777215', NULL, N'1', N'0', N'300', NULL, NULL, N'0', N'ljs', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_Office] VALUES (N'031502', N'免疫室', N'门诊楼三楼', N'16777215', NULL, N'1', N'0', N'300', NULL, NULL, N'0', N'mys', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_Office] VALUES (N'031503', N'生化室', N'门诊楼三楼', N'16777215', NULL, N'1', N'0', N'300', NULL, NULL, N'0', N'shs', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_Office] VALUES (N'031504', N'输血科', N'门诊楼三楼', N'16777215', NULL, N'1', N'0', N'300', NULL, NULL, N'0', N'sxk', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_Office] VALUES (N'031505', N'微生物', N'门诊楼三楼', N'16777215', NULL, N'1', N'0', N'300', NULL, NULL, N'0', N'wsw', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_Office] VALUES (N'031506', N'院外送检', N'门诊楼三楼', N'16777215', NULL, N'1', N'0', N'300', NULL, NULL, N'0', N'ywsj', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_Office] VALUES (N'0316', N'内窥镜', N'门诊楼四楼', N'16777215', NULL, N'1', N'0', N'300', NULL, NULL, N'0', N'nkj', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_Office] VALUES (N'0318', N'药学科', NULL, N'16777215', NULL, N'1', N'0', N'400', NULL, NULL, N'0', N'yxk', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_Office] VALUES (N'031801', N'西药库', NULL, N'16777215', NULL, N'1', N'0', N'410', NULL, NULL, N'0', N'xyk', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_Office] VALUES (N'031802', N'中药库', NULL, N'16777215', NULL, N'1', N'0', N'410', NULL, NULL, N'0', N'zyk', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_Office] VALUES (N'031803', N'门西药房', N'门诊大厅', N'16777215', NULL, N'1', N'0', N'420', NULL, NULL, N'0', N'mxyf', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_Office] VALUES (N'031804', N'门中药房', N'门诊大厅', N'16777215', NULL, N'1', N'0', N'420', NULL, NULL, N'0', N'mzyf', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_Office] VALUES (N'031805', N'住西药房', N'', N'16777215', NULL, N'1', N'0', N'430', NULL, NULL, N'0', N'zxyf', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_Office] VALUES (N'0319', N'血透析室', N'', N'16777215', NULL, N'1', N'0', N'300', NULL, NULL, N'0', N'xtxs', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_Office] VALUES (N'0320', N'胃镜室', N'', N'16777215', NULL, N'1', N'0', N'300', NULL, NULL, N'0', N'wjs', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_Office] VALUES (N'0321', N'纤支镜室', N'', N'16777215', NULL, N'1', N'0', N'300', NULL, NULL, N'0', N'xzjs', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_Office] VALUES (N'0322', N'陀螺刀室', N'', N'16777215', NULL, N'1', N'0', N'300', NULL, NULL, N'0', N'tlds', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_Office] VALUES (N'0324', N'肛肠镜室', N'', N'16777215', NULL, N'1', N'0', N'300', NULL, NULL, N'0', N'gcjs', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_Office] VALUES (N'04', N'行政', NULL, N'16777215', NULL, N'1', N'0', N'a', NULL, NULL, N'0', N'hz', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_Office] VALUES (N'0403', N'财务处', NULL, N'16777215', NULL, N'1', N'0', NULL, NULL, NULL, N'0', N'cwc', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_Office] VALUES (N'040301', N'收费处', N'', N'16777215', NULL, N'1', N'0', NULL, NULL, NULL, N'0', N'sfc', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_Office] VALUES (N'0411', N'信息中心', NULL, N'16777215', NULL, N'1', N'0', NULL, NULL, NULL, N'0', N'xxzx', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_Office] VALUES (N'041101', N'病案室', NULL, N'16777215', NULL, N'1', N'0', NULL, NULL, NULL, N'0', N'bas', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_Office] VALUES (N'041102', N'统计室', NULL, N'16777215', NULL, N'1', N'0', NULL, NULL, NULL, N'0', N'tjs', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_Office] VALUES (N'041103', N'图书室', NULL, N'16777215', NULL, N'1', N'0', NULL, NULL, NULL, N'0', N'tss', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_Office] VALUES (N'0413', N'医保办', NULL, N'16777215', NULL, N'1', N'0', NULL, NULL, NULL, N'0', N'ybb', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_Office] VALUES (N'0421', N'医务处', NULL, N'16777215', NULL, N'1', N'0', NULL, NULL, NULL, N'0', N'ywc', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_Office] VALUES (N'0422', N'护理部', NULL, N'16777215', NULL, N'1', N'0', NULL, NULL, NULL, N'0', N'hlb', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_Office] VALUES (N'05', N'后勤', N'', N'15589325', NULL, N'1', N'0', N'000', NULL, NULL, N'0', N'hq', N'', N'50000001', N'50000001', N'后勤', NULL, N'50000001', NULL, NULL)
GO

INSERT INTO [dbo].[Sys_Office] VALUES (N'0503', N'仓库', NULL, N'16777215', NULL, N'1', N'0', NULL, NULL, NULL, N'0', N'ck', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_Office] VALUES (N'0504', N'制氧中心', NULL, N'16777215', NULL, N'1', N'0', NULL, NULL, NULL, N'0', N'zyzx', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_Office] VALUES (N'0517', N'食堂', NULL, N'16777215', NULL, N'1', N'0', NULL, NULL, NULL, N'0', N'st', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO


-- ----------------------------
-- Table structure for Sys_Op
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Sys_Op]') AND type IN ('U'))
	DROP TABLE [dbo].[Sys_Op]
GO

CREATE TABLE [dbo].[Sys_Op] (
  [OpID] varchar(8) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [OpName] varchar(12) COLLATE Chinese_PRC_CI_AS DEFAULT ('男') NOT NULL,
  [SexType] varchar(10) COLLATE Chinese_PRC_CI_AS  NULL,
  [Password] varchar(32) COLLATE Chinese_PRC_CI_AS DEFAULT '' NOT NULL,
  [EncryptedPass] varchar(100) COLLATE Chinese_PRC_CI_AS DEFAULT '' NOT NULL,
  [OfficeID] varchar(8) COLLATE Chinese_PRC_CI_AS  NULL,
  [IME_PY] varchar(5) COLLATE Chinese_PRC_CI_AS  NULL,
  [Title] varchar(30) COLLATE Chinese_PRC_CI_AS  NULL,
  [Position] varchar(30) COLLATE Chinese_PRC_CI_AS  NULL,
  [Profession] varchar(30) COLLATE Chinese_PRC_CI_AS  NULL,
  [LevelID] varchar(30) COLLATE Chinese_PRC_CI_AS  NULL,
  [LoginTime] datetime  NULL,
  [LoginIP] varchar(32) COLLATE Chinese_PRC_CI_AS  NULL,
  [StopSign] int DEFAULT ((0)) NULL,
  [RecSign] int DEFAULT ((0)) NULL,
  [UserState] int DEFAULT ((0)) NULL,
  [Phone] varchar(50) COLLATE Chinese_PRC_CI_AS  NULL,
  [Email] varchar(50) COLLATE Chinese_PRC_CI_AS  NULL,
  [SignImage] image  NULL,
  [Memo] varchar(50) COLLATE Chinese_PRC_CI_AS  NULL,
  [CardNum] varchar(100) COLLATE Chinese_PRC_CI_AS  NULL,
  [CardKey] varchar(200) COLLATE Chinese_PRC_CI_AS  NULL,
  [CardSign] int DEFAULT ((0)) NULL,
  [Phone2] varchar(50) COLLATE Chinese_PRC_CI_AS  NULL,
  [Photo] image  NULL
)
GO

ALTER TABLE [dbo].[Sys_Op] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of Sys_Op
-- ----------------------------
INSERT INTO [dbo].[Sys_Op] VALUES (N'0002', N'徐利晏', NULL, N'', N'fcd04e26e900e94b9ed6dd604fed2b64', N'030906', N'xly', N'主治医师', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'0024', N'王杜雪蛾', NULL, N'', N'096ec814d2392f379695f30ca7041977', N'040301', N'wdxe', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'0059', N'夏杨杰', NULL, N'', N'47f91082e4cc7d6d0fcf49d5aa6f3711', N'0112', N'xyj', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'0062', N'陈武燕', NULL, N'', N'73cc1f9b54baa5917ae240b96c832690', N'0211', N'cwy', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'0067', N'李晶', NULL, N'', N'75f56f82bbabc12898b7ff63ebebe482', N'0124', N'lj', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'0075', N'杨珍', NULL, N'', N'31f123e5785fc03b6370c7f57b4df50d', N'0157', N'yz', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'0081', N'刘夏菊', NULL, N'', N'279f4fe9db63a9f4b87e18073956d7cf', N'0110', N'lxj', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'0097', N'周王慧', NULL, N'', N'b4f151bb5aea33c5a0b0dcbc1bd2849b', N'0108', N'zwh', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'0123', N'李阳新', NULL, N'', N'eb62f6b9306db575c2d596b1279627a4', N'0119', N'lyx', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'0160', N'向好', NULL, N'', N'22f112832359ba4c98397b3401367fce', N'0104', N'xh', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'0175', N'杨丹', NULL, N'', N'e90b327c1ceca11f1a44a8bcf58af34c', N'0132', N'yd', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'0181', N'张军', NULL, N'', N'5f55a6ece505a982f1ea0f396442bf23', N'0116', N'zj', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'0191', N'丁吴章', NULL, N'', N'f55cae80eb012999557b87cc9c6a0945', N'0128', N'dwz', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'0198', N'陈颖荣', NULL, N'', N'8bae7cfc1d80927fe22506cfcf8d5b8c', N'0107', N'cyr', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'0204', N'牛温', NULL, N'', N'a5aad544b38a088b35b395645efe0d61', N'0135', N'nw', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'0207', N'叶鹏', NULL, N'', N'5e90ae5f6eb12b3f3e3c86c0409de103', N'0315', N'yp', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'0212', N'方敏顺', NULL, N'', N'f7d63bbdc0fda6d3c6ae9c061a86910d', N'0115', N'fms', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'0218', N'官伟', NULL, N'', N'd972dc8564e175effccbcb3e402650eb', N'040301', N'gw', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'0263', N'赖鹏叶', NULL, N'', N'87277281b55376d0231ad94f63e4a7eb', N'030904', N'lpy', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'0271', N'乐浩', NULL, N'', N'4f1ac1f615a1c3414134c2d3ae9a3f58', N'0315', N'lh', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'0277', N'曹幸', NULL, N'', N'8566418f640c84b79671a915d659087d', N'0112', N'cx', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'0281', N'姜洪晋', NULL, N'', N'80736f26d8cb7d6cea55f49176d23e4d', N'0108', N'jhj', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'0294', N'刘丁琴', NULL, N'', N'3ab586f9ea0a8e5f3f1109a4862476a5', N'0120', N'ldq', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'0302', N'张霞', NULL, N'', N'd25922edb7ab92c0ca31328cbdcbd42f', N'0228', N'zx', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'0307', N'薛小用', NULL, N'', N'cc1d60fc967b66b66229205d7bb288e8', N'0320', N'xxy', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'0335', N'郭冯', NULL, N'', N'23bb8511ed8e41a8e47f735b6bd6b3cc', N'031804', N'gf', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'0341', N'夏玲美', NULL, N'', N'088eab3b76c960c25038b5a6fb2042f8', N'031804', N'xlm', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'0358', N'张昕', NULL, N'', N'209b86f4a9023fade72b8572c7bf9702', N'031803', N'zx', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'0369', N'汪捷胡', NULL, N'', N'c602c2531a3b20f2aabf2b05667b7dfe', N'0147', N'wjh', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'0394', N'刘康清', NULL, N'', N'de7a8f7c083abf41a583073d8704ea72', N'0315', N'lkq', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'0396', N'胡彰', NULL, N'', N'1fee9df4bbb1d3a21fbfd782076eb3f1', N'0315', N'hz', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'0402', N'吴丽铖', NULL, N'', N'd25206f06f3137dd920a3e9ae8f0f704', N'0315', N'wlc', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'0411', N'王媚成', NULL, N'', N'ebeafd50068b99caeda23409b19a9cbc', N'040301', N'wmc', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'0427', N'李红卫', NULL, N'', N'23d38970923b1165915709e05326d2c6', N'0120', N'lhw', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'0436', N'卢军', NULL, N'', N'1f973d97ab0c953c00df038510cf6a04', N'0123', N'lj', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'0455', N'陈婷', NULL, N'', N'caf49bdf7be3efee8c774830c2b89853', N'0113', N'ct', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'0456', N'樊盼志', NULL, N'', N'fec8038ae4436caa7188b2e3f0bd216f', N'030906', N'fpz', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'0459', N'潘明敏', NULL, N'', N'31cc4e34a6d7da69ae0be6ec1869e749', N'0220', N'pmm', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'0473', N'付伦玲', NULL, N'', N'6182c01675b1c28da2aacc8a5d53a27c', N'031805', N'fll', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'0477', N'顾春', NULL, N'', N'e8d85e1e43b1418da49994f1bf87cbcf', N'0122', N'gc', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'0490', N'李全杰', NULL, N'', N'8a04731eacb74fb3c52e0d50cb2751fb', N'0147', N'lqj', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'0493', N'左黎周', NULL, N'', N'c75b0360e2b18050876f4e11c4d0aaa1', N'0214', N'zlz', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'0527', N'徐玲', NULL, N'', N'fecf4d772f647e978c7daa4b3b446ada', N'0113', N'xl', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'0541', N'吴周薛', NULL, N'', N'e9b69fc38e3849223329d3c67bb84670', N'0311', N'wzx', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'0545', N'徐苗星', NULL, N'', N'4005973d0841eac706dc9b8b32858d9d', N'040301', N'xmx', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'0563', N'余兴', NULL, N'', N'05c3e372f03989d8e904372a2767f158', N'0210', N'yx', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'0565', N'李凤平', NULL, N'', N'd63823cc1f4323aaa2998528665f6b2c', N'0135', N'lfp', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'0567', N'林红', NULL, N'', N'6f343e529f3a92598243852abfe5325a', N'0222', N'lh', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'0575', N'李慧', NULL, N'', N'453b94ed53c068e99a0605a7dccb06c7', N'0105', N'lh', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'0579', N'叶燕', NULL, N'', N'046b5e0700801454fe7dd12d8f6f3353', N'0275', N'yy', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'0586', N'彭华', NULL, N'', N'7921e831eae453befd0a29c704b76c74', N'0107', N'ph', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'0589', N'谭芳刘', NULL, N'', N'f6bf3033e07aaeae5d91f43cd2c6e9ea', N'0111', N'tfl', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'0598', N'吴凤', NULL, N'', N'2a252f333ea918b4d5a33454c933c416', N'0113', N'wf', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'0621', N'张文', NULL, N'', N'3e323529d2060298979f801772e0340e', N'0114', N'zw', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'0623', N'喻思', NULL, N'', N'4c74468100405cb743427a5a6996fe30', N'031803', N'ys', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'0665', N'袁丽敏', NULL, N'', N'a073be8fcff86c2f5f8276aedfa5fe25', N'0212', N'ylm', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'0667', N'王王万', NULL, N'', N'cf2d0a2956ad104e48b8a2a47a0da12b', N'0271', N'www', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'0677', N'谭齐胡', NULL, N'', N'fdaee939be4b113b04ab0266195b4eb1', N'0222', N'tqh', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'0686', N'李应', NULL, N'', N'd5c725ac42e57dd3a1f5ab06a56f62c6', N'040301', N'ly', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'0693', N'吴霞', NULL, N'', N'0f7b9402a08d44c92f7dc6998460ccd4', N'0116', N'wx', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'0694', N'许剑', NULL, N'', N'718ea70458e7267659f6f7751972de2d', N'031805', N'xj', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'0695', N'余刘', NULL, N'', N'4f37e224d06df37a01e12315055f9e3b', N'031803', N'yl', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'0696', N'明敏', NULL, N'', N'd9c0bc5297d98d2c2515c4fd9e31f24e', N'040301', N'mm', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'0697', N'梅启方', NULL, N'', N'8839564a6895f63f314ac599120a3632', N'031804', N'mqf', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'0702', N'陶汉', NULL, N'', N'd57898ab11a6d2f16bd8c67a2533ae98', N'0112', N'th', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'0708', N'胡滨鸣', NULL, N'', N'b6156a2d23aef0f07ef8e2337558f372', N'0226', N'hbm', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'0740', N'秦禅', NULL, N'', N'6b6eff61f6b4667df39e38d6da60f006', N'0110', N'qc', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'0748', N'周黄龙', NULL, N'', N'ca2609cbdad422581ac3d1b12a12e4af', N'0139', N'zhl', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'0783', N'叶清', NULL, N'', N'b4d98bd90fbed79d7e670d56ad597bbd', N'031805', N'yq', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'0867', N'张莹外', NULL, N'', N'4aa2f63bfc69ce3d6fdb472234963088', N'031803', N'zyw', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'0875', N'薛水', NULL, N'', N'15a453ffc9ff244cb78304906d36cfba', N'0205', N'xs', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'0890', N'毕婷', NULL, N'', N'945aff29f48ea9752aa14d6880388a25', N'0315', N'bt', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'0915', N'张洪黄', NULL, N'', N'06f34114e73791be999e3d13029d9901', N'0315', N'zhh', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'0948', N'喻婷', NULL, N'', N'528e46a711df9f45dfe8b43163f34772', N'040301', N'yt', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'0967', N'艾孙黄', NULL, N'', N'b5a0b552ae89a91aa34705031852bd16', N'0124', N'ash', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1006', N'朱阳', NULL, N'', N'9246444d94f081e3549803b928260f56', N'0228', N'zy', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1016', N'严珍珍', NULL, N'', N'08fe2621d8e716b02ec0da35256a998d', N'040301', N'yzz', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1041', N'刘玲燕', NULL, N'', N'd736bb10d83a904aefc1d6ce93dc54b8', N'030901', N'lly', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1042', N'胡兴', NULL, N'', N'9ac403da7947a183884c18a67d3aa8de', N'0220', N'hx', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1046', N'胡俊', NULL, N'', N'1579779b98ce9edb98dd85606f2c119d', N'0147', N'hj', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1047', N'李玲', NULL, N'', N'20b5e1cf8694af7a3c1ba4a87f073021', N'0147', N'll', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1051', N'艾敏明', NULL, N'', N'456ac9b0d15a8b7f1e71073221059886', N'0105', N'amm', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1055', N'潘光果', NULL, N'', N'53c04118df112c13a8c34b38343b9c10', N'0132', N'pgg', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1060', N'刘徐平', NULL, N'', N'299a23a2291e2126b91d54f3601ec162', N'040301', N'lxp', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1083', N'李凌', NULL, N'', N'e5e63da79fcd2bebbd7cb8bf1c1d0274', N'0104', N'll', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1099', N'刘勇冬', NULL, N'', N'a0160709701140704575d499c997b6ca', N'0116', N'lyd', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1102', N'陈杜利', NULL, N'', N'c667d53acd899a97a85de0c201ba99be', N'0108', N'cdl', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1106', N'熊勇平', NULL, N'', N'c9f95a0a5af052bffce5c89917335f67', N'0218', N'xyp', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1107', N'郭郭磊', NULL, N'', N'e58cc5ca94270acaceed13bc82dfedf7', N'0104', N'ggl', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1112', N'雷晓凤', NULL, N'', N'20d135f0f28185b84a4cf7aa51f29500', N'0223', N'lxf', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1115', N'胡良', NULL, N'', N'e19347e1c3ca0c0b97de5fb3b690855a', N'0413', N'hl', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1116', N'胡曾', NULL, N'', N'dd77279f7d325eec933f05b1672f6a1f', N'0110', N'hc', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1119', N'吴玲美', NULL, N'', N'8597a6cfa74defcbde3047c891d78f90', N'030903', N'wlm', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1124', N'周玲小', NULL, N'', N'c7635bfd99248a2cdef8249ef7bfbef4', N'0219', N'zlx', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1125', N'万艳', NULL, N'', N'c21002f464c5fc5bee3b98ced83963b8', N'0147', N'wy', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1127', N'邱设亚', NULL, N'', N'678a1491514b7f1006d605e9161946b1', N'0147', N'qsy', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1134', N'周韩1', NULL, N'', N'7c9d0b1f96aebd7b5eca8c3edaa19ebb', N'0222', N'zh1', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1136', N'徐郭', NULL, N'', N'47a658229eb2368a99f1d032c8848542', N'0221', N'xg', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1139', N'陈郑', NULL, N'', N'184260348236f9554fe9375772ff966e', N'031803', N'cz', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1142', N'郝邹', NULL, N'', N'8ce6790cc6a94e65f17f908f462fae85', N'031803', N'hz', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1147', N'吴龄', NULL, N'', N'a1d50185e7426cbb0acad1e6ca74b9aa', N'0315', N'wl', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1150', N'王姣莹', NULL, N'', N'2b38c2df6a49b97f706ec9148ce48d86', N'0315', N'wjy', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1166', N'姜香翔', NULL, N'', N'0f2c9a93eea6f38fabb3acb1c31488c6', N'0107', N'jxx', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1232', N'陈义', NULL, N'', N'e53a0a2978c28872a4505bdb51db06dc', N'0127', N'cy', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1234', N'方黄春', NULL, N'', N'81dc9bdb52d04dc20036dbd8313ed055', N'0127', N'fhc', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1242', N'吴元慧', NULL, N'', N'2de5d16682c3c35007e4e92982f1a2ba', N'0208', N'wyh', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1249', N'陶有王', NULL, N'', N'2ba8698b79439589fdd2b0f7218d8b07', N'0209', N'tyw', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1253', N'章峰蓉', NULL, N'', N'b495ce63ede0f4efc9eec62cb947c162', N'0132', N'zfr', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1254', N'王伟崔', NULL, N'', N'884ce4bb65d328ecb03c598409e2b168', N'0132', N'wwc', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1263', N'曾洪', NULL, N'', N'7eb3c8be3d411e8ebfab08eba5f49632', N'0112', N'ch', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1266', N'李水伟', NULL, N'', N'8e2cfdc275761edc592f73a076197c33', N'0114', N'lsw', N'', N'', NULL, NULL, NULL, N'', N'0', N'1', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1280', N'陈燕霞', NULL, N'', N'da11e8cd1811acb79ccf0fd62cd58f86', N'0147', N'cyx', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1283', N'胡伦海', NULL, N'', N'018b59ce1fd616d874afad0f44ba338d', N'040301', N'hlh', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1285', N'吴开', NULL, N'', N'944bdd9636749a0801c39b6e449dbedc', N'0218', N'wk', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1306', N'鲍鹏选', NULL, N'', N'7940ab47468396569a906f75ff3f20ef', N'0124', N'bpx', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1310', N'商杨华', NULL, N'', N'535ab76633d94208236a2e829ea6d888', N'0130', N'syh', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1315', N'胡萍', NULL, N'', N'dfd7468ac613286cdbb40872c8ef3b06', N'0203', N'hp', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1319', N'陈凤兰', NULL, N'', N'1ee3dfcd8a0645a25a35977997223d22', N'0114', N'cfl', N'', N'', NULL, NULL, NULL, N'', N'0', N'1', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1327', N'郭芬', NULL, N'', N'17fafe5f6ce2f1904eb09d2e80a4cbf6', N'040301', N'gf', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1339', N'张元张', NULL, N'', N'd10ec7c16cbe9de8fbb1c42787c3ec26', N'0105', N'zyz', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1342', N'王婷', NULL, N'', N'5e1b18c4c6a6d31695acbae3fd70ecc6', N'0202', N'wt', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1343', N'曾海', NULL, N'', N'674bfc5f6b72706fb769f5e93667bd23', N'0220', N'ch', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1350', N'黄燕娇', NULL, N'', N'861dc9bd7f4e7dd3cccd534d0ae2a2e9', N'0137', N'hyj', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1355', N'肖刘美', NULL, N'', N'b8c27b7a1c450ffdacb31483454e0b54', N'040301', N'xlm', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1357', N'熊苏平', NULL, N'', N'c26820b8a4c1b3c2aa868d6d57e14a79', N'0223', N'xsp', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1377', N'李浩', NULL, N'', N'f52378e14237225a6f6c7d802dc6abbd', N'0202', N'lh', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1394', N'黄丽艳', NULL, N'', N'f016e59c7ad8b1d72903bb1aa5720d53', N'0123', N'hly', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1397', N'肖李晶', NULL, N'', N'215a71a12769b056c3c32e7299f1c5ed', N'0315', N'xlj', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1398', N'杜设黄', NULL, N'', N'd9731321ef4e063ebbee79298fa36f56', N'031805', N'dsh', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1404', N'周丁', NULL, N'', N'186a157b2992e7daed3677ce8e9fe40f', N'030906', N'zd', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1408', N'石辉', NULL, N'', N'6d9c547cf146054a5a720606a7694467', N'0202', N'sh', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1416', N'陈盈', NULL, N'', N'23ad3e314e2a2b43b4c720507cec0723', N'030902', N'cy', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1421', N'杜飞', NULL, N'', N'9aa42b31882ec039965f3c4923ce901b', N'0105', N'df', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1423', N'高华', NULL, N'', N'856fc81623da2150ba2210ba1b51d241', N'0114', N'gh', N'', N'', NULL, NULL, NULL, N'', N'0', N'1', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1424', N'罗飞', NULL, N'', N'489d0396e6826eb0c1e611d82ca8b215', N'0114', N'lf', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1425', N'殷李', NULL, N'', N'a424ed4bd3a7d6aea720b86d4a360f75', N'0114', N'yl', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1428', N'李丁', NULL, N'', N'0663a4ddceacb40b095eda264a85f15c', N'0110', N'ld', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1447', N'胡姗俊', NULL, N'', N'c930eecd01935feef55942cc445f708f', N'030906', N'hsj', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1451', N'邓琪', NULL, N'', N'80a8155eb153025ea1d513d0b2c4b675', N'031804', N'dq', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1455', N'龚萍', NULL, N'', N'0a1bf96b7165e962e90cb14648c9462d', N'0104', N'gp', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1467', N'明阳', NULL, N'', N'0245952ecff55018e2a459517fdb40e3', N'0212', N'my', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1468', N'刘郑', NULL, N'', N'cec6f62cfb44b1be110b7bf70c8362d8', N'0209', N'lz', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1470', N'吴姗晓', NULL, N'', N'42ffcf057e133f94c1b7b5cf543ef3bd', N'0315', N'wsx', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1473', N'崔建', NULL, N'', N'ac796a52db3f16bbdb6557d3d89d1c5a', N'0133', N'cj', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1477', N'周华', NULL, N'', N'78b9cab19959e4af8ff46156ee460c74', N'0121', N'zh', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1479', N'乐玲艳', NULL, N'', N'dc09c97fd73d7a324bdbfe7c79525f64', N'0105', N'lly', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1484', N'罗周谋', NULL, N'', N'729c68884bd359ade15d5f163166738a', N'031805', N'lzm', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1485', N'崔盛彭', NULL, N'', N'7fb8ceb3bd59c7956b1df66729296a4c', N'031805', N'csp', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1492', N'谌思丹', NULL, N'', N'e655c7716a4b3ea67f48c6322fc42ed6', N'030901', N'csd', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1496', N'马毛慧', NULL, N'', N'1415db70fe9ddb119e23e9b2808cde38', N'0124', N'mmh', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1499', N'徐伟', NULL, N'', N'6490791e7abf6b29a381288cc23a8223', N'0110', N'xw', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1501', N'高海秀', NULL, N'', N'5cbdfd0dfa22a3fca7266376887f549b', N'0209', N'ghx', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1503', N'袁泳鸣', NULL, N'', N'0c8ce55163055c4da50a81e0a273468c', N'0209', N'yym', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1507', N'封石', NULL, N'', N'4dcf435435894a4d0972046fc566af76', N'0204', N'fs', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1509', N'阮程亚', NULL, N'', N'1cd3882394520876dc88d1472aa2a93f', N'0205', N'rcy', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1513', N'罗娟伟', NULL, N'', N'2b3bf3eee2475e03885a110e9acaab61', N'0113', N'ljw', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1528', N'丁珍', NULL, N'', N'109d2dd3608f669ca17920c511c2a41e', N'0315', N'dz', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1537', N'李倩李', NULL, N'', N'd1a69640d53a32a9fb13e93d1c8f3104', N'0147', N'lql', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1539', N'龚萍', NULL, N'', N'17e23e50bedc63b4095e3d8204ce063b', N'0220', N'gp', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1544', N'周伟珍', NULL, N'', N'f337d999d9ad116a7b4f3d409fcc6480', N'0221', N'zwz', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1550', N'胡华', NULL, N'', N'6b8eba43551742214453411664a0dcc8', N'0208', N'hh', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1554', N'谈梅凤', NULL, N'', N'98986c005e5def2da341b4e0627d4712', N'0204', N'tmf', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1557', N'余琪玮', NULL, N'', N'596f713f9a7376fe90a62abaaedecc2d', N'0221', N'yqw', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1559', N'方有雯', NULL, N'', N'020c8bfac8de160d4c5543b96d1fdede', N'0223', N'fyw', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1563', N'吴英', NULL, N'', N'4d6e4749289c4ec58c0063a90deb3964', N'0135', N'wy', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1572', N'段旭', NULL, N'', N'452bf208bf901322968557227b8f6efe', N'0108', N'dx', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1574', N'李彦华', NULL, N'', N'0d4f4805c36dc6853edfa4c7e1638b48', N'0112', N'lyh', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1575', N'周亚青', NULL, N'', N'70efba66d3d8d53194fb1a8446ae07fa', N'0110', N'zyq', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1579', N'凌荣泽', NULL, N'', N'ed4227734ed75d343320b6a5fd16ce57', N'0315', N'lrz', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1580', N'张海', NULL, N'', N'dc5c768b5dc76a084531934b34601977', N'030902', N'zh', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1586', N'徐玲', NULL, N'', N'8f19793b2671094e63a15ab883d50137', N'0204', N'xl', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1608', N'何士剑', NULL, N'', N'faafda66202d234463057972460c04f5', N'0320', N'hsj', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1632', N'陈祥锐', NULL, N'', N'0771fc6f0f4b1d7d1bb73bbbe14e0e31', N'0221', N'cxr', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1639', N'谢立绍', NULL, N'', N'3c1e4bd67169b8153e0047536c9f541e', N'0130', N'xls', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1640', N'蒋杨', NULL, N'', N'84f0f20482cde7e5eacaf7364a643d33', N'030901', N'jy', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1643', N'陈泓小', NULL, N'', N'f670ef5d2d6bdf8f29450a970494dd64', N'0132', N'chx', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1644', N'胡华', NULL, N'', N'89f03f7d02720160f1b04cf5b27f5ccb', N'0119', N'hh', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1645', N'彭芳慧', NULL, N'', N'c1fea270c48e8079d8ddf7d06d26ab52', N'0127', N'pfh', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1646', N'李晟玲', NULL, N'', N'e4873aa9a05cc5ed839561d121516766', N'0104', N'lsl', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1648', N'覃顺', NULL, N'', N'7437d136770f5b35194cb46c1653efaa', N'0133', N'ts', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1654', N'徐凤', NULL, N'', N'9d2682367c3935defcb1f9e247a97c0d', N'0119', N'xf', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1661', N'金明亚', NULL, N'', N'7d12b66d3df6af8d429c1a357d8b9e1a', N'0108', N'jmy', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1663', N'肖姗', NULL, N'', N'e449b9317dad920c0dd5ad0a2a2d5e49', N'0315', N'xs', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1678', N'肖格', NULL, N'', N'2cb6b10338a7fc4117a80da24b582060', N'0224', N'xg', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1682', N'周白', NULL, N'', N'6a81681a7af700c6385d36577ebec359', N'0112', N'zb', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1709', N'杨胡明', NULL, N'', N'52d080a3e172c33fd6886a37e7288491', N'0224', N'yhm', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1711', N'杜兰', NULL, N'', N'a941493eeea57ede8214fd77d41806bc', N'0218', N'dl', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1712', N'周文 ', NULL, N'', N'a51c896c9cb81ecb5a199d51ac9fc3c5', N'0221', N'zw', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1724', N'程娥', NULL, N'', N'62889e73828c756c961c5a6d6c01a463', N'0113', N'ce', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1728', N'邓国诗', NULL, N'', N'7137debd45ae4d0ab9aa953017286b20', N'040301', N'dgs', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1734', N'史车万', NULL, N'', N'ab2b41c63853f0a651ba9fbf502b0cd8', N'0203', N'scw', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1736', N'文东', NULL, N'', N'c0d0e461de8d0024aebcb0a7c68836df', N'0209', N'wd', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1740', N'侯妮', NULL, N'', N'54f5f4071faca32ad5285fef87b78646', N'0204', N'hn', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1741', N'苏霞', NULL, N'', N'b3b43aeeacb258365cc69cdaf42a68af', N'0204', N'sx', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1743', N'骆晶晶', NULL, N'', N'955a1584af63a546588caae4d23840b3', N'0223', N'ljj', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1744', N'李忠', NULL, N'', N'418ef6127e44214882c61e372e866691', N'0203', N'lz', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1746', N'邹崇俊', NULL, N'', N'442cde81694ca09a626eeddefd1b74ca', N'040301', N'zcj', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1752', N'游杨', NULL, N'', N'11c484ea9305ea4c7bb6b2e6d570d466', N'0104', N'yy', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1756', N'周苗', NULL, N'', N'cefab442b1728a7c1b49c63f1a55781c', N'0108', N'zm', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1757', N'吴瑞王', NULL, N'', N'd2cdf047a6674cef251d56544a3cf029', N'0116', N'wrw', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1758', N'曾杰', NULL, N'', N'2612aa892d962d6f8056b195ca6e550d', N'0105', N'cj', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1759', N'胡华', NULL, N'', N'ba1b3eba322eab5d895aa3023fe78b9c', N'030901', N'hh', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1761', N'史娥菊', NULL, N'', N'7283518d47a05a09d33779a17adf1707', N'0113', N'sej', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1766', N'谭嫣', NULL, N'', N'96a93ba89a5b5c6c226e49b88973f46e', N'0114', N'ty', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1769', N'史成徐', NULL, N'', N'7eb7eabbe9bd03c2fc99881d04da9cbd', N'0133', N'scx', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1770', N'秦崇', NULL, N'', N'e5a4d6bf330f23a8707bb0d6001dfbe8', N'0107', N'qc', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1771', N'陈萍珆', NULL, N'', N'21be9a4bd4f81549a9d1d241981cec3c', N'0119', N'cpy', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1772', N'施凤魏', NULL, N'', N'299570476c6f0309545110c592b6a63b', N'0105', N'sfw', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1773', N'吴萍', NULL, N'', N'4abe17a1c80cbdd2aa241b70840879de', N'0132', N'wp', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1774', N'徐进利', NULL, N'', N'f0bda020d2470f2e74990a07a607ebd9', N'0121', N'xjl', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1775', N'李超', NULL, N'', N'36d7534290610d9b7e9abed244dd2f28', N'0108', N'lc', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1778', N'杜学', NULL, N'', N'6709e8d64a5f47269ed5cea9f625f7ab', N'0105', N'dx', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1779', N'胡刘', NULL, N'', N'8c01a75941549a705cf7275e41b21f0d', N'0110', N'hl', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1782', N'王花莉', NULL, N'', N'4a2ddf148c5a9c42151a529e8cbdcc06', N'0132', N'whl', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1783', N'赵解', NULL, N'', N'b865367fc4c0845c0682bd466e6ebf4c', N'0209', N'zj', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1786', N'张章珏', NULL, N'', N'6449f44a102fde848669bdd9eb6b76fa', N'0116', N'zzj', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1787', N'赵汪黄', NULL, N'', N'd860bd12ce9c026814bbdfc1c573f0f5', N'0315', N'zwh', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1788', N'周玲', NULL, N'', N'db957c626a8cd7a27231adfbf51e20eb', N'0209', N'zl', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1794', N'胡萍金', NULL, N'', N'59e0b2658e9f2e77f8d4d83f8d07ca84', N'0212', N'hpj', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1798', N'姚荣', NULL, N'', N'ac5dab2e99eee9cf9ec672e383691302', N'0219', N'yr', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1806', N'向凤', NULL, N'', N'd1e946f4e67db4b362ad23818a6fb78a', N'0203', N'xf', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1814', N'李金', NULL, N'', N'155fa09596c7e18e50b58eb7e0c6ccb4', N'0209', N'lj', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1819', N'张郑启', NULL, N'', N'17c3433fecc21b57000debdf7ad5c930', N'0204', N'zzq', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1820', N'方香', NULL, N'', N'f2d887e01a80e813d9080038decbbabb', N'0204', N'fx', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1822', N'王浩德', NULL, N'', N'0e087ec55dcbe7b2d7992d6b69b519fb', N'0204', N'whd', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1823', N'丁小', NULL, N'', N'14cfdb59b5bda1fc245aadae15b1984a', N'0210', N'dx', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1830', N'陈琼童', NULL, N'', N'069654d5ce089c13f642d19f09a3d1c0', N'0210', N'cqt', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1836', N'吴黎兵', NULL, N'', N'f26dab9bf6a137c3b6782e562794c2f2', N'0208', N'wlb', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1844', N'芦杰', NULL, N'', N'06a15eb1c3836723b53e4abca8d9b879', N'0208', N'lj', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1845', N'曾德', NULL, N'', N'59bcda7c438bad7d2afffe9e2fed00be', N'0208', N'cd', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1846', N'徐亚燕', NULL, N'', N'f45a1078feb35de77d26b3f7a52ef502', N'0218', N'xyy', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1850', N'芦巧', NULL, N'', N'8c3039bd5842dca3d944faab91447818', N'0223', N'lq', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1851', N'李晶', NULL, N'', N'ff1418e8cc993fe8abcfe3ce2003e5c5', N'0224', N'lj', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1853', N'杨肖', NULL, N'', N'7503cfacd12053d309b6bed5c89de212', N'0224', N'yx', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1863', N'胡轩华', NULL, N'', N'09fb05dd477d4ae6479985ca56c5a12d', N'0127', N'hxh', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1868', N'吴园家', NULL, N'', N'c164bbc9d6c72a52c599bbb43d8db8e1', N'0315', N'wyj', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1869', N'罗徐辉', NULL, N'', N'68c694de94e6c110f42e587e8e48d852', N'0105', N'lxh', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1878', N'吴莉', NULL, N'', N'dc5d637ed5e62c36ecb73b654b05ba2a', N'0315', N'wl', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1882', N'李黄华', NULL, N'', N'e1314fc026da60d837353d20aefaf054', N'0123', N'lhh', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1883', N'吴过娟', NULL, N'', N'c45008212f7bdf6eab6050c2a564435a', N'0209', N'wgj', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1884', N'袁欣和', NULL, N'', N'f0fcf351df4eb6786e9bb6fc4e2dee02', N'0128', N'yxh', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1885', N'刘欣', NULL, N'', N'd523773c6b194f37b938d340d5d02232', N'0315', N'lx', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1892', N'李李程', NULL, N'', N'ca460332316d6da84b08b9bcf39b687b', N'0204', N'llc', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1896', N'白张', NULL, N'', N'e06f967fb0d355592be4e7674fa31d26', N'0105', N'bz', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1901', N'胡爽君', NULL, N'', N'd54e99a6c03704e95e6965532dec148b', N'0127', N'hsj', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1905', N'陈阳麒', NULL, N'', N'73e0f7487b8e5297182c5a711d20bf26', N'0110', N'cyq', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1908', N'张向', NULL, N'', N'65699726a3c601b9f31bf04019c8593c', N'0130', N'zx', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1909', N'张娜春', NULL, N'', N'0609154fa35b3194026346c9cac2a248', N'0129', N'znc', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1921', N'丁宁', NULL, N'', N'9f6992966d4c363ea0162a056cb45fe5', N'031803', N'dn', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1928', N'郑王张', NULL, N'', N'5bce843dd76db8c939d5323dd3e54ec9', N'0219', N'zwz', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1931', N'谭周峰', NULL, N'', N'15d185eaa7c954e77f5343d941e25fbd', N'0205', N'tzf', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1932', N'李兰', NULL, N'', N'52d2752b150f9c35ccb6869cbf074e48', N'0204', N'll', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1934', N'方珆', NULL, N'', N'8562ae5e286544710b2e7ebe9858833b', N'0221', N'fy', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1937', N'黄红', NULL, N'', N'136f951362dab62e64eb8e841183c2a9', N'0218', N'hh', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1940', N'石飞春', NULL, N'', N'95e6834d0a3d99e9ea8811855ae9229d', N'0208', N'sfc', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1942', N'喻严', NULL, N'', N'519c84155964659375821f7ca576f095', N'0268', N'yy', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1945', N'邹万卫', NULL, N'', N'2d00f43f07911355d4151f13925ff292', N'0203', N'zww', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1952', N'韩全', NULL, N'', N'1113d7a76ffceca1bb350bfe145467c6', N'0220', N'hq', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1953', N'魏杨陈', NULL, N'', N'a38b16173474ba8b1a95bcbc30d3b8a5', N'0127', N'wyc', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1955', N'叶晶', NULL, N'', N'378a063b8fdb1db941e34f4bde584c7d', N'0130', N'yj', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1956', N'喻张吴', NULL, N'', N'e3408432c1a48a52fb6c74d926b38886', N'0315', N'yzw', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1966', N'谭向', NULL, N'', N'3683af9d6f6c06acee72992f2977f67e', N'0219', N'tx', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1968', N'叶英周', NULL, N'', N'98c7242894844ecd6ec94af67ac8247d', N'0223', N'yyz', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1970', N'陈姚', NULL, N'', N'0004d0b59e19461ff126e3a08a814c33', N'0224', N'cy', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1971', N'曾觅汉', NULL, N'', N'de73998802680548b916f1947ffbad76', N'0222', N'cmh', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1972', N'万士钟', NULL, N'', N'c4de8ced6214345614d33fb0b16a8acd', N'0204', N'wsz', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1973', N'胡盛', NULL, N'', N'deb54ffb41e085fd7f69a75b6359c989', N'0204', N'hs', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1976', N'邹凯鹏', NULL, N'', N'dd055f53a45702fe05e449c30ac80df9', N'0208', N'zkp', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1979', N'明硕', NULL, N'', N'798cebccb32617ad94123450fd137104', N'0202', N'ms', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1980', N'黄文', NULL, N'', N'f80bf05527157a8c2a7bb63b22f49aaa', N'0203', N'hw', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1981', N'官薇清', NULL, N'', N'b3b4d2dbedc99fe843fd3dedb02f086f', N'0203', N'gwq', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1984', N'乐张', NULL, N'', N'1b36ea1c9b7a1c3ad668b8bb5df7963f', N'0315', N'lz', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1988', N'周珊', NULL, N'', N'9d7311ba459f9e45ed746755a32dcd11', N'0219', N'zs', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1990', N'尹徐天', NULL, N'', N'dc513ea4fbdaa7a14786ffdebc4ef64e', N'0128', N'yxt', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1993', N'张杰利', NULL, N'', N'c5a4e7e6882845ea7bb4d9462868219b', N'0116', N'zjl', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1995', N'朱婉', NULL, N'', N'3f088ebeda03513be71d34d214291986', N'0119', N'zw', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1996', N'周姗', NULL, N'', N'6351bf9dce654515bf1ddbd6426dfa97', N'0129', N'zs', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1997', N'秦英群', NULL, N'', N'06964dce9addb1c5cb5d6e3d9838f733', N'0129', N'qyq', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1998', N'叶程慧', NULL, N'', N'c5b2cebf15b205503560c4e8e6d1ea78', N'0130', N'ych', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'1999', N'付萍朗', NULL, N'', N'5ec829debe54b19a5f78d9a65b900a39', N'0128', N'fpl', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'2361', N'冯红', NULL, N'', N'794288f252f45d35735a13853e605939', N'0113', N'fh', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'2366', N'内云敏', NULL, N'', N'd3b1fb02964aa64e257f9f26a31f72cf', N'0130', N'nym', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'2368', N'徐建雷', NULL, N'', N'466accbac9a66b805ba50e42ad715740', N'0315', N'xjl', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, NULL, N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'2379', N'刘高徐', NULL, N'', N'add217938e07bb1fd8796e0315b88c10', N'0219', N'lgx', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, N'0', N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'2383', N'张杰', NULL, N'', N'3baa271bc35fe054c86928f7016e8ae6', N'0202', N'zj', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, N'0', N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'2385', N'薛高薛', NULL, N'', N'1a68e5f4ade56ed1d4bf273e55510750', N'0224', N'xgx', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, N'0', N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'2392', N'李唐', NULL, N'', N'a554f89dd61cabd2ff833d3468e2008a', N'0224', N'lt', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, N'0', N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'2393', N'毛周', NULL, N'', N'52cf49fea5ff66588408852f65cf8272', N'0218', N'mz', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, N'0', N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'2401', N'徐津晶', NULL, N'', N'959ef477884b6ac2241b19ee4fb776ae', N'0222', N'xjj', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, N'0', N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'2409', N'谌璐', NULL, N'', N'b3f61131b6eceeb2b14835fa648a48ff', N'0133', N'cl', N'', N'', N'', N'', NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', N'', N'', N'0', N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'2410', N'邬彬晓', NULL, N'', N'a6ea8471c120fe8cc35a2954c9b9c595', N'0112', N'wbx', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', N'', N'', N'0', N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'2413', N'陈张丁', NULL, N'', N'72e6d3238361fe70f22fb0ac624a7072', N'0133', N'czd', N'', N'', N'', N'', NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', N'', N'', N'0', N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'2418', N'徐友', NULL, N'', N'db60b95decdeed944b4cd8685417cfdc', N'0315', N'xy', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', N'', N'', N'0', N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'2419', N'刘赵宁', NULL, N'', N'020bf2c45e7bb322f89a226bd2c5d41b', N'030903', N'lzn', N'', N'', N'', N'', NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', N'', N'', N'0', N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'2423', N'阮凤娟', NULL, N'', N'af5d5ef24881f3c3049a7b9bfe74d58b', N'0127', N'rfj', N'', N'', N'', N'', NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', N'', N'', N'0', N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'2428', N'袁香心', NULL, N'', N'cc0991344c3d760ae42259064406bae1', N'0119', N'yxx', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', N'', N'', N'0', N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'2429', N'陈代', NULL, N'', N'a9365bd906e11324065c35be476beb0c', N'0105', N'cd', N'', N'', N'', N'', NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', N'', N'', N'0', N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'2430', N'张赵根', NULL, N'', N'1fb2a1c37b18aa4611c3949d6148d0f8', N'0105', N'zzg', N'', N'', N'', N'', NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', N'', N'', N'0', N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'2431', N'刘丽巧', NULL, N'', N'cbf8710b43df3f2c1553e649403426df', N'0105', N'llq', N'', N'', N'', N'', NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', N'', N'', N'0', N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'2452', N'陈明', NULL, N'', N'28b60a16b55fd531047c0c958ce14b95', N'0204', N'cm', N'', N'', N'', N'', NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', N'', N'', N'0', N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'2459', N'郑田家', NULL, N'', N'8bdb5058376143fa358981954e7626b8', N'0223', N'ztj', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, N'0', N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'2468', N'吴红文', NULL, N'', N'e82c4b19b8151ddc25d4d93baf7b908f', N'0119', N'whw', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', N'', N'', N'0', N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'2486', N'周方牡', NULL, N'', N'bb03e43ffe34eeb242a2ee4a4f125e56', N'0223', N'zfm', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, N'0', N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'2498', N'方进玉', NULL, N'', N'9af76329c78e28c977ab1bcd1c3fe9b8', N'0128', N'fjy', N'', N'', N'', N'', NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', N'', N'', N'0', N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'2503', N'李敏巍', NULL, N'', N'e71e5cd119bbc5797164fb0cd7fd94a4', N'040301', N'lmw', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', N'', N'', N'0', N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'2508', N'张妍忠', NULL, N'', N'30aaf34d6afd4b11cc3b3ac4704c7908', N'0104', N'zyz', N'', N'', N'', N'', NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', N'', N'', N'0', N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'2509', N'姚成文', NULL, N'', N'8db9264228dc48fbf47535e888c02ae0', N'0107', N'ycw', N'', N'', NULL, NULL, NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', N'', N'', N'0', N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'2524', N'王金兰', NULL, N'', N'31c97cbb941d3e92d0e6f9925e9bc4d7', N'0219', N'wjl', N'', N'', N'', N'', NULL, N'', N'0', N'2', N'0', N'', N'', NULL, N'', N'', N'', N'0', N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'3089', N'陈恺', NULL, N'', N'ccd2e3eaa5c991ac880991328c8f1463', N'0219', N'ck', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, N'0', N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'3106', N'田利', NULL, N'', N'4aec1b3435c52abbdf8334ea0e7141e0', N'0202', N'tl', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, N'0', N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'3127', N'周琼小', NULL, N'', N'ca1d3153a1cf0ed998d4879fbb50d9ab', N'0219', N'zqx', N'', N'', NULL, NULL, NULL, N'', N'0', N'0', N'0', N'', N'', NULL, N'', NULL, NULL, N'0', N'', NULL)
GO

INSERT INTO [dbo].[Sys_Op] VALUES (N'8888', N'曹伟民', NULL, N'', N'4297f44b13955235245b2497399d7a93', N'0411', N'cwm', N'', N'', NULL, NULL, N'2020-09-20 12:07:36.077', N'127.0.0.1', N'0', N'0', N'0', N'17701343004', N'remobjects@qq.com', NULL, N'', NULL, NULL, N'1', N'', NULL)
GO


-- ----------------------------
-- Table structure for Sys_OpOffice
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Sys_OpOffice]') AND type IN ('U'))
	DROP TABLE [dbo].[Sys_OpOffice]
GO

CREATE TABLE [dbo].[Sys_OpOffice] (
  [OfficeID] varchar(8) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [OpID] varchar(8) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [StopSign] bit DEFAULT ((0)) NOT NULL
)
GO

ALTER TABLE [dbo].[Sys_OpOffice] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of Sys_OpOffice
-- ----------------------------
INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0122', N'0059', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0135', N'0059', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0271', N'0059', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0124', N'0067', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0213', N'0067', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0214', N'0067', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0129', N'0075', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0211', N'0081', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0224', N'0097', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0163', N'0123', N'1')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0271', N'0123', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0210', N'0160', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0220', N'0175', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0221', N'0181', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0222', N'0181', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0127', N'0191', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0128', N'0191', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0149', N'0191', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0154', N'0191', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0204', N'0191', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0205', N'0191', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'031501', N'0207', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'031502', N'0207', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'031503', N'0207', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'031504', N'0207', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'031505', N'0207', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'031506', N'0207', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0122', N'0218', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'031501', N'0271', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'031502', N'0271', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'031503', N'0271', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'031504', N'0271', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'031505', N'0271', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'031506', N'0271', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0163', N'0277', N'1')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0271', N'0277', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0224', N'0281', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0275', N'0294', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0111', N'0302', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0320', N'0307', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0321', N'0307', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'031802', N'0341', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'031501', N'0394', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'031502', N'0394', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'031503', N'0394', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'031504', N'0394', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'031505', N'0394', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'031506', N'0394', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'031501', N'0396', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'031502', N'0396', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'031503', N'0396', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'031504', N'0396', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'031505', N'0396', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'031506', N'0396', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'031501', N'0402', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'031502', N'0402', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'031503', N'0402', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'031504', N'0402', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'031505', N'0402', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'031506', N'0402', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0275', N'0427', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0208', N'0455', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0268', N'0455', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0319', N'0459', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0109', N'0493', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0212', N'0493', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0213', N'0493', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0214', N'0493', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0324', N'0493', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0208', N'0527', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0268', N'0527', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0122', N'0545', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0223', N'0575', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0218', N'0586', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0208', N'0598', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0268', N'0598', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0269', N'0621', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0109', N'0665', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0124', N'0665', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0125', N'0665', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0213', N'0665', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0214', N'0665', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0324', N'0665', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0102', N'0667', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0159', N'0667', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0160', N'0667', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0112', N'0693', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0164', N'0693', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0221', N'0693', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0222', N'0693', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0302', N'0693', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'031803', N'0695', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0122', N'0696', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0163', N'0702', N'1')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0271', N'0702', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0218', N'0708', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0226', N'0708', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0211', N'0740', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'031501', N'0890', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'031502', N'0890', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'031503', N'0890', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'031504', N'0890', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'031505', N'0890', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'031506', N'0890', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'031501', N'0915', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'031502', N'0915', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'031503', N'0915', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'031504', N'0915', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'031505', N'0915', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'031506', N'0915', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0122', N'0948', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0109', N'0967', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0125', N'0967', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0212', N'0967', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0213', N'0967', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0214', N'0967', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0309', N'1041', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'030902', N'1041', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'030903', N'1041', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'030905', N'1041', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0223', N'1051', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0220', N'1055', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0319', N'1055', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0210', N'1083', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0221', N'1099', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0222', N'1099', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0224', N'1102', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0218', N'1106', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0226', N'1106', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0210', N'1107', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0320', N'1112', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0321', N'1112', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0122', N'1115', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0162', N'1115', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0202', N'1115', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0203', N'1115', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0204', N'1115', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0205', N'1115', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0206', N'1115', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0207', N'1115', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0208', N'1115', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0209', N'1115', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0210', N'1115', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0211', N'1115', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0212', N'1115', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0213', N'1115', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0214', N'1115', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0215', N'1115', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0216', N'1115', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0218', N'1115', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0219', N'1115', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0220', N'1115', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0221', N'1115', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0222', N'1115', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0223', N'1115', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0224', N'1115', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0226', N'1115', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0227', N'1115', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0228', N'1115', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0268', N'1115', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0269', N'1115', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0271', N'1115', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0273', N'1115', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0275', N'1115', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0276', N'1115', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0277', N'1115', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0211', N'1116', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0309', N'1119', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'030901', N'1119', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'030902', N'1119', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'030905', N'1119', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0133', N'1124', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0219', N'1124', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0222', N'1134', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'031501', N'1147', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'031502', N'1147', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'031503', N'1147', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'031504', N'1147', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'031505', N'1147', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'031506', N'1147', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'031501', N'1150', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'031502', N'1150', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'031503', N'1150', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'031504', N'1150', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'031505', N'1150', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'031506', N'1150', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0218', N'1166', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0204', N'1232', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0204', N'1234', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0268', N'1242', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0302', N'1242', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0220', N'1253', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0268', N'1253', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0220', N'1254', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0163', N'1263', N'1')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0271', N'1263', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0114', N'1266', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0269', N'1266', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0122', N'1283', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0107', N'1285', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0226', N'1285', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0109', N'1306', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0125', N'1306', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0212', N'1306', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0213', N'1306', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0214', N'1306', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0203', N'1310', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0206', N'1310', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0203', N'1315', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0206', N'1315', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0269', N'1319', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0122', N'1327', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0223', N'1339', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0129', N'1342', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0207', N'1342', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0269', N'1342', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0223', N'1357', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0207', N'1377', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0269', N'1377', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0226', N'1394', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'031501', N'1397', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'031502', N'1397', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'031503', N'1397', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'031504', N'1397', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'031505', N'1397', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'031506', N'1397', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0207', N'1408', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0269', N'1408', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0223', N'1421', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0269', N'1423', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0269', N'1424', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0269', N'1425', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0211', N'1428', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0210', N'1455', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0213', N'1467', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0214', N'1467', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'031501', N'1470', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'031502', N'1470', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'031503', N'1470', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'031504', N'1470', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'031505', N'1470', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'031506', N'1470', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0219', N'1473', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0119', N'1477', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0215', N'1477', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0216', N'1477', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0223', N'1479', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'030902', N'1492', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'030903', N'1492', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'030905', N'1492', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0109', N'1496', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0119', N'1496', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0125', N'1496', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0212', N'1496', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0213', N'1496', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0214', N'1496', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0211', N'1499', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0208', N'1513', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0268', N'1513', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'031501', N'1528', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'031502', N'1528', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'031503', N'1528', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'031504', N'1528', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'031505', N'1528', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'031506', N'1528', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0119', N'1563', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0135', N'1563', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0147', N'1563', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0224', N'1572', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0163', N'1574', N'1')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0271', N'1574', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0119', N'1575', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0211', N'1575', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'031501', N'1579', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'031502', N'1579', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'031503', N'1579', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'031504', N'1579', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'031505', N'1579', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'031506', N'1579', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0203', N'1639', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0206', N'1639', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0309', N'1640', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'030902', N'1640', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'030903', N'1640', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'030905', N'1640', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0220', N'1643', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0203', N'1644', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0206', N'1644', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0204', N'1645', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0205', N'1645', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0210', N'1646', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0219', N'1648', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0112', N'1654', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0119', N'1654', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0135', N'1654', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0163', N'1654', N'1')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0271', N'1654', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0224', N'1661', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'031501', N'1663', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'031502', N'1663', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'031503', N'1663', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'031504', N'1663', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'031505', N'1663', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'031506', N'1663', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0108', N'1678', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0112', N'1682', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0119', N'1682', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0135', N'1682', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0156', N'1682', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0271', N'1682', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0218', N'1711', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0226', N'1711', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0208', N'1724', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0268', N'1724', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0302', N'1724', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0122', N'1728', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0206', N'1734', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0206', N'1744', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0210', N'1752', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0224', N'1756', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0221', N'1757', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0222', N'1757', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0223', N'1758', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'030902', N'1759', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0205', N'1761', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0208', N'1761', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0268', N'1761', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0269', N'1766', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0219', N'1769', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0218', N'1770', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0110', N'1771', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0211', N'1771', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0223', N'1772', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0220', N'1773', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0215', N'1774', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0216', N'1774', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0224', N'1775', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0223', N'1778', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0211', N'1779', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0220', N'1782', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0161', N'1783', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0221', N'1786', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0222', N'1786', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'031501', N'1787', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'031502', N'1787', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'031503', N'1787', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'031504', N'1787', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'031505', N'1787', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'031506', N'1787', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0206', N'1806', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0218', N'1846', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0226', N'1846', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0204', N'1863', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'031501', N'1868', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'031502', N'1868', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'031503', N'1868', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'031504', N'1868', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'031505', N'1868', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'031506', N'1868', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0223', N'1869', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'031501', N'1878', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'031502', N'1878', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'031503', N'1878', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'031504', N'1878', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'031505', N'1878', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'031506', N'1878', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0226', N'1882', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0205', N'1884', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'031501', N'1885', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'031502', N'1885', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'031503', N'1885', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'031504', N'1885', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'031505', N'1885', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'031506', N'1885', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0204', N'1892', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0223', N'1896', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0204', N'1901', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0211', N'1905', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0203', N'1908', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0206', N'1908', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0202', N'1909', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0207', N'1909', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0269', N'1909', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0218', N'1937', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0226', N'1937', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0276', N'1942', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0206', N'1945', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0204', N'1953', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0203', N'1955', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0206', N'1955', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'031501', N'1956', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'031502', N'1956', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'031503', N'1956', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'031504', N'1956', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'031505', N'1956', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'031506', N'1956', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0207', N'1979', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0269', N'1979', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0206', N'1980', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0206', N'1981', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'031501', N'1984', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'031502', N'1984', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'031503', N'1984', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'031504', N'1984', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'031505', N'1984', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'031506', N'1984', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0219', N'1988', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0205', N'1990', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0221', N'1993', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0222', N'1993', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0129', N'1995', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0202', N'1995', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0207', N'1995', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0269', N'1995', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0202', N'1996', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0207', N'1996', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0269', N'1996', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0202', N'1997', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0207', N'1997', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0269', N'1997', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0203', N'1998', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0206', N'1998', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0205', N'1999', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0208', N'2361', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0268', N'2361', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0276', N'2361', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0203', N'2366', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0206', N'2366', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'031501', N'2368', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'031502', N'2368', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'031503', N'2368', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'031504', N'2368', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'031505', N'2368', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'031506', N'2368', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0207', N'2383', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0269', N'2383', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0207', N'2385', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0269', N'2385', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0218', N'2393', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0226', N'2393', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0218', N'2401', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0226', N'2401', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0219', N'2409', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0112', N'2410', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0271', N'2410', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0219', N'2413', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'031501', N'2418', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'031502', N'2418', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'031503', N'2418', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'031504', N'2418', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'031505', N'2418', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'031506', N'2418', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'030901', N'2419', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0204', N'2423', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0205', N'2423', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0212', N'2428', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0213', N'2428', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0214', N'2428', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0210', N'2429', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0223', N'2430', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0223', N'2431', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0226', N'2459', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0163', N'2468', N'1')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0271', N'2468', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0205', N'2498', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0210', N'2508', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0218', N'2509', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0133', N'2524', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0219', N'2524', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0207', N'3106', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0269', N'3106', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0116', N'8888', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0135', N'8888', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0202', N'8888', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0203', N'8888', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0204', N'8888', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0205', N'8888', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0210', N'8888', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0211', N'8888', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0221', N'8888', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0222', N'8888', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0228', N'8888', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'031801', N'8888', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'031802', N'8888', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'031803', N'8888', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'031804', N'8888', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'031805', N'8888', N'0')
GO

INSERT INTO [dbo].[Sys_OpOffice] VALUES (N'0411', N'8888', N'0')
GO


-- ----------------------------
-- Table structure for Sys_Param
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Sys_Param]') AND type IN ('U'))
	DROP TABLE [dbo].[Sys_Param]
GO

CREATE TABLE [dbo].[Sys_Param] (
  [ParamName] varchar(30) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [ParamType] varchar(20) COLLATE Chinese_PRC_CI_AS  NULL,
  [ParamTitle] varchar(30) COLLATE Chinese_PRC_CI_AS  NULL,
  [ParamValue] varchar(200) COLLATE Chinese_PRC_CI_AS  NULL,
  [Editor] varchar(500) COLLATE Chinese_PRC_CI_AS  NULL,
  [Memo] varchar(50) COLLATE Chinese_PRC_CI_AS  NULL,
  [OrderID] int  NULL
)
GO

ALTER TABLE [dbo].[Sys_Param] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of Sys_Param
-- ----------------------------
INSERT INTO [dbo].[Sys_Param] VALUES (N'Drug.Clin.CheckControl', N'药事', N'门诊药品处方审核控制', N'1', N'Properties=ImageComboBox
Properties.ImageItems=c0,不须审核,0;c1,须审核,1;c2,审核并通过,2', N'', N'0')
GO

INSERT INTO [dbo].[Sys_Param] VALUES (N'Hosp.Advice.AutoExec', N'住院', N'是否自动执行长期医嘱', N'0', N'', N'', N'0')
GO

INSERT INTO [dbo].[Sys_Param] VALUES (N'Hosp.CreditMoney.MaxValue', N'住院', N'最大欠费额度', N'300000', N'', N'', N'0')
GO

INSERT INTO [dbo].[Sys_Param] VALUES (N'Hosp.Fee.AdvanceDay', N'住院', N'提前记账天数', N'3', N'', N'', N'0')
GO

INSERT INTO [dbo].[Sys_Param] VALUES (N'Hosp.Fee.CancelOpID', N'住院', N'不受任何限制取消收费工号', N'0000', N'', N'', N'0')
GO

INSERT INTO [dbo].[Sys_Param] VALUES (N'SN.ClinFeeID', N'流水号', N'门诊收费流水号', N'202009180001', N'', N'', NULL)
GO

INSERT INTO [dbo].[Sys_Param] VALUES (N'SN.ClinID', N'流水号', N'门诊流水号', N'202009190001', N'', NULL, NULL)
GO

INSERT INTO [dbo].[Sys_Param] VALUES (N'SN.HospApplyID', N'流水号', N'住院申请单号', N'202006160001', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_Param] VALUES (N'SN.HospFeeID', N'流水号', N'住院结算单号', N'202009180001', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_Param] VALUES (N'SN.HospID', N'流水号', N'住院号', N'2020000003', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_Param] VALUES (N'SN.HospPayID', N'流水号', N'住院预缴单号', N'202009090004', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_Param] VALUES (N'SN.MedInOutID', N'流水号', N'药品出入库单号', N'201503230071', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Sys_Param] VALUES (N'Sys.UnitName', N'系统', N'单位名称', N'XXXX医院
', N'Properties=', N'', N'0')
GO

INSERT INTO [dbo].[Sys_Param] VALUES (N'Sys.WriteCard', N'系统', N'建立患者信息,是否必须写卡', N'False', N'Properties=CheckBox', NULL, NULL)
GO

INSERT INTO [dbo].[Sys_Param] VALUES (N'YB.LoginName', N'医保', N'登录名', N'9999', N'', N'', N'3')
GO

INSERT INTO [dbo].[Sys_Param] VALUES (N'YB.LoginPwd', N'医保', N'登录密码', N'9999', N'', N'', N'4')
GO

INSERT INTO [dbo].[Sys_Param] VALUES (N'YB.ServerIP', N'医保', N'服务器地址', N'127.0.0.1', N'', N'', N'1')
GO

INSERT INTO [dbo].[Sys_Param] VALUES (N'YB.ServerPort', N'医保', N'服务器端口', N'9999', N'', N'', N'2')
GO

INSERT INTO [dbo].[Sys_Param] VALUES (N'YB.UnitID', N'医保', N'医院编号', N'0000', N'', N'', N'0')
GO

INSERT INTO [dbo].[Sys_Param] VALUES (N'YBFee.EndYear', N'医保结算', N'是否到了年底中途结算', N'0', N'', N'', N'0')
GO

INSERT INTO [dbo].[Sys_Param] VALUES (N'YBFee.SumTolerance', N'医保结算', N'医保金额与实际金额容许误差', N'1', N'', N'', N'0')
GO

INSERT INTO [dbo].[Sys_Param] VALUES (N'YBFee.Year.BeginDate', N'医保结算', N'医保年度记账起始日期', N'2020-1-1', N'', N'', N'0')
GO

INSERT INTO [dbo].[Sys_Param] VALUES (N'YBFee.Year.EndDate', N'医保结算', N'医保年度记账结束日期', N'2020-12-31', N'', N'', N'0')
GO

INSERT INTO [dbo].[Sys_Param] VALUES (N'YBReg.IntervalDays', N'医保登记', N'两次登记间隔天数', N'15', N'', N'', N'0')
GO


-- ----------------------------
-- Table structure for Sys_Power
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Sys_Power]') AND type IN ('U'))
	DROP TABLE [dbo].[Sys_Power]
GO

CREATE TABLE [dbo].[Sys_Power] (
  [PowerID] varchar(8) COLLATE Chinese_PRC_CI_AS DEFAULT ('00') NOT NULL,
  [PowerName] varchar(20) COLLATE Chinese_PRC_CI_AS  NOT NULL
)
GO

ALTER TABLE [dbo].[Sys_Power] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of Sys_Power
-- ----------------------------
INSERT INTO [dbo].[Sys_Power] VALUES (N'10', N'系统部分')
GO

INSERT INTO [dbo].[Sys_Power] VALUES (N'1010', N'系统维护')
GO

INSERT INTO [dbo].[Sys_Power] VALUES (N'101010', N'操作员管理')
GO

INSERT INTO [dbo].[Sys_Power] VALUES (N'101020', N'报表设计')
GO

INSERT INTO [dbo].[Sys_Power] VALUES (N'101021', N'修改打印结果')
GO

INSERT INTO [dbo].[Sys_Power] VALUES (N'101030', N'字典管理')
GO

INSERT INTO [dbo].[Sys_Power] VALUES (N'1020', N'基础数据部分')
GO

INSERT INTO [dbo].[Sys_Power] VALUES (N'102010', N'药品项目维护')
GO

INSERT INTO [dbo].[Sys_Power] VALUES (N'102020', N'诊疗项目维护')
GO

INSERT INTO [dbo].[Sys_Power] VALUES (N'102030', N'收费组合维护')
GO

INSERT INTO [dbo].[Sys_Power] VALUES (N'102040', N'协定处方维护')
GO

INSERT INTO [dbo].[Sys_Power] VALUES (N'1030', N'医保维护')
GO

INSERT INTO [dbo].[Sys_Power] VALUES (N'103001', N'医保查询')
GO

INSERT INTO [dbo].[Sys_Power] VALUES (N'20', N'药品部分')
GO

INSERT INTO [dbo].[Sys_Power] VALUES (N'2010', N'出入库')
GO

INSERT INTO [dbo].[Sys_Power] VALUES (N'2012', N'住院发药')
GO

INSERT INTO [dbo].[Sys_Power] VALUES (N'2020', N'库存管理')
GO

INSERT INTO [dbo].[Sys_Power] VALUES (N'2021', N'门诊发药统计')
GO

INSERT INTO [dbo].[Sys_Power] VALUES (N'2022', N'住院发药统计')
GO

INSERT INTO [dbo].[Sys_Power] VALUES (N'2023', N'出入库统计')
GO

INSERT INTO [dbo].[Sys_Power] VALUES (N'30', N'财务部分')
GO

INSERT INTO [dbo].[Sys_Power] VALUES (N'3010', N'财务结算查询')
GO

INSERT INTO [dbo].[Sys_Power] VALUES (N'3020', N'财务审核')
GO

INSERT INTO [dbo].[Sys_Power] VALUES (N'40', N'门诊部分')
GO

INSERT INTO [dbo].[Sys_Power] VALUES (N'4010', N'门诊挂号')
GO

INSERT INTO [dbo].[Sys_Power] VALUES (N'4020', N'门诊患者')
GO

INSERT INTO [dbo].[Sys_Power] VALUES (N'4021', N'门诊医生')
GO

INSERT INTO [dbo].[Sys_Power] VALUES (N'4022', N'执行处方')
GO

INSERT INTO [dbo].[Sys_Power] VALUES (N'4030', N'门诊收费')
GO

INSERT INTO [dbo].[Sys_Power] VALUES (N'4040', N'门诊查询')
GO

INSERT INTO [dbo].[Sys_Power] VALUES (N'4050', N'门诊统计')
GO

INSERT INTO [dbo].[Sys_Power] VALUES (N'50', N'住院部分')
GO

INSERT INTO [dbo].[Sys_Power] VALUES (N'5001', N'住院患者')
GO

INSERT INTO [dbo].[Sys_Power] VALUES (N'5010', N'入出院管理')
GO

INSERT INTO [dbo].[Sys_Power] VALUES (N'5020', N'住院管理')
GO

INSERT INTO [dbo].[Sys_Power] VALUES (N'5021', N'编辑医嘱')
GO

INSERT INTO [dbo].[Sys_Power] VALUES (N'5022', N'执行医嘱')
GO

INSERT INTO [dbo].[Sys_Power] VALUES (N'5023', N'住院申请单')
GO

INSERT INTO [dbo].[Sys_Power] VALUES (N'5025', N'住院发药查询')
GO

INSERT INTO [dbo].[Sys_Power] VALUES (N'5030', N'住院收费')
GO

INSERT INTO [dbo].[Sys_Power] VALUES (N'5040', N'住院查询')
GO

INSERT INTO [dbo].[Sys_Power] VALUES (N'5050', N'住院统计')
GO

INSERT INTO [dbo].[Sys_Power] VALUES (N'70', N'统计部分')
GO

INSERT INTO [dbo].[Sys_Power] VALUES (N'7001', N'门诊科室统计')
GO

INSERT INTO [dbo].[Sys_Power] VALUES (N'7002', N'住院科室统计')
GO

INSERT INTO [dbo].[Sys_Power] VALUES (N'7003', N'医保统计')
GO

INSERT INTO [dbo].[Sys_Power] VALUES (N'7004', N'医疗统计')
GO

INSERT INTO [dbo].[Sys_Power] VALUES (N'7005', N'药品统计')
GO

INSERT INTO [dbo].[Sys_Power] VALUES (N'7006', N'修改医疗统计')
GO


-- ----------------------------
-- Table structure for Sys_Script
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Sys_Script]') AND type IN ('U'))
	DROP TABLE [dbo].[Sys_Script]
GO

CREATE TABLE [dbo].[Sys_Script] (
  [ScriptID] varchar(50) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [SystemID] varchar(20) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [Category] varchar(200) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [Caption] varchar(50) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [ImageName] varchar(50) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [Access] varchar(20) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [ShortKey] varchar(20) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [Flag] int  NOT NULL,
  [CustomAttributes] varchar(2000) COLLATE Chinese_PRC_CI_AS  NULL,
  [Script] text COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [OrderNum] varchar(10) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [Disabled] int DEFAULT ((0)) NOT NULL,
  [Memo] varchar(50) COLLATE Chinese_PRC_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[Sys_Script] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of Sys_Script
-- ----------------------------
INSERT INTO [dbo].[Sys_Script] VALUES (N'pas_base_init', N'', N'系统', N'初始化', N'', N'', N'', N'7', N'', N'
uses Classes, Variants, App_Function, App_Common, App_DAModel;

type
  TDictData = class(TCustomData)
  private
  procedure DoBeforePost(Sender: TObject);
  public
    constructor Create(AOwner: TComponent; ADataConnection: TDataConnection;
      const AServiceName, ALogicalName: string); override;
  end;

  TDictDataClass = class of TDictData;

constructor TDictData.Create(AOwner: TComponent;  ADataConnection: TDataConnection;
  const AServiceName, ALogicalName: string);
begin
  inherited Create(AOwner, ADataConnection, AServiceName, ALogicalName);
  OnBeforePost := DoBeforePost;
end;

procedure TDictData.DoBeforePost(Sender: TObject);
var
  S1: string;
begin
  S1 := CustomAttributes.Values[''ChineseField''];
    if (S1 <> '''') and (AsString[''IME_PY''] = VarToStr(OldValue[''IME_PY''])) then
      AsString[''IME_PY'']:= GetPyHeadOfHzs(AsString[S1]);
end;

procedure RegisterDataDict();
begin     
  DataContainer.RegisterData(DataConnection, ''HisService_YB'', ''D_YB_ZZCode'', TCustomData, 0, '''');  
  DataContainer.RegisterData(DataConnection, ''HisService_YB'', ''D_YB_Area'', TCustomData, 0, '''');
  DataContainer.RegisterData(DataConnection, ''HisService_YB'', ''D_YB_10_JSBZLX'', TCustomData, 0, '''');
  DataContainer.RegisterData(DataConnection, ''HisService_XNH'', ''XNH_Illness'', TCustomData, 0, '''');
  DataContainer.RegisterData(DataConnection, ''HisService_XNH'', ''XNH_bxgs'', TCustomData, 0, '''');  
  DataContainer.RegisterData(DataConnection, ''HisService_Dict'', ''D_UrgentSite'', TDictData, 0, '''');  
  DataContainer.RegisterData(DataConnection, ''HisService_System'', ''Sys_Op_OnDuty'', TCustomData, 0, '''');
  DataContainer.RegisterData(DataConnection, ''HisService_Clinic'', ''Pro_Clin_Reg_Patient'', TCustomData, 0, '''');
end;

begin
  RegisterDataDict();
end.', N'', N'0', N'')
GO

INSERT INTO [dbo].[Sys_Script] VALUES (N'pas_base_xnh_fee_medicine', N'', N'基础数据', N'新农合药品目录维护', N'', N'102010', N'', N'0', N'', N'uses Classes, Forms, SysUtils, uDAWhere, App_Common, App_DAModel, App_DAView;

type
  TScriptView = class(TTableGridDataView)
  private
    FFeeSign: Integer;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy(); override;
    procedure DataQuery(); override;
  end;

var ScriptView: TScriptView;

constructor TScriptView.Create(AOwner: TComponent);
var
  TempData: TCustomData;
  TempStrings: TStrings;
begin
  inherited;
  AppCore.Logger.Write(''ee'', mtInfo, 0);
  SetDataEditing(True);
  FilterEditItem.Visible := True;
  FFeeSign := 1;  //药品维护      
  TempData := TCustomData.Create(Self, DataConnection, ''HisService_XNH'', ''XNH_FeeTable'');
  TempStrings := TempData.FieldCustomAttributes[''FeeName''];
  AppCore.Logger.Write(TempStrings.Text, mtInfo, 0);
  TempStrings.Values[''IME.DictName''] := ''Base_FeeMedicine'';
  ViewData := TempData;
  Operation := MyOperation;
end;

destructor TScriptView.Destroy();
begin
  inherited;
  ScriptView := nil; // 这里很重要
end;

procedure TScriptView.DataQuery();
begin
  ViewData.OpenByFieldValue(''FeeSign'', FFeeSign, dboEqual);
end;

function DoExecute(CommandID: Integer; const Param: array of Variant): Variant;
begin
  if ScriptView = nil then
  begin
    ScriptView := TScriptView.Create(Application);
  end;
  AppCore.MainView.ShowView(ScriptView);
end;

procedure DoClear;
begin
  ScriptView.Free
end;

begin
end.', N'I221', N'0', N'')
GO

INSERT INTO [dbo].[Sys_Script] VALUES (N'pas_base_xnh_fee_treatment', N'', N'基础数据', N'新农合诊疗目录维护', N'', N'102020', N'', N'0', N'', N'uses Classes, Forms, SysUtils, App_Common, App_DAModel, App_DAView;

type
  TScriptView = class(TTableGridDataView)
  private
    FFeeSign: Integer;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy(); override;
    procedure DataQuery(); override;
  end;

var ScriptView: TScriptView;

constructor TScriptView.Create(AOwner: TComponent);
var
  TempData: TCustomData;
begin
  inherited;
  SetDataEditing(True);
  FilterEditItem.Visible := True;
  FFeeSign := 2;  //诊疗维护
  TempData := TCustomData.Create(Self, DataConnection, ''HisService_XNH'', ''XNH_FeeTable'');
  TempData.FieldCustomAttributes[''FeeName''].Values[''IME.DictName''] := ''Base_FeeTreatment'';
  ViewData := TempData;
  Operation := MyOperation;
end;

destructor TScriptView.Destroy();
begin
  inherited;
  ScriptView := nil; // 这里很重要
end;

procedure TScriptView.DataQuery();
begin
  ViewData.OpenByWhereText(''FeeSign='' + IntToStr(FFeeSign));
end;

function DoExecute(CommandID: Integer; const Param: array of Variant): Variant;
begin
  if ScriptView = nil then
  begin
    ScriptView := TScriptView.Create(Application);
  end;
  AppCore.MainView.ShowView(ScriptView);
end;

procedure DoClear;
begin
  ScriptView.Free
end;

begin
end.', N'I222', N'0', N'')
GO

INSERT INTO [dbo].[Sys_Script] VALUES (N'pas_clin_recmaster_unlock', N'', N'系统', N'门诊处方解锁', N'', N'4030', N'', N'2', N'', N'uses Classes, Forms, SysUtils, Dialogs, App_Common, App_Function, 
  App_DAModel, App_DAView;

function DoExecute(CommandID: Integer; const Param: array of Variant): Variant;
var
  DataService: TCustomDataService;
  ClinID: string;
begin
  if InputQuery(''门诊处方解锁'', ''输入门诊号'', ClinID) then
  begin
    DataService := DataConnection.GetDataService(''HisService_Clinic'');
    DataService.BeginCommand(''Pro_Clin_RecMaster_Unlock'');
    DataService.SetCommandParam(''ClinID'', ClinID);
    DataService.EndCommand;
    if DataService.GetCommandOutputParam(''RETURN_VALUE'') > 0 then
      ShowOK(''操作成功.'')
    else 
      raise Exception.Create(''门诊处方解锁：未解锁任何记录'');
  end; 
end;

begin
end.', N'c60', N'0', N'')
GO

INSERT INTO [dbo].[Sys_Script] VALUES (N'pas_hosp_operation', N'', N'住院', N'手术申请查询', N'', N'5001', N'', N'0', N'', N'uses Classes, Forms, SysUtils, App_Common, App_DAModel, App_DAView;

type
  TScriptTableView = class(TTableGridDataView)
  private
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy(); override;
    procedure DataQuery(); override;
  end;

var
  ScriptView: TScriptTableView;

constructor TScriptTableView.Create(AOwner: TComponent);
begin
  inherited;
  PeriodGroup.Visible := True;
  
  EndDate := Date() + 3;
  BeginDate := Date() - 1;

  ViewData := TCustomData.Create(Self, DataConnection, ''HisService_Hosp'', ''Hosp_Operation'');
  //FilterEditItem.Visible := True;
  Operation := MyOperation;
end;

destructor TScriptTableView.Destroy();
begin
  inherited;
  ScriptView := nil;
end;

procedure TScriptTableView.DataQuery(); override;
begin
  ViewData.OpenByPeriod(''SheduleTime'', BeginDate, EndDate+1);
end;

function DoExecute(CommandID: Integer; const Param: array of Variant): Variant;
begin
  if ScriptView = nil then
  begin
    ScriptView := TScriptTableView.Create(Application);
  end;
  AppCore.MainView.ShowView(ScriptView);
end;

procedure DoClear();
begin
end;

begin
end.', N'n11', N'0', N'')
GO

INSERT INTO [dbo].[Sys_Script] VALUES (N'pas_hosp_yb_patient', N'', N'住院', N'医保患者', N'', N'5001', N'', N'0', N'', N'uses Classes, Forms, SysUtils, App_Common, App_DAModel, App_DAView;

type
  TScriptTableView = class(TTableGridDataView)
  private
    //0-按用户科室 1-按传入科室 2-按传入值 3 按入院日期 4按出院日期
    FQueryID: Integer;
    FValue: string;
    procedure Query();
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy(); override;
    procedure DataQuery(); override;
  end;

var
  ScriptView: TScriptTableView;

constructor TScriptTableView.Create(AOwner: TComponent);
begin
  inherited;
  
  //PeriodGroup.Visible := True;

  ViewData := TCustomData.Create(Self, DataConnection, ''HisService_YB'', ''Pro_YB_Patient_Query'');
  //FilterEditItem.Visible := True;
  Operation := MyOperation;
end;

destructor TScriptTableView.Destroy();
begin
  inherited;
  ScriptView := nil;
end;

procedure TScriptTableView.DataQuery();
begin
  if Copy(AppCore.User.OfficeID, 1, 2) = ''02'' then
  begin
    FQueryID := 1;
    FValue := '''';
  end
  else begin
    FQueryID := 2;
    FValue := ''*'';
  end;
  
  Query();
end;

procedure TScriptTableView.Query();
begin
  ViewData.OpenByParam([''OfficeID'', ''OpID'', ''QueryID'', ''Value'', ''BeginDate'', ''EndDate''],
    [AppCore.User.OfficeID, AppCore.User.ID, FQueryID, FValue, BeginDate, EndDate]);
end;

function DoExecute(CommandID: Integer; const Param: array of Variant): Variant;
begin
  if ScriptView = nil then
  begin
    ScriptView := TScriptTableView.Create(Application);
  end;
  AppCore.MainView.ShowView(ScriptView);
end;

procedure DoClear();
begin
end;

begin
end.', N'N021', N'0', N'')
GO

INSERT INTO [dbo].[Sys_Script] VALUES (N'pas_med_clin_stat', N'', N'药品', N'门诊发药统计', N'', N'2021', N'', N'0', N'', N'uses Classes, Forms, SysUtils, App_Common, App_DAModel, App_DAView;

type
  TScriptTableView = class(TTableGridDataView)
  private
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy(); override;
    procedure DataQuery(); override;
  end;

var
  ScriptView: TScriptTableView;

constructor TScriptTableView.Create(AOwner: TComponent);
begin
  inherited; 
  PeriodGroup.Visible := True;
                     
  ViewData := TCustomData.Create(Self, DataConnection, ''HisService_Clinic'', ''Pro_Clin_Med_Stat'');
  //FilterEditItem.Visible := True;
  Operation := MyOperation;
end;

destructor TScriptTableView.Destroy();
begin
  inherited;
  ScriptView := nil;
end;

procedure TScriptTableView.DataQuery(); override;
begin
  ViewData.OpenByParam([''BeginDate'', ''EndDate'', ''OfficeID'', ''OpID''],
    [BeginDate, EndDate, AppCore.User.OfficeID, AppCore.User.ID]);
end;

function DoExecute(CommandID: Integer; const Param: array of Variant): Variant;
begin
  if ScriptView = nil then
  begin
    ScriptView := TScriptTableView.Create(Application);
  end;
  AppCore.MainView.ShowView(ScriptView);
end;

procedure DoClear();
begin
end;

begin
end.', N's21', N'0', N'')
GO

INSERT INTO [dbo].[Sys_Script] VALUES (N'pas_med_hosp_day_list', N'', N'住院', N'住院发药查询', N'', N'5025', N'', N'0', N'', N'uses Classes, Forms, SysUtils, App_Common, App_DAModel, App_DAView;

type
  TScriptTableView = class(TTableGridDataView)
  private
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy(); override;
    procedure DataQuery(); override;
  end;

var
  ScriptView: TScriptTableView;

constructor TScriptTableView.Create(AOwner: TComponent);
begin
  inherited;
  
  SetOnlyOneDate;  // 只查单日
  PeriodGroup.Visible := True;
  
  ViewData := TCustomData.Create(Self, DataConnection, ''HisService_Hosp'', ''Hosp_Med_DayList'');
  //FilterEditItem.Visible := True;
  Operation := MyOperation;
end;

destructor TScriptTableView.Destroy();
begin
  inherited;
  ScriptView := nil;
end;

procedure TScriptTableView.DataQuery(); override;
begin
  ViewData.OpenByParam([''BeginDate'', ''EndDate'', ''ExecOfficeID''], 
    [BeginDate, BeginDate + 1, AppCore.User.OfficeID]);
end;

function DoExecute(CommandID: Integer; const Param: array of Variant): Variant;
begin
  if ScriptView = nil then
  begin
    ScriptView := TScriptTableView.Create(Application);
  end;
  AppCore.MainView.ShowView(ScriptView);
end;

procedure DoClear();
begin
end;

begin
end.', N'n10', N'0', N'')
GO

INSERT INTO [dbo].[Sys_Script] VALUES (N'pas_med_hosp_stat_item', N'', N'药品', N'住院发药明细统计', N'', N'2022', N'', N'0', N'', N'uses Classes, Forms, SysUtils, App_Common, App_DAModel, App_DAView;

type
  TScriptTableView = class(TTableGridDataView)
  private
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy(); override;
    procedure DataQuery(); override;
  end;

var
  ScriptView: TScriptTableView;

constructor TScriptTableView.Create(AOwner: TComponent);
begin
  inherited;
  PeriodGroup.Visible := True;

  ViewData := TCustomData.Create(Self, DataConnection, ''HisService_Hosp'', ''Pro_Hosp_Med_Stat_Item'');
  //FilterEditItem.Visible := True;
  Operation := MyOperation;
end;

destructor TScriptTableView.Destroy();
begin
  inherited;
  ScriptView := nil;
end;

procedure TScriptTableView.DataQuery(); override;
begin
  ViewData.OpenByParam([''BeginDate'', ''EndDate'', ''OfficeID'', ''OpID''],
    [BeginDate, EndDate, AppCore.User.OfficeID, AppCore.User.ID]);
end;

function DoExecute(CommandID: Integer; const Param: array of Variant): Variant;
begin
  if ScriptView = nil then
  begin
    ScriptView := TScriptTableView.Create(Application);
  end;
  AppCore.MainView.ShowView(ScriptView);
end;

procedure DoClear();
begin
end;

begin
end.', N's211', N'0', N'')
GO

INSERT INTO [dbo].[Sys_Script] VALUES (N'pas_med_hosp_stat_office', N'', N'药品', N'住院发药科室统计', N'', N'2022', N'', N'0', N'', N'uses Classes, Forms, SysUtils, App_Common, App_DAModel, App_DAView;

type
  TScriptTableView = class(TTableGridDataView)
  private
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy(); override;
    procedure DataQuery(); override;
  end;

var
  ScriptView: TScriptTableView;

constructor TScriptTableView.Create(AOwner: TComponent);
begin
  inherited;
  PeriodGroup.Visible := True;

  ViewData := TCustomData.Create(Self, DataConnection, ''HisService_Hosp'', ''Pro_Hosp_Med_Stat_Office'');
  //FilterEditItem.Visible := True;
  Operation := MyOperation;
end;

destructor TScriptTableView.Destroy();
begin
  inherited;
  ScriptView := nil;
end;

procedure TScriptTableView.DataQuery(); override;
begin
  ViewData.OpenByParam([''BeginDate'', ''EndDate'', ''OfficeID'', ''OpID''],
    [BeginDate, EndDate, AppCore.User.OfficeID, AppCore.User.ID]);
end;

function DoExecute(CommandID: Integer; const Param: array of Variant): Variant;
begin
  if ScriptView = nil then
  begin
    ScriptView := TScriptTableView.Create(Application);
  end;
  AppCore.MainView.ShowView(ScriptView);
end;

procedure DoClear();
begin
end;

begin
end.', N's212', N'0', N'')
GO

INSERT INTO [dbo].[Sys_Script] VALUES (N'pas_med_inout_stat_detail', N'', N'药品', N'出入库明细查询', N'', N'2010', N'', N'0', N'', N'uses Classes, Forms, SysUtils, App_Common, App_DAModel, App_DAView;

type
  TScriptTableView = class(TTableGridDataView)
  private
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy(); override;
    procedure DataQuery(); override;
  end;

var
  ScriptView: TScriptTableView;

constructor TScriptTableView.Create(AOwner: TComponent);
begin
  inherited;
  PeriodGroup.Visible := True;

  ViewData := TCustomData.Create(Self, DataConnection, ''HisService_Medicine'', ''Pro_Med_InOut_Stat_Detail'');
  //FilterEditItem.Visible := True;
  Operation := MyOperation;
end;

destructor TScriptTableView.Destroy();
begin
  inherited;
  ScriptView := nil;
end;

procedure TScriptTableView.DataQuery(); override;
begin
  ViewData.OpenByParam([''BeginDate'', ''EndDate'', ''OfficeID'', ''OpID''],
    [BeginDate, EndDate, AppCore.User.OfficeID, AppCore.User.ID]);
end;

function DoExecute(CommandID: Integer; const Param: array of Variant): Variant;
begin
  if ScriptView = nil then
  begin
    ScriptView := TScriptTableView.Create(Application);
  end;
  AppCore.MainView.ShowView(ScriptView);
end;

procedure DoClear();
begin
end;

begin
end.', N's19', N'0', N'')
GO

INSERT INTO [dbo].[Sys_Script] VALUES (N'pas_med_inout_stat_office', N'', N'药品', N'科室领药统计', N'', N'2023', N'', N'0', N'', N'uses Classes, Forms, SysUtils, App_Common, App_DAModel, App_DAView;

type
  TScriptTableView = class(TTableGridDataView)
  private
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy(); override;
    procedure DataQuery(); override;
  end;

var
  ScriptView: TScriptTableView;

constructor TScriptTableView.Create(AOwner: TComponent);
begin
  inherited;
  PeriodGroup.Visible := True;

  ViewData := TCustomData.Create(Self, DataConnection, ''HisService_Medicine'', ''Pro_Med_InOut_Stat_Office'');
  //FilterEditItem.Visible := True;
  Operation := MyOperation;
end;

destructor TScriptTableView.Destroy();
begin
  inherited;
  ScriptView := nil;
end;

procedure TScriptTableView.DataQuery(); override;
begin
  ViewData.OpenByParam([''BeginDate'', ''EndDate'', ''OfficeID'', ''OpID''],
    [BeginDate, EndDate, AppCore.User.OfficeID, AppCore.User.ID]);
end;

function DoExecute(CommandID: Integer; const Param: array of Variant): Variant;
begin
  if ScriptView = nil then
  begin
    ScriptView := TScriptTableView.Create(Application);
  end;
  AppCore.MainView.ShowView(ScriptView);
end;

procedure DoClear();
begin
end;

begin
end.', N's20', N'0', N'')
GO

INSERT INTO [dbo].[Sys_Script] VALUES (N'pas_stat_clin_doctor_recipe', N'', N'门诊统计', N'门诊医生申请单统计', N'', N'4050', N'', N'0', N'', N'uses Classes, Forms, SysUtils, uDAWhere, App_Common, App_DAModel, App_DAView;

type
  TScriptView = class(TPivotDataView)
  private
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy(); override;
    procedure DataQuery(); override;
  end;

var ScriptView: TScriptView;

constructor TScriptView.Create(AOwner: TComponent);
begin
  inherited;
  ViewData := TCustomData.Create(Self, DataConnection, ''HisService_Stat'', ''Stat_Clin_Doctor_Recipe'');
  PeriodGroup.Visible := True;
  SetPeriodFormatYearMonth();
  Operation := MyOperation;
end;

destructor TScriptView.Destroy();
begin
  inherited;
  ScriptView := nil; // 这里很重要
end;

procedure TScriptView.DataQuery();
begin
  ViewData.OpenByPeriod(''StatDate'', BeginDate, EndDate);
end;

function DoExecute(CommandID: Integer; const Param: array of Variant): Variant;
begin
  if ScriptView = nil then
  begin
    ScriptView := TScriptView.Create(Application);
  end;
  AppCore.MainView.ShowView(ScriptView);
end;

procedure DoClear;
begin
end;

begin
end.', N'u05', N'0', N'')
GO

INSERT INTO [dbo].[Sys_Script] VALUES (N'pas_stat_clin_doctor_reg', N'', N'门诊统计', N'门诊医生挂号统计', N'', N'4050', N'', N'0', N'', N'uses Classes, Forms, SysUtils, App_Common, App_DAModel, App_DAView;

type
  TScriptView = class(TPivotDataView)
  private
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy(); override;
    procedure DataQuery(); override;
  end;

var ScriptView: TScriptView;

constructor TScriptView.Create(AOwner: TComponent);
begin
  inherited;
  ViewData := TCustomData.Create(Self, DataConnection, ''HisService_Stat'', ''Stat_Clin_Doctor_Reg'');
  PeriodGroup.Visible := True;
  SetPeriodFormatYearMonth();
  Operation := MyOperation;
end;

destructor TScriptView.Destroy();
begin
  inherited;
  ScriptView := nil; // 这里很重要
end;

procedure TScriptView.DataQuery();
begin          
  ViewData.OpenByBetween(''StatDate'', FormatDateTime(''YYYYMM'', BeginDate),
    FormatDateTime(''YYYYMM'', EndDate));
end;

function DoExecute(CommandID: Integer; const Param: array of Variant): Variant;
begin
  if ScriptView = nil then
  begin
    ScriptView := TScriptView.Create(Application);
  end;
  AppCore.MainView.ShowView(ScriptView);
end;

procedure DoClear;
begin
end;

begin
end.', N'u07', N'0', N'')
GO

INSERT INTO [dbo].[Sys_Script] VALUES (N'pas_stat_clin_doctor_stat', N'', N'门诊统计', N'门诊医生收入统计', N'', N'4050', N'', N'0', N'', N'uses Classes, Forms, SysUtils, App_Common, App_DAModel, App_DAView;

type
  TScriptView = class(TPivotDataView)
  private
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy(); override;
    procedure DataQuery(); override;
  end;

var ScriptView: TScriptView;

constructor TScriptView.Create(AOwner: TComponent);
begin
  inherited;
  ViewData := TCustomData.Create(Self, DataConnection, ''HisService_Stat'', ''Stat_Clin_Doctor_Stat'');
  PeriodGroup.Visible := True;
  SetPeriodFormatYearMonth();
  Operation := MyOperation;
end;

destructor TScriptView.Destroy();
begin
  inherited;
  ScriptView := nil; // 这里很重要
end;

procedure TScriptView.DataQuery();
begin
  ViewData.OpenByBetween(''StatDate'', FormatDateTime(''YYYYMM'', BeginDate),
    FormatDateTime(''YYYYMM'', EndDate));
end;

function DoExecute(CommandID: Integer; const Param: array of Variant): Variant;
begin
  if ScriptView = nil then
  begin
    ScriptView := TScriptView.Create(Application);
  end;
  AppCore.MainView.ShowView(ScriptView);
end;

procedure DoClear;
begin
end;

begin
end.', N'u06', N'0', N'')
GO

INSERT INTO [dbo].[Sys_Script] VALUES (N'pas_stat_clin_doctor_work', N'', N'门诊统计', N'门诊医生工作量统计', N'', N'7001', N'', N'0', N'', N'uses Classes, Forms, SysUtils, uDAWhere, App_Common, App_DAModel, App_DAView;

type
  TScriptView = class(TTableGridDataView)
  private
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy(); override;
    procedure DataQuery(); override;
  end;

var ScriptView: TScriptView;

constructor TScriptView.Create(AOwner: TComponent);
begin
  inherited;
  BeginDate := Date() - 1;
  ViewData := TCustomData.Create(Self, DataConnection, ''HisService_Stat'', ''Stat_Clin_Doctor_Work'');
  PeriodGroup.Visible := True;
  SetPeriodFormatYearMonth();
  Operation := MyOperation;
end;

destructor TScriptView.Destroy();
begin
  inherited;
  ScriptView := nil; // 这里很重要
end;

procedure TScriptView.DataQuery();
begin
  if not AppCore.User.HaveAccess(''4050'') then
    ViewData.OpenByList([''StatDate'', ''StatDate'', ''OfficeID''],
      [FormatDateTime(''YYYYMM'', BeginDate), FormatDateTime(''YYYYMM'', EndDate), 
        AppCore.User.OfficeID],
      [dboGreaterOrEqual, dboLessOrEqual, dboEqual], [dboAnd, dboAnd])
  else
    ViewData.OpenByBetween(''StatDate'', FormatDateTime(''YYYYMM'', BeginDate), 
      FormatDateTime(''YYYYMM'', EndDate))
end;

function DoExecute(CommandID: Integer; const Param: array of Variant): Variant;
begin
  if ScriptView = nil then
  begin
    ScriptView := TScriptView.Create(Application);
  end;
  AppCore.MainView.ShowView(ScriptView);
end;

procedure DoClear;
begin
  ScriptView.Free
end;

begin
end.', N'u01', N'0', N'')
GO

INSERT INTO [dbo].[Sys_Script] VALUES (N'pas_stat_clin_fee_feetype', N'', N'门诊统计', N'门诊收费统计', N'', N'4050', N'', N'0', N'', N'uses Classes, Forms, SysUtils, uDAWhere, App_Common, App_DAModel, App_DAView;

type
  TScriptView = class(TTableGridDataView)
  private
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy(); override;
    procedure DataQuery(); override;
  end;

var ScriptView: TScriptView;

constructor TScriptView.Create(AOwner: TComponent);
begin
  inherited;
  ViewData := TCustomData.Create(Self, DataConnection, ''HisService_Stat'', ''Stat_Clin_Fee_FeeType'');
  PeriodGroup.Visible := True;
  SetPeriodFormatYearMonth();
  Operation := MyOperation;
end;

destructor TScriptView.Destroy();
begin
  inherited;
  ScriptView := nil; // 这里很重要
end;

procedure TScriptView.DataQuery();
begin
  ViewData.OpenByBetween(''StatDate'', FormatDateTime(''YYYYMM'', BeginDate),
    FormatDateTime(''YYYYMM'', EndDate));
end;

function DoExecute(CommandID: Integer; const Param: array of Variant): Variant;
begin
  if ScriptView = nil then
  begin
    ScriptView := TScriptView.Create(Application);
  end;
  AppCore.MainView.ShowView(ScriptView);
end;

procedure DoClear;
begin
end;

begin
end.', N'u04', N'0', N'')
GO

INSERT INTO [dbo].[Sys_Script] VALUES (N'pas_stat_clin_office', N'', N'门诊统计', N'门诊收入统计_开方科室', N'', N'7001', N'', N'0', N'', N'uses Classes, Forms, SysUtils, uDAWhere, App_Common, App_DAModel, App_DAView;

type
  TScriptView = class(TPivotDataView)
  private
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy(); override;
    procedure DataQuery(); override;
  end;

var ScriptView: TScriptView;

constructor TScriptView.Create(AOwner: TComponent);
begin
  inherited;
  ViewData := TCustomData.Create(Self, DataConnection, ''HisService_Stat'', ''Stat_Clin_Fee_ClinOffice'');
  PeriodGroup.Visible := True;
  SetPeriodFormatYearMonth();
  Operation := MyOperation;
end;

destructor TScriptView.Destroy();
begin
  inherited;
  ScriptView := nil; // 这里很重要
end;

procedure TScriptView.DataQuery();
begin  
  if not AppCore.User.HaveAccess(''4050'') then
    ViewData.OpenByList([''StatDate'', ''StatDate'', ''OfficeID''],
      [FormatDateTime(''YYYYMM'', BeginDate), FormatDateTime(''YYYYMM'', EndDate), 
        AppCore.User.OfficeID],
      [dboGreaterOrEqual, dboLessOrEqual, dboEqual], [dboAnd, dboAnd])
  else
    ViewData.OpenByBetween(''StatDate'', FormatDateTime(''YYYYMM'', BeginDate), 
      FormatDateTime(''YYYYMM'', EndDate))
end;

function DoExecute(CommandID: Integer; const Param: array of Variant): Variant;
begin
  if ScriptView = nil then
  begin
    ScriptView := TScriptView.Create(Application);
  end;
  AppCore.MainView.ShowView(ScriptView);
end;

procedure DoClear;
begin
  ScriptView.Free
end;

begin
end.', N'u03', N'0', N'')
GO

INSERT INTO [dbo].[Sys_Script] VALUES (N'pas_stat_clin_office_exec', N'', N'门诊统计', N'门诊收入统计_开方和执行科室', N'', N'7001', N'', N'0', N'', N'uses Classes, Forms, SysUtils, uDAWhere, App_Common, App_DAModel, App_DAView;

type
  TScriptView = class(TPivotDataView)
  private
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy(); override;
    procedure DataQuery(); override;
  end;

var ScriptView: TScriptView;

constructor TScriptView.Create(AOwner: TComponent);
begin
  inherited;
  ViewData := TCustomData.Create(Self, DataConnection, ''HisService_Stat'', ''Stat_Clin_Fee_RecExecOffice'');
  PeriodGroup.Visible := True;
  SetPeriodFormatYearMonth();
  Operation := MyOperation;
end;

destructor TScriptView.Destroy();
begin
  inherited;
  ScriptView := nil; // 这里很重要
end;

procedure TScriptView.DataQuery();
begin
  //if not AppCore.User.HaveAccess(''5050'') then
  //  WhereText := WhereText + '' and ((CharIndex('' + QuotedStr(AppCore.User.OfficeID) + '', ExecOfficeID) = 1)''
  //    + '' or (RecOfficeID='' + QuotedStr(AppCore.User.OfficeID) + ''))'';

  if not AppCore.User.HaveAccess(''5050'') then
    ViewData.OpenByList([''ExecOfficeID'', ''ExecOfficeID'', ''RecOfficeID'', ''StatDate'', ''StatDate''],
      [AppCore.User.OfficeID, AppCore.User.OfficeID+''9999'', AppCore.User.OfficeID, 
       FormatDateTime(''YYYYMM'', BeginDate), FormatDateTime(''YYYYMM'', EndDate)],
      [dboGreaterOrEqual, dboLessOrEqual, dboEqual, dboGreaterOrEqual, dboLessOrEqual], 
      [dboAnd, dboOr, dboAnd, dboAnd])
  else
    ViewData.OpenByBetween(''StatDate'', FormatDateTime(''YYYYMM'', BeginDate), 
      FormatDateTime(''YYYYMM'', EndDate))
end;

function DoExecute(CommandID: Integer; const Param: array of Variant): Variant;
begin
  if ScriptView = nil then
  begin
    ScriptView := TScriptView.Create(Application);
  end;
  AppCore.MainView.ShowView(ScriptView);
end;

procedure DoClear;
begin
  ScriptView.Free
end;

begin
end.', N'u033', N'0', N'')
GO

INSERT INTO [dbo].[Sys_Script] VALUES (N'pas_stat_clin_officeexec', N'', N'门诊统计', N'门诊收入统计_执行科室', N'', N'7001', N'', N'0', N'', N'uses Classes, Forms, SysUtils, uDAWhere, App_Common, App_DAModel, App_DAView;

type
  TScriptView = class(TPivotDataView)
  private
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy(); override;
    procedure DataQuery(); override;
  end;

var ScriptView: TScriptView;

constructor TScriptView.Create(AOwner: TComponent);
begin
  inherited;
  ViewData := TCustomData.Create(Self, DataConnection, ''HisService_Stat'', ''Stat_Clin_Fee_ExecOffice'');
  PeriodGroup.Visible := True;
  SetPeriodFormatYearMonth();
  Operation := MyOperation;
end;

destructor TScriptView.Destroy();
begin
  inherited;
  ScriptView := nil; // 这里很重要
end;

procedure TScriptView.DataQuery();
begin
  if not AppCore.User.HaveAccess(''4050'') then
    // 只能查询同级和下级科室
    ViewData.OpenByList([''StatDate'', ''StatDate'', ''ExecOfficeID'', ''ExecOfficeID''],
      [FormatDateTime(''YYYYMM'', BeginDate), FormatDateTime(''YYYYMM'', EndDate), 
        AppCore.User.OfficeID, AppCore.User.OfficeID+''9999''],
      [dboGreaterOrEqual, dboLessOrEqual, dboGreaterOrEqual, dboLessOrEqual], 
      [dboAnd, dboAnd, dboAnd])
  else
    ViewData.OpenByBetween(''StatDate'', FormatDateTime(''YYYYMM'', BeginDate), 
      FormatDateTime(''YYYYMM'', EndDate))
end;

function DoExecute(CommandID: Integer; const Param: array of Variant): Variant;
begin
  if ScriptView = nil then
  begin
    ScriptView := TScriptView.Create(Application);
  end;
  AppCore.MainView.ShowView(ScriptView);
end;

procedure DoClear;
begin
end;

begin
end.', N'u02', N'0', N'')
GO

INSERT INTO [dbo].[Sys_Script] VALUES (N'pas_stat_clin_reg', N'', N'门诊统计', N'门诊挂号统计', N'', N'4050', N'', N'0', N'', N'uses Classes, Forms, SysUtils, uDAWhere, App_Common, App_DAModel, App_DAView;

type
  TScriptView = class(TPivotDataView)
  private
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy(); override;
    procedure DataQuery(); override;
  end;

var ScriptView: TScriptView;

constructor TScriptView.Create(AOwner: TComponent);
begin
  inherited;
  ViewData := TCustomData.Create(Self, DataConnection, ''HisService_Stat'', ''Stat_Clin_Reg'');
  PeriodGroup.Visible := True;
  SetPeriodFormatYearMonth();
  Operation := MyOperation;
end;

destructor TScriptView.Destroy();
begin
  inherited;
  ScriptView := nil; // 这里很重要
end;

procedure TScriptView.DataQuery();
begin
  ViewData.OpenByBetween(''StatDate'', FormatDateTime(''YYYYMM'', BeginDate),
    FormatDateTime(''YYYYMM'', EndDate));
end;

function DoExecute(CommandID: Integer; const Param: array of Variant): Variant;
begin
  if ScriptView = nil then
  begin
    ScriptView := TScriptView.Create(Application);
  end;
  AppCore.MainView.ShowView(ScriptView);
end;

procedure DoClear;
begin
end;

begin
end.', N'u01', N'0', N'')
GO

INSERT INTO [dbo].[Sys_Script] VALUES (N'pas_stat_hosp_doctor_apply', N'', N'住院统计', N'住院医生申请单统计', N'', N'5050', N'', N'0', N'', N'uses Classes, Forms, SysUtils, App_Common, App_DAModel, App_DAView;

type
  TScriptView = class(TPivotDataView)
  private
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy(); override;
    procedure DataQuery(); override;
  end;

var ScriptView: TScriptView;

constructor TScriptView.Create(AOwner: TComponent);
begin
  inherited;
  ViewData := TCustomData.Create(Self, DataConnection, ''HisService_Stat'', ''Stat_Hosp_Doctor_Apply'');
  PeriodGroup.Visible := True;
  SetPeriodFormatYearMonth();
  Operation := MyOperation;
end;

destructor TScriptView.Destroy();
begin
  inherited;
  ScriptView := nil; // 这里很重要
end;

procedure TScriptView.DataQuery();
begin
  ViewData.OpenByBetween(''StatDate'', FormatDateTime(''YYYYMM'', BeginDate),
    FormatDateTime(''YYYYMM'', EndDate));
end;

function DoExecute(CommandID: Integer; const Param: array of Variant): Variant;
begin
  if ScriptView = nil then
  begin
    ScriptView := TScriptView.Create(Application);
  end;
  AppCore.MainView.ShowView(ScriptView);
end;

procedure DoClear;
begin
end;

begin
end.', N'u085', N'0', N'')
GO

INSERT INTO [dbo].[Sys_Script] VALUES (N'pas_stat_hosp_fee_execoffice', N'', N'住院统计', N'住院收入统计_执行科室', N'', N'7002', N'', N'0', N'', N'uses Classes, Forms, SysUtils, uDAWhere, App_Common, App_DAModel, App_DAView;

type
  TScriptView = class(TPivotDataView)
  private
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy(); override;
    procedure DataQuery(); override;
  end;

var ScriptView: TScriptView;

constructor TScriptView.Create(AOwner: TComponent);
begin
  inherited;
  ViewData := TCustomData.Create(Self, DataConnection, ''HisService_Stat'', ''Stat_Hosp_Fee_ExecOffice'');
  PeriodGroup.Visible := True;
  SetPeriodFormatYearMonth();
  Operation := MyOperation;
end;

destructor TScriptView.Destroy();
begin
  inherited;
  ScriptView := nil; // 这里很重要
end;

procedure TScriptView.DataQuery();
begin  
  if not AppCore.User.HaveAccess(''5050'') then
    ViewData.OpenByList([''ExecOfficeID'', ''ExecOfficeID'', ''StatDate'', ''StatDate''],
      [AppCore.User.OfficeID, AppCore.User.OfficeID+''9999'', 
       FormatDateTime(''YYYYMM'', BeginDate), FormatDateTime(''YYYYMM'', EndDate)],
      [dboGreaterOrEqual, dboLessOrEqual, dboGreaterOrEqual, dboLessOrEqual], 
      [dboAnd, dboAnd, dboAnd])
  else
    ViewData.OpenByBetween(''StatDate'', FormatDateTime(''YYYYMM'', BeginDate), 
      FormatDateTime(''YYYYMM'', EndDate))
end;

function DoExecute(CommandID: Integer; const Param: array of Variant): Variant;
begin
  if ScriptView = nil then
  begin
    ScriptView := TScriptView.Create(Application);
  end;
  AppCore.MainView.ShowView(ScriptView);
end;

procedure DoClear;
begin
  ScriptView.Free
end;

begin
end.', N'u081', N'0', N'')
GO

INSERT INTO [dbo].[Sys_Script] VALUES (N'pas_stat_hosp_fee_execoffice_patient', N'', N'住院统计', N'住院收入统计_执行科室和患者', N'', N'7002', N'', N'0', N'', N'uses Classes, Forms, SysUtils, uDAWhere, App_Common, App_DAModel, App_DAView;

type
  TScriptView = class(TPivotDataView)
  private
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy(); override;
    procedure DataQuery(); override;
  end;

var ScriptView: TScriptView;

constructor TScriptView.Create(AOwner: TComponent);
begin
  inherited;
  ViewData := TCustomData.Create(Self, DataConnection, ''HisService_Stat'', ''Stat_Hosp_Fee_ExecOffice_Patient'');
  PeriodGroup.Visible := True;
  SetPeriodFormatYearMonth();
  EndDateItem.Visible := False;
  Operation := MyOperation;
end;

destructor TScriptView.Destroy();
begin
  inherited;
  ScriptView := nil; // 这里很重要
end;

procedure TScriptView.DataQuery();
begin
  if not AppCore.User.HaveAccess(''5050'') then
    ViewData.OpenByList([''ExecOfficeID'', ''ExecOfficeID'', ''StatDate'', ''StatDate''],
      [AppCore.User.OfficeID, AppCore.User.OfficeID+''9999'', 
       FormatDateTime(''YYYYMM'', BeginDate), FormatDateTime(''YYYYMM'', EndDate)],
      [dboGreaterOrEqual, dboLessOrEqual, dboGreaterOrEqual, dboLessOrEqual], 
      [dboAnd, dboAnd, dboAnd])
  else
    ViewData.OpenByBetween(''StatDate'', FormatDateTime(''YYYYMM'', BeginDate), 
      FormatDateTime(''YYYYMM'', EndDate))
end;

function DoExecute(CommandID: Integer; const Param: array of Variant): Variant;
begin
  if ScriptView = nil then
  begin
    ScriptView := TScriptView.Create(Application);
  end;
  AppCore.MainView.ShowView(ScriptView);
end;

procedure DoClear;
begin
  ScriptView.Free
end;

begin
end.', N'u084', N'0', N'')
GO

INSERT INTO [dbo].[Sys_Script] VALUES (N'pas_stat_hosp_fee_feetype', N'', N'住院统计', N'住院收费统计', N'', N'4050', N'', N'0', N'', N'uses Classes, Forms, SysUtils, App_Common, App_DAModel, App_DAView;

type
  TScriptView = class(TTableGridDataView)
  private
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy(); override;
    procedure DataQuery(); override;
  end;

var ScriptView: TScriptView;

constructor TScriptView.Create(AOwner: TComponent);
begin
  inherited;
  ViewData := TCustomData.Create(Self, DataConnection, ''HisService_Stat'', ''Stat_Hosp_Fee_FeeType'');
  PeriodGroup.Visible := True;
  SetPeriodFormatYearMonth();
  Operation := MyOperation;
end;

destructor TScriptView.Destroy();
begin
  inherited;
  ScriptView := nil; // 这里很重要
end;

procedure TScriptView.DataQuery();
begin
  ViewData.OpenByBetween(''StatDate'', FormatDateTime(''YYYYMM'', BeginDate),
    FormatDateTime(''YYYYMM'', EndDate));
end;

function DoExecute(CommandID: Integer; const Param: array of Variant): Variant;
begin
  if ScriptView = nil then
  begin
    ScriptView := TScriptView.Create(Application);
  end;
  AppCore.MainView.ShowView(ScriptView);
end;

procedure DoClear;
begin
end;

begin
end.', N'u09', N'0', N'')
GO

INSERT INTO [dbo].[Sys_Script] VALUES (N'pas_stat_hosp_fee_office', N'', N'住院统计', N'住院收入统计_住院科室', N'', N'7002', N'', N'0', N'', N'uses Classes, Forms, SysUtils, uDAWhere, App_Common, App_DAModel, App_DAView;

type
  TScriptView = class(TPivotDataView)
  private
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy(); override;
    procedure DataQuery(); override;
  end;

var ScriptView: TScriptView;

constructor TScriptView.Create(AOwner: TComponent);
begin
  inherited;
  ViewData := TCustomData.Create(Self, DataConnection, ''HisService_Stat'', ''Stat_Hosp_Fee_Office'');
  PeriodGroup.Visible := True;
  SetPeriodFormatYearMonth();
  Operation := MyOperation;
end;

destructor TScriptView.Destroy();
begin
  inherited;
  ScriptView := nil; // 这里很重要
end;

procedure TScriptView.DataQuery();
begin
  if not AppCore.User.HaveAccess(''5050'') then
    ViewData.OpenByList([''StatDate'', ''StatDate'', ''OfficeID''],
      [FormatDateTime(''YYYYMM'', BeginDate), FormatDateTime(''YYYYMM'', EndDate), 
        AppCore.User.OfficeID],
      [dboGreaterOrEqual, dboLessOrEqual, dboEqual], [dboAnd, dboAnd])
  else
    ViewData.OpenByBetween(''StatDate'', FormatDateTime(''YYYYMM'', BeginDate), 
      FormatDateTime(''YYYYMM'', EndDate))
end;

function DoExecute(CommandID: Integer; const Param: array of Variant): Variant;
begin
  if ScriptView = nil then
  begin
    ScriptView := TScriptView.Create(Application);
  end;
  AppCore.MainView.ShowView(ScriptView);
end;

procedure DoClear;
begin
  ScriptView.Free
end;

begin
end.', N'u080', N'0', N'')
GO

INSERT INTO [dbo].[Sys_Script] VALUES (N'pas_stat_hosp_fee_office_execoffice', N'', N'住院统计', N'住院收入统计_住院科室和执行科室', N'', N'7002', N'', N'0', N'', N'uses Classes, Forms, SysUtils, uDAWhere, App_Common, App_DAModel, App_DAView;

type
  TScriptView = class(TPivotDataView)
  private
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy(); override;
    procedure DataQuery(); override;
  end;

var ScriptView: TScriptView;

constructor TScriptView.Create(AOwner: TComponent);
begin
  inherited;
  ViewData := TCustomData.Create(Self, DataConnection, ''HisService_Stat'', ''Stat_Hosp_Fee_Office_ExecOffice'');
  PeriodGroup.Visible := True; 
  EndDateItem.Visible := False;
  SetPeriodFormatYearMonth();
  Operation := MyOperation;
end;

destructor TScriptView.Destroy();
begin
  inherited;
  ScriptView := nil; // 这里很重要
end;

procedure TScriptView.DataQuery();
begin
  if not AppCore.User.HaveAccess(''5050'') then
    ViewData.OpenByList([''ExecOfficeID'', ''ExecOfficeID'', ''OfficeID'', ''StatDate'', ''StatDate''],
      [AppCore.User.OfficeID, AppCore.User.OfficeID+''9999'', AppCore.User.OfficeID, 
       FormatDateTime(''YYYYMM'', BeginDate), FormatDateTime(''YYYYMM'', EndDate)],
      [dboGreaterOrEqual, dboLessOrEqual, dboEqual, dboGreaterOrEqual, dboLessOrEqual], 
      [dboAnd, dboOr, dboAnd, dboAnd])
  else
    ViewData.OpenByBetween(''StatDate'', FormatDateTime(''YYYYMM'', BeginDate), 
      FormatDateTime(''YYYYMM'', EndDate))
end;

function DoExecute(CommandID: Integer; const Param: array of Variant): Variant;
begin
  if ScriptView = nil then
  begin
    ScriptView := TScriptView.Create(Application);
  end;
  AppCore.MainView.ShowView(ScriptView);
end;

procedure DoClear;
begin
  ScriptView.Free
end;

begin
end.', N'u082', N'0', N'')
GO

INSERT INTO [dbo].[Sys_Script] VALUES (N'pas_stat_hosp_fee_office_patient', N'', N'住院统计', N'住院收入统计_住院科室和患者', N'', N'7002', N'', N'0', N'', N'uses Classes, Forms, SysUtils, uDAWhere, App_Common, App_DAModel, App_DAView;

type
  TScriptView = class(TPivotDataView)
  private
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy(); override;
    procedure DataQuery(); override;
  end;

var ScriptView: TScriptView;

constructor TScriptView.Create(AOwner: TComponent);
begin
  inherited;
  ViewData := TCustomData.Create(Self, DataConnection, ''HisService_Stat'', ''Stat_Hosp_Fee_Office_Patient'');
  PeriodGroup.Visible := True;
  SetPeriodFormatYearMonth();  
  EndDateItem.Visible := False;
  Operation := MyOperation;
end;

destructor TScriptView.Destroy();
begin
  inherited;
  ScriptView := nil; // 这里很重要
end;

procedure TScriptView.DataQuery();
begin
  if not AppCore.User.HaveAccess(''5050'') then
    ViewData.OpenByList([''StatDate'', ''StatDate'', ''OfficeID''],
      [FormatDateTime(''YYYYMM'', BeginDate), FormatDateTime(''YYYYMM'', EndDate), 
        AppCore.User.OfficeID],
      [dboGreaterOrEqual, dboLessOrEqual, dboEqual], [dboAnd, dboAnd])
  else
    ViewData.OpenByBetween(''StatDate'', FormatDateTime(''YYYYMM'', BeginDate), 
      FormatDateTime(''YYYYMM'', EndDate))
end;

function DoExecute(CommandID: Integer; const Param: array of Variant): Variant;
begin
  if ScriptView = nil then
  begin
    ScriptView := TScriptView.Create(Application);
  end;
  AppCore.MainView.ShowView(ScriptView);
end;

procedure DoClear;
begin
  ScriptView.Free
end;

begin
end.', N'u083', N'0', N'')
GO

INSERT INTO [dbo].[Sys_Script] VALUES (N'pas_stat_hosp_feedetail', N'', N'住院统计', N'手术费用明细查询', N'', N'7002', N'', N'0', N'', N'uses Classes, Forms, SysUtils, App_Common, App_DAModel, App_DAView;

type
  TScriptView = class(TTableGridDataView)
  private
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy(); override;
    procedure DataQuery(); override;
  end;

var ScriptView: TScriptView;

constructor TScriptView.Create(AOwner: TComponent);
begin
  inherited;
  BeginDate := Date() - 1;
  ViewData := TCustomData.Create(Self, DataConnection, ''HisService_Hosp'', ''Pro_Hosp_FeeDetail_Query'');
  PeriodGroup.Visible := True;
  Operation := MyOperation;
  //ReSetActionCaption(QueryAction, ''按结算时间查'');
end;

destructor TScriptView.Destroy();
begin
  inherited;
  ScriptView := nil; // 这里很重要
end;

procedure TScriptView.DataQuery();
begin 
  ViewData.OpenByParam([''OfficeID'', ''OpID'', ''QueryID'', ''Value'', ''BeginDate'', ''EndDate''], 
    [AppCore.User.OfficeID, AppCore.User.ID, 4, ''0228'', BeginDate, EndDate]);
end;

function DoExecute(CommandID: Integer; const Param: array of Variant): Variant;
begin
  if ScriptView = nil then
  begin
    ScriptView := TScriptView.Create(Application);
  end;
  AppCore.MainView.ShowView(ScriptView);
end;

procedure DoClear;
begin
  ScriptView.Free
end;

begin
end.', N'u09', N'0', N'')
GO

INSERT INTO [dbo].[Sys_Script] VALUES (N'pas_stat_hosp2_work1', N'', N'医疗统计', N'医疗统计表1(月季年报)', N'', N'7004', N'', N'0', N'', N'uses Classes, Forms, SysUtils, App_Common, App_DAModel, App_DAView;

type
  TScriptView = class(TTableGridDataView)
  private
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy(); override;
    procedure DataQuery(); override;  
    function CanEdit(): Boolean; override;    
    function CanDelete(): Boolean; override;
    function CanInsert(): Boolean; override;
  end;

var ScriptView: TScriptView; 

constructor TScriptView.Create(AOwner: TComponent);
begin
  inherited;  
  BeginDate := Date() - 1;
  // Editing := True;
  SetDataEditing(True); 
  ViewData := TCustomData.Create(Self, DataConnection, ''HisService_Stat'', ''View_Stat_HospWork1'');
  PeriodGroup.Visible := True;
  //SetPeriodFormatYearMonth();
  Operation := MyOperation;
end;

destructor TScriptView.Destroy();
begin
  inherited;
  ScriptView := nil; // 这里很重要
end;

procedure TScriptView.DataQuery();
begin
  if EndDate - BeginDate > 3 * 31 then
    raise Exception.Create(''查询时间段不能超过3个月'');
    
  ViewData.OpenByPeriod(''统计日期'', BeginDate, EndDate);
end;

function TScriptView.CanEdit: Boolean;
begin
  Result := inherited CanEdit and AppCore.User.HaveAccess(''7006'');
end;

function TScriptView.CanInsert: Boolean;
begin
  Result := False;
end;

function TScriptView.CanDelete: Boolean;
begin
  Result := False;
end;

function DoExecute(CommandID: Integer; const Param: array of Variant): Variant;
begin
  if ScriptView = nil then
  begin
    ScriptView := TScriptView.Create(Application);
  end;
  AppCore.MainView.ShowView(ScriptView);
end;

procedure DoClear;
begin
  ScriptView.Free
end;

begin
end.', N'u11', N'0', N'')
GO

INSERT INTO [dbo].[Sys_Script] VALUES (N'pas_stat_hosp2_work2', N'', N'医疗统计', N'医疗统计表2(月季年报)', N'', N'7004', N'', N'0', N'', N'uses Classes, Forms, SysUtils, App_Common, App_DAModel, App_DAView;

type
  TScriptView = class(TTableGridDataView)
  private
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy(); override;
    procedure DataQuery(); override;
  end;

var ScriptView: TScriptView;

constructor TScriptView.Create(AOwner: TComponent);
begin
  inherited;
  BeginDate := Date() - 1;
  ViewData := TCustomData.Create(Self, DataConnection, ''HisService_Stat'', ''View_Stat_HospWork2'');
  PeriodGroup.Visible := True;
  //SetPeriodFormatYearMonth();
  Operation := MyOperation;
end;

destructor TScriptView.Destroy();
begin
  inherited;
  ScriptView := nil; // 这里很重要
end;

procedure TScriptView.DataQuery();
begin
  if EndDate - BeginDate > 3 * 31 then
    raise Exception.Create(''查询时间段不能超过3个月'');
    
  ViewData.OpenByPeriod(''统计日期'', BeginDate, EndDate);
end;

function DoExecute(CommandID: Integer; const Param: array of Variant): Variant;
begin
  if ScriptView = nil then
  begin
    ScriptView := TScriptView.Create(Application);
  end;
  AppCore.MainView.ShowView(ScriptView);
end;

procedure DoClear;
begin
  ScriptView.Free
end;

begin
end.', N'u12', N'0', N'')
GO

INSERT INTO [dbo].[Sys_Script] VALUES (N'pas_stat_hosp2_work3', N'', N'医疗统计', N'医疗统计表3(月季年报)', N'', N'7004', N'', N'0', N'', N'uses Classes, Forms, SysUtils, App_Common, App_DAModel, App_DAView;

type
  TScriptView = class(TTableGridDataView)
  private
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy(); override;
    procedure DataQuery(); override;
  end;

var ScriptView: TScriptView;

constructor TScriptView.Create(AOwner: TComponent);
begin
  inherited;  
  BeginDate := Date() - 1;
  ViewData := TCustomData.Create(Self, DataConnection, ''HisService_Stat'', ''View_Stat_HospWork3'');
  PeriodGroup.Visible := True;
  //SetPeriodFormatYearMonth();
  Operation := MyOperation;
end;

destructor TScriptView.Destroy();
begin
  inherited;
  ScriptView := nil; // 这里很重要
end;

procedure TScriptView.DataQuery();
begin
  if EndDate - BeginDate > 3 * 31 then
    raise Exception.Create(''查询时间段不能超过3个月'');
    
  ViewData.OpenByPeriod(''日期'', BeginDate, EndDate);
end;

function DoExecute(CommandID: Integer; const Param: array of Variant): Variant;
begin
  if ScriptView = nil then
  begin
    ScriptView := TScriptView.Create(Application);
  end;
  AppCore.MainView.ShowView(ScriptView);
end;

procedure DoClear;
begin
  ScriptView.Free
end;

begin
end.', N'u13', N'0', N'')
GO

INSERT INTO [dbo].[Sys_Script] VALUES (N'pas_stat_hosp2_workday', N'', N'医疗统计', N'住院日报表', N'', N'7004', N'', N'0', N'', N'uses Classes, Forms, SysUtils, App_Common, App_DAModel, App_DAView;

type
  TScriptView = class(TTableGridDataView)
  private
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy(); override;
    procedure DataQuery(); override;
    function CanEdit(): Boolean; override;
    function CanDelete(): Boolean; override;
    function CanInsert(): Boolean; override;
  end;

var ScriptView: TScriptView;

constructor TScriptView.Create(AOwner: TComponent);
begin
  inherited;
  BeginDate := Date() - 1;
  // Editing := True;
  SetDataEditing(True);
  ViewData := TCustomData.Create(Self, DataConnection, ''HisService_Stat'', ''Stat_Hosp_Work_Day'');
  PeriodGroup.Visible := True;
  //SetPeriodFormatYearMonth();
  Operation := MyOperation;
end;

destructor TScriptView.Destroy();
begin
  inherited;
  ScriptView := nil; // 这里很重要
end;

procedure TScriptView.DataQuery();
begin
  if EndDate - BeginDate > 3 * 31 then
    raise Exception.Create(''查询时间段不能超过3个月'');
    
  ViewData.OpenByPeriod(''统计日期'', BeginDate, EndDate);
end;

function TScriptView.CanEdit: Boolean;
begin
  Result := inherited CanEdit and AppCore.User.HaveAccess(''7006'');
end;

function TScriptView.CanInsert: Boolean;
begin
  Result := False;
end;

function TScriptView.CanDelete: Boolean;
begin
  Result := False;
end;

function DoExecute(CommandID: Integer; const Param: array of Variant): Variant;
begin
  if ScriptView = nil then
  begin
    ScriptView := TScriptView.Create(Application);
  end;
  AppCore.MainView.ShowView(ScriptView);
end;

procedure DoClear;
begin
  ScriptView.Free
end;

begin
end.', N'u10', N'0', N'')
GO

INSERT INTO [dbo].[Sys_Script] VALUES (N'pas_sys_user', N'', N'系统', N'个人信息', N'', N'', N'', N'2', N'', N'uses Classes, Forms, SysUtils, App_Common, App_DAModel, App_DAView;

type
  TScriptView = class(TFormDataView)
  private
    FFeeSign: Integer;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy(); override;
    procedure DataQuery(); override;
  end;

var ScriptView: TScriptView;

constructor TScriptView.Create(AOwner: TComponent);
begin
  inherited;
  Position := poMainFormCenter;
  ViewData := TCustomData.Create(Self, DataConnection, ''HisService_System'', ''Sys_Op_Person''); 
  Operation := MyOperation;
end;

destructor TScriptView.Destroy();
begin
  inherited;
  ScriptView := nil; // 这里很重要
end;

procedure TScriptView.DataQuery();
begin
  ViewData.OpenByWhereText(''OpID='' + QuotedStr(AppCore.User.ID));
end;

function DoExecute(CommandID: Integer; const Param: array of Variant): Variant;
begin
  if ScriptView = nil then
  begin
    ScriptView := TScriptView.Create(Application);
  end;
  ScriptView.DataQuery;
  if not ScriptView.ViewData.Eof then
    ScriptView.DataEdit;
  ScriptView.ShowModal();
end;

procedure DoClear;
begin
  ScriptView.Free
end;

begin
end.', N'c01', N'0', N'')
GO

INSERT INTO [dbo].[Sys_Script] VALUES (N'pas_yb_card', N'', N'医保', N'医保卡信息处理', N'', N'', N'', N'3', N'', N'uses Classes, Forms, SysUtils, App_Common, App_Function, App_DAModel, App_DAView;

// 256: 读卡之后调用， Param=TCustomData, 对应1002 
function DoExecute(CommandID: Integer; const Param: array of Variant): Variant;
var
  YBCardData: TCustomData;
begin        
  if CommandID = 256 then
  begin                      
    YBCardData := TCustomData(Integer(Param[0]));
    // AppCore.Logger.Write(YBCardData.AsString(''XM''), mtInfo, 1);
    if YBCardData.AsFloat(''NDYLFY'') > 95000 then
     begin
       ShowWarning(''该患者年度医疗费用已超过95000，请复印其身份证交医保办.'');
     end;
  end; 
end;

procedure DoClear;
begin   
end;

begin
end.', N'z', N'1', N'')
GO


-- ----------------------------
-- Table structure for Sys_WorkGroup
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Sys_WorkGroup]') AND type IN ('U'))
	DROP TABLE [dbo].[Sys_WorkGroup]
GO

CREATE TABLE [dbo].[Sys_WorkGroup] (
  [GroupID] int  NOT NULL,
  [GroupName] varchar(30) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [Description] varchar(50) COLLATE Chinese_PRC_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[Sys_WorkGroup] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of Sys_WorkGroup
-- ----------------------------
INSERT INTO [dbo].[Sys_WorkGroup] VALUES (N'1', N'系统管理员', NULL)
GO

INSERT INTO [dbo].[Sys_WorkGroup] VALUES (N'11', N'药品管理员', NULL)
GO

INSERT INTO [dbo].[Sys_WorkGroup] VALUES (N'12', N'财务处', N'')
GO

INSERT INTO [dbo].[Sys_WorkGroup] VALUES (N'13', N'医保办', N'')
GO

INSERT INTO [dbo].[Sys_WorkGroup] VALUES (N'14', N'诊疗项目(物价)', N'')
GO

INSERT INTO [dbo].[Sys_WorkGroup] VALUES (N'20', N'临床科室管理员', N'')
GO

INSERT INTO [dbo].[Sys_WorkGroup] VALUES (N'50', N'门诊医生', NULL)
GO

INSERT INTO [dbo].[Sys_WorkGroup] VALUES (N'51', N'收费处', NULL)
GO

INSERT INTO [dbo].[Sys_WorkGroup] VALUES (N'52', N'院外门诊', N'')
GO

INSERT INTO [dbo].[Sys_WorkGroup] VALUES (N'53', N'体检中心', N'')
GO

INSERT INTO [dbo].[Sys_WorkGroup] VALUES (N'54', N'目标办', N'')
GO

INSERT INTO [dbo].[Sys_WorkGroup] VALUES (N'60', N'住院医生', N'')
GO

INSERT INTO [dbo].[Sys_WorkGroup] VALUES (N'61', N'住院出纳', N'')
GO

INSERT INTO [dbo].[Sys_WorkGroup] VALUES (N'70', N'门诊药房', N'')
GO

INSERT INTO [dbo].[Sys_WorkGroup] VALUES (N'71', N'住院药房', N'')
GO

INSERT INTO [dbo].[Sys_WorkGroup] VALUES (N'72', N'药库', N'')
GO

INSERT INTO [dbo].[Sys_WorkGroup] VALUES (N'73', N'非临床管理员', N'')
GO

INSERT INTO [dbo].[Sys_WorkGroup] VALUES (N'74', N'非临床科室', N'')
GO

INSERT INTO [dbo].[Sys_WorkGroup] VALUES (N'75', N'统计室', N'')
GO

INSERT INTO [dbo].[Sys_WorkGroup] VALUES (N'76', N'开发办', N'')
GO

INSERT INTO [dbo].[Sys_WorkGroup] VALUES (N'80', N'小儿科', N'')
GO

INSERT INTO [dbo].[Sys_WorkGroup] VALUES (N'81', N'120', N'')
GO

INSERT INTO [dbo].[Sys_WorkGroup] VALUES (N'82', N'122', N'')
GO

INSERT INTO [dbo].[Sys_WorkGroup] VALUES (N'83', N'服务台', N'')
GO

INSERT INTO [dbo].[Sys_WorkGroup] VALUES (N'85', N'收费处主任', N'')
GO

INSERT INTO [dbo].[Sys_WorkGroup] VALUES (N'86', N'院感办公室', N'')
GO

INSERT INTO [dbo].[Sys_WorkGroup] VALUES (N'87', N'医保办主任', N'')
GO

INSERT INTO [dbo].[Sys_WorkGroup] VALUES (N'88', N'院办办公室', N'')
GO

INSERT INTO [dbo].[Sys_WorkGroup] VALUES (N'89', N'医务处', N'')
GO

INSERT INTO [dbo].[Sys_WorkGroup] VALUES (N'90', N'病案室', N'')
GO

INSERT INTO [dbo].[Sys_WorkGroup] VALUES (N'91', N'xxyy', NULL)
GO


-- ----------------------------
-- Table structure for Sys_WorkGroupOp
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Sys_WorkGroupOp]') AND type IN ('U'))
	DROP TABLE [dbo].[Sys_WorkGroupOp]
GO

CREATE TABLE [dbo].[Sys_WorkGroupOp] (
  [GroupID] int  NOT NULL,
  [OpID] varchar(8) COLLATE Chinese_PRC_CI_AS  NOT NULL
)
GO

ALTER TABLE [dbo].[Sys_WorkGroupOp] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of Sys_WorkGroupOp
-- ----------------------------
INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'20', N'0002')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'74', N'0002')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'75', N'0002')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'51', N'0024')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'12', N'0031')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'0056')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'76', N'0056')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'86', N'0057')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'0059')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'0059')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'20', N'0061')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'0061')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'20', N'0062')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'0062')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'73', N'0062')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'0067')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'0067')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'0075')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'13', N'0081')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'0081')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'54', N'0081')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'0081')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'74', N'0084')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'0086')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'0086')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'0090')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'53', N'0090')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'0097')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'0097')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'0103')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'0103')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'0109')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'0109')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'0123')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'0123')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'0131')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'0136')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'0139')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'0145')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'0145')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'73', N'0145')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'0151')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'0151')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'51', N'0157')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'0160')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'0160')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'20', N'0175')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'0175')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'0175')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'11', N'0179')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'14', N'0179')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'51', N'0179')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'73', N'0179')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'0181')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'0181')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'53', N'0184')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'0188')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'20', N'0191')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'0191')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'0191')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'0196')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'0196')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'0198')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'0198')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'53', N'0202')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'0204')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'0206')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'0206')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'0207')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'74', N'0207')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'0209')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'20', N'0212')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'0212')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'51', N'0218')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'74', N'0233')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'51', N'0235')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'52', N'0249')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'75', N'0250')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'89', N'0250')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'73', N'0263')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'74', N'0263')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'0270')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'0271')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'74', N'0271')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'0277')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'0277')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'0281')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'0281')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'52', N'0283')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'20', N'0284')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'0284')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'0284')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'73', N'0284')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'13', N'0287')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'87', N'0287')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'0294')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'0294')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'77', N'0300')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'20', N'0302')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'0302')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'0302')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'20', N'0307')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'73', N'0307')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'74', N'0307')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'71', N'0334')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'70', N'0335')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'71', N'0335')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'11', N'0341')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'70', N'0341')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'71', N'0341')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'72', N'0341')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'77', N'0349')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'70', N'0358')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'0360')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'0369')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'53', N'0369')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'0370')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'74', N'0370')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'0386')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'74', N'0386')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'0394')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'74', N'0394')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'0395')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'0396')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'74', N'0396')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'0402')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'74', N'0402')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'78', N'0410')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'51', N'0411')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'74', N'0424')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'74', N'0425')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'0427')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'0427')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'0436')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'0436')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'0437')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'74', N'0437')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'0439')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'0455')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'0455')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'73', N'0455')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'74', N'0456')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'0459')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'20', N'0469')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'0469')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'71', N'0473')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'20', N'0477')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'0477')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'53', N'0490')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'0493')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'0493')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'0527')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'0527')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'20', N'0541')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'0541')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'73', N'0541')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'74', N'0541')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'74', N'0544')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'51', N'0545')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'20', N'0563')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'0563')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'73', N'0563')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'74', N'0563')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'0564')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'0565')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'0567')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'0568')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'20', N'0569')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'0569')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'73', N'0569')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'20', N'0575')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'0575')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'0575')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'20', N'0579')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'0579')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'20', N'0582')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'0582')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'84', N'0583')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'0586')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'0586')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'0587')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'53', N'0587')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'0587')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'20', N'0589')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'0589')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'12', N'0591')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'51', N'0591')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'0598')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'0598')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'13', N'0603')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'0603')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'54', N'0603')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'0603')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'13', N'0605')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'0605')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'54', N'0618')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'0621')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'0621')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'70', N'0623')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'75', N'0633')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'0652')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'0652')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'20', N'0665')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'0665')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'73', N'0665')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'13', N'0666')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'20', N'0667')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'0667')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'0667')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'83', N'0667')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'0669')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'0670')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'75', N'0670')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'20', N'0677')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'0677')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'74', N'0681')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'12', N'0683')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'14', N'0683')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'51', N'0683')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'54', N'0683')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'0683')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'51', N'0686')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'74', N'0687')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'0693')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'0693')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'71', N'0694')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'0695')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'70', N'0695')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'51', N'0696')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'70', N'0697')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'71', N'0697')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'0702')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'0702')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'0708')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'0740')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'54', N'0740')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'0740')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'0745')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'0745')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'0748')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'0748')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'0779')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'0779')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'71', N'0783')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'12', N'0827')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'51', N'0827')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'70', N'0867')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'0875')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'0890')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'74', N'0890')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'0915')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'74', N'0915')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'51', N'0948')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'0967')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'0967')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'76', N'1004')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'20', N'1006')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1006')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'73', N'1006')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1007')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'51', N'1016')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1022')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1022')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'74', N'1041')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1042')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1044')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'75', N'1044')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'53', N'1046')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'53', N'1047')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1051')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1051')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'20', N'1055')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1055')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1055')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'51', N'1060')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'52', N'1072')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'13', N'1083')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1083')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'54', N'1083')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1083')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1084')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1084')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1088')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'75', N'1088')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'90', N'1088')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'20', N'1099')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1099')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1099')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1101')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1101')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1102')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1102')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'20', N'1104')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1104')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1105')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1105')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1106')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1107')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1107')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1111')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1111')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'20', N'1112')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1112')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'75', N'1112')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'20', N'1115')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1115')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'51', N'1115')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1115')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'75', N'1115')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1116')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1116')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'74', N'1119')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1121')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1123')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'20', N'1124')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1124')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'73', N'1124')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'53', N'1125')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1125')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'73', N'1125')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1126')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'53', N'1127')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1129')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'74', N'1133')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'20', N'1134')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1134')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1135')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1136')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'11', N'1138')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1138')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'72', N'1138')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'73', N'1138')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'70', N'1139')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'70', N'1140')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'71', N'1140')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'70', N'1142')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1147')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'74', N'1147')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1150')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'74', N'1150')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1166')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1166')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'12', N'1216')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'51', N'1216')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'54', N'1216')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1227')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1227')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1232')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1232')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1233')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'54', N'1233')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1233')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1234')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1234')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1239')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'20', N'1241')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1241')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'73', N'1241')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'20', N'1242')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1242')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1244')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1244')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'20', N'1245')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1245')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1245')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'73', N'1245')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'20', N'1249')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1249')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1250')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1251')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1253')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1253')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1254')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1254')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1256')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1256')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1260')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1260')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1261')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1261')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1262')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1263')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1263')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1266')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1266')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'53', N'1280')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1281')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1282')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'51', N'1283')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'20', N'1285')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1285')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'73', N'1285')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'20', N'1288')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1290')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1291')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1296')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1296')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'12', N'1298')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'20', N'1298')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1298')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1298')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1306')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1306')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1309')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1309')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1310')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1310')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'20', N'1313')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1314')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1314')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'20', N'1315')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1315')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1315')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'73', N'1315')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'51', N'1316')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1319')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1319')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'51', N'1322')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'53', N'1324')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'13', N'1325')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'51', N'1327')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1339')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1339')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1340')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'20', N'1342')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1342')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1342')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'73', N'1342')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'20', N'1343')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1343')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'73', N'1343')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1344')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1348')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1350')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1350')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'51', N'1355')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1357')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'20', N'1370')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1370')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1372')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1372')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1373')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1373')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1376')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'20', N'1377')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1377')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1394')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1394')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1397')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'74', N'1397')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'71', N'1398')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1403')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1403')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'74', N'1404')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'53', N'1406')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1408')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'20', N'1410')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1411')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1411')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'74', N'1416')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'74', N'1417')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'20', N'1421')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1421')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1421')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'73', N'1421')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'20', N'1423')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1423')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1423')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'73', N'1423')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1424')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1424')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1425')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1425')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1426')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1426')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'20', N'1427')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1427')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1427')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'20', N'1428')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1428')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1428')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1429')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1429')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1438')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1441')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'20', N'1444')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'73', N'1444')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'73', N'1447')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'74', N'1447')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1449')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1451')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'70', N'1451')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'71', N'1451')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1455')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1455')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'74', N'1457')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'73', N'1459')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'74', N'1461')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'20', N'1463')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1463')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1463')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'20', N'1464')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'20', N'1467')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1467')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'73', N'1467')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'20', N'1468')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1468')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1469')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1469')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1470')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'74', N'1470')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'20', N'1471')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1471')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1473')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1473')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1474')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1474')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1477')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1477')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1479')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1479')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1480')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1480')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'11', N'1481')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'72', N'1481')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'75', N'1483')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'11', N'1484')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'71', N'1484')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'71', N'1485')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'73', N'1492')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'74', N'1492')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'20', N'1495')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1495')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1495')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1496')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1496')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1499')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1499')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1500')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1500')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1501')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1501')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1502')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1502')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1503')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1503')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1504')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1504')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1505')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1505')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'20', N'1507')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1507')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1507')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'73', N'1507')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'20', N'1509')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1509')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'73', N'1509')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'20', N'1510')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1510')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'73', N'1510')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1512')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1512')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1513')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1513')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'11', N'1514')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'72', N'1514')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1521')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1521')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'20', N'1523')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1523')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1523')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'73', N'1523')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'74', N'1525')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1527')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1527')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'73', N'1527')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1528')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'74', N'1528')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'71', N'1530')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1532')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1532')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'51', N'1535')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'20', N'1537')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'53', N'1537')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1537')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1538')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'20', N'1539')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1539')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1541')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1542')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1543')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'20', N'1544')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1544')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1545')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1545')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1547')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1548')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1549')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'20', N'1550')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1550')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1551')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1553')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1554')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1557')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1559')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1562')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1562')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'20', N'1563')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1563')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1563')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'73', N'1563')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'13', N'1565')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'87', N'1565')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1572')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1572')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1573')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1573')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1574')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1574')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1575')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1575')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1579')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'74', N'1579')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'74', N'1580')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1584')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1586')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1590')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'20', N'1608')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'73', N'1608')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'74', N'1608')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'20', N'1610')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1611')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1611')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1621')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1622')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1624')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1625')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1626')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1627')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1628')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1632')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1633')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1634')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1635')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1635')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1639')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1639')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'74', N'1640')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'71', N'1642')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'20', N'1643')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1643')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1643')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1644')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1644')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1645')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1645')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1646')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1646')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1647')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1647')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'20', N'1648')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1648')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1648')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1650')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1650')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'88', N'1651')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'11', N'1652')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'72', N'1652')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1653')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'74', N'1653')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'20', N'1654')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1654')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1654')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'1', N'1660')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1660')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1660')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1661')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1661')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1662')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'53', N'1662')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1663')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'74', N'1663')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1665')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1667')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1668')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1671')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1672')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1673')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1674')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1676')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'20', N'1678')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1678')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1678')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'73', N'1678')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1680')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'20', N'1682')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1682')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1682')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'73', N'1682')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'1', N'1683')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'12', N'1684')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'51', N'1684')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1685')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'74', N'1686')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'20', N'1687')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'73', N'1687')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1688')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1689')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1690')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1691')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1692')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1694')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1699')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1701')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1703')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1704')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1706')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1707')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1709')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1711')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1712')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'20', N'1714')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'74', N'1715')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'76', N'1717')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'20', N'1724')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1724')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1724')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'73', N'1724')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'1', N'1726')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1726')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'71', N'1726')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'51', N'1728')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1730')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1731')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1732')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1734')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1736')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1737')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1738')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'20', N'1739')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'20', N'1740')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1740')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'73', N'1740')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1741')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1742')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1743')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1744')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1745')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'51', N'1746')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'74', N'1748')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1750')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1750')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'11', N'1751')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'72', N'1751')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'20', N'1752')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1752')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1752')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'20', N'1753')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1753')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1753')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'73', N'1753')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'20', N'1754')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1754')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1754')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1756')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1756')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1757')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1757')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1758')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1758')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'74', N'1759')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'74', N'1760')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1761')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1761')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'11', N'1762')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'72', N'1762')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1763')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1763')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'20', N'1765')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1766')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1766')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1767')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1767')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1768')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1768')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1769')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1769')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1770')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1770')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1771')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1771')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1772')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1772')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'20', N'1773')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1773')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1773')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1774')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1774')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1775')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1775')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1776')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1776')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1778')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1778')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1779')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1779')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1782')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1782')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'20', N'1783')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1783')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1783')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'73', N'1783')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1786')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1786')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1787')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'74', N'1787')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1788')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1788')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'52', N'1793')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1794')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1796')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1798')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1799')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1801')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1803')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1805')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1806')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1808')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1809')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1810')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1812')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1813')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1814')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1815')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1819')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1820')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1822')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1823')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1824')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1828')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1829')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1830')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1832')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'20', N'1835')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1835')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1836')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1837')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1838')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1839')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1840')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1841')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1842')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1843')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1844')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1845')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'20', N'1846')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1846')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1847')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1850')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1851')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1852')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1853')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1854')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1854')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1855')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1855')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1858')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1858')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'51', N'1859')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'85', N'1859')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'51', N'1860')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1861')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'51', N'1861')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'54', N'1861')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1861')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'75', N'1861')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'74', N'1862')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'20', N'1863')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1863')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1863')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1867')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1867')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1868')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'74', N'1868')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1869')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1869')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1872')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1873')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1873')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1874')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'20', N'1876')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1876')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1878')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'74', N'1878')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'20', N'1879')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1879')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1879')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'74', N'1880')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'20', N'1882')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1882')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1882')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'73', N'1882')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'20', N'1883')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1883')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1883')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'20', N'1884')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1884')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1884')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1885')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'74', N'1885')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1887')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1887')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'71', N'1888')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1892')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1892')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'20', N'1895')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1895')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1895')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1896')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1896')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1899')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1899')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1901')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1901')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'20', N'1903')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1903')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1903')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1905')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1905')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1907')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1907')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1908')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1908')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1909')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1909')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'20', N'1910')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1910')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1910')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'20', N'1911')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1911')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1911')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'73', N'1911')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'74', N'1913')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1914')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1914')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'51', N'1915')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'1', N'1916')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1917')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1917')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'70', N'1921')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'20', N'1924')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1924')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'73', N'1926')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'74', N'1926')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1927')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1928')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1929')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1930')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1931')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1932')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1934')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'20', N'1935')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1936')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1936')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1937')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1938')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1940')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'20', N'1941')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1941')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1942')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1943')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1944')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1945')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1946')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1946')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'12', N'1948')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'14', N'1948')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'54', N'1948')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1952')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1953')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1953')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1955')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1955')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1956')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'74', N'1956')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1958')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1958')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'20', N'1959')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1959')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1959')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1961')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1963')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1966')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1967')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1968')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1969')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1970')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1971')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1972')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1973')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1975')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1976')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1977')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1979')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1980')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1981')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'20', N'1983')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1984')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'74', N'1984')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1985')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1985')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1986')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1986')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'20', N'1988')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1988')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1990')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1990')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'11', N'1991')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1991')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'72', N'1991')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'20', N'1992')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1992')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1992')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1993')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1993')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1994')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1994')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1995')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1995')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1996')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1996')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1997')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1997')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1998')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1998')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'1999')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'1999')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'2359')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'2361')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'2361')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'11', N'2362')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'72', N'2362')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'11', N'2363')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'72', N'2363')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'2366')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'2366')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'2368')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'74', N'2368')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'1', N'2371')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'2373')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'2373')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'1', N'2375')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'2376')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'2377')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'2378')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'2379')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'2381')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'2382')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'2383')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'2385')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'2386')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'2387')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'2388')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'2389')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'2392')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'2393')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'20', N'2394')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'2394')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'2395')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'2397')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'2399')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'2400')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'2401')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'2403')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'2404')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'2405')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'2409')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'2409')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'2410')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'2410')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'2413')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'2413')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'2416')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'2416')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'2418')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'73', N'2418')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'74', N'2418')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'74', N'2419')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'74', N'2420')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'74', N'2422')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'2423')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'2423')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'2424')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'2424')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'2425')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'2426')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'2426')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'2428')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'2428')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'2429')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'2429')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'2430')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'2430')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'2431')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'2431')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'2434')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'2435')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'2435')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'2436')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'2437')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'2445')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'2446')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'2447')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'2448')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'2449')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'2450')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'2451')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'2452')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'2455')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'2459')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'2460')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'2461')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'2463')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'2464')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'2465')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'2468')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'2468')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'1', N'2471')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'74', N'2473')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'2474')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'2475')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'2476')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'2477')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'2478')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'2482')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'2483')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'2486')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'2487')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'2490')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'2492')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'2492')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'2493')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'2496')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'2498')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'2498')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'71', N'2499')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'74', N'2501')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'2502')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'2502')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'51', N'2503')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'2505')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'2505')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'2508')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'2508')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'20', N'2509')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'2509')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'2509')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'70', N'2514')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'1', N'2519')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'2520')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'2520')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'2522')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'2522')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'2524')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'2524')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'1', N'2526')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'2527')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'2528')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'2529')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'2530')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'2531')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'2532')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'2533')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'2534')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'2535')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'2536')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'2537')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'2538')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'2539')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'2540')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'2541')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'2542')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'2543')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'2549')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'2550')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'2551')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'2552')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'2553')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'2554')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'2555')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'2556')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'2557')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'2557')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'2558')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'75', N'2558')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'2563')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'2563')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'2564')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'2564')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'2565')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'2566')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'2567')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'2568')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'2569')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'2569')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'1', N'2572')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'2573')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'2574')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'2575')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'2576')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'2576')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'2577')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'2580')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'2583')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'2583')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'2590')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'2590')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'2591')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'2591')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'2592')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'2593')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'2594')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'2595')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'2596')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'2597')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'2598')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'2599')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'2600')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'2601')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'2602')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'2603')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'2604')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'2605')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'2606')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'2607')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'2608')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'2609')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'2610')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'2611')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'2612')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'2613')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'3042')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'3051')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'3062')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'3064')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'3065')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'3068')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'3073')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'3077')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'3078')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'3079')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'3084')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'3089')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'3090')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'3091')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'3093')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'3094')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'3097')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'3098')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'3099')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'3100')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'20', N'3104')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'3106')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'3107')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'3109')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'3110')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'3111')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'3112')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'3113')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'3114')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'3115')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'3116')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'3117')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'3118')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'3119')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'3120')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'3121')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'3122')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'3123')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'3124')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'3125')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'3126')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'3127')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'3128')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'3129')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'3130')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'3131')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'3132')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'3133')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'3134')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'3135')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'3136')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'3138')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'3139')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'3140')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'3141')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'3142')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'3143')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'3144')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'3148')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'3149')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'3150')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'3151')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'3152')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'3153')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'3154')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'3155')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'3156')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'3158')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'3159')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'3161')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'3162')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'3163')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'3164')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'3167')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'3168')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'3169')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'3173')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'3174')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'3175')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'3176')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'3177')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'74', N'3420')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'8001')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'8002')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'8003')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'8004')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'8005')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'8006')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'50', N'8877')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'60', N'8877')
GO

INSERT INTO [dbo].[Sys_WorkGroupOp] VALUES (N'1', N'8888')
GO


-- ----------------------------
-- Table structure for Sys_WorkGroupPower
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Sys_WorkGroupPower]') AND type IN ('U'))
	DROP TABLE [dbo].[Sys_WorkGroupPower]
GO

CREATE TABLE [dbo].[Sys_WorkGroupPower] (
  [GroupID] int  NOT NULL,
  [PowerID] varchar(8) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [PowerState] int DEFAULT ((0)) NOT NULL
)
GO

ALTER TABLE [dbo].[Sys_WorkGroupPower] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of Sys_WorkGroupPower
-- ----------------------------
INSERT INTO [dbo].[Sys_WorkGroupPower] VALUES (N'1', N'10', N'1')
GO

INSERT INTO [dbo].[Sys_WorkGroupPower] VALUES (N'11', N'102010', N'0')
GO

INSERT INTO [dbo].[Sys_WorkGroupPower] VALUES (N'12', N'2023', N'0')
GO

INSERT INTO [dbo].[Sys_WorkGroupPower] VALUES (N'12', N'30', N'0')
GO

INSERT INTO [dbo].[Sys_WorkGroupPower] VALUES (N'12', N'4050', N'0')
GO

INSERT INTO [dbo].[Sys_WorkGroupPower] VALUES (N'12', N'5050', N'0')
GO

INSERT INTO [dbo].[Sys_WorkGroupPower] VALUES (N'12', N'7001', N'0')
GO

INSERT INTO [dbo].[Sys_WorkGroupPower] VALUES (N'12', N'7002', N'0')
GO

INSERT INTO [dbo].[Sys_WorkGroupPower] VALUES (N'12', N'7005', N'0')
GO

INSERT INTO [dbo].[Sys_WorkGroupPower] VALUES (N'13', N'102010', N'0')
GO

INSERT INTO [dbo].[Sys_WorkGroupPower] VALUES (N'13', N'102020', N'0')
GO

INSERT INTO [dbo].[Sys_WorkGroupPower] VALUES (N'13', N'102030', N'0')
GO

INSERT INTO [dbo].[Sys_WorkGroupPower] VALUES (N'13', N'102040', N'0')
GO

INSERT INTO [dbo].[Sys_WorkGroupPower] VALUES (N'13', N'1030', N'0')
GO

INSERT INTO [dbo].[Sys_WorkGroupPower] VALUES (N'13', N'4010', N'0')
GO

INSERT INTO [dbo].[Sys_WorkGroupPower] VALUES (N'13', N'4040', N'0')
GO

INSERT INTO [dbo].[Sys_WorkGroupPower] VALUES (N'13', N'4050', N'0')
GO

INSERT INTO [dbo].[Sys_WorkGroupPower] VALUES (N'13', N'5001', N'0')
GO

INSERT INTO [dbo].[Sys_WorkGroupPower] VALUES (N'13', N'5010', N'0')
GO

INSERT INTO [dbo].[Sys_WorkGroupPower] VALUES (N'13', N'5040', N'0')
GO

INSERT INTO [dbo].[Sys_WorkGroupPower] VALUES (N'13', N'5050', N'0')
GO

INSERT INTO [dbo].[Sys_WorkGroupPower] VALUES (N'13', N'7001', N'0')
GO

INSERT INTO [dbo].[Sys_WorkGroupPower] VALUES (N'13', N'7002', N'0')
GO

INSERT INTO [dbo].[Sys_WorkGroupPower] VALUES (N'14', N'102020', N'0')
GO

INSERT INTO [dbo].[Sys_WorkGroupPower] VALUES (N'14', N'4050', N'0')
GO

INSERT INTO [dbo].[Sys_WorkGroupPower] VALUES (N'14', N'5050', N'0')
GO

INSERT INTO [dbo].[Sys_WorkGroupPower] VALUES (N'14', N'7001', N'0')
GO

INSERT INTO [dbo].[Sys_WorkGroupPower] VALUES (N'14', N'7002', N'0')
GO

INSERT INTO [dbo].[Sys_WorkGroupPower] VALUES (N'20', N'102040', N'0')
GO

INSERT INTO [dbo].[Sys_WorkGroupPower] VALUES (N'50', N'2010', N'0')
GO

INSERT INTO [dbo].[Sys_WorkGroupPower] VALUES (N'50', N'4020', N'0')
GO

INSERT INTO [dbo].[Sys_WorkGroupPower] VALUES (N'50', N'4021', N'0')
GO

INSERT INTO [dbo].[Sys_WorkGroupPower] VALUES (N'50', N'4040', N'0')
GO

INSERT INTO [dbo].[Sys_WorkGroupPower] VALUES (N'50', N'7001', N'0')
GO

INSERT INTO [dbo].[Sys_WorkGroupPower] VALUES (N'51', N'3010', N'0')
GO

INSERT INTO [dbo].[Sys_WorkGroupPower] VALUES (N'51', N'4010', N'0')
GO

INSERT INTO [dbo].[Sys_WorkGroupPower] VALUES (N'51', N'4020', N'0')
GO

INSERT INTO [dbo].[Sys_WorkGroupPower] VALUES (N'51', N'4030', N'0')
GO

INSERT INTO [dbo].[Sys_WorkGroupPower] VALUES (N'51', N'4040', N'0')
GO

INSERT INTO [dbo].[Sys_WorkGroupPower] VALUES (N'51', N'5001', N'0')
GO

INSERT INTO [dbo].[Sys_WorkGroupPower] VALUES (N'51', N'5010', N'0')
GO

INSERT INTO [dbo].[Sys_WorkGroupPower] VALUES (N'51', N'5030', N'0')
GO

INSERT INTO [dbo].[Sys_WorkGroupPower] VALUES (N'51', N'5040', N'0')
GO

INSERT INTO [dbo].[Sys_WorkGroupPower] VALUES (N'52', N'2010', N'0')
GO

INSERT INTO [dbo].[Sys_WorkGroupPower] VALUES (N'52', N'3010', N'0')
GO

INSERT INTO [dbo].[Sys_WorkGroupPower] VALUES (N'52', N'4010', N'0')
GO

INSERT INTO [dbo].[Sys_WorkGroupPower] VALUES (N'52', N'4020', N'0')
GO

INSERT INTO [dbo].[Sys_WorkGroupPower] VALUES (N'52', N'4021', N'0')
GO

INSERT INTO [dbo].[Sys_WorkGroupPower] VALUES (N'52', N'4022', N'0')
GO

INSERT INTO [dbo].[Sys_WorkGroupPower] VALUES (N'52', N'4030', N'0')
GO

INSERT INTO [dbo].[Sys_WorkGroupPower] VALUES (N'52', N'4040', N'0')
GO

INSERT INTO [dbo].[Sys_WorkGroupPower] VALUES (N'52', N'7001', N'0')
GO

INSERT INTO [dbo].[Sys_WorkGroupPower] VALUES (N'53', N'4010', N'0')
GO

INSERT INTO [dbo].[Sys_WorkGroupPower] VALUES (N'53', N'4020', N'0')
GO

INSERT INTO [dbo].[Sys_WorkGroupPower] VALUES (N'53', N'4021', N'0')
GO

INSERT INTO [dbo].[Sys_WorkGroupPower] VALUES (N'53', N'4040', N'0')
GO

INSERT INTO [dbo].[Sys_WorkGroupPower] VALUES (N'54', N'2021', N'0')
GO

INSERT INTO [dbo].[Sys_WorkGroupPower] VALUES (N'54', N'2022', N'0')
GO

INSERT INTO [dbo].[Sys_WorkGroupPower] VALUES (N'54', N'4050', N'0')
GO

INSERT INTO [dbo].[Sys_WorkGroupPower] VALUES (N'54', N'5001', N'0')
GO

INSERT INTO [dbo].[Sys_WorkGroupPower] VALUES (N'54', N'5040', N'0')
GO

INSERT INTO [dbo].[Sys_WorkGroupPower] VALUES (N'54', N'5050', N'0')
GO

INSERT INTO [dbo].[Sys_WorkGroupPower] VALUES (N'54', N'7001', N'0')
GO

INSERT INTO [dbo].[Sys_WorkGroupPower] VALUES (N'54', N'7002', N'0')
GO

INSERT INTO [dbo].[Sys_WorkGroupPower] VALUES (N'54', N'7003', N'0')
GO

INSERT INTO [dbo].[Sys_WorkGroupPower] VALUES (N'54', N'7004', N'0')
GO

INSERT INTO [dbo].[Sys_WorkGroupPower] VALUES (N'54', N'7005', N'0')
GO

INSERT INTO [dbo].[Sys_WorkGroupPower] VALUES (N'60', N'2010', N'0')
GO

INSERT INTO [dbo].[Sys_WorkGroupPower] VALUES (N'60', N'2022', N'0')
GO

INSERT INTO [dbo].[Sys_WorkGroupPower] VALUES (N'60', N'2023', N'0')
GO

INSERT INTO [dbo].[Sys_WorkGroupPower] VALUES (N'60', N'5001', N'0')
GO

INSERT INTO [dbo].[Sys_WorkGroupPower] VALUES (N'60', N'5020', N'1')
GO

INSERT INTO [dbo].[Sys_WorkGroupPower] VALUES (N'60', N'5021', N'0')
GO

INSERT INTO [dbo].[Sys_WorkGroupPower] VALUES (N'60', N'5022', N'0')
GO

INSERT INTO [dbo].[Sys_WorkGroupPower] VALUES (N'60', N'5023', N'0')
GO

INSERT INTO [dbo].[Sys_WorkGroupPower] VALUES (N'60', N'5025', N'0')
GO

INSERT INTO [dbo].[Sys_WorkGroupPower] VALUES (N'60', N'5040', N'0')
GO

INSERT INTO [dbo].[Sys_WorkGroupPower] VALUES (N'60', N'7001', N'0')
GO

INSERT INTO [dbo].[Sys_WorkGroupPower] VALUES (N'60', N'7002', N'0')
GO

INSERT INTO [dbo].[Sys_WorkGroupPower] VALUES (N'70', N'2010', N'0')
GO

INSERT INTO [dbo].[Sys_WorkGroupPower] VALUES (N'70', N'2012', N'0')
GO

INSERT INTO [dbo].[Sys_WorkGroupPower] VALUES (N'70', N'2020', N'0')
GO

INSERT INTO [dbo].[Sys_WorkGroupPower] VALUES (N'70', N'2021', N'0')
GO

INSERT INTO [dbo].[Sys_WorkGroupPower] VALUES (N'70', N'2023', N'0')
GO

INSERT INTO [dbo].[Sys_WorkGroupPower] VALUES (N'70', N'4022', N'0')
GO

INSERT INTO [dbo].[Sys_WorkGroupPower] VALUES (N'70', N'4040', N'0')
GO

INSERT INTO [dbo].[Sys_WorkGroupPower] VALUES (N'70', N'5023', N'0')
GO

INSERT INTO [dbo].[Sys_WorkGroupPower] VALUES (N'70', N'7001', N'0')
GO

INSERT INTO [dbo].[Sys_WorkGroupPower] VALUES (N'70', N'7002', N'0')
GO

INSERT INTO [dbo].[Sys_WorkGroupPower] VALUES (N'71', N'2010', N'0')
GO

INSERT INTO [dbo].[Sys_WorkGroupPower] VALUES (N'71', N'2012', N'0')
GO

INSERT INTO [dbo].[Sys_WorkGroupPower] VALUES (N'71', N'2020', N'0')
GO

INSERT INTO [dbo].[Sys_WorkGroupPower] VALUES (N'71', N'2022', N'0')
GO

INSERT INTO [dbo].[Sys_WorkGroupPower] VALUES (N'71', N'2023', N'0')
GO

INSERT INTO [dbo].[Sys_WorkGroupPower] VALUES (N'71', N'5023', N'0')
GO

INSERT INTO [dbo].[Sys_WorkGroupPower] VALUES (N'71', N'5025', N'0')
GO

INSERT INTO [dbo].[Sys_WorkGroupPower] VALUES (N'71', N'5040', N'0')
GO

INSERT INTO [dbo].[Sys_WorkGroupPower] VALUES (N'71', N'7002', N'0')
GO

INSERT INTO [dbo].[Sys_WorkGroupPower] VALUES (N'72', N'2010', N'0')
GO

INSERT INTO [dbo].[Sys_WorkGroupPower] VALUES (N'72', N'2020', N'0')
GO

INSERT INTO [dbo].[Sys_WorkGroupPower] VALUES (N'72', N'2021', N'0')
GO

INSERT INTO [dbo].[Sys_WorkGroupPower] VALUES (N'72', N'2022', N'0')
GO

INSERT INTO [dbo].[Sys_WorkGroupPower] VALUES (N'72', N'2023', N'0')
GO

INSERT INTO [dbo].[Sys_WorkGroupPower] VALUES (N'73', N'102030', N'0')
GO

INSERT INTO [dbo].[Sys_WorkGroupPower] VALUES (N'73', N'7001', N'0')
GO

INSERT INTO [dbo].[Sys_WorkGroupPower] VALUES (N'73', N'7002', N'0')
GO

INSERT INTO [dbo].[Sys_WorkGroupPower] VALUES (N'74', N'2010', N'0')
GO

INSERT INTO [dbo].[Sys_WorkGroupPower] VALUES (N'74', N'4022', N'0')
GO

INSERT INTO [dbo].[Sys_WorkGroupPower] VALUES (N'74', N'4040', N'0')
GO

INSERT INTO [dbo].[Sys_WorkGroupPower] VALUES (N'74', N'5001', N'0')
GO

INSERT INTO [dbo].[Sys_WorkGroupPower] VALUES (N'74', N'5023', N'0')
GO

INSERT INTO [dbo].[Sys_WorkGroupPower] VALUES (N'74', N'5040', N'0')
GO

INSERT INTO [dbo].[Sys_WorkGroupPower] VALUES (N'75', N'4040', N'0')
GO

INSERT INTO [dbo].[Sys_WorkGroupPower] VALUES (N'75', N'4050', N'0')
GO

INSERT INTO [dbo].[Sys_WorkGroupPower] VALUES (N'75', N'5001', N'0')
GO

INSERT INTO [dbo].[Sys_WorkGroupPower] VALUES (N'75', N'5050', N'0')
GO

INSERT INTO [dbo].[Sys_WorkGroupPower] VALUES (N'75', N'7001', N'0')
GO

INSERT INTO [dbo].[Sys_WorkGroupPower] VALUES (N'75', N'7002', N'0')
GO

INSERT INTO [dbo].[Sys_WorkGroupPower] VALUES (N'75', N'7004', N'0')
GO

INSERT INTO [dbo].[Sys_WorkGroupPower] VALUES (N'76', N'2010', N'0')
GO

INSERT INTO [dbo].[Sys_WorkGroupPower] VALUES (N'76', N'5001', N'0')
GO

INSERT INTO [dbo].[Sys_WorkGroupPower] VALUES (N'76', N'5010', N'0')
GO

INSERT INTO [dbo].[Sys_WorkGroupPower] VALUES (N'77', N'2010', N'0')
GO

INSERT INTO [dbo].[Sys_WorkGroupPower] VALUES (N'78', N'2010', N'0')
GO

INSERT INTO [dbo].[Sys_WorkGroupPower] VALUES (N'79', N'2010', N'0')
GO

INSERT INTO [dbo].[Sys_WorkGroupPower] VALUES (N'80', N'2010', N'0')
GO

INSERT INTO [dbo].[Sys_WorkGroupPower] VALUES (N'83', N'2010', N'0')
GO

INSERT INTO [dbo].[Sys_WorkGroupPower] VALUES (N'84', N'2010', N'0')
GO

INSERT INTO [dbo].[Sys_WorkGroupPower] VALUES (N'85', N'101021', N'0')
GO

INSERT INTO [dbo].[Sys_WorkGroupPower] VALUES (N'85', N'4050', N'0')
GO

INSERT INTO [dbo].[Sys_WorkGroupPower] VALUES (N'85', N'5050', N'0')
GO

INSERT INTO [dbo].[Sys_WorkGroupPower] VALUES (N'86', N'2010', N'0')
GO

INSERT INTO [dbo].[Sys_WorkGroupPower] VALUES (N'87', N'4020', N'0')
GO

INSERT INTO [dbo].[Sys_WorkGroupPower] VALUES (N'88', N'2010', N'0')
GO

INSERT INTO [dbo].[Sys_WorkGroupPower] VALUES (N'89', N'2010', N'0')
GO

INSERT INTO [dbo].[Sys_WorkGroupPower] VALUES (N'90', N'2010', N'0')
GO


-- ----------------------------
-- View structure for View_Sys_OpOffice
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[View_Sys_OpOffice]') AND type IN ('V'))
	DROP VIEW [dbo].[View_Sys_OpOffice]
GO

CREATE VIEW [dbo].[View_Sys_OpOffice] AS select OpID, OfficeID
from Sys_Op (nolock)

union all

select OpID, OfficeID
from Sys_OpOffice (nolock)
GO


-- ----------------------------
-- Procedure structure for Pro_Fun_GetRandomString
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Pro_Fun_GetRandomString]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[Pro_Fun_GetRandomString]
GO

CREATE PROCEDURE [dbo].[Pro_Fun_GetRandomString]
	@RandomString varchar(200) output, 
	@Count int = 6  --随机长度
AS
BEGIN
	DECLARE
		@ASCII varchar(100) = '1234567890abcdefhijkmnopqrstuvwxyz',
		@Position int = 1

	if @Count > 200
		set @Count = 200
	
	if isnull(@Count, 0) < 1 
		set @Count = 1
	
	set @RandomString = ''
	
	while @Count > 0
	begin
		select @Position = cast(rand() * len(@ASCII) * 100 as int) % len(@ASCII)
		select @RandomString = @RandomString + SUBSTRING(@ASCII, @Position + 1, 1),
			@Count = @Count - 1
	end

	
END
GO


-- ----------------------------
-- Procedure structure for Pro_Sys_Op_ChangePwd
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Pro_Sys_Op_ChangePwd]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[Pro_Sys_Op_ChangePwd]
GO

CREATE PROCEDURE [dbo].[Pro_Sys_Op_ChangePwd]
	@OpID varchar(8),
	@OldPassword varchar(32),
	@NewPassword varchar(32)
AS
BEGIN	
	if len(@NewPassword) < 6
	begin
		raiserror('密码长度至少6位', 16, 1)
		return 1
	end
	
	if @NewPassword = @OpID
	begin
		raiserror('密码不能为工号，123456等', 16, 1)
		return 1
	end

	update Sys_Op
	set 
		EncryptedPass = substring(sys.fn_sqlvarbasetostr(HashBytes('MD5', @NewPassword)), 3, 32)
	where OpID = @OpID and 
		(EncryptedPass = '' or EncryptedPass = substring(sys.fn_sqlvarbasetostr(HashBytes('MD5', @OldPassword)), 3, 32))
	
	if @@error <> 0 or @@rowcount = 0
	begin
		raiserror('原始密码错误，修改失败', 16, 1)
		return 1
	end
	
	return 0
END
GO


-- ----------------------------
-- Procedure structure for Pro_Sys_Op_Login
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Pro_Sys_Op_Login]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[Pro_Sys_Op_Login]
GO

CREATE PROCEDURE [dbo].[Pro_Sys_Op_Login]
	@UserID varchar(20),
	@Password varchar(32),
	@AppID varchar(32),
	@AppVer varchar(32),
	@ResVer varchar(32),
	@ClientAddress varchar(32),
	@UserName varchar(30) output,
	@OfficeID varchar(8) output,
	@OfficeName varchar(40) output,	
	@AccessList varchar(2000) = ',' output,
	@ExtendList varchar(6000) output,
	@ServerID varchar(32) = ''
AS
BEGIN
	declare
	@RecSign varchar(10),
	@OfficeUse varchar(10),
	@IsAdmin varchar(10) = 'False',
	@Msg varchar(200) = ''
	
	--检查版本
-- 	if @AppVer < '2020.01.01' or @ResVer < '020'
-- 	begin
-- 		raiserror('您的软件版本较低，请先升级', 16, 1)
-- 		return 1
-- 	end

	-- MD5密码转换
	select @Password = substring(sys.fn_sqlvarbasetostr(HashBytes('MD5', @Password)), 3, 32)

	--判断密码是否正确
	select @UserName = OpName,
		@OfficeID = isnull(OfficeID, ''),
		@RecSign = Isnull(RecSign, 0)
	from Sys_Op
	where OpID = @UserID
		and DATALENGTH(OpID) = DATALENGTH(@UserID)
		and (EncryptedPass = @Password or EncryptedPass = '')
		and StopSign = 0
	
	if @@ROWCOUNT = 0 or LTRIM(@UserID) = ''
	begin
		raiserror('用户名或者密码错误, 如有疑问请联系管理员.', 16, 1)
		return 1
	end
	
	--取科室名称和用途
	select @OfficeName = isnull(OfficeName, ''), @OfficeUse = isnull(OfficeUse, '')
	from Sys_Office (nolock)
	where OfficeID = @OfficeID
		
	if @OfficeID = '' or @OfficeName = ''
	begin
		raiserror('未分配科室，请联系管理员', 16, 1)
		return 1
	end
	
	--取权限列表	
	select @AccessList = ','
	select @AccessList = @AccessList + b.PowerID + ','
	from Sys_WorkGroupOp a inner join Sys_WorkGroupPower b on a.GroupID=b.GroupID
	where OpID = @UserID
   
	--判断是否为管理员
	if CHARINDEX(',10,', @AccessList, 1) > 0 
		set @IsAdmin = 'True'		
	
	if --left(@OfficeID, 2) = '02' and 
		GETDATE() < '2015-9-12'
		set @Msg = '重要提示：接收到“危急值事件”语音或者短信报告后可进入集成平台进行查询！'
	--记录登录信息
	
	select @ExtendList = 'RecSign=' + @RecSign + CHAR(13)+ CHAR(10)
		+ 'IsAdmin=' + @IsAdmin + CHAR(13)+ CHAR(10)
		+ 'OfficeUse=' + Isnull(@OfficeUse, '') + CHAR(13)+ CHAR(10)
		+ 'Msg=' + @Msg + CHAR(13)+ CHAR(10)
		+ 'UnitName=' + dbo.Fun_GetParam('Sys.UnitName', '未设置单位') + CHAR(13)+ CHAR(10)
		+ 'OK'
	
	update Sys_Op
	set LoginTime = GETDATE(),
		LoginIP = @ClientAddress
	where OpID = @UserID
	
	return 0
END
GO


-- ----------------------------
-- Procedure structure for Pro_Sys_Op_Logout
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Pro_Sys_Op_Logout]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[Pro_Sys_Op_Logout]
GO

CREATE PROCEDURE [dbo].[Pro_Sys_Op_Logout]
	@UserID varchar(20)
AS
BEGIN	
	--todo: 更新操作员表
	
	
	return 0
END
GO


-- ----------------------------
-- Procedure structure for Pro_Sys_Param_GetSerialNumber
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Pro_Sys_Param_GetSerialNumber]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[Pro_Sys_Param_GetSerialNumber]
GO

CREATE PROCEDURE [dbo].[Pro_Sys_Param_GetSerialNumber]
	@SerialNumber varchar(18) output, --流水号
	@SerialName varchar(30), --流水号名称
	@SerialType int,  --流水号形式，确定了头部的长度
	@SerialLen int  --流水号尾部长度
AS
BEGIN
	declare	@ErrorNum int --错误号
	declare @UpdateCount int --数据更新数目
	declare @SerialHeader varchar(8) --流水号头部，由当前时间和流水号的形式确定
	declare @SerialTail varchar(12) --流水号尾部
	
	begin tran
	
	--锁定当前流水号，防止并发
	update Sys_Param set ParamType = ParamType where ParamName = @SerialName
	
	select @ErrorNum = @@error, @UpdateCount = @@rowcount
	
	if @ErrorNum <> 0 
		goto ErrorProcess
		
	if (@UpdateCount = 0)
	begin
		-- 插入流水号记录
		insert into Sys_Param (ParamName, ParamType, ParamValue) values (@SerialName, '流水号', '')
		if @@error <> 0 
			goto ErrorProcess
	end
	
	--获取当前时间的流水号头部
	set @SerialHeader = convert(varchar(8), getdate(), 112)
	if @SerialType = 2 
		set @SerialHeader = LEFT(@SerialHeader, 6)
	else if @SerialType = 3
		set @SerialHeader = LEFT(@SerialHeader, 4)

	--获取参数表中的流水号
	select @SerialNumber = ParamValue from Sys_Param where ParamName = @SerialName
	
	if left(@SerialNumber, len(@SerialHeader)) <> @SerialHeader
		--头部不同时，从头开始编号
		set @SerialNumber = @SerialHeader + right('000000000000001', @SerialLen)
	else begin
		--头部相同时，尾部加1
		set @SerialTail = right(@SerialNumber, @SerialLen)
		set @SerialTail = right('00000000000000' + cast((cast(@SerialTail as int) + 1) as varchar(12)), @SerialLen)
		set @SerialNumber = @SerialHeader + @SerialTail
	end
	
	--保存新的流水号
	update Sys_Param set ParamValue = @SerialNumber where ParamName = @SerialName

	commit tran
	return 0
	
ErrorProcess:
	rollback tran	
	return 1
	
END
GO


-- ----------------------------
-- Procedure structure for Pro_Sys_Op_AfterInsert
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Pro_Sys_Op_AfterInsert]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[Pro_Sys_Op_AfterInsert]
GO

CREATE PROCEDURE [dbo].[Pro_Sys_Op_AfterInsert]
	@OpID varchar(8)
as
BEGIN		
	--todo: 更新其他库中用户信息
		
	return 0

ErrorProcess:
	return 1
	
END
GO


-- ----------------------------
-- Procedure structure for Pro_Sys_Op_AfterUpdate
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Pro_Sys_Op_AfterUpdate]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[Pro_Sys_Op_AfterUpdate]
GO

CREATE PROCEDURE [dbo].[Pro_Sys_Op_AfterUpdate]
	@OldOpID varchar(8),
	@NewOpID varchar(8)
as
BEGIN		
	--todo: 更新其他库中用户信息
		
	return 0

ErrorProcess:
	return 1
	
END
GO


-- ----------------------------
-- Procedure structure for Pro_Sys_Office_AfterUpdate
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Pro_Sys_Office_AfterUpdate]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[Pro_Sys_Office_AfterUpdate]
GO

CREATE PROCEDURE [dbo].[Pro_Sys_Office_AfterUpdate]
	@OldOfficeID varchar(8),
	@NewOfficeID varchar(8)
as
BEGIN		
	--todo: 更新其他库中科室信息

	return 0

ErrorProcess:
	return 1

END
GO


-- ----------------------------
-- Procedure structure for Pro_Sys_Office_AfterInsert
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Pro_Sys_Office_AfterInsert]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[Pro_Sys_Office_AfterInsert]
GO

CREATE PROCEDURE [dbo].[Pro_Sys_Office_AfterInsert]
	@OfficeID varchar(8)
as
BEGIN		
	--todo: 更新其他库中科室信息
		
	return 0

ErrorProcess:
	return 1
	
END
GO


-- ----------------------------
-- Procedure structure for Pro_Sys_Office_BeforeDelete
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Pro_Sys_Office_BeforeDelete]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[Pro_Sys_Office_BeforeDelete]
GO

CREATE PROCEDURE [dbo].[Pro_Sys_Office_BeforeDelete]
	@OfficeID varchar(8)
as
BEGIN		
	--todo: 更新其他库中科室信息
		
	return 0

ErrorProcess:
	return 1
	
END
GO


-- ----------------------------
-- Procedure structure for Pro_Sys_Param_BeforeDelete
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Pro_Sys_Param_BeforeDelete]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[Pro_Sys_Param_BeforeDelete]
GO

CREATE PROCEDURE [dbo].[Pro_Sys_Param_BeforeDelete]
	@ParamName varchar(30)
as
BEGIN
	return 0

ErrorProcess:
	return 1
	
END
GO


-- ----------------------------
-- Procedure structure for Pro_Sys_Param_AfterInsert
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Pro_Sys_Param_AfterInsert]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[Pro_Sys_Param_AfterInsert]
GO

CREATE PROCEDURE [dbo].[Pro_Sys_Param_AfterInsert]
	@ParamName varchar(30)
as
BEGIN
	return 0

ErrorProcess:
	return 1
	
END
GO


-- ----------------------------
-- Procedure structure for Pro_Sys_Param_AfterUpdate
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Pro_Sys_Param_AfterUpdate]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[Pro_Sys_Param_AfterUpdate]
GO

CREATE PROCEDURE [dbo].[Pro_Sys_Param_AfterUpdate]
	@OldParamName varchar(30),
	@NewParamName varchar(30)
as
BEGIN
	return 0

ErrorProcess:
	return 1
	
END
GO


-- ----------------------------
-- Procedure structure for Pro_Sys_Op_BeforeDelete
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Pro_Sys_Op_BeforeDelete]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[Pro_Sys_Op_BeforeDelete]
GO

CREATE PROCEDURE [dbo].[Pro_Sys_Op_BeforeDelete]
	@OpID varchar(8)
as
BEGIN		
	--todo: 更新其他库中用户信息
		
	return 0

ErrorProcess:
	return 1
	
END
GO


-- ----------------------------
-- Function structure for Fun_HavePower
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Fun_HavePower]') AND type IN ('FN', 'FS', 'FT', 'IF', 'TF'))
	DROP FUNCTION[dbo].[Fun_HavePower]
GO

CREATE FUNCTION [dbo].[Fun_HavePower]
(
	@OpID varchar(8),  --
	@OfficeID varchar(8),  --
	@PowerID varchar(8)
)
RETURNS int
AS
BEGIN
	declare @Result int = 0

	--PowerID='' 或者 管理员 或者 具备上级权限
	if Exists(select b.PowerID
		from Sys_WorkGroupOp a inner join Sys_WorkGroupPower b on a.GroupID = b.GroupID
		where a.OpID = @OpID and (@PowerID = '' or b.PowerID = '10'
			or left(b.PowerID, len(@PowerID)) = @PowerID))
		set @Result = 1    

	return @Result

END
GO


-- ----------------------------
-- Function structure for Fun_GetParam
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Fun_GetParam]') AND type IN ('FN', 'FS', 'FT', 'IF', 'TF'))
	DROP FUNCTION[dbo].[Fun_GetParam]
GO

CREATE FUNCTION [dbo].[Fun_GetParam]
(
	@ParamName varchar(30),  --参数名
	@Default varchar(200)  --默认值
)
RETURNS varchar(200)
AS
BEGIN
	DECLARE @Result varchar(200)

	select @Result = ISNULL(ParamValue, @Default)
    from Sys_Param where ParamName = @ParamName
    
    if @Result is null
		select @Result = @Default

	return @Result

END
GO


-- ----------------------------
-- Function structure for fun_varbin2hexstr
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[fun_varbin2hexstr]') AND type IN ('FN', 'FS', 'FT', 'IF', 'TF'))
	DROP FUNCTION[dbo].[fun_varbin2hexstr]
GO

CREATE FUNCTION [dbo].[fun_varbin2hexstr](
	@bin varbinary(8000)
)returns varchar(8000)
as
begin
    declare @re varchar(8000), @i int
    select @re = '', @i = datalength(@bin)
    while @i > 0
        select @re = substring('0123456789ABCDEF', substring(@bin, @i, 1) / 16 + 1, 1)
                + substring('0123456789ABCDEF', substring(@bin, @i, 1) % 16 + 1, 1)
                + @re
            ,@i=@i-1
            
    return @re
end
GO


-- ----------------------------
-- Function structure for fun_hexstr2varbin
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[fun_hexstr2varbin]') AND type IN ('FN', 'FS', 'FT', 'IF', 'TF'))
	DROP FUNCTION[dbo].[fun_hexstr2varbin]
GO

CREATE FUNCTION [dbo].[fun_hexstr2varbin](
	@char varchar(8000)
)returns varbinary(8000)
as
begin
    declare @re varbinary(8000), @tempchar varchar(2), 
            @getchar varchar(1), @getint int, @n int, @totalint int,
            @i int, @tempint int, @runNum int -- 字符串截取段数

     select @tempchar='',@i=datalength(@char), @re=0x; 

    if( @i>0)
    begin
        if ( @i%2 = 0) set @runNum= @i/2
        else set @runNum= @i/2 + 1 

        while (@runNum > 0)
        begin
            if(@runNum = 1) set @tempchar = @char 
            else set @tempchar = substring(@char, (@runNum-1)*2,2)

            select @n=1,@totalint=0;
            
            -- 循环处理截取的每个字符串 (这里的字符串长度为2)
            while @n < ( datalength(@tempchar) + 1 )
            begin
                set @getchar=substring(@tempchar,@n,1);

                -- 将字符转换为十六进制对应的数字
                select @getint=case  
                       when @getchar='a' then 10 
                       when @getchar='b' then 11
                       when @getchar='c' then 12 
                       when @getchar='d' then 13
                       when @getchar='e' then 14 
                       when @getchar='f' then 15
                       else  convert(int,@getchar) end;

                set @tempint=@getint*power(16,datalength(@tempchar)-@n)
                set @totalint = @totalint + @tempint
                set @n=@n+1
            end 

               set @re=convert(varbinary(1),@totalint) + @re;    
               set @runNum=@runNum-1;         
        end
    end
    
   return @re

end
GO


-- ----------------------------
-- Procedure structure for Pro_Sys_Param_Query
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Pro_Sys_Param_Query]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[Pro_Sys_Param_Query]
GO

CREATE PROCEDURE [dbo].[Pro_Sys_Param_Query]
	@ParamTitle varchar(20) = '',
	@ParamName varchar(30)
AS
BEGIN
	select ParamName, ParamType, ParamTitle, ParamValue, Memo
	from Sys_Param
	where ParamName = @ParamName
		or ParamTitle like @ParamTitle
	
END
GO


-- ----------------------------
-- Primary Key structure for table Misc_Report
-- ----------------------------
ALTER TABLE [dbo].[Misc_Report] ADD CONSTRAINT [PK_Misc_Report] PRIMARY KEY CLUSTERED ([ReportName])
WITH (PAD_INDEX = OFF, FILLFACTOR = 90, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table Misc_ReportParam
-- ----------------------------
ALTER TABLE [dbo].[Misc_ReportParam] ADD CONSTRAINT [PK_Misc_ReportParam] PRIMARY KEY CLUSTERED ([ReportName], [ParamName])
WITH (PAD_INDEX = OFF, FILLFACTOR = 90, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Indexes structure for table Sys_Log
-- ----------------------------
CREATE NONCLUSTERED INDEX [Ind_Sys_Log_Time]
ON [dbo].[Sys_Log] (
  [LogDate] ASC
)
GO


-- ----------------------------
-- Primary Key structure for table Sys_Log
-- ----------------------------
ALTER TABLE [dbo].[Sys_Log] ADD CONSTRAINT [PK_SYS_LOG] PRIMARY KEY CLUSTERED ([LogID])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table Sys_Office
-- ----------------------------
ALTER TABLE [dbo].[Sys_Office] ADD CONSTRAINT [PK_SYS_OFFICE] PRIMARY KEY CLUSTERED ([OfficeID])
WITH (PAD_INDEX = OFF, FILLFACTOR = 90, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Indexes structure for table Sys_Op
-- ----------------------------
CREATE NONCLUSTERED INDEX [Ind_Sys_Op_Phone]
ON [dbo].[Sys_Op] (
  [Phone] ASC
)
WITH (
  FILLFACTOR = 80
)
GO


-- ----------------------------
-- Primary Key structure for table Sys_Op
-- ----------------------------
ALTER TABLE [dbo].[Sys_Op] ADD CONSTRAINT [PK_SYS_OP] PRIMARY KEY CLUSTERED ([OpID])
WITH (PAD_INDEX = ON, FILLFACTOR = 90, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table Sys_OpOffice
-- ----------------------------
ALTER TABLE [dbo].[Sys_OpOffice] ADD CONSTRAINT [PK_SYS_OPOFFICE] PRIMARY KEY CLUSTERED ([OpID], [OfficeID])
WITH (PAD_INDEX = OFF, FILLFACTOR = 90, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table Sys_Param
-- ----------------------------
ALTER TABLE [dbo].[Sys_Param] ADD CONSTRAINT [PK_SYS_PARAM] PRIMARY KEY CLUSTERED ([ParamName])
WITH (PAD_INDEX = OFF, FILLFACTOR = 90, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table Sys_Power
-- ----------------------------
ALTER TABLE [dbo].[Sys_Power] ADD CONSTRAINT [PK_SYS_POWER] PRIMARY KEY CLUSTERED ([PowerID])
WITH (PAD_INDEX = OFF, FILLFACTOR = 90, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table Sys_Script
-- ----------------------------
ALTER TABLE [dbo].[Sys_Script] ADD CONSTRAINT [PK_Sys_Script] PRIMARY KEY CLUSTERED ([ScriptID])
WITH (PAD_INDEX = OFF, FILLFACTOR = 90, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table Sys_WorkGroup
-- ----------------------------
ALTER TABLE [dbo].[Sys_WorkGroup] ADD CONSTRAINT [PK_SYS_WorkGroup] PRIMARY KEY CLUSTERED ([GroupID])
WITH (PAD_INDEX = OFF, FILLFACTOR = 90, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table Sys_WorkGroupOp
-- ----------------------------
ALTER TABLE [dbo].[Sys_WorkGroupOp] ADD CONSTRAINT [PK_Sys_WorkGroupOp] PRIMARY KEY CLUSTERED ([OpID], [GroupID])
WITH (PAD_INDEX = OFF, FILLFACTOR = 90, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table Sys_WorkGroupPower
-- ----------------------------
ALTER TABLE [dbo].[Sys_WorkGroupPower] ADD CONSTRAINT [PK_SYS_WorkGroupPower] PRIMARY KEY CLUSTERED ([GroupID], [PowerID])
WITH (PAD_INDEX = OFF, FILLFACTOR = 90, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO

