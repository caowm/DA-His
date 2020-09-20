object HisService_Hosp: THisService_Hosp
  OldCreateOrder = True
  RequiresSession = True
  SessionManager = RemoteServer.SessionManager
  EventRepository = RemoteServer.EventRepository
  OnActivate = DataAbstractServiceActivate
  OnDeactivate = DataAbstractServiceDeactivate
  ConnectionName = 'His_Hosp'
  AllowExecuteCommands = True
  ExportedDataTables = <>
  ReturnUpdateFailureDelta = False
  OnUpdateDataBeginTransaction = DataAbstractServiceUpdateDataBeginTransaction
  AllowWhereSQL = True
  Height = 300
  Width = 300
end
