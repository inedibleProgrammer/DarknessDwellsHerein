
-- UNIT_TEST = true
UNIT_TEST = false


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


