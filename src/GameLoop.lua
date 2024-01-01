

local GameLoop = {}

function GameLoop.ReturnsTrue()
  return true
end

function GameLoop.Init(logger, triggerWrapper)
  GameLoop.logger = logger
  GameLoop.logger.Log("GameLoop Init Start")
  GameLoop.triggerWrapper = triggerWrapper
  GameLoop.loopTrigger = GameLoop.triggerWrapper.CreateTrigger()
  GameLoop.logger.Log("GameLoop Init End")
end


