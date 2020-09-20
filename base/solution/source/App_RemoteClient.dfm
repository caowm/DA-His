object ROClient: TROClient
  OldCreateOrder = False
  Left = 419
  Top = 433
  Height = 315
  Width = 607
  object BinMessage: TROBinMessage
    Envelopes = <>
    Left = 138
    Top = 25
  end
  object RemoteService: TRORemoteService
    ServiceName = 'SystemService'
    Channel = SuperChannel
    Message = BinMessage
    Left = 227
    Top = 25
  end
  object DataStreamer: TDABin2DataStreamer
    Left = 48
    Top = 81
  end
  object DataAdapter: TDARemoteDataAdapter
    FailureBehavior = fbRaiseException
    GetSchemaCall.OnBeforeExecute = DataAdapterGetSchemaCallBeforeExecute
    GetSchemaCall.RemoteService = RemoteService
    GetDataCall.RemoteService = RemoteService
    UpdateDataCall.OnBeforeExecute = DataAdapterUpdateDataCallBeforeExecute
    UpdateDataCall.OnAfterExecute = DataAdapterUpdateDataCallAfterExecute
    UpdateDataCall.OnExecuteError = DataAdapterUpdateDataCallExecuteError
    UpdateDataCall.RemoteService = RemoteService
    GetScriptsCall.RemoteService = RemoteService
    RemoteService = RemoteService
    DataStreamer = DataStreamer
    BeforeGetDataCall = DataAdapterBeforeGetDataCall
    AfterGetDataCall = DataAdapterAfterGetDataCall
    Left = 137
    Top = 81
  end
  object TestTable: TDAMemDataTable
    RemoteUpdatesOptions = []
    Fields = <
      item
        Name = '_CustomAttributes'
        DataType = datInteger
        LogChanges = False
        Visible = False
        CustomAttributes.Strings = (
          'DefaultViewType=dvTree'
          'ParentField=FParentID')
      end
      item
        Name = 'FOfficeName'
        DataType = datString
        Size = 32
        DisplayWidth = 22
        DisplayLabel = #31185#23460#21517#31216
      end
      item
        Name = 'FOfficeID'
        DataType = datAutoInc
        DisplayLabel = #31185#23460'ID'
        InPrimaryKey = True
      end
      item
        Name = 'FParentID'
        DataType = datInteger
        DisplayLabel = #29238'ID'
      end
      item
        Name = 'FPinYin'
        DataType = datString
        Size = 16
        DisplayLabel = #25340#38899#30721
      end
      item
        Name = 'Item6'
        DataType = datInteger
        LogChanges = False
        ServerAutoRefresh = True
      end>
    Params = <>
    StreamingOptions = [soDisableEventsWhileStreaming]
    RemoteDataAdapter = DataAdapter
    LogicalName = 'TSys_Office'
    IndexDefs = <
      item
        Name = 'DatasetIndex1'
      end>
    Left = 226
    Top = 81
  end
  object TestSource: TDADataSource
    DataSet = TestTable.Dataset
    DataTable = TestTable
    Left = 315
    Top = 81
  end
  object EventReceiver: TROEventReceiver
    Interval = 8000
    Message = BinMessage
    Channel = SuperChannel
    Left = 316
    Top = 25
  end
  object DARemoteCommand: TDARemoteCommand
    RemoteService = RemoteService
    ExecuteCall = DARemoteCommand.RemoteCommandRequest
    Left = 312
    Top = 136
  end
  object DADesigntimeCall: TDADesigntimeCall
    RemoteService = LoginService
    MethodName = 'Login'
    Params = <
      item
        Name = 'Result'
        DataType = rtString
        Flag = fResult
        Value = 
          'OK'#13#10'WorkerID=1'#13#10'WorkerName='#26361#20255#27665#13#10'WorkerNum=11'#13#10'OfficeID=20'#13#10'RoleI' +
          'D=1'#13#10'LoginTime=2013/2/2 22:25:23'#13#10'ClientAddress=127.0.0.1'#13#10'Offic' +
          'eName='#20449#24687#31185#13#10'RoleName='#31995#32479#31649#29702#21592#13#10'Accesses=01,02'#13#10
      end
      item
        Name = 'aLoginString'
        DataType = rtString
        Flag = fIn
        Value = 'user=11'#13#10'password='
      end>
    Left = 48
    Top = 136
  end
  object LoginService: TRORemoteService
    ServiceName = 'LoginService'
    Channel = SuperChannel
    Message = BinMessage
    Left = 136
    Top = 136
  end
  object DATestCall: TDADesigntimeCall
    RemoteService = RemoteService
    MethodName = 'GetTableSchema'
    Params = <
      item
        Name = 'Result'
        DataType = rtUTF8String
        Flag = fResult
      end
      item
        Name = 'aTableNameArray'
        DataType = rtUserDefined
        Flag = fIn
        TypeName = 'StringArray'
        Value = Null
      end>
    Left = 224
    Top = 136
  end
  object SuperChannel: TROSuperTCPChannel
    DispatchOptions = []
    ServerLocators = <>
    TargetUrl = 'supertcp://localhost:8095'
    Host = 'localhost'
    Left = 408
    Top = 24
  end
  object HttpChannel: TROIndyHTTPChannel
    UserAgent = 'RemObjects SDK'
    DispatchOptions = []
    ServerLocators = <>
    TargetURL = 'http://127.0.0.1:8099/bin'
    IndyClient.MaxLineAction = maException
    IndyClient.Host = '127.0.0.1'
    IndyClient.Port = 8099
    IndyClient.AllowCookies = True
    IndyClient.ProxyParams.BasicAuthentication = False
    IndyClient.ProxyParams.ProxyPort = 0
    IndyClient.Request.ContentLength = -1
    IndyClient.Request.ContentRangeEnd = 0
    IndyClient.Request.ContentRangeStart = 0
    IndyClient.Request.Accept = 'text/html, */*'
    IndyClient.Request.BasicAuthentication = False
    IndyClient.Request.UserAgent = 'RemObjects SDK'
    IndyClient.HTTPOptions = [hoForceEncodeParams]
    Timeout = 0
    Left = 48
    Top = 24
  end
end
