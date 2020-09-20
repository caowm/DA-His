object HisService_Report: THisService_Report
  OldCreateOrder = True
  RequiresSession = True
  SessionManager = RemoteServer.SessionManager
  EventRepository = RemoteServer.EventRepository
  Height = 300
  Width = 300
  object Reporter: TfrxReport
    Version = '6.2.11'
    DotMatrixReport = False
    EngineOptions.NewSilentMode = simReThrow
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbNoEmail]
    PreviewOptions.OutlineVisible = True
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 39265.463354872700000000
    ReportOptions.LastChange = 41311.676226018520000000
    ScriptLanguage = 'PascalScript'
    ShowProgress = False
    StoreInDFM = False
    Left = 29
    Top = 31
  end
end
