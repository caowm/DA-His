object HisService_System: THisService_System
  OldCreateOrder = True
  OnCreate = DataAbstractServiceCreate
  RequiresSession = True
  SessionManager = RemoteServer.SessionManager
  EventRepository = RemoteServer.EventRepository
  OnActivate = DataAbstractServiceActivate
  OnDeactivate = DataAbstractServiceDeactivate
  ConnectionName = 'His_Sys'
  AllowExecuteCommands = True
  ExportedDataTables = <>
  ReturnUpdateFailureDelta = False
  OnUpdateDataBeginTransaction = DataAbstractServiceUpdateDataBeginTransaction
  AllowWhereSQL = True
  Height = 300
  Width = 392
end
