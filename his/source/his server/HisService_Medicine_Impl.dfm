object HisService_Medicine: THisService_Medicine
  OldCreateOrder = True
  OnCreate = DataAbstractServiceCreate
  RequiresSession = True
  SessionManager = RemoteServer.SessionManager
  EventRepository = RemoteServer.EventRepository
  OnActivate = DataAbstractServiceActivate
  OnDeactivate = DataAbstractServiceDeactivate
  ConnectionName = 'His_Data'
  AllowExecuteCommands = True
  ExportedDataTables = <>
  ReturnUpdateFailureDelta = False
  OnUpdateDataBeginTransaction = DataAbstractServiceUpdateDataBeginTransaction
  AllowWhereSQL = True
  Height = 300
  Width = 560
end
