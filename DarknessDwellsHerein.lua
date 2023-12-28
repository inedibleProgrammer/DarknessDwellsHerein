--[[ Darkness Dwells Herein ]]

-- UNIT_TEST = true


local GameConfig = {}

-- SuperUsers:
GameConfig.SuperUserList = {
  "worldedit",
  "MasterLich#11192"
}

function GameInit()
  Logger.Init()
  PlayerWrapper.Init()
  GameLoop.Init(Logger, TriggerWrapper)
  Commands.Init(Logger, TriggerWrapper, PlayerWrapper)
  print("after commands")
  PlayerManager.Init(Logger, Colors, PlayerWrapper, TriggerWrapper)
end

function LaunchLua()
  print("LaunchLua Start")
  xpcall(GameInit, print)
  print("LaunchLua End")
end


if (UNIT_TEST) then
  -- dbg = require("debugger")
  -- dbg()
  Test_GameLoop.RunTests()
  Test_Logger.RunTests()
  Test_PlayerManager.RunTests()
end


