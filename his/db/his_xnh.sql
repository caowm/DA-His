/*
 Navicat Premium Data Transfer

 Source Server         : sql2008
 Source Server Type    : SQL Server
 Source Server Version : 10501600
 Date: 20/09/2020 11:53:30
*/


-- ----------------------------
-- Table structure for XNH_AllArea
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[XNH_AllArea]') AND type IN ('U'))
	DROP TABLE [dbo].[XNH_AllArea]
GO

CREATE TABLE [dbo].[XNH_AllArea] (
  [AreaCode] varchar(6) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [UpCode] varchar(6) COLLATE Chinese_PRC_CI_AS  NULL,
  [AreaName] varchar(50) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [IME_PY] varchar(20) COLLATE Chinese_PRC_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[XNH_AllArea] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of XNH_AllArea
-- ----------------------------
INSERT INTO [dbo].[XNH_AllArea] VALUES (N'420105', N'420100', N'武汉经济开发区', NULL)
GO

INSERT INTO [dbo].[XNH_AllArea] VALUES (N'420111', N'420100', N'洪山区', NULL)
GO

INSERT INTO [dbo].[XNH_AllArea] VALUES (N'420112', N'420100', N'东西湖区', NULL)
GO

INSERT INTO [dbo].[XNH_AllArea] VALUES (N'420113', N'420100', N'汉南区', NULL)
GO

INSERT INTO [dbo].[XNH_AllArea] VALUES (N'420114', N'420100', N'蔡甸区', NULL)
GO

INSERT INTO [dbo].[XNH_AllArea] VALUES (N'420117', N'420100', N'新洲区', NULL)
GO

INSERT INTO [dbo].[XNH_AllArea] VALUES (N'420118', N'420100', N'东湖高新区', NULL)
GO

INSERT INTO [dbo].[XNH_AllArea] VALUES (N'420122', N'420100', N'江夏区', NULL)
GO

INSERT INTO [dbo].[XNH_AllArea] VALUES (N'420123', N'420100', N'黄陂区', NULL)
GO

INSERT INTO [dbo].[XNH_AllArea] VALUES (N'420203', N'420200', N'黄石市(区)', NULL)
GO

INSERT INTO [dbo].[XNH_AllArea] VALUES (N'420221', N'420200', N'大冶市', NULL)
GO

INSERT INTO [dbo].[XNH_AllArea] VALUES (N'420222', N'420200', N'阳新县', NULL)
GO

INSERT INTO [dbo].[XNH_AllArea] VALUES (N'420302', N'420300', N'茅箭区', NULL)
GO

INSERT INTO [dbo].[XNH_AllArea] VALUES (N'420303', N'420300', N'张湾区', NULL)
GO

INSERT INTO [dbo].[XNH_AllArea] VALUES (N'420305', N'420300', N'武当山', NULL)
GO

INSERT INTO [dbo].[XNH_AllArea] VALUES (N'420321', N'420300', N'郧县', NULL)
GO

INSERT INTO [dbo].[XNH_AllArea] VALUES (N'420322', N'420300', N'郧西县', NULL)
GO

INSERT INTO [dbo].[XNH_AllArea] VALUES (N'420323', N'420300', N'竹山县', NULL)
GO

INSERT INTO [dbo].[XNH_AllArea] VALUES (N'420324', N'420300', N'竹溪县', NULL)
GO

INSERT INTO [dbo].[XNH_AllArea] VALUES (N'420325', N'420300', N'房县', NULL)
GO

INSERT INTO [dbo].[XNH_AllArea] VALUES (N'420371', N'420300', N'十堰经济技术开发区', NULL)
GO

INSERT INTO [dbo].[XNH_AllArea] VALUES (N'420381', N'420300', N'丹江口', NULL)
GO

INSERT INTO [dbo].[XNH_AllArea] VALUES (N'420502', N'420500', N'西陵区', NULL)
GO

INSERT INTO [dbo].[XNH_AllArea] VALUES (N'420503', N'420500', N'伍家岗', NULL)
GO

INSERT INTO [dbo].[XNH_AllArea] VALUES (N'420504', N'420500', N'点军区', NULL)
GO

INSERT INTO [dbo].[XNH_AllArea] VALUES (N'420506', N'420500', N'夷陵区', NULL)
GO

INSERT INTO [dbo].[XNH_AllArea] VALUES (N'420525', N'420500', N'远安县', NULL)
GO

INSERT INTO [dbo].[XNH_AllArea] VALUES (N'420526', N'420500', N'兴山县', NULL)
GO

INSERT INTO [dbo].[XNH_AllArea] VALUES (N'420527', N'420500', N'秭归县', NULL)
GO

INSERT INTO [dbo].[XNH_AllArea] VALUES (N'420528', N'420500', N'长阳市', NULL)
GO

INSERT INTO [dbo].[XNH_AllArea] VALUES (N'420529', N'420500', N'五峰县', NULL)
GO

INSERT INTO [dbo].[XNH_AllArea] VALUES (N'420581', N'420500', N'宜都市', NULL)
GO

INSERT INTO [dbo].[XNH_AllArea] VALUES (N'420582', N'420500', N'当阳市', NULL)
GO

INSERT INTO [dbo].[XNH_AllArea] VALUES (N'420583', N'420500', N'枝江市', NULL)
GO

INSERT INTO [dbo].[XNH_AllArea] VALUES (N'420602', N'420600', N'襄城区', NULL)
GO

INSERT INTO [dbo].[XNH_AllArea] VALUES (N'420606', N'420600', N'高新区', NULL)
GO

INSERT INTO [dbo].[XNH_AllArea] VALUES (N'420607', N'420600', N'襄州区', NULL)
GO

INSERT INTO [dbo].[XNH_AllArea] VALUES (N'420610', N'420600', N'襄阳经济开发区', NULL)
GO

INSERT INTO [dbo].[XNH_AllArea] VALUES (N'420616', N'420600', N'樊城区', NULL)
GO

INSERT INTO [dbo].[XNH_AllArea] VALUES (N'420620', N'420600', N'老河口', NULL)
GO

INSERT INTO [dbo].[XNH_AllArea] VALUES (N'420624', N'420600', N'南漳县', NULL)
GO

INSERT INTO [dbo].[XNH_AllArea] VALUES (N'420625', N'420600', N'谷城县', NULL)
GO

INSERT INTO [dbo].[XNH_AllArea] VALUES (N'420626', N'420600', N'保康县', NULL)
GO

INSERT INTO [dbo].[XNH_AllArea] VALUES (N'420683', N'420600', N'枣阳市', NULL)
GO

INSERT INTO [dbo].[XNH_AllArea] VALUES (N'420684', N'420600', N'宜城市', NULL)
GO

INSERT INTO [dbo].[XNH_AllArea] VALUES (N'420701', N'420700', N'鄂州市', NULL)
GO

INSERT INTO [dbo].[XNH_AllArea] VALUES (N'420802', N'420800', N'东宝区', NULL)
GO

INSERT INTO [dbo].[XNH_AllArea] VALUES (N'420804', N'420800', N'掇刀区', NULL)
GO

INSERT INTO [dbo].[XNH_AllArea] VALUES (N'420821', N'420800', N'京山县', NULL)
GO

INSERT INTO [dbo].[XNH_AllArea] VALUES (N'420822', N'420800', N'沙洋县', NULL)
GO

INSERT INTO [dbo].[XNH_AllArea] VALUES (N'420881', N'420800', N'钟祥市', NULL)
GO

INSERT INTO [dbo].[XNH_AllArea] VALUES (N'420902', N'420900', N'孝南区', NULL)
GO

INSERT INTO [dbo].[XNH_AllArea] VALUES (N'420921', N'420900', N'孝昌县', NULL)
GO

INSERT INTO [dbo].[XNH_AllArea] VALUES (N'420922', N'420900', N'大悟县', NULL)
GO

INSERT INTO [dbo].[XNH_AllArea] VALUES (N'420923', N'420900', N'云梦县', NULL)
GO

INSERT INTO [dbo].[XNH_AllArea] VALUES (N'420981', N'420900', N'应城市', NULL)
GO

INSERT INTO [dbo].[XNH_AllArea] VALUES (N'420982', N'420900', N'安陆市', NULL)
GO

INSERT INTO [dbo].[XNH_AllArea] VALUES (N'420984', N'420900', N'汉川市', NULL)
GO

INSERT INTO [dbo].[XNH_AllArea] VALUES (N'421001', N'421000', N'荆州开发区', NULL)
GO

INSERT INTO [dbo].[XNH_AllArea] VALUES (N'421002', N'421000', N'沙市区', NULL)
GO

INSERT INTO [dbo].[XNH_AllArea] VALUES (N'421003', N'421000', N'荆州区', NULL)
GO

INSERT INTO [dbo].[XNH_AllArea] VALUES (N'421004', N'421000', N'江陵县', NULL)
GO

INSERT INTO [dbo].[XNH_AllArea] VALUES (N'421022', N'421000', N'公安县', NULL)
GO

INSERT INTO [dbo].[XNH_AllArea] VALUES (N'421023', N'421000', N'监利县', NULL)
GO

INSERT INTO [dbo].[XNH_AllArea] VALUES (N'421081', N'421000', N'石首市', NULL)
GO

INSERT INTO [dbo].[XNH_AllArea] VALUES (N'421083', N'421000', N'洪湖市', NULL)
GO

INSERT INTO [dbo].[XNH_AllArea] VALUES (N'421087', N'421000', N'松滋市', NULL)
GO

INSERT INTO [dbo].[XNH_AllArea] VALUES (N'421101', N'421100', N'龙感湖', NULL)
GO

INSERT INTO [dbo].[XNH_AllArea] VALUES (N'421102', N'421100', N'黄州区', NULL)
GO

INSERT INTO [dbo].[XNH_AllArea] VALUES (N'421121', N'421100', N'团风县', NULL)
GO

INSERT INTO [dbo].[XNH_AllArea] VALUES (N'421122', N'421100', N'红安县', NULL)
GO

INSERT INTO [dbo].[XNH_AllArea] VALUES (N'421123', N'421100', N'罗田县', NULL)
GO

INSERT INTO [dbo].[XNH_AllArea] VALUES (N'421124', N'421100', N'英山县', NULL)
GO

INSERT INTO [dbo].[XNH_AllArea] VALUES (N'421125', N'421100', N'浠水县', NULL)
GO

INSERT INTO [dbo].[XNH_AllArea] VALUES (N'421126', N'421100', N'蕲春县', NULL)
GO

INSERT INTO [dbo].[XNH_AllArea] VALUES (N'421127', N'421100', N'黄梅县', NULL)
GO

INSERT INTO [dbo].[XNH_AllArea] VALUES (N'421181', N'421100', N'麻城市', NULL)
GO

INSERT INTO [dbo].[XNH_AllArea] VALUES (N'421182', N'421100', N'武穴市', NULL)
GO

INSERT INTO [dbo].[XNH_AllArea] VALUES (N'421202', N'421200', N'咸安区', NULL)
GO

INSERT INTO [dbo].[XNH_AllArea] VALUES (N'421221', N'421200', N'嘉鱼县', NULL)
GO

INSERT INTO [dbo].[XNH_AllArea] VALUES (N'421222', N'421200', N'通城县', NULL)
GO

INSERT INTO [dbo].[XNH_AllArea] VALUES (N'421223', N'421200', N'崇阳县', NULL)
GO

INSERT INTO [dbo].[XNH_AllArea] VALUES (N'421224', N'421200', N'通山县', NULL)
GO

INSERT INTO [dbo].[XNH_AllArea] VALUES (N'421281', N'421200', N'赤壁市', NULL)
GO

INSERT INTO [dbo].[XNH_AllArea] VALUES (N'421302', N'421300', N'曾都区', NULL)
GO

INSERT INTO [dbo].[XNH_AllArea] VALUES (N'421321', N'421300', N'随县', NULL)
GO

INSERT INTO [dbo].[XNH_AllArea] VALUES (N'421381', N'421300', N'广水市', NULL)
GO

INSERT INTO [dbo].[XNH_AllArea] VALUES (N'422801', N'422800', N'恩施市', NULL)
GO

INSERT INTO [dbo].[XNH_AllArea] VALUES (N'422802', N'422800', N'利川县', NULL)
GO

INSERT INTO [dbo].[XNH_AllArea] VALUES (N'422822', N'422800', N'建始县', NULL)
GO

INSERT INTO [dbo].[XNH_AllArea] VALUES (N'422823', N'422800', N'巴东县', NULL)
GO

INSERT INTO [dbo].[XNH_AllArea] VALUES (N'422825', N'422800', N'宣恩县', NULL)
GO

INSERT INTO [dbo].[XNH_AllArea] VALUES (N'422826', N'422800', N'咸丰县', NULL)
GO

INSERT INTO [dbo].[XNH_AllArea] VALUES (N'422827', N'422800', N'来凤县', NULL)
GO

INSERT INTO [dbo].[XNH_AllArea] VALUES (N'422828', N'422800', N'鹤峰县', NULL)
GO

INSERT INTO [dbo].[XNH_AllArea] VALUES (N'429004', N'429000', N'仙桃市', NULL)
GO

INSERT INTO [dbo].[XNH_AllArea] VALUES (N'429005', N'429000', N'潜江市', NULL)
GO

INSERT INTO [dbo].[XNH_AllArea] VALUES (N'429006', N'429000', N'天门市', NULL)
GO

INSERT INTO [dbo].[XNH_AllArea] VALUES (N'429021', N'429000', N'神农架林区', NULL)
GO


-- ----------------------------
-- Table structure for XNH_Area
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[XNH_Area]') AND type IN ('U'))
	DROP TABLE [dbo].[XNH_Area]
GO

CREATE TABLE [dbo].[XNH_Area] (
  [AreaID] varchar(6) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [AreaName] varchar(12) COLLATE Chinese_PRC_CI_AS  NULL,
  [UsesID] varchar(12) COLLATE Chinese_PRC_CI_AS  NULL,
  [OrganID] varchar(12) COLLATE Chinese_PRC_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[XNH_Area] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of XNH_Area
-- ----------------------------
INSERT INTO [dbo].[XNH_Area] VALUES (N'420000', N'省级转诊', N'420000000019', N'420000000018')
GO

INSERT INTO [dbo].[XNH_Area] VALUES (N'420105', N'沌口区', N'420105000050', N'420105999920')
GO

INSERT INTO [dbo].[XNH_Area] VALUES (N'420112', N'东西湖区', N'420112000076', N'420112999957')
GO

INSERT INTO [dbo].[XNH_Area] VALUES (N'420113', N'汉南区', N'420113000030', N'420113999928')
GO

INSERT INTO [dbo].[XNH_Area] VALUES (N'420114', N'蔡甸区', N'420114000032', N'420114999908')
GO

INSERT INTO [dbo].[XNH_Area] VALUES (N'420117', N'新洲区', N'420117000038', N'420117999915')
GO

INSERT INTO [dbo].[XNH_Area] VALUES (N'420118', N'东湖高新', N'420123000029', N'420188999932')
GO

INSERT INTO [dbo].[XNH_Area] VALUES (N'420122', N'江夏区', N'420122000050', N'420188999938')
GO

INSERT INTO [dbo].[XNH_Area] VALUES (N'420123', N'黄陂区', N'420123000044', N'420188999910')
GO

INSERT INTO [dbo].[XNH_Area] VALUES (N'420100', N'市级转诊', N'', N'')
GO


-- ----------------------------
-- Table structure for XNH_bxgs
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[XNH_bxgs]') AND type IN ('U'))
	DROP TABLE [dbo].[XNH_bxgs]
GO

CREATE TABLE [dbo].[XNH_bxgs] (
  [ID] int  IDENTITY(1,1) NOT NULL,
  [OrganID] varchar(10) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [YearID] varchar(8) COLLATE Chinese_PRC_CI_AS  NULL,
  [ExpressionsID] tinyint  NOT NULL,
  [ExpressionsName] varchar(200) COLLATE Chinese_PRC_CI_AS  NULL,
  [grade] varchar(6) COLLATE Chinese_PRC_CI_AS  NULL,
  [Kind] tinyint  NULL,
  [TypeFee] varchar(20) COLLATE Chinese_PRC_CI_AS  NULL,
  [LoadSign] tinyint  NULL
)
GO

ALTER TABLE [dbo].[XNH_bxgs] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for XNH_Fee
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[XNH_Fee]') AND type IN ('U'))
	DROP TABLE [dbo].[XNH_Fee]
GO

CREATE TABLE [dbo].[XNH_Fee] (
  [FeeID] int  NOT NULL,
  [AreaCode] varchar(6) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [XNHCode] varchar(30) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [XNHTypeID] int  NOT NULL,
  [StopSign] int  NULL,
  [Memo] varchar(50) COLLATE Chinese_PRC_CI_AS  NULL,
  [XNHID] varchar(50) COLLATE Chinese_PRC_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[XNH_Fee] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for XNH_HospType
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[XNH_HospType]') AND type IN ('U'))
	DROP TABLE [dbo].[XNH_HospType]
GO

CREATE TABLE [dbo].[XNH_HospType] (
  [HospTypeID] varchar(6) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [HospTypeName] varchar(12) COLLATE Chinese_PRC_CI_AS  NULL,
  [IME_PY] varchar(5) COLLATE Chinese_PRC_CI_AS  NULL,
  [IME_EX] varchar(5) COLLATE Chinese_PRC_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[XNH_HospType] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of XNH_HospType
-- ----------------------------
INSERT INTO [dbo].[XNH_HospType] VALUES (N'21', N'普通住院', N'ptzy', NULL)
GO

INSERT INTO [dbo].[XNH_HospType] VALUES (N'22', N'单病种住院', N'dbzzy', NULL)
GO

INSERT INTO [dbo].[XNH_HospType] VALUES (N'23', N'正常分娩住院', N'zcfmz', NULL)
GO

INSERT INTO [dbo].[XNH_HospType] VALUES (N'29', N'其他住院', N'qtzy', NULL)
GO

INSERT INTO [dbo].[XNH_HospType] VALUES (N'90', N'其他', N'qt', NULL)
GO


-- ----------------------------
-- Table structure for XNH_Illness
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[XNH_Illness]') AND type IN ('U'))
	DROP TABLE [dbo].[XNH_Illness]
GO

CREATE TABLE [dbo].[XNH_Illness] (
  [ID] int  IDENTITY(1,1) NOT NULL,
  [OrganID] varchar(8) COLLATE Chinese_PRC_CI_AS  NULL,
  [IllCode] varchar(15) COLLATE Chinese_PRC_CI_AS  NULL,
  [IllName] varchar(100) COLLATE Chinese_PRC_CI_AS  NULL,
  [Spell] varchar(20) COLLATE Chinese_PRC_CI_AS  NULL,
  [FiveStrokes] varchar(20) COLLATE Chinese_PRC_CI_AS  NULL,
  [If_Modified] char(1) COLLATE Chinese_PRC_CI_AS  NULL,
  [PYOrder] int  NULL
)
GO

ALTER TABLE [dbo].[XNH_Illness] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for XNH_InHosp
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[XNH_InHosp]') AND type IN ('U'))
	DROP TABLE [dbo].[XNH_InHosp]
GO

CREATE TABLE [dbo].[XNH_InHosp] (
  [HospID] varchar(12) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [AsOrganID] varchar(20) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [AreaCode] varchar(12) COLLATE Chinese_PRC_CI_AS  NULL,
  [YearID] int  NULL,
  [CardNum] varchar(20) COLLATE Chinese_PRC_CI_AS  NULL,
  [AsCoopMedCode] varchar(18) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [AsExpressionsID] varchar(4) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [AsExpressionsName] varchar(100) COLLATE Chinese_PRC_CI_AS  NULL,
  [AsPatientName] varchar(10) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [AiIDNo] varchar(6) COLLATE Chinese_PRC_CI_AS  NULL,
  [TurnID] int DEFAULT ((0)) NOT NULL,
  [AsIllCode] varchar(10) COLLATE Chinese_PRC_CI_AS  NULL,
  [AsIllName] varchar(40) COLLATE Chinese_PRC_CI_AS  NULL,
  [AInDate] datetime  NULL,
  [Adke] varchar(12) COLLATE Chinese_PRC_CI_AS  NULL,
  [AdLimitDef] varchar(10) COLLATE Chinese_PRC_CI_AS  NULL,
  [AsDoctorName] varchar(30) COLLATE Chinese_PRC_CI_AS  NULL,
  [AsPatientId] varchar(50) COLLATE Chinese_PRC_CI_AS  NULL,
  [AsFlag] varchar(3) COLLATE Chinese_PRC_CI_AS  NULL,
  [AiDiagNo] varchar(6) COLLATE Chinese_PRC_CI_AS  NULL,
  [AsExpenseKind] varchar(3) COLLATE Chinese_PRC_CI_AS  NULL,
  [AsLimitIllCode] varchar(3) COLLATE Chinese_PRC_CI_AS  NULL,
  [RegDate] smalldatetime  NULL,
  [APreClearFlag] int  NULL,
  [ADayCount] int  NULL,
  [AOutDate] varchar(20) COLLATE Chinese_PRC_CI_AS  NULL,
  [AJsDate] varchar(20) COLLATE Chinese_PRC_CI_AS  NULL,
  [AOutStatus] varchar(4) COLLATE Chinese_PRC_CI_AS  NULL,
  [OutBuffer] varchar(500) COLLATE Chinese_PRC_CI_AS  NULL,
  [YLFZE] numeric(18,2)  NULL,
  [KBXFY] numeric(18,2)  NULL,
  [BXFY] numeric(18,2)  NULL,
  [YYJM] numeric(18,2)  NULL,
  [MZBZ] numeric(18,2)  NULL,
  [BXJE] numeric(18,2)  NULL,
  [YYCD] numeric(18,2)  NULL,
  [QFX] numeric(18,2)  NULL,
  [Holder9] numeric(18,2)  NULL,
  [DBZYYCD] numeric(18,2)  NULL,
  [Holder11] numeric(18,2)  NULL,
  [NFDX] numeric(18,2)  NULL,
  [NBXZFY] numeric(18,2)  NULL
)
GO

ALTER TABLE [dbo].[XNH_InHosp] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for XNH_OutHospInfo1
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[XNH_OutHospInfo1]') AND type IN ('U'))
	DROP TABLE [dbo].[XNH_OutHospInfo1]
GO

CREATE TABLE [dbo].[XNH_OutHospInfo1] (
  [HospTypeName] varchar(20) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [HouseName] varchar(20) COLLATE Chinese_PRC_CI_AS  NULL,
  [PersonName] varchar(20) COLLATE Chinese_PRC_CI_AS  NULL,
  [Sex] varchar(4) COLLATE Chinese_PRC_CI_AS  NULL,
  [Birthday] varchar(20) COLLATE Chinese_PRC_CI_AS  NULL,
  [RelationName] varchar(10) COLLATE Chinese_PRC_CI_AS  NULL,
  [Address] varchar(50) COLLATE Chinese_PRC_CI_AS  NULL,
  [Hospital] varchar(40) COLLATE Chinese_PRC_CI_AS  NULL,
  [InHospday] varchar(20) COLLATE Chinese_PRC_CI_AS  NULL,
  [OutHospDay] varchar(20) COLLATE Chinese_PRC_CI_AS  NULL,
  [DayCount] int  NULL,
  [HospID] varchar(20) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [IllName] varchar(40) COLLATE Chinese_PRC_CI_AS  NULL,
  [YearCount] int  NULL,
  [TotalPrice] numeric(18,2)  NULL,
  [CanPrice] numeric(18,2)  NULL,
  [Price] numeric(18,2)  NULL,
  [Holder17] numeric(18,2)  NULL,
  [Holder18] numeric(18,2)  NULL,
  [Holder19] varchar(30) COLLATE Chinese_PRC_CI_AS  NULL,
  [Holder20] numeric(18,2)  NULL,
  [Holder21] numeric(18,2)  NULL,
  [Holder22] numeric(18,2)  NULL,
  [Holder23] numeric(18,2)  NULL,
  [Holder24] numeric(18,2)  NULL,
  [Holder25] numeric(18,2)  NULL
)
GO

ALTER TABLE [dbo].[XNH_OutHospInfo1] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for XNH_OutHospInfo2
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[XNH_OutHospInfo2]') AND type IN ('U'))
	DROP TABLE [dbo].[XNH_OutHospInfo2]
GO

CREATE TABLE [dbo].[XNH_OutHospInfo2] (
  [HospID] varchar(12) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [FeeCode] varchar(10) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [FeeName] varchar(20) COLLATE Chinese_PRC_CI_AS  NULL,
  [FeeTotal] numeric(18,2)  NULL,
  [CanPrice] numeric(18,2)  NULL,
  [Price] numeric(18,2)  NULL
)
GO

ALTER TABLE [dbo].[XNH_OutHospInfo2] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for XNH_OutHospInfo3
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[XNH_OutHospInfo3]') AND type IN ('U'))
	DROP TABLE [dbo].[XNH_OutHospInfo3]
GO

CREATE TABLE [dbo].[XNH_OutHospInfo3] (
  [ID] int  IDENTITY(1,1) NOT NULL,
  [HospID] varchar(12) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [Line] varchar(100) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [CanPrice] numeric(18,2)  NULL,
  [CanRatio] varchar(10) COLLATE Chinese_PRC_CI_AS  NULL,
  [Price] numeric(18,2)  NULL
)
GO

ALTER TABLE [dbo].[XNH_OutHospInfo3] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for XNH_PersonInfo
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[XNH_PersonInfo]') AND type IN ('U'))
	DROP TABLE [dbo].[XNH_PersonInfo]
GO

CREATE TABLE [dbo].[XNH_PersonInfo] (
  [CoopmedCode] varchar(20) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [PersonOrder] varchar(2) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [AreaCode] varchar(6) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [PersonName] varchar(20) COLLATE Chinese_PRC_CI_AS  NULL,
  [Ime_PY] varchar(10) COLLATE Chinese_PRC_CI_AS  NULL,
  [Ime_WB] varchar(10) COLLATE Chinese_PRC_CI_AS  NULL,
  [Sex] varchar(6) COLLATE Chinese_PRC_CI_AS  NULL,
  [BirthDay] varchar(20) COLLATE Chinese_PRC_CI_AS  NULL,
  [HomeAdrress] varchar(60) COLLATE Chinese_PRC_CI_AS  NULL,
  [RelationNameCode] varchar(10) COLLATE Chinese_PRC_CI_AS  NULL,
  [RelationName] varchar(20) COLLATE Chinese_PRC_CI_AS  NULL,
  [PersonCode] varchar(20) COLLATE Chinese_PRC_CI_AS  NULL,
  [OpPersonCode] varchar(10) COLLATE Chinese_PRC_CI_AS  NULL,
  [OpPersonName] varchar(20) COLLATE Chinese_PRC_CI_AS  NULL,
  [HouseType] varchar(6) COLLATE Chinese_PRC_CI_AS  NULL,
  [HouseHolder] varchar(6) COLLATE Chinese_PRC_CI_AS  NULL,
  [HouseIsXHN] varchar(6) COLLATE Chinese_PRC_CI_AS  NULL,
  [HouseState] varchar(6) COLLATE Chinese_PRC_CI_AS  NULL,
  [KindDay] varchar(20) COLLATE Chinese_PRC_CI_AS  NULL,
  [InXHNYear] varchar(20) COLLATE Chinese_PRC_CI_AS  NULL,
  [Holder20] varchar(30) COLLATE Chinese_PRC_CI_AS  NULL,
  [Holder21] varchar(30) COLLATE Chinese_PRC_CI_AS  NULL,
  [Holder22] varchar(30) COLLATE Chinese_PRC_CI_AS  NULL,
  [Holder23] varchar(30) COLLATE Chinese_PRC_CI_AS  NULL,
  [Holder24] varchar(30) COLLATE Chinese_PRC_CI_AS  NULL,
  [Holder25] varchar(30) COLLATE Chinese_PRC_CI_AS  NULL,
  [Holder26] varchar(30) COLLATE Chinese_PRC_CI_AS  NULL,
  [RegTime] datetime  NULL
)
GO

ALTER TABLE [dbo].[XNH_PersonInfo] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for XNH_Ratio
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[XNH_Ratio]') AND type IN ('U'))
	DROP TABLE [dbo].[XNH_Ratio]
GO

CREATE TABLE [dbo].[XNH_Ratio] (
  [RatioID] int  NOT NULL,
  [AsOrganID] varchar(6) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [StTypeID] smallint  NULL,
  [StTypeID2] smallint  NULL,
  [FeeID] int  NULL,
  [Ratio] numeric(3,2)  NULL,
  [ReRatio] numeric(3,2)  NULL
)
GO

ALTER TABLE [dbo].[XNH_Ratio] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of XNH_Ratio
-- ----------------------------
INSERT INTO [dbo].[XNH_Ratio] VALUES (N'5', N'420105', N'0', N'54', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'6', N'420105', N'0', N'49', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'7', N'420105', N'0', N'47', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'8', N'420105', N'0', N'4', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'9', N'420105', N'0', N'1', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'10', N'420105', N'0', N'3', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'11', N'420105', N'0', N'2', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'12', N'420105', N'0', N'21', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'13', N'420105', N'0', N'12', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'14', N'420105', N'0', N'5', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'15', N'420105', N'0', N'9', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'16', N'420105', N'0', N'8', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'17', N'420105', N'0', N'7', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'18', N'420105', N'0', N'14', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'19', N'420105', N'0', N'15', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'20', N'420105', N'0', N'18', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'21', N'420105', N'0', N'16', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'22', N'420105', N'0', N'53', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'23', N'420105', N'0', N'51', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'25', N'420113', N'0', N'54', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'26', N'420113', N'0', N'49', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'27', N'420113', N'0', N'47', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'28', N'420113', N'0', N'4', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'29', N'420113', N'0', N'1', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'30', N'420113', N'0', N'3', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'31', N'420113', N'0', N'2', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'32', N'420113', N'0', N'21', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'33', N'420113', N'0', N'12', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'34', N'420113', N'0', N'5', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'35', N'420113', N'0', N'9', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'36', N'420113', N'0', N'8', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'37', N'420113', N'0', N'7', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'38', N'420113', N'0', N'14', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'39', N'420113', N'0', N'15', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'40', N'420113', N'0', N'18', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'41', N'420113', N'0', N'16', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'42', N'420113', N'0', N'53', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'43', N'420113', N'0', N'51', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'45', N'420114', N'0', N'54', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'46', N'420114', N'0', N'49', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'47', N'420114', N'0', N'47', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'48', N'420114', N'0', N'4', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'49', N'420114', N'0', N'1', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'50', N'420114', N'0', N'3', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'51', N'420114', N'0', N'2', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'52', N'420114', N'0', N'21', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'53', N'420114', N'0', N'12', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'54', N'420114', N'0', N'5', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'55', N'420114', N'0', N'9', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'56', N'420114', N'0', N'8', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'57', N'420114', N'0', N'7', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'58', N'420114', N'0', N'14', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'59', N'420114', N'0', N'15', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'60', N'420114', N'0', N'18', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'61', N'420114', N'0', N'16', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'62', N'420114', N'0', N'53', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'63', N'420114', N'0', N'51', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'65', N'420117', N'0', N'54', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'66', N'420117', N'0', N'49', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'67', N'420117', N'0', N'47', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'68', N'420117', N'0', N'4', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'69', N'420117', N'0', N'1', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'70', N'420117', N'0', N'3', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'71', N'420117', N'0', N'2', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'72', N'420117', N'0', N'21', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'73', N'420117', N'0', N'12', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'74', N'420117', N'0', N'5', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'75', N'420117', N'0', N'9', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'76', N'420117', N'0', N'8', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'77', N'420117', N'0', N'7', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'78', N'420117', N'0', N'14', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'79', N'420117', N'0', N'15', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'80', N'420117', N'0', N'18', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'81', N'420117', N'0', N'16', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'82', N'420117', N'0', N'53', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'83', N'420117', N'0', N'51', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'85', N'420122', N'0', N'54', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'86', N'420122', N'0', N'49', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'87', N'420122', N'0', N'47', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'88', N'420122', N'0', N'4', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'89', N'420122', N'0', N'1', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'90', N'420122', N'0', N'3', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'91', N'420122', N'0', N'2', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'92', N'420122', N'0', N'21', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'93', N'420122', N'0', N'12', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'94', N'420122', N'0', N'5', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'95', N'420122', N'0', N'9', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'96', N'420122', N'0', N'8', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'97', N'420122', N'0', N'7', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'98', N'420122', N'0', N'14', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'99', N'420122', N'0', N'15', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'100', N'420122', N'0', N'18', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'101', N'420122', N'0', N'16', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'102', N'420122', N'0', N'53', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'103', N'420122', N'0', N'51', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'105', N'420123', N'0', N'54', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'106', N'420123', N'0', N'49', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'107', N'420123', N'0', N'47', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'108', N'420123', N'0', N'4', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'109', N'420123', N'0', N'1', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'110', N'420123', N'0', N'3', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'111', N'420123', N'0', N'2', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'112', N'420123', N'0', N'21', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'113', N'420123', N'0', N'12', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'114', N'420123', N'0', N'5', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'115', N'420123', N'0', N'9', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'116', N'420123', N'0', N'8', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'117', N'420123', N'0', N'7', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'118', N'420123', N'0', N'14', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'119', N'420123', N'0', N'15', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'120', N'420123', N'0', N'18', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'121', N'420123', N'0', N'16', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'122', N'420123', N'0', N'53', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'123', N'420123', N'0', N'51', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'124', N'420112', N'0', N'54', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'125', N'420112', N'0', N'49', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'126', N'420112', N'0', N'47', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'127', N'420112', N'0', N'4', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'128', N'420112', N'0', N'1', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'129', N'420112', N'0', N'3', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'130', N'420112', N'0', N'2', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'131', N'420112', N'0', N'21', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'132', N'420112', N'0', N'12', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'133', N'420112', N'0', N'5', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'134', N'420112', N'0', N'9', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'135', N'420112', N'0', N'8', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'136', N'420112', N'0', N'7', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'137', N'420112', N'0', N'14', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'138', N'420112', N'0', N'15', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'139', N'420112', N'0', N'18', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'140', N'420112', N'0', N'16', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'141', N'420112', N'0', N'53', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'142', N'420112', N'0', N'51', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'143', N'420000', N'0', N'54', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'144', N'420000', N'0', N'49', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'145', N'420000', N'0', N'47', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'146', N'420000', N'0', N'4', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'147', N'420000', N'0', N'1', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'148', N'420000', N'0', N'3', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'149', N'420000', N'0', N'2', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'150', N'420000', N'0', N'21', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'151', N'420000', N'0', N'12', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'152', N'420000', N'0', N'5', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'153', N'420000', N'0', N'9', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'154', N'420000', N'0', N'8', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'155', N'420000', N'0', N'7', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'156', N'420000', N'0', N'14', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'157', N'420000', N'0', N'15', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'158', N'420000', N'0', N'18', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'159', N'420000', N'0', N'16', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'160', N'420000', N'0', N'53', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'161', N'420000', N'0', N'51', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'162', N'420118', N'0', N'54', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'163', N'420118', N'0', N'49', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'164', N'420118', N'0', N'47', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'165', N'420118', N'0', N'4', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'166', N'420118', N'0', N'1', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'167', N'420118', N'0', N'3', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'168', N'420118', N'0', N'2', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'169', N'420118', N'0', N'21', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'170', N'420118', N'0', N'12', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'171', N'420118', N'0', N'5', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'172', N'420118', N'0', N'9', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'173', N'420118', N'0', N'8', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'174', N'420118', N'0', N'7', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'175', N'420118', N'0', N'14', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'176', N'420118', N'0', N'15', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'177', N'420118', N'0', N'18', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'178', N'420118', N'0', N'16', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'179', N'420118', N'0', N'53', N'0', N'.90', N'.00')
GO

INSERT INTO [dbo].[XNH_Ratio] VALUES (N'180', N'420118', N'0', N'51', N'0', N'.90', N'.00')
GO


-- ----------------------------
-- Procedure structure for Pro_XNH_Upload_UpdateSign
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Pro_XNH_Upload_UpdateSign]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[Pro_XNH_Upload_UpdateSign]
GO

CREATE PROCEDURE [dbo].[Pro_XNH_Upload_UpdateSign]
	@HospID varchar(10),
	@OpID varchar(8),
	@DetailIDList xml  --未使用,上传列表 <root><id>1</id><id>2</id></root>, 注意大小写, xml解决varchar长度限制
AS
BEGIN

	begin tran

	--锁定患者科室，避免和住院发药发生死锁
	update His_Sys.dbo.Sys_Office
	set OrderID = OrderID
	where OfficeID = (select OfficeID from His_Hosp.dbo.Hosp_Patient where HospID = @HospID)
	
	--锁定患者
	update His_Hosp.dbo.Hosp_Patient
	set RoomID = RoomID
	where HospID = @HospID

	-- 用与“上传”相同的查询方式来更新数据
	update His_Hosp.dbo.Hosp_FeeDetail
	set UploadSign = 1
	where HospID = @HospID and FeeDetailID in (
		select top 10000 a.FeeDetailID
		from His_Hosp.dbo.Hosp_FeeDetail  a
			inner join XNH_InHosp b on a.HospID = b.HospID
			inner join XNH_Fee  c on c.FeeID = a.FeeID and c.AreaCode = b.AsOrganID
		where b.HospID = @HospID and a.UploadSign = 0 and
			(a.CancelSign = 0 or (a.CancelSign = 2 and --是否上传看被冲减项目是否上传
				(select UploadSign from His_Hosp.dbo.Hosp_FeeDetail  e where e.FeeDetailID = a.CancelDetailID) = 1))
		order by a.FeeDetailID
	)

	if @@ERROR <> 0
		goto ErrorProcess
	
	commit tran
	return 0
	
ErrorProcess:
	rollback tran
	return 1
	
END
GO


-- ----------------------------
-- Procedure structure for Pro_XNH_Upload_GetData
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Pro_XNH_Upload_GetData]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[Pro_XNH_Upload_GetData]
GO

CREATE PROCEDURE [dbo].[Pro_XNH_Upload_GetData]
	@HospID varchar(10),
	@OpID varchar(8)
AS
BEGIN
	declare @OrganID varchar(10)
	
	select @OrganID = left(AsOrganID, 6)
	from XNH_InHosp 
	where HospID = @HospID
	
	if not exists(select * from XNH_Area where AreaID = @OrganID)
		set @OrganID = '420000'

	select 1 as UploadSign, b.AsOrganID + '$$' + CAST(YearID as varchar(4)) as AsOrganID, 
		b.AsCoopMedCode, b.AiIDNo, AiDiagNo, 
		FeeDetailID, a.FeeName, a.Specs, a.HUnit as AsUnit,
		a.FeeID as AsItemCode, 
		case when rtrim(isnull(c.XNHID, '')) <> '' then c.XNHID else c.XNHCode end as AsHosCode,	
		convert(varchar(10), FeeDate, 120) as AdInputDate,
		a.HPrice as AfPrice, a.Quan as AfNum, a.SumPrice as AfFee, 
		a.ApplyOfficeName as AsOfficeName, a.DoctorName as AsDoctor, '2' as AsCompound
	from His_Hosp.dbo.Hosp_FeeDetail  a
		inner join XNH_InHosp b on a.HospID = b.HospID
		left join XNH_Fee  c on c.FeeID = a.FeeID and c.AreaCode = @OrganID
	where b.HospID = @HospID and a.UploadSign = 0 and
		(a.CancelSign = 0 or (a.CancelSign = 2 and --是否上传看被冲减项目是否上传
			(select UploadSign from His_Hosp.dbo.Hosp_FeeDetail  e where e.FeeDetailID = a.CancelDetailID) = 1))
	order by a.FeeID

END
GO


-- ----------------------------
-- Procedure structure for Pro_XNH_InHosp_Prepare
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Pro_XNH_InHosp_Prepare]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[Pro_XNH_InHosp_Prepare]
GO

CREATE PROCEDURE [dbo].[Pro_XNH_InHosp_Prepare]
	@HospID varchar(12),
	@OpID varchar(8)
AS
BEGIN
	declare @AiDiagNo varchar(6),
	@OrganID varchar(6)
	
	if (select PatientTypeID from His_Hosp.dbo.Hosp_Patient where HospID = @HospID) in (2, 4)
	begin
		raiserror('农合登记：该患者已经登记为医保类型', 16, 1)
		return 1
	end
	
	if not Exists(select HospID from XNH_InHosp where HospID = @HospID)	
	begin
		--插入新登记信息
		insert into XNH_InHosp (HospID, AsOrganID, AsCoopMedCode, AiIDNo,
			AsPatientName, AsPatientId, AInDate, AsDoctorName, YearID, 
			AsExpressionsID, AdLimitDef, AsFlag, AsExpenseKind, AiDiagNo)
		select @HospID, '', '', '1',
			PatientName, HospID + '@@' + OfficeID, 
			HospDate, DoctorName, YEAR(getdate()),
			'', '0', '0', '21', ''
		from His_Hosp.dbo.Hosp_Patient
		where HospID = @HospID
	end
	else begin
		--是否已登记	
		select @AiDiagNo = isnull(AiDiagNo, ''), @OrganID = AsOrganID
		from XNH_InHosp
		where HospID = @HospID
	
		if @AiDiagNo <> ''
		begin
			update XNH_InHosp
			set AsFlag = '2'
			where HospID = @HospID
		end
		else begin		
			--还未登记前修正科室，市农合不传科室
			if @OrganID = '420000'
			begin
				update XNH_InHosp
				set AsPatientId = b.HospID + '@@' + b.OfficeID,
					AsPatientName = b.PatientName,
					AInDate = b.HospDate
				from XNH_InHosp a, His_Hosp.dbo.Hosp_Patient b
				where a.HospID = @HospID and b.HospID = a.HospID
			end
			else
				update XNH_InHosp 
				set AsPatientId = b.HospID,
					AsPatientName = b.PatientName,
					AInDate = b.HospDate
				from XNH_InHosp a, His_Hosp.dbo.Hosp_Patient b
				where a.HospID = @HospID and b.HospID = a.HospID
		end
	end

END
GO


-- ----------------------------
-- Procedure structure for Pro_XNH_InHosp_Cancel
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Pro_XNH_InHosp_Cancel]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[Pro_XNH_InHosp_Cancel]
GO

CREATE PROCEDURE [dbo].[Pro_XNH_InHosp_Cancel]
	@HospID varchar(12),
	@OpID varchar(8)
AS
BEGIN
	declare @AiDiagNo varchar(6)
	
	--登记成功时
	if Exists(select HospID from XNH_InHosp where HospID = @HospID /*and ISNULL(AiDiagNo, '') <> ''*/)	
	begin
		--修改病人类型:普通
		update His_Hosp.dbo.Hosp_Patient
		set PatientTypeID = 1
		where HospID = @HospID
		
		--清空就医序号
		update XNH_InHosp
		set AsFlag = '0', AiDiagNo = '', AsDoctorName = ''
		where HospID = @HospID
		
		--取消费用上传标志
		update His_Hosp.dbo.Hosp_FeeDetail
		set UploadSign = 0
		where HospID = @HospID
		
	end
END
GO


-- ----------------------------
-- Procedure structure for Pro_XNH_InHosp_Reg
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Pro_XNH_InHosp_Reg]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[Pro_XNH_InHosp_Reg]
GO

CREATE PROCEDURE [dbo].[Pro_XNH_InHosp_Reg]
	@HospID varchar(12),
	@OpID varchar(8)
AS
BEGIN
	declare @AiDiagNo varchar(6)
	
	--登记成功时
	if Exists(select HospID from XNH_InHosp where HospID = @HospID /*and ISNULL(AiDiagNo, '') <> ''*/)	
	begin
		select @AiDiagNo = AiDiagNo
		from XNH_InHosp
		where HospID = @HospID
		
		--修改登记时间
		update XNH_InHosp
		set RegDate = GETDATE()
		where HospID = @HospID
		
		--修改病人类型
		update His_Hosp.dbo.Hosp_Patient
		set PatientTypeID = case when isnull(@AiDiagNo, '') <> '' then 3 else 5 end,  --准农合或者农合
			CreditMoney = isnull((select CreditMoney from His_Base.dbo.D_PatientType 
				where PatientTypeID = 3), 0)
		where HospID = @HospID

	end
END
GO


-- ----------------------------
-- Procedure structure for Pro_XNH_OutHosp_Prepare
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Pro_XNH_OutHosp_Prepare]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[Pro_XNH_OutHosp_Prepare]
GO

CREATE PROCEDURE [dbo].[Pro_XNH_OutHosp_Prepare]
	@HospID varchar(12),
	@OpID varchar(8)
AS
BEGIN
	if (select HospSign from His_Hosp.dbo.Hosp_Patient where HospID=@HospID) <> 3
	begin
		raiserror('农合出院登记：该患者还没有申请出院.', 16, 1)
		return 1
	end

	----判断费用是否全部上传
	if isnull((select sum(SumPrice)
		from His_Hosp.dbo.Hosp_FeeDetail 
		where HospID = @HospID and HospFeeID = '' and UploadSign = 0), 0) <> 0 
	begin
		raiserror('农合出院登记：未上传费用明细总额必须为0', 16, 1)
		return 1
	end
	
	--填写住院天数、出院时间、结算时间、出院状态等
	update XNH_InHosp
	set AOutDate = CONVERT(varchar(10), b.OutHospDate, 120),
		AJsDate = CONVERT(varchar(10), getdate(), 120),
		ADayCount = DATEDIFF(day, b.HospDate, b.OutHospDate),
		AOutStatus = '1',
		APreClearFlag = '1'
	from His_Hosp.dbo.Hosp_Patient b 
	where b.HospID = @HospID and XNH_InHosp.HospID = @HospID

END
GO


-- ----------------------------
-- Procedure structure for Pro_XNH_OutHosp_Cancel
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Pro_XNH_OutHosp_Cancel]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[Pro_XNH_OutHosp_Cancel]
GO

CREATE PROCEDURE [dbo].[Pro_XNH_OutHosp_Cancel]
	@HospID varchar(12),
	@OpID varchar(8)
AS
BEGIN
	if Exists(select HospID from His_Hosp.dbo.Hosp_FeeMaster where HospID = @HospID and FeeSign <= 3)
	begin
		raiserror('该患者已经办理农合出院结算，不能取消出院登记.', 16, 1)
		return 1
	end
	
	update XNH_InHosp
	set YLFZE = 0, KBXFY = 0, BXFY = 0, YYJM = 0, 
		MZBZ = 0, BXJE = 0, YYCD = 0, QFX = 0,
		Holder9 = 0, DBZYYCD = 0, Holder11 = 0,
		NFDX = 0, NBXZFY = 0
	where HospID = @HospID
	
	--清除结算表
	delete XNH_OutHospInfo1 where HospID = @HospID
	delete XNH_OutHospInfo2 where HospID = @HospID
	delete XNH_OutHospInfo3 where HospID = @HospID

END
GO


-- ----------------------------
-- Procedure structure for Pro_XNH_HospFee_Prepare
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Pro_XNH_HospFee_Prepare]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[Pro_XNH_HospFee_Prepare]
GO

CREATE PROCEDURE [dbo].[Pro_XNH_HospFee_Prepare]
	@HospID varchar(12),
	@OpID varchar(8)
AS
BEGIN
	--判断是否已出院交费
	
	if Exists(select HospID from His_Hosp.dbo.Hosp_FeeMaster where HospID = @HospID and FeeSign <= 3)
	begin
		raiserror('该患者已经办理农合出院结算.', 16, 1)
		return 1
	end
	
	return 0

END
GO


-- ----------------------------
-- Procedure structure for Pro_XNH_Upload
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Pro_XNH_Upload]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[Pro_XNH_Upload]
GO

CREATE PROCEDURE [dbo].[Pro_XNH_Upload]
	@HospID varchar(10),
	@DetailIDList xml,  --未使用,上传列表 <root><id>1</id><id>2</id></root>, 注意大小写, xml解决varchar长度限制
	@OpID varchar(8)
AS
BEGIN
	--上传前先清除上次未上传明细
-- 	delete XNH.HZInterface.dbo.o_CbZyBxDjZb
-- 	from XNH_InHosp a, XNH.HZInterface.dbo.o_CbZyBxDjZb b 
-- 	where a.HospID = @HospID 
-- 		and b.OrganID = a.AsOrganID
-- 		and b.CoopMedCode = a.AsCoopMedCode
-- 		and b.IDNo = a.AiIDNo

	--插入费用明细
-- 	insert into XNH.HZInterface.dbo.o_CbZyBxDjZb (
-- 		OrganID, CoopMedCode, OrgCode, IDNo, DiagNo, FeeNo,
-- 		ItemCode, ItemName, Price, Num, Fee, 
-- 		OfficeName, RecipeNo, YyDate, Grade,
-- 		InputDate, HosCode, Compound, GG,
-- 		FeeTypeCode, FeeTypename
-- 	)
-- 	select top 10000 b.AsOrganID, -- + '$$' + CAST(YearID as varchar(4)), 
-- 		b.AsCoopMedCode, '1',  b.AiIDNo, AiDiagNo, FeeDetailID, 
-- 		'0', a.FeeName, a.HPrice, a.Quan, a.SumPrice, 
-- 		a.ApplyOfficeID, a.AdviceID, convert(varchar(10), FeeDate, 120), 0,
-- 		convert(varchar(10), FeeDate, 120), 
-- 		case when rtrim(isnull(c.XNHID, '')) <> '' then rtrim(ltrim(c.XNHID)) else c.XNHCode end, 
-- 		'1', a.Specs, 
-- 		'0', '0'
-- 	from His_Hosp.dbo.Hosp_FeeDetail  a
-- 		inner join XNH_InHosp b on a.HospID = b.HospID
-- 		inner join XNH_Fee  c on c.FeeID = a.FeeID and c.AreaCode = b.AsOrganID
-- 	where b.HospID = @HospID and a.UploadSign = 0 and
-- 		(a.CancelSign = 0 or (a.CancelSign = 2 and --是否上传看被冲减项目是否上传
-- 			(select UploadSign from His_Hosp.dbo.Hosp_FeeDetail  e where e.FeeDetailID = a.CancelDetailID) = 1))
-- 	order by a.FeeDetailID


  return -1
	
END
GO


-- ----------------------------
-- Procedure structure for Pro_XNH_Fee_Sync
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Pro_XNH_Fee_Sync]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[Pro_XNH_Fee_Sync]
GO

CREATE PROCEDURE [dbo].[Pro_XNH_Fee_Sync]
AS
BEGIN
	declare @YearID varchar(4)
	
-- 	select @YearID = MAX(ztyear)
-- 	from XNH.HZINTERFACE.dbo.P_HiHosItem

	--先全部停用
	update XNH_Fee
	set StopSign = 1
			
	--HIS有、农合有的，HIS做更新：可用，是否报销、备注
-- 	update XNH_Fee
-- 	set StopSign = 0,
-- 		XNHTypeID = case when a.wipeout = '1' then 1 else 0 end,
-- 		Memo = a.FeeTypeName
-- 	from XNH.HZINTERFACE.dbo.P_HiHosItem a  
-- 	where a.ztyear = @YearID
-- 		and XNH_Fee.AreaCode = a.OrganID
-- 		and XNH_Fee.XNHCode = a.HosCode
-- 		
	--HIS有、农合无的，HIS停用
	--update XNH_Fee
	--set StopSign = 1
	--where XNHID not in (
	--	select b.XNHID 
	--	from XNH.HZINTERFACE.dbo.P_HiHosItem a with , XNH_Fee b with 
	--	where a.ztyear = @YearID
	--		and b.AreaCode = a.OrganID
	--		and b.XNHCode = a.HosCode)

	--HIS无、农合有的，手工在HIS添加
	
END
GO


-- ----------------------------
-- Primary Key structure for table XNH_AllArea
-- ----------------------------
ALTER TABLE [dbo].[XNH_AllArea] ADD CONSTRAINT [PK_XNH_AllArea] PRIMARY KEY CLUSTERED ([AreaCode])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table XNH_Fee
-- ----------------------------
ALTER TABLE [dbo].[XNH_Fee] ADD CONSTRAINT [PK_XNH_FeeTemp] PRIMARY KEY CLUSTERED ([FeeID], [AreaCode])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Indexes structure for table XNH_Illness
-- ----------------------------
CREATE NONCLUSTERED INDEX [Ind_XNH_Illness_OrganID]
ON [dbo].[XNH_Illness] (
  [OrganID] ASC
)
WITH (
  FILLFACTOR = 90
)
GO


-- ----------------------------
-- Primary Key structure for table XNH_Illness
-- ----------------------------
ALTER TABLE [dbo].[XNH_Illness] ADD CONSTRAINT [PK_XNH_Illness] PRIMARY KEY CLUSTERED ([ID])
WITH (PAD_INDEX = OFF, FILLFACTOR = 90, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Indexes structure for table XNH_InHosp
-- ----------------------------
CREATE NONCLUSTERED INDEX [Ind_XNH_InHosp_InDate]
ON [dbo].[XNH_InHosp] (
  [AInDate] ASC
)
WITH (
  FILLFACTOR = 80
)
GO


-- ----------------------------
-- Primary Key structure for table XNH_InHosp
-- ----------------------------
ALTER TABLE [dbo].[XNH_InHosp] ADD CONSTRAINT [PK_XNH_InHosp] PRIMARY KEY CLUSTERED ([HospID])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table XNH_OutHospInfo1
-- ----------------------------
ALTER TABLE [dbo].[XNH_OutHospInfo1] ADD CONSTRAINT [PK_XNH_OutHospInfo1_1] PRIMARY KEY CLUSTERED ([HospID])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Indexes structure for table XNH_OutHospInfo2
-- ----------------------------
CREATE NONCLUSTERED INDEX [Ind_XNH_OutHospInfo2_HospID]
ON [dbo].[XNH_OutHospInfo2] (
  [HospID] ASC
)
WITH (
  FILLFACTOR = 70
)
GO


-- ----------------------------
-- Indexes structure for table XNH_OutHospInfo3
-- ----------------------------
CREATE NONCLUSTERED INDEX [Ind_XNH_OutHospInfo3_HospID]
ON [dbo].[XNH_OutHospInfo3] (
  [HospID] ASC
)
WITH (
  FILLFACTOR = 70
)
GO


-- ----------------------------
-- Primary Key structure for table XNH_OutHospInfo3
-- ----------------------------
ALTER TABLE [dbo].[XNH_OutHospInfo3] ADD CONSTRAINT [PK_XNH_OutHospInfo3] PRIMARY KEY CLUSTERED ([ID])
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table XNH_PersonInfo
-- ----------------------------
ALTER TABLE [dbo].[XNH_PersonInfo] ADD CONSTRAINT [PK_XNH_PersonInfo] PRIMARY KEY CLUSTERED ([CoopmedCode], [PersonOrder], [AreaCode])
ON [PRIMARY]
GO

