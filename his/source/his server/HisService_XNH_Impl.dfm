object HisService_XNH: THisService_XNH
  OldCreateOrder = True
  OnCreate = DataAbstractServiceCreate
  RequiresSession = True
  SessionManager = RemoteServer.SessionManager
  EventRepository = RemoteServer.EventRepository
  OnActivate = DataAbstractServiceActivate
  OnDeactivate = DataAbstractServiceDeactivate
  ConnectionName = 'His_XNH'
  AllowExecuteCommands = True
  ExportedDataTables = <>
  ReturnUpdateFailureDelta = False
  OnUpdateDataBeginTransaction = DataAbstractServiceUpdateDataBeginTransaction
  AllowWhereSQL = True
  Height = 300
  Width = 300
end
