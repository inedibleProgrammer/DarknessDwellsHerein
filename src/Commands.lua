local Commands = {}



function Commands.Init(logger, triggerWrapper, playerWrapper, stringUtil)
  Commands.logger = logger
  Commands.triggerWrapper = triggerWrapper
  Commands.playerWrapper = playerWrapper
  Commands.stringUtil = stringUtil
  Commands.list = {}
end

function Commands.Add(command)
  command.trigger = Commands.triggerWrapper.CreateTrigger()
  Commands.triggerWrapper.TriggerAddAction(command.trigger, command.handler)

  
  
  table.insert(Commands.list, command)
  Commands.logger.Log("Command added: " .. command.activator)
end



