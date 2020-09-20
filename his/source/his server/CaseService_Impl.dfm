object CaseService: TCaseService
  OldCreateOrder = True
  OnCreate = DataAbstractServiceCreate
  RequiresSession = True
  SessionManager = RemoteServer.SessionManager
  OnActivate = DataAbstractServiceActivate
  OnDeactivate = DataAbstractServiceDeactivate
  ServiceDataStreamer = BinStreamer
  ExportedDataTables = <>
  Left = 273
  Top = 298
  Height = 300
  Width = 300
  object BinStreamer: TDABin2DataStreamer
    Left = 40
    Top = 24
  end
end
