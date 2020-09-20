object RemoteServer: TRemoteServer
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 372
  Width = 561
  object BinMessage: TROBinMessage
    OnServerException = BinMessageServerException
    OnWriteException = BinMessageWriteException
    Envelopes = <>
    Left = 32
    Top = 88
  end
  object DriverManager: TDADriverManager
    DriverDirectory = '%SYSTEM%\'
    TraceActive = False
    TraceFlags = []
    Left = 32
    Top = 154
  end
  object SessionManager: TROInMemorySessionManager
    SessionDuration = 45
    Left = 120
    Top = 152
  end
  object ADODriver: TDAADODriver
    Left = 32
    Top = 218
  end
  object EventRepository: TROInMemoryEventRepository
    Message = BinMessage
    SessionManager = SessionManager
    Left = 216
    Top = 152
  end
  object ConnectionManager: TDAConnectionManager
    MaxPoolSize = 50
    WaitIntervalSeconds = 5
    Connections = <
      item
        Name = 'ShortMessage'
        ConnectionString = 
          'ADO?AuxDriver=SQLOLEDB.1;Server=10.2.120.37;UserID=sa;Password=h' +
          'isserver;Integrated Security=SSPI;'
        ConnectionType = 'MSSQL'
      end
      item
        Name = 'SystemDB'
        ConnectionString = 
          'ADO?AuxDriver=SQLOLEDB.1;Server=10.2.120.37;Database=ChzyyHis;Us' +
          'erID=sa;Password=hisserver;Integrated Security=SSPI;'
        ConnectionType = 'MSSQL'
        Default = True
      end>
    DriverManager = DriverManager
    PoolingEnabled = True
    PoolTransactionBehaviour = ptRollback
    Left = 120
    Top = 218
  end
  object SuperServer: TROSuperTCPServer
    Dispatchers = <
      item
        Name = 'BinMessage'
        Message = BinMessage
        Enabled = True
      end>
    Port = 8020
    EventRepository = EventRepository
    DefaultResponse = 'ROSC:Invalid connection string'
    Left = 216
    Top = 16
  end
  object ServerSchema: TDASchema
    Datasets = <>
    JoinDataTables = <>
    UnionDataTables = <>
    Commands = <>
    RelationShips = <>
    UpdateRules = <>
    Version = 0
    ConnectionManager = ConnectionManager
    Left = 215
    Top = 218
  end
  object HTTPServer: TROIndyHTTPServer
    Dispatchers = <
      item
        Name = 'BinMessage'
        Message = BinMessage
        Enabled = True
        PathInfo = 'Bin'
      end
      item
        Name = 'XmlRpcMessage'
        Message = XmlRpcMessage
        Enabled = True
        PathInfo = 'XmlRpc'
      end
      item
        Name = 'JSONMessage'
        Message = JSONMessage
        Enabled = True
        PathInfo = 'JSON'
      end
      item
        Name = 'SOAPMessage'
        Message = SOAPMessage
        Enabled = True
        PathInfo = 'SOAP'
      end>
    SendClientAccessPolicyXml = captAllowAll
    SendCrossOriginHeader = True
    IndyServer.Bindings = <>
    IndyServer.DefaultPort = 8018
    Port = 8018
    Left = 32
    Top = 16
  end
  object XmlRpcMessage: TROXmlRpcMessage
    OnServerException = BinMessageServerException
    OnWriteException = BinMessageWriteException
    Envelopes = <>
    SendSessionId = True
    Left = 120
    Top = 88
  end
  object JSONMessage: TROJSONMessage
    OnServerException = BinMessageServerException
    OnWriteException = BinMessageWriteException
    Envelopes = <>
    SessionIdAsId = True
    WrapResult = True
    SendExtendedException = True
    ExtendedExceptionClass = 'ROJSONException'
    IncludeTypeName = True
    Left = 216
    Top = 88
  end
  object TCPServer: TROIndyTCPServer
    Dispatchers = <
      item
        Name = 'BinMessage'
        Message = BinMessage
        Enabled = True
      end>
    IndyServer.Bindings = <>
    IndyServer.DefaultPort = 8019
    Port = 8019
    Left = 120
    Top = 16
  end
  object SOAPMessage: TROSOAPMessage
    Envelopes = <>
    SerializationOptions = [xsoSendUntyped, xsoStrictStructureFieldOrder, xsoDocument, xsoSplitServiceWsdls]
    Left = 320
    Top = 88
  end
  object WinServer: TROWinMessageServer
    Dispatchers = <
      item
        Name = 'BinMessage'
        Message = BinMessage
        Enabled = True
      end>
    ServerID = 'WinServerID'
    ActiveEventRepository = EventRepository
    Left = 320
    Top = 16
  end
  object MainSchema: TDASchema
    Datasets = <>
    JoinDataTables = <>
    UnionDataTables = <>
    Commands = <>
    RelationShips = <>
    UpdateRules = <>
    Version = 0
    ConnectionManager = ConnectionManager
    Left = 319
    Top = 218
  end
  object ROLocalServer: TROLocalServer
    Dispatchers = <
      item
        Name = 'BinMessage'
        Message = BinMessage
        Enabled = True
      end>
    Left = 408
    Top = 16
  end
end
