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

  for _,v in pairs(command.users) do
    Commands.triggerWrapper.TriggerRegisterPlayerChatEvent(command.trigger, v, command.activator, Commands.triggerWrapper.NO_EXACT_MATCH)
  end

  table.insert(Commands.list, command)
  Commands.logger.Log("Command added: " .. command.activator)
end



