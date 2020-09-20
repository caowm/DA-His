# DA-His
使用Delphi 10开发的Hopspital information management，基于RemObjects DataAbstract，以Schema为中心，支持Internet标准。

## 技术选型
1. Delphi 10
2. Sql server 2008
3. Remobjects DataAbstract 9
4. DevExpress 18.1
5. FastReport 6.2
6. PaxCompiler 4.2
7. Advanced-Data Export/Import
8. SynEdit
9. Graphics32

## 功能特点
1. 提供数据集成服务(IDEA)，类似Relativity Server，创建Schema后配置到idea.xml即可生成新数据服务，不需要修改后台代码。
2. 以Schema为中心，前台所需配置都写在CustomAttributes里面，包括表格创建、窗体创建、控件属性、打印等等，很多时候只需要修改Schema即可完成界面的修改。
3. 集成PaxCompile脚本扩展功能。脚本、窗体、函数都可以定义为一个功能点，相互之间通过Execute过程实现互动。
4. 后台业务逻辑都写在SQLServer存储过程，在Schema里面配置CRUD绑定的存储过程。
5. FastReport在后台生成报表传给前台，后台更新打印模板，前台即完成打印更新。
6. 面向服务、多层架构、接口标准，这些都是因为Remobjects。
7. base/auto update/提供软件升级功能。
8. 系统各部分都有设计，松散耦合，不堆积重复代码。

## 安装步骤
1. 创建SqlServer2008数据库：脚本在db目录中
2. 修改数据库连接配置：his/release/his服务器/bin/Connection.daConnections
3. 启动服务器：his/release/his服务器/bin/DAHisServer.exe
4. 启动客户端: his/release/his客户端/bin/DAHisClient.exe，用户名: 8888，密码: 123123

DAHis开放全部源码供Delphi开发者学习用，后面逐步完善使用文档，商用的话还请购买商业组件。

作者：caowm (remobjects@qq.com)


