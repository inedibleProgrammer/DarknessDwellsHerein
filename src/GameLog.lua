local GameLog = {}

function GameLog.ReturnsTrue()
  return true
end


function GameLog.Init(logger, triggerWrapper, commands)
  GameLog.logger = logger
  GameLog.triggerWrapper = triggerWrapper
  GameLog.commands = commands

  GameLog.logCommand = {}
  GameLog.logCommand.text = "log"
  GameLog.logCommand.handler = function()
    print("GameLog Handler")
  end
  GameLog.commands.Add(GameLog.triggerWrapper.logCommand)
end
