--[[ Darkness Dwells Herein ]]

UNIT_TEST = true
INTEGRATION_TEST = true


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
  PlayerManager.Init(Logger, Colors, PlayerWrapper, TriggerWrapper, StringUtil)
end


function LaunchIntegrationTests()
  Logger.Init()
end


function LaunchLua()
  print("LaunchLua Start")

  if (INTEGRATION_TEST) then
    -- dbg = require("debugger")
    -- dbg()
    print("Integration tests enabled")
    Logger.Init()
    Logger.Log("Integration tests starting...")
    xpcall(LaunchIntegrationTests, print)
    print("Integration tests end")
  else
    xpcall(GameInit, print)
  end
  print("LaunchLua End")
end


function LaunchUnitTests()
  Unit_GameLoop.RunTests()
  Unit_Logger.RunTests()
  Unit_PlayerManager.RunTests()
  Unit_GameLog.RunTests()
  Unit_Commands.RunTests()
end


if (UNIT_TEST) then
  -- dbg = require("debugger")
  -- dbg()
  print("Unit tests enabled")
  Logger.Init()
  Logger.Log("Unit tests starting...")
  xpcall(LaunchUnitTests, print)
  print("Unit tests end")
end






