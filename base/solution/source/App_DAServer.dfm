object RemoteServer: TRemoteServer
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 372
  Width = 617
  object BinMessage: TROBinMessage
    OnServerException = BinMessageServerException
    OnWriteException = BinMessageWriteException
    Envelopes = <>
    Left = 32
    Top = 80
  end
  object DriverManager: TDADriverManager
    DriverDirectory = '%SYSTEM%\'
    TraceActive = False
    TraceFlags = []
    Left = 32
    Top = 154
  end
  object SessionManager: TROInMemorySessionManager
    SessionDuration = 240
    SessionCheckInterval = 200
    Left = 120
    Top = 152
  end
  object ADODriver: TDAADODriver
    Left = 112
    Top = 226
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
    Connections = <>
    DriverManager = DriverManager
    PoolingEnabled = False
    PoolTransactionBehaviour = ptRollback
    Left = 312
    Top = 154
  end
  object SuperServer: TROSuperTCPServer
    Dispatchers = <
      item
        Name = 'BinMessage'
        Message = BinMessage
        Enabled = True
      end>
    ServeRodl = False
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
    Left = 407
    Top = 154
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
    Left = 216
    Top = 80
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
    Left = 120
    Top = 80
  end
  object TCPServer: TROIndyTCPServer
    Dispatchers = <
      item
        Name = 'BinMessage'
        Message = BinMessage
        Enabled = True
      end>
    ServeRodl = False
    IndyServer.Bindings = <>
    IndyServer.DefaultPort = 8019
    Port = 8019
    Left = 120
    Top = 16
  end
  object SOAPMessage: TROSOAPMessage
    Envelopes = <>
    SerializationOptions = [xsoSendUntyped, xsoStrictStructureFieldOrder, xsoDocument, xsoSplitServiceWsdls]
    Left = 312
    Top = 80
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
    Left = 312
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
    Left = 503
    Top = 154
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
  object UniDACDriver: TDAUniDACDriver
    Left = 32
    Top = 224
  end
  object FireDACDriver: TDAFireDACDriver
    Left = 208
    Top = 224
  end
  object JsHttpDispatcher: TDAJavaScriptHttpDispatcher
    Server = HTTPServer
    Path = '/js/'
    Folder = '.\html'
    DefaultFile = 'index.html'
    Left = 408
    Top = 80
  end
end
