local Commands = {}



function Commands.Init(logger, triggerWrapper, playerWrapper)
  Commands.logger = logger
  Commands.triggerWrapper = triggerWrapper
  Commands.playerWrapper = playerWrapper
  Commands.list = {}
end

function Commands.Add(command)
  table.insert(Commands.list, command)
  Commands.logger.Log("Command added")
end



