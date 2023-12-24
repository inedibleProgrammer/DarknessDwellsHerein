

local GameLoop = {}

function GameLoop.ReturnsTrue()
  return false
end

function GameLoop.Init(triggerWrapper)
  print("GameLoop Init Start")
  GameLoop.triggerWrapper = triggerWrapper
  GameLoop.triggerWrapper.CreateTrigger()
  print("GameLoop Init End")
end




local TriggerWrapper = {}


function TriggerWrapper.CreateTrigger()
  local trigger = CreateTrigger()
  return trigger
end




Test_GameLoop = {}


function Test_GameLoop.RunTests()
  assert(GameLoop.ReturnsTrue(), "Expected true")
end




UNIT_TEST = true


function LaunchLua()
  print("LaunchLua Start")
  GameLoop.Init(TriggerWrapper)
  print("LaunchLua End")
end


if (UNIT_TEST) then
  -- dbg = require("debugger")
  -- dbg()
  Test_GameLoop.RunTests()
end


