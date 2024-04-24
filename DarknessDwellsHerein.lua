
--[[ Darkness Dwells Herein ]]

UNIT_TEST = true
-- INTEGRATION_TEST = true


local GameConfig = {}

-- SuperUsers:
GameConfig.SuperUserList = {
  "worldedit",
  "MasterLich#11192"
}

function GameInit()
  local gameLog = Logger.Init()
  PlayerWrapper.Init()
  -- GameLoop.Init(Logger, TriggerWrapper)
  Commands.Init(gameLog, TriggerWrapper, PlayerWrapper, StringUtil)
  LogDisplay.Init(gameLog, Commands)
  PlayerManager.Init(gameLog, Colors, PlayerWrapper, TriggerWrapper, StringUtil)
end


function LaunchIntegrationTests()
  Int_Commands.InitTests()
end


function LaunchLua()
  print("LaunchLua Start")
  -- TriggerSleepAction(2)

  if (INTEGRATION_TEST) then
    -- dbg = require("debugger")
    -- dbg()
    print("Integration tests enabled")
    testLog = Logger.Init()
    testLog.Log("Integration tests starting...")
    xpcall(LaunchIntegrationTests, print)
    testLog.Log("Integration tests ending...")
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
  Unit_Commands.RunTests()
end


if (UNIT_TEST) then
  -- dbg = require("debugger")
  -- dbg()
  print("Unit tests enabled")
  local testLog = Logger.Init()
  testLog.Log("Unit tests starting...")
  xpcall(LaunchUnitTests, print)
  testLog.Log("Unit tests end...")
  print("Unit tests end")
end






