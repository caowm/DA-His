object HisService_Extend: THisService_Extend
  OldCreateOrder = True
  OnCreate = DataAbstractServiceCreate
  SessionManager = RemoteServer.SessionManager
  EventRepository = RemoteServer.EventRepository
  OnActivate = DataAbstractServiceActivate
  OnDeactivate = DataAbstractServiceDeactivate
  ConnectionName = 'His_Ex'
  AllowExecuteCommands = True
  ExportedDataTables = <>
  OnUpdateDataBeginTransaction = DataAbstractServiceUpdateDataBeginTransaction
  AllowWhereSQL = True
  Height = 300
  Width = 300
end
