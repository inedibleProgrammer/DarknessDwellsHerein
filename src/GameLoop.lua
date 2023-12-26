

local GameLoop = {}

function GameLoop.ReturnsTrue()
  return true
end

function GameLoop.Init(logger, triggerWrapper)
  -- print("GameLoop Init Start")
  GameLoop.logger = logger
  GameLoop.logger.Log("GameLoop Init Start")
  GameLoop.triggerWrapper = triggerWrapper
  GameLoop.triggerWrapper.CreateTrigger()
  -- print("GameLoop Init End")
  GameLoop.logger.Log("GameLoop Init End")
end


