/*
 Navicat Premium Data Transfer

 Source Server         : sql2008
 Source Server Type    : SQL Server
 Source Server Version : 10501600
 Date: 20/09/2020 11:40:41
*/


-- ----------------------------
-- Table structure for Stat_Clin_Doctor_Recipe
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Stat_Clin_Doctor_Recipe]') AND type IN ('U'))
	DROP TABLE [dbo].[Stat_Clin_Doctor_Recipe]
GO

CREATE TABLE [dbo].[Stat_Clin_Doctor_Recipe] (
  [StatDate] varchar(8) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [OfficeID] varchar(8) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [DoctorID] varchar(8) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [ExecOfficeID] varchar(8) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [Quan] int  NOT NULL,
  [SumPrice] numeric(18,2)  NOT NULL
)
GO

ALTER TABLE [dbo].[Stat_Clin_Doctor_Recipe] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of Stat_Clin_Doctor_Recipe
-- ----------------------------
INSERT INTO [dbo].[Stat_Clin_Doctor_Recipe] VALUES (N'201412', N'0104', N'1107', N'031503', N'7', N'188.89')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Recipe] VALUES (N'201412', N'0105', N'0575', N'030901', N'1', N'375.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Recipe] VALUES (N'201412', N'0105', N'0575', N'030903', N'1', N'80.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Recipe] VALUES (N'201412', N'0105', N'0575', N'0320', N'2', N'240.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Recipe] VALUES (N'201412', N'0108', N'0281', N'031501', N'3', N'33.89')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Recipe] VALUES (N'201412', N'0108', N'0281', N'031502', N'1', N'250.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Recipe] VALUES (N'201412', N'0108', N'1775', N'030904', N'1', N'110.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Recipe] VALUES (N'201412', N'0108', N'1775', N'031501', N'3', N'33.89')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Recipe] VALUES (N'201412', N'0108', N'1775', N'031502', N'1', N'80.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Recipe] VALUES (N'201412', N'0108', N'1775', N'031503', N'2', N'102.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Recipe] VALUES (N'201412', N'0110', N'1428', N'030903', N'1', N'131.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Recipe] VALUES (N'201412', N'0112', N'0702', N'030901', N'1', N'250.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Recipe] VALUES (N'201412', N'0112', N'0702', N'030903', N'2', N'160.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Recipe] VALUES (N'201412', N'0112', N'1263', N'030901', N'1', N'250.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Recipe] VALUES (N'201412', N'0112', N'1574', N'030903', N'1', N'80.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Recipe] VALUES (N'201412', N'0112', N'1574', N'030904', N'3', N'330.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Recipe] VALUES (N'201412', N'0112', N'1574', N'031501', N'2', N'45.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Recipe] VALUES (N'201412', N'0112', N'1574', N'031503', N'3', N'76.89')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Recipe] VALUES (N'201412', N'0112', N'1654', N'030901', N'1', N'375.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Recipe] VALUES (N'201412', N'0112', N'1654', N'030903', N'1', N'80.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Recipe] VALUES (N'201412', N'0112', N'1654', N'030906', N'1', N'35.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Recipe] VALUES (N'201412', N'0112', N'1654', N'031501', N'2', N'60.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Recipe] VALUES (N'201412', N'0112', N'1654', N'031502', N'3', N'53.89')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Recipe] VALUES (N'201412', N'0113', N'0598', N'030903', N'1', N'135.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Recipe] VALUES (N'201412', N'0119', N'0123', N'030904', N'2', N'220.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Recipe] VALUES (N'201412', N'0119', N'1654', N'030901', N'1', N'250.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Recipe] VALUES (N'201412', N'0119', N'1771', N'030903', N'2', N'270.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Recipe] VALUES (N'201412', N'0119', N'2428', N'030903', N'1', N'135.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Recipe] VALUES (N'201412', N'0119', N'2468', N'030901', N'1', N'300.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Recipe] VALUES (N'201412', N'0119', N'2468', N'031502', N'1', N'25.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Recipe] VALUES (N'201412', N'0122', N'0059', N'031501', N'2', N'58.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Recipe] VALUES (N'201412', N'0122', N'0059', N'031503', N'4', N'62.89')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Recipe] VALUES (N'201412', N'0122', N'0477', N'031502', N'1', N'25.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Recipe] VALUES (N'201412', N'0122', N'0477', N'031503', N'3', N'33.89')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Recipe] VALUES (N'201412', N'0127', N'1232', N'031501', N'1', N'30.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Recipe] VALUES (N'201412', N'0127', N'1232', N'031503', N'3', N'79.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Recipe] VALUES (N'201412', N'0127', N'1863', N'030904', N'2', N'280.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Recipe] VALUES (N'201412', N'0127', N'1863', N'031503', N'3', N'35.89')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Recipe] VALUES (N'201412', N'0129', N'0075', N'030902', N'1', N'600.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Recipe] VALUES (N'201412', N'0130', N'1310', N'030902', N'1', N'600.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Recipe] VALUES (N'201412', N'0130', N'1639', N'030901', N'1', N'250.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Recipe] VALUES (N'201412', N'0132', N'0175', N'031501', N'4', N'58.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Recipe] VALUES (N'201412', N'0132', N'0175', N'031502', N'2', N'100.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Recipe] VALUES (N'201412', N'0132', N'0175', N'031503', N'10', N'175.56')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Recipe] VALUES (N'201412', N'0132', N'1055', N'031503', N'3', N'82.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Recipe] VALUES (N'201412', N'0132', N'1773', N'031503', N'3', N'33.89')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Recipe] VALUES (N'201412', N'0133', N'2524', N'030904', N'1', N'110.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Recipe] VALUES (N'201412', N'0133', N'2524', N'031501', N'6', N'228.89')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Recipe] VALUES (N'201412', N'0133', N'2524', N'031502', N'4', N'353.89')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Recipe] VALUES (N'201412', N'0135', N'0565', N'030904', N'1', N'110.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Recipe] VALUES (N'201412', N'0135', N'0565', N'031501', N'1', N'30.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Recipe] VALUES (N'201412', N'0135', N'0565', N'031502', N'1', N'25.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Recipe] VALUES (N'201501', N'0105', N'1339', N'031501', N'1', N'180.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Recipe] VALUES (N'201501', N'0105', N'1339', N'031505', N'2', N'130.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Recipe] VALUES (N'201501', N'0105', N'1339', N'0321', N'1', N'659.09')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Recipe] VALUES (N'201501', N'0108', N'1572', N'031501', N'2', N'35.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Recipe] VALUES (N'201501', N'0110', N'0740', N'030903', N'2', N'266.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Recipe] VALUES (N'201501', N'0110', N'1116', N'030903', N'1', N'131.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Recipe] VALUES (N'201501', N'0112', N'0059', N'030906', N'1', N'35.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Recipe] VALUES (N'201501', N'0112', N'0059', N'031501', N'1', N'30.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Recipe] VALUES (N'201501', N'0112', N'0059', N'031503', N'3', N'27.89')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Recipe] VALUES (N'201501', N'0112', N'0702', N'030901', N'1', N'250.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Recipe] VALUES (N'201501', N'0112', N'0702', N'030904', N'4', N'500.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Recipe] VALUES (N'201501', N'0112', N'0702', N'031501', N'2', N'43.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Recipe] VALUES (N'201501', N'0112', N'0702', N'031502', N'4', N'303.89')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Recipe] VALUES (N'201501', N'0112', N'0702', N'031503', N'7', N'67.78')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Recipe] VALUES (N'201501', N'0112', N'0702', N'0320', N'2', N'867.08')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Recipe] VALUES (N'201501', N'0112', N'1263', N'030901', N'1', N'300.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Recipe] VALUES (N'201501', N'0112', N'1263', N'031501', N'3', N'63.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Recipe] VALUES (N'201501', N'0112', N'1654', N'030903', N'1', N'80.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Recipe] VALUES (N'201501', N'0112', N'1654', N'030906', N'1', N'35.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Recipe] VALUES (N'201501', N'0112', N'1654', N'031501', N'2', N'60.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Recipe] VALUES (N'201501', N'0112', N'1654', N'031502', N'1', N'150.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Recipe] VALUES (N'201501', N'0112', N'1654', N'031503', N'7', N'138.89')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Recipe] VALUES (N'201501', N'0112', N'1654', N'0320', N'2', N'777.08')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Recipe] VALUES (N'201501', N'0112', N'2410', N'030906', N'1', N'40.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Recipe] VALUES (N'201501', N'0119', N'0123', N'030903', N'1', N'131.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Recipe] VALUES (N'201501', N'0119', N'1644', N'031501', N'1', N'30.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Recipe] VALUES (N'201501', N'0119', N'1644', N'031502', N'1', N'250.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Recipe] VALUES (N'201501', N'0119', N'1771', N'030901', N'1', N'300.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Recipe] VALUES (N'201501', N'0119', N'1771', N'030903', N'1', N'135.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Recipe] VALUES (N'201501', N'0119', N'1995', N'030903', N'1', N'131.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Recipe] VALUES (N'201501', N'0119', N'2468', N'030903', N'2', N'262.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Recipe] VALUES (N'201501', N'0120', N'0427', N'030901', N'1', N'250.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Recipe] VALUES (N'201501', N'0122', N'0477', N'030903', N'2', N'160.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Recipe] VALUES (N'201501', N'0122', N'0477', N'030904', N'2', N'220.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Recipe] VALUES (N'201501', N'0122', N'0477', N'030906', N'1', N'35.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Recipe] VALUES (N'201501', N'0122', N'0477', N'031501', N'11', N'258.78')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Recipe] VALUES (N'201501', N'0122', N'0477', N'031502', N'1', N'120.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Recipe] VALUES (N'201501', N'0122', N'0477', N'031503', N'11', N'212.78')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Recipe] VALUES (N'201501', N'0127', N'1232', N'031501', N'1', N'30.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Recipe] VALUES (N'201501', N'0127', N'1232', N'031503', N'4', N'111.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Recipe] VALUES (N'201501', N'0127', N'1234', N'030901', N'1', N'300.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Recipe] VALUES (N'201501', N'0127', N'1234', N'030902', N'2', N'1260.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Recipe] VALUES (N'201501', N'0127', N'1863', N'030904', N'1', N'210.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Recipe] VALUES (N'201501', N'0128', N'0191', N'030901', N'1', N'250.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Recipe] VALUES (N'201501', N'0128', N'0191', N'031501', N'1', N'30.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Recipe] VALUES (N'201501', N'0128', N'0191', N'031503', N'3', N'141.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Recipe] VALUES (N'201501', N'0128', N'1990', N'030903', N'2', N'262.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Recipe] VALUES (N'201501', N'0130', N'1998', N'030901', N'1', N'300.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Recipe] VALUES (N'201501', N'0130', N'1998', N'030902', N'1', N'600.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Recipe] VALUES (N'201501', N'0132', N'0175', N'030904', N'1', N'110.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Recipe] VALUES (N'201501', N'0132', N'0175', N'031501', N'2', N'41.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Recipe] VALUES (N'201501', N'0132', N'0175', N'031502', N'1', N'50.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Recipe] VALUES (N'201501', N'0132', N'0175', N'031503', N'8', N'224.89')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Recipe] VALUES (N'201501', N'0133', N'2524', N'030903', N'1', N'80.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Recipe] VALUES (N'201501', N'0133', N'2524', N'030904', N'3', N'330.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Recipe] VALUES (N'201501', N'0133', N'2524', N'031501', N'1', N'65.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Recipe] VALUES (N'201501', N'0135', N'0204', N'031501', N'1', N'30.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Recipe] VALUES (N'201501', N'0135', N'0565', N'031501', N'2', N'60.00')
GO


-- ----------------------------
-- Table structure for Stat_Clin_Doctor_Reg
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Stat_Clin_Doctor_Reg]') AND type IN ('U'))
	DROP TABLE [dbo].[Stat_Clin_Doctor_Reg]
GO

CREATE TABLE [dbo].[Stat_Clin_Doctor_Reg] (
  [StatDate] varchar(8) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [DoctorID] varchar(8) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [RegTypeID] varchar(8) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [Quan] int  NOT NULL
)
GO

ALTER TABLE [dbo].[Stat_Clin_Doctor_Reg] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of Stat_Clin_Doctor_Reg
-- ----------------------------
INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201412', N'0059', N'12', N'1')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201412', N'0059', N'3', N'1')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201412', N'0067', N'7', N'1')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201412', N'0075', N'15', N'1')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201412', N'0090', N'5', N'1')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201412', N'0123', N'12', N'2')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201412', N'0160', N'11', N'1')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201412', N'0160', N'12', N'1')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201412', N'0175', N'12', N'2')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201412', N'0175', N'3', N'2')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201412', N'0191', N'7', N'1')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201412', N'0198', N'12', N'1')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201412', N'0198', N'13', N'1')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201412', N'0204', N'3', N'1')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201412', N'0212', N'12', N'4')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201412', N'0277', N'12', N'1')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201412', N'0277', N'13', N'1')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201412', N'0281', N'13', N'1')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201412', N'0294', N'12', N'2')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201412', N'0369', N'12', N'2')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201412', N'0427', N'12', N'1')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201412', N'0427', N'3', N'1')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201412', N'0436', N'11', N'1')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201412', N'0436', N'3', N'3')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201412', N'0455', N'12', N'1')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201412', N'0477', N'11', N'1')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201412', N'0477', N'12', N'8')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201412', N'0477', N'13', N'2')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201412', N'0477', N'3', N'1')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201412', N'0565', N'3', N'3')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201412', N'0575', N'1', N'1')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201412', N'0575', N'12', N'1')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201412', N'0575', N'3', N'1')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201412', N'0589', N'12', N'5')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201412', N'0598', N'3', N'1')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201412', N'0621', N'1', N'1')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201412', N'0621', N'15', N'1')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201412', N'0621', N'9', N'1')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201412', N'0702', N'12', N'4')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201412', N'0702', N'13', N'2')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201412', N'0702', N'3', N'1')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201412', N'0748', N'12', N'3')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201412', N'0748', N'13', N'1')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201412', N'0748', N'3', N'1')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201412', N'0948', N'12', N'1')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201412', N'1051', N'12', N'1')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201412', N'1055', N'12', N'1')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201412', N'1083', N'7', N'1')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201412', N'1099', N'12', N'1')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201412', N'1102', N'12', N'1')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201412', N'1107', N'12', N'2')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201412', N'1107', N'13', N'2')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201412', N'1107', N'9', N'1')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201412', N'1115', N'12', N'1')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201412', N'1125', N'12', N'1')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201412', N'1127', N'12', N'1')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201412', N'1166', N'13', N'1')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201412', N'1232', N'9', N'1')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201412', N'1263', N'11', N'1')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201412', N'1263', N'3', N'2')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201412', N'1266', N'9', N'1')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201412', N'1310', N'3', N'1')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201412', N'1319', N'9', N'1')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201412', N'1350', N'13', N'1')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201412', N'1394', N'3', N'1')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201412', N'1425', N'9', N'1')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201412', N'1428', N'9', N'1')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201412', N'1537', N'12', N'3')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201412', N'1563', N'12', N'1')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201412', N'1574', N'12', N'3')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201412', N'1574', N'3', N'3')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201412', N'1639', N'12', N'1')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201412', N'1639', N'2', N'1')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201412', N'1654', N'11', N'1')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201412', N'1654', N'12', N'2')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201412', N'1654', N'13', N'1')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201412', N'1654', N'3', N'2')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201412', N'1753', N'3', N'1')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201412', N'1769', N'1', N'1')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201412', N'1770', N'12', N'1')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201412', N'1771', N'3', N'2')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201412', N'1773', N'12', N'2')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201412', N'1773', N'13', N'1')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201412', N'1773', N'3', N'1')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201412', N'1774', N'12', N'1')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201412', N'1775', N'11', N'1')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201412', N'1863', N'12', N'2')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201412', N'1863', N'3', N'2')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201412', N'2413', N'1', N'1')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201412', N'2428', N'12', N'1')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201412', N'2428', N'13', N'1')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201412', N'2428', N'3', N'3')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201412', N'2468', N'12', N'1')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201412', N'2468', N'3', N'4')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201412', N'2524', N'1', N'1')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201412', N'2524', N'14', N'1')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201412', N'2524', N'15', N'1')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201501', N'0059', N'12', N'1')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201501', N'0059', N'13', N'1')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201501', N'0097', N'12', N'1')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201501', N'0123', N'11', N'2')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201501', N'0151', N'12', N'1')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201501', N'0175', N'12', N'3')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201501', N'0175', N'13', N'3')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201501', N'0175', N'3', N'1')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201501', N'0181', N'12', N'1')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201501', N'0191', N'2', N'2')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201501', N'0198', N'12', N'1')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201501', N'0204', N'3', N'1')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201501', N'0212', N'12', N'3')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201501', N'0277', N'11', N'2')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201501', N'0277', N'12', N'2')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201501', N'0277', N'3', N'1')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201501', N'0294', N'12', N'1')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201501', N'0294', N'3', N'1')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201501', N'0427', N'12', N'2')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201501', N'0427', N'3', N'1')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201501', N'0455', N'3', N'1')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201501', N'0477', N'11', N'2')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201501', N'0477', N'12', N'7')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201501', N'0477', N'13', N'3')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201501', N'0477', N'3', N'3')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201501', N'0490', N'12', N'1')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201501', N'0565', N'3', N'5')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201501', N'0575', N'3', N'1')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201501', N'0575', N'9', N'1')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201501', N'0586', N'12', N'1')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201501', N'0589', N'12', N'2')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201501', N'0621', N'9', N'1')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201501', N'0702', N'12', N'1')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201501', N'0702', N'13', N'1')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201501', N'0702', N'3', N'5')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201501', N'0740', N'2', N'2')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201501', N'0748', N'12', N'1')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201501', N'0748', N'13', N'1')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201501', N'0748', N'3', N'1')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201501', N'0948', N'12', N'1')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201501', N'0967', N'13', N'1')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201501', N'1046', N'12', N'1')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201501', N'1107', N'12', N'1')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201501', N'1116', N'9', N'1')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201501', N'1125', N'12', N'2')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201501', N'1127', N'12', N'1')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201501', N'1232', N'15', N'1')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201501', N'1234', N'9', N'1')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201501', N'1263', N'12', N'1')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201501', N'1263', N'3', N'3')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201501', N'1266', N'8', N'1')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201501', N'1266', N'9', N'2')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201501', N'1339', N'1', N'1')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201501', N'1394', N'12', N'1')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201501', N'1394', N'3', N'1')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201501', N'1423', N'8', N'1')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201501', N'1424', N'9', N'1')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201501', N'1474', N'14', N'1')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201501', N'1477', N'12', N'1')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201501', N'1496', N'12', N'1')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201501', N'1537', N'12', N'1')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201501', N'1563', N'12', N'1')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201501', N'1572', N'12', N'1')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201501', N'1572', N'3', N'1')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201501', N'1574', N'3', N'1')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201501', N'1639', N'2', N'1')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201501', N'1643', N'12', N'1')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201501', N'1643', N'13', N'1')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201501', N'1644', N'11', N'1')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201501', N'1644', N'12', N'2')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201501', N'1644', N'3', N'1')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201501', N'1654', N'11', N'1')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201501', N'1654', N'12', N'1')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201501', N'1654', N'3', N'1')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201501', N'1757', N'12', N'1')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201501', N'1766', N'9', N'1')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201501', N'1771', N'12', N'4')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201501', N'1771', N'3', N'1')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201501', N'1779', N'13', N'1')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201501', N'1782', N'12', N'1')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201501', N'1863', N'15', N'1')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201501', N'1990', N'1', N'1')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201501', N'1995', N'12', N'2')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201501', N'1995', N'3', N'2')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201501', N'1998', N'3', N'1')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201501', N'2410', N'12', N'1')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201501', N'2468', N'12', N'3')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201501', N'2468', N'3', N'2')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201501', N'2524', N'14', N'1')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Reg] VALUES (N'201501', N'2524', N'15', N'1')
GO


-- ----------------------------
-- Table structure for Stat_Clin_Doctor_Stat
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Stat_Clin_Doctor_Stat]') AND type IN ('U'))
	DROP TABLE [dbo].[Stat_Clin_Doctor_Stat]
GO

CREATE TABLE [dbo].[Stat_Clin_Doctor_Stat] (
  [StatDate] varchar(8) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [DoctorID] varchar(8) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [StatTypeID] varchar(8) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [SumPrice] numeric(18,2)  NOT NULL
)
GO

ALTER TABLE [dbo].[Stat_Clin_Doctor_Stat] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of Stat_Clin_Doctor_Stat
-- ----------------------------
INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'', N'21', N'4510.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'0059', N'06', N'.89')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'0059', N'10', N'3.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'0059', N'1001', N'58.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'0059', N'1003', N'59.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'0067', N'010101', N'730.50')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'0075', N'0402', N'600.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'0123', N'0101', N'459.06')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'0123', N'010101', N'17.03')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'0123', N'05', N'220.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'0123', N'06', N'294.97')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'0160', N'0101', N'424.58')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'0160', N'010101', N'291.99')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'0175', N'0101', N'451.59')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'0175', N'010101', N'1026.68')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'0175', N'0201', N'164.48')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'0175', N'020101', N'96.08')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'0175', N'06', N'3.56')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'0175', N'10', N'12.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'0175', N'1001', N'58.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'0175', N'1002', N'100.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'0175', N'1003', N'160.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'0198', N'0101', N'627.36')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'0204', N'0101', N'8.80')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'0204', N'010101', N'45.51')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'0212', N'0101', N'1866.28')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'0212', N'010101', N'276.25')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'0212', N'0201', N'323.40')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'0212', N'020101', N'320.39')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'0277', N'010101', N'1.80')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'0277', N'06', N'19.26')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'0281', N'0101', N'783.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'0281', N'06', N'3.25')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'0281', N'10', N'3.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'0281', N'1001', N'30.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'0281', N'1002', N'150.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'0281', N'1006', N'100.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'0294', N'0101', N'103.64')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'0369', N'21', N'132.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'0427', N'0101', N'236.99')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'0427', N'010101', N'91.02')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'0436', N'010101', N'68.03')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'0436', N'06', N'236.89')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'0436', N'1005', N'180.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'0455', N'06', N'395.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'0477', N'0101', N'2313.29')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'0477', N'010101', N'1593.74')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'0477', N'010201', N'169.32')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'0477', N'0201', N'193.55')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'0477', N'020101', N'604.24')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'0477', N'06', N'49.04')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'0477', N'10', N'3.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'0477', N'1002', N'25.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'0477', N'1003', N'30.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'0565', N'0101', N'212.94')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'0565', N'010101', N'28.52')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'0565', N'05', N'110.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'0565', N'06', N'31.58')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'0565', N'10', N'.30')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'0565', N'1001', N'30.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'0565', N'1002', N'25.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'0575', N'0101', N'29.04')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'0575', N'020101', N'81.76')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'0575', N'0401', N'375.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'0575', N'0403', N'80.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'0575', N'05', N'210.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'0575', N'1002', N'30.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'0589', N'07', N'11645.40')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'0598', N'0403', N'135.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'0598', N'06', N'1127.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'0621', N'0101', N'8.29')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'0621', N'06', N'570.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'0702', N'0101', N'1562.78')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'0702', N'010101', N'120.98')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'0702', N'0401', N'250.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'0702', N'0403', N'160.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'0702', N'06', N'266.10')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'0702', N'11', N'12.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'0702', N'14', N'10.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'0748', N'0101', N'1617.59')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'0748', N'010101', N'440.50')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'0748', N'0201', N'940.30')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'0748', N'020101', N'452.84')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'0748', N'0202', N'266.48')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'0748', N'06', N'20.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'1051', N'0101', N'318.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'1055', N'1003', N'82.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'1083', N'0101', N'105.94')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'1083', N'010101', N'177.63')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'1099', N'0101', N'732.49')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'1099', N'010101', N'237.69')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'1102', N'010101', N'.41')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'1107', N'0101', N'2138.96')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'1107', N'010101', N'518.52')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'1107', N'020101', N'554.15')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'1107', N'06', N'.89')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'1107', N'10', N'3.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'1107', N'1003', N'135.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'1107', N'1006', N'50.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'1115', N'06', N'530.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'1127', N'21', N'13.90')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'1166', N'0101', N'152.65')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'1232', N'1001', N'30.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'1232', N'1003', N'79.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'1263', N'0101', N'400.24')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'1263', N'010101', N'9.98')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'1263', N'0401', N'250.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'1263', N'06', N'21.62')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'1266', N'06', N'180.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'1310', N'0402', N'600.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'1310', N'06', N'35.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'1319', N'06', N'60.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'1350', N'0101', N'8.40')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'1394', N'06', N'288.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'1425', N'0201', N'472.42')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'1425', N'06', N'700.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'1428', N'0403', N'131.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'1428', N'06', N'60.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'1537', N'21', N'100.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'1563', N'21', N'281.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'1574', N'0101', N'139.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'1574', N'010101', N'206.15')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'1574', N'0403', N'80.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'1574', N'05', N'330.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'1574', N'06', N'37.12')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'1574', N'10', N'3.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'1574', N'1001', N'45.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'1574', N'1003', N'73.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'1639', N'0401', N'250.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'1654', N'0101', N'568.84')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'1654', N'010101', N'267.29')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'1654', N'0201', N'36.80')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'1654', N'0401', N'625.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'1654', N'0403', N'80.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'1654', N'05', N'35.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'1654', N'06', N'45.09')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'1654', N'10', N'3.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'1654', N'1001', N'60.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'1654', N'1002', N'50.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'1769', N'0101', N'441.06')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'1769', N'010101', N'15.66')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'1769', N'06', N'1248.75')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'1769', N'08', N'40.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'1769', N'11', N'4.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'1770', N'0101', N'302.12')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'1771', N'0102', N'131.42')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'1771', N'0201', N'72.68')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'1771', N'0403', N'270.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'1771', N'06', N'35.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'1773', N'0101', N'2204.12')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'1773', N'010101', N'256.22')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'1773', N'0201', N'267.60')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'1773', N'020101', N'58.60')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'1773', N'06', N'.89')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'1773', N'10', N'3.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'1773', N'1003', N'30.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'1775', N'0101', N'783.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'1775', N'0201', N'125.76')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'1775', N'05', N'110.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'1775', N'06', N'2.89')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'1775', N'10', N'3.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'1775', N'1001', N'30.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'1775', N'1002', N'80.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'1775', N'1003', N'102.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'1863', N'0101', N'1342.19')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'1863', N'010101', N'185.60')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'1863', N'05', N'280.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'1863', N'06', N'49.04')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'1863', N'10', N'3.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'1863', N'1003', N'32.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'2413', N'06', N'30.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'2428', N'0101', N'294.12')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'2428', N'010101', N'120.86')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'2428', N'0102', N'197.13')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'2428', N'0403', N'135.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'2428', N'06', N'50.51')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'2468', N'0101', N'425.45')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'2468', N'010101', N'13.08')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'2468', N'0201', N'88.69')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'2468', N'0401', N'300.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'2468', N'06', N'30.55')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'2468', N'1002', N'25.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'2524', N'0101', N'59.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'2524', N'0102', N'82.80')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'2524', N'0201', N'48.43')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'2524', N'05', N'490.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'2524', N'06', N'1141.78')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'2524', N'10', N'6.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'2524', N'1001', N'195.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'2524', N'1002', N'350.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201412', N'2524', N'1005', N'30.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'', N'21', N'1829.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'0059', N'0101', N'976.38')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'0059', N'010101', N'78.55')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'0059', N'0102', N'114.66')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'0059', N'05', N'35.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'0059', N'06', N'41.07')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'0059', N'10', N'3.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'0059', N'1001', N'30.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'0059', N'1003', N'24.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'0097', N'0101', N'316.20')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'0123', N'0101', N'477.14')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'0123', N'010101', N'299.24')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'0123', N'0102', N'65.71')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'0123', N'0403', N'131.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'0123', N'06', N'362.87')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'0123', N'08', N'30.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'0175', N'0101', N'526.33')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'0175', N'010101', N'806.13')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'0175', N'0201', N'181.58')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'0175', N'020101', N'148.56')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'0175', N'05', N'110.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'0175', N'06', N'.89')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'0175', N'10', N'3.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'0175', N'1001', N'41.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'0175', N'1002', N'50.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'0175', N'1003', N'221.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'0191', N'0201', N'151.90')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'0191', N'0401', N'250.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'0191', N'1001', N'30.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'0191', N'1003', N'91.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'0191', N'1006', N'50.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'0198', N'0101', N'374.22')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'0198', N'010101', N'28.01')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'0198', N'0102', N'1045.66')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'0204', N'0101', N'229.84')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'0204', N'010101', N'22.79')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'0204', N'06', N'30.94')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'0204', N'1001', N'30.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'0212', N'0101', N'222.96')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'0212', N'0201', N'193.55')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'0277', N'0101', N'1.74')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'0277', N'010101', N'731.26')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'0277', N'0201', N'36.34')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'0277', N'06', N'55.49')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'0294', N'0101', N'51.82')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'0294', N'0201', N'175.95')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'0294', N'06', N'56.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'0427', N'0101', N'2.10')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'0427', N'0401', N'250.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'0427', N'06', N'600.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'0455', N'06', N'150.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'0477', N'0101', N'2554.91')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'0477', N'010101', N'1694.98')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'0477', N'010201', N'141.10')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'0477', N'0201', N'272.28')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'0477', N'020101', N'791.94')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'0477', N'0403', N'160.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'0477', N'05', N'255.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'0477', N'06', N'129.52')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'0477', N'10', N'12.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'0477', N'1001', N'251.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'0477', N'1002', N'120.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'0477', N'1003', N'205.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'0490', N'21', N'100.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'0565', N'0101', N'773.42')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'0565', N'010101', N'111.08')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'0565', N'0102', N'238.96')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'0565', N'06', N'172.62')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'0565', N'1001', N'60.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'0575', N'0101', N'438.06')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'0575', N'010101', N'136.53')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'0586', N'0101', N'617.31')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'0589', N'07', N'1378.08')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'0589', N'0701', N'234.36')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'0621', N'010101', N'1.19')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'0621', N'06', N'20.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'0621', N'07', N'80.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'0621', N'08', N'30.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'0667', N'06', N'79.50')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'0693', N'06', N'100.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'0702', N'0101', N'139.44')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'0702', N'010101', N'221.18')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'0702', N'0401', N'250.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'0702', N'05', N'790.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'0702', N'06', N'582.54')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'0702', N'08', N'20.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'0702', N'10', N'9.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'0702', N'1001', N'43.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'0702', N'1002', N'200.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'0702', N'1003', N'60.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'0702', N'1006', N'100.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'0702', N'11', N'54.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'0740', N'0403', N'266.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'0748', N'0201', N'363.40')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'0748', N'0202', N'1717.83')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'0967', N'0101', N'702.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'1107', N'0101', N'171.40')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'1107', N'010101', N'88.81')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'1107', N'020101', N'150.65')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'1116', N'0403', N'131.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'1125', N'21', N'155.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'1127', N'21', N'150.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'1232', N'0101', N'96.88')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'1232', N'1001', N'30.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'1232', N'1003', N'111.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'1234', N'0401', N'300.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'1234', N'0402', N'1260.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'1263', N'0101', N'118.28')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'1263', N'010101', N'196.59')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'1263', N'0401', N'300.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'1263', N'06', N'13.65')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'1263', N'1001', N'63.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'1266', N'0403', N'30.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'1266', N'06', N'1416.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'1339', N'010101', N'7.29')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'1339', N'05', N'410.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'1339', N'06', N'425.09')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'1339', N'1005', N'130.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'1339', N'11', N'4.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'1394', N'06', N'36.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'1394', N'1006', N'400.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'1424', N'06', N'154.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'1477', N'0101', N'220.08')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'1499', N'06', N'410.40')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'1537', N'21', N'20.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'1563', N'21', N'293.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'1572', N'010101', N'84.61')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'1572', N'1001', N'35.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'1574', N'010101', N'116.20')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'1574', N'06', N'19.26')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'1575', N'06', N'100.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'1643', N'0101', N'493.54')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'1643', N'0201', N'241.05')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'1643', N'020101', N'72.78')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'1644', N'010101', N'5.50')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'1644', N'1001', N'30.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'1644', N'1002', N'150.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'1644', N'1006', N'100.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'1654', N'010101', N'98.34')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'1654', N'0403', N'80.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'1654', N'05', N'245.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'1654', N'06', N'417.63')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'1654', N'08', N'20.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'1654', N'10', N'3.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'1654', N'1001', N'60.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'1654', N'1002', N'180.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'1654', N'1003', N'135.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'1654', N'11', N'2.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'1766', N'0101', N'8.29')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'1766', N'06', N'20.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'1766', N'07', N'30.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'1766', N'08', N'30.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'1771', N'0101', N'425.95')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'1771', N'010101', N'3.41')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'1771', N'0401', N'300.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'1771', N'0403', N'135.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'1771', N'06', N'13.72')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'1779', N'020101', N'396.70')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'1779', N'06', N'15.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'1782', N'0101', N'617.98')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'1782', N'010101', N'44.16')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'1782', N'0201', N'267.60')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'1782', N'26', N'2524.20')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'1863', N'05', N'210.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'1990', N'0101', N'57.60')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'1990', N'0403', N'262.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'1995', N'0101', N'127.85')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'1995', N'0102', N'65.71')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'1995', N'020101', N'39.67')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'1995', N'0403', N'131.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'1995', N'06', N'520.76')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'1998', N'0401', N'300.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'1998', N'0402', N'600.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'1998', N'06', N'40.56')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'2410', N'0101', N'331.02')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'2410', N'010101', N'18.16')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'2410', N'05', N'40.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'2410', N'06', N'105.73')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'2410', N'11', N'12.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'2468', N'0101', N'27.17')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'2468', N'010101', N'6.82')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'2468', N'0102', N'65.71')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'2468', N'0201', N'76.82')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'2468', N'0403', N'262.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'2468', N'06', N'67.44')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'2524', N'0101', N'105.65')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'2524', N'010101', N'3.60')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'2524', N'0403', N'80.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'2524', N'05', N'510.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'2524', N'06', N'120.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'2524', N'1001', N'55.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Stat] VALUES (N'201501', N'2524', N'1005', N'10.00')
GO


-- ----------------------------
-- Table structure for Stat_Clin_Doctor_Work
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Stat_Clin_Doctor_Work]') AND type IN ('U'))
	DROP TABLE [dbo].[Stat_Clin_Doctor_Work]
GO

CREATE TABLE [dbo].[Stat_Clin_Doctor_Work] (
  [StatDate] varchar(8) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [OfficeID] varchar(8) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [DoctorID] varchar(8) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [RegCount] int  NULL,
  [RecipeCount] int  NULL,
  [RecipePrice] numeric(18,2)  NULL,
  [MedicinePrice] numeric(18,2)  NULL
)
GO

ALTER TABLE [dbo].[Stat_Clin_Doctor_Work] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of Stat_Clin_Doctor_Work
-- ----------------------------
INSERT INTO [dbo].[Stat_Clin_Doctor_Work] VALUES (N'201412', N'0104', N'0160', N'2', N'2', N'716.57', N'716.57')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Work] VALUES (N'201412', N'0104', N'1083', N'1', N'1', N'283.57', N'283.57')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Work] VALUES (N'201412', N'0104', N'1107', N'5', N'20', N'3400.52', N'3211.63')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Work] VALUES (N'201412', N'0105', N'0575', N'3', N'6', N'805.80', N'110.80')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Work] VALUES (N'201412', N'0105', N'1051', N'1', N'2', N'318.00', N'318.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Work] VALUES (N'201412', N'0107', N'0198', N'2', N'2', N'627.36', N'627.36')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Work] VALUES (N'201412', N'0107', N'1166', N'1', N'1', N'152.65', N'152.65')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Work] VALUES (N'201412', N'0107', N'1770', N'1', N'1', N'302.12', N'302.12')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Work] VALUES (N'201412', N'0108', N'0281', N'1', N'6', N'1069.25', N'783.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Work] VALUES (N'201412', N'0108', N'1102', N'1', N'1', N'.41', N'.41')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Work] VALUES (N'201412', N'0108', N'1775', N'1', N'10', N'1236.65', N'908.76')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Work] VALUES (N'201412', N'0110', N'1428', N'1', N'2', N'191.00', N'.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Work] VALUES (N'201412', N'0111', N'0589', N'4', N'5', N'11645.40', N'.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Work] VALUES (N'201412', N'0112', N'0277', N'2', N'3', N'21.06', N'1.80')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Work] VALUES (N'201412', N'0112', N'0702', N'7', N'21', N'2381.86', N'1683.76')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Work] VALUES (N'201412', N'0112', N'1263', N'2', N'4', N'681.84', N'410.22')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Work] VALUES (N'201412', N'0112', N'1574', N'4', N'14', N'913.27', N'345.15')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Work] VALUES (N'201412', N'0112', N'1654', N'5', N'19', N'1521.02', N'872.93')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Work] VALUES (N'201412', N'0113', N'0455', N'1', N'1', N'395.00', N'.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Work] VALUES (N'201412', N'0113', N'0598', N'2', N'3', N'1262.00', N'.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Work] VALUES (N'201412', N'0114', N'0621', N'3', N'3', N'578.29', N'8.29')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Work] VALUES (N'201412', N'0114', N'1266', N'1', N'1', N'180.00', N'.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Work] VALUES (N'201412', N'0114', N'1319', N'1', N'1', N'60.00', N'.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Work] VALUES (N'201412', N'0114', N'1425', N'1', N'4', N'1172.42', N'472.42')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Work] VALUES (N'201412', N'0115', N'0212', N'4', N'10', N'2786.32', N'2786.32')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Work] VALUES (N'201412', N'0116', N'1099', N'1', N'2', N'970.18', N'970.18')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Work] VALUES (N'201412', N'0119', N'0123', N'2', N'8', N'991.06', N'476.09')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Work] VALUES (N'201412', N'0119', N'1654', N'1', N'1', N'250.00', N'.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Work] VALUES (N'201412', N'0119', N'1771', N'2', N'5', N'509.10', N'204.10')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Work] VALUES (N'201412', N'0119', N'2428', N'5', N'8', N'797.62', N'612.11')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Work] VALUES (N'201412', N'0119', N'2468', N'5', N'8', N'882.77', N'527.22')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Work] VALUES (N'201412', N'0120', N'0294', N'1', N'1', N'103.64', N'103.64')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Work] VALUES (N'201412', N'0120', N'0427', N'2', N'2', N'328.01', N'328.01')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Work] VALUES (N'201412', N'0122', N'0059', N'1', N'6', N'120.89', N'.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Work] VALUES (N'201412', N'0122', N'0477', N'11', N'24', N'4981.18', N'4874.14')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Work] VALUES (N'201412', N'0122', N'1115', N'1', N'1', N'530.00', N'.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Work] VALUES (N'201412', N'0123', N'0436', N'4', N'7', N'484.92', N'68.03')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Work] VALUES (N'201412', N'0123', N'1394', N'1', N'1', N'288.00', N'.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Work] VALUES (N'201412', N'0124', N'0067', N'1', N'1', N'730.50', N'730.50')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Work] VALUES (N'201412', N'0127', N'1232', N'1', N'4', N'109.00', N'.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Work] VALUES (N'201412', N'0127', N'1863', N'4', N'13', N'1891.83', N'1527.79')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Work] VALUES (N'201412', N'0129', N'0075', N'1', N'1', N'600.00', N'.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Work] VALUES (N'201412', N'0130', N'1310', N'1', N'2', N'635.00', N'.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Work] VALUES (N'201412', N'0130', N'1639', N'1', N'1', N'250.00', N'.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Work] VALUES (N'201412', N'0132', N'0175', N'4', N'22', N'2072.39', N'1738.83')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Work] VALUES (N'201412', N'0132', N'1055', N'1', N'3', N'82.00', N'.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Work] VALUES (N'201412', N'0132', N'1773', N'3', N'12', N'2820.43', N'2786.54')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Work] VALUES (N'201412', N'0133', N'1769', N'1', N'7', N'1749.47', N'456.72')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Work] VALUES (N'201412', N'0133', N'2413', N'1', N'1', N'30.00', N'.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Work] VALUES (N'201412', N'0133', N'2524', N'3', N'21', N'2403.01', N'190.23')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Work] VALUES (N'201412', N'0135', N'0204', N'1', N'1', N'54.31', N'54.31')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Work] VALUES (N'201412', N'0135', N'0565', N'3', N'8', N'438.34', N'241.46')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Work] VALUES (N'201412', N'0135', N'1563', N'1', N'4', N'281.00', N'.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Work] VALUES (N'201412', N'0137', N'1350', N'1', N'1', N'8.40', N'8.40')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Work] VALUES (N'201412', N'0139', N'0748', N'4', N'14', N'3737.71', N'3717.71')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Work] VALUES (N'201412', N'0147', N'', N'13', N'13', N'4510.00', N'.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Work] VALUES (N'201412', N'0147', N'0369', N'2', N'2', N'132.00', N'.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Work] VALUES (N'201412', N'0147', N'1127', N'1', N'1', N'13.90', N'.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Work] VALUES (N'201412', N'0147', N'1537', N'2', N'2', N'100.00', N'.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Work] VALUES (N'201501', N'0104', N'1107', N'1', N'2', N'410.86', N'410.86')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Work] VALUES (N'201501', N'0105', N'0575', N'2', N'3', N'574.59', N'574.59')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Work] VALUES (N'201501', N'0105', N'1339', N'1', N'5', N'976.38', N'7.29')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Work] VALUES (N'201501', N'0107', N'0198', N'1', N'2', N'1447.89', N'1447.89')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Work] VALUES (N'201501', N'0107', N'0586', N'1', N'1', N'617.31', N'617.31')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Work] VALUES (N'201501', N'0108', N'0097', N'1', N'1', N'316.20', N'316.20')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Work] VALUES (N'201501', N'0108', N'1572', N'1', N'3', N'119.61', N'84.61')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Work] VALUES (N'201501', N'0110', N'0740', N'2', N'2', N'266.00', N'.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Work] VALUES (N'201501', N'0110', N'1116', N'1', N'1', N'131.00', N'.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Work] VALUES (N'201501', N'0110', N'1499', N'1', N'1', N'410.40', N'.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Work] VALUES (N'201501', N'0110', N'1575', N'1', N'1', N'100.00', N'.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Work] VALUES (N'201501', N'0110', N'1779', N'1', N'3', N'411.70', N'396.70')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Work] VALUES (N'201501', N'0111', N'0589', N'1', N'1', N'1612.44', N'.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Work] VALUES (N'201501', N'0112', N'0059', N'2', N'13', N'1302.66', N'1169.59')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Work] VALUES (N'201501', N'0112', N'0277', N'4', N'9', N'824.83', N'769.34')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Work] VALUES (N'201501', N'0112', N'0702', N'6', N'27', N'2469.16', N'360.62')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Work] VALUES (N'201501', N'0112', N'1263', N'3', N'9', N'691.52', N'314.87')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Work] VALUES (N'201501', N'0112', N'1574', N'1', N'2', N'135.46', N'116.20')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Work] VALUES (N'201501', N'0112', N'1654', N'3', N'14', N'1240.97', N'98.34')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Work] VALUES (N'201501', N'0112', N'2410', N'2', N'5', N'506.91', N'349.18')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Work] VALUES (N'201501', N'0113', N'0455', N'1', N'1', N'150.00', N'.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Work] VALUES (N'201501', N'0114', N'0621', N'1', N'2', N'131.19', N'1.19')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Work] VALUES (N'201501', N'0114', N'1266', N'3', N'3', N'1446.00', N'.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Work] VALUES (N'201501', N'0114', N'1424', N'1', N'1', N'154.00', N'.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Work] VALUES (N'201501', N'0114', N'1766', N'1', N'2', N'88.29', N'8.29')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Work] VALUES (N'201501', N'0115', N'0212', N'2', N'3', N'416.51', N'416.51')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Work] VALUES (N'201501', N'0116', N'0693', N'1', N'1', N'100.00', N'.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Work] VALUES (N'201501', N'0119', N'0123', N'3', N'10', N'1365.96', N'842.09')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Work] VALUES (N'201501', N'0119', N'1644', N'2', N'3', N'285.50', N'5.50')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Work] VALUES (N'201501', N'0119', N'1771', N'4', N'5', N'878.08', N'429.36')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Work] VALUES (N'201501', N'0119', N'1995', N'3', N'7', N'884.99', N'233.23')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Work] VALUES (N'201501', N'0119', N'2468', N'3', N'10', N'505.96', N'176.52')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Work] VALUES (N'201501', N'0120', N'0294', N'2', N'3', N'283.77', N'227.77')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Work] VALUES (N'201501', N'0120', N'0427', N'3', N'3', N'852.10', N'2.10')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Work] VALUES (N'201501', N'0121', N'1477', N'1', N'1', N'220.08', N'220.08')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Work] VALUES (N'201501', N'0122', N'0477', N'16', N'58', N'6587.73', N'5455.21')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Work] VALUES (N'201501', N'0123', N'1394', N'1', N'1', N'436.00', N'.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Work] VALUES (N'201501', N'0124', N'0967', N'1', N'1', N'702.00', N'702.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Work] VALUES (N'201501', N'0127', N'1232', N'1', N'6', N'237.88', N'96.88')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Work] VALUES (N'201501', N'0127', N'1234', N'1', N'3', N'1560.00', N'.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Work] VALUES (N'201501', N'0127', N'1863', N'1', N'1', N'210.00', N'.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Work] VALUES (N'201501', N'0128', N'0191', N'1', N'6', N'572.90', N'151.90')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Work] VALUES (N'201501', N'0128', N'1990', N'1', N'3', N'319.60', N'57.60')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Work] VALUES (N'201501', N'0130', N'1998', N'1', N'3', N'940.56', N'.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Work] VALUES (N'201501', N'0132', N'0175', N'7', N'17', N'2088.49', N'1662.60')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Work] VALUES (N'201501', N'0132', N'1643', N'2', N'5', N'807.37', N'807.37')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Work] VALUES (N'201501', N'0132', N'1782', N'1', N'4', N'3453.94', N'929.74')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Work] VALUES (N'201501', N'0133', N'2524', N'2', N'10', N'884.25', N'109.25')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Work] VALUES (N'201501', N'0135', N'0204', N'1', N'4', N'313.57', N'252.63')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Work] VALUES (N'201501', N'0135', N'0565', N'5', N'14', N'1356.08', N'1123.46')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Work] VALUES (N'201501', N'0135', N'1563', N'1', N'5', N'293.00', N'.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Work] VALUES (N'201501', N'0139', N'0748', N'3', N'3', N'2081.23', N'2081.23')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Work] VALUES (N'201501', N'0147', N'', N'6', N'6', N'1829.00', N'.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Work] VALUES (N'201501', N'0147', N'0490', N'1', N'1', N'100.00', N'.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Work] VALUES (N'201501', N'0147', N'1125', N'2', N'2', N'155.00', N'.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Work] VALUES (N'201501', N'0147', N'1127', N'1', N'1', N'150.00', N'.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Work] VALUES (N'201501', N'0147', N'1537', N'1', N'1', N'20.00', N'.00')
GO

INSERT INTO [dbo].[Stat_Clin_Doctor_Work] VALUES (N'201501', N'0160', N'0667', N'1', N'1', N'79.50', N'.00')
GO


-- ----------------------------
-- Table structure for Stat_Clin_Fee_ClinOffice
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Stat_Clin_Fee_ClinOffice]') AND type IN ('U'))
	DROP TABLE [dbo].[Stat_Clin_Fee_ClinOffice]
GO

CREATE TABLE [dbo].[Stat_Clin_Fee_ClinOffice] (
  [StatDate] varchar(8) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [OfficeID] varchar(8) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [StatTypeID] varchar(8) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [SumPrice] numeric(18,2)  NULL
)
GO

ALTER TABLE [dbo].[Stat_Clin_Fee_ClinOffice] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of Stat_Clin_Fee_ClinOffice
-- ----------------------------
INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201412', N'0104', N'0101', N'2669.48')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201412', N'0104', N'010101', N'988.14')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201412', N'0104', N'020101', N'554.15')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201412', N'0104', N'06', N'.89')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201412', N'0104', N'10', N'3.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201412', N'0104', N'1003', N'135.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201412', N'0104', N'1006', N'50.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201412', N'0105', N'0101', N'347.04')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201412', N'0105', N'020101', N'81.76')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201412', N'0105', N'0401', N'375.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201412', N'0105', N'0403', N'80.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201412', N'0105', N'05', N'210.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201412', N'0105', N'1002', N'30.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201412', N'0107', N'0101', N'1082.13')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201412', N'0108', N'0101', N'1566.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201412', N'0108', N'010101', N'.41')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201412', N'0108', N'0201', N'125.76')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201412', N'0108', N'05', N'110.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201412', N'0108', N'06', N'6.14')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201412', N'0108', N'10', N'6.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201412', N'0108', N'1001', N'60.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201412', N'0108', N'1002', N'230.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201412', N'0108', N'1003', N'102.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201412', N'0108', N'1006', N'100.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201412', N'0110', N'0403', N'131.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201412', N'0110', N'06', N'60.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201412', N'0111', N'07', N'11645.40')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201412', N'0112', N'0101', N'2670.86')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201412', N'0112', N'010101', N'606.20')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201412', N'0112', N'0201', N'36.80')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201412', N'0112', N'0401', N'875.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201412', N'0112', N'0403', N'320.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201412', N'0112', N'05', N'365.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201412', N'0112', N'06', N'389.19')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201412', N'0112', N'10', N'6.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201412', N'0112', N'1001', N'105.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201412', N'0112', N'1002', N'50.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201412', N'0112', N'1003', N'73.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201412', N'0112', N'11', N'12.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201412', N'0112', N'14', N'10.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201412', N'0113', N'0403', N'135.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201412', N'0113', N'06', N'1522.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201412', N'0114', N'0101', N'8.29')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201412', N'0114', N'0201', N'472.42')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201412', N'0114', N'06', N'1510.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201412', N'0115', N'0101', N'1866.28')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201412', N'0115', N'010101', N'276.25')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201412', N'0115', N'0201', N'323.40')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201412', N'0115', N'020101', N'320.39')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201412', N'0116', N'0101', N'732.49')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201412', N'0116', N'010101', N'237.69')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201412', N'0119', N'0101', N'1178.63')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201412', N'0119', N'010101', N'150.97')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201412', N'0119', N'0102', N'328.55')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201412', N'0119', N'0201', N'161.37')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201412', N'0119', N'0401', N'550.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201412', N'0119', N'0403', N'405.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201412', N'0119', N'05', N'220.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201412', N'0119', N'06', N'411.03')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201412', N'0119', N'1002', N'25.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201412', N'0120', N'0101', N'340.63')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201412', N'0120', N'010101', N'91.02')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201412', N'0122', N'0101', N'2313.29')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201412', N'0122', N'010101', N'1593.74')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201412', N'0122', N'010201', N'169.32')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201412', N'0122', N'0201', N'193.55')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201412', N'0122', N'020101', N'604.24')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201412', N'0122', N'06', N'579.93')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201412', N'0122', N'10', N'6.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201412', N'0122', N'1001', N'58.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201412', N'0122', N'1002', N'25.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201412', N'0122', N'1003', N'89.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201412', N'0123', N'010101', N'68.03')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201412', N'0123', N'06', N'524.89')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201412', N'0123', N'1005', N'180.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201412', N'0124', N'010101', N'730.50')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201412', N'0127', N'0101', N'1342.19')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201412', N'0127', N'010101', N'185.60')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201412', N'0127', N'05', N'280.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201412', N'0127', N'06', N'49.04')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201412', N'0127', N'10', N'3.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201412', N'0127', N'1001', N'30.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201412', N'0127', N'1003', N'111.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201412', N'0129', N'0402', N'600.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201412', N'0130', N'0401', N'250.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201412', N'0130', N'0402', N'600.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201412', N'0130', N'06', N'35.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201412', N'0132', N'0101', N'2655.71')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201412', N'0132', N'010101', N'1282.90')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201412', N'0132', N'0201', N'432.08')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201412', N'0132', N'020101', N'154.68')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201412', N'0132', N'06', N'4.45')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201412', N'0132', N'10', N'15.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201412', N'0132', N'1001', N'58.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201412', N'0132', N'1002', N'100.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201412', N'0132', N'1003', N'272.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201412', N'0133', N'0101', N'500.06')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201412', N'0133', N'010101', N'15.66')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201412', N'0133', N'0102', N'82.80')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201412', N'0133', N'0201', N'48.43')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201412', N'0133', N'05', N'490.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201412', N'0133', N'06', N'2420.53')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201412', N'0133', N'08', N'40.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201412', N'0133', N'10', N'6.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201412', N'0133', N'1001', N'195.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201412', N'0133', N'1002', N'350.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201412', N'0133', N'1005', N'30.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201412', N'0133', N'11', N'4.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201412', N'0135', N'0101', N'221.74')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201412', N'0135', N'010101', N'74.03')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201412', N'0135', N'05', N'110.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201412', N'0135', N'06', N'31.58')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201412', N'0135', N'10', N'.30')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201412', N'0135', N'1001', N'30.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201412', N'0135', N'1002', N'25.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201412', N'0135', N'21', N'281.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201412', N'0137', N'0101', N'8.40')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201412', N'0139', N'0101', N'1617.59')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201412', N'0139', N'010101', N'440.50')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201412', N'0139', N'0201', N'940.30')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201412', N'0139', N'020101', N'452.84')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201412', N'0139', N'0202', N'266.48')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201412', N'0139', N'06', N'20.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201412', N'0147', N'21', N'4755.90')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201501', N'0104', N'0101', N'171.40')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201501', N'0104', N'010101', N'88.81')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201501', N'0104', N'020101', N'150.65')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201501', N'0105', N'0101', N'438.06')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201501', N'0105', N'010101', N'143.82')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201501', N'0105', N'05', N'410.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201501', N'0105', N'06', N'425.09')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201501', N'0105', N'1005', N'130.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201501', N'0105', N'11', N'4.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201501', N'0107', N'0101', N'991.53')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201501', N'0107', N'010101', N'28.01')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201501', N'0107', N'0102', N'1045.66')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201501', N'0108', N'0101', N'316.20')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201501', N'0108', N'010101', N'84.61')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201501', N'0108', N'1001', N'35.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201501', N'0110', N'020101', N'396.70')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201501', N'0110', N'0403', N'397.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201501', N'0110', N'06', N'525.40')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201501', N'0111', N'07', N'1378.08')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201501', N'0111', N'0701', N'234.36')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201501', N'0112', N'0101', N'1566.86')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201501', N'0112', N'010101', N'1460.28')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201501', N'0112', N'0102', N'114.66')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201501', N'0112', N'0201', N'36.34')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201501', N'0112', N'0401', N'550.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201501', N'0112', N'0403', N'80.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201501', N'0112', N'05', N'1110.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201501', N'0112', N'06', N'1235.37')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201501', N'0112', N'08', N'40.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201501', N'0112', N'10', N'15.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201501', N'0112', N'1001', N'196.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201501', N'0112', N'1002', N'380.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201501', N'0112', N'1003', N'219.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201501', N'0112', N'1006', N'100.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201501', N'0112', N'11', N'68.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201501', N'0113', N'06', N'150.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201501', N'0114', N'0101', N'8.29')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201501', N'0114', N'010101', N'1.19')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201501', N'0114', N'0403', N'30.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201501', N'0114', N'06', N'1610.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201501', N'0114', N'07', N'110.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201501', N'0114', N'08', N'60.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201501', N'0115', N'0101', N'222.96')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201501', N'0115', N'0201', N'193.55')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201501', N'0116', N'06', N'100.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201501', N'0119', N'0101', N'1058.11')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201501', N'0119', N'010101', N'314.97')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201501', N'0119', N'0102', N'197.13')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201501', N'0119', N'0201', N'76.82')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201501', N'0119', N'020101', N'39.67')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201501', N'0119', N'0401', N'300.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201501', N'0119', N'0403', N'659.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201501', N'0119', N'06', N'964.79')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201501', N'0119', N'08', N'30.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201501', N'0119', N'1001', N'30.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201501', N'0119', N'1002', N'150.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201501', N'0119', N'1006', N'100.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201501', N'0120', N'0101', N'53.92')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201501', N'0120', N'0201', N'175.95')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201501', N'0120', N'0401', N'250.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201501', N'0120', N'06', N'656.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201501', N'0121', N'0101', N'220.08')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201501', N'0122', N'0101', N'2554.91')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201501', N'0122', N'010101', N'1694.98')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201501', N'0122', N'010201', N'141.10')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201501', N'0122', N'0201', N'272.28')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201501', N'0122', N'020101', N'791.94')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201501', N'0122', N'0403', N'160.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201501', N'0122', N'05', N'255.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201501', N'0122', N'06', N'129.52')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201501', N'0122', N'10', N'12.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201501', N'0122', N'1001', N'251.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201501', N'0122', N'1002', N'120.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201501', N'0122', N'1003', N'205.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201501', N'0123', N'06', N'36.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201501', N'0123', N'1006', N'400.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201501', N'0124', N'0101', N'702.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201501', N'0127', N'0101', N'96.88')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201501', N'0127', N'0401', N'300.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201501', N'0127', N'0402', N'1260.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201501', N'0127', N'05', N'210.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201501', N'0127', N'1001', N'30.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201501', N'0127', N'1003', N'111.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201501', N'0128', N'0101', N'57.60')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201501', N'0128', N'0201', N'151.90')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201501', N'0128', N'0401', N'250.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201501', N'0128', N'0403', N'262.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201501', N'0128', N'1001', N'30.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201501', N'0128', N'1003', N'91.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201501', N'0128', N'1006', N'50.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201501', N'0130', N'0401', N'300.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201501', N'0130', N'0402', N'600.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201501', N'0130', N'06', N'40.56')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201501', N'0132', N'0101', N'1637.85')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201501', N'0132', N'010101', N'850.29')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201501', N'0132', N'0201', N'690.23')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201501', N'0132', N'020101', N'221.34')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201501', N'0132', N'05', N'110.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201501', N'0132', N'06', N'.89')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201501', N'0132', N'10', N'3.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201501', N'0132', N'1001', N'41.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201501', N'0132', N'1002', N'50.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201501', N'0132', N'1003', N'221.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201501', N'0132', N'26', N'2524.20')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201501', N'0133', N'0101', N'105.65')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201501', N'0133', N'010101', N'3.60')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201501', N'0133', N'0403', N'80.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201501', N'0133', N'05', N'510.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201501', N'0133', N'06', N'120.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201501', N'0133', N'1001', N'55.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201501', N'0133', N'1005', N'10.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201501', N'0135', N'0101', N'1003.26')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201501', N'0135', N'010101', N'133.87')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201501', N'0135', N'0102', N'238.96')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201501', N'0135', N'06', N'203.56')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201501', N'0135', N'1001', N'90.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201501', N'0135', N'21', N'293.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201501', N'0139', N'0201', N'363.40')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201501', N'0139', N'0202', N'1717.83')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201501', N'0147', N'21', N'2254.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ClinOffice] VALUES (N'201501', N'0160', N'06', N'79.50')
GO


-- ----------------------------
-- Table structure for Stat_Clin_Fee_ExecOffice
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Stat_Clin_Fee_ExecOffice]') AND type IN ('U'))
	DROP TABLE [dbo].[Stat_Clin_Fee_ExecOffice]
GO

CREATE TABLE [dbo].[Stat_Clin_Fee_ExecOffice] (
  [StatDate] varchar(8) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [ExecOfficeID] varchar(8) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [StatTypeID] varchar(8) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [SumPrice] numeric(18,2)  NULL
)
GO

ALTER TABLE [dbo].[Stat_Clin_Fee_ExecOffice] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of Stat_Clin_Fee_ExecOffice
-- ----------------------------
INSERT INTO [dbo].[Stat_Clin_Fee_ExecOffice] VALUES (N'201412', N'0110', N'06', N'60.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ExecOffice] VALUES (N'201412', N'0111', N'07', N'11645.40')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ExecOffice] VALUES (N'201412', N'0112', N'06', N'387.41')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ExecOffice] VALUES (N'201412', N'0112', N'11', N'12.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ExecOffice] VALUES (N'201412', N'0112', N'14', N'10.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ExecOffice] VALUES (N'201412', N'0113', N'06', N'1522.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ExecOffice] VALUES (N'201412', N'0114', N'06', N'1510.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ExecOffice] VALUES (N'201412', N'0119', N'06', N'446.03')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ExecOffice] VALUES (N'201412', N'0122', N'06', N'530.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ExecOffice] VALUES (N'201412', N'0123', N'06', N'496.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ExecOffice] VALUES (N'201412', N'0123', N'1005', N'180.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ExecOffice] VALUES (N'201412', N'0133', N'05', N'380.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ExecOffice] VALUES (N'201412', N'0133', N'06', N'2418.75')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ExecOffice] VALUES (N'201412', N'0133', N'08', N'40.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ExecOffice] VALUES (N'201412', N'0133', N'11', N'4.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ExecOffice] VALUES (N'201412', N'0135', N'06', N'31.58')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ExecOffice] VALUES (N'201412', N'0135', N'10', N'.30')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ExecOffice] VALUES (N'201412', N'0135', N'21', N'281.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ExecOffice] VALUES (N'201412', N'0147', N'21', N'4755.90')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ExecOffice] VALUES (N'201412', N'0156', N'06', N'129.55')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ExecOffice] VALUES (N'201412', N'030901', N'0401', N'2050.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ExecOffice] VALUES (N'201412', N'030902', N'0402', N'1200.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ExecOffice] VALUES (N'201412', N'030903', N'0403', N'1071.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ExecOffice] VALUES (N'201412', N'030904', N'05', N'1160.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ExecOffice] VALUES (N'201412', N'030906', N'05', N'35.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ExecOffice] VALUES (N'201412', N'031501', N'06', N'2.67')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ExecOffice] VALUES (N'201412', N'031501', N'10', N'9.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ExecOffice] VALUES (N'201412', N'031501', N'1001', N'536.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ExecOffice] VALUES (N'201412', N'031501', N'1005', N'30.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ExecOffice] VALUES (N'201412', N'031502', N'06', N'1.78')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ExecOffice] VALUES (N'201412', N'031502', N'10', N'6.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ExecOffice] VALUES (N'201412', N'031502', N'1002', N'805.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ExecOffice] VALUES (N'201412', N'031502', N'1006', N'100.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ExecOffice] VALUES (N'201412', N'031503', N'06', N'8.90')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ExecOffice] VALUES (N'201412', N'031503', N'10', N'30.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ExecOffice] VALUES (N'201412', N'031503', N'1003', N'782.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ExecOffice] VALUES (N'201412', N'031503', N'1006', N'50.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ExecOffice] VALUES (N'201412', N'031803', N'0101', N'21120.81')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ExecOffice] VALUES (N'201412', N'031803', N'010101', N'6741.64')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ExecOffice] VALUES (N'201412', N'031803', N'0102', N'411.35')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ExecOffice] VALUES (N'201412', N'031803', N'010201', N'169.32')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ExecOffice] VALUES (N'201412', N'031804', N'0201', N'2734.11')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ExecOffice] VALUES (N'201412', N'031804', N'020101', N'2168.06')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ExecOffice] VALUES (N'201412', N'031804', N'0202', N'266.48')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ExecOffice] VALUES (N'201412', N'031804', N'06', N'20.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ExecOffice] VALUES (N'201412', N'0320', N'05', N'210.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ExecOffice] VALUES (N'201412', N'0320', N'1002', N'30.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ExecOffice] VALUES (N'201501', N'0110', N'06', N'525.40')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ExecOffice] VALUES (N'201501', N'0111', N'07', N'1378.08')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ExecOffice] VALUES (N'201501', N'0111', N'0701', N'234.36')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ExecOffice] VALUES (N'201501', N'0112', N'06', N'397.44')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ExecOffice] VALUES (N'201501', N'0112', N'11', N'24.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ExecOffice] VALUES (N'201501', N'0113', N'06', N'150.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ExecOffice] VALUES (N'201501', N'0114', N'0403', N'30.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ExecOffice] VALUES (N'201501', N'0114', N'06', N'1610.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ExecOffice] VALUES (N'201501', N'0114', N'07', N'110.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ExecOffice] VALUES (N'201501', N'0114', N'08', N'60.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ExecOffice] VALUES (N'201501', N'0119', N'06', N'962.43')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ExecOffice] VALUES (N'201501', N'0119', N'08', N'30.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ExecOffice] VALUES (N'201501', N'0120', N'06', N'656.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ExecOffice] VALUES (N'201501', N'0123', N'06', N'36.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ExecOffice] VALUES (N'201501', N'0123', N'1006', N'400.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ExecOffice] VALUES (N'201501', N'0130', N'06', N'40.56')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ExecOffice] VALUES (N'201501', N'0133', N'05', N'180.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ExecOffice] VALUES (N'201501', N'0133', N'06', N'120.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ExecOffice] VALUES (N'201501', N'0135', N'06', N'203.56')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ExecOffice] VALUES (N'201501', N'0135', N'21', N'293.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ExecOffice] VALUES (N'201501', N'0147', N'21', N'2254.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ExecOffice] VALUES (N'201501', N'0156', N'06', N'228.32')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ExecOffice] VALUES (N'201501', N'0160', N'06', N'79.50')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ExecOffice] VALUES (N'201501', N'030901', N'0401', N'1950.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ExecOffice] VALUES (N'201501', N'030902', N'0402', N'1860.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ExecOffice] VALUES (N'201501', N'030903', N'0403', N'1638.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ExecOffice] VALUES (N'201501', N'030904', N'05', N'1370.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ExecOffice] VALUES (N'201501', N'030906', N'05', N'145.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ExecOffice] VALUES (N'201501', N'031501', N'05', N'180.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ExecOffice] VALUES (N'201501', N'031501', N'06', N'1.78')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ExecOffice] VALUES (N'201501', N'031501', N'10', N'6.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ExecOffice] VALUES (N'201501', N'031501', N'1001', N'758.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ExecOffice] VALUES (N'201501', N'031501', N'1005', N'10.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ExecOffice] VALUES (N'201501', N'031502', N'06', N'.89')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ExecOffice] VALUES (N'201501', N'031502', N'10', N'3.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ExecOffice] VALUES (N'201501', N'031502', N'1002', N'670.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ExecOffice] VALUES (N'201501', N'031502', N'1006', N'200.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ExecOffice] VALUES (N'201501', N'031503', N'06', N'6.23')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ExecOffice] VALUES (N'201501', N'031503', N'10', N'21.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ExecOffice] VALUES (N'201501', N'031503', N'1003', N'847.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ExecOffice] VALUES (N'201501', N'031503', N'1006', N'50.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ExecOffice] VALUES (N'201501', N'031505', N'1005', N'130.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ExecOffice] VALUES (N'201501', N'031803', N'0101', N'11205.56')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ExecOffice] VALUES (N'201501', N'031803', N'010101', N'4607.75')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ExecOffice] VALUES (N'201501', N'031803', N'0102', N'1596.41')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ExecOffice] VALUES (N'201501', N'031803', N'010201', N'141.10')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ExecOffice] VALUES (N'201501', N'031804', N'0201', N'1960.47')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ExecOffice] VALUES (N'201501', N'031804', N'020101', N'1600.30')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ExecOffice] VALUES (N'201501', N'031804', N'0202', N'1717.83')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ExecOffice] VALUES (N'201501', N'0319', N'26', N'2524.20')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ExecOffice] VALUES (N'201501', N'0320', N'010101', N'196.68')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ExecOffice] VALUES (N'201501', N'0320', N'05', N'500.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ExecOffice] VALUES (N'201501', N'0320', N'06', N'833.48')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ExecOffice] VALUES (N'201501', N'0320', N'08', N'40.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ExecOffice] VALUES (N'201501', N'0320', N'1002', N'30.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ExecOffice] VALUES (N'201501', N'0320', N'11', N'44.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ExecOffice] VALUES (N'201501', N'0321', N'05', N'230.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ExecOffice] VALUES (N'201501', N'0321', N'06', N'425.09')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_ExecOffice] VALUES (N'201501', N'0321', N'11', N'4.00')
GO


-- ----------------------------
-- Table structure for Stat_Clin_Fee_FeeType
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Stat_Clin_Fee_FeeType]') AND type IN ('U'))
	DROP TABLE [dbo].[Stat_Clin_Fee_FeeType]
GO

CREATE TABLE [dbo].[Stat_Clin_Fee_FeeType] (
  [StatDate] varchar(8) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [FeeTypeID] int DEFAULT ((0)) NOT NULL,
  [SumPrice] numeric(18,2) DEFAULT ((0)) NOT NULL,
  [DiscountMoney] numeric(18,2) DEFAULT ((0)) NOT NULL,
  [YBMoney] numeric(18,2) DEFAULT ((0)) NOT NULL,
  [CashMoney] numeric(18,2) DEFAULT ((0)) NOT NULL,
  [POSMoney] numeric(18,2) DEFAULT ((0)) NOT NULL,
  [ETCMoney1] numeric(18,2) DEFAULT ((0)) NOT NULL,
  [ETCMoney2] numeric(18,2) DEFAULT ((0)) NOT NULL
)
GO

ALTER TABLE [dbo].[Stat_Clin_Fee_FeeType] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of Stat_Clin_Fee_FeeType
-- ----------------------------
INSERT INTO [dbo].[Stat_Clin_Fee_FeeType] VALUES (N'201412', N'0', N'42765.90', N'.00', N'.00', N'30885.33', N'11880.57', N'.00', N'.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_FeeType] VALUES (N'201412', N'1', N'9847.31', N'.00', N'7062.66', N'2208.90', N'575.75', N'.00', N'.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_FeeType] VALUES (N'201412', N'2', N'13975.83', N'.00', N'13047.19', N'757.80', N'170.84', N'.00', N'.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_FeeType] VALUES (N'201501', N'0', N'23153.09', N'27.49', N'.00', N'19434.29', N'3691.31', N'.00', N'.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_FeeType] VALUES (N'201501', N'1', N'11458.72', N'.00', N'8861.90', N'2596.82', N'.00', N'.00', N'.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_FeeType] VALUES (N'201501', N'2', N'12894.61', N'.00', N'11266.92', N'1031.09', N'268.45', N'328.15', N'.00')
GO


-- ----------------------------
-- Table structure for Stat_Clin_Fee_RecExecOffice
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Stat_Clin_Fee_RecExecOffice]') AND type IN ('U'))
	DROP TABLE [dbo].[Stat_Clin_Fee_RecExecOffice]
GO

CREATE TABLE [dbo].[Stat_Clin_Fee_RecExecOffice] (
  [StatDate] varchar(8) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [RecOfficeID] varchar(8) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [ExecOfficeID] varchar(8) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [SumPrice] numeric(18,2)  NULL
)
GO

ALTER TABLE [dbo].[Stat_Clin_Fee_RecExecOffice] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of Stat_Clin_Fee_RecExecOffice
-- ----------------------------
INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201412', N'0104', N'031503', N'188.89')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201412', N'0104', N'031803', N'3657.62')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201412', N'0104', N'031804', N'554.15')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201412', N'0105', N'030901', N'375.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201412', N'0105', N'030903', N'80.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201412', N'0105', N'031803', N'347.04')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201412', N'0105', N'031804', N'81.76')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201412', N'0105', N'0320', N'240.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201412', N'0107', N'031803', N'1082.13')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201412', N'0108', N'0156', N'4.36')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201412', N'0108', N'030904', N'110.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201412', N'0108', N'031501', N'67.78')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201412', N'0108', N'031502', N'330.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201412', N'0108', N'031503', N'102.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201412', N'0108', N'031803', N'1566.41')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201412', N'0108', N'031804', N'125.76')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201412', N'0110', N'0110', N'60.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201412', N'0110', N'030903', N'131.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201412', N'0111', N'0111', N'11645.40')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201412', N'0112', N'0112', N'409.41')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201412', N'0112', N'030901', N'875.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201412', N'0112', N'030903', N'320.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201412', N'0112', N'030904', N'330.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201412', N'0112', N'030906', N'35.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201412', N'0112', N'031501', N'105.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201412', N'0112', N'031502', N'53.89')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201412', N'0112', N'031503', N'76.89')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201412', N'0112', N'031803', N'3277.06')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201412', N'0112', N'031804', N'36.80')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201412', N'0113', N'0113', N'1522.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201412', N'0113', N'030903', N'135.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201412', N'0114', N'0114', N'1510.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201412', N'0114', N'031803', N'8.29')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201412', N'0114', N'031804', N'472.42')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201412', N'0115', N'031803', N'2142.53')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201412', N'0115', N'031804', N'643.79')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201412', N'0116', N'031803', N'970.18')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201412', N'0119', N'0119', N'411.03')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201412', N'0119', N'030901', N'550.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201412', N'0119', N'030903', N'405.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201412', N'0119', N'030904', N'220.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201412', N'0119', N'031502', N'25.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201412', N'0119', N'031803', N'1658.15')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201412', N'0119', N'031804', N'161.37')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201412', N'0120', N'031803', N'431.65')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201412', N'0122', N'0122', N'530.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201412', N'0122', N'0156', N'48.15')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201412', N'0122', N'031501', N'58.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201412', N'0122', N'031502', N'25.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201412', N'0122', N'031503', N'96.78')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201412', N'0122', N'031803', N'4076.35')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201412', N'0122', N'031804', N'797.79')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201412', N'0123', N'0123', N'676.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201412', N'0123', N'0156', N'28.89')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201412', N'0123', N'031803', N'68.03')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201412', N'0124', N'031803', N'730.50')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201412', N'0127', N'0156', N'48.15')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201412', N'0127', N'030904', N'280.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201412', N'0127', N'031501', N'30.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201412', N'0127', N'031503', N'114.89')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201412', N'0127', N'031803', N'1527.79')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201412', N'0129', N'030902', N'600.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201412', N'0130', N'0119', N'35.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201412', N'0130', N'030901', N'250.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201412', N'0130', N'030902', N'600.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201412', N'0132', N'031501', N'58.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201412', N'0132', N'031502', N'100.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201412', N'0132', N'031503', N'291.45')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201412', N'0132', N'031803', N'3938.61')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201412', N'0132', N'031804', N'586.76')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201412', N'0133', N'0133', N'2842.75')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201412', N'0133', N'030904', N'110.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201412', N'0133', N'031501', N'228.89')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201412', N'0133', N'031502', N'353.89')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201412', N'0133', N'031803', N'598.52')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201412', N'0133', N'031804', N'48.43')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201412', N'0135', N'0135', N'312.88')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201412', N'0135', N'030904', N'110.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201412', N'0135', N'031501', N'30.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201412', N'0135', N'031502', N'25.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201412', N'0135', N'031803', N'295.77')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201412', N'0137', N'031803', N'8.40')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201412', N'0139', N'031803', N'2058.09')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201412', N'0139', N'031804', N'1679.62')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201412', N'0147', N'0147', N'4755.90')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201501', N'0104', N'031803', N'260.21')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201501', N'0104', N'031804', N'150.65')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201501', N'0105', N'031501', N'180.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201501', N'0105', N'031505', N'130.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201501', N'0105', N'031803', N'581.88')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201501', N'0105', N'0321', N'659.09')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201501', N'0107', N'031803', N'2065.20')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201501', N'0108', N'031501', N'35.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201501', N'0108', N'031803', N'400.81')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201501', N'0110', N'0110', N'525.40')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201501', N'0110', N'030903', N'397.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201501', N'0110', N'031804', N'396.70')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201501', N'0111', N'0111', N'1612.44')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201501', N'0112', N'0112', N'421.44')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201501', N'0112', N'030901', N'550.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201501', N'0112', N'030903', N'80.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201501', N'0112', N'030904', N'500.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201501', N'0112', N'030906', N'110.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201501', N'0112', N'031501', N'196.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201501', N'0112', N'031502', N'453.89')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201501', N'0112', N'031503', N'234.56')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201501', N'0112', N'031803', N'2945.12')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201501', N'0112', N'031804', N'36.34')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201501', N'0112', N'0320', N'1644.16')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201501', N'0113', N'0113', N'150.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201501', N'0114', N'0114', N'1810.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201501', N'0114', N'031803', N'9.48')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201501', N'0115', N'031803', N'222.96')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201501', N'0115', N'031804', N'193.55')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201501', N'0116', N'0156', N'100.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201501', N'0119', N'0119', N'992.43')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201501', N'0119', N'0156', N'2.36')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201501', N'0119', N'030901', N'300.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201501', N'0119', N'030903', N'659.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201501', N'0119', N'031501', N'30.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201501', N'0119', N'031502', N'250.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201501', N'0119', N'031803', N'1570.21')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201501', N'0119', N'031804', N'116.49')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201501', N'0120', N'0120', N'656.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201501', N'0120', N'030901', N'250.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201501', N'0120', N'031803', N'53.92')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201501', N'0120', N'031804', N'175.95')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201501', N'0121', N'031803', N'220.08')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201501', N'0122', N'0156', N'125.96')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201501', N'0122', N'030903', N'160.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201501', N'0122', N'030904', N'220.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201501', N'0122', N'030906', N'35.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201501', N'0122', N'031501', N'258.78')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201501', N'0122', N'031502', N'120.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201501', N'0122', N'031503', N'212.78')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201501', N'0122', N'031803', N'4390.99')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201501', N'0122', N'031804', N'1064.22')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201501', N'0123', N'0123', N'436.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201501', N'0124', N'031803', N'702.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201501', N'0127', N'030901', N'300.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201501', N'0127', N'030902', N'1260.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201501', N'0127', N'030904', N'210.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201501', N'0127', N'031501', N'30.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201501', N'0127', N'031503', N'111.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201501', N'0127', N'031803', N'96.88')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201501', N'0128', N'030901', N'250.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201501', N'0128', N'030903', N'262.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201501', N'0128', N'031501', N'30.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201501', N'0128', N'031503', N'141.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201501', N'0128', N'031803', N'57.60')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201501', N'0128', N'031804', N'151.90')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201501', N'0130', N'0130', N'40.56')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201501', N'0130', N'030901', N'300.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201501', N'0130', N'030902', N'600.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201501', N'0132', N'030904', N'110.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201501', N'0132', N'031501', N'41.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201501', N'0132', N'031502', N'50.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201501', N'0132', N'031503', N'224.89')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201501', N'0132', N'031803', N'2488.14')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201501', N'0132', N'031804', N'911.57')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201501', N'0132', N'0319', N'2524.20')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201501', N'0133', N'0133', N'300.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201501', N'0133', N'030903', N'80.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201501', N'0133', N'030904', N'330.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201501', N'0133', N'031501', N'65.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201501', N'0133', N'031803', N'109.25')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201501', N'0135', N'0135', N'496.56')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201501', N'0135', N'031501', N'90.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201501', N'0135', N'031803', N'1376.09')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201501', N'0139', N'031804', N'2081.23')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201501', N'0147', N'0147', N'2254.00')
GO

INSERT INTO [dbo].[Stat_Clin_Fee_RecExecOffice] VALUES (N'201501', N'0160', N'0160', N'79.50')
GO


-- ----------------------------
-- Table structure for Stat_Clin_Reg
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Stat_Clin_Reg]') AND type IN ('U'))
	DROP TABLE [dbo].[Stat_Clin_Reg]
GO

CREATE TABLE [dbo].[Stat_Clin_Reg] (
  [StatDate] varchar(8) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [OfficeID] varchar(8) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [RegTypeID] varchar(10) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [RegCount] int  NULL,
  [RegPrice] numeric(18,2) DEFAULT ((0)) NOT NULL,
  [DiagPrice] numeric(18,2) DEFAULT ((0)) NOT NULL,
  [SumPrice] numeric(18,2) DEFAULT ((0)) NOT NULL
)
GO

ALTER TABLE [dbo].[Stat_Clin_Reg] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of Stat_Clin_Reg
-- ----------------------------
INSERT INTO [dbo].[Stat_Clin_Reg] VALUES (N'201412', N'0104', N'11', N'1', N'.00', N'3.00', N'3.00')
GO

INSERT INTO [dbo].[Stat_Clin_Reg] VALUES (N'201412', N'0104', N'12', N'3', N'.00', N'.00', N'.00')
GO

INSERT INTO [dbo].[Stat_Clin_Reg] VALUES (N'201412', N'0104', N'13', N'2', N'3.00', N'.00', N'3.00')
GO

INSERT INTO [dbo].[Stat_Clin_Reg] VALUES (N'201412', N'0104', N'7', N'1', N'.00', N'8.00', N'8.00')
GO

INSERT INTO [dbo].[Stat_Clin_Reg] VALUES (N'201412', N'0104', N'9', N'1', N'.00', N'5.00', N'5.00')
GO

INSERT INTO [dbo].[Stat_Clin_Reg] VALUES (N'201412', N'0105', N'1', N'1', N'1.50', N'5.00', N'6.50')
GO

INSERT INTO [dbo].[Stat_Clin_Reg] VALUES (N'201412', N'0105', N'12', N'2', N'.00', N'.00', N'.00')
GO

INSERT INTO [dbo].[Stat_Clin_Reg] VALUES (N'201412', N'0107', N'12', N'2', N'.00', N'.00', N'.00')
GO

INSERT INTO [dbo].[Stat_Clin_Reg] VALUES (N'201412', N'0107', N'13', N'2', N'3.00', N'.00', N'3.00')
GO

INSERT INTO [dbo].[Stat_Clin_Reg] VALUES (N'201412', N'0108', N'11', N'1', N'.00', N'3.00', N'3.00')
GO

INSERT INTO [dbo].[Stat_Clin_Reg] VALUES (N'201412', N'0108', N'12', N'1', N'.00', N'.00', N'.00')
GO

INSERT INTO [dbo].[Stat_Clin_Reg] VALUES (N'201412', N'0108', N'13', N'1', N'1.50', N'.00', N'1.50')
GO

INSERT INTO [dbo].[Stat_Clin_Reg] VALUES (N'201412', N'0110', N'9', N'1', N'.00', N'5.00', N'5.00')
GO

INSERT INTO [dbo].[Stat_Clin_Reg] VALUES (N'201412', N'0111', N'12', N'5', N'.00', N'.00', N'.00')
GO

INSERT INTO [dbo].[Stat_Clin_Reg] VALUES (N'201412', N'0112', N'11', N'1', N'.00', N'3.00', N'3.00')
GO

INSERT INTO [dbo].[Stat_Clin_Reg] VALUES (N'201412', N'0112', N'12', N'8', N'.00', N'.00', N'.00')
GO

INSERT INTO [dbo].[Stat_Clin_Reg] VALUES (N'201412', N'0112', N'13', N'3', N'4.50', N'.00', N'4.50')
GO

INSERT INTO [dbo].[Stat_Clin_Reg] VALUES (N'201412', N'0112', N'3', N'8', N'12.00', N'24.00', N'36.00')
GO

INSERT INTO [dbo].[Stat_Clin_Reg] VALUES (N'201412', N'0113', N'12', N'1', N'.00', N'.00', N'.00')
GO

INSERT INTO [dbo].[Stat_Clin_Reg] VALUES (N'201412', N'0113', N'3', N'2', N'3.00', N'6.00', N'9.00')
GO

INSERT INTO [dbo].[Stat_Clin_Reg] VALUES (N'201412', N'0114', N'1', N'1', N'1.50', N'5.00', N'6.50')
GO

INSERT INTO [dbo].[Stat_Clin_Reg] VALUES (N'201412', N'0114', N'15', N'1', N'1.50', N'5.00', N'6.50')
GO

INSERT INTO [dbo].[Stat_Clin_Reg] VALUES (N'201412', N'0114', N'9', N'4', N'.00', N'20.00', N'20.00')
GO

INSERT INTO [dbo].[Stat_Clin_Reg] VALUES (N'201412', N'0115', N'12', N'3', N'.00', N'.00', N'.00')
GO

INSERT INTO [dbo].[Stat_Clin_Reg] VALUES (N'201412', N'0116', N'12', N'2', N'.00', N'.00', N'.00')
GO

INSERT INTO [dbo].[Stat_Clin_Reg] VALUES (N'201412', N'0119', N'12', N'6', N'.00', N'.00', N'.00')
GO

INSERT INTO [dbo].[Stat_Clin_Reg] VALUES (N'201412', N'0119', N'13', N'1', N'1.50', N'.00', N'1.50')
GO

INSERT INTO [dbo].[Stat_Clin_Reg] VALUES (N'201412', N'0119', N'3', N'9', N'13.50', N'27.00', N'40.50')
GO

INSERT INTO [dbo].[Stat_Clin_Reg] VALUES (N'201412', N'0120', N'12', N'2', N'.00', N'.00', N'.00')
GO

INSERT INTO [dbo].[Stat_Clin_Reg] VALUES (N'201412', N'0120', N'3', N'1', N'1.50', N'3.00', N'4.50')
GO

INSERT INTO [dbo].[Stat_Clin_Reg] VALUES (N'201412', N'0121', N'12', N'1', N'.00', N'.00', N'.00')
GO

INSERT INTO [dbo].[Stat_Clin_Reg] VALUES (N'201412', N'0121', N'13', N'1', N'1.50', N'.00', N'1.50')
GO

INSERT INTO [dbo].[Stat_Clin_Reg] VALUES (N'201412', N'0122', N'11', N'2', N'.00', N'6.00', N'6.00')
GO

INSERT INTO [dbo].[Stat_Clin_Reg] VALUES (N'201412', N'0122', N'12', N'15', N'.00', N'.00', N'.00')
GO

INSERT INTO [dbo].[Stat_Clin_Reg] VALUES (N'201412', N'0122', N'13', N'2', N'3.00', N'.00', N'3.00')
GO

INSERT INTO [dbo].[Stat_Clin_Reg] VALUES (N'201412', N'0122', N'3', N'3', N'4.50', N'9.00', N'13.50')
GO

INSERT INTO [dbo].[Stat_Clin_Reg] VALUES (N'201412', N'0123', N'11', N'1', N'.00', N'3.00', N'3.00')
GO

INSERT INTO [dbo].[Stat_Clin_Reg] VALUES (N'201412', N'0123', N'3', N'4', N'6.00', N'12.00', N'18.00')
GO

INSERT INTO [dbo].[Stat_Clin_Reg] VALUES (N'201412', N'0124', N'12', N'1', N'.00', N'.00', N'.00')
GO

INSERT INTO [dbo].[Stat_Clin_Reg] VALUES (N'201412', N'0124', N'7', N'1', N'.00', N'8.00', N'8.00')
GO

INSERT INTO [dbo].[Stat_Clin_Reg] VALUES (N'201412', N'0127', N'12', N'2', N'.00', N'.00', N'.00')
GO

INSERT INTO [dbo].[Stat_Clin_Reg] VALUES (N'201412', N'0127', N'3', N'2', N'3.00', N'6.00', N'9.00')
GO

INSERT INTO [dbo].[Stat_Clin_Reg] VALUES (N'201412', N'0127', N'7', N'1', N'.00', N'8.00', N'8.00')
GO

INSERT INTO [dbo].[Stat_Clin_Reg] VALUES (N'201412', N'0127', N'9', N'1', N'.00', N'5.00', N'5.00')
GO

INSERT INTO [dbo].[Stat_Clin_Reg] VALUES (N'201412', N'0129', N'15', N'1', N'1.50', N'5.00', N'6.50')
GO

INSERT INTO [dbo].[Stat_Clin_Reg] VALUES (N'201412', N'0130', N'2', N'1', N'1.50', N'8.00', N'9.50')
GO

INSERT INTO [dbo].[Stat_Clin_Reg] VALUES (N'201412', N'0130', N'3', N'1', N'1.50', N'3.00', N'4.50')
GO

INSERT INTO [dbo].[Stat_Clin_Reg] VALUES (N'201412', N'0132', N'12', N'5', N'.00', N'.00', N'.00')
GO

INSERT INTO [dbo].[Stat_Clin_Reg] VALUES (N'201412', N'0132', N'13', N'1', N'1.50', N'.00', N'1.50')
GO

INSERT INTO [dbo].[Stat_Clin_Reg] VALUES (N'201412', N'0132', N'3', N'3', N'4.50', N'9.00', N'13.50')
GO

INSERT INTO [dbo].[Stat_Clin_Reg] VALUES (N'201412', N'0133', N'1', N'3', N'4.50', N'15.00', N'19.50')
GO

INSERT INTO [dbo].[Stat_Clin_Reg] VALUES (N'201412', N'0133', N'14', N'1', N'1.50', N'5.00', N'6.50')
GO

INSERT INTO [dbo].[Stat_Clin_Reg] VALUES (N'201412', N'0133', N'15', N'1', N'1.50', N'5.00', N'6.50')
GO

INSERT INTO [dbo].[Stat_Clin_Reg] VALUES (N'201412', N'0135', N'3', N'4', N'6.00', N'12.00', N'18.00')
GO

INSERT INTO [dbo].[Stat_Clin_Reg] VALUES (N'201412', N'0137', N'13', N'1', N'1.50', N'.00', N'1.50')
GO

INSERT INTO [dbo].[Stat_Clin_Reg] VALUES (N'201412', N'0139', N'12', N'3', N'.00', N'.00', N'.00')
GO

INSERT INTO [dbo].[Stat_Clin_Reg] VALUES (N'201412', N'0139', N'13', N'1', N'1.50', N'.00', N'1.50')
GO

INSERT INTO [dbo].[Stat_Clin_Reg] VALUES (N'201412', N'0139', N'3', N'1', N'1.50', N'3.00', N'4.50')
GO

INSERT INTO [dbo].[Stat_Clin_Reg] VALUES (N'201412', N'0147', N'12', N'5', N'.00', N'.00', N'.00')
GO

INSERT INTO [dbo].[Stat_Clin_Reg] VALUES (N'201412', N'0147', N'5', N'1', N'.00', N'.00', N'.00')
GO

INSERT INTO [dbo].[Stat_Clin_Reg] VALUES (N'201501', N'0104', N'12', N'2', N'.00', N'.00', N'.00')
GO

INSERT INTO [dbo].[Stat_Clin_Reg] VALUES (N'201501', N'0104', N'13', N'1', N'1.50', N'.00', N'1.50')
GO

INSERT INTO [dbo].[Stat_Clin_Reg] VALUES (N'201501', N'0105', N'1', N'1', N'1.50', N'5.00', N'6.50')
GO

INSERT INTO [dbo].[Stat_Clin_Reg] VALUES (N'201501', N'0105', N'9', N'1', N'.00', N'5.00', N'5.00')
GO

INSERT INTO [dbo].[Stat_Clin_Reg] VALUES (N'201501', N'0107', N'12', N'2', N'.00', N'.00', N'.00')
GO

INSERT INTO [dbo].[Stat_Clin_Reg] VALUES (N'201501', N'0108', N'12', N'2', N'.00', N'.00', N'.00')
GO

INSERT INTO [dbo].[Stat_Clin_Reg] VALUES (N'201501', N'0108', N'3', N'1', N'1.50', N'3.00', N'4.50')
GO

INSERT INTO [dbo].[Stat_Clin_Reg] VALUES (N'201501', N'0110', N'13', N'1', N'1.50', N'.00', N'1.50')
GO

INSERT INTO [dbo].[Stat_Clin_Reg] VALUES (N'201501', N'0110', N'2', N'2', N'3.00', N'16.00', N'19.00')
GO

INSERT INTO [dbo].[Stat_Clin_Reg] VALUES (N'201501', N'0110', N'9', N'1', N'.00', N'5.00', N'5.00')
GO

INSERT INTO [dbo].[Stat_Clin_Reg] VALUES (N'201501', N'0111', N'12', N'2', N'.00', N'.00', N'.00')
GO

INSERT INTO [dbo].[Stat_Clin_Reg] VALUES (N'201501', N'0112', N'11', N'3', N'.00', N'9.00', N'9.00')
GO

INSERT INTO [dbo].[Stat_Clin_Reg] VALUES (N'201501', N'0112', N'12', N'7', N'.00', N'.00', N'.00')
GO

INSERT INTO [dbo].[Stat_Clin_Reg] VALUES (N'201501', N'0112', N'3', N'12', N'18.00', N'36.00', N'54.00')
GO

INSERT INTO [dbo].[Stat_Clin_Reg] VALUES (N'201501', N'0113', N'3', N'1', N'1.50', N'3.00', N'4.50')
GO

INSERT INTO [dbo].[Stat_Clin_Reg] VALUES (N'201501', N'0114', N'8', N'2', N'7.00', N'6.00', N'13.00')
GO

INSERT INTO [dbo].[Stat_Clin_Reg] VALUES (N'201501', N'0114', N'9', N'5', N'.00', N'25.00', N'25.00')
GO

INSERT INTO [dbo].[Stat_Clin_Reg] VALUES (N'201501', N'0115', N'12', N'2', N'.00', N'.00', N'.00')
GO

INSERT INTO [dbo].[Stat_Clin_Reg] VALUES (N'201501', N'0116', N'12', N'2', N'.00', N'.00', N'.00')
GO

INSERT INTO [dbo].[Stat_Clin_Reg] VALUES (N'201501', N'0119', N'11', N'3', N'.00', N'9.00', N'9.00')
GO

INSERT INTO [dbo].[Stat_Clin_Reg] VALUES (N'201501', N'0119', N'12', N'10', N'.00', N'.00', N'.00')
GO

INSERT INTO [dbo].[Stat_Clin_Reg] VALUES (N'201501', N'0119', N'3', N'6', N'9.00', N'18.00', N'27.00')
GO

INSERT INTO [dbo].[Stat_Clin_Reg] VALUES (N'201501', N'0120', N'12', N'3', N'.00', N'.00', N'.00')
GO

INSERT INTO [dbo].[Stat_Clin_Reg] VALUES (N'201501', N'0120', N'3', N'2', N'3.00', N'6.00', N'9.00')
GO

INSERT INTO [dbo].[Stat_Clin_Reg] VALUES (N'201501', N'0121', N'12', N'1', N'.00', N'.00', N'.00')
GO

INSERT INTO [dbo].[Stat_Clin_Reg] VALUES (N'201501', N'0122', N'11', N'2', N'.00', N'6.00', N'6.00')
GO

INSERT INTO [dbo].[Stat_Clin_Reg] VALUES (N'201501', N'0122', N'12', N'8', N'.00', N'.00', N'.00')
GO

INSERT INTO [dbo].[Stat_Clin_Reg] VALUES (N'201501', N'0122', N'13', N'4', N'6.00', N'.00', N'6.00')
GO

INSERT INTO [dbo].[Stat_Clin_Reg] VALUES (N'201501', N'0122', N'3', N'3', N'4.50', N'9.00', N'13.50')
GO

INSERT INTO [dbo].[Stat_Clin_Reg] VALUES (N'201501', N'0123', N'12', N'1', N'.00', N'.00', N'.00')
GO

INSERT INTO [dbo].[Stat_Clin_Reg] VALUES (N'201501', N'0123', N'3', N'1', N'1.50', N'3.00', N'4.50')
GO

INSERT INTO [dbo].[Stat_Clin_Reg] VALUES (N'201501', N'0124', N'12', N'1', N'.00', N'.00', N'.00')
GO

INSERT INTO [dbo].[Stat_Clin_Reg] VALUES (N'201501', N'0124', N'13', N'1', N'1.50', N'.00', N'1.50')
GO

INSERT INTO [dbo].[Stat_Clin_Reg] VALUES (N'201501', N'0127', N'12', N'1', N'.00', N'.00', N'.00')
GO

INSERT INTO [dbo].[Stat_Clin_Reg] VALUES (N'201501', N'0127', N'15', N'1', N'1.50', N'5.00', N'6.50')
GO

INSERT INTO [dbo].[Stat_Clin_Reg] VALUES (N'201501', N'0127', N'9', N'1', N'.00', N'5.00', N'5.00')
GO

INSERT INTO [dbo].[Stat_Clin_Reg] VALUES (N'201501', N'0128', N'1', N'1', N'1.50', N'5.00', N'6.50')
GO

INSERT INTO [dbo].[Stat_Clin_Reg] VALUES (N'201501', N'0128', N'12', N'1', N'.00', N'.00', N'.00')
GO

INSERT INTO [dbo].[Stat_Clin_Reg] VALUES (N'201501', N'0128', N'15', N'1', N'1.50', N'5.00', N'6.50')
GO

INSERT INTO [dbo].[Stat_Clin_Reg] VALUES (N'201501', N'0128', N'2', N'2', N'3.00', N'16.00', N'19.00')
GO

INSERT INTO [dbo].[Stat_Clin_Reg] VALUES (N'201501', N'0129', N'2', N'1', N'1.50', N'8.00', N'9.50')
GO

INSERT INTO [dbo].[Stat_Clin_Reg] VALUES (N'201501', N'0130', N'3', N'1', N'1.50', N'3.00', N'4.50')
GO

INSERT INTO [dbo].[Stat_Clin_Reg] VALUES (N'201501', N'0132', N'12', N'5', N'.00', N'.00', N'.00')
GO

INSERT INTO [dbo].[Stat_Clin_Reg] VALUES (N'201501', N'0132', N'13', N'4', N'6.00', N'.00', N'6.00')
GO

INSERT INTO [dbo].[Stat_Clin_Reg] VALUES (N'201501', N'0132', N'3', N'1', N'1.50', N'3.00', N'4.50')
GO

INSERT INTO [dbo].[Stat_Clin_Reg] VALUES (N'201501', N'0133', N'14', N'2', N'3.00', N'10.00', N'13.00')
GO

INSERT INTO [dbo].[Stat_Clin_Reg] VALUES (N'201501', N'0133', N'15', N'1', N'1.50', N'5.00', N'6.50')
GO

INSERT INTO [dbo].[Stat_Clin_Reg] VALUES (N'201501', N'0135', N'3', N'6', N'9.00', N'18.00', N'27.00')
GO

INSERT INTO [dbo].[Stat_Clin_Reg] VALUES (N'201501', N'0139', N'12', N'1', N'.00', N'.00', N'.00')
GO

INSERT INTO [dbo].[Stat_Clin_Reg] VALUES (N'201501', N'0139', N'13', N'1', N'1.50', N'.00', N'1.50')
GO

INSERT INTO [dbo].[Stat_Clin_Reg] VALUES (N'201501', N'0139', N'3', N'1', N'1.50', N'3.00', N'4.50')
GO

INSERT INTO [dbo].[Stat_Clin_Reg] VALUES (N'201501', N'0147', N'12', N'7', N'.00', N'.00', N'.00')
GO


-- ----------------------------
-- Table structure for Stat_Hosp_Doctor_Apply
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Stat_Hosp_Doctor_Apply]') AND type IN ('U'))
	DROP TABLE [dbo].[Stat_Hosp_Doctor_Apply]
GO

CREATE TABLE [dbo].[Stat_Hosp_Doctor_Apply] (
  [StatDate] varchar(8) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [OfficeID] varchar(8) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [DoctorID] varchar(8) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [ExecOfficeID] varchar(8) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [Quan] int  NOT NULL,
  [SumPrice] numeric(18,2)  NOT NULL
)
GO

ALTER TABLE [dbo].[Stat_Hosp_Doctor_Apply] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for Stat_Hosp_Fee_ExecOffice
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Stat_Hosp_Fee_ExecOffice]') AND type IN ('U'))
	DROP TABLE [dbo].[Stat_Hosp_Fee_ExecOffice]
GO

CREATE TABLE [dbo].[Stat_Hosp_Fee_ExecOffice] (
  [StatDate] varchar(8) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [ExecOfficeID] varchar(8) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [StatTypeID] varchar(8) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [SumPrice] numeric(18,2)  NULL
)
GO

ALTER TABLE [dbo].[Stat_Hosp_Fee_ExecOffice] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of Stat_Hosp_Fee_ExecOffice
-- ----------------------------
INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201412', N'0210', N'010101', N'45.40')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201412', N'0210', N'05', N'28.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201412', N'0210', N'06', N'560.19')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201412', N'0210', N'1002', N'285.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201412', N'0210', N'1006', N'300.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201412', N'0210', N'14', N'128.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201412', N'0210', N'16', N'32.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201412', N'0210', N'17', N'32.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201412', N'030903', N'0403', N'80.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201412', N'030904', N'05', N'260.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201412', N'030906', N'05', N'35.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201412', N'031501', N'1001', N'133.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201412', N'031502', N'1002', N'150.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201412', N'031503', N'1003', N'135.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201412', N'031804', N'0201', N'38.71')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201412', N'031804', N'020101', N'61.25')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201412', N'031805', N'0101', N'951.58')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201412', N'031805', N'010101', N'62.20')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'0202', N'06', N'2390.99')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'0202', N'10', N'3.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'0202', N'11', N'74.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'0202', N'14', N'272.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'0202', N'15', N'15.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'0202', N'16', N'53.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'0202', N'17', N'56.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'0203', N'010101', N'45.48')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'0203', N'06', N'2220.81')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'0203', N'10', N'3.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'0203', N'11', N'368.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'0203', N'14', N'369.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'0203', N'15', N'36.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'0203', N'16', N'90.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'0203', N'17', N'96.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'0203', N'24', N'15.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'0204', N'010101', N'50.77')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'0204', N'05', N'440.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'0204', N'06', N'3170.46')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'0204', N'10', N'3.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'0204', N'11', N'70.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'0204', N'14', N'861.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'0204', N'16', N'210.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'0204', N'17', N'224.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'0205', N'010101', N'105.57')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'0205', N'05', N'1260.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'0205', N'06', N'2237.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'0205', N'11', N'306.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'0205', N'14', N'1004.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'0205', N'15', N'66.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'0205', N'16', N'212.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'0205', N'17', N'224.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'0205', N'24', N'30.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'0208', N'010101', N'150.65')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'0208', N'06', N'13684.91')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'0208', N'07', N'162.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'0208', N'10', N'6.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'0208', N'11', N'1976.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'0208', N'14', N'1596.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'0208', N'15', N'102.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'0208', N'16', N'231.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'0208', N'17', N'336.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'0208', N'24', N'45.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'0209', N'010101', N'28.40')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'0209', N'0401', N'6.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'0209', N'06', N'2649.97')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'0209', N'07', N'662.04')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'0209', N'08', N'1763.40')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'0209', N'10', N'6.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'0209', N'1001', N'34.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'0209', N'1003', N'200.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'0209', N'1006', N'90.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'0209', N'11', N'21.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'0209', N'14', N'100.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'0209', N'17', N'8.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'0209', N'24', N'45.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'0209', N'49', N'80.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'0210', N'010101', N'75.25')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'0210', N'05', N'56.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'0210', N'06', N'1842.17')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'0210', N'1002', N'570.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'0210', N'1006', N'540.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'0210', N'11', N'171.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'0210', N'14', N'416.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'0210', N'16', N'104.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'0210', N'17', N'104.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'0211', N'06', N'150.12')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'0211', N'0701', N'150.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'0211', N'10', N'6.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'0211', N'14', N'27.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'0211', N'15', N'3.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'0211', N'16', N'6.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'0211', N'17', N'8.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'0211', N'24', N'30.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'0212', N'010101', N'216.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'0212', N'06', N'329.66')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'0212', N'14', N'512.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'0212', N'16', N'128.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'0212', N'17', N'128.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'0219', N'010101', N'28.40')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'0219', N'05', N'10.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'0219', N'06', N'735.38')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'0219', N'07', N'155.28')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'0219', N'08', N'200.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'0219', N'09', N'550.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'0219', N'1002', N'50.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'0219', N'1006', N'30.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'0219', N'11', N'22.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'0219', N'13', N'267.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'0219', N'14', N'192.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'0219', N'16', N'48.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'0219', N'17', N'56.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'0220', N'0101', N'5144.03')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'0220', N'010101', N'305.88')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'0220', N'06', N'4067.24')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'0220', N'1001', N'414.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'0220', N'1002', N'465.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'0220', N'1003', N'348.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'0220', N'1006', N'448.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'0220', N'14', N'840.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'0220', N'16', N'180.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'0220', N'17', N'160.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'0223', N'0101', N'235.52')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'0223', N'010101', N'714.33')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'0223', N'06', N'1507.73')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'0223', N'1002', N'1040.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'0223', N'1003', N'720.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'0223', N'1006', N'820.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'0223', N'11', N'20.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'0223', N'14', N'1334.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'0223', N'16', N'353.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'0223', N'17', N'416.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'0223', N'24', N'15.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'0224', N'010101', N'85.66')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'0224', N'06', N'265.78')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'0224', N'14', N'612.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'0224', N'16', N'144.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'0224', N'17', N'144.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'0224', N'24', N'45.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'0226', N'010101', N'39.45')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'0226', N'06', N'2081.34')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'0226', N'14', N'135.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'0226', N'16', N'15.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'0226', N'17', N'40.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'0228', N'010101', N'13.59')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'0228', N'06', N'97.52')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'0228', N'07', N'400.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'0275', N'06', N'8.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'0275', N'24', N'15.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'030901', N'0101', N'414.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'030901', N'04', N'342.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'030901', N'0401', N'8540.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'030901', N'06', N'33.86')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'030902', N'0101', N'444.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'030902', N'0402', N'10320.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'030902', N'06', N'16.80')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'030903', N'0101', N'4.15')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'030903', N'0403', N'2799.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'030904', N'05', N'7850.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'030906', N'05', N'1100.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'0311', N'05', N'250.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'0315', N'06', N'4.60')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'0315', N'12', N'920.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'031501', N'1001', N'4848.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'031502', N'1002', N'8430.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'031502', N'1006', N'475.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'031503', N'1002', N'730.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'031503', N'1003', N'6941.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'031503', N'1006', N'2308.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'031504', N'1004', N'165.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'031505', N'1005', N'1840.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'031506', N'1006', N'550.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'031804', N'0201', N'443.67')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'031804', N'020101', N'403.53')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'031805', N'0101', N'51033.69')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'031805', N'010101', N'11791.14')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'031805', N'0102', N'697.03')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'031805', N'010201', N'62.41')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'0320', N'05', N'370.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'0320', N'11', N'80.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'0321', N'05', N'160.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'0321', N'06', N'646.02')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'0321', N'08', N'5.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'0321', N'11', N'4.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice] VALUES (N'201501', N'0324', N'05', N'260.00')
GO


-- ----------------------------
-- Table structure for Stat_Hosp_Fee_ExecOffice_Patient
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Stat_Hosp_Fee_ExecOffice_Patient]') AND type IN ('U'))
	DROP TABLE [dbo].[Stat_Hosp_Fee_ExecOffice_Patient]
GO

CREATE TABLE [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] (
  [StatDate] varchar(8) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [ExecOfficeID] varchar(8) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [HospID] varchar(12) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [StatTypeID] varchar(8) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [PatientName] varchar(30) COLLATE Chinese_PRC_CI_AS  NULL,
  [SumPrice] numeric(18,2)  NULL
)
GO

ALTER TABLE [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of Stat_Hosp_Fee_ExecOffice_Patient
-- ----------------------------
INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201412', N'0210', N'2014300174', N'010101', N'戢娅', N'45.40')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201412', N'0210', N'2014300174', N'05', N'戢娅', N'28.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201412', N'0210', N'2014300174', N'06', N'戢娅', N'560.19')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201412', N'0210', N'2014300174', N'1002', N'戢娅', N'285.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201412', N'0210', N'2014300174', N'1006', N'戢娅', N'300.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201412', N'0210', N'2014300174', N'14', N'戢娅', N'128.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201412', N'0210', N'2014300174', N'16', N'戢娅', N'32.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201412', N'0210', N'2014300174', N'17', N'戢娅', N'32.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201412', N'030903', N'2014300174', N'0403', N'戢娅', N'80.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201412', N'030904', N'2014300174', N'05', N'戢娅', N'260.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201412', N'030906', N'2014300174', N'05', N'戢娅', N'35.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201412', N'031501', N'2014300174', N'1001', N'戢娅', N'133.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201412', N'031502', N'2014300174', N'1002', N'戢娅', N'150.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201412', N'031503', N'2014300174', N'1003', N'戢娅', N'135.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201412', N'031804', N'2014300174', N'0201', N'戢娅', N'38.71')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201412', N'031804', N'2014300174', N'020101', N'戢娅', N'61.25')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201412', N'031805', N'2014300174', N'0101', N'戢娅', N'951.58')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201412', N'031805', N'2014300174', N'010101', N'戢娅', N'62.20')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0202', N'2015000875', N'06', N'智台', N'2382.99')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0202', N'2015000875', N'10', N'智台', N'3.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0202', N'2015000875', N'11', N'智台', N'74.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0202', N'2015000875', N'14', N'智台', N'230.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0202', N'2015000875', N'15', N'智台', N'12.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0202', N'2015000875', N'16', N'智台', N'44.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0202', N'2015000875', N'17', N'智台', N'48.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0202', N'2015001432', N'06', N'笱坤', N'8.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0202', N'2015001432', N'14', N'笱坤', N'42.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0202', N'2015001432', N'15', N'笱坤', N'3.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0202', N'2015001432', N'16', N'笱坤', N'9.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0202', N'2015001432', N'17', N'笱坤', N'8.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0203', N'2014300175', N'06', N'聂羽禾', N'2086.52')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0203', N'2014300175', N'11', N'聂羽禾', N'368.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0203', N'2014300175', N'14', N'聂羽禾', N'288.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0203', N'2014300175', N'15', N'聂羽禾', N'27.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0203', N'2014300175', N'16', N'聂羽禾', N'72.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0203', N'2014300175', N'17', N'聂羽禾', N'72.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0203', N'2014300175', N'24', N'聂羽禾', N'15.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0203', N'2015000665', N'010101', N'谌瑄', N'45.48')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0203', N'2015000665', N'06', N'谌瑄', N'134.29')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0203', N'2015000665', N'10', N'谌瑄', N'3.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0203', N'2015000665', N'14', N'谌瑄', N'81.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0203', N'2015000665', N'15', N'谌瑄', N'9.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0203', N'2015000665', N'16', N'谌瑄', N'18.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0203', N'2015000665', N'17', N'谌瑄', N'24.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0204', N'2015000036', N'05', N'龙舆', N'420.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0204', N'2015000036', N'06', N'龙舆', N'622.23')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0204', N'2015000036', N'14', N'龙舆', N'189.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0204', N'2015000036', N'16', N'龙舆', N'42.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0204', N'2015000036', N'17', N'龙舆', N'56.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0204', N'2015000176', N'06', N'牟弟', N'480.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0204', N'2015000876', N'010101', N'戎要', N'32.46')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0204', N'2015000876', N'05', N'戎要', N'10.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0204', N'2015000876', N'06', N'戎要', N'1351.48')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0204', N'2015000876', N'10', N'戎要', N'3.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0204', N'2015000876', N'11', N'戎要', N'70.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0204', N'2015000876', N'14', N'戎要', N'256.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0204', N'2015000876', N'16', N'戎要', N'64.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0204', N'2015000876', N'17', N'戎要', N'64.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0204', N'2015001081', N'010101', N'彭萍', N'4.69')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0204', N'2015001081', N'06', N'彭萍', N'122.01')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0204', N'2015001081', N'14', N'彭萍', N'224.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0204', N'2015001081', N'16', N'彭萍', N'56.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0204', N'2015001081', N'17', N'彭萍', N'56.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0204', N'2015001225', N'010101', N'迈熠', N'13.62')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0204', N'2015001225', N'05', N'迈熠', N'10.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0204', N'2015001225', N'06', N'迈熠', N'594.74')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0204', N'2015001225', N'14', N'迈熠', N'192.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0204', N'2015001225', N'16', N'迈熠', N'48.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0204', N'2015001225', N'17', N'迈熠', N'48.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0205', N'2015000176', N'05', N'牟弟', N'420.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0205', N'2015000176', N'06', N'牟弟', N'249.89')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0205', N'2015000176', N'14', N'牟弟', N'192.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0205', N'2015000176', N'15', N'牟弟', N'18.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0205', N'2015000176', N'16', N'牟弟', N'48.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0205', N'2015000176', N'17', N'牟弟', N'48.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0205', N'2015000176', N'24', N'牟弟', N'15.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0205', N'2015000384', N'010101', N'翟里维', N'77.18')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0205', N'2015000384', N'06', N'翟里维', N'392.64')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0205', N'2015000384', N'14', N'翟里维', N'320.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0205', N'2015000384', N'15', N'翟里维', N'30.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0205', N'2015000384', N'16', N'翟里维', N'80.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0205', N'2015000384', N'17', N'翟里维', N'80.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0205', N'2015000876', N'05', N'戎要', N'420.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0205', N'2015001012', N'010101', N'邱北', N'28.39')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0205', N'2015001012', N'06', N'邱北', N'1381.82')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0205', N'2015001012', N'11', N'邱北', N'306.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0205', N'2015001012', N'14', N'邱北', N'300.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0205', N'2015001012', N'15', N'邱北', N'18.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0205', N'2015001012', N'16', N'邱北', N'36.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0205', N'2015001012', N'17', N'邱北', N'48.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0205', N'2015001012', N'24', N'邱北', N'15.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0205', N'2015001434', N'05', N'鸥湧', N'420.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0205', N'2015001434', N'06', N'鸥湧', N'212.65')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0205', N'2015001434', N'14', N'鸥湧', N'192.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0205', N'2015001434', N'16', N'鸥湧', N'48.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0205', N'2015001434', N'17', N'鸥湧', N'48.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0208', N'2015000178', N'010101', N'看咬位', N'91.48')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0208', N'2015000178', N'06', N'看咬位', N'10660.12')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0208', N'2015000178', N'07', N'看咬位', N'162.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0208', N'2015000178', N'10', N'看咬位', N'3.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0208', N'2015000178', N'11', N'看咬位', N'1400.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0208', N'2015000178', N'14', N'看咬位', N'924.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0208', N'2015000178', N'15', N'看咬位', N'63.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0208', N'2015000178', N'16', N'看咬位', N'126.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0208', N'2015000178', N'17', N'看咬位', N'168.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0208', N'2015000178', N'24', N'看咬位', N'45.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0208', N'2015000387', N'010101', N'綦来琦', N'9.08')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0208', N'2015000387', N'06', N'綦来琦', N'717.60')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0208', N'2015000387', N'14', N'綦来琦', N'256.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0208', N'2015000387', N'16', N'綦来琦', N'40.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0208', N'2015000387', N'17', N'綦来琦', N'64.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0208', N'2015000662', N'010101', N'漆亨', N'50.09')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0208', N'2015000662', N'06', N'漆亨', N'2307.19')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0208', N'2015000662', N'10', N'漆亨', N'3.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0208', N'2015000662', N'11', N'漆亨', N'576.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0208', N'2015000662', N'14', N'漆亨', N'416.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0208', N'2015000662', N'15', N'漆亨', N'39.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0208', N'2015000662', N'16', N'漆亨', N'65.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0208', N'2015000662', N'17', N'漆亨', N'104.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0209', N'2015000871', N'010101', N'逯潞共', N'28.40')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0209', N'2015000871', N'0401', N'逯潞共', N'6.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0209', N'2015000871', N'06', N'逯潞共', N'2649.97')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0209', N'2015000871', N'07', N'逯潞共', N'662.04')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0209', N'2015000871', N'08', N'逯潞共', N'1763.40')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0209', N'2015000871', N'10', N'逯潞共', N'6.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0209', N'2015000871', N'1001', N'逯潞共', N'34.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0209', N'2015000871', N'1003', N'逯潞共', N'200.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0209', N'2015000871', N'1006', N'逯潞共', N'90.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0209', N'2015000871', N'11', N'逯潞共', N'21.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0209', N'2015000871', N'14', N'逯潞共', N'100.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0209', N'2015000871', N'17', N'逯潞共', N'8.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0209', N'2015000871', N'24', N'逯潞共', N'45.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0209', N'2015000871', N'49', N'逯潞共', N'80.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0210', N'2014300174', N'06', N'戢娅', N'158.77')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0210', N'2014300174', N'14', N'戢娅', N'32.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0210', N'2014300174', N'16', N'戢娅', N'8.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0210', N'2014300174', N'17', N'戢娅', N'8.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0210', N'2015000664', N'05', N'娄唐上', N'28.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0210', N'2015000664', N'06', N'娄唐上', N'460.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0210', N'2015000872', N'010101', N'T红', N'75.25')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0210', N'2015000872', N'05', N'T红', N'28.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0210', N'2015000872', N'06', N'T红', N'1223.40')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0210', N'2015000872', N'1002', N'T红', N'570.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0210', N'2015000872', N'1006', N'T红', N'540.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0210', N'2015000872', N'11', N'T红', N'171.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0210', N'2015000872', N'14', N'T红', N'384.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0210', N'2015000872', N'16', N'T红', N'96.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0210', N'2015000872', N'17', N'T红', N'96.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0211', N'2015001085', N'06', N'孙瑛达', N'150.12')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0211', N'2015001085', N'0701', N'孙瑛达', N'150.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0211', N'2015001085', N'10', N'孙瑛达', N'6.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0211', N'2015001085', N'14', N'孙瑛达', N'27.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0211', N'2015001085', N'15', N'孙瑛达', N'3.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0211', N'2015001085', N'16', N'孙瑛达', N'6.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0211', N'2015001085', N'17', N'孙瑛达', N'8.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0211', N'2015001085', N'24', N'孙瑛达', N'30.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0212', N'2014300384', N'010101', N'洪都党', N'143.36')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0212', N'2014300384', N'06', N'洪都党', N'203.32')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0212', N'2014300384', N'14', N'洪都党', N'256.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0212', N'2014300384', N'16', N'洪都党', N'64.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0212', N'2014300384', N'17', N'洪都党', N'64.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0212', N'2015000175', N'010101', N'凤戟祎', N'72.64')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0212', N'2015000175', N'06', N'凤戟祎', N'126.34')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0212', N'2015000175', N'14', N'凤戟祎', N'256.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0212', N'2015000175', N'16', N'凤戟祎', N'64.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0212', N'2015000175', N'17', N'凤戟祎', N'64.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0219', N'2015000035', N'010101', N'解甄敢', N'4.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0219', N'2015000035', N'06', N'解甄敢', N'216.14')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0219', N'2015000035', N'11', N'解甄敢', N'20.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0219', N'2015000035', N'14', N'解甄敢', N'64.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0219', N'2015000035', N'16', N'解甄敢', N'16.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0219', N'2015000035', N'17', N'解甄敢', N'16.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0219', N'2015000385', N'010101', N'辛在', N'24.40')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0219', N'2015000385', N'05', N'辛在', N'10.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0219', N'2015000385', N'06', N'辛在', N'519.24')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0219', N'2015000385', N'07', N'辛在', N'155.28')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0219', N'2015000385', N'08', N'辛在', N'200.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0219', N'2015000385', N'09', N'辛在', N'550.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0219', N'2015000385', N'1002', N'辛在', N'50.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0219', N'2015000385', N'1006', N'辛在', N'30.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0219', N'2015000385', N'11', N'辛在', N'2.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0219', N'2015000385', N'13', N'辛在', N'267.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0219', N'2015000385', N'14', N'辛在', N'128.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0219', N'2015000385', N'16', N'辛在', N'32.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0219', N'2015000385', N'17', N'辛在', N'40.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0220', N'2015001013', N'0101', N'饶法', N'1622.08')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0220', N'2015001013', N'010101', N'饶法', N'106.59')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0220', N'2015001013', N'06', N'饶法', N'1584.49')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0220', N'2015001013', N'1001', N'饶法', N'28.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0220', N'2015001013', N'14', N'饶法', N'294.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0220', N'2015001013', N'16', N'饶法', N'63.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0220', N'2015001013', N'17', N'饶法', N'56.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0220', N'2015001014', N'0101', N'黄忱谦', N'1622.08')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0220', N'2015001014', N'010101', N'黄忱谦', N'135.73')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0220', N'2015001014', N'06', N'黄忱谦', N'1469.27')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0220', N'2015001014', N'1001', N'黄忱谦', N'193.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0220', N'2015001014', N'1002', N'黄忱谦', N'150.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0220', N'2015001014', N'1006', N'黄忱谦', N'100.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0220', N'2015001014', N'14', N'黄忱谦', N'294.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0220', N'2015001014', N'16', N'黄忱谦', N'63.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0220', N'2015001014', N'17', N'黄忱谦', N'56.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0220', N'2015001015', N'0101', N'简改', N'1899.87')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0220', N'2015001015', N'010101', N'简改', N'63.56')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0220', N'2015001015', N'06', N'简改', N'1013.48')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0220', N'2015001015', N'1001', N'简改', N'193.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0220', N'2015001015', N'1002', N'简改', N'315.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0220', N'2015001015', N'1003', N'简改', N'348.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0220', N'2015001015', N'1006', N'简改', N'348.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0220', N'2015001015', N'14', N'简改', N'252.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0220', N'2015001015', N'16', N'简改', N'54.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0220', N'2015001015', N'17', N'简改', N'48.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0223', N'2015000037', N'0101', N'薛桢桥', N'235.52')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0223', N'2015000037', N'010101', N'薛桢桥', N'203.24')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0223', N'2015000037', N'06', N'薛桢桥', N'413.10')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0223', N'2015000037', N'1002', N'薛桢桥', N'260.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0223', N'2015000037', N'1003', N'薛桢桥', N'240.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0223', N'2015000037', N'1006', N'薛桢桥', N'85.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0223', N'2015000037', N'14', N'薛桢桥', N'352.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0223', N'2015000037', N'16', N'薛桢桥', N'88.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0223', N'2015000037', N'17', N'薛桢桥', N'88.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0223', N'2015000174', N'010101', N'时遒萍', N'108.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0223', N'2015000174', N'06', N'时遒萍', N'183.60')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0223', N'2015000174', N'1002', N'时遒萍', N'260.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0223', N'2015000174', N'1003', N'时遒萍', N'240.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0223', N'2015000174', N'1006', N'时遒萍', N'85.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0223', N'2015000174', N'14', N'时遒萍', N'108.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0223', N'2015000174', N'16', N'时遒萍', N'54.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0223', N'2015000174', N'17', N'时遒萍', N'72.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0223', N'2015000383', N'010101', N'但枚', N'129.92')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0223', N'2015000383', N'06', N'但枚', N'235.05')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0223', N'2015000383', N'1002', N'但枚', N'520.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0223', N'2015000383', N'1003', N'但枚', N'240.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0223', N'2015000383', N'1006', N'但枚', N'170.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0223', N'2015000383', N'11', N'但枚', N'12.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0223', N'2015000383', N'14', N'但枚', N'256.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0223', N'2015000383', N'16', N'但枚', N'64.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0223', N'2015000383', N'17', N'但枚', N'64.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0223', N'2015000874', N'010101', N'丹字粟', N'112.46')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0223', N'2015000874', N'06', N'丹字粟', N'379.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0223', N'2015000874', N'1006', N'丹字粟', N'480.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0223', N'2015000874', N'11', N'丹字粟', N'8.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0223', N'2015000874', N'14', N'丹字粟', N'462.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0223', N'2015000874', N'16', N'丹字粟', N'99.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0223', N'2015000874', N'17', N'丹字粟', N'88.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0223', N'2015001083', N'010101', N'湖航', N'160.71')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0223', N'2015001083', N'06', N'湖航', N'296.98')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0223', N'2015001083', N'14', N'湖航', N'156.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0223', N'2015001083', N'16', N'湖航', N'48.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0223', N'2015001083', N'17', N'湖航', N'104.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0223', N'2015001083', N'24', N'湖航', N'15.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0224', N'2015000664', N'010101', N'娄唐上', N'85.66')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0224', N'2015000664', N'06', N'娄唐上', N'265.78')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0224', N'2015000664', N'14', N'娄唐上', N'612.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0224', N'2015000664', N'16', N'娄唐上', N'144.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0224', N'2015000664', N'17', N'娄唐上', N'144.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0224', N'2015000664', N'24', N'娄唐上', N'45.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0226', N'2015001082', N'010101', N'甘器', N'39.45')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0226', N'2015001082', N'06', N'甘器', N'2081.34')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0226', N'2015001082', N'14', N'甘器', N'135.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0226', N'2015001082', N'16', N'甘器', N'15.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0226', N'2015001082', N'17', N'甘器', N'40.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0228', N'2015000175', N'010101', N'凤戟祎', N'13.59')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0228', N'2015000175', N'06', N'凤戟祎', N'97.52')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0228', N'2015000175', N'07', N'凤戟祎', N'400.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0275', N'2015000874', N'06', N'丹字粟', N'8.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0275', N'2015000874', N'24', N'丹字粟', N'15.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'030901', N'2014300175', N'0401', N'聂羽禾', N'250.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'030901', N'2014300384', N'0401', N'洪都党', N'375.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'030901', N'2015000037', N'0401', N'薛桢桥', N'300.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'030901', N'2015000176', N'0401', N'牟弟', N'250.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'030901', N'2015000178', N'0401', N'看咬位', N'850.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'030901', N'2015000383', N'0401', N'但枚', N'300.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'030901', N'2015000384', N'0401', N'翟里维', N'250.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'030901', N'2015000662', N'0401', N'漆亨', N'550.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'030901', N'2015000664', N'0101', N'娄唐上', N'414.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'030901', N'2015000664', N'0401', N'娄唐上', N'1085.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'030901', N'2015000664', N'06', N'娄唐上', N'16.93')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'030901', N'2015000665', N'0401', N'谌瑄', N'550.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'030901', N'2015000874', N'0401', N'丹字粟', N'300.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'030901', N'2015000876', N'0401', N'戎要', N'300.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'030901', N'2015001014', N'0401', N'黄忱谦', N'250.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'030901', N'2015001081', N'0401', N'彭萍', N'250.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'030901', N'2015001083', N'04', N'湖航', N'342.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'030901', N'2015001083', N'0401', N'湖航', N'975.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'030901', N'2015001083', N'06', N'湖航', N'16.93')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'030901', N'2015001085', N'0401', N'孙瑛达', N'780.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'030901', N'2015001225', N'0401', N'迈熠', N'250.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'030901', N'2015001432', N'0401', N'笱坤', N'425.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'030901', N'2015001434', N'0401', N'鸥湧', N'250.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'030902', N'2014300175', N'0402', N'聂羽禾', N'1920.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'030902', N'2015000036', N'0402', N'龙舆', N'1260.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'030902', N'2015000176', N'0101', N'牟弟', N'222.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'030902', N'2015000176', N'0402', N'牟弟', N'1380.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'030902', N'2015000176', N'06', N'牟弟', N'8.40')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'030902', N'2015000664', N'0402', N'娄唐上', N'600.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'030902', N'2015000874', N'0402', N'丹字粟', N'600.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'030902', N'2015000875', N'0101', N'智台', N'222.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'030902', N'2015000875', N'0402', N'智台', N'1380.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'030902', N'2015000875', N'06', N'智台', N'8.40')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'030902', N'2015001012', N'0402', N'邱北', N'1920.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'030902', N'2015001434', N'0402', N'鸥湧', N'1260.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'030903', N'2014300175', N'0403', N'聂羽禾', N'80.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'030903', N'2014300384', N'0101', N'洪都党', N'4.15')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'030903', N'2014300384', N'0403', N'洪都党', N'350.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'030903', N'2015000036', N'0403', N'龙舆', N'262.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'030903', N'2015000175', N'0403', N'凤戟祎', N'80.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'030903', N'2015000176', N'0403', N'牟弟', N'393.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'030903', N'2015000871', N'0403', N'逯潞共', N'870.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'030903', N'2015000872', N'0403', N'T红', N'80.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'030903', N'2015000875', N'0403', N'智台', N'80.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'030903', N'2015001081', N'0403', N'彭萍', N'262.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'030903', N'2015001085', N'0403', N'孙瑛达', N'80.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'030903', N'2015001434', N'0403', N'鸥湧', N'262.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'030904', N'2014300175', N'05', N'聂羽禾', N'520.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'030904', N'2015000035', N'05', N'解甄敢', N'110.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'030904', N'2015000036', N'05', N'龙舆', N'410.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'030904', N'2015000037', N'05', N'薛桢桥', N'200.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'030904', N'2015000174', N'05', N'时遒萍', N'310.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'030904', N'2015000175', N'05', N'凤戟祎', N'380.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'030904', N'2015000176', N'05', N'牟弟', N'410.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'030904', N'2015000178', N'05', N'看咬位', N'260.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'030904', N'2015000383', N'05', N'但枚', N'200.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'030904', N'2015000385', N'05', N'辛在', N'260.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'030904', N'2015000662', N'05', N'漆亨', N'70.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'030904', N'2015000664', N'05', N'娄唐上', N'200.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'030904', N'2015000665', N'05', N'谌瑄', N'420.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'030904', N'2015000871', N'05', N'逯潞共', N'150.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'030904', N'2015000872', N'05', N'T红', N'200.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'030904', N'2015000874', N'05', N'丹字粟', N'480.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'030904', N'2015000875', N'05', N'智台', N'220.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'030904', N'2015000876', N'05', N'戎要', N'520.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'030904', N'2015001012', N'05', N'邱北', N'450.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'030904', N'2015001081', N'05', N'彭萍', N'410.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'030904', N'2015001085', N'05', N'孙瑛达', N'460.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'030904', N'2015001225', N'05', N'迈熠', N'650.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'030904', N'2015001432', N'05', N'笱坤', N'150.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'030904', N'2015001434', N'05', N'鸥湧', N'410.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'030906', N'2014300175', N'05', N'聂羽禾', N'40.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'030906', N'2014300384', N'05', N'洪都党', N'35.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'030906', N'2015000035', N'05', N'解甄敢', N'35.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'030906', N'2015000037', N'05', N'薛桢桥', N'40.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'030906', N'2015000174', N'05', N'时遒萍', N'35.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'030906', N'2015000175', N'05', N'凤戟祎', N'35.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'030906', N'2015000176', N'05', N'牟弟', N'35.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'030906', N'2015000178', N'05', N'看咬位', N'45.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'030906', N'2015000383', N'05', N'但枚', N'35.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'030906', N'2015000384', N'05', N'翟里维', N'40.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'030906', N'2015000385', N'05', N'辛在', N'35.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'030906', N'2015000387', N'05', N'綦来琦', N'35.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'030906', N'2015000662', N'05', N'漆亨', N'35.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'030906', N'2015000664', N'05', N'娄唐上', N'35.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'030906', N'2015000665', N'05', N'谌瑄', N'35.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'030906', N'2015000871', N'05', N'逯潞共', N'80.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'030906', N'2015000872', N'05', N'T红', N'160.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'030906', N'2015000874', N'05', N'丹字粟', N'35.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'030906', N'2015000875', N'05', N'智台', N'35.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'030906', N'2015001012', N'05', N'邱北', N'95.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'030906', N'2015001013', N'05', N'饶法', N'40.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'030906', N'2015001081', N'05', N'彭萍', N'35.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'030906', N'2015001085', N'05', N'孙瑛达', N'35.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'030906', N'2015001434', N'05', N'鸥湧', N'35.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0311', N'2015000175', N'05', N'凤戟祎', N'250.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0315', N'2015000871', N'06', N'逯潞共', N'4.60')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0315', N'2015000871', N'12', N'逯潞共', N'920.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031501', N'2014300175', N'1001', N'聂羽禾', N'195.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031501', N'2014300384', N'1001', N'洪都党', N'105.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031501', N'2015000035', N'1001', N'解甄敢', N'193.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031501', N'2015000036', N'1001', N'龙舆', N'58.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031501', N'2015000037', N'1001', N'薛桢桥', N'226.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031501', N'2015000174', N'1001', N'时遒萍', N'88.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031501', N'2015000175', N'1001', N'凤戟祎', N'58.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031501', N'2015000176', N'1001', N'牟弟', N'193.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031501', N'2015000178', N'1001', N'看咬位', N'195.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031501', N'2015000383', N'1001', N'但枚', N'241.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031501', N'2015000384', N'1001', N'翟里维', N'133.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031501', N'2015000385', N'1001', N'辛在', N'223.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031501', N'2015000387', N'1001', N'綦来琦', N'193.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031501', N'2015000662', N'1001', N'漆亨', N'196.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031501', N'2015000664', N'1001', N'娄唐上', N'193.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031501', N'2015000665', N'1001', N'谌瑄', N'165.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031501', N'2015000871', N'1001', N'逯潞共', N'165.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031501', N'2015000872', N'1001', N'T红', N'193.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031501', N'2015000874', N'1001', N'丹字粟', N'109.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031501', N'2015000875', N'1001', N'智台', N'223.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031501', N'2015000876', N'1001', N'戎要', N'228.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031501', N'2015001012', N'1001', N'邱北', N'193.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031501', N'2015001013', N'1001', N'饶法', N'170.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031501', N'2015001081', N'1001', N'彭萍', N'193.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031501', N'2015001083', N'1001', N'湖航', N'168.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031501', N'2015001085', N'1001', N'孙瑛达', N'165.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031501', N'2015001225', N'1001', N'迈熠', N'193.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031501', N'2015001434', N'1001', N'鸥湧', N'193.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031502', N'2014300175', N'1002', N'聂羽禾', N'390.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031502', N'2014300175', N'1006', N'聂羽禾', N'55.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031502', N'2014300384', N'1002', N'洪都党', N'505.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031502', N'2014300384', N'1006', N'洪都党', N'55.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031502', N'2015000036', N'1002', N'龙舆', N'270.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031502', N'2015000037', N'1002', N'薛桢桥', N'555.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031502', N'2015000175', N'1002', N'凤戟祎', N'450.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031502', N'2015000176', N'1002', N'牟弟', N'555.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031502', N'2015000178', N'1002', N'看咬位', N'435.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031502', N'2015000383', N'1002', N'但枚', N'285.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031502', N'2015000384', N'1002', N'翟里维', N'435.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031502', N'2015000662', N'1002', N'漆亨', N'600.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031502', N'2015000662', N'1006', N'漆亨', N'100.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031502', N'2015000664', N'1002', N'娄唐上', N'665.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031502', N'2015000664', N'1006', N'娄唐上', N'55.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031502', N'2015000871', N'1002', N'逯潞共', N'105.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031502', N'2015000871', N'1006', N'逯潞共', N'55.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031502', N'2015000872', N'1002', N'T红', N'150.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031502', N'2015000875', N'1002', N'智台', N'560.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031502', N'2015000876', N'1002', N'戎要', N'985.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031502', N'2015000876', N'1006', N'戎要', N'100.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031502', N'2015001012', N'1002', N'邱北', N'405.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031502', N'2015001013', N'1002', N'饶法', N'435.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031502', N'2015001081', N'1002', N'彭萍', N'270.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031502', N'2015001085', N'1002', N'孙瑛达', N'105.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031502', N'2015001085', N'1006', N'孙瑛达', N'55.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031502', N'2015001225', N'1002', N'迈熠', N'120.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031502', N'2015001434', N'1002', N'鸥湧', N'150.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031503', N'2014300175', N'1003', N'聂羽禾', N'371.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031503', N'2014300175', N'1006', N'聂羽禾', N'128.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031503', N'2014300384', N'1003', N'洪都党', N'193.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031503', N'2015000035', N'1003', N'解甄敢', N'146.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031503', N'2015000036', N'1003', N'龙舆', N'190.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031503', N'2015000037', N'1003', N'薛桢桥', N'407.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031503', N'2015000037', N'1006', N'薛桢桥', N'290.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031503', N'2015000174', N'1003', N'时遒萍', N'135.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031503', N'2015000175', N'1003', N'凤戟祎', N'178.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031503', N'2015000176', N'1003', N'牟弟', N'348.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031503', N'2015000176', N'1006', N'牟弟', N'128.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031503', N'2015000178', N'1003', N'看咬位', N'268.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031503', N'2015000178', N'1006', N'看咬位', N'368.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031503', N'2015000383', N'1003', N'但枚', N'288.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031503', N'2015000384', N'1003', N'翟里维', N'348.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031503', N'2015000384', N'1006', N'翟里维', N'128.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031503', N'2015000385', N'1003', N'辛在', N'146.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031503', N'2015000387', N'1003', N'綦来琦', N'268.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031503', N'2015000387', N'1006', N'綦来琦', N'128.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031503', N'2015000662', N'1003', N'漆亨', N'268.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031503', N'2015000662', N'1006', N'漆亨', N'128.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031503', N'2015000664', N'1002', N'娄唐上', N'160.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031503', N'2015000664', N'1003', N'娄唐上', N'235.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031503', N'2015000871', N'1003', N'逯潞共', N'268.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031503', N'2015000871', N'1006', N'逯潞共', N'128.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031503', N'2015000872', N'1003', N'T红', N'315.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031503', N'2015000872', N'1006', N'T红', N'30.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031503', N'2015000874', N'1003', N'丹字粟', N'204.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031503', N'2015000875', N'1003', N'智台', N'292.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031503', N'2015000875', N'1006', N'智台', N'128.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031503', N'2015000876', N'1003', N'戎要', N'468.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031503', N'2015000876', N'1006', N'戎要', N'368.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031503', N'2015001012', N'1002', N'邱北', N'570.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031503', N'2015001012', N'1003', N'邱北', N'135.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031503', N'2015001012', N'1006', N'邱北', N'100.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031503', N'2015001013', N'1003', N'饶法', N'215.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031503', N'2015001014', N'1003', N'黄忱谦', N'191.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031503', N'2015001081', N'1003', N'彭萍', N'268.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031503', N'2015001081', N'1006', N'彭萍', N'128.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031503', N'2015001083', N'1003', N'湖航', N'178.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031503', N'2015001085', N'1003', N'孙瑛达', N'135.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031503', N'2015001225', N'1003', N'迈熠', N'268.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031503', N'2015001225', N'1006', N'迈熠', N'128.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031503', N'2015001434', N'1003', N'鸥湧', N'215.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031504', N'2014300175', N'1004', N'聂羽禾', N'65.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031504', N'2015000871', N'1004', N'逯潞共', N'60.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031504', N'2015001085', N'1004', N'孙瑛达', N'40.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031505', N'2015000037', N'1005', N'薛桢桥', N'410.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031505', N'2015000174', N'1005', N'时遒萍', N'130.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031505', N'2015000178', N'1005', N'看咬位', N'240.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031505', N'2015000383', N'1005', N'但枚', N'130.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031505', N'2015000872', N'1005', N'T红', N'120.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031505', N'2015000874', N'1005', N'丹字粟', N'410.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031505', N'2015000876', N'1005', N'戎要', N'120.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031505', N'2015001083', N'1005', N'湖航', N'280.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031506', N'2015000664', N'1006', N'娄唐上', N'420.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031506', N'2015001014', N'1006', N'黄忱谦', N'130.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031804', N'2015000037', N'0201', N'薛桢桥', N'90.39')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031804', N'2015000178', N'020101', N'看咬位', N'73.15')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031804', N'2015000385', N'0201', N'辛在', N'169.82')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031804', N'2015000387', N'020101', N'綦来琦', N'200.87')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031804', N'2015000664', N'020101', N'娄唐上', N'28.90')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031804', N'2015000872', N'020101', N'T红', N'87.39')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031804', N'2015000874', N'0201', N'丹字粟', N'87.72')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031804', N'2015001081', N'0201', N'彭萍', N'63.28')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031804', N'2015001083', N'020101', N'湖航', N'13.22')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031804', N'2015001434', N'0201', N'鸥湧', N'32.46')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031805', N'2014300175', N'0101', N'聂羽禾', N'4368.92')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031805', N'2014300175', N'010101', N'聂羽禾', N'294.36')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031805', N'2014300384', N'0101', N'洪都党', N'1415.20')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031805', N'2014300384', N'010101', N'洪都党', N'28.72')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031805', N'2015000035', N'010101', N'解甄敢', N'9.96')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031805', N'2015000036', N'0101', N'龙舆', N'1028.42')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031805', N'2015000036', N'010101', N'龙舆', N'131.01')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031805', N'2015000036', N'0102', N'龙舆', N'93.54')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031805', N'2015000036', N'010201', N'龙舆', N'28.22')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031805', N'2015000037', N'0101', N'薛桢桥', N'1172.61')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031805', N'2015000037', N'010101', N'薛桢桥', N'2202.16')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031805', N'2015000037', N'0102', N'薛桢桥', N'26.79')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031805', N'2015000174', N'0101', N'时遒萍', N'1428.66')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031805', N'2015000174', N'010101', N'时遒萍', N'1.32')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031805', N'2015000175', N'0101', N'凤戟祎', N'2186.40')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031805', N'2015000176', N'0101', N'牟弟', N'1423.20')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031805', N'2015000176', N'010101', N'牟弟', N'105.50')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031805', N'2015000178', N'0101', N'看咬位', N'3716.60')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031805', N'2015000178', N'010101', N'看咬位', N'2070.79')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031805', N'2015000178', N'0102', N'看咬位', N'218.26')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031805', N'2015000383', N'0101', N'但枚', N'1069.56')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031805', N'2015000383', N'010101', N'但枚', N'414.27')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031805', N'2015000384', N'0101', N'翟里维', N'2921.96')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031805', N'2015000384', N'010101', N'翟里维', N'144.28')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031805', N'2015000385', N'0101', N'辛在', N'1080.09')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031805', N'2015000385', N'010101', N'辛在', N'77.82')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031805', N'2015000385', N'0102', N'辛在', N'358.44')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031805', N'2015000387', N'0101', N'綦来琦', N'853.98')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031805', N'2015000387', N'010101', N'綦来琦', N'27.24')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031805', N'2015000662', N'0101', N'漆亨', N'2401.26')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031805', N'2015000662', N'010101', N'漆亨', N'58.70')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031805', N'2015000664', N'0101', N'娄唐上', N'3071.08')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031805', N'2015000664', N'010101', N'娄唐上', N'15.21')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031805', N'2015000665', N'0101', N'谌瑄', N'545.03')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031805', N'2015000665', N'010101', N'谌瑄', N'10.56')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031805', N'2015000871', N'0101', N'逯潞共', N'1169.56')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031805', N'2015000871', N'010101', N'逯潞共', N'199.01')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031805', N'2015000872', N'0101', N'T红', N'3634.39')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031805', N'2015000872', N'010101', N'T红', N'2254.55')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031805', N'2015000874', N'0101', N'丹字粟', N'4043.24')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031805', N'2015000874', N'010101', N'丹字粟', N'250.63')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031805', N'2015000875', N'0101', N'智台', N'1181.52')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031805', N'2015000875', N'010101', N'智台', N'402.06')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031805', N'2015000876', N'0101', N'戎要', N'1590.05')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031805', N'2015000876', N'010101', N'戎要', N'1997.53')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031805', N'2015001012', N'0101', N'邱北', N'1910.74')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031805', N'2015001012', N'010101', N'邱北', N'163.05')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031805', N'2015001081', N'0101', N'彭萍', N'1446.01')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031805', N'2015001081', N'010101', N'彭萍', N'73.99')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031805', N'2015001082', N'0101', N'甘器', N'149.06')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031805', N'2015001082', N'010101', N'甘器', N'148.65')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031805', N'2015001082', N'010201', N'甘器', N'34.19')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031805', N'2015001083', N'0101', N'湖航', N'3341.38')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031805', N'2015001083', N'010101', N'湖航', N'356.44')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031805', N'2015001085', N'0101', N'孙瑛达', N'974.94')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031805', N'2015001085', N'010101', N'孙瑛达', N'17.08')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031805', N'2015001225', N'0101', N'迈熠', N'1292.25')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031805', N'2015001225', N'010101', N'迈熠', N'165.24')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031805', N'2015001434', N'0101', N'鸥湧', N'1617.58')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'031805', N'2015001434', N'010101', N'鸥湧', N'171.01')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0320', N'2014300384', N'05', N'洪都党', N'210.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0320', N'2015000874', N'05', N'丹字粟', N'80.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0320', N'2015000874', N'11', N'丹字粟', N'40.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0320', N'2015001083', N'05', N'湖航', N'80.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0320', N'2015001083', N'11', N'湖航', N'40.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0321', N'2015000037', N'06', N'薛桢桥', N'110.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0321', N'2015000174', N'06', N'时遒萍', N'110.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0321', N'2015000178', N'05', N'看咬位', N'160.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0321', N'2015000178', N'06', N'看咬位', N'316.02')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0321', N'2015000178', N'08', N'看咬位', N'5.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0321', N'2015000178', N'11', N'看咬位', N'4.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0321', N'2015000383', N'06', N'但枚', N'110.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] VALUES (N'201501', N'0324', N'2015001083', N'05', N'湖航', N'260.00')
GO


-- ----------------------------
-- Table structure for Stat_Hosp_Fee_Office
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Stat_Hosp_Fee_Office]') AND type IN ('U'))
	DROP TABLE [dbo].[Stat_Hosp_Fee_Office]
GO

CREATE TABLE [dbo].[Stat_Hosp_Fee_Office] (
  [StatDate] varchar(8) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [OfficeID] varchar(8) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [StatTypeID] varchar(8) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [SumPrice] numeric(18,2)  NULL
)
GO

ALTER TABLE [dbo].[Stat_Hosp_Fee_Office] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of Stat_Hosp_Fee_Office
-- ----------------------------
INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201412', N'0210', N'0101', N'951.58')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201412', N'0210', N'010101', N'107.60')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201412', N'0210', N'0201', N'38.71')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201412', N'0210', N'020101', N'61.25')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201412', N'0210', N'0403', N'80.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201412', N'0210', N'05', N'323.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201412', N'0210', N'06', N'560.19')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201412', N'0210', N'1001', N'133.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201412', N'0210', N'1002', N'435.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201412', N'0210', N'1003', N'135.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201412', N'0210', N'1006', N'300.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201412', N'0210', N'14', N'128.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201412', N'0210', N'16', N'32.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201412', N'0210', N'17', N'32.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0202', N'0101', N'1403.52')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0202', N'010101', N'402.06')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0202', N'0401', N'425.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0202', N'0402', N'1380.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0202', N'0403', N'80.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0202', N'05', N'405.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0202', N'06', N'2399.39')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0202', N'10', N'3.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0202', N'1001', N'223.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0202', N'1002', N'560.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0202', N'1003', N'292.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0202', N'1006', N'128.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0202', N'11', N'74.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0202', N'14', N'272.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0202', N'15', N'15.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0202', N'16', N'53.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0202', N'17', N'56.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0203', N'0101', N'4913.95')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0203', N'010101', N'350.40')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0203', N'0401', N'800.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0203', N'0402', N'1920.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0203', N'0403', N'80.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0203', N'05', N'1015.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0203', N'06', N'2220.81')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0203', N'10', N'3.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0203', N'1001', N'360.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0203', N'1002', N'390.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0203', N'1003', N'371.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0203', N'1004', N'65.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0203', N'1006', N'183.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0203', N'11', N'368.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0203', N'14', N'369.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0203', N'15', N'36.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0203', N'16', N'90.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0203', N'17', N'96.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0203', N'24', N'15.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0204', N'0101', N'5356.73')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0204', N'010101', N'2418.54')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0204', N'0102', N'93.54')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0204', N'010201', N'28.22')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0204', N'0201', N'63.28')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0204', N'0401', N'800.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0204', N'0402', N'1260.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0204', N'0403', N'524.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0204', N'05', N'2925.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0204', N'06', N'2690.46')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0204', N'10', N'3.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0204', N'1001', N'865.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0204', N'1002', N'2200.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0204', N'1003', N'1384.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0204', N'1005', N'120.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0204', N'1006', N'1014.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0204', N'11', N'70.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0204', N'14', N'861.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0204', N'16', N'210.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0204', N'17', N'224.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0205', N'0101', N'8095.48')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0205', N'010101', N'689.41')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0205', N'0201', N'32.46')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0205', N'0401', N'750.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0205', N'0402', N'4560.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0205', N'0403', N'655.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0205', N'05', N'2315.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0205', N'06', N'2725.40')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0205', N'1001', N'712.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0205', N'1002', N'2115.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0205', N'1003', N'1046.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0205', N'1006', N'356.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0205', N'11', N'306.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0205', N'14', N'1004.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0205', N'15', N'66.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0205', N'16', N'212.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0205', N'17', N'224.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0205', N'24', N'30.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0208', N'0101', N'6971.84')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0208', N'010101', N'2307.38')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0208', N'0102', N'218.26')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0208', N'020101', N'274.02')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0208', N'0401', N'1400.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0208', N'05', N'605.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0208', N'06', N'14000.93')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0208', N'07', N'162.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0208', N'08', N'5.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0208', N'10', N'6.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0208', N'1001', N'584.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0208', N'1002', N'1035.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0208', N'1003', N'804.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0208', N'1005', N'240.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0208', N'1006', N'724.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0208', N'11', N'1980.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0208', N'14', N'1596.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0208', N'15', N'102.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0208', N'16', N'231.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0208', N'17', N'336.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0208', N'24', N'45.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0209', N'0101', N'1169.56')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0209', N'010101', N'227.41')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0209', N'0401', N'6.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0209', N'0403', N'870.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0209', N'05', N'230.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0209', N'06', N'2654.57')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0209', N'07', N'662.04')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0209', N'08', N'1763.40')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0209', N'10', N'6.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0209', N'1001', N'199.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0209', N'1002', N'105.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0209', N'1003', N'468.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0209', N'1004', N'60.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0209', N'1006', N'273.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0209', N'11', N'21.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0209', N'12', N'920.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0209', N'14', N'100.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0209', N'17', N'8.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0209', N'24', N'45.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0209', N'49', N'80.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0210', N'0101', N'3634.39')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0210', N'010101', N'2329.80')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0210', N'020101', N'87.39')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0210', N'0403', N'80.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0210', N'05', N'388.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0210', N'06', N'1382.17')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0210', N'1001', N'193.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0210', N'1002', N'720.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0210', N'1003', N'315.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0210', N'1005', N'120.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0210', N'1006', N'570.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0210', N'11', N'171.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0210', N'14', N'416.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0210', N'16', N'104.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0210', N'17', N'104.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0211', N'0101', N'974.94')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0211', N'010101', N'17.08')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0211', N'0401', N'780.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0211', N'0403', N'80.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0211', N'05', N'495.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0211', N'06', N'150.12')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0211', N'0701', N'150.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0211', N'10', N'6.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0211', N'1001', N'165.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0211', N'1002', N'105.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0211', N'1003', N'135.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0211', N'1004', N'40.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0211', N'1006', N'55.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0211', N'14', N'27.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0211', N'15', N'3.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0211', N'16', N'6.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0211', N'17', N'8.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0211', N'24', N'30.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0212', N'0101', N'3605.75')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0212', N'010101', N'258.31')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0212', N'0401', N'375.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0212', N'0403', N'430.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0212', N'05', N'910.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0212', N'06', N'427.18')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0212', N'07', N'400.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0212', N'1001', N'163.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0212', N'1002', N'955.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0212', N'1003', N'371.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0212', N'1006', N'55.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0212', N'14', N'512.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0212', N'16', N'128.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0212', N'17', N'128.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0219', N'0101', N'1080.09')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0219', N'010101', N'116.18')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0219', N'0102', N'358.44')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0219', N'0201', N'169.82')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0219', N'05', N'450.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0219', N'06', N'735.38')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0219', N'07', N'155.28')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0219', N'08', N'200.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0219', N'09', N'550.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0219', N'1001', N'416.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0219', N'1002', N'50.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0219', N'1003', N'292.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0219', N'1006', N'30.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0219', N'11', N'22.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0219', N'13', N'267.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0219', N'14', N'192.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0219', N'16', N'48.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0219', N'17', N'56.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0220', N'0101', N'5144.03')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0220', N'010101', N'305.88')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0220', N'0401', N'250.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0220', N'05', N'40.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0220', N'06', N'4067.24')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0220', N'1001', N'584.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0220', N'1002', N'900.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0220', N'1003', N'754.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0220', N'1006', N'578.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0220', N'14', N'840.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0220', N'16', N'180.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0220', N'17', N'160.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0223', N'0101', N'11290.97')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0223', N'010101', N'3939.15')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0223', N'0102', N'26.79')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0223', N'0201', N'178.11')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0223', N'020101', N'13.22')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0223', N'04', N'342.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0223', N'0401', N'1875.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0223', N'0402', N'600.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0223', N'05', N'1715.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0223', N'06', N'1862.66')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0223', N'1001', N'639.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0223', N'1002', N'1325.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0223', N'1003', N'1742.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0223', N'1005', N'1360.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0223', N'1006', N'820.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0223', N'11', N'100.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0223', N'14', N'1334.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0223', N'16', N'353.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0223', N'17', N'416.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0223', N'24', N'30.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0224', N'0101', N'3485.08')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0224', N'010101', N'100.87')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0224', N'020101', N'28.90')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0224', N'0401', N'1085.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0224', N'0402', N'600.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0224', N'05', N'263.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0224', N'06', N'742.71')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0224', N'1001', N'193.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0224', N'1002', N'825.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0224', N'1003', N'235.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0224', N'1006', N'475.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0224', N'14', N'612.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0224', N'16', N'144.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0224', N'17', N'144.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0224', N'24', N'45.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0226', N'0101', N'149.06')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0226', N'010101', N'188.10')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0226', N'010201', N'34.19')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0226', N'06', N'2081.34')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0226', N'14', N'135.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0226', N'16', N'15.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office] VALUES (N'201501', N'0226', N'17', N'40.00')
GO


-- ----------------------------
-- Table structure for Stat_Hosp_Fee_Office_ExecOffice
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Stat_Hosp_Fee_Office_ExecOffice]') AND type IN ('U'))
	DROP TABLE [dbo].[Stat_Hosp_Fee_Office_ExecOffice]
GO

CREATE TABLE [dbo].[Stat_Hosp_Fee_Office_ExecOffice] (
  [StatDate] varchar(8) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [OfficeID] varchar(8) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [ExecOfficeID] varchar(8) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [StatTypeID] varchar(8) COLLATE Chinese_PRC_CI_AS  NULL,
  [HospID] varchar(10) COLLATE Chinese_PRC_CI_AS  NULL,
  [PatientName] varchar(20) COLLATE Chinese_PRC_CI_AS  NULL,
  [SumPrice] numeric(18,2)  NULL
)
GO

ALTER TABLE [dbo].[Stat_Hosp_Fee_Office_ExecOffice] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of Stat_Hosp_Fee_Office_ExecOffice
-- ----------------------------
INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0202', N'0202', N'06', N'2015000875', N'智台', N'2382.99')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0202', N'0202', N'06', N'2015001432', N'笱坤', N'8.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0202', N'0202', N'10', N'2015000875', N'智台', N'3.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0202', N'0202', N'11', N'2015000875', N'智台', N'74.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0202', N'0202', N'14', N'2015000875', N'智台', N'230.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0202', N'0202', N'14', N'2015001432', N'笱坤', N'42.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0202', N'0202', N'15', N'2015000875', N'智台', N'12.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0202', N'0202', N'15', N'2015001432', N'笱坤', N'3.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0202', N'0202', N'16', N'2015000875', N'智台', N'44.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0202', N'0202', N'16', N'2015001432', N'笱坤', N'9.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0202', N'0202', N'17', N'2015000875', N'智台', N'48.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0202', N'0202', N'17', N'2015001432', N'笱坤', N'8.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0202', N'030901', N'0401', N'2015001432', N'笱坤', N'425.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0202', N'030902', N'0101', N'2015000875', N'智台', N'222.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0202', N'030902', N'0402', N'2015000875', N'智台', N'1380.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0202', N'030902', N'06', N'2015000875', N'智台', N'8.40')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0202', N'030903', N'0403', N'2015000875', N'智台', N'80.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0202', N'030904', N'05', N'2015000875', N'智台', N'220.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0202', N'030904', N'05', N'2015001432', N'笱坤', N'150.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0202', N'030906', N'05', N'2015000875', N'智台', N'35.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0202', N'031501', N'1001', N'2015000875', N'智台', N'223.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0202', N'031502', N'1002', N'2015000875', N'智台', N'560.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0202', N'031503', N'1003', N'2015000875', N'智台', N'292.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0202', N'031503', N'1006', N'2015000875', N'智台', N'128.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0202', N'031805', N'0101', N'2015000875', N'智台', N'1181.52')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0202', N'031805', N'010101', N'2015000875', N'智台', N'402.06')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0203', N'0203', N'010101', N'2015000665', N'谌瑄', N'45.48')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0203', N'0203', N'06', N'2014300175', N'聂羽禾', N'2086.52')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0203', N'0203', N'06', N'2015000665', N'谌瑄', N'134.29')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0203', N'0203', N'10', N'2015000665', N'谌瑄', N'3.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0203', N'0203', N'11', N'2014300175', N'聂羽禾', N'368.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0203', N'0203', N'14', N'2014300175', N'聂羽禾', N'288.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0203', N'0203', N'14', N'2015000665', N'谌瑄', N'81.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0203', N'0203', N'15', N'2014300175', N'聂羽禾', N'27.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0203', N'0203', N'15', N'2015000665', N'谌瑄', N'9.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0203', N'0203', N'16', N'2014300175', N'聂羽禾', N'72.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0203', N'0203', N'16', N'2015000665', N'谌瑄', N'18.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0203', N'0203', N'17', N'2014300175', N'聂羽禾', N'72.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0203', N'0203', N'17', N'2015000665', N'谌瑄', N'24.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0203', N'0203', N'24', N'2014300175', N'聂羽禾', N'15.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0203', N'030901', N'0401', N'2014300175', N'聂羽禾', N'250.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0203', N'030901', N'0401', N'2015000665', N'谌瑄', N'550.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0203', N'030902', N'0402', N'2014300175', N'聂羽禾', N'1920.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0203', N'030903', N'0403', N'2014300175', N'聂羽禾', N'80.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0203', N'030904', N'05', N'2014300175', N'聂羽禾', N'520.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0203', N'030904', N'05', N'2015000665', N'谌瑄', N'420.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0203', N'030906', N'05', N'2014300175', N'聂羽禾', N'40.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0203', N'030906', N'05', N'2015000665', N'谌瑄', N'35.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0203', N'031501', N'1001', N'2014300175', N'聂羽禾', N'195.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0203', N'031501', N'1001', N'2015000665', N'谌瑄', N'165.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0203', N'031502', N'1002', N'2014300175', N'聂羽禾', N'390.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0203', N'031502', N'1006', N'2014300175', N'聂羽禾', N'55.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0203', N'031503', N'1003', N'2014300175', N'聂羽禾', N'371.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0203', N'031503', N'1006', N'2014300175', N'聂羽禾', N'128.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0203', N'031504', N'1004', N'2014300175', N'聂羽禾', N'65.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0203', N'031805', N'0101', N'2014300175', N'聂羽禾', N'4368.92')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0203', N'031805', N'0101', N'2015000665', N'谌瑄', N'545.03')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0203', N'031805', N'010101', N'2014300175', N'聂羽禾', N'294.36')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0203', N'031805', N'010101', N'2015000665', N'谌瑄', N'10.56')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0204', N'0204', N'010101', N'2015000876', N'戎要', N'32.46')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0204', N'0204', N'010101', N'2015001081', N'彭萍', N'4.69')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0204', N'0204', N'010101', N'2015001225', N'迈熠', N'13.62')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0204', N'0204', N'05', N'2015000036', N'龙舆', N'420.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0204', N'0204', N'05', N'2015000876', N'戎要', N'10.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0204', N'0204', N'05', N'2015001225', N'迈熠', N'10.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0204', N'0204', N'06', N'2015000036', N'龙舆', N'622.23')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0204', N'0204', N'06', N'2015000876', N'戎要', N'1351.48')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0204', N'0204', N'06', N'2015001081', N'彭萍', N'122.01')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0204', N'0204', N'06', N'2015001225', N'迈熠', N'594.74')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0204', N'0204', N'10', N'2015000876', N'戎要', N'3.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0204', N'0204', N'11', N'2015000876', N'戎要', N'70.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0204', N'0204', N'14', N'2015000036', N'龙舆', N'189.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0204', N'0204', N'14', N'2015000876', N'戎要', N'256.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0204', N'0204', N'14', N'2015001081', N'彭萍', N'224.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0204', N'0204', N'14', N'2015001225', N'迈熠', N'192.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0204', N'0204', N'16', N'2015000036', N'龙舆', N'42.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0204', N'0204', N'16', N'2015000876', N'戎要', N'64.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0204', N'0204', N'16', N'2015001081', N'彭萍', N'56.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0204', N'0204', N'16', N'2015001225', N'迈熠', N'48.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0204', N'0204', N'17', N'2015000036', N'龙舆', N'56.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0204', N'0204', N'17', N'2015000876', N'戎要', N'64.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0204', N'0204', N'17', N'2015001081', N'彭萍', N'56.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0204', N'0204', N'17', N'2015001225', N'迈熠', N'48.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0204', N'0205', N'05', N'2015000876', N'戎要', N'420.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0204', N'030901', N'0401', N'2015000876', N'戎要', N'300.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0204', N'030901', N'0401', N'2015001081', N'彭萍', N'250.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0204', N'030901', N'0401', N'2015001225', N'迈熠', N'250.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0204', N'030902', N'0402', N'2015000036', N'龙舆', N'1260.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0204', N'030903', N'0403', N'2015000036', N'龙舆', N'262.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0204', N'030903', N'0403', N'2015001081', N'彭萍', N'262.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0204', N'030904', N'05', N'2015000036', N'龙舆', N'410.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0204', N'030904', N'05', N'2015000876', N'戎要', N'520.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0204', N'030904', N'05', N'2015001081', N'彭萍', N'410.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0204', N'030904', N'05', N'2015001225', N'迈熠', N'650.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0204', N'030906', N'05', N'2015000037', N'薛桢桥', N'40.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0204', N'030906', N'05', N'2015001081', N'彭萍', N'35.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0204', N'031501', N'1001', N'2015000036', N'龙舆', N'58.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0204', N'031501', N'1001', N'2015000037', N'薛桢桥', N'193.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0204', N'031501', N'1001', N'2015000876', N'戎要', N'228.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0204', N'031501', N'1001', N'2015001081', N'彭萍', N'193.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0204', N'031501', N'1001', N'2015001225', N'迈熠', N'193.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0204', N'031502', N'1002', N'2015000036', N'龙舆', N'270.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0204', N'031502', N'1002', N'2015000037', N'薛桢桥', N'555.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0204', N'031502', N'1002', N'2015000876', N'戎要', N'985.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0204', N'031502', N'1002', N'2015001081', N'彭萍', N'270.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0204', N'031502', N'1002', N'2015001225', N'迈熠', N'120.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0204', N'031502', N'1006', N'2015000876', N'戎要', N'100.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0204', N'031503', N'1003', N'2015000036', N'龙舆', N'190.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0204', N'031503', N'1003', N'2015000037', N'薛桢桥', N'190.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0204', N'031503', N'1003', N'2015000876', N'戎要', N'468.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0204', N'031503', N'1003', N'2015001081', N'彭萍', N'268.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0204', N'031503', N'1003', N'2015001225', N'迈熠', N'268.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0204', N'031503', N'1006', N'2015000037', N'薛桢桥', N'290.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0204', N'031503', N'1006', N'2015000876', N'戎要', N'368.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0204', N'031503', N'1006', N'2015001081', N'彭萍', N'128.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0204', N'031503', N'1006', N'2015001225', N'迈熠', N'128.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0204', N'031505', N'1005', N'2015000876', N'戎要', N'120.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0204', N'031804', N'0201', N'2015001081', N'彭萍', N'63.28')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0204', N'031805', N'0101', N'2015000036', N'龙舆', N'1028.42')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0204', N'031805', N'0101', N'2015000876', N'戎要', N'1590.05')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0204', N'031805', N'0101', N'2015001081', N'彭萍', N'1446.01')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0204', N'031805', N'0101', N'2015001225', N'迈熠', N'1292.25')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0204', N'031805', N'010101', N'2015000036', N'龙舆', N'131.01')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0204', N'031805', N'010101', N'2015000876', N'戎要', N'1997.53')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0204', N'031805', N'010101', N'2015001081', N'彭萍', N'73.99')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0204', N'031805', N'010101', N'2015001225', N'迈熠', N'165.24')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0204', N'031805', N'0102', N'2015000036', N'龙舆', N'93.54')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0204', N'031805', N'010201', N'2015000036', N'龙舆', N'28.22')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0205', N'0204', N'06', N'2015000176', N'牟弟', N'480.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0205', N'0205', N'010101', N'2015000384', N'翟里维', N'77.18')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0205', N'0205', N'010101', N'2015001012', N'邱北', N'28.39')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0205', N'0205', N'05', N'2015000176', N'牟弟', N'420.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0205', N'0205', N'05', N'2015001434', N'鸥湧', N'420.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0205', N'0205', N'06', N'2015000176', N'牟弟', N'249.89')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0205', N'0205', N'06', N'2015000384', N'翟里维', N'392.64')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0205', N'0205', N'06', N'2015001012', N'邱北', N'1381.82')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0205', N'0205', N'06', N'2015001434', N'鸥湧', N'212.65')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0205', N'0205', N'11', N'2015001012', N'邱北', N'306.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0205', N'0205', N'14', N'2015000176', N'牟弟', N'192.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0205', N'0205', N'14', N'2015000384', N'翟里维', N'320.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0205', N'0205', N'14', N'2015001012', N'邱北', N'300.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0205', N'0205', N'14', N'2015001434', N'鸥湧', N'192.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0205', N'0205', N'15', N'2015000176', N'牟弟', N'18.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0205', N'0205', N'15', N'2015000384', N'翟里维', N'30.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0205', N'0205', N'15', N'2015001012', N'邱北', N'18.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0205', N'0205', N'16', N'2015000176', N'牟弟', N'48.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0205', N'0205', N'16', N'2015000384', N'翟里维', N'80.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0205', N'0205', N'16', N'2015001012', N'邱北', N'36.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0205', N'0205', N'16', N'2015001434', N'鸥湧', N'48.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0205', N'0205', N'17', N'2015000176', N'牟弟', N'48.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0205', N'0205', N'17', N'2015000384', N'翟里维', N'80.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0205', N'0205', N'17', N'2015001012', N'邱北', N'48.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0205', N'0205', N'17', N'2015001434', N'鸥湧', N'48.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0205', N'0205', N'24', N'2015000176', N'牟弟', N'15.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0205', N'0205', N'24', N'2015001012', N'邱北', N'15.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0205', N'030901', N'0401', N'2015000176', N'牟弟', N'250.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0205', N'030901', N'0401', N'2015000384', N'翟里维', N'250.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0205', N'030901', N'0401', N'2015001434', N'鸥湧', N'250.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0205', N'030902', N'0101', N'2015000176', N'牟弟', N'222.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0205', N'030902', N'0402', N'2015000176', N'牟弟', N'1380.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0205', N'030902', N'0402', N'2015001012', N'邱北', N'1920.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0205', N'030902', N'0402', N'2015001434', N'鸥湧', N'1260.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0205', N'030902', N'06', N'2015000176', N'牟弟', N'8.40')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0205', N'030903', N'0403', N'2015000176', N'牟弟', N'393.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0205', N'030903', N'0403', N'2015001434', N'鸥湧', N'262.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0205', N'030904', N'05', N'2015000176', N'牟弟', N'410.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0205', N'030904', N'05', N'2015001012', N'邱北', N'450.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0205', N'030904', N'05', N'2015001434', N'鸥湧', N'410.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0205', N'030906', N'05', N'2015000176', N'牟弟', N'35.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0205', N'030906', N'05', N'2015000384', N'翟里维', N'40.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0205', N'030906', N'05', N'2015001012', N'邱北', N'95.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0205', N'030906', N'05', N'2015001434', N'鸥湧', N'35.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0205', N'031501', N'1001', N'2015000176', N'牟弟', N'193.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0205', N'031501', N'1001', N'2015000384', N'翟里维', N'133.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0205', N'031501', N'1001', N'2015001012', N'邱北', N'193.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0205', N'031501', N'1001', N'2015001434', N'鸥湧', N'193.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0205', N'031502', N'1002', N'2015000176', N'牟弟', N'555.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0205', N'031502', N'1002', N'2015000384', N'翟里维', N'435.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0205', N'031502', N'1002', N'2015001012', N'邱北', N'405.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0205', N'031502', N'1002', N'2015001434', N'鸥湧', N'150.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0205', N'031503', N'1002', N'2015001012', N'邱北', N'570.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0205', N'031503', N'1003', N'2015000176', N'牟弟', N'348.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0205', N'031503', N'1003', N'2015000384', N'翟里维', N'348.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0205', N'031503', N'1003', N'2015001012', N'邱北', N'135.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0205', N'031503', N'1003', N'2015001434', N'鸥湧', N'215.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0205', N'031503', N'1006', N'2015000176', N'牟弟', N'128.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0205', N'031503', N'1006', N'2015000384', N'翟里维', N'128.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0205', N'031503', N'1006', N'2015001012', N'邱北', N'100.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0205', N'031804', N'0201', N'2015001434', N'鸥湧', N'32.46')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0205', N'031805', N'0101', N'2015000176', N'牟弟', N'1423.20')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0205', N'031805', N'0101', N'2015000384', N'翟里维', N'2921.96')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0205', N'031805', N'0101', N'2015001012', N'邱北', N'1910.74')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0205', N'031805', N'0101', N'2015001434', N'鸥湧', N'1617.58')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0205', N'031805', N'010101', N'2015000176', N'牟弟', N'105.50')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0205', N'031805', N'010101', N'2015000384', N'翟里维', N'144.28')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0205', N'031805', N'010101', N'2015001012', N'邱北', N'163.05')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0205', N'031805', N'010101', N'2015001434', N'鸥湧', N'171.01')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0208', N'0208', N'010101', N'2015000178', N'看咬位', N'91.48')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0208', N'0208', N'010101', N'2015000387', N'綦来琦', N'9.08')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0208', N'0208', N'010101', N'2015000662', N'漆亨', N'50.09')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0208', N'0208', N'06', N'2015000178', N'看咬位', N'10660.12')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0208', N'0208', N'06', N'2015000387', N'綦来琦', N'717.60')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0208', N'0208', N'06', N'2015000662', N'漆亨', N'2307.19')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0208', N'0208', N'07', N'2015000178', N'看咬位', N'162.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0208', N'0208', N'10', N'2015000178', N'看咬位', N'3.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0208', N'0208', N'10', N'2015000662', N'漆亨', N'3.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0208', N'0208', N'11', N'2015000178', N'看咬位', N'1400.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0208', N'0208', N'11', N'2015000662', N'漆亨', N'576.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0208', N'0208', N'14', N'2015000178', N'看咬位', N'924.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0208', N'0208', N'14', N'2015000387', N'綦来琦', N'256.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0208', N'0208', N'14', N'2015000662', N'漆亨', N'416.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0208', N'0208', N'15', N'2015000178', N'看咬位', N'63.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0208', N'0208', N'15', N'2015000662', N'漆亨', N'39.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0208', N'0208', N'16', N'2015000178', N'看咬位', N'126.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0208', N'0208', N'16', N'2015000387', N'綦来琦', N'40.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0208', N'0208', N'16', N'2015000662', N'漆亨', N'65.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0208', N'0208', N'17', N'2015000178', N'看咬位', N'168.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0208', N'0208', N'17', N'2015000387', N'綦来琦', N'64.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0208', N'0208', N'17', N'2015000662', N'漆亨', N'104.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0208', N'0208', N'24', N'2015000178', N'看咬位', N'45.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0208', N'030901', N'0401', N'2015000178', N'看咬位', N'850.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0208', N'030901', N'0401', N'2015000662', N'漆亨', N'550.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0208', N'030904', N'05', N'2015000178', N'看咬位', N'260.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0208', N'030904', N'05', N'2015000662', N'漆亨', N'70.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0208', N'030906', N'05', N'2015000178', N'看咬位', N'45.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0208', N'030906', N'05', N'2015000387', N'綦来琦', N'35.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0208', N'030906', N'05', N'2015000662', N'漆亨', N'35.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0208', N'031501', N'1001', N'2015000178', N'看咬位', N'195.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0208', N'031501', N'1001', N'2015000387', N'綦来琦', N'193.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0208', N'031501', N'1001', N'2015000662', N'漆亨', N'196.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0208', N'031502', N'1002', N'2015000178', N'看咬位', N'435.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0208', N'031502', N'1002', N'2015000662', N'漆亨', N'600.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0208', N'031502', N'1006', N'2015000662', N'漆亨', N'100.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0208', N'031503', N'1003', N'2015000178', N'看咬位', N'268.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0208', N'031503', N'1003', N'2015000387', N'綦来琦', N'268.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0208', N'031503', N'1003', N'2015000662', N'漆亨', N'268.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0208', N'031503', N'1006', N'2015000178', N'看咬位', N'368.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0208', N'031503', N'1006', N'2015000387', N'綦来琦', N'128.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0208', N'031503', N'1006', N'2015000662', N'漆亨', N'128.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0208', N'031505', N'1005', N'2015000178', N'看咬位', N'240.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0208', N'031804', N'020101', N'2015000178', N'看咬位', N'73.15')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0208', N'031804', N'020101', N'2015000387', N'綦来琦', N'200.87')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0208', N'031805', N'0101', N'2015000178', N'看咬位', N'3716.60')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0208', N'031805', N'0101', N'2015000387', N'綦来琦', N'853.98')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0208', N'031805', N'0101', N'2015000662', N'漆亨', N'2401.26')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0208', N'031805', N'010101', N'2015000178', N'看咬位', N'2070.79')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0208', N'031805', N'010101', N'2015000387', N'綦来琦', N'27.24')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0208', N'031805', N'010101', N'2015000662', N'漆亨', N'58.70')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0208', N'031805', N'0102', N'2015000178', N'看咬位', N'218.26')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0208', N'0321', N'05', N'2015000178', N'看咬位', N'160.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0208', N'0321', N'06', N'2015000178', N'看咬位', N'316.02')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0208', N'0321', N'08', N'2015000178', N'看咬位', N'5.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0208', N'0321', N'11', N'2015000178', N'看咬位', N'4.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0209', N'0209', N'010101', N'2015000871', N'逯潞共', N'28.40')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0209', N'0209', N'0401', N'2015000871', N'逯潞共', N'6.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0209', N'0209', N'06', N'2015000871', N'逯潞共', N'2649.97')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0209', N'0209', N'07', N'2015000871', N'逯潞共', N'662.04')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0209', N'0209', N'08', N'2015000871', N'逯潞共', N'1763.40')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0209', N'0209', N'10', N'2015000871', N'逯潞共', N'6.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0209', N'0209', N'1001', N'2015000871', N'逯潞共', N'34.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0209', N'0209', N'1003', N'2015000871', N'逯潞共', N'200.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0209', N'0209', N'1006', N'2015000871', N'逯潞共', N'90.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0209', N'0209', N'11', N'2015000871', N'逯潞共', N'21.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0209', N'0209', N'14', N'2015000871', N'逯潞共', N'100.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0209', N'0209', N'17', N'2015000871', N'逯潞共', N'8.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0209', N'0209', N'24', N'2015000871', N'逯潞共', N'45.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0209', N'0209', N'49', N'2015000871', N'逯潞共', N'80.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0209', N'030903', N'0403', N'2015000871', N'逯潞共', N'870.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0209', N'030904', N'05', N'2015000871', N'逯潞共', N'150.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0209', N'030906', N'05', N'2015000871', N'逯潞共', N'80.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0209', N'0315', N'06', N'2015000871', N'逯潞共', N'4.60')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0209', N'0315', N'12', N'2015000871', N'逯潞共', N'920.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0209', N'031501', N'1001', N'2015000871', N'逯潞共', N'165.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0209', N'031502', N'1002', N'2015000871', N'逯潞共', N'105.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0209', N'031502', N'1006', N'2015000871', N'逯潞共', N'55.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0209', N'031503', N'1003', N'2015000871', N'逯潞共', N'268.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0209', N'031503', N'1006', N'2015000871', N'逯潞共', N'128.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0209', N'031504', N'1004', N'2015000871', N'逯潞共', N'60.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0209', N'031805', N'0101', N'2015000871', N'逯潞共', N'1169.56')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0209', N'031805', N'010101', N'2015000871', N'逯潞共', N'199.01')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0210', N'0210', N'010101', N'2015000872', N'T红', N'75.25')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0210', N'0210', N'05', N'2015000872', N'T红', N'28.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0210', N'0210', N'06', N'2014300174', N'戢娅', N'158.77')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0210', N'0210', N'06', N'2015000872', N'T红', N'1223.40')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0210', N'0210', N'1002', N'2015000872', N'T红', N'570.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0210', N'0210', N'1006', N'2015000872', N'T红', N'540.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0210', N'0210', N'11', N'2015000872', N'T红', N'171.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0210', N'0210', N'14', N'2014300174', N'戢娅', N'32.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0210', N'0210', N'14', N'2015000872', N'T红', N'384.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0210', N'0210', N'16', N'2014300174', N'戢娅', N'8.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0210', N'0210', N'16', N'2015000872', N'T红', N'96.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0210', N'0210', N'17', N'2014300174', N'戢娅', N'8.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0210', N'0210', N'17', N'2015000872', N'T红', N'96.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0210', N'030903', N'0403', N'2015000872', N'T红', N'80.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0210', N'030904', N'05', N'2015000872', N'T红', N'200.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0210', N'030906', N'05', N'2015000872', N'T红', N'160.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0210', N'031501', N'1001', N'2015000872', N'T红', N'193.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0210', N'031502', N'1002', N'2015000872', N'T红', N'150.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0210', N'031503', N'1003', N'2015000872', N'T红', N'315.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0210', N'031503', N'1006', N'2015000872', N'T红', N'30.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0210', N'031505', N'1005', N'2015000872', N'T红', N'120.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0210', N'031804', N'020101', N'2015000872', N'T红', N'87.39')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0210', N'031805', N'0101', N'2015000872', N'T红', N'3634.39')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0210', N'031805', N'010101', N'2015000872', N'T红', N'2254.55')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0211', N'0211', N'06', N'2015001085', N'孙瑛达', N'150.12')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0211', N'0211', N'0701', N'2015001085', N'孙瑛达', N'150.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0211', N'0211', N'10', N'2015001085', N'孙瑛达', N'6.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0211', N'0211', N'14', N'2015001085', N'孙瑛达', N'27.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0211', N'0211', N'15', N'2015001085', N'孙瑛达', N'3.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0211', N'0211', N'16', N'2015001085', N'孙瑛达', N'6.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0211', N'0211', N'17', N'2015001085', N'孙瑛达', N'8.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0211', N'0211', N'24', N'2015001085', N'孙瑛达', N'30.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0211', N'030901', N'0401', N'2015001085', N'孙瑛达', N'780.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0211', N'030903', N'0403', N'2015001085', N'孙瑛达', N'80.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0211', N'030904', N'05', N'2015001085', N'孙瑛达', N'460.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0211', N'030906', N'05', N'2015001085', N'孙瑛达', N'35.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0211', N'031501', N'1001', N'2015001085', N'孙瑛达', N'165.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0211', N'031502', N'1002', N'2015001085', N'孙瑛达', N'105.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0211', N'031502', N'1006', N'2015001085', N'孙瑛达', N'55.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0211', N'031503', N'1003', N'2015001085', N'孙瑛达', N'135.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0211', N'031504', N'1004', N'2015001085', N'孙瑛达', N'40.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0211', N'031805', N'0101', N'2015001085', N'孙瑛达', N'974.94')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0211', N'031805', N'010101', N'2015001085', N'孙瑛达', N'17.08')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0212', N'0212', N'010101', N'2014300384', N'洪都党', N'143.36')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0212', N'0212', N'010101', N'2015000175', N'凤戟祎', N'72.64')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0212', N'0212', N'06', N'2014300384', N'洪都党', N'203.32')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0212', N'0212', N'06', N'2015000175', N'凤戟祎', N'126.34')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0212', N'0212', N'14', N'2014300384', N'洪都党', N'256.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0212', N'0212', N'14', N'2015000175', N'凤戟祎', N'256.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0212', N'0212', N'16', N'2014300384', N'洪都党', N'64.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0212', N'0212', N'16', N'2015000175', N'凤戟祎', N'64.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0212', N'0212', N'17', N'2014300384', N'洪都党', N'64.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0212', N'0212', N'17', N'2015000175', N'凤戟祎', N'64.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0212', N'0228', N'010101', N'2015000175', N'凤戟祎', N'13.59')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0212', N'0228', N'06', N'2015000175', N'凤戟祎', N'97.52')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0212', N'0228', N'07', N'2015000175', N'凤戟祎', N'400.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0212', N'030901', N'0401', N'2014300384', N'洪都党', N'375.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0212', N'030903', N'0101', N'2014300384', N'洪都党', N'4.15')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0212', N'030903', N'0403', N'2014300384', N'洪都党', N'350.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0212', N'030903', N'0403', N'2015000175', N'凤戟祎', N'80.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0212', N'030904', N'05', N'2015000175', N'凤戟祎', N'380.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0212', N'030906', N'05', N'2014300384', N'洪都党', N'35.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0212', N'030906', N'05', N'2015000175', N'凤戟祎', N'35.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0212', N'0311', N'05', N'2015000175', N'凤戟祎', N'250.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0212', N'031501', N'1001', N'2014300384', N'洪都党', N'105.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0212', N'031501', N'1001', N'2015000175', N'凤戟祎', N'58.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0212', N'031502', N'1002', N'2014300384', N'洪都党', N'505.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0212', N'031502', N'1002', N'2015000175', N'凤戟祎', N'450.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0212', N'031502', N'1006', N'2014300384', N'洪都党', N'55.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0212', N'031503', N'1003', N'2014300384', N'洪都党', N'193.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0212', N'031503', N'1003', N'2015000175', N'凤戟祎', N'178.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0212', N'031805', N'0101', N'2014300384', N'洪都党', N'1415.20')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0212', N'031805', N'0101', N'2015000175', N'凤戟祎', N'2186.40')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0212', N'031805', N'010101', N'2014300384', N'洪都党', N'28.72')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0212', N'0320', N'05', N'2014300384', N'洪都党', N'210.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0219', N'0219', N'010101', N'2015000035', N'解甄敢', N'4.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0219', N'0219', N'010101', N'2015000385', N'辛在', N'24.40')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0219', N'0219', N'05', N'2015000385', N'辛在', N'10.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0219', N'0219', N'06', N'2015000035', N'解甄敢', N'216.14')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0219', N'0219', N'06', N'2015000385', N'辛在', N'519.24')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0219', N'0219', N'07', N'2015000385', N'辛在', N'155.28')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0219', N'0219', N'08', N'2015000385', N'辛在', N'200.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0219', N'0219', N'09', N'2015000385', N'辛在', N'550.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0219', N'0219', N'1002', N'2015000385', N'辛在', N'50.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0219', N'0219', N'1006', N'2015000385', N'辛在', N'30.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0219', N'0219', N'11', N'2015000035', N'解甄敢', N'20.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0219', N'0219', N'11', N'2015000385', N'辛在', N'2.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0219', N'0219', N'13', N'2015000385', N'辛在', N'267.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0219', N'0219', N'14', N'2015000035', N'解甄敢', N'64.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0219', N'0219', N'14', N'2015000385', N'辛在', N'128.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0219', N'0219', N'16', N'2015000035', N'解甄敢', N'16.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0219', N'0219', N'16', N'2015000385', N'辛在', N'32.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0219', N'0219', N'17', N'2015000035', N'解甄敢', N'16.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0219', N'0219', N'17', N'2015000385', N'辛在', N'40.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0219', N'030904', N'05', N'2015000035', N'解甄敢', N'110.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0219', N'030904', N'05', N'2015000385', N'辛在', N'260.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0219', N'030906', N'05', N'2015000035', N'解甄敢', N'35.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0219', N'030906', N'05', N'2015000385', N'辛在', N'35.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0219', N'031501', N'1001', N'2015000035', N'解甄敢', N'193.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0219', N'031501', N'1001', N'2015000385', N'辛在', N'223.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0219', N'031503', N'1003', N'2015000035', N'解甄敢', N'146.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0219', N'031503', N'1003', N'2015000385', N'辛在', N'146.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0219', N'031804', N'0201', N'2015000385', N'辛在', N'169.82')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0219', N'031805', N'0101', N'2015000385', N'辛在', N'1080.09')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0219', N'031805', N'010101', N'2015000035', N'解甄敢', N'9.96')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0219', N'031805', N'010101', N'2015000385', N'辛在', N'77.82')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0219', N'031805', N'0102', N'2015000385', N'辛在', N'358.44')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0220', N'0220', N'0101', N'2015001013', N'饶法', N'1622.08')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0220', N'0220', N'0101', N'2015001014', N'黄忱谦', N'1622.08')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0220', N'0220', N'0101', N'2015001015', N'简改', N'1899.87')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0220', N'0220', N'010101', N'2015001013', N'饶法', N'106.59')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0220', N'0220', N'010101', N'2015001014', N'黄忱谦', N'135.73')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0220', N'0220', N'010101', N'2015001015', N'简改', N'63.56')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0220', N'0220', N'06', N'2015001013', N'饶法', N'1584.49')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0220', N'0220', N'06', N'2015001014', N'黄忱谦', N'1469.27')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0220', N'0220', N'06', N'2015001015', N'简改', N'1013.48')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0220', N'0220', N'1001', N'2015001013', N'饶法', N'28.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0220', N'0220', N'1001', N'2015001014', N'黄忱谦', N'193.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0220', N'0220', N'1001', N'2015001015', N'简改', N'193.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0220', N'0220', N'1002', N'2015001014', N'黄忱谦', N'150.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0220', N'0220', N'1002', N'2015001015', N'简改', N'315.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0220', N'0220', N'1003', N'2015001015', N'简改', N'348.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0220', N'0220', N'1006', N'2015001014', N'黄忱谦', N'100.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0220', N'0220', N'1006', N'2015001015', N'简改', N'348.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0220', N'0220', N'14', N'2015001013', N'饶法', N'294.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0220', N'0220', N'14', N'2015001014', N'黄忱谦', N'294.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0220', N'0220', N'14', N'2015001015', N'简改', N'252.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0220', N'0220', N'16', N'2015001013', N'饶法', N'63.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0220', N'0220', N'16', N'2015001014', N'黄忱谦', N'63.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0220', N'0220', N'16', N'2015001015', N'简改', N'54.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0220', N'0220', N'17', N'2015001013', N'饶法', N'56.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0220', N'0220', N'17', N'2015001014', N'黄忱谦', N'56.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0220', N'0220', N'17', N'2015001015', N'简改', N'48.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0220', N'030901', N'0401', N'2015001014', N'黄忱谦', N'250.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0220', N'030906', N'05', N'2015001013', N'饶法', N'40.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0220', N'031501', N'1001', N'2015001013', N'饶法', N'170.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0220', N'031502', N'1002', N'2015001013', N'饶法', N'435.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0220', N'031503', N'1003', N'2015001013', N'饶法', N'215.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0220', N'031503', N'1003', N'2015001014', N'黄忱谦', N'191.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0220', N'031506', N'1006', N'2015001014', N'黄忱谦', N'130.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0223', N'0223', N'0101', N'2015000037', N'薛桢桥', N'235.52')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0223', N'0223', N'010101', N'2015000037', N'薛桢桥', N'203.24')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0223', N'0223', N'010101', N'2015000174', N'时遒萍', N'108.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0223', N'0223', N'010101', N'2015000383', N'但枚', N'129.92')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0223', N'0223', N'010101', N'2015000874', N'丹字粟', N'112.46')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0223', N'0223', N'010101', N'2015001083', N'湖航', N'160.71')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0223', N'0223', N'06', N'2015000037', N'薛桢桥', N'413.10')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0223', N'0223', N'06', N'2015000174', N'时遒萍', N'183.60')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0223', N'0223', N'06', N'2015000383', N'但枚', N'235.05')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0223', N'0223', N'06', N'2015000874', N'丹字粟', N'379.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0223', N'0223', N'06', N'2015001083', N'湖航', N'296.98')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0223', N'0223', N'1002', N'2015000037', N'薛桢桥', N'260.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0223', N'0223', N'1002', N'2015000174', N'时遒萍', N'260.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0223', N'0223', N'1002', N'2015000383', N'但枚', N'520.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0223', N'0223', N'1003', N'2015000037', N'薛桢桥', N'240.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0223', N'0223', N'1003', N'2015000174', N'时遒萍', N'240.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0223', N'0223', N'1003', N'2015000383', N'但枚', N'240.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0223', N'0223', N'1006', N'2015000037', N'薛桢桥', N'85.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0223', N'0223', N'1006', N'2015000174', N'时遒萍', N'85.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0223', N'0223', N'1006', N'2015000383', N'但枚', N'170.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0223', N'0223', N'1006', N'2015000874', N'丹字粟', N'480.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0223', N'0223', N'11', N'2015000383', N'但枚', N'12.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0223', N'0223', N'11', N'2015000874', N'丹字粟', N'8.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0223', N'0223', N'14', N'2015000037', N'薛桢桥', N'352.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0223', N'0223', N'14', N'2015000174', N'时遒萍', N'108.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0223', N'0223', N'14', N'2015000383', N'但枚', N'256.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0223', N'0223', N'14', N'2015000874', N'丹字粟', N'462.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0223', N'0223', N'14', N'2015001083', N'湖航', N'156.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0223', N'0223', N'16', N'2015000037', N'薛桢桥', N'88.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0223', N'0223', N'16', N'2015000174', N'时遒萍', N'54.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0223', N'0223', N'16', N'2015000383', N'但枚', N'64.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0223', N'0223', N'16', N'2015000874', N'丹字粟', N'99.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0223', N'0223', N'16', N'2015001083', N'湖航', N'48.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0223', N'0223', N'17', N'2015000037', N'薛桢桥', N'88.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0223', N'0223', N'17', N'2015000174', N'时遒萍', N'72.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0223', N'0223', N'17', N'2015000383', N'但枚', N'64.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0223', N'0223', N'17', N'2015000874', N'丹字粟', N'88.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0223', N'0223', N'17', N'2015001083', N'湖航', N'104.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0223', N'0223', N'24', N'2015001083', N'湖航', N'15.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0223', N'0275', N'06', N'2015000874', N'丹字粟', N'8.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0223', N'0275', N'24', N'2015000874', N'丹字粟', N'15.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0223', N'030901', N'04', N'2015001083', N'湖航', N'342.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0223', N'030901', N'0401', N'2015000037', N'薛桢桥', N'300.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0223', N'030901', N'0401', N'2015000383', N'但枚', N'300.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0223', N'030901', N'0401', N'2015000874', N'丹字粟', N'300.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0223', N'030901', N'0401', N'2015001083', N'湖航', N'975.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0223', N'030901', N'06', N'2015001083', N'湖航', N'16.93')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0223', N'030902', N'0402', N'2015000874', N'丹字粟', N'600.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0223', N'030904', N'05', N'2015000037', N'薛桢桥', N'200.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0223', N'030904', N'05', N'2015000174', N'时遒萍', N'310.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0223', N'030904', N'05', N'2015000383', N'但枚', N'200.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0223', N'030904', N'05', N'2015000874', N'丹字粟', N'480.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0223', N'030906', N'05', N'2015000174', N'时遒萍', N'35.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0223', N'030906', N'05', N'2015000383', N'但枚', N'35.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0223', N'030906', N'05', N'2015000874', N'丹字粟', N'35.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0223', N'031501', N'1001', N'2015000037', N'薛桢桥', N'33.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0223', N'031501', N'1001', N'2015000174', N'时遒萍', N'88.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0223', N'031501', N'1001', N'2015000383', N'但枚', N'241.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0223', N'031501', N'1001', N'2015000874', N'丹字粟', N'109.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0223', N'031501', N'1001', N'2015001083', N'湖航', N'168.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0223', N'031502', N'1002', N'2015000383', N'但枚', N'285.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0223', N'031503', N'1003', N'2015000037', N'薛桢桥', N'217.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0223', N'031503', N'1003', N'2015000174', N'时遒萍', N'135.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0223', N'031503', N'1003', N'2015000383', N'但枚', N'288.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0223', N'031503', N'1003', N'2015000874', N'丹字粟', N'204.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0223', N'031503', N'1003', N'2015001083', N'湖航', N'178.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0223', N'031505', N'1005', N'2015000037', N'薛桢桥', N'410.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0223', N'031505', N'1005', N'2015000174', N'时遒萍', N'130.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0223', N'031505', N'1005', N'2015000383', N'但枚', N'130.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0223', N'031505', N'1005', N'2015000874', N'丹字粟', N'410.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0223', N'031505', N'1005', N'2015001083', N'湖航', N'280.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0223', N'031804', N'0201', N'2015000037', N'薛桢桥', N'90.39')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0223', N'031804', N'0201', N'2015000874', N'丹字粟', N'87.72')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0223', N'031804', N'020101', N'2015001083', N'湖航', N'13.22')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0223', N'031805', N'0101', N'2015000037', N'薛桢桥', N'1172.61')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0223', N'031805', N'0101', N'2015000174', N'时遒萍', N'1428.66')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0223', N'031805', N'0101', N'2015000383', N'但枚', N'1069.56')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0223', N'031805', N'0101', N'2015000874', N'丹字粟', N'4043.24')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0223', N'031805', N'0101', N'2015001083', N'湖航', N'3341.38')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0223', N'031805', N'010101', N'2015000037', N'薛桢桥', N'2202.16')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0223', N'031805', N'010101', N'2015000174', N'时遒萍', N'1.32')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0223', N'031805', N'010101', N'2015000383', N'但枚', N'414.27')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0223', N'031805', N'010101', N'2015000874', N'丹字粟', N'250.63')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0223', N'031805', N'010101', N'2015001083', N'湖航', N'356.44')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0223', N'031805', N'0102', N'2015000037', N'薛桢桥', N'26.79')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0223', N'0320', N'05', N'2015000874', N'丹字粟', N'80.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0223', N'0320', N'05', N'2015001083', N'湖航', N'80.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0223', N'0320', N'11', N'2015000874', N'丹字粟', N'40.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0223', N'0320', N'11', N'2015001083', N'湖航', N'40.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0223', N'0321', N'06', N'2015000037', N'薛桢桥', N'110.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0223', N'0321', N'06', N'2015000174', N'时遒萍', N'110.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0223', N'0321', N'06', N'2015000383', N'但枚', N'110.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0223', N'0324', N'05', N'2015001083', N'湖航', N'260.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0224', N'0210', N'05', N'2015000664', N'娄唐上', N'28.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0224', N'0210', N'06', N'2015000664', N'娄唐上', N'460.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0224', N'0224', N'010101', N'2015000664', N'娄唐上', N'85.66')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0224', N'0224', N'06', N'2015000664', N'娄唐上', N'265.78')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0224', N'0224', N'14', N'2015000664', N'娄唐上', N'612.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0224', N'0224', N'16', N'2015000664', N'娄唐上', N'144.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0224', N'0224', N'17', N'2015000664', N'娄唐上', N'144.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0224', N'0224', N'24', N'2015000664', N'娄唐上', N'45.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0224', N'030901', N'0101', N'2015000664', N'娄唐上', N'414.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0224', N'030901', N'0401', N'2015000664', N'娄唐上', N'1085.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0224', N'030901', N'06', N'2015000664', N'娄唐上', N'16.93')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0224', N'030902', N'0402', N'2015000664', N'娄唐上', N'600.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0224', N'030904', N'05', N'2015000664', N'娄唐上', N'200.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0224', N'030906', N'05', N'2015000664', N'娄唐上', N'35.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0224', N'031501', N'1001', N'2015000664', N'娄唐上', N'193.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0224', N'031502', N'1002', N'2015000664', N'娄唐上', N'665.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0224', N'031502', N'1006', N'2015000664', N'娄唐上', N'55.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0224', N'031503', N'1002', N'2015000664', N'娄唐上', N'160.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0224', N'031503', N'1003', N'2015000664', N'娄唐上', N'235.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0224', N'031506', N'1006', N'2015000664', N'娄唐上', N'420.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0224', N'031804', N'020101', N'2015000664', N'娄唐上', N'28.90')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0224', N'031805', N'0101', N'2015000664', N'娄唐上', N'3071.08')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0224', N'031805', N'010101', N'2015000664', N'娄唐上', N'15.21')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0226', N'0226', N'010101', N'2015001082', N'甘器', N'39.45')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0226', N'0226', N'06', N'2015001082', N'甘器', N'2081.34')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0226', N'0226', N'14', N'2015001082', N'甘器', N'135.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0226', N'0226', N'16', N'2015001082', N'甘器', N'15.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0226', N'0226', N'17', N'2015001082', N'甘器', N'40.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0226', N'031805', N'0101', N'2015001082', N'甘器', N'149.06')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0226', N'031805', N'010101', N'2015001082', N'甘器', N'148.65')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201501', N'0226', N'031805', N'010201', N'2015001082', N'甘器', N'34.19')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201412', N'0210', N'0210', N'010101', N'2014300174', N'戢娅', N'45.40')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201412', N'0210', N'0210', N'05', N'2014300174', N'戢娅', N'28.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201412', N'0210', N'0210', N'06', N'2014300174', N'戢娅', N'560.19')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201412', N'0210', N'0210', N'1002', N'2014300174', N'戢娅', N'285.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201412', N'0210', N'0210', N'1006', N'2014300174', N'戢娅', N'300.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201412', N'0210', N'0210', N'14', N'2014300174', N'戢娅', N'128.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201412', N'0210', N'0210', N'16', N'2014300174', N'戢娅', N'32.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201412', N'0210', N'0210', N'17', N'2014300174', N'戢娅', N'32.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201412', N'0210', N'030903', N'0403', N'2014300174', N'戢娅', N'80.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201412', N'0210', N'030904', N'05', N'2014300174', N'戢娅', N'260.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201412', N'0210', N'030906', N'05', N'2014300174', N'戢娅', N'35.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201412', N'0210', N'031501', N'1001', N'2014300174', N'戢娅', N'133.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201412', N'0210', N'031502', N'1002', N'2014300174', N'戢娅', N'150.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201412', N'0210', N'031503', N'1003', N'2014300174', N'戢娅', N'135.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201412', N'0210', N'031804', N'0201', N'2014300174', N'戢娅', N'38.71')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201412', N'0210', N'031804', N'020101', N'2014300174', N'戢娅', N'61.25')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201412', N'0210', N'031805', N'0101', N'2014300174', N'戢娅', N'951.58')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_ExecOffice] VALUES (N'201412', N'0210', N'031805', N'010101', N'2014300174', N'戢娅', N'62.20')
GO


-- ----------------------------
-- Table structure for Stat_Hosp_Fee_Office_Patient
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Stat_Hosp_Fee_Office_Patient]') AND type IN ('U'))
	DROP TABLE [dbo].[Stat_Hosp_Fee_Office_Patient]
GO

CREATE TABLE [dbo].[Stat_Hosp_Fee_Office_Patient] (
  [StatDate] varchar(8) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [OfficeID] varchar(8) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [HospID] varchar(12) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [StatTypeID] varchar(8) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [PatientType] varchar(8) COLLATE Chinese_PRC_CI_AS  NULL,
  [Patientname] varchar(30) COLLATE Chinese_PRC_CI_AS  NULL,
  [SumPrice] numeric(18,2)  NULL
)
GO

ALTER TABLE [dbo].[Stat_Hosp_Fee_Office_Patient] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of Stat_Hosp_Fee_Office_Patient
-- ----------------------------
INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201412', N'0210', N'2014300174', N'0101', N'2', N'戢娅', N'951.58')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201412', N'0210', N'2014300174', N'010101', N'2', N'戢娅', N'107.60')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201412', N'0210', N'2014300174', N'0201', N'2', N'戢娅', N'38.71')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201412', N'0210', N'2014300174', N'020101', N'2', N'戢娅', N'61.25')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201412', N'0210', N'2014300174', N'0403', N'2', N'戢娅', N'80.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201412', N'0210', N'2014300174', N'05', N'2', N'戢娅', N'323.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201412', N'0210', N'2014300174', N'06', N'2', N'戢娅', N'560.19')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201412', N'0210', N'2014300174', N'1001', N'2', N'戢娅', N'133.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201412', N'0210', N'2014300174', N'1002', N'2', N'戢娅', N'435.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201412', N'0210', N'2014300174', N'1003', N'2', N'戢娅', N'135.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201412', N'0210', N'2014300174', N'1006', N'2', N'戢娅', N'300.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201412', N'0210', N'2014300174', N'14', N'2', N'戢娅', N'128.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201412', N'0210', N'2014300174', N'16', N'2', N'戢娅', N'32.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201412', N'0210', N'2014300174', N'17', N'2', N'戢娅', N'32.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0202', N'2015000875', N'0101', N'3', N'智台', N'1403.52')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0202', N'2015000875', N'010101', N'3', N'智台', N'402.06')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0202', N'2015000875', N'0402', N'3', N'智台', N'1380.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0202', N'2015000875', N'0403', N'3', N'智台', N'80.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0202', N'2015000875', N'05', N'3', N'智台', N'255.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0202', N'2015000875', N'06', N'3', N'智台', N'2391.39')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0202', N'2015000875', N'10', N'3', N'智台', N'3.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0202', N'2015000875', N'1001', N'3', N'智台', N'223.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0202', N'2015000875', N'1002', N'3', N'智台', N'560.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0202', N'2015000875', N'1003', N'3', N'智台', N'292.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0202', N'2015000875', N'1006', N'3', N'智台', N'128.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0202', N'2015000875', N'11', N'3', N'智台', N'74.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0202', N'2015000875', N'14', N'3', N'智台', N'230.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0202', N'2015000875', N'15', N'3', N'智台', N'12.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0202', N'2015000875', N'16', N'3', N'智台', N'44.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0202', N'2015000875', N'17', N'3', N'智台', N'48.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0202', N'2015001432', N'0401', N'1', N'笱坤', N'425.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0202', N'2015001432', N'05', N'1', N'笱坤', N'150.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0202', N'2015001432', N'06', N'1', N'笱坤', N'8.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0202', N'2015001432', N'14', N'1', N'笱坤', N'42.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0202', N'2015001432', N'15', N'1', N'笱坤', N'3.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0202', N'2015001432', N'16', N'1', N'笱坤', N'9.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0202', N'2015001432', N'17', N'1', N'笱坤', N'8.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0203', N'2014300175', N'0101', N'3', N'聂羽禾', N'4368.92')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0203', N'2014300175', N'010101', N'3', N'聂羽禾', N'294.36')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0203', N'2014300175', N'0401', N'3', N'聂羽禾', N'250.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0203', N'2014300175', N'0402', N'3', N'聂羽禾', N'1920.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0203', N'2014300175', N'0403', N'3', N'聂羽禾', N'80.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0203', N'2014300175', N'05', N'3', N'聂羽禾', N'560.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0203', N'2014300175', N'06', N'3', N'聂羽禾', N'2086.52')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0203', N'2014300175', N'1001', N'3', N'聂羽禾', N'195.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0203', N'2014300175', N'1002', N'3', N'聂羽禾', N'390.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0203', N'2014300175', N'1003', N'3', N'聂羽禾', N'371.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0203', N'2014300175', N'1004', N'3', N'聂羽禾', N'65.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0203', N'2014300175', N'1006', N'3', N'聂羽禾', N'183.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0203', N'2014300175', N'11', N'3', N'聂羽禾', N'368.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0203', N'2014300175', N'14', N'3', N'聂羽禾', N'288.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0203', N'2014300175', N'15', N'3', N'聂羽禾', N'27.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0203', N'2014300175', N'16', N'3', N'聂羽禾', N'72.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0203', N'2014300175', N'17', N'3', N'聂羽禾', N'72.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0203', N'2014300175', N'24', N'3', N'聂羽禾', N'15.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0203', N'2015000665', N'0101', N'1', N'谌瑄', N'545.03')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0203', N'2015000665', N'010101', N'1', N'谌瑄', N'56.04')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0203', N'2015000665', N'0401', N'1', N'谌瑄', N'550.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0203', N'2015000665', N'05', N'1', N'谌瑄', N'455.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0203', N'2015000665', N'06', N'1', N'谌瑄', N'134.29')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0203', N'2015000665', N'10', N'1', N'谌瑄', N'3.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0203', N'2015000665', N'1001', N'1', N'谌瑄', N'165.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0203', N'2015000665', N'14', N'1', N'谌瑄', N'81.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0203', N'2015000665', N'15', N'1', N'谌瑄', N'9.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0203', N'2015000665', N'16', N'1', N'谌瑄', N'18.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0203', N'2015000665', N'17', N'1', N'谌瑄', N'24.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0204', N'2015000036', N'0101', N'1', N'龙舆', N'1028.42')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0204', N'2015000036', N'010101', N'1', N'龙舆', N'131.01')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0204', N'2015000036', N'0102', N'1', N'龙舆', N'93.54')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0204', N'2015000036', N'010201', N'1', N'龙舆', N'28.22')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0204', N'2015000036', N'0402', N'1', N'龙舆', N'1260.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0204', N'2015000036', N'0403', N'1', N'龙舆', N'262.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0204', N'2015000036', N'05', N'1', N'龙舆', N'830.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0204', N'2015000036', N'06', N'1', N'龙舆', N'622.23')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0204', N'2015000036', N'1001', N'1', N'龙舆', N'58.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0204', N'2015000036', N'1002', N'1', N'龙舆', N'270.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0204', N'2015000036', N'1003', N'1', N'龙舆', N'190.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0204', N'2015000036', N'14', N'1', N'龙舆', N'189.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0204', N'2015000036', N'16', N'1', N'龙舆', N'42.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0204', N'2015000036', N'17', N'1', N'龙舆', N'56.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0204', N'2015000037', N'05', N'2', N'薛桢桥', N'40.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0204', N'2015000037', N'1001', N'2', N'薛桢桥', N'193.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0204', N'2015000037', N'1002', N'2', N'薛桢桥', N'555.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0204', N'2015000037', N'1003', N'2', N'薛桢桥', N'190.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0204', N'2015000037', N'1006', N'2', N'薛桢桥', N'290.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0204', N'2015000876', N'0101', N'2', N'戎要', N'1590.05')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0204', N'2015000876', N'010101', N'2', N'戎要', N'2029.99')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0204', N'2015000876', N'0401', N'2', N'戎要', N'300.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0204', N'2015000876', N'05', N'2', N'戎要', N'950.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0204', N'2015000876', N'06', N'2', N'戎要', N'1351.48')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0204', N'2015000876', N'10', N'2', N'戎要', N'3.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0204', N'2015000876', N'1001', N'2', N'戎要', N'228.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0204', N'2015000876', N'1002', N'2', N'戎要', N'985.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0204', N'2015000876', N'1003', N'2', N'戎要', N'468.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0204', N'2015000876', N'1005', N'2', N'戎要', N'120.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0204', N'2015000876', N'1006', N'2', N'戎要', N'468.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0204', N'2015000876', N'11', N'2', N'戎要', N'70.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0204', N'2015000876', N'14', N'2', N'戎要', N'256.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0204', N'2015000876', N'16', N'2', N'戎要', N'64.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0204', N'2015000876', N'17', N'2', N'戎要', N'64.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0204', N'2015001081', N'0101', N'1', N'彭萍', N'1446.01')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0204', N'2015001081', N'010101', N'1', N'彭萍', N'78.68')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0204', N'2015001081', N'0201', N'1', N'彭萍', N'63.28')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0204', N'2015001081', N'0401', N'1', N'彭萍', N'250.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0204', N'2015001081', N'0403', N'1', N'彭萍', N'262.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0204', N'2015001081', N'05', N'1', N'彭萍', N'445.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0204', N'2015001081', N'06', N'1', N'彭萍', N'122.01')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0204', N'2015001081', N'1001', N'1', N'彭萍', N'193.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0204', N'2015001081', N'1002', N'1', N'彭萍', N'270.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0204', N'2015001081', N'1003', N'1', N'彭萍', N'268.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0204', N'2015001081', N'1006', N'1', N'彭萍', N'128.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0204', N'2015001081', N'14', N'1', N'彭萍', N'224.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0204', N'2015001081', N'16', N'1', N'彭萍', N'56.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0204', N'2015001081', N'17', N'1', N'彭萍', N'56.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0204', N'2015001225', N'0101', N'2', N'迈熠', N'1292.25')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0204', N'2015001225', N'010101', N'2', N'迈熠', N'178.86')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0204', N'2015001225', N'0401', N'2', N'迈熠', N'250.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0204', N'2015001225', N'05', N'2', N'迈熠', N'660.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0204', N'2015001225', N'06', N'2', N'迈熠', N'594.74')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0204', N'2015001225', N'1001', N'2', N'迈熠', N'193.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0204', N'2015001225', N'1002', N'2', N'迈熠', N'120.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0204', N'2015001225', N'1003', N'2', N'迈熠', N'268.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0204', N'2015001225', N'1006', N'2', N'迈熠', N'128.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0204', N'2015001225', N'14', N'2', N'迈熠', N'192.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0204', N'2015001225', N'16', N'2', N'迈熠', N'48.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0204', N'2015001225', N'17', N'2', N'迈熠', N'48.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0205', N'2015000176', N'0101', N'2', N'牟弟', N'1645.20')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0205', N'2015000176', N'010101', N'2', N'牟弟', N'105.50')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0205', N'2015000176', N'0401', N'2', N'牟弟', N'250.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0205', N'2015000176', N'0402', N'2', N'牟弟', N'1380.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0205', N'2015000176', N'0403', N'2', N'牟弟', N'393.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0205', N'2015000176', N'05', N'2', N'牟弟', N'865.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0205', N'2015000176', N'06', N'2', N'牟弟', N'738.29')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0205', N'2015000176', N'1001', N'2', N'牟弟', N'193.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0205', N'2015000176', N'1002', N'2', N'牟弟', N'555.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0205', N'2015000176', N'1003', N'2', N'牟弟', N'348.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0205', N'2015000176', N'1006', N'2', N'牟弟', N'128.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0205', N'2015000176', N'14', N'2', N'牟弟', N'192.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0205', N'2015000176', N'15', N'2', N'牟弟', N'18.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0205', N'2015000176', N'16', N'2', N'牟弟', N'48.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0205', N'2015000176', N'17', N'2', N'牟弟', N'48.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0205', N'2015000176', N'24', N'2', N'牟弟', N'15.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0205', N'2015000384', N'0101', N'2', N'翟里维', N'2921.96')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0205', N'2015000384', N'010101', N'2', N'翟里维', N'221.46')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0205', N'2015000384', N'0401', N'2', N'翟里维', N'250.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0205', N'2015000384', N'05', N'2', N'翟里维', N'40.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0205', N'2015000384', N'06', N'2', N'翟里维', N'392.64')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0205', N'2015000384', N'1001', N'2', N'翟里维', N'133.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0205', N'2015000384', N'1002', N'2', N'翟里维', N'435.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0205', N'2015000384', N'1003', N'2', N'翟里维', N'348.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0205', N'2015000384', N'1006', N'2', N'翟里维', N'128.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0205', N'2015000384', N'14', N'2', N'翟里维', N'320.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0205', N'2015000384', N'15', N'2', N'翟里维', N'30.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0205', N'2015000384', N'16', N'2', N'翟里维', N'80.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0205', N'2015000384', N'17', N'2', N'翟里维', N'80.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0205', N'2015001012', N'0101', N'3', N'邱北', N'1910.74')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0205', N'2015001012', N'010101', N'3', N'邱北', N'191.44')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0205', N'2015001012', N'0402', N'3', N'邱北', N'1920.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0205', N'2015001012', N'05', N'3', N'邱北', N'545.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0205', N'2015001012', N'06', N'3', N'邱北', N'1381.82')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0205', N'2015001012', N'1001', N'3', N'邱北', N'193.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0205', N'2015001012', N'1002', N'3', N'邱北', N'975.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0205', N'2015001012', N'1003', N'3', N'邱北', N'135.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0205', N'2015001012', N'1006', N'3', N'邱北', N'100.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0205', N'2015001012', N'11', N'3', N'邱北', N'306.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0205', N'2015001012', N'14', N'3', N'邱北', N'300.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0205', N'2015001012', N'15', N'3', N'邱北', N'18.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0205', N'2015001012', N'16', N'3', N'邱北', N'36.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0205', N'2015001012', N'17', N'3', N'邱北', N'48.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0205', N'2015001012', N'24', N'3', N'邱北', N'15.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0205', N'2015001434', N'0101', N'2', N'鸥湧', N'1617.58')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0205', N'2015001434', N'010101', N'2', N'鸥湧', N'171.01')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0205', N'2015001434', N'0201', N'2', N'鸥湧', N'32.46')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0205', N'2015001434', N'0401', N'2', N'鸥湧', N'250.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0205', N'2015001434', N'0402', N'2', N'鸥湧', N'1260.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0205', N'2015001434', N'0403', N'2', N'鸥湧', N'262.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0205', N'2015001434', N'05', N'2', N'鸥湧', N'865.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0205', N'2015001434', N'06', N'2', N'鸥湧', N'212.65')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0205', N'2015001434', N'1001', N'2', N'鸥湧', N'193.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0205', N'2015001434', N'1002', N'2', N'鸥湧', N'150.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0205', N'2015001434', N'1003', N'2', N'鸥湧', N'215.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0205', N'2015001434', N'14', N'2', N'鸥湧', N'192.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0205', N'2015001434', N'16', N'2', N'鸥湧', N'48.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0205', N'2015001434', N'17', N'2', N'鸥湧', N'48.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0208', N'2015000178', N'0101', N'2', N'看咬位', N'3716.60')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0208', N'2015000178', N'010101', N'2', N'看咬位', N'2162.27')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0208', N'2015000178', N'0102', N'2', N'看咬位', N'218.26')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0208', N'2015000178', N'020101', N'2', N'看咬位', N'73.15')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0208', N'2015000178', N'0401', N'2', N'看咬位', N'850.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0208', N'2015000178', N'05', N'2', N'看咬位', N'465.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0208', N'2015000178', N'06', N'2', N'看咬位', N'10976.14')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0208', N'2015000178', N'07', N'2', N'看咬位', N'162.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0208', N'2015000178', N'08', N'2', N'看咬位', N'5.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0208', N'2015000178', N'10', N'2', N'看咬位', N'3.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0208', N'2015000178', N'1001', N'2', N'看咬位', N'195.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0208', N'2015000178', N'1002', N'2', N'看咬位', N'435.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0208', N'2015000178', N'1003', N'2', N'看咬位', N'268.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0208', N'2015000178', N'1005', N'2', N'看咬位', N'240.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0208', N'2015000178', N'1006', N'2', N'看咬位', N'368.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0208', N'2015000178', N'11', N'2', N'看咬位', N'1404.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0208', N'2015000178', N'14', N'2', N'看咬位', N'924.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0208', N'2015000178', N'15', N'2', N'看咬位', N'63.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0208', N'2015000178', N'16', N'2', N'看咬位', N'126.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0208', N'2015000178', N'17', N'2', N'看咬位', N'168.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0208', N'2015000178', N'24', N'2', N'看咬位', N'45.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0208', N'2015000387', N'0101', N'2', N'綦来琦', N'853.98')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0208', N'2015000387', N'010101', N'2', N'綦来琦', N'36.32')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0208', N'2015000387', N'020101', N'2', N'綦来琦', N'200.87')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0208', N'2015000387', N'05', N'2', N'綦来琦', N'35.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0208', N'2015000387', N'06', N'2', N'綦来琦', N'717.60')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0208', N'2015000387', N'1001', N'2', N'綦来琦', N'193.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0208', N'2015000387', N'1003', N'2', N'綦来琦', N'268.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0208', N'2015000387', N'1006', N'2', N'綦来琦', N'128.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0208', N'2015000387', N'14', N'2', N'綦来琦', N'256.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0208', N'2015000387', N'16', N'2', N'綦来琦', N'40.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0208', N'2015000387', N'17', N'2', N'綦来琦', N'64.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0208', N'2015000662', N'0101', N'2', N'漆亨', N'2401.26')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0208', N'2015000662', N'010101', N'2', N'漆亨', N'108.79')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0208', N'2015000662', N'0401', N'2', N'漆亨', N'550.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0208', N'2015000662', N'05', N'2', N'漆亨', N'105.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0208', N'2015000662', N'06', N'2', N'漆亨', N'2307.19')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0208', N'2015000662', N'10', N'2', N'漆亨', N'3.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0208', N'2015000662', N'1001', N'2', N'漆亨', N'196.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0208', N'2015000662', N'1002', N'2', N'漆亨', N'600.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0208', N'2015000662', N'1003', N'2', N'漆亨', N'268.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0208', N'2015000662', N'1006', N'2', N'漆亨', N'228.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0208', N'2015000662', N'11', N'2', N'漆亨', N'576.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0208', N'2015000662', N'14', N'2', N'漆亨', N'416.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0208', N'2015000662', N'15', N'2', N'漆亨', N'39.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0208', N'2015000662', N'16', N'2', N'漆亨', N'65.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0208', N'2015000662', N'17', N'2', N'漆亨', N'104.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0209', N'2015000871', N'0101', N'1', N'逯潞共', N'1169.56')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0209', N'2015000871', N'010101', N'1', N'逯潞共', N'227.41')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0209', N'2015000871', N'0401', N'1', N'逯潞共', N'6.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0209', N'2015000871', N'0403', N'1', N'逯潞共', N'870.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0209', N'2015000871', N'05', N'1', N'逯潞共', N'230.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0209', N'2015000871', N'06', N'1', N'逯潞共', N'2654.57')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0209', N'2015000871', N'07', N'1', N'逯潞共', N'662.04')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0209', N'2015000871', N'08', N'1', N'逯潞共', N'1763.40')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0209', N'2015000871', N'10', N'1', N'逯潞共', N'6.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0209', N'2015000871', N'1001', N'1', N'逯潞共', N'199.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0209', N'2015000871', N'1002', N'1', N'逯潞共', N'105.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0209', N'2015000871', N'1003', N'1', N'逯潞共', N'468.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0209', N'2015000871', N'1004', N'1', N'逯潞共', N'60.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0209', N'2015000871', N'1006', N'1', N'逯潞共', N'273.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0209', N'2015000871', N'11', N'1', N'逯潞共', N'21.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0209', N'2015000871', N'12', N'1', N'逯潞共', N'920.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0209', N'2015000871', N'14', N'1', N'逯潞共', N'100.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0209', N'2015000871', N'17', N'1', N'逯潞共', N'8.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0209', N'2015000871', N'24', N'1', N'逯潞共', N'45.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0209', N'2015000871', N'49', N'1', N'逯潞共', N'80.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0210', N'2014300174', N'06', N'2', N'戢娅', N'158.77')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0210', N'2014300174', N'14', N'2', N'戢娅', N'32.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0210', N'2014300174', N'16', N'2', N'戢娅', N'8.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0210', N'2014300174', N'17', N'2', N'戢娅', N'8.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0210', N'2015000872', N'0101', N'2', N'T红', N'3634.39')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0210', N'2015000872', N'010101', N'2', N'T红', N'2329.80')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0210', N'2015000872', N'020101', N'2', N'T红', N'87.39')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0210', N'2015000872', N'0403', N'2', N'T红', N'80.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0210', N'2015000872', N'05', N'2', N'T红', N'388.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0210', N'2015000872', N'06', N'2', N'T红', N'1223.40')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0210', N'2015000872', N'1001', N'2', N'T红', N'193.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0210', N'2015000872', N'1002', N'2', N'T红', N'720.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0210', N'2015000872', N'1003', N'2', N'T红', N'315.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0210', N'2015000872', N'1005', N'2', N'T红', N'120.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0210', N'2015000872', N'1006', N'2', N'T红', N'570.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0210', N'2015000872', N'11', N'2', N'T红', N'171.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0210', N'2015000872', N'14', N'2', N'T红', N'384.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0210', N'2015000872', N'16', N'2', N'T红', N'96.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0210', N'2015000872', N'17', N'2', N'T红', N'96.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0211', N'2015001085', N'0101', N'1', N'孙瑛达', N'974.94')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0211', N'2015001085', N'010101', N'1', N'孙瑛达', N'17.08')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0211', N'2015001085', N'0401', N'1', N'孙瑛达', N'780.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0211', N'2015001085', N'0403', N'1', N'孙瑛达', N'80.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0211', N'2015001085', N'05', N'1', N'孙瑛达', N'495.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0211', N'2015001085', N'06', N'1', N'孙瑛达', N'150.12')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0211', N'2015001085', N'0701', N'1', N'孙瑛达', N'150.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0211', N'2015001085', N'10', N'1', N'孙瑛达', N'6.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0211', N'2015001085', N'1001', N'1', N'孙瑛达', N'165.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0211', N'2015001085', N'1002', N'1', N'孙瑛达', N'105.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0211', N'2015001085', N'1003', N'1', N'孙瑛达', N'135.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0211', N'2015001085', N'1004', N'1', N'孙瑛达', N'40.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0211', N'2015001085', N'1006', N'1', N'孙瑛达', N'55.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0211', N'2015001085', N'14', N'1', N'孙瑛达', N'27.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0211', N'2015001085', N'15', N'1', N'孙瑛达', N'3.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0211', N'2015001085', N'16', N'1', N'孙瑛达', N'6.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0211', N'2015001085', N'17', N'1', N'孙瑛达', N'8.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0211', N'2015001085', N'24', N'1', N'孙瑛达', N'30.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0212', N'2014300384', N'0101', N'2', N'洪都党', N'1419.35')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0212', N'2014300384', N'010101', N'2', N'洪都党', N'172.08')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0212', N'2014300384', N'0401', N'2', N'洪都党', N'375.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0212', N'2014300384', N'0403', N'2', N'洪都党', N'350.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0212', N'2014300384', N'05', N'2', N'洪都党', N'245.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0212', N'2014300384', N'06', N'2', N'洪都党', N'203.32')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0212', N'2014300384', N'1001', N'2', N'洪都党', N'105.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0212', N'2014300384', N'1002', N'2', N'洪都党', N'505.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0212', N'2014300384', N'1003', N'2', N'洪都党', N'193.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0212', N'2014300384', N'1006', N'2', N'洪都党', N'55.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0212', N'2014300384', N'14', N'2', N'洪都党', N'256.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0212', N'2014300384', N'16', N'2', N'洪都党', N'64.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0212', N'2014300384', N'17', N'2', N'洪都党', N'64.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0212', N'2015000175', N'0101', N'2', N'凤戟祎', N'2186.40')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0212', N'2015000175', N'010101', N'2', N'凤戟祎', N'86.23')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0212', N'2015000175', N'0403', N'2', N'凤戟祎', N'80.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0212', N'2015000175', N'05', N'2', N'凤戟祎', N'665.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0212', N'2015000175', N'06', N'2', N'凤戟祎', N'223.86')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0212', N'2015000175', N'07', N'2', N'凤戟祎', N'400.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0212', N'2015000175', N'1001', N'2', N'凤戟祎', N'58.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0212', N'2015000175', N'1002', N'2', N'凤戟祎', N'450.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0212', N'2015000175', N'1003', N'2', N'凤戟祎', N'178.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0212', N'2015000175', N'14', N'2', N'凤戟祎', N'256.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0212', N'2015000175', N'16', N'2', N'凤戟祎', N'64.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0212', N'2015000175', N'17', N'2', N'凤戟祎', N'64.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0219', N'2015000035', N'010101', N'1', N'解甄敢', N'13.96')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0219', N'2015000035', N'05', N'1', N'解甄敢', N'145.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0219', N'2015000035', N'06', N'1', N'解甄敢', N'216.14')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0219', N'2015000035', N'1001', N'1', N'解甄敢', N'193.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0219', N'2015000035', N'1003', N'1', N'解甄敢', N'146.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0219', N'2015000035', N'11', N'1', N'解甄敢', N'20.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0219', N'2015000035', N'14', N'1', N'解甄敢', N'64.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0219', N'2015000035', N'16', N'1', N'解甄敢', N'16.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0219', N'2015000035', N'17', N'1', N'解甄敢', N'16.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0219', N'2015000385', N'0101', N'1', N'辛在', N'1080.09')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0219', N'2015000385', N'010101', N'1', N'辛在', N'102.22')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0219', N'2015000385', N'0102', N'1', N'辛在', N'358.44')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0219', N'2015000385', N'0201', N'1', N'辛在', N'169.82')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0219', N'2015000385', N'05', N'1', N'辛在', N'305.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0219', N'2015000385', N'06', N'1', N'辛在', N'519.24')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0219', N'2015000385', N'07', N'1', N'辛在', N'155.28')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0219', N'2015000385', N'08', N'1', N'辛在', N'200.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0219', N'2015000385', N'09', N'1', N'辛在', N'550.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0219', N'2015000385', N'1001', N'1', N'辛在', N'223.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0219', N'2015000385', N'1002', N'1', N'辛在', N'50.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0219', N'2015000385', N'1003', N'1', N'辛在', N'146.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0219', N'2015000385', N'1006', N'1', N'辛在', N'30.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0219', N'2015000385', N'11', N'1', N'辛在', N'2.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0219', N'2015000385', N'13', N'1', N'辛在', N'267.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0219', N'2015000385', N'14', N'1', N'辛在', N'128.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0219', N'2015000385', N'16', N'1', N'辛在', N'32.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0219', N'2015000385', N'17', N'1', N'辛在', N'40.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0220', N'2015001013', N'0101', N'2', N'饶法', N'1622.08')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0220', N'2015001013', N'010101', N'2', N'饶法', N'106.59')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0220', N'2015001013', N'05', N'2', N'饶法', N'40.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0220', N'2015001013', N'06', N'2', N'饶法', N'1584.49')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0220', N'2015001013', N'1001', N'2', N'饶法', N'198.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0220', N'2015001013', N'1002', N'2', N'饶法', N'435.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0220', N'2015001013', N'1003', N'2', N'饶法', N'215.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0220', N'2015001013', N'14', N'2', N'饶法', N'294.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0220', N'2015001013', N'16', N'2', N'饶法', N'63.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0220', N'2015001013', N'17', N'2', N'饶法', N'56.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0220', N'2015001014', N'0101', N'2', N'黄忱谦', N'1622.08')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0220', N'2015001014', N'010101', N'2', N'黄忱谦', N'135.73')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0220', N'2015001014', N'0401', N'2', N'黄忱谦', N'250.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0220', N'2015001014', N'06', N'2', N'黄忱谦', N'1469.27')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0220', N'2015001014', N'1001', N'2', N'黄忱谦', N'193.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0220', N'2015001014', N'1002', N'2', N'黄忱谦', N'150.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0220', N'2015001014', N'1003', N'2', N'黄忱谦', N'191.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0220', N'2015001014', N'1006', N'2', N'黄忱谦', N'230.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0220', N'2015001014', N'14', N'2', N'黄忱谦', N'294.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0220', N'2015001014', N'16', N'2', N'黄忱谦', N'63.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0220', N'2015001014', N'17', N'2', N'黄忱谦', N'56.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0220', N'2015001015', N'0101', N'2', N'简改', N'1899.87')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0220', N'2015001015', N'010101', N'2', N'简改', N'63.56')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0220', N'2015001015', N'06', N'2', N'简改', N'1013.48')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0220', N'2015001015', N'1001', N'2', N'简改', N'193.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0220', N'2015001015', N'1002', N'2', N'简改', N'315.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0220', N'2015001015', N'1003', N'2', N'简改', N'348.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0220', N'2015001015', N'1006', N'2', N'简改', N'348.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0220', N'2015001015', N'14', N'2', N'简改', N'252.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0220', N'2015001015', N'16', N'2', N'简改', N'54.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0220', N'2015001015', N'17', N'2', N'简改', N'48.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0223', N'2015000037', N'0101', N'2', N'薛桢桥', N'1408.13')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0223', N'2015000037', N'010101', N'2', N'薛桢桥', N'2405.40')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0223', N'2015000037', N'0102', N'2', N'薛桢桥', N'26.79')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0223', N'2015000037', N'0201', N'2', N'薛桢桥', N'90.39')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0223', N'2015000037', N'0401', N'2', N'薛桢桥', N'300.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0223', N'2015000037', N'05', N'2', N'薛桢桥', N'200.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0223', N'2015000037', N'06', N'2', N'薛桢桥', N'523.10')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0223', N'2015000037', N'1001', N'2', N'薛桢桥', N'33.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0223', N'2015000037', N'1002', N'2', N'薛桢桥', N'260.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0223', N'2015000037', N'1003', N'2', N'薛桢桥', N'457.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0223', N'2015000037', N'1005', N'2', N'薛桢桥', N'410.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0223', N'2015000037', N'1006', N'2', N'薛桢桥', N'85.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0223', N'2015000037', N'14', N'2', N'薛桢桥', N'352.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0223', N'2015000037', N'16', N'2', N'薛桢桥', N'88.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0223', N'2015000037', N'17', N'2', N'薛桢桥', N'88.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0223', N'2015000174', N'0101', N'2', N'时遒萍', N'1428.66')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0223', N'2015000174', N'010101', N'2', N'时遒萍', N'109.32')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0223', N'2015000174', N'05', N'2', N'时遒萍', N'345.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0223', N'2015000174', N'06', N'2', N'时遒萍', N'293.60')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0223', N'2015000174', N'1001', N'2', N'时遒萍', N'88.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0223', N'2015000174', N'1002', N'2', N'时遒萍', N'260.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0223', N'2015000174', N'1003', N'2', N'时遒萍', N'375.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0223', N'2015000174', N'1005', N'2', N'时遒萍', N'130.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0223', N'2015000174', N'1006', N'2', N'时遒萍', N'85.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0223', N'2015000174', N'14', N'2', N'时遒萍', N'108.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0223', N'2015000174', N'16', N'2', N'时遒萍', N'54.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0223', N'2015000174', N'17', N'2', N'时遒萍', N'72.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0223', N'2015000383', N'0101', N'2', N'但枚', N'1069.56')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0223', N'2015000383', N'010101', N'2', N'但枚', N'544.19')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0223', N'2015000383', N'0401', N'2', N'但枚', N'300.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0223', N'2015000383', N'05', N'2', N'但枚', N'235.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0223', N'2015000383', N'06', N'2', N'但枚', N'345.05')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0223', N'2015000383', N'1001', N'2', N'但枚', N'241.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0223', N'2015000383', N'1002', N'2', N'但枚', N'805.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0223', N'2015000383', N'1003', N'2', N'但枚', N'528.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0223', N'2015000383', N'1005', N'2', N'但枚', N'130.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0223', N'2015000383', N'1006', N'2', N'但枚', N'170.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0223', N'2015000383', N'11', N'2', N'但枚', N'12.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0223', N'2015000383', N'14', N'2', N'但枚', N'256.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0223', N'2015000383', N'16', N'2', N'但枚', N'64.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0223', N'2015000383', N'17', N'2', N'但枚', N'64.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0223', N'2015000874', N'0101', N'2', N'丹字粟', N'4043.24')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0223', N'2015000874', N'010101', N'2', N'丹字粟', N'363.09')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0223', N'2015000874', N'0201', N'2', N'丹字粟', N'87.72')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0223', N'2015000874', N'0401', N'2', N'丹字粟', N'300.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0223', N'2015000874', N'0402', N'2', N'丹字粟', N'600.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0223', N'2015000874', N'05', N'2', N'丹字粟', N'595.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0223', N'2015000874', N'06', N'2', N'丹字粟', N'387.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0223', N'2015000874', N'1001', N'2', N'丹字粟', N'109.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0223', N'2015000874', N'1003', N'2', N'丹字粟', N'204.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0223', N'2015000874', N'1005', N'2', N'丹字粟', N'410.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0223', N'2015000874', N'1006', N'2', N'丹字粟', N'480.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0223', N'2015000874', N'11', N'2', N'丹字粟', N'48.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0223', N'2015000874', N'14', N'2', N'丹字粟', N'462.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0223', N'2015000874', N'16', N'2', N'丹字粟', N'99.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0223', N'2015000874', N'17', N'2', N'丹字粟', N'88.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0223', N'2015000874', N'24', N'2', N'丹字粟', N'15.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0223', N'2015001083', N'0101', N'2', N'湖航', N'3341.38')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0223', N'2015001083', N'010101', N'2', N'湖航', N'517.15')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0223', N'2015001083', N'020101', N'2', N'湖航', N'13.22')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0223', N'2015001083', N'04', N'2', N'湖航', N'342.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0223', N'2015001083', N'0401', N'2', N'湖航', N'975.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0223', N'2015001083', N'05', N'2', N'湖航', N'340.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0223', N'2015001083', N'06', N'2', N'湖航', N'313.91')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0223', N'2015001083', N'1001', N'2', N'湖航', N'168.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0223', N'2015001083', N'1003', N'2', N'湖航', N'178.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0223', N'2015001083', N'1005', N'2', N'湖航', N'280.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0223', N'2015001083', N'11', N'2', N'湖航', N'40.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0223', N'2015001083', N'14', N'2', N'湖航', N'156.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0223', N'2015001083', N'16', N'2', N'湖航', N'48.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0223', N'2015001083', N'17', N'2', N'湖航', N'104.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0223', N'2015001083', N'24', N'2', N'湖航', N'15.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0224', N'2015000664', N'0101', N'2', N'娄唐上', N'3485.08')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0224', N'2015000664', N'010101', N'2', N'娄唐上', N'100.87')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0224', N'2015000664', N'020101', N'2', N'娄唐上', N'28.90')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0224', N'2015000664', N'0401', N'2', N'娄唐上', N'1085.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0224', N'2015000664', N'0402', N'2', N'娄唐上', N'600.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0224', N'2015000664', N'05', N'2', N'娄唐上', N'263.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0224', N'2015000664', N'06', N'2', N'娄唐上', N'742.71')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0224', N'2015000664', N'1001', N'2', N'娄唐上', N'193.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0224', N'2015000664', N'1002', N'2', N'娄唐上', N'825.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0224', N'2015000664', N'1003', N'2', N'娄唐上', N'235.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0224', N'2015000664', N'1006', N'2', N'娄唐上', N'475.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0224', N'2015000664', N'14', N'2', N'娄唐上', N'612.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0224', N'2015000664', N'16', N'2', N'娄唐上', N'144.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0224', N'2015000664', N'17', N'2', N'娄唐上', N'144.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0224', N'2015000664', N'24', N'2', N'娄唐上', N'45.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0226', N'2015001082', N'0101', N'2', N'甘器', N'149.06')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0226', N'2015001082', N'010101', N'2', N'甘器', N'188.10')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0226', N'2015001082', N'010201', N'2', N'甘器', N'34.19')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0226', N'2015001082', N'06', N'2', N'甘器', N'2081.34')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0226', N'2015001082', N'14', N'2', N'甘器', N'135.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0226', N'2015001082', N'16', N'2', N'甘器', N'15.00')
GO

INSERT INTO [dbo].[Stat_Hosp_Fee_Office_Patient] VALUES (N'201501', N'0226', N'2015001082', N'17', N'2', N'甘器', N'40.00')
GO


-- ----------------------------
-- Table structure for Stat_Hosp_FeeType
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Stat_Hosp_FeeType]') AND type IN ('U'))
	DROP TABLE [dbo].[Stat_Hosp_FeeType]
GO

CREATE TABLE [dbo].[Stat_Hosp_FeeType] (
  [StatDate] varchar(8) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [FeeTypeID] int DEFAULT ((0)) NOT NULL,
  [SumPrice] numeric(18,2) DEFAULT ((0)) NOT NULL,
  [DiscountMoney] numeric(18,2) DEFAULT ((0)) NOT NULL,
  [CashMoney] numeric(18,2) DEFAULT ((0)) NOT NULL,
  [YBMoney] numeric(18,2) DEFAULT ((0)) NOT NULL,
  [XNHMoney] numeric(18,2) DEFAULT ((0)) NOT NULL,
  [PrepayMoney] numeric(18,2) DEFAULT ((0)) NOT NULL,
  [PayMoney] numeric(18,2) DEFAULT ((0)) NOT NULL
)
GO

ALTER TABLE [dbo].[Stat_Hosp_FeeType] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of Stat_Hosp_FeeType
-- ----------------------------
INSERT INTO [dbo].[Stat_Hosp_FeeType] VALUES (N'201412', N'201', N'3317.33', N'.00', N'.00', N'2316.39', N'.00', N'1000.94', N'.00')
GO

INSERT INTO [dbo].[Stat_Hosp_FeeType] VALUES (N'201501', N'100', N'29891.07', N'.00', N'-5649.29', N'.00', N'.00', N'34500.00', N'1040.36')
GO

INSERT INTO [dbo].[Stat_Hosp_FeeType] VALUES (N'201501', N'201', N'140353.84', N'200.00', N'12036.82', N'104646.11', N'.00', N'15800.00', N'7670.91')
GO

INSERT INTO [dbo].[Stat_Hosp_FeeType] VALUES (N'201501', N'300', N'27206.77', N'1135.00', N'-11466.10', N'.00', N'9537.87', N'28000.00', N'.00')
GO


-- ----------------------------
-- Table structure for Stat_Hosp_Work
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Stat_Hosp_Work]') AND type IN ('U'))
	DROP TABLE [dbo].[Stat_Hosp_Work]
GO

CREATE TABLE [dbo].[Stat_Hosp_Work] (
  [StID] int  IDENTITY(1,1) NOT NULL,
  [CheckSign] int DEFAULT ((0)) NULL,
  [StatDate] datetime DEFAULT (getdate()) NULL,
  [OfficeID] varchar(16) COLLATE Chinese_PRC_CI_AS  NULL,
  [OfficeName] varchar(30) COLLATE Chinese_PRC_CI_AS  NULL,
  [PlanOpenBedCount] numeric(18,3) DEFAULT ((0)) NULL,
  [BeforeCount] numeric(18,3) DEFAULT ((0)) NULL,
  [InHospCount] numeric(18,3) DEFAULT ((0)) NULL,
  [OutHospCount] numeric(18,3)  NULL,
  [OtherInOfficeCount] numeric(18,3) DEFAULT ((0)) NULL,
  [OutHospCure] numeric(18,3) DEFAULT ((0)) NULL,
  [OutHospBetter] numeric(18,3) DEFAULT ((0)) NULL,
  [OutHospNoCure] numeric(18,3) DEFAULT ((0)) NULL,
  [OutHospDie] numeric(18,3) DEFAULT ((0)) NULL,
  [OutHospOther] numeric(18,3) DEFAULT ((0)) NULL,
  [OutHospOutOffice] numeric(18,3) DEFAULT ((0)) NULL,
  [OutHospSum] numeric(18,3) DEFAULT ((0)) NULL,
  [LastSumCount] numeric(18,3) DEFAULT ((0)) NULL,
  [OpenBed] numeric(18,3) DEFAULT ((0)) NULL,
  [OpenBedAvg] numeric(18,3) DEFAULT ((0)) NULL,
  [OpenBedCount] numeric(18,3) DEFAULT ((0)) NULL,
  [OutHospBedCount] numeric(18,3) DEFAULT ((0)) NULL,
  [CureRatio] numeric(18,3) DEFAULT ((0)) NULL,
  [DieRatio] numeric(18,3) DEFAULT ((0)) NULL,
  [BedTurnOverRatio] numeric(18,3) DEFAULT ((0)) NULL,
  [BedWorkAvg] numeric(18,3) DEFAULT ((0)) NULL,
  [BedUsesRatio] numeric(18,3) DEFAULT ((0)) NULL,
  [OutHospDayCountAvg] numeric(18,3) DEFAULT ((0)) NULL,
  [BedNullAvgCount] numeric(18,3) DEFAULT ((0)) NULL,
  [OperationCount] numeric(18,3) DEFAULT ((0)) NULL,
  [OperationSum] numeric(18,3) DEFAULT ((0)) NULL,
  [OperationTotal] numeric(18,3) DEFAULT ((0)) NULL,
  [OperationA] numeric(18,3) DEFAULT ((0)) NULL,
  [OperationB] numeric(18,3) DEFAULT ((0)) NULL,
  [OperationC] numeric(18,3) DEFAULT ((0)) NULL,
  [OperationJR] numeric(18,3) DEFAULT ((0)) NULL,
  [OperationZQ] numeric(18,3) DEFAULT ((0)) NULL,
  [OperationSQZC] numeric(18,3) DEFAULT ((0)) NULL,
  [HospInfected] numeric(18,3) DEFAULT ((0)) NULL,
  [RescueCount] numeric(18,3) DEFAULT ((0)) NULL,
  [RescueCountOk] numeric(18,3) DEFAULT ((0)) NULL,
  [InHospDiagnoseYes] numeric(18,3) DEFAULT ((0)) NULL,
  [InOutHospYes] numeric(18,3) DEFAULT ((0)) NULL,
  [InOutHospNo] numeric(18,3) DEFAULT ((0)) NULL,
  [InOutHospElse] numeric(18,3) DEFAULT ((0)) NULL,
  [OperationYes] numeric(18,3) DEFAULT ((0)) NULL,
  [OperationNo] numeric(18,3) DEFAULT ((0)) NULL,
  [OperationElse] numeric(18,3) DEFAULT ((0)) NULL,
  [ClinicYes] numeric(18,3) DEFAULT ((0)) NULL,
  [ClinicNo] numeric(18,3) DEFAULT ((0)) NULL,
  [ClinicElse] numeric(18,3) DEFAULT ((0)) NULL,
  [DateType] varchar(2) COLLATE Chinese_PRC_CI_AS DEFAULT ('D') NULL,
  [CreateTime] datetime DEFAULT (getdate()) NULL
)
GO

ALTER TABLE [dbo].[Stat_Hosp_Work] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for Stat_Hosp_Work_Day
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Stat_Hosp_Work_Day]') AND type IN ('U'))
	DROP TABLE [dbo].[Stat_Hosp_Work_Day]
GO

CREATE TABLE [dbo].[Stat_Hosp_Work_Day] (
  [StID] int  IDENTITY(1,1) NOT NULL,
  [CheckSign] int DEFAULT ((0)) NULL,
  [StatDate] datetime DEFAULT (getdate()) NULL,
  [OfficeID] varchar(16) COLLATE Chinese_PRC_CI_AS  NULL,
  [OfficeName] varchar(30) COLLATE Chinese_PRC_CI_AS  NULL,
  [PlanOpenBedCount] numeric(18,3) DEFAULT ((0)) NULL,
  [BeforeCount] numeric(18,3) DEFAULT ((0)) NULL,
  [InHospCount] numeric(18,3) DEFAULT ((0)) NULL,
  [OtherInOfficeCount] numeric(18,3) DEFAULT ((0)) NULL,
  [OutHospCure] numeric(18,3) DEFAULT ((0)) NULL,
  [OutHospBetter] numeric(18,3) DEFAULT ((0)) NULL,
  [OutHospNoCure] numeric(18,3) DEFAULT ((0)) NULL,
  [OutHospDie] numeric(18,3) DEFAULT ((0)) NULL,
  [OutHospOther] numeric(18,3) DEFAULT ((0)) NULL,
  [OutHospOutOffice] numeric(18,3) DEFAULT ((0)) NULL,
  [OutHospSum] numeric(18,3) DEFAULT ((0)) NULL,
  [LastSumCount] numeric(18,3) DEFAULT ((0)) NULL,
  [OperationCount] int  NULL
)
GO

ALTER TABLE [dbo].[Stat_Hosp_Work_Day] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- View structure for View_Stat_HospWork_Day
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[View_Stat_HospWork_Day]') AND type IN ('V'))
	DROP VIEW [dbo].[View_Stat_HospWork_Day]
GO

CREATE VIEW [dbo].[View_Stat_HospWork_Day] AS SELECT 
StID, 
CheckSign as 审核标识,
StatDate as 统计日期, 
OfficeID as 科室ID, 
OfficeName as 科室, 
PlanOpenBedCount as 开放床位数, 
BeforeCount as 原有人数,
InHospCount as 入院人数,
OtherInOfficeCount as 他科转入,
--OutHospCure as 出院治愈, 
--OutHospBetter as 出院好转,
--OutHospNoCure as 出院未愈, 
--OutHospDie as 出院死亡, 
--OutHospOther as 出院其他, 
OutHospOutOffice as 转往他科, 
OutHospSum as 出院人数, 
LastSumCount as 期末实有人数 

  FROM [His_Stat].[dbo].[Stat_Hosp_Work_Day]
GO


-- ----------------------------
-- View structure for View_Stat_HospWork1
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[View_Stat_HospWork1]') AND type IN ('V'))
	DROP VIEW [dbo].[View_Stat_HospWork1]
GO

CREATE VIEW [dbo].[View_Stat_HospWork1] AS SELECT 
StID, 
DateType AS 类型,
CheckSign as 审核标识,
StatDate as 统计日期, 
OfficeID as 科室ID, 
OfficeName as 科室, 
PlanOpenBedCount as 开放床位数,
InHospCount as 入院人数,
OutHospCount as 出院人数,
OtherInOfficeCount as 他科转入,
OutHospCure as 出院治愈, 
OutHospBetter as 出院好转,
OutHospNoCure as 出院未愈, 
OutHospDie as 出院死亡, 
OutHospOther as 出院其他, 
OutHospSum as 出院合计, 
OutHospOutOffice as 转往他科, 
OpenBed as 实际开放总床日数,
OpenBedAvg as 平均开放床位数, 
OpenBedCount as 实际占用总床日数, 
OutHospBedCount as 出院者占用总床日数 
FROM Stat_Hosp_Work
GO


-- ----------------------------
-- View structure for View_Stat_HospWork2
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[View_Stat_HospWork2]') AND type IN ('V'))
	DROP VIEW [dbo].[View_Stat_HospWork2]
GO

CREATE VIEW [dbo].[View_Stat_HospWork2] AS SELECT 
StID as StID, 
DateType AS 类型,
CheckSign as 审核标识,
StatDate as 统计日期,
OfficeID as 科室ID, 
OfficeName as 科室,
OperationCount as 手术人数, 
OperationSum as 手术合计, 
OperationTotal as I类手术小计, 
OperationA as I类手术甲级愈合, 
OperationB as I类手术乙级愈合, 
OperationC as I类手术丙级愈合,
OperationJR as 手术人数介入, 
OperationZQ as 手术人数择期, 
OperationSQZC as 手术人数择期术前占床数,
HospInfected as 院内感染人数,
RescueCount as 危重病人抢救人数,
RescueCountOk as 危重病人抢救成功次数, 
InHospDiagnoseYes as 入院三日确诊人数,
InOutHospYes as 入出院诊断符合,
InOutHospNo as 入出院诊断不符合,
InOutHospElse as 入出院诊断不肯定,
OperationYes as 术前与术后诊断符合,
OperationNo as 术前与术后诊断不符合, 
OperationElse as 术前与术后诊断不肯定, 
ClinicYes as 临床与病理诊断符合,
ClinicNo as 临床与病理诊断不符合, 
ClinicElse as 临床与病理诊断不肯定
FROM  dbo.Stat_Hosp_Work
GO


-- ----------------------------
-- View structure for View_Stat_HospWork3
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[View_Stat_HospWork3]') AND type IN ('V'))
	DROP VIEW [dbo].[View_Stat_HospWork3]
GO

CREATE VIEW [dbo].[View_Stat_HospWork3] AS select 
OfficeID as 科室编号,
DateType AS 类型,
OfficeName as 科室名称, 
StatDate as 日期, 
BedWorkAvg as 病床平均工作日, 
OutHospDayCountAvg as 出院者平均住院日,
BedNullAvgCount as 平均每天空床数,    
(BedUsesRatio*100)  as '病床周转率%', 
 case       --各科室（出院人数+转往他科人数）/ 平均开放病床数
     when OfficeID <> '99999999'
      then (((Case when OutHospSum=0 then 1 Else OutHospSum end)+OutHospOutOffice)/
              (Case OpenBedAvg when 0 then 1 Else OpenBedAvg end))
     else
     (Case OutHospSum when 0 then 1 Else OutHospSum end)/OpenBedAvg
     end as '病床周转次数',         --全院=出院人数/平均开放病床数
   
(CureRatio*100) '治愈率%',
(Cast(OutHospBetter/(Case when OutHospSum=0 then 1 Else OutHospSum end) as numeric(5,4))*100) as '好转率%',
(Cast(OutHospNoCure/(Case when OutHospSum=0 then 1 Else OutHospSum end) as numeric(5,4))*100) as '未愈率%',
(DieRatio * 100) as '死亡率%',    
 Cast(OperationSQZC/(Case when OperationZQ=0 then 1 Else OperationZQ end) as numeric(8,4)) as '择期手术患者术前平均住院日', 
(Cast(OperationSum/(Case when OutHospSum=0 then 1 Else OutHospSum end) as numeric(8,4))*100) as '手术率%',
(Cast(OperationA/(Case when OperationTotal=0 then 1 Else OperationTotal end) as numeric(8,4))*100) as '无菌手术甲级愈合率%',--愈合
(Cast(OperationC/(Case when OperationTotal=0 then 1 Else OperationTotal end) as numeric(8,4))*100) as '无菌手术感染率%',
(Cast(RescueCountOk/(Case when RescueCount=0 then 1 Else RescueCount end) as numeric(8,4))*100) as '危重病人抢救成功率%',
(Cast(InHospDiagnoseYes/(Case when OutHospSum=0 then 1 Else OutHospSum end) as numeric(8,4))*100) as '三日确诊率%',
(Cast(InOutHospYes/(Case when (OutHospSum-InOutHospNo)=0 then 1 Else (OutHospSum-InOutHospNo) end) as numeric(8,4))*100) as '入出院诊断符合率%',
(Cast(OperationYes/(Case when (OperationCount-OperationNo-OperationElse)=0 then 1 Else (OperationCount-OperationNo-OperationElse) end) as numeric(8,4))*100) as '手术与前后诊断符合率%',
(Cast(ClinicYes/(Case when (OutHospSum-ClinicElse)=0 then 1 Else (OutHospSum-ClinicElse) end) as numeric(8,4))*100) as '临床与病理诊断符合率%',
(Cast(HospInfected/(Case when OutHospSum=0 then 1 Else OutHospSum end) as numeric(8,4))*100) as '院内感染率%'       
  from Stat_Hosp_Work
GO


-- ----------------------------
-- Procedure structure for Pro_Stat_Hosp_Fee_Office_Patient
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Pro_Stat_Hosp_Fee_Office_Patient]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[Pro_Stat_Hosp_Fee_Office_Patient]
GO

CREATE PROCEDURE [dbo].[Pro_Stat_Hosp_Fee_Office_Patient]
	@StatDate smalldatetime 
AS
begin
	declare @BeginDate smalldatetime, @EndDate smalldatetime

	set @StatDate = isnull(@StatDate, getdate() - 1)
	set @BeginDate = dbo.Fun_DateFromParts(DATEPART(year, @StatDate), DATEPART(month, @StatDate), 1)
	set @EndDate = dbo.Fun_DateFromParts(DATEPART(year, @StatDate), DATEPART(month, @StatDate) + 1, 1)
	
	delete Stat_Hosp_Fee_Office_Patient
	where StatDate = convert(varchar(6), @StatDate, 112)
	
	insert into Stat_Hosp_Fee_Office_Patient (StatDate, OfficeID, HospID, PatientName, StatTypeID, PatientType, SumPrice)
	select convert(varchar(6), @StatDate, 112), b.HospOfficeID, a.HospID, a.PatientName, b.StatTypeID, LEFT(a.FeeTypeID, 1),
		--case LEFT(a.FeeTypeID, 1) when '2' then '医保' when '3' then '新农合' else '普通' end as PatientType,
		SUM(b.SumPrice)
	from His_Hosp.dbo.Hosp_FeeMaster a inner join His_Hosp.dbo.Hosp_FeeDetail  b 
		on a.HospID = b.HospID and a.HospFeeID = b.HospFeeID
	where a.FeeTime >= @BeginDate and a.FeeTime < @EndDate and a.FeeSign <> 3 --未挂账
	group by b.HospOfficeID, a.HospID, a.PatientName, b.StatTypeID, LEFT(a.FeeTypeID, 1)
	
end
GO


-- ----------------------------
-- Procedure structure for Pro_Stat_Hosp_Fee_ExecOffice_Patient
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Pro_Stat_Hosp_Fee_ExecOffice_Patient]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[Pro_Stat_Hosp_Fee_ExecOffice_Patient]
GO

CREATE PROCEDURE [dbo].[Pro_Stat_Hosp_Fee_ExecOffice_Patient]
	@StatDate smalldatetime 
AS
begin
	declare @BeginDate smalldatetime, @EndDate smalldatetime

	set @StatDate = isnull(@StatDate, getdate() - 1)
	set @BeginDate = dbo.Fun_DateFromParts(DATEPART(year, @StatDate), DATEPART(month, @StatDate), 1)
	set @EndDate = dbo.Fun_DateFromParts(DATEPART(year, @StatDate), DATEPART(month, @StatDate) + 1, 1)

	delete Stat_Hosp_Fee_ExecOffice_Patient
	where StatDate = convert(varchar(6), @StatDate, 112)

	insert into Stat_Hosp_Fee_ExecOffice_Patient (StatDate, ExecOfficeID, HospID, PatientName, StatTypeID, SumPrice)
	select convert(varchar(6), @StatDate, 112), b.ExecOfficeID, a.HospID, a.PatientName, b.StatTypeID, SUM(b.SumPrice)
	from His_Hosp.dbo.Hosp_FeeMaster  a inner join His_Hosp.dbo.Hosp_FeeDetail  b 
		on a.HospID = b.HospID and a.HospFeeID = b.HospFeeID
	where a.FeeTime >= @BeginDate and a.FeeTime < @EndDate and a.FeeSign <> 3 --未挂账
	group by ExecOfficeID, a.HospID, a.PatientName, b.StatTypeID

end
GO


-- ----------------------------
-- Procedure structure for Pro_Stat_Hosp_Doctor_Apply
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Pro_Stat_Hosp_Doctor_Apply]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[Pro_Stat_Hosp_Doctor_Apply]
GO

CREATE PROCEDURE [dbo].[Pro_Stat_Hosp_Doctor_Apply]
	@StatDate smalldatetime 
AS
begin
	declare @BeginDate smalldatetime, @EndDate smalldatetime

	set @StatDate = isnull(@StatDate, getdate() - 1)
	
	set @BeginDate = dbo.Fun_DateFromParts(DATEPART(year, @StatDate), DATEPART(month, @StatDate), 1)
	set @EndDate = dbo.Fun_DateFromParts(DATEPART(year, @StatDate), DATEPART(month, @StatDate) + 1, 1)

	delete Stat_Hosp_Doctor_Apply
	where StatDate = convert(varchar(6), @StatDate, 112)

	insert into Stat_Hosp_Doctor_Apply (StatDate, OfficeID, DoctorID, ExecOfficeID, Quan, SumPrice)
	select convert(varchar(6), @StatDate, 112), ApplyOfficeID, ApplyOpID, ExecOfficeID, count(*), SUM(SumPrice)
	from 
		(select b.ApplyID, SUM(b.SumPrice) as SumPrice
		from His_Hosp.dbo.Hosp_FeeMaster  a
			inner join His_Hosp.dbo.Hosp_FeeDetail  b on a.HospID = b.HospID and a.HospFeeID = b.HospFeeID
			inner join His_Hosp.dbo.Hosp_ApplyMaster  c on b.ApplyID = c.ApplyID
		where a.FeeTime >= @BeginDate and a.FeeTime < @EndDate
			and a.FeeSign <> 3
			and c.RecTypeID > '20' and c.RecTypeID < '31'
		group by b.ApplyID
		having SUM(b.SumPrice) > 0
	) e, His_Hosp.dbo.Hosp_ApplyMaster  d	
	where e.ApplyID = d.ApplyID
	group by ApplyOfficeID, ApplyOpID, ExecOfficeID

end
GO


-- ----------------------------
-- Procedure structure for Pro_Stat_Clin_Reg
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Pro_Stat_Clin_Reg]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[Pro_Stat_Clin_Reg]
GO

CREATE PROCEDURE [dbo].[Pro_Stat_Clin_Reg]
	@StatDate smalldatetime 
AS
begin
	declare @BeginDate varchar(6), @EndDate varchar(8)

	set @StatDate = isnull(@StatDate, getdate() - 1)
	set @BeginDate = convert(varchar(6), @StatDate, 112) 
	set @EndDate = @BeginDate + '9'

	delete Stat_Clin_Reg
	where StatDate = @BeginDate

	insert into Stat_Clin_Reg (StatDate, OfficeID, RegTypeID, RegCount, RegPrice, DiagPrice, SumPrice)
	select @BeginDate, ClinOfficeID, RegTypeID, count(*), SUM(RegPrice), SUM(DiagPrice), SUM(SumPrice)
	from His_Data.dbo.Clin_Reg 
	where ClinID >= @BeginDate and ClinID < @EndDate 
		and RegSign = 0 
		and ClinDoctorID <> ''
	group by ClinOfficeID, RegTypeID
	
	
end
GO


-- ----------------------------
-- Procedure structure for Pro_Stat_Clin_Fee_ClinOffice
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Pro_Stat_Clin_Fee_ClinOffice]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[Pro_Stat_Clin_Fee_ClinOffice]
GO

CREATE PROCEDURE [dbo].[Pro_Stat_Clin_Fee_ClinOffice]
	@StatDate smalldatetime
AS
begin
	declare @BeginDate varchar(6), @EndDate varchar(8)

	set @StatDate = isnull(@StatDate, getdate() - 1)
	set @BeginDate = convert(varchar(6), @StatDate, 112)  --201407，即统计时间
	set @EndDate = @BeginDate + '9'

	delete Stat_Clin_Fee_ClinOffice
	where StatDate = @BeginDate
	
	insert into Stat_Clin_Fee_ClinOffice (StatDate, OfficeID, StatTypeID, SumPrice)
	select @BeginDate, OfficeID, StatTypeID, SUM(SumPrice)
	from His_Data.dbo.Clin_RecMaster  a 
		inner join His_Data.dbo.Clin_RecDetail  b on a.RecipeID = b.RecipeID
	where a.ClinFeeID >= @BeginDate and a.ClinFeeID < @EndDate
	group by OfficeID, StatTypeID


end
GO


-- ----------------------------
-- Procedure structure for Pro_Stat_Clin_Fee_ExecOffice
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Pro_Stat_Clin_Fee_ExecOffice]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[Pro_Stat_Clin_Fee_ExecOffice]
GO

CREATE PROCEDURE [dbo].[Pro_Stat_Clin_Fee_ExecOffice]
	@StatDate smalldatetime 
AS
begin
	declare @BeginDate varchar(6), @EndDate varchar(8)

	set @StatDate = isnull(@StatDate, getdate() - 1)
	set @BeginDate = convert(varchar(6), @StatDate, 112)
	set @EndDate = @BeginDate + '9'

	delete Stat_Clin_Fee_ExecOffice
	where StatDate = @BeginDate

	insert into Stat_Clin_Fee_ExecOffice (StatDate, ExecOfficeID, StatTypeID, SumPrice)
	select @BeginDate, ExecOfficeID, StatTypeID, SUM(SumPrice)
	from His_Data.dbo.Clin_RecMaster  a 
		inner join His_Data.dbo.Clin_RecDetail  b on a.RecipeID = b.RecipeID
	where a.ClinFeeID >= @BeginDate and a.ClinFeeID < @EndDate
	group by ExecOfficeID, StatTypeID
	
	
end
GO


-- ----------------------------
-- Procedure structure for Pro_Stat_Clin_Fee_FeeType
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Pro_Stat_Clin_Fee_FeeType]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[Pro_Stat_Clin_Fee_FeeType]
GO

CREATE PROCEDURE [dbo].[Pro_Stat_Clin_Fee_FeeType]
	@StatDate smalldatetime = null 
AS
begin
	declare @BeginDate varchar(6), @EndDate varchar(8)

	set @StatDate = isnull(@StatDate, getdate() - 1)
	set @BeginDate = convert(varchar(6), @StatDate, 112) 
	set @EndDate = @BeginDate + '9'

	delete Stat_Clin_Fee_FeeType
	where StatDate = @BeginDate

	insert into Stat_Clin_Fee_FeeType (StatDate, FeeTypeID, SumPrice, DiscountMoney, YBMoney, CashMoney, POSMoney, ETCMoney1, ETCMoney2)
	select @BeginDate, FeeTypeID, SUM(SumPrice), SUM(DiscountMoney), SUM(YBMoney), SUM(CashMoney), SUM(POSMoney), SUM(ETCMoney1), SUM(ETCMoney2)
	from His_Data.dbo.Clin_FeeMaster 
	where ClinFeeID >= @BeginDate and ClinFeeID < @EndDate
	group by FeeTypeID
	
	
end
GO


-- ----------------------------
-- Procedure structure for Pro_Stat_Clin_Fee_RecExecOffice
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Pro_Stat_Clin_Fee_RecExecOffice]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[Pro_Stat_Clin_Fee_RecExecOffice]
GO

CREATE PROCEDURE [dbo].[Pro_Stat_Clin_Fee_RecExecOffice]
	@StatDate smalldatetime 
AS
begin
	declare @BeginDate varchar(6), @EndDate varchar(8)

	set @StatDate = isnull(@StatDate, getdate() - 1)
	set @BeginDate = convert(varchar(6), @StatDate, 112) 
	set @EndDate = @BeginDate + '9'

	delete Stat_Clin_Fee_RecExecOffice
	where StatDate = @BeginDate
	
	insert into Stat_Clin_Fee_RecExecOffice (StatDate, RecOfficeID, ExecOfficeID, SumPrice)
	select @BeginDate, OfficeID, ExecOfficeID, SUM(SumPrice)
	from His_Data.dbo.Clin_RecMaster  a 
		inner join His_Data.dbo.Clin_RecDetail  b on a.RecipeID = b.RecipeID
	where a.ClinFeeID >= @BeginDate and a.ClinFeeID < @EndDate
	group by OfficeID, ExecOfficeID


end
GO


-- ----------------------------
-- Procedure structure for Pro_Stat_HospWork_Day
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Pro_Stat_HospWork_Day]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[Pro_Stat_HospWork_Day]
GO

CREATE PROCEDURE [dbo].[Pro_Stat_HospWork_Day] 
@WorkDate DateTime
AS
BEGIN

declare 
  @BeginDate Datetime,
  @EndDate Datetime
  
  select @BeginDate = @WorkDate+' 00:00:00'
  select @EndDate = @WorkDate+' 23:59:59'
  
  delete from His_Stat.dbo.Stat_Hosp_Work_Day
  where StatDate = @WorkDate  
  
  insert into His_Stat.dbo.Stat_Hosp_Work_Day
  (OfficeID,OfficeName,PlanOpenBedCount,StatDate)
  select OfficeID,OfficeName,BedCount,@WorkDate from [His_Sys].[dbo].[Sys_Office]
  where OfficeID like '02%' and Len(OfficeID) >= 4 and StopSign = 0 and BedCount >0

  Update Work
  set InHospCount = B.CID 
   from His_Stat.dbo.Stat_Hosp_Work_Day Work inner join
   (select OfficeID,COUNT(HospID) as CID   
    from [His_Hosp].[dbo].[Hosp_Patient] Hosp 
   where HospSign not In (0,11)   
         and HospDate between @BeginDate and @EndDate 
   group by OfficeID) B
   on Work.OfficeID= B.officeID
   where Work.statDate = @WorkDate   
   
   -------------出院人数---------- （主要用于住院日报数据）
   --不是退院,入院当天的合计人数 
  Update Work  
  set OutHospSum = B.CID 
   from His_Stat.dbo.Stat_Hosp_Work_Day Work inner join
   (select OfficeID,COUNT(HospID) as CID   
    from [His_Hosp].[dbo].[Hosp_Patient] Hosp 
   where HospSign not In (0,11)   --不是退院,入院 
         and OutHospDate between @BeginDate and @EndDate 
   group by OfficeID) B
   on Work.OfficeID= B.officeID
   where Work.statDate = @WorkDate 
   
  
  -------------他科转入人数----------D转入E转出
  Update Work
  set OtherInOfficeCount = B.InOfficeCount  
  from His_Stat.dbo.Stat_Hosp_Work_Day Work inner join
   (select InOfficeID, COUNT(*) as InOfficeCount
  from [His_Hosp].[dbo].[Hosp_OfficeChange]
  where ChangeSign = 1 and OutTime between @BeginDate and @EndDate 
  group by InOfficeID) as B
  on B.InOfficeID = Work.OfficeID
  where Work.StatDate = @WorkDate  
 
  -------------转往他科人数----------D转入E转出   
  Update Work
  set OutHospOutOffice = B.OutOfficeCount  
  from His_Stat.dbo.Stat_Hosp_Work_Day Work inner join
   (select OutOfficeID,COUNT(*) as OutOfficeCount
  from [His_Hosp].[dbo].[Hosp_OfficeChange]
  where ChangeSign = 1 and OutTime between @BeginDate and @EndDate 
  group by OutOfficeID) as B
  on B.OutOfficeID = Work.OfficeID
  where Work.StatDate = @WorkDate
 
 -------------在院人数----------
Update His_Stat.dbo.Stat_Hosp_Work_Day  
  set LastSumCount = B.CID 
   from His_Stat.dbo.Stat_Hosp_Work_Day Work inner join
   (select OfficeID,Count(HospID) as CID   
    from [His_Hosp].[dbo].[Hosp_Patient] Hosp 
   where HospSign in (1) and HospDate < @EndDate --在院、入院时间不是当天         
   group by OfficeID) B
   on Work.OfficeID= B.officeID
   where Work.statDate = @WorkDate 
   
 -------------原有人数---------- 以00:10为准更新前一天的人数
  --以前天的数据结存人数为准
  --因数据发生变化，无法进行统计,目前通过计算得到
  
  Update His_Stat.dbo.Stat_Hosp_Work_Day  
  set BeforeCount =  ISNULL(LastSumCount,0)+                
                     ISNULL(OutHospOutOffice,0)+
                     ISNULL(OutHospSum,0) -                  
                     ISNULL(OtherInOfficeCount,0)-
                     ISNULL(InHospCount,0)
  where His_Stat.dbo.Stat_Hosp_Work_Day.StatDate = @WorkDate  
  
  -------------手术人数------------
--   Update His_Stat.dbo.Stat_Hosp_Work_Day
--   set OperationCount = B.OPNUM
--   from His_Stat.dbo.Stat_Hosp_Work_Day Work inner join
--   (select o.[总例数] as OPNUM,o.[科室编码] as ApplyOfficeID 
-- 	from [10.1.0.118].[Docare].[dbo].[OPERATIONINFO_TO_DEP] o 
-- 	where o.[日期] between Convert(varchar(10),@BeginDate,120) and Convert(varchar(10),@EndDate,120)) B
-- 	on Work.OfficeID = B.ApplyOfficeID
-- 	where Work.StatDate = @WorkDate

  /*
   Update His_Stat.dbo.Stat_Hosp_Work_Day  
   set BeforeCount = B.CID 
   from His_Stat.dbo.Stat_Hosp_Work_Day Work inner join
   (select LastSumCount as CID,officeID from His_Stat.dbo.Stat_Hosp_Work_Day 
   where StatDate= @WorkDate-1) B
   on Work.OfficeID= B.officeID
   where Work.statDate = @WorkDate   
  */ 
end
GO


-- ----------------------------
-- Procedure structure for Pro_Stat_Clin_Doctor_Recipe
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Pro_Stat_Clin_Doctor_Recipe]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[Pro_Stat_Clin_Doctor_Recipe]
GO

CREATE PROCEDURE [dbo].[Pro_Stat_Clin_Doctor_Recipe]
	@StatDate smalldatetime 
AS
begin
	declare @BeginDate varchar(6), @EndDate varchar(8)

	set @StatDate = isnull(@StatDate, getdate() - 1)
	set @BeginDate = convert(varchar(6), @StatDate, 112)  
	set @EndDate = @BeginDate + '9'

	delete Stat_Clin_Doctor_Recipe
	where StatDate = @BeginDate
	
	insert into Stat_Clin_Doctor_Recipe (StatDate, OfficeID, DoctorID, ExecOfficeID, Quan, SumPrice)
	select @BeginDate, OfficeID, DoctorID, ExecOfficeID, SUM(Quan), SUM(RecipePrice)
	from (
		select a.OfficeID, a.DoctorID, a.ExecOfficeID,
			(case when OldRecID > 0 then -1 else 1 end) as Quan,
			(select isnull(SUM(SumPrice), 0) from His_Data.dbo.Clin_RecDetail b where b.RecipeID = a.RecipeID) as RecipePrice
		from His_Data.dbo.Clin_RecMaster  a
		where a.ClinFeeID >= @BeginDate and a.ClinFeeID < @EndDate
			and DoctorID <> '' and RecTypeID > '20' and RecTypeID < '31'
	) c
	where RecipePrice <> 0
	group by OfficeID, DoctorID, ExecOfficeID



end
GO


-- ----------------------------
-- Procedure structure for Pro_Stat_Clin_Doctor_Stat
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Pro_Stat_Clin_Doctor_Stat]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[Pro_Stat_Clin_Doctor_Stat]
GO

CREATE PROCEDURE [dbo].[Pro_Stat_Clin_Doctor_Stat]
	@StatDate smalldatetime
AS
begin
	declare @BeginDate varchar(6), @EndDate varchar(8)

	set @StatDate = isnull(@StatDate, getdate() - 1)
	set @BeginDate = convert(varchar(6), @StatDate, 112) 
	set @EndDate = @BeginDate + '9'

	delete Stat_Clin_Doctor_Stat
	where StatDate = @BeginDate
	
	insert into Stat_Clin_Doctor_Stat (StatDate, DoctorID, StatTypeID, SumPrice)
	select @BeginDate, a.DoctorID, b.StatTypeID, SUM(b.SumPrice)
	from His_Data.dbo.Clin_RecMaster  a 
		inner join His_Data.dbo.Clin_RecDetail  b on b.RecipeID = a.RecipeID
	where a.ClinFeeID >= @BeginDate and a.ClinFeeID < @EndDate
		--and a.DoctorID <> ''
	group by DoctorID, StatTypeID



end
GO


-- ----------------------------
-- Procedure structure for Pro_Stat_Clin_Doctor_Reg
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Pro_Stat_Clin_Doctor_Reg]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[Pro_Stat_Clin_Doctor_Reg]
GO

CREATE PROCEDURE [dbo].[Pro_Stat_Clin_Doctor_Reg]
	@StatDate smalldatetime 
AS
begin
	declare @BeginDate varchar(6), @EndDate varchar(8)

	set @StatDate = isnull(@StatDate, getdate() - 1)
	set @BeginDate = convert(varchar(6), @StatDate, 112) 
	set @EndDate = @BeginDate + '9'

	delete Stat_Clin_Doctor_Reg
	where StatDate = @BeginDate
	
	insert into Stat_Clin_Doctor_Reg (StatDate, DoctorID, RegTypeID, Quan)
	select @BeginDate, a.ClinDoctorID, a.RegTypeID, COUNT(*)
	from His_Data.dbo.Clin_Reg  a 
	where a.ClinID >= @BeginDate and a.ClinID < @EndDate
		and RegSign = 0
		and a.ClinDoctorID <> ''
	group by ClinDoctorID, RegTypeID



end
GO


-- ----------------------------
-- Procedure structure for Pro_Stat_Clin_Doctor_Work
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Pro_Stat_Clin_Doctor_Work]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[Pro_Stat_Clin_Doctor_Work]
GO

CREATE PROCEDURE [dbo].[Pro_Stat_Clin_Doctor_Work]
	@StatDate smalldatetime
AS
begin
	declare @BeginDate varchar(6), @EndDate varchar(8)

	set @StatDate = isnull(@StatDate, getdate() - 1)
	set @BeginDate = convert(varchar(6), @StatDate, 112) 
	set @EndDate = @BeginDate + '9'

	delete Stat_Clin_Doctor_Work
	where StatDate = @BeginDate

	insert into Stat_Clin_Doctor_Work (StatDate, OfficeID, DoctorID, RecipeCount, RecipePrice, MedicinePrice)
	select @BeginDate, OfficeID, DoctorID, SUM(RecipeCount), SUM(RecipePrice), SUM(MedPrice)
	from (
		select a.OfficeID, a.DoctorID,
			(case when OldRecID > 0 then -1 else 1 end) as RecipeCount,
			(select isnull(SUM(SumPrice), 0) from His_Data.dbo.Clin_RecDetail b where b.RecipeID = a.RecipeID) as RecipePrice,
			(select isnull(SUM(SumPrice), 0) from His_Data.dbo.Clin_RecDetail c where c.RecipeID = a.RecipeID and c.StatTypeID < '03') as MedPrice
		from His_Data.dbo.Clin_RecMaster  a
		where a.ClinFeeID >= @BeginDate and a.ClinFeeID < @EndDate
	) c
	where RecipePrice <> 0
	group by OfficeID, DoctorID

	update Stat_Clin_Doctor_Work
	set RegCount = c.RegCount
	from Stat_Clin_Doctor_Work a, 
		(select OfficeID, DoctorID, count(*) as RegCount
		from (select distinct a.OfficeID, a.DoctorID, ClinID
			from His_Data.dbo.Clin_RecMaster  a
			where a.ClinFeeID >= @BeginDate and a.ClinFeeID < @EndDate) b
		group by OfficeID, DoctorID ) c
	where a.StatDate = @BeginDate and a.OfficeID = c.OfficeID and a.DoctorID = c.DoctorID
	
	


end
GO


-- ----------------------------
-- Procedure structure for Pro_Call_Stat
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Pro_Call_Stat]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[Pro_Call_Stat]
GO

CREATE PROCEDURE [dbo].[Pro_Call_Stat]
	@StatParam smalldatetime = null
AS
begin
-- 每日门诊统计
EXECUTE Pro_Stat_Clin_Doctor_Recipe @StatDate = @StatParam
EXECUTE Pro_Stat_Clin_Doctor_Reg @StatDate = @StatParam
EXECUTE Pro_Stat_Clin_Doctor_Stat @StatDate = @StatParam
EXECUTE Pro_Stat_Clin_Doctor_Work @StatDate = @StatParam
EXECUTE Pro_Stat_Clin_Fee_ClinOffice @StatDate = @StatParam
EXECUTE Pro_Stat_Clin_Fee_ExecOffice @StatDate = @StatParam
EXECUTE Pro_Stat_Clin_Fee_FeeType  @StatDate = @StatParam
EXECUTE Pro_Stat_Clin_Fee_RecExecOffice @StatDate = @StatParam
EXECUTE Pro_Stat_Clin_Reg @StatDate = @StatParam

-- WAITFOR DELAY '00:00:2'
-- 每日住院统计
EXEC Pro_Stat_Hosp_Fee_Office @StatDate = @StatParam
EXEC .Pro_Stat_Hosp_Fee_ExecOffice @StatDate = @StatParam
EXEC Pro_Stat_Hosp_Fee_Office_ExecOffice @StatDate = @StatParam
EXEC Pro_Stat_Hosp_Fee_Office_Patient @StatDate = @StatParam
EXEC Pro_Stat_Hosp_Doctor_Apply @StatDate = @StatParam
exec Pro_Stat_Hosp_Fee_ExecOffice_Patient @StatDate = @StatParam
exec Pro_Stat_Hosp_Fee_FeeType @StatDate = @StatParam
EXEC Pro_Stat_Hosp_Fee_ExecOffice_Patient @StatDate = @StatParam




	
end
GO


-- ----------------------------
-- Procedure structure for Pro_Stat_Hosp_Fee_FeeType
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Pro_Stat_Hosp_Fee_FeeType]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[Pro_Stat_Hosp_Fee_FeeType]
GO

CREATE PROCEDURE [dbo].[Pro_Stat_Hosp_Fee_FeeType]
	@StatDate smalldatetime = null --要统计的年月，为空则默认昨天
AS
begin
	declare @BeginDate smalldatetime, @EndDate smalldatetime

	-- 默认昨天
	set @StatDate = isnull(@StatDate, getdate() - 1)
	
	set @BeginDate = dbo.Fun_DateFromParts(DATEPART(year, @StatDate), DATEPART(month, @StatDate), 1)
	set @EndDate = dbo.Fun_DateFromParts(DATEPART(year, @StatDate), DATEPART(month, @StatDate) + 1, 1)

	--先清除本月数据
	delete Stat_Hosp_FeeType
	where StatDate = convert(varchar(6), @StatDate, 112)
	
	--插入本月数据
	insert into Stat_Hosp_FeeType (StatDate, FeeTypeID, SumPrice, DiscountMoney, 
		CashMoney, YBMoney, XNHMoney, PrepayMoney, PayMoney)
	select convert(varchar(6), @StatDate, 112), FeeTypeID, SUM(SumPrice), SUM(DiscountMoney), 
		SUM(CashMoney), SUM(YBMoney), SUM(XNHMoney), SUM(PrepayMoney), SUM(PayMoney)
	from His_Hosp.dbo.Hosp_FeeMaster  a
	where a.FeeTime >= @BeginDate and a.FeeTime < @EndDate and a.FeeSign in (1, 2)
	group by FeeTypeID
	
	
end
GO


-- ----------------------------
-- Procedure structure for Pro_Stat_HospWork_Month
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Pro_Stat_HospWork_Month]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[Pro_Stat_HospWork_Month]
GO

CREATE PROCEDURE [dbo].[Pro_Stat_HospWork_Month] 
@WorkDate DateTime,
@DateType Varchar(2)
AS
BEGIN

declare 
  @BeginDate Datetime,
  @EndDate Datetime

-- if @DateType='月'   
--    begin
--     select @BeginDate = dateadd(dd,-datepart(dd,@WorkDate)+1,@WorkDate)+' 00:00:00'
--     select @EndDate = dateadd(dd,-datepart(dd,@WorkDate) ,dateadd(mm,1,@WorkDate))+' 23:59:59'
--    end
--  else if @DateType = '季'
--     begin
--     select @BeginDate = DATEADD(qq, DATEDIFF(qq,0,@WorkDate), 0)+' 00:00:00'
--     select @EndDate = DATEADD(qq, DATEDIFF(qq,-1,@WorkDate), -1) +' 23:59:59'
--    end  
--   else if @DateType = '半'
--     begin
--     select @BeginDate =  DATEADD(YEAR, DATEDIFF(YEAR,0,@WorkDate), 0)+' 00:00:00'
--     select @EndDate = dateadd(dd,-datepart(dd,@WorkDate) ,dateadd(mm,1,@WorkDate))+' 23:59:59'
--     select @BeginDate= '2016-01-01 00:00:00' --下半年就打开
--     select @EndDate= '2016-06-30 23:59:59' --下半年就打开
--    end   
--  else if @DateType = '年' 
--    begin
--     select @BeginDate =  DATEADD(YEAR, DATEDIFF(YEAR,0,@WorkDate), 0)+' 00:00:00'
--     select @EndDate =  DATEADD(YEAR, DATEDIFF(YEAR,-1,@WorkDate), -1) +' 23:59:59'
--    end  
--   
--   delete from His_Stat.dbo.stat_Hosp_Work
--   where StatDate = @WorkDate and DateType = @DateType and OfficeID <> '99999999'
--   
--   insert into His_Stat.dbo.stat_Hosp_Work
--   (OfficeID,OfficeName,PlanOpenBedCount,OpenBed,StatDate,DateType)
--   select FGHisOfficeID,OfficeName,BedCount,BedCount,@WorkDate,@DateType from [His_Sys].[dbo].[Sys_Office]
--   where OfficeID like '02%' and Len(OfficeID) >= 4 and StopSign = 0 and BedCount >0
-- 
-- 
--  -------------原有人数---------- 以00:10为准更新前一天的人数
-- /*
--   Update His_Stat.dbo.stat_Hosp_Work  
--   set BeforeCount = B.CID 
--   from His_Stat.dbo.stat_Hosp_Work Work inner join
--   (select 入院科室 as OfficeID,Count(HospID) as CID
--   from [His_EMR].[dbo].[V_EMR_PatientBaseInfo] EMR
--   where (EMR.出院日期 is null) and (isnull(EMR.出院科室,'') = '' 
--    and EMR.入院日期 not between @BeginDate and @EndDate)  
--   Group by EMR.入院科室) B
--   on Work.OfficeID= B.officeID
--   where Work.statDate = @WorkDate   
--   */ 
--   
--   --月报没有原有人数
--   /*
--   update His_Stat.dbo.stat_Hosp_Work 
--   set BeforeCount = B.LastSumCount
--   from His_Stat.dbo.stat_Hosp_Work Work 
--   inner join
--    (select LastSumCount,officeID from His_Stat.dbo.stat_Hosp_Work 
--    where StatDate= @WorkDate-1) B
--   on Work.OfficeID = B.officeID
--   where Work.statDate = @WorkDate  
--  */
--  
--   -------------入院人数---------- 
--   
-- --  Update Work
-- --  set InHospCount = B.CID 
-- --   from His_Stat.dbo.stat_Hosp_Work Work inner join
-- --   (select top 100 入院科室 as OfficeID,Count(HospID) as CID
-- --   from [His_EMR].[dbo].[V_EMR_PatientBaseInfo] EMR
-- --   where 入院日期 between @BeginDate and @EndDate
-- --   Group by EMR.入院科室) B
-- --   on Work.OfficeID= B.officeID
-- --   where Work.StatDate = @WorkDate and DateType = @DateType
--   
--    -------------出院人数---------- （主要用于住院日报数据）
-- --  Update Work
-- --  set OutHospCount = isnull(B.CID,0)
-- --   from His_Stat.dbo.stat_Hosp_Work Work inner join
-- --   (select top 100 出院科室 as OfficeID,Count(HospID) as CID
-- --   from [His_EMR].[dbo].[V_EMR_PatientBaseInfo] EMR
-- --   where 出院日期 between @BeginDate and @EndDate
-- --         and isnull(EMR.出院科室,'') <> '' 
-- --   Group by EMR.出院科室) B
-- --   on Work.OfficeID= B.officeID
-- --   where Work.StatDate = @WorkDate and DateType = @DateType
-- 
--   -------------他科转入人数----------D转入E转出
-- --   Update Work
-- --   set OtherInOfficeCount = B.InOfficeCount  
-- --   from His_Stat.dbo.stat_Hosp_Work Work inner join
-- --   (select  top 100 COUNT(DEPT_CODE) as InOfficeCount,DEPT_CODE 
-- --    from [EMR].[JHEMR].[dbo].[PATS_IN_TRANSFERRING]     
-- --   where TRANSFER_DATE_TIME between @BeginDate and @EndDate
-- --   and Action IN ('D') 
-- --   group by DEPT_CODE) B
-- --   on B.DEPT_CODE = Work.OfficeID
-- --   where Work.StatDate = @WorkDate and DateType = @DateType
-- 
-- 
--   -------------转往他科人数----------D转入E转出 
--   
-- --   Update Work
-- --   set OutHospOutOffice = B.OutOfficeCount  
-- --   from His_Stat.dbo.stat_Hosp_Work Work inner join
-- --   (select  top 100 COUNT(DEPT_CODE) as OutOfficeCount,DEPT_CODE 
-- --    from [EMR].[JHEMR].[dbo].[PATS_IN_TRANSFERRING]    
-- --   where TRANSFER_DATE_TIME between @BeginDate and @EndDate
-- --   and Action IN ('E') 
-- --   group by DEPT_CODE) B
-- --   on B.DEPT_CODE = Work.OfficeID
-- --   where Work.StatDate = @WorkDate and DateType = @DateType and 
-- -- DateType = @DateType
-- 
--  -------------出院治愈人数---------- 
--   --1. 治愈 2. 好转 3. 末愈 4. 死亡 5. 其它 
-- --   Update Work
-- --   set OutHospCure = B.CureCount  
-- --   from His_Stat.dbo.stat_Hosp_Work Work inner join
-- --   (select top 100  EMR.出院科室 as OfficeID,Count(EMR.HospID) as CureCount
-- --    from [His_EMR].[dbo].[V_EMR_PatientBaseInfo] EMR
-- --    inner join [His_EMR].[dbo].[V_EMR_DiagnosInfo] Diag
-- --    on  EMR.患者ID = Diag.患者ID and EMR.住院次=Diag.住院次
-- --    where Diag.诊断类别 =3 and Diag.诊断序号 = 1 and Diag.转归 = 1
-- --    and EMR.出院日期 between @BeginDate and @EndDate 
-- --    group by EMR.出院科室) B
-- --   on B.OfficeID = Work.OfficeID
-- --   where Work.StatDate = @WorkDate and DateType = @DateType
-- 
-- 
--  -------------出院好转人数---------- 
--   --1. 治愈 2. 好转 3. 末愈 4. 死亡 5. 其它 
-- --   Update Work
-- --   set OutHospBetter = B.CureCount  
-- --   from His_Stat.dbo.stat_Hosp_Work Work inner join
-- --   (select  top 100  EMR.出院科室 as OfficeID,Count(EMR.HospID) as CureCount
-- --    from [His_EMR].[dbo].[V_EMR_PatientBaseInfo] EMR
-- --    inner join [His_EMR].[dbo].[V_EMR_DiagnosInfo] Diag
-- --    on  EMR.患者ID = Diag.患者ID and EMR.住院次=Diag.住院次
-- --    where Diag.诊断类别 =3 and Diag.诊断序号 = 1 and Diag.转归 = 2
-- --    and EMR.出院日期 between @BeginDate and @EndDate
-- --    group by EMR.出院科室) B
-- --   on B.OfficeID = Work.OfficeID
-- --   where Work.StatDate = @WorkDate and DateType = @DateType
-- 
-- 
--  -------------出院末愈人数---------- 
--   --1. 治愈 2. 好转 3. 末愈 4. 死亡 5. 其它 
-- --   Update Work
-- --   set OutHospNoCure = B.CureCount  
-- -- from His_Stat.dbo.stat_Hosp_Work Work inner join
-- --   (select  top 100 EMR.出院科室 as OfficeID,Count(EMR.HospID) as CureCount
-- --    from [His_EMR].[dbo].[V_EMR_PatientBaseInfo] EMR
-- --    inner join [His_EMR].[dbo].[V_EMR_DiagnosInfo] Diag
-- --    on  EMR.患者ID = Diag.患者ID and EMR.住院次=Diag.住院次
-- --    where Diag.诊断类别 =3 and Diag.诊断序号 = 1 and Diag.转归 = 3
-- --    and EMR.出院日期 between @BeginDate and @EndDate
-- --    group by EMR.出院科室) B
-- --   on B.OfficeID = Work.OfficeID
-- --   where Work.StatDate = @WorkDate and DateType = @DateType
--   
-- 
--  -------------出院死亡人数---------- 
--   --1. 治愈 2. 好转 3. 末愈 4. 死亡 5. 其它 
-- --   Update Work
-- --   set OutHospDie = B.CureCount  
-- --  from His_Stat.dbo.stat_Hosp_Work Work inner join
-- --   (select  top 100 EMR.出院科室 as OfficeID,Count(EMR.HospID) as CureCount
-- --    from [His_EMR].[dbo].[V_EMR_PatientBaseInfo] EMR
-- --    inner join [His_EMR].[dbo].[V_EMR_DiagnosInfo] Diag
-- --    on  EMR.患者ID = Diag.患者ID and EMR.住院次=Diag.住院次
-- --    where Diag.诊断类别 =3 and Diag.诊断序号 = 1 and Diag.转归 = 4
-- --    and EMR.出院日期 between @BeginDate and @EndDate
-- --    group by EMR.出院科室) B
-- --   on B.OfficeID = Work.OfficeID
-- --   where Work.StatDate = @WorkDate and DateType = @DateType
--  
--  
--  -------------出院其他人数---------- 
--   --1. 治愈 2. 好转 3. 末愈 4. 死亡 5. 其它 
-- --   Update Work
-- --   set OutHospOther = B.CureCount  
-- --   from His_Stat.dbo.stat_Hosp_Work Work inner join
-- --   (select  top 100 EMR.出院科室 as OfficeID,Count(EMR.HospID) as CureCount
-- --    from [His_EMR].[dbo].[V_EMR_PatientBaseInfo] EMR
-- --    inner join [His_EMR].[dbo].[V_EMR_DiagnosInfo] Diag
-- --    on  EMR.患者ID = Diag.患者ID and EMR.住院次=Diag.住院次
-- --    where Diag.诊断类别 =3 and Diag.诊断序号 = 1 and Diag.转归 = 5
-- --    and EMR.出院日期 between @BeginDate and @EndDate
-- --    group by EMR.出院科室) B
-- --   on B.OfficeID = Work.OfficeID
-- --   where Work.StatDate = @WorkDate and DateType = @DateType
--  
--  
--  -------------出院合计人数----------  
--   Update His_Stat.dbo.stat_Hosp_Work  
--   set OutHospSum = ISNULL(OutHospCure,0)+
--                    ISNULL(OutHospBetter,0)+
--                    ISNULL(OutHospNoCure,0)+
--                    ISNULL(OutHospDie,0)+
--                    ISNULL(OutHospOther,0)                     
--   where His_Stat.dbo.stat_Hosp_Work.StatDate = @WorkDate and DateType = @DateType
--   
--   
--   -------------期末实有人数----------(当前天数在院病人)  
-- /*  Update His_Stat.dbo.stat_Hosp_Work  
--   set LastSumCount = B.CID 
--   from His_Stat.dbo.stat_Hosp_Work Work inner join
--   (select 入院科室 as OfficeID,Count(HospID) as CID
--   from [His_EMR].[dbo].[V_EMR_PatientBaseInfo] EMR
--   where (EMR.出院日期 is null) and (isnull(EMR.出院科室,'') ='') 
--        --and EMR.入院日期 <= @EndDate 
--   Group by EMR.入院科室) B
--   on Work.OfficeID= B.officeID
--   where Work.statDate = @WorkDate
--   
--   --不计算
--   Update His_Stat.dbo.stat_Hosp_Work  
--   set LastSumCount = ISNULL(BeforeCount,0)+
--                      ISNULL(InHospCount,0)+
--                      ISNULL(OtherInOfficeCount,0)-
--                      ISNULL(OutHospOutOffice,0)-
--                      ISNULL(OutHospSum,0)                     
--   where His_Stat.dbo.stat_Hosp_Work.StatDate = @WorkDate 
--   */
--  
--  -------------实际开放床位总数人数----------(实际开放总床日数*当月天数)  
--  Update His_Stat.dbo.stat_Hosp_Work  
--  set OpenBed = Isnull(PlanOpenBedCount,0)*(DATEDIFF(Day,@Begindate,@EndDate)+1)
--  where His_Stat.dbo.stat_Hosp_Work.StatDate = @WorkDate and DateType = @DateType 
--  
-- 
--  -------------平均开放床位人数---------- (实际占用床位日数/平均开放病床数)  
--  Update His_Stat.dbo.stat_Hosp_Work  
--  set OpenBedAvg = OpenBed/(DATEDIFF(Day,@Begindate,@EndDate)+1)               
--  where His_Stat.dbo.stat_Hosp_Work.StatDate = @WorkDate and DateType = @DateType      
-- 
-- 
--   -------------出院者占用总床日数---------- (出院者占用总床日数=出院人数*住院天数（不足一天按一天计算）)  
-- --  Update His_Stat.dbo.stat_Hosp_Work  
-- --  set OutHospBedCount = B.DaySumCount 
-- --  from His_Stat.dbo.stat_Hosp_Work Work inner join
-- --   (select EMR.出院科室,Sum(DATEDIFF(Day,EMR.入院日期,EMR.出院日期)+1) as DaySumCount
-- --    from [His_EMR].[dbo].[V_EMR_PatientBaseInfo] EMR
-- --    where EMR.出院日期 between @BeginDate and @EndDate
-- --    group by EMR.出院科室) B
-- --   on B.出院科室 = Work.OfficeID
-- --   where Work.StatDate = @WorkDate and DateType = @DateType 
--   
--   -------------实际占用总床日数---------- (实际占用床位总数=在院者占用总床日数)
--   /*  以下代码废掉
--   Update His_Stat.dbo.stat_Hosp_Work  
--   set OpenBedCount = B.DaySumCount 
--   from His_Stat.dbo.stat_Hosp_Work Work inner join
--   (
-- select EMR.出院科室,
--     Sum(case WHEN (EMR.入院日期 < @BeginDate) and (EMR.出院日期 < @EndDate)
--               then DATEDIFF(Day,@BeginDate,EMR.出院日期)      --住院日期算进不算出
--                     
--          WHEN (EMR.入院日期 > @BeginDate) and (EMR.出院日期 < @EndDate)
--               then DATEDIFF(Day,EMR.入院日期,EMR.出院日期)    --住院日期算进不算出  
--                        
--          WHEN (EMR.入院日期 > @BeginDate) and (EMR.出院日期 > @EndDate)
--               then DATEDIFF(Day,EMR.入院日期, @EndDate)        --住院日期算进不算出 
--                       
--          WHEN (EMR.入院日期 < @BeginDate) and (EMR.出院日期 > @EndDate)
--               then DATEDIFF(Day,@BeginDate,@EndDate)          --住院日期算进不算出
--                
--          WHEN (EMR.入院日期 < @BeginDate) and (EMR.出院日期 IS null)
--               then DATEDIFF(Day,@BeginDate,@EndDate)          --住院日期算进不算出                                     
--          end) as DaySumCount  --实际在院天数
--          
--    from [His_EMR].[dbo].[V_EMR_PatientBaseInfo] EMR
--    where (EMR.入院日期 between @BeginDate and @EndDate) or
--          (EMR.出院日期 between @BeginDate and @EndDate) or 
--          (EMR.入院日期 < @BeginDate and EMR.出院日期 IS null)
--      group by EMR.出院科室) B
--       on B.出院科室 = Work.OfficeID
--    where Work.StatDate = @WorkDate and DateType = @DateType 
--   */   
-- 
--   --实际占用总床日数 = 日报表中的实际日报合计
--   Update His_Stat.dbo.stat_Hosp_Work  
--   set OpenBedCount = B.SumCount
--   from His_Stat.dbo.stat_Hosp_Work Work inner join
--   (SELECT SUM(LastSumCount) as SumCount,SysOffice.FGHisOfficeID as 出院科室
--   FROM [His_Stat].[dbo].[Stat_Hosp_Work_Day] WorkDay inner join
--   [His_Sys].[dbo].[Sys_Office] SysOffice
--   on WorkDay.OfficeID = SysOffice.OfficeID
--   where StatDate between @BeginDate and @EndDate
--   group by SysOffice.FGHisOfficeID) B
--   on B.出院科室 = Work.OfficeID
--   where Work.StatDate = @WorkDate and DateType = @DateType  
--   
--  
--   -------------治愈率---------- (治愈人数/出院人数)  
--  Update His_Stat.dbo.stat_Hosp_Work  
--  set CureRatio = OutHospCure/Case when OutHospSum=0 then 1 else OutHospSum end
--  where His_Stat.dbo.stat_Hosp_Work.StatDate = @WorkDate and DateType = @DateType
--   
--   -------------病死率---------- (病死人数/出院人数)  
--  Update His_Stat.dbo.stat_Hosp_Work  
--  set DieRatio = OutHospDie/Case when OutHospSum=0 then 1 else OutHospSum end
--  where His_Stat.dbo.stat_Hosp_Work.StatDate = @WorkDate and DateType = @DateType  
--  
--   -------------病床周转次数---------- (出院人数/平均开放病床数)  
--  Update His_Stat.dbo.stat_Hosp_Work  
--  set BedTurnOverRatio = OutHospSum/Case when PlanOpenBedCount=0 then 1 else PlanOpenBedCount end 
--  where His_Stat.dbo.stat_Hosp_Work.StatDate = @WorkDate and DateType = @DateType  
--  
--   -------------病床平均工作日---------- (实际开放床位总数/平均开放病床数)  
--  Update His_Stat.dbo.stat_Hosp_Work  
--  set BedWorkAvg = OpenBedCount/Case when OpenBedAvg=0 then 1 else OpenBedAvg end 
--  where His_Stat.dbo.stat_Hosp_Work.StatDate = @WorkDate and DateType = @DateType 
--  
--   
--   -------------病床使用率---------- (实际占用总床位数/实际开放床位总数*当月天数)  
--  Update His_Stat.dbo.stat_Hosp_Work  
--  set BedUsesRatio = OpenBedCount/
--                     ((Case when PlanOpenBedCount=0 then 1 else PlanOpenBedCount end)*
--                     (DATEDIFF(Day,@Begindate,@EndDate)+1)) 
--  where His_Stat.dbo.stat_Hosp_Work.StatDate = @WorkDate and DateType = @DateType    
--  
--  
--   -------------出院者平均住院日---------- (出院者占用总床日数/出院人数) 
--    
--  Update His_Stat.dbo.stat_Hosp_Work  
--  set OutHospDayCountAvg =  OutHospBedCount/Case when OutHospSum=0 then 1 else OutHospSum end
--  where His_Stat.dbo.stat_Hosp_Work.StatDate = @WorkDate and DateType = @DateType
--  
--  
--   -------------平均每天空床数---------- (实际占用总床日数-实际开放总床日数)/当月天数
--  Update His_Stat.dbo.stat_Hosp_Work  
--  set BedNullAvgCount = (OpenBedCount - OpenBed) /(DATEDIFF(Day,@Begindate,@EndDate)+1)
--  where His_Stat.dbo.stat_Hosp_Work.StatDate = @WorkDate and DateType = @DateType 
--  
--  
-- ---手术信息-------------------------------------------------------------------------- 
-- 
-- 
-- -------------手术人数---------- 
--  Update Work
--  set OperationCount = OperDetail.OperCount
--   from His_Stat.dbo.stat_Hosp_Work Work inner join
--   (select EMR.出院科室 as OfficeID,count(EMR.HospID) as OperCount 
--      From [His_EMR].[dbo].[V_EMR_PatientBaseInfo] EMR
--   Right join [His_EMR].[dbo].[V_EMR_OperationInfo] Oper
--   on EMR.患者ID = Oper.患者ID and EMR.住院次=Oper.住院次
--   where EMR.出院日期 between @BeginDate and @EndDate
--   group by EMR.出院科室) OperDetail 
--    on Work.OfficeID= OperDetail.OfficeID
--   where Work.StatDate = @WorkDate and DateType = @DateType
--  
--  -------------手术合计---------- 
-- --  Update Work
-- --  set OperationSum = OperDetail.OperCount
-- --   from His_Stat.dbo.stat_Hosp_Work Work inner join
-- --   (select EMR.出院科室 as OfficeID,count(Oper.手术代码) as OperCount 
-- --     From [His_EMR].[dbo].[V_EMR_PatientBaseInfo] EMR
-- --   Right join [His_EMR].[dbo].[V_EMR_OperationInfo] Oper
-- --   on EMR.患者ID = Oper.患者ID and EMR.住院次=Oper.住院次
-- --   where EMR.出院日期 between @BeginDate and @EndDate
-- --   group by EMR.出院科室) OperDetail 
-- --    on Work.OfficeID= OperDetail.OfficeID
-- --   where Work.StatDate = @WorkDate and DateType = @DateType
--  
--   
-- 
--  -------------手术甲类---------- 
--  Update Work
--  set OperationA = OperDetail.OperCount
--   from His_Stat.dbo.stat_Hosp_Work Work inner join
--   (select EMR.出院科室 as OfficeID,count(Oper.手术代码) as OperCount 
--     From [His_EMR].[dbo].[V_EMR_PatientBaseInfo] EMR
--   Right join [His_EMR].[dbo].[V_EMR_OperationInfo] Oper
--   on EMR.患者ID = Oper.患者ID and EMR.住院次=Oper.住院次
--   where EMR.出院日期 between @BeginDate and @EndDate
--      and Oper.切口情况 =1 and Oper.愈合情况 = 1  --(甲良好)
--   group by EMR.出院科室) OperDetail 
--    on Work.OfficeID= OperDetail.OfficeID
--   where Work.StatDate = @WorkDate and DateType = @DateType
--   
--   
--  -------------手术乙类---------- 
--  Update Work
--  set OperationB = OperDetail.OperCount
--   from His_Stat.dbo.stat_Hosp_Work Work inner join
--   (select EMR.出院科室 as OfficeID,count(Oper.手术代码) as OperCount 
--     From [His_EMR].[dbo].[V_EMR_PatientBaseInfo] EMR
--   Right join [His_EMR].[dbo].[V_EMR_OperationInfo] Oper
--   on EMR.患者ID = Oper.患者ID and EMR.住院次=Oper.住院次
--   where EMR.出院日期 between @BeginDate and @EndDate
--      and Oper.切口情况 =1 and Oper.愈合情况 = 2  --(乙欠佳)
--   group by EMR.出院科室) OperDetail 
--    on Work.OfficeID= OperDetail.OfficeID
--   where Work.StatDate = @WorkDate and DateType = @DateType  
--   
--   
--  -------------手术丙类---------- 
--  Update Work
--  set OperationC= OperDetail.OperCount
--   from His_Stat.dbo.stat_Hosp_Work Work inner join
--   (select EMR.出院科室 as OfficeID,count(Oper.手术代码) as OperCount 
--     From [His_EMR].[dbo].[V_EMR_PatientBaseInfo] EMR
--   Right join [His_EMR].[dbo].[V_EMR_OperationInfo] Oper
--   on EMR.患者ID = Oper.患者ID and EMR.住院次=Oper.住院次
--   where EMR.出院日期 between @BeginDate and @EndDate
--      and Oper.切口情况 =1 and Oper.愈合情况 = 3  --(丙化脓)
--   group by EMR.出院科室) OperDetail 
--    on Work.OfficeID= OperDetail.OfficeID
--   where Work.StatDate = @WorkDate and DateType = @DateType   
--  
--  
--  -------------手术合计类---------- 
--  Update His_Stat.dbo.stat_Hosp_Work
--  set OperationTotal= Isnull(OperationA,0)+
--                      Isnull(OperationB,0)+
--                      Isnull(OperationC,0)
--   where statDate = @WorkDate   
--  
--  
--  -------------手术介入---------- 
--  Update Work
--  set OperationJR= OperDetail.OperCount
--   from His_Stat.dbo.stat_Hosp_Work Work inner join
--   (select EMR.出院科室 as OfficeID,count(Oper.手术代码) as OperCount 
--     From [His_EMR].[dbo].[V_EMR_PatientBaseInfo] EMR
--   Right join [His_EMR].[dbo].[V_EMR_OperationInfo] Oper
--   on EMR.患者ID = Oper.患者ID and EMR.住院次=Oper.住院次
--   where EMR.出院日期 between @BeginDate and @EndDate
--      and Oper.切口情况 =1 and Oper.手术代码 = '00'  --(介入手术编码)
--   group by EMR.出院科室) OperDetail 
--    on Work.OfficeID= OperDetail.OfficeID
--   where Work.StatDate = @WorkDate and DateType = @DateType   
--   
--    
--  -------------手术择期---------- 
--  Update Work
--  set OperationZQ= OperDetail.OperCount
--   from His_Stat.dbo.stat_Hosp_Work Work inner join
--   (select EMR.出院科室 as OfficeID,count(Oper.手术代码) as OperCount 
--     From [His_EMR].[dbo].[V_EMR_PatientBaseInfo] EMR
--   Right join [His_EMR].[dbo].[V_EMR_OperationInfo] Oper
--   on EMR.患者ID = Oper.患者ID and EMR.住院次=Oper.住院次
--   where EMR.出院日期 between @BeginDate and @EndDate
--      and Oper.切口情况 =1 and Oper.手术类别 = '择期'  --(择期)
--   group by EMR.出院科室) OperDetail 
--    on Work.OfficeID= OperDetail.OfficeID
--   where Work.StatDate = @WorkDate and DateType = @DateType   
-- 
--  -------------手术择期占床数---------- 
--  Update Work
--  set OperationSQZC= OperDetail.OperSumDay
--   from His_Stat.dbo.stat_Hosp_Work Work inner join
--   (select EMR.出院科室 as OfficeID,Sum(DATEDIFF(Day,Emr.入院日期,Oper.手术日期)) as OperSumDay
--     From [His_EMR].[dbo].[V_EMR_PatientBaseInfo] EMR
--   Right join [His_EMR].[dbo].[V_EMR_OperationInfo] Oper
--   on EMR.患者ID = Oper.患者ID and EMR.住院次=Oper.住院次
--   where EMR.出院日期 between @BeginDate and @EndDate
--      and Oper.切口情况 =1 and Oper.手术类别 = '择期'  --(择期)
--   group by EMR.出院科室) OperDetail 
--    on Work.OfficeID= OperDetail.OfficeID
--   where Work.StatDate = @WorkDate and DateType = @DateType 
-- 
-- 
-- -------------院内感染人数---------- 
--  Update Work
--  set HospInfected= B.InfectedCount
-- from His_Stat.dbo.stat_Hosp_Work Work inner join
--   (select EMR.出院科室 as OfficeID,Count(EMR.HospID) as InfectedCount
--    from [His_EMR].[dbo].[V_EMR_PatientBaseInfo] EMR
--    inner join [His_EMR].[dbo].[V_EMR_DiagnosInfo] Diag
--    on  EMR.患者ID = Diag.患者ID and EMR.住院次=Diag.住院次
--    where Diag.诊断类别 =4 and Diag.诊断序号 = 1 
--    and EMR.出院日期 between @BeginDate and @EndDate
--    group by EMR.出院科室) B
--   on B.OfficeID = Work.OfficeID
--   where Work.StatDate = @WorkDate and DateType = @DateType
-- 
-- 
--  -------------危重病人抢救人次数---------- 
--  Update Work
--  set RescueCount= Detail.RescueSum
--   from His_Stat.dbo.stat_Hosp_Work Work inner join
--   (select EMR.出院科室 as OfficeID,SUM(EMR.抢救次数) as RescueSum
--     From [His_EMR].[dbo].[V_EMR_PatientBaseInfo] EMR  
--   where EMR.出院日期 between @BeginDate and @EndDate    
--   group by EMR.出院科室) Detail 
--    on Work.OfficeID= Detail.OfficeID
--   where Work.StatDate = @WorkDate and DateType = @DateType 
-- 
--  -------------危重病人抢救成功人次数---------- 
--  Update Work
--  set RescueCountOk= Detail.RescueSum
--   from His_Stat.dbo.stat_Hosp_Work Work inner join
--   (select EMR.出院科室 as OfficeID,SUM(EMR.成功次数) as RescueSum
--     From [His_EMR].[dbo].[V_EMR_PatientBaseInfo] EMR  
--   where EMR.出院日期 between @BeginDate and @EndDate    
--   group by EMR.出院科室) Detail 
--    on Work.OfficeID= Detail.OfficeID
--   where Work.StatDate = @WorkDate and DateType = @DateType 
--   
--  -------------入院三日确诊人数---------- 
--  Update Work
--  set InHospDiagnoseYes= DiagDetail.DiagCount
--   from His_Stat.dbo.stat_Hosp_Work Work inner join
--   (select EMR.出院科室 as OfficeID,count(EMR.HospID) as DiagCount
--     From [His_EMR].[dbo].[V_EMR_PatientBaseInfo] EMR
--   where EMR.出院日期 between @BeginDate and @EndDate
--         and DATEDIFF(Day,EMR.入院日期,EMR.入院后确诊日期)<=3
--   group by EMR.出院科室) DiagDetail 
--    on Work.OfficeID= DiagDetail.OfficeID
--   where Work.StatDate = @WorkDate and DateType = @DateType
-- 
-- 
--  -------------入院与出院诊断(符合)---------- 
--  Update Work
--  set InOutHospYes= Detail.HospCount
--   from His_Stat.dbo.stat_Hosp_Work Work inner join
--   (select EMR.出院科室 as OfficeID,Count(EMR.HospID) as HospCount
--     From [His_EMR].[dbo].[V_EMR_PatientBaseInfo] EMR  
--   where EMR.出院日期 between @BeginDate and @EndDate  
--         and EMR.入出院诊断符合 =1   
--   group by EMR.出院科室) Detail 
--    on Work.OfficeID= Detail.OfficeID
--   where Work.StatDate = @WorkDate and DateType = @DateType 
-- 
--  -------------入院与出院诊断(不符合)---------- 
--  Update Work
--  set InOutHospNo= Detail.HospCount
--   from His_Stat.dbo.stat_Hosp_Work Work inner join
--   (select EMR.出院科室 as OfficeID,Count(EMR.HospID) as HospCount
--     From [His_EMR].[dbo].[V_EMR_PatientBaseInfo] EMR  
--   where EMR.出院日期 between @BeginDate and @EndDate  
--         and EMR.入出院诊断符合 =2   
--   group by EMR.出院科室) Detail 
--    on Work.OfficeID= Detail.OfficeID
--   where Work.StatDate = @WorkDate and DateType = @DateType 
-- 
--   
--  -------------入院与出院诊断(不肯定)---------- 
--  Update Work
--  set InOutHospElse= Detail.HospCount
--   from His_Stat.dbo.stat_Hosp_Work Work inner join
--   (select EMR.出院科室 as OfficeID,Count(EMR.HospID) as HospCount
--     From [His_EMR].[dbo].[V_EMR_PatientBaseInfo] EMR  
--   where EMR.出院日期 between @BeginDate and @EndDate  
--         and EMR.入出院诊断符合 =3   
--   group by EMR.出院科室) Detail 
--    on Work.OfficeID= Detail.OfficeID
--   where Work.StatDate = @WorkDate and DateType = @DateType  
--   
-- 
-- 
-- -------------术前术后符合(符合)---------- 
--  Update Work
--  set OperationYes= Detail.HospCount
--   from His_Stat.dbo.stat_Hosp_Work Work inner join
--   (select EMR.出院科室 as OfficeID,Count(EMR.HospID) as HospCount
--     From [His_EMR].[dbo].[V_EMR_PatientBaseInfo] EMR  
--   where EMR.出院日期 between @BeginDate and @EndDate  
--         and EMR.术前术后符合 =1   
--   group by EMR.出院科室) Detail 
--    on Work.OfficeID= Detail.OfficeID
--   where Work.StatDate = @WorkDate and DateType = @DateType 
-- 
--  -------------术前术后符合(不符合)---------- 
--  Update Work
--  set OperationNo= Detail.HospCount
--   from His_Stat.dbo.stat_Hosp_Work Work inner join
--   (select EMR.出院科室 as OfficeID,Count(EMR.HospID) as HospCount
--     From [His_EMR].[dbo].[V_EMR_PatientBaseInfo] EMR  
--   where EMR.出院日期 between @BeginDate and @EndDate  
--         and EMR.术前术后符合 =2   
--   group by EMR.出院科室) Detail 
--    on Work.OfficeID= Detail.OfficeID
--   where Work.StatDate = @WorkDate and DateType = @DateType 
-- 
--   
--  -------------术前术后符合(不肯定)---------- 
--  Update Work
--  set OperationElse= Detail.HospCount
--   from His_Stat.dbo.stat_Hosp_Work Work inner join
--   (select EMR.出院科室 as OfficeID,Count(EMR.HospID) as HospCount
--     From [His_EMR].[dbo].[V_EMR_PatientBaseInfo] EMR  
--   where EMR.出院日期 between @BeginDate and @EndDate  
--         and EMR.术前术后符合 =3   
--   group by EMR.出院科室) Detail 
--    on Work.OfficeID= Detail.OfficeID
--   where Work.StatDate = @WorkDate and DateType = @DateType  
-- 
-- 
-- 
-- -------------临床病理符合(符合)---------- 
--  Update Work
--  set ClinicYes= Detail.HospCount
--   from His_Stat.dbo.stat_Hosp_Work Work inner join
--   (select EMR.出院科室 as OfficeID,Count(EMR.HospID) as HospCount
--     From [His_EMR].[dbo].[V_EMR_PatientBaseInfo] EMR  
--   where EMR.出院日期 between @BeginDate and @EndDate  
--         and EMR.临床病理符合 =1   
--   group by EMR.出院科室) Detail 
--    on Work.OfficeID= Detail.OfficeID
--   where Work.StatDate = @WorkDate and DateType = @DateType 
-- 
--  -------------术前术后符合(不符合)---------- 
--  Update Work
--  set ClinicNo= Detail.HospCount
--   from His_Stat.dbo.stat_Hosp_Work Work inner join
--   (select EMR.出院科室 as OfficeID,Count(EMR.HospID) as HospCount
--     From [His_EMR].[dbo].[V_EMR_PatientBaseInfo] EMR  
--   where EMR.出院日期 between @BeginDate and @EndDate  
--         and EMR.临床病理符合 =2   
--   group by EMR.出院科室) Detail 
--    on Work.OfficeID= Detail.OfficeID
--   where Work.StatDate = @WorkDate and DateType = @DateType 
-- 
--   
--  -------------术前术后符合(不肯定)---------- 
--  Update Work
--  set ClinicElse= Detail.HospCount
--   from His_Stat.dbo.stat_Hosp_Work Work inner join
--   (select EMR.出院科室 as OfficeID,Count(EMR.HospID) as HospCount
--     From [His_EMR].[dbo].[V_EMR_PatientBaseInfo] EMR  
--   where EMR.出院日期 between @BeginDate and @EndDate  
--         and EMR.临床病理符合 =3   
--   group by EMR.出院科室) Detail 
--    on Work.OfficeID= Detail.OfficeID
--   where Work.StatDate = @WorkDate and DateType = @DateType
-- 
--   
--  
--       
-- END
-- GO
-- 
-- 
-- -- ----------------------------
-- -- Procedure structure for Pro_Stat_HospWork
-- -- ----------------------------
-- IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Pro_Stat_HospWork]') AND type IN ('P', 'PC', 'RF', 'X'))
-- 	DROP PROCEDURE[dbo].[Pro_Stat_HospWork]
-- GO
-- 
-- CREATE PROCEDURE [dbo].[Pro_Stat_HospWork] 
-- @WorkDate DateTime,
-- @DateType Varchar(2)
-- AS
-- BEGIN
-- 
-- declare 
--   @BeginDate Datetime,
--   @EndDate Datetime,
--   @OpenBedCount int
-- 
-- select @OpenBedCount = 812  
-- 
-- if @DateType='月'   
--    begin
--     select @BeginDate = dateadd(dd,-datepart(dd,@WorkDate)+1,@WorkDate)+' 00:00:00'
--     select @EndDate = dateadd(dd,-datepart(dd,@WorkDate) ,dateadd(mm,1,@WorkDate))+' 23:59:59'
--    end
--  else if @DateType = '季'
--     begin
--     select @BeginDate = DATEADD(qq, DATEDIFF(qq,0,@WorkDate), 0)+' 00:00:00'
--     select @EndDate = DATEADD(qq, DATEDIFF(qq,-1,@WorkDate), -1) +' 23:59:59'
--    end   
--   else if @DateType = '半'
--     begin
--     select @BeginDate =  DATEADD(YEAR, DATEDIFF(YEAR,0,@WorkDate), 0)+' 00:00:00'
--     select @EndDate = DATEADD(dd,-datepart(dd,@WorkDate) ,dateadd(mm,1,@WorkDate))+' 23:59:59'
--     select @BeginDate= '2016-01-01 00:00:00' --下半年就打开
--     select @EndDate= '2016-06-30 23:59:59' --下半年就打开
--    end   
--  else if @DateType = '年' 
--    begin
--     select @BeginDate =  DATEADD(YEAR, DATEDIFF(YEAR,0,@WorkDate), 0)+' 00:00:00'
--     select @EndDate =  DATEADD(YEAR, DATEDIFF(YEAR,-1,@WorkDate), -1) +' 23:59:59'
--    end
--    
--   delete from His_Stat.dbo.stat_Hosp_Work
--   where StatDate = @WorkDate and DateType = @DateType and OfficeID ='99999999'
--   
--   insert into His_Stat.dbo.stat_Hosp_Work
--   (OfficeID,OfficeName,PlanOpenBedCount,OpenBed,StatDate,DateType)
--   values('99999999','全院'+@DateType+'报',@OpenBedCount,@OpenBedCount,@WorkDate,@DateType)
--  
-- /*
--   Update His_Stat.dbo.stat_Hosp_Work  
--   set BeforeCount = B.CID 
--   from His_Stat.dbo.stat_Hosp_Work Work inner join
--   (select 入院科室 as OfficeID,Count(HospID) as CID
--   from [His_EMR].[dbo].[V_EMR_PatientBaseInfo] EMR
--   where (EMR.出院日期 is null) and (isnull(EMR.出院科室,'') = '' 
--    and EMR.入院日期 not between @BeginDate and @EndDate)  
--   Group by EMR.入院科室) B
--   on Work.OfficeID= B.officeID
--   where Work.statDate = @WorkDate   
--   */ 
--   
--   --月报没有原有人数
--   /*
--   update His_Stat.dbo.stat_Hosp_Work 
--   set BeforeCount = B.LastSumCount
--   from His_Stat.dbo.stat_Hosp_Work Work 
--   inner join
--    (select LastSumCount,officeID from His_Stat.dbo.stat_Hosp_Work 
--    where StatDate= @WorkDate-1) B
--   on Work.OfficeID = B.officeID
--   where Work.statDate = @WorkDate  
--  */
--  
--  
--   -------------入院人数---------- 
--   
--  Update His_Stat.dbo.stat_Hosp_Work 
--  set InHospCount =
--  (select Count(HospID) from [His_EMR].[dbo].[V_EMR_PatientBaseInfo]
--   where 入院日期 between @BeginDate and @EndDate) 
--   where DateType = @DateType and StatDate = @WorkDate and OfficeID = '99999999'
--  
--   
--    -------------出院人数---------- （主要用于住院日报数据）
--  Update His_Stat.dbo.stat_Hosp_Work 
--  set OutHospCount = 
--  (select Count(HospID) from [His_EMR].[dbo].[V_EMR_PatientBaseInfo]
--   where 出院日期 between @BeginDate and @EndDate
--         and isnull(出院科室,'') <> '')
--   where DateType = @DateType and StatDate = @WorkDate and OfficeID = '99999999'
--   
--  
--   -------------他科转入人数----------D转入E转出
--   Update His_Stat.dbo.stat_Hosp_Work 
--   set OtherInOfficeCount =   
--   (select COUNT(DEPT_CODE)
--    from [EMR].[JHEMR].[dbo].[PATS_IN_TRANSFERRING]     
--   where TRANSFER_DATE_TIME between @BeginDate and @EndDate
--   and Action IN ('D') )
--   where DateType = @DateType and StatDate = @WorkDate and OfficeID = '99999999'
-- 
-- 
--   -------------转往他科人数----------D转入E转出 
--   
--   Update His_Stat.dbo.stat_Hosp_Work
--   set OutHospOutOffice =  
--   (select COUNT(DEPT_CODE)
--    from [EMR].[JHEMR].[dbo].[PATS_IN_TRANSFERRING]     
--   where TRANSFER_DATE_TIME between @BeginDate and @EndDate
--   and Action IN ('E') )
--   where DateType = @DateType and StatDate = @WorkDate and OfficeID = '99999999'
-- 
-- 
--  -------------出院治愈人数---------- 
--   --1. 治愈 2. 好转 3. 末愈 4. 死亡 5. 其它 
--   Update His_Stat.dbo.stat_Hosp_Work
--   set OutHospCure =   
--    (select Count(EMR.HospID)
--    from [His_EMR].[dbo].[V_EMR_PatientBaseInfo] EMR
--    inner join [His_EMR].[dbo].[V_EMR_DiagnosInfo] Diag
--    on  EMR.患者ID = Diag.患者ID and EMR.住院次=Diag.住院次
--    where Diag.诊断类别 =3 and Diag.诊断序号 = 1 and Diag.转归 = 1
--    and EMR.出院日期 between @BeginDate and @EndDate)
--    where DateType = @DateType and StatDate = @WorkDate and OfficeID = '99999999'
-- 
-- 
--  -------------出院好转人数---------- 
--   --1. 治愈 2. 好转 3. 末愈 4. 死亡 5. 其它 
--   Update His_Stat.dbo.stat_Hosp_Work
--   set OutHospBetter = 
--   (select Count(EMR.HospID)
--    from [His_EMR].[dbo].[V_EMR_PatientBaseInfo] EMR
--    inner join [His_EMR].[dbo].[V_EMR_DiagnosInfo] Diag
--    on  EMR.患者ID = Diag.患者ID and EMR.住院次=Diag.住院次
--    where Diag.诊断类别 =3 and Diag.诊断序号 = 1 and Diag.转归 = 2
--    and EMR.出院日期 between @BeginDate and @EndDate) 
--    where DateType = @DateType and StatDate = @WorkDate and OfficeID = '99999999'
-- 
-- 
--  -------------出院末愈人数---------- 
--   --1. 治愈 2. 好转 3. 末愈 4. 死亡 5. 其它 OutHospNoCure
--    Update His_Stat.dbo.stat_Hosp_Work
--   set OutHospNoCure = 
--   (select Count(EMR.HospID)
--    from [His_EMR].[dbo].[V_EMR_PatientBaseInfo] EMR
--    inner join [His_EMR].[dbo].[V_EMR_DiagnosInfo] Diag
--    on  EMR.患者ID = Diag.患者ID and EMR.住院次=Diag.住院次
--    where Diag.诊断类别 =3 and Diag.诊断序号 = 1 and Diag.转归 = 3
--    and EMR.出院日期 between @BeginDate and @EndDate)
--    where DateType = @DateType and StatDate = @WorkDate and OfficeID = '99999999'
--   
-- 
--  -------------出院死亡人数---------- 
--   --1. 治愈 2. 好转 3. 末愈 4. 死亡 5. 其它 
--    Update His_Stat.dbo.stat_Hosp_Work
--   set OutHospDie = 
--   (select Count(EMR.HospID)
--    from [His_EMR].[dbo].[V_EMR_PatientBaseInfo] EMR
--    inner join [His_EMR].[dbo].[V_EMR_DiagnosInfo] Diag
--    on  EMR.患者ID = Diag.患者ID and EMR.住院次=Diag.住院次
--    where Diag.诊断类别 =3 and Diag.诊断序号 = 1 and Diag.转归 = 4
--    and EMR.出院日期 between @BeginDate and @EndDate) 
--    where DateType = @DateType and StatDate = @WorkDate and OfficeID = '99999999'
--  
--  
--  -------------出院其他人数---------- 
--   --1. 治愈 2. 好转 3. 末愈 4. 死亡 5. 其它 
--   Update His_Stat.dbo.stat_Hosp_Work
--   set OutHospOther = 
--   (select Count(EMR.HospID)
--    from [His_EMR].[dbo].[V_EMR_PatientBaseInfo] EMR
--    inner join [His_EMR].[dbo].[V_EMR_DiagnosInfo] Diag
--    on  EMR.患者ID = Diag.患者ID and EMR.住院次=Diag.住院次
--    where Diag.诊断类别 =3 and Diag.诊断序号 = 1 and Diag.转归 = 5
--    and EMR.出院日期 between @BeginDate and @EndDate)
--    where DateType = @DateType and StatDate = @WorkDate and OfficeID = '99999999'
--  
--  
--  -------------出院合计人数----------  
--   Update His_Stat.dbo.stat_Hosp_Work  
--   set OutHospSum = ISNULL(OutHospCure,0)+
--                    ISNULL(OutHospBetter,0)+
--                    ISNULL(OutHospNoCure,0)+
--                    ISNULL(OutHospDie,0)+
--                    ISNULL(OutHospOther,0)                     
--   where DateType = @DateType and StatDate = @WorkDate and OfficeID = '99999999'
--   
--   
--   -------------期末实有人数----------(当前天数在院病人)  
-- /*  Update His_Stat.dbo.stat_Hosp_Work  
--   set LastSumCount = B.CID 
--   from His_Stat.dbo.stat_Hosp_Work Work inner join
--   (select 入院科室 as OfficeID,Count(HospID) as CID
--   from [His_EMR].[dbo].[V_EMR_PatientBaseInfo] EMR
--   where (EMR.出院日期 is null) and (isnull(EMR.出院科室,'') ='') 
--        --and EMR.入院日期 <= @EndDate 
--   Group by EMR.入院科室) B
--   on Work.OfficeID= B.officeID
--   where Work.statDate = @WorkDate
--   
--   --不计算
--   Update His_Stat.dbo.stat_Hosp_Work  
--   set LastSumCount = ISNULL(BeforeCount,0)+
--                      ISNULL(InHospCount,0)+
--                      ISNULL(OtherInOfficeCount,0)-
--                      ISNULL(OutHospOutOffice,0)-
--                      ISNULL(OutHospSum,0)                     
--   where His_Stat.dbo.stat_Hosp_Work.StatDate = @WorkDate 
--   */
--  
--  -------------实际开放床位总数人数----------(实际开放总床日数*当月天数)  
--  Update His_Stat.dbo.stat_Hosp_Work  
--  set OpenBed = Isnull(@OpenBedCount,0)*(DATEDIFF(Day,@Begindate,@EndDate)+1)
--  where DateType = @DateType and StatDate = @WorkDate and OfficeID = '99999999'
--  
-- 
--  -------------平均开放床位人数---------- (实际占用床位日数/平均开放病床数)  
--  Update His_Stat.dbo.stat_Hosp_Work  
--  set OpenBedAvg = OpenBed/(DATEDIFF(Day,@Begindate,@EndDate)+1)               
--  where DateType = @DateType and StatDate = @WorkDate and OfficeID = '99999999' 
-- 
-- 
--   -------------出院者占用总床日数---------- (出院者占用总床日数=出院人数*住院天数（不足一天按一天计算）)  
--  Update His_Stat.dbo.stat_Hosp_Work  
--  set OutHospBedCount = 
--   (select Sum(DATEDIFF(Day,入院日期,出院日期)+1)
--    from [His_EMR].[dbo].[V_EMR_PatientBaseInfo] 
--    where 出院日期 between @BeginDate and @EndDate)
--    where DateType = @DateType and StatDate = @WorkDate and OfficeID = '99999999'   
--   
--   -------------实际占用总床日数---------- (实际占用床位总数=在院者占用总床日数)
--   /*Update His_Stat.dbo.stat_Hosp_Work  
--   set OpenBedCount = 
--   (select 
--         Sum(case WHEN (EMR.入院日期 < @BeginDate) and (EMR.出院日期 < @EndDate)
--               then DATEDIFF(Day,@BeginDate,EMR.出院日期)      --住院日期算进不算出      
--          WHEN (EMR.入院日期 > @BeginDate) and (EMR.出院日期 < @EndDate)
--               then DATEDIFF(Day,EMR.入院日期,EMR.出院日期)    --住院日期算进不算出           
--          WHEN (EMR.入院日期 > @BeginDate) and (EMR.出院日期 > @EndDate)
--               then DATEDIFF(Day,EMR.入院日期, @EndDate)        --住院日期算进不算出         
--          WHEN (EMR.入院日期 < @BeginDate) and (EMR.出院日期 > @EndDate)
--               then DATEDIFF(Day,@BeginDate,@EndDate)          --住院日期算进不算出  
--          WHEN (EMR.入院日期 < @BeginDate) and (EMR.出院日期 IS null)
--               then DATEDIFF(Day,@BeginDate,@EndDate)          --住院日期算进不算出                           
--          end) as DaySumCount  --实际在院天数
--    from [His_EMR].[dbo].[V_EMR_PatientBaseInfo] EMR
--    where (EMR.入院日期 between @BeginDate and @EndDate) or
--          (EMR.出院日期 between @BeginDate and @EndDate) or
--          (EMR.入院日期 < @BeginDate and EMR.出院日期 IS null)) 
--    where DateType = @DateType and StatDate = @WorkDate  
--   */  
--   --实际占用总床日数 = 日报表中的实际日报合计
--   Update His_Stat.dbo.stat_Hosp_Work  
--   set OpenBedCount =  
--   (SELECT SUM(LastSumCount) as SumCount
--   FROM [His_Stat].[dbo].[Stat_Hosp_Work_Day] WorkDay 
--   where StatDate between @BeginDate and @EndDate)    
--    from His_Stat.dbo.stat_Hosp_Work Work 
--   where DateType = @DateType and Work.StatDate = @WorkDate and OfficeID = '99999999'
--   
--   -------------治愈率---------- (治愈人数/出院人数)  
--  Update His_Stat.dbo.stat_Hosp_Work  
--  set CureRatio = OutHospCure/Case when OutHospSum=0 then 1 else OutHospSum end
--  where DateType = @DateType and StatDate = @WorkDate and OfficeID = '99999999' 
--   
--   -------------病死率---------- (病死人数/出院人数)  
--  Update His_Stat.dbo.stat_Hosp_Work  
--  set DieRatio = OutHospDie/Case when OutHospSum=0 then 1 else OutHospSum end
--  where DateType = @DateType and StatDate = @WorkDate and OfficeID = '99999999' 
--  
--   -------------病床周转次数---------- (出院人数/平均开放病床数)  
--  Update His_Stat.dbo.stat_Hosp_Work  
--  set BedTurnOverRatio = OutHospSum/Case when PlanOpenBedCount=0 then 1 else PlanOpenBedCount end  
--  where DateType = @DateType and StatDate = @WorkDate and OfficeID = '99999999'  
--  
--   -------------病床平均工作日---------- (实际开放床位总数/平均开放病床数)  
--  Update His_Stat.dbo.stat_Hosp_Work  
--  set BedWorkAvg = OpenBedCount/Case when OpenBedAvg=0 then 1 else OpenBedAvg end 
--  where DateType = @DateType and StatDate = @WorkDate and OfficeID = '99999999'  
--  
--   
--   -------------病床使用率---------- (实际占用总床位数/实际开放床位总数*当月天数)  
--  Update His_Stat.dbo.stat_Hosp_Work  
--  set BedUsesRatio = OpenBedCount/
--                     ((Case when PlanOpenBedCount=0 then 1 else PlanOpenBedCount end)*
--                     (DATEDIFF(Day,@Begindate,@EndDate)+1)) 
--  where DateType = @DateType and StatDate = @WorkDate and OfficeID = '99999999'     
--  
--  
--   -------------出院者平均住院日---------- (出院者占用总床日数/出院人数) 
--    
--  Update His_Stat.dbo.stat_Hosp_Work  
--  set OutHospDayCountAvg =  OutHospBedCount/Case when OutHospSum=0 then 1 else OutHospSum end
--  where DateType = @DateType and StatDate = @WorkDate and OfficeID = '99999999' 
--  
--  
--   -------------平均每天空床数---------- (实际占用总床日数-实际开放总床日数)/当月天数
--  Update His_Stat.dbo.stat_Hosp_Work  
--  set BedNullAvgCount = (OpenBedCount - OpenBed) /(DATEDIFF(Day,@Begindate,@EndDate)+1)
--  where DateType = @DateType and StatDate = @WorkDate and OfficeID = '99999999' 
--  
--  
-- ---手术信息-------------------------------------------------------------------------- 
-- 
-- 
-- -------------手术人数---------- 
--  Update His_Stat.dbo.stat_Hosp_Work
--  set OperationCount = 
--   (select count(EMR.HospID) 
--      From [His_EMR].[dbo].[V_EMR_PatientBaseInfo] EMR
--   Right join [His_EMR].[dbo].[V_EMR_OperationInfo] Oper
--   on EMR.患者ID = Oper.患者ID and EMR.住院次=Oper.住院次
--   where EMR.出院日期 between @BeginDate and @EndDate) 
--  where DateType = @DateType and StatDate = @WorkDate and OfficeID = '99999999' 
--  
--  -------------手术合计---------- 
--  Update His_Stat.dbo.stat_Hosp_Work
--  set OperationSum = 
--   (select count(Oper.手术代码) 
--     From [His_EMR].[dbo].[V_EMR_PatientBaseInfo] EMR
--   Right join [His_EMR].[dbo].[V_EMR_OperationInfo] Oper
--   on EMR.患者ID = Oper.患者ID and EMR.住院次=Oper.住院次
--   where EMR.出院日期 between @BeginDate and @EndDate)
--    where DateType = @DateType and StatDate = @WorkDate and OfficeID = '99999999'
--   
-- 
--  -------------手术甲类---------- --(1甲良好)  
--  Update His_Stat.dbo.stat_Hosp_Work
--  set OperationA = 
--   (select count(Oper.手术代码)
--     From [His_EMR].[dbo].[V_EMR_PatientBaseInfo] EMR
--   Right join [His_EMR].[dbo].[V_EMR_OperationInfo] Oper
--   on EMR.患者ID = Oper.患者ID and EMR.住院次=Oper.住院次
--   where EMR.出院日期 between @BeginDate and @EndDate
--      and Oper.切口情况 =1 and Oper.愈合情况 = 1)   
--   where DateType = @DateType and StatDate = @WorkDate and OfficeID = '99999999'
--   
--   
--  -------------手术乙类---------- --(2乙欠佳)
--   Update His_Stat.dbo.stat_Hosp_Work
--  set OperationB = 
--   (select count(Oper.手术代码)
--     From [His_EMR].[dbo].[V_EMR_PatientBaseInfo] EMR
--   Right join [His_EMR].[dbo].[V_EMR_OperationInfo] Oper
--   on EMR.患者ID = Oper.患者ID and EMR.住院次=Oper.住院次
--   where EMR.出院日期 between @BeginDate and @EndDate
--      and Oper.切口情况 =1 and Oper.愈合情况 = 2)   
--   where DateType = @DateType and StatDate = @WorkDate  and OfficeID = '99999999'
--   
--   
--  -------------手术丙类---------- --(3丙化脓)
--  Update His_Stat.dbo.stat_Hosp_Work
--  set OperationC = 
--   (select count(Oper.手术代码)
--     From [His_EMR].[dbo].[V_EMR_PatientBaseInfo] EMR
--   Right join [His_EMR].[dbo].[V_EMR_OperationInfo] Oper
--   on EMR.患者ID = Oper.患者ID and EMR.住院次=Oper.住院次
--   where EMR.出院日期 between @BeginDate and @EndDate
--      and Oper.切口情况 =1 and Oper.愈合情况 = 3)     
--   where DateType = @DateType and StatDate = @WorkDate  and OfficeID = '99999999' 
--  
--  
--  -------------手术合计类---------- 
--  Update His_Stat.dbo.stat_Hosp_Work
--  set OperationTotal= Isnull(OperationA,0)+
--                      Isnull(OperationB,0)+
--                      Isnull(OperationC,0)
--   where DateType = @DateType and StatDate = @WorkDate  and OfficeID = '99999999'   
--  
--  
--  -------------手术介入---------- 
--  Update His_Stat.dbo.stat_Hosp_Work
--  set OperationJR= 
--   (select count(Oper.手术代码)
--     From [His_EMR].[dbo].[V_EMR_PatientBaseInfo] EMR
--   Right join [His_EMR].[dbo].[V_EMR_OperationInfo] Oper
--   on EMR.患者ID = Oper.患者ID and EMR.住院次=Oper.住院次
--   where EMR.出院日期 between @BeginDate and @EndDate
--      and Oper.切口情况 =1 and Oper.手术代码 = '00')  --(介入手术编码)
--    where DateType = @DateType and StatDate = @WorkDate  and OfficeID = '99999999'    
--   
--    
--  -------------手术择期---------- 
--  Update His_Stat.dbo.stat_Hosp_Work
--  set OperationZQ= 
--   (select count(Oper.手术代码) as OperCount 
--     From [His_EMR].[dbo].[V_EMR_PatientBaseInfo] EMR
--   Right join [His_EMR].[dbo].[V_EMR_OperationInfo] Oper
--   on EMR.患者ID = Oper.患者ID and EMR.住院次=Oper.住院次
--   where EMR.出院日期 between @BeginDate and @EndDate
--      and Oper.切口情况 =1 and Oper.手术类别 = '择期')   --(择期)
--  where DateType = @DateType and StatDate = @WorkDate  and OfficeID = '99999999' 
--   
-- 
--  -------------手术择期占床数---------- 
--  Update His_Stat.dbo.stat_Hosp_Work
--  set OperationSQZC=
--   (select Sum(DATEDIFF(Day,Emr.入院日期,Oper.手术日期)) as OperSumDay
--     From [His_EMR].[dbo].[V_EMR_PatientBaseInfo] EMR
--   Right join [His_EMR].[dbo].[V_EMR_OperationInfo] Oper
--   on EMR.患者ID = Oper.患者ID and EMR.住院次=Oper.住院次
--   where EMR.出院日期 between @BeginDate and @EndDate
--      and Oper.切口情况 =1 and Oper.手术类别 = '择期')  --(择期)
--   where DateType = @DateType and StatDate = @WorkDate and OfficeID = '99999999'
-- 
-- 
-- -------------院内感染人数---------- 
--  Update His_Stat.dbo.stat_Hosp_Work
--  set HospInfected= 
--   (select Count(EMR.HospID) as InfectedCount
--    from [His_EMR].[dbo].[V_EMR_PatientBaseInfo] EMR
--    inner join [His_EMR].[dbo].[V_EMR_DiagnosInfo] Diag
--    on  EMR.患者ID = Diag.患者ID and EMR.住院次=Diag.住院次
--    where Diag.诊断类别 =4 and Diag.诊断序号 = 1 
--    and EMR.出院日期 between @BeginDate and @EndDate)
--   where DateType = @DateType and StatDate = @WorkDate and OfficeID = '99999999'
-- 
-- 
--  -------------危重病人抢救人次数---------- 
--  Update His_Stat.dbo.stat_Hosp_Work
--  set RescueCount= 
--   (select SUM(EMR.抢救次数) as RescueSum
--     From [His_EMR].[dbo].[V_EMR_PatientBaseInfo] EMR  
--   where EMR.出院日期 between @BeginDate and @EndDate) 
--  where DateType = @DateType and StatDate = @WorkDate and OfficeID = '99999999'
-- 
--  -------------危重病人抢救成功人次数---------- 
--  Update His_Stat.dbo.stat_Hosp_Work
--  set RescueCountOk= 
--   (select SUM(EMR.成功次数) as RescueSum
--     From [His_EMR].[dbo].[V_EMR_PatientBaseInfo] EMR  
--   where EMR.出院日期 between @BeginDate and @EndDate) 
--  where DateType = @DateType and StatDate = @WorkDate and OfficeID = '99999999'
--   
--  -------------入院三日确诊人数---------- 
--  Update His_Stat.dbo.stat_Hosp_Work
--  set InHospDiagnoseYes= 
--   (select count(EMR.HospID) as DiagCount
--     From [His_EMR].[dbo].[V_EMR_PatientBaseInfo] EMR
--   where EMR.出院日期 between @BeginDate and @EndDate
--         and DATEDIFF(Day,EMR.入院日期,EMR.入院后确诊日期)<=3) 
--   where DateType = @DateType and StatDate = @WorkDate and OfficeID = '99999999'
-- 
-- 
--  -------------入院与出院诊断(符合)---------- 
--  Update His_Stat.dbo.stat_Hosp_Work
--  set InOutHospYes= 
--   (select Count(EMR.HospID) as HospCount
--     From [His_EMR].[dbo].[V_EMR_PatientBaseInfo] EMR  
--   where EMR.出院日期 between @BeginDate and @EndDate  
--         and EMR.入出院诊断符合 =1 )  
--   where DateType = @DateType and StatDate = @WorkDate and OfficeID = '99999999'
-- 
--  -------------入院与出院诊断(不符合)---------- 
--  Update His_Stat.dbo.stat_Hosp_Work
--  set InOutHospNo=
--   (select Count(EMR.HospID) as HospCount
--     From [His_EMR].[dbo].[V_EMR_PatientBaseInfo] EMR  
--   where EMR.出院日期 between @BeginDate and @EndDate  
--         and EMR.入出院诊断符合 =2)
--  where DateType = @DateType and StatDate = @WorkDate and OfficeID = '99999999'
-- 
--   
--  -------------入院与出院诊断(不肯定)---------- 
--  Update His_Stat.dbo.stat_Hosp_Work
--  set InOutHospElse= 
--   (select Count(EMR.HospID) as HospCount
--     From [His_EMR].[dbo].[V_EMR_PatientBaseInfo] EMR  
--   where EMR.出院日期 between @BeginDate and @EndDate  
--         and EMR.入出院诊断符合 =3)
--   where DateType = @DateType and StatDate = @WorkDate and OfficeID = '99999999'
--   
-- 
-- 
-- -------------术前术后符合(符合)---------- 
--  Update His_Stat.dbo.stat_Hosp_Work
--  set OperationYes= 
--   (select Count(EMR.HospID) as HospCount
--     From [His_EMR].[dbo].[V_EMR_PatientBaseInfo] EMR  
--   where EMR.出院日期 between @BeginDate and @EndDate  
--         and EMR.术前术后符合 =1 ) 
--  where DateType = @DateType and StatDate = @WorkDate and OfficeID = '99999999'
-- 
--  -------------术前术后符合(不符合)---------- 
--  Update His_Stat.dbo.stat_Hosp_Work
--  set OperationNo= 
--   (select Count(EMR.HospID) as HospCount
--     From [His_EMR].[dbo].[V_EMR_PatientBaseInfo] EMR  
--   where EMR.出院日期 between @BeginDate and @EndDate  
--         and EMR.术前术后符合 =2)   
--  where DateType = @DateType and StatDate = @WorkDate and OfficeID = '99999999'
-- 
--   
--  -------------术前术后符合(不肯定)---------- 
--  Update His_Stat.dbo.stat_Hosp_Work
--  set OperationElse= 
--   (select Count(EMR.HospID) as HospCount
--     From [His_EMR].[dbo].[V_EMR_PatientBaseInfo] EMR  
--   where EMR.出院日期 between @BeginDate and @EndDate  
--         and EMR.术前术后符合 =3)   
--  where DateType = @DateType and StatDate = @WorkDate and OfficeID = '99999999'
-- 
-- -------------临床病理符合(符合)---------- 
--  Update His_Stat.dbo.stat_Hosp_Work
--  set ClinicYes=
--   (select Count(EMR.HospID) as HospCount
--     From [His_EMR].[dbo].[V_EMR_PatientBaseInfo] EMR  
--   where EMR.出院日期 between @BeginDate and @EndDate  
--         and EMR.临床病理符合 =1)   
--   where DateType = @DateType and StatDate = @WorkDate and OfficeID = '99999999'
-- 
--  -------------术前术后符合(不符合)---------- 
--  Update His_Stat.dbo.stat_Hosp_Work
--  set ClinicNo= 
--   (select Count(EMR.HospID) as HospCount
--     From [His_EMR].[dbo].[V_EMR_PatientBaseInfo] EMR  
--   where EMR.出院日期 between @BeginDate and @EndDate  
--         and EMR.临床病理符合 =2)   
--  where DateType = @DateType and StatDate = @WorkDate and OfficeID = '99999999'
-- 
--   
--  -------------术前术后符合(不肯定)---------- 
--  Update His_Stat.dbo.stat_Hosp_Work
--  set ClinicElse= 
--   (select Count(EMR.HospID) as HospCount
--     From [His_EMR].[dbo].[V_EMR_PatientBaseInfo] EMR  
--   where EMR.出院日期 between @BeginDate and @EndDate  
--         and EMR.临床病理符合 =3)   
--   where DateType = @DateType and StatDate = @WorkDate and OfficeID = '99999999'
-- 
--   
      
END
GO


-- ----------------------------
-- Procedure structure for Pro_Stat_Hosp_Fee_Office
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Pro_Stat_Hosp_Fee_Office]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[Pro_Stat_Hosp_Fee_Office]
GO

CREATE PROCEDURE [dbo].[Pro_Stat_Hosp_Fee_Office]
	@StatDate smalldatetime 
AS
begin
	declare @BeginDate smalldatetime, @EndDate smalldatetime

	set @StatDate = isnull(@StatDate, getdate() - 1)
	
	set @BeginDate = dbo.Fun_DateFromParts(DATEPART(year, @StatDate), DATEPART(month, @StatDate), 1)
	set @EndDate = dbo.Fun_DateFromParts(DATEPART(year, @StatDate), DATEPART(month, @StatDate) + 1, 1)

	delete Stat_Hosp_Fee_Office
	where StatDate = convert(varchar(6), @StatDate, 112)
	
	insert into Stat_Hosp_Fee_Office (StatDate, OfficeID, StatTypeID, SumPrice)
	select convert(varchar(6), @StatDate, 112), HospOfficeID, StatTypeID, SUM(b.SumPrice)
	from His_Hosp.dbo.Hosp_FeeMaster  a inner join His_Hosp.dbo.Hosp_FeeDetail  b 
		on a.HospID = b.HospID and a.HospFeeID = b.HospFeeID
	where a.FeeTime >= @BeginDate and a.FeeTime < @EndDate and a.FeeSign <> 3 --未挂账
	group by HospOfficeID, StatTypeID


end
GO


-- ----------------------------
-- Function structure for Fun_DateFromParts
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Fun_DateFromParts]') AND type IN ('FN', 'FS', 'FT', 'IF', 'TF'))
	DROP FUNCTION[dbo].[Fun_DateFromParts]
GO

CREATE FUNCTION [dbo].[Fun_DateFromParts]
(
    @Year INT,
    @Month INT,
    @DayOfMonth INT
)
RETURNS DATETIME
AS
BEGIN

    RETURN DATEADD(day, @DayOfMonth - 1, 
            DATEADD(month, @Month - 1, 
            DATEADD(Year, @Year-1900, 0)))

END
GO


-- ----------------------------
-- Procedure structure for Pro_Stat_Hosp_Fee_ExecOffice
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Pro_Stat_Hosp_Fee_ExecOffice]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[Pro_Stat_Hosp_Fee_ExecOffice]
GO

CREATE PROCEDURE [dbo].[Pro_Stat_Hosp_Fee_ExecOffice]
	@StatDate smalldatetime 
AS
begin
	declare @BeginDate smalldatetime, @EndDate smalldatetime

	set @StatDate = isnull(@StatDate, getdate() - 1)
	
	set @BeginDate = dbo.Fun_DateFromParts(DATEPART(year, @StatDate), DATEPART(month, @StatDate), 1)
	set @EndDate = dbo.Fun_DateFromParts(DATEPART(year, @StatDate), DATEPART(month, @StatDate) + 1, 1)

	delete Stat_Hosp_Fee_ExecOffice
	where StatDate = convert(varchar(6), @StatDate, 112)

	insert into Stat_Hosp_Fee_ExecOffice (StatDate, ExecOfficeID, StatTypeID, SumPrice)
	select convert(varchar(6), @StatDate, 112), ExecOfficeID, StatTypeID, SUM(b.SumPrice)
	from His_Hosp.dbo.Hosp_FeeMaster  a inner join His_Hosp.dbo.Hosp_FeeDetail  b 
		on a.HospID = b.HospID and a.HospFeeID = b.HospFeeID
	where a.FeeTime >= @BeginDate and a.FeeTime < @EndDate and a.FeeSign <> 3 --未挂账
	group by ExecOfficeID, StatTypeID


end
GO


-- ----------------------------
-- Procedure structure for Pro_Stat_Hosp_Fee_Office_ExecOffice
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Pro_Stat_Hosp_Fee_Office_ExecOffice]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[Pro_Stat_Hosp_Fee_Office_ExecOffice]
GO

CREATE PROCEDURE [dbo].[Pro_Stat_Hosp_Fee_Office_ExecOffice]
	@StatDate smalldatetime 
AS
begin
	declare @BeginDate smalldatetime, @EndDate smalldatetime

	set @StatDate = isnull(@StatDate, getdate() - 1)
	set @BeginDate = dbo.Fun_DateFromParts(DATEPART(year, @StatDate), DATEPART(month, @StatDate), 1)
	set @EndDate = dbo.Fun_DateFromParts(DATEPART(year, @StatDate), DATEPART(month, @StatDate) + 1, 1)

	delete Stat_Hosp_Fee_Office_ExecOffice
	where StatDate = convert(varchar(6), @StatDate, 112)

	insert into Stat_Hosp_Fee_Office_ExecOffice (StatDate, OfficeID, ExecOfficeID, 
		StatTypeID, HospID, PatientName, SumPrice)
	select convert(varchar(6), @StatDate, 112), b.HospOfficeID, b.ExecOfficeID, 
		b.StatTypeID, a.HospID, a.PatientName, SUM(b.SumPrice)
	from His_Hosp.dbo.Hosp_FeeMaster  a inner join His_Hosp.dbo.Hosp_FeeDetail  b 
		on a.HospID = b.HospID and a.HospFeeID = b.HospFeeID
	where a.FeeTime >= @BeginDate and a.FeeTime < @EndDate and a.FeeSign <> 3 --未挂账
	group by b.HospOfficeID, b.ExecOfficeID, b.StatTypeID, a.HospID, a.PatientName

end
GO


-- ----------------------------
-- Primary Key structure for table Stat_Clin_Doctor_Recipe
-- ----------------------------
ALTER TABLE [dbo].[Stat_Clin_Doctor_Recipe] ADD CONSTRAINT [PK_STAT_CLIN_DOCTOR_RECIPE] PRIMARY KEY CLUSTERED ([StatDate], [OfficeID], [DoctorID], [ExecOfficeID])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table Stat_Clin_Doctor_Reg
-- ----------------------------
ALTER TABLE [dbo].[Stat_Clin_Doctor_Reg] ADD CONSTRAINT [PK_STAT_CLIN_DOCTOR_REG] PRIMARY KEY CLUSTERED ([StatDate], [DoctorID], [RegTypeID])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table Stat_Clin_Doctor_Stat
-- ----------------------------
ALTER TABLE [dbo].[Stat_Clin_Doctor_Stat] ADD CONSTRAINT [PK_STAT_CLIN_DOCTOR_STAT] PRIMARY KEY CLUSTERED ([StatDate], [DoctorID], [StatTypeID])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table Stat_Clin_Doctor_Work
-- ----------------------------
ALTER TABLE [dbo].[Stat_Clin_Doctor_Work] ADD CONSTRAINT [PK_Stat_Clin_Doctor_Work] PRIMARY KEY CLUSTERED ([StatDate], [OfficeID], [DoctorID])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table Stat_Clin_Fee_ClinOffice
-- ----------------------------
ALTER TABLE [dbo].[Stat_Clin_Fee_ClinOffice] ADD CONSTRAINT [PK_STAT_CLIN_FEE_CLINOFFICE] PRIMARY KEY CLUSTERED ([StatDate], [OfficeID], [StatTypeID])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table Stat_Clin_Fee_ExecOffice
-- ----------------------------
ALTER TABLE [dbo].[Stat_Clin_Fee_ExecOffice] ADD CONSTRAINT [PK_STAT_CLIN_FEE_EXECOFFICE] PRIMARY KEY CLUSTERED ([StatDate], [ExecOfficeID], [StatTypeID])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table Stat_Clin_Fee_FeeType
-- ----------------------------
ALTER TABLE [dbo].[Stat_Clin_Fee_FeeType] ADD CONSTRAINT [PK_STAT_CLIN_FEE_FEETYPE] PRIMARY KEY CLUSTERED ([StatDate], [FeeTypeID])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table Stat_Clin_Fee_RecExecOffice
-- ----------------------------
ALTER TABLE [dbo].[Stat_Clin_Fee_RecExecOffice] ADD CONSTRAINT [PK_STAT_CLIN_FEE_RECEXECOFFICE] PRIMARY KEY CLUSTERED ([StatDate], [RecOfficeID], [ExecOfficeID])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table Stat_Clin_Reg
-- ----------------------------
ALTER TABLE [dbo].[Stat_Clin_Reg] ADD CONSTRAINT [PK_STAT_CLIN_REG] PRIMARY KEY CLUSTERED ([StatDate], [OfficeID], [RegTypeID])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table Stat_Hosp_Doctor_Apply
-- ----------------------------
ALTER TABLE [dbo].[Stat_Hosp_Doctor_Apply] ADD CONSTRAINT [PK_STAT_Hosp_Doctor_Apply] PRIMARY KEY CLUSTERED ([StatDate], [OfficeID], [DoctorID], [ExecOfficeID])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table Stat_Hosp_Fee_ExecOffice
-- ----------------------------
ALTER TABLE [dbo].[Stat_Hosp_Fee_ExecOffice] ADD CONSTRAINT [PK_STAT_Hosp_FEE_ExecOFFICE] PRIMARY KEY CLUSTERED ([StatDate], [ExecOfficeID], [StatTypeID])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table Stat_Hosp_Fee_ExecOffice_Patient
-- ----------------------------
ALTER TABLE [dbo].[Stat_Hosp_Fee_ExecOffice_Patient] ADD CONSTRAINT [PK_STAT_Hosp_FEE_ExecOffice_Patient] PRIMARY KEY CLUSTERED ([StatDate], [ExecOfficeID], [HospID], [StatTypeID])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table Stat_Hosp_Fee_Office
-- ----------------------------
ALTER TABLE [dbo].[Stat_Hosp_Fee_Office] ADD CONSTRAINT [PK_STAT_Hosp_FEE_OFFICE] PRIMARY KEY CLUSTERED ([StatDate], [OfficeID], [StatTypeID])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Indexes structure for table Stat_Hosp_Fee_Office_ExecOffice
-- ----------------------------
CREATE NONCLUSTERED INDEX [Ind_Stat_Hosp_Fee_Office_ExecOffice]
ON [dbo].[Stat_Hosp_Fee_Office_ExecOffice] (
  [StatDate] ASC
)
GO


-- ----------------------------
-- Primary Key structure for table Stat_Hosp_Fee_Office_Patient
-- ----------------------------
ALTER TABLE [dbo].[Stat_Hosp_Fee_Office_Patient] ADD CONSTRAINT [PK_STAT_Hosp_FEE_Office_Patient] PRIMARY KEY CLUSTERED ([StatDate], [OfficeID], [HospID], [StatTypeID])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table Stat_Hosp_FeeType
-- ----------------------------
ALTER TABLE [dbo].[Stat_Hosp_FeeType] ADD CONSTRAINT [PK_Stat_Hosp_FeeType] PRIMARY KEY CLUSTERED ([StatDate], [FeeTypeID])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Indexes structure for table Stat_Hosp_Work
-- ----------------------------
CREATE NONCLUSTERED INDEX [Ind_Stat_Hosp_Work_StatDate]
ON [dbo].[Stat_Hosp_Work] (
  [StID] ASC
)
GO


-- ----------------------------
-- Primary Key structure for table Stat_Hosp_Work
-- ----------------------------
ALTER TABLE [dbo].[Stat_Hosp_Work] ADD CONSTRAINT [PK_STAT_HOSP_WORK] PRIMARY KEY CLUSTERED ([StID])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Indexes structure for table Stat_Hosp_Work_Day
-- ----------------------------
CREATE NONCLUSTERED INDEX [Ind_Stat_Hosp_Work_Day_StatDate]
ON [dbo].[Stat_Hosp_Work_Day] (
  [StatDate] ASC
)
GO


-- ----------------------------
-- Primary Key structure for table Stat_Hosp_Work_Day
-- ----------------------------
ALTER TABLE [dbo].[Stat_Hosp_Work_Day] ADD CONSTRAINT [PK_STAT_HOSP_WORK_Day] PRIMARY KEY CLUSTERED ([StID])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO

