

local GameLoop = {}

function GameLoop.ReturnsTrue()
  return true
end

function GameLoop.Init(triggerWrapper)
  print("GameLoop Init Start")
  GameLoop.triggerWrapper = triggerWrapper
  GameLoop.triggerWrapper.CreateTrigger()
  print("GameLoop Init End")
end


