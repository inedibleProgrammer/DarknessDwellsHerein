--[[ Darkness Dwells Herein ]]

-- UNIT_TEST = true


local GameConfig = {}

-- SuperUsers:
GameConfig.SuperUserList = {
  "worldedit",
  "MasterLich#11192"
}

function thing()
  PlayerManager.Init(Logger, Colors, PlayerWrapper, TriggerWrapper)
end

function LaunchLua()
  print("LaunchLua Start")
  Logger.Init()
  Logger.Log("LaunchLua Start")
  GameLoop.Init(Logger, TriggerWrapper)
  Commands.Init(Logger, TriggerWrapper, PlayerWrapper)
  print("after commands")
  xpcall(thing, print)
  print("LaunchLua End")
  Logger.Log("LaunchLua End")
end


if (UNIT_TEST) then
  -- dbg = require("debugger")
  -- dbg()
  Test_GameLoop.RunTests()
  Test_Logger.RunTests()
  Test_PlayerManager.RunTests()
end


