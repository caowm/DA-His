object ServerDataModule: TServerDataModule
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 362
  Top = 208
  Height = 207
  Width = 352
  object Server: TROIndyHTTPServer
    Dispatchers = <
      item
        Name = 'Message'
        Message = Message
        Enabled = True
        PathInfo = 'Bin'
      end>
    IndyServer.Bindings = <>
    IndyServer.CommandHandlers = <>
    IndyServer.DefaultPort = 8099
    IndyServer.Greeting.NumericCode = 0
    IndyServer.MaxConnectionReply.NumericCode = 0
    IndyServer.ReplyExceptionCode = 0
    IndyServer.ReplyTexts = <>
    IndyServer.ReplyUnknownCommand.NumericCode = 0
    Port = 8099
    Left = 32
    Top = 8
  end
  object Message: TROBinMessage
    Envelopes = <>
    Left = 32
    Top = 56
  end
  object ConnectionManager: TDAConnectionManager
    Connections = <>
    DriverManager = DriverManager
    PoolingEnabled = True
    Left = 136
    Top = 56
  end
  object DriverManager: TDADriverManager
    DriverDirectory = '%SYSTEM%\'
    TraceActive = False
    TraceFlags = []
    Left = 136
    Top = 10
  end
  object ADODriver: TDAADODriver
    Left = 256
    Top = 8
  end
  object DataDictionary: TDADataDictionary
    Fields = <>
    Left = 32
    Top = 104
  end
  object SessionManager: TROInMemorySessionManager
    Left = 136
    Top = 104
  end
end
