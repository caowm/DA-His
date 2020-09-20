object LocalServer: TLocalServer
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 550
  Top = 293
  Height = 234
  Width = 407
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
    Left = 128
    Top = 18
  end
  object ADODriver: TDAADODriver
    Left = 128
    Top = 90
  end
  object ConnectionManager: TDAConnectionManager
    MaxPoolSize = 50
    WaitIntervalSeconds = 5
    Connections = <>
    DriverManager = DriverManager
    PoolingEnabled = True
    PoolTransactionBehaviour = ptRollback
    Left = 224
    Top = 18
  end
  object MainSchema: TDASchema
    ConnectionManager = ConnectionManager
    Datasets = <>
    JoinDataTables = <>
    UnionDataTables = <>
    Commands = <>
    RelationShips = <>
    UpdateRules = <>
    Version = 0
    BusinessRulesServer.ScriptLanguageStr = 'JavaScript'
    Left = 231
    Top = 90
  end
  object ROLocalServer: TROLocalServer
    Dispatchers = <
      item
        Name = 'BinMessage'
        Message = BinMessage
        Enabled = True
      end>
    Left = 32
    Top = 16
  end
end
