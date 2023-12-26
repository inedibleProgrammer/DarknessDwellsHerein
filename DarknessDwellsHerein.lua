--[[ Darkness Dwells Herein ]]

UNIT_TEST = true
-- UNIT_TEST = false



-- Map Info:
local MapInfo = {}
MapInfo.version = "0.0.0"
MapInfo.commit = ""

-- SuperUsers:
local SuperUserList = {
  "worldedit",
  "MasterLich#11192"
}

function LaunchLua()
  -- print("LaunchLua Start")
  Logger.Init()
  Logger.Log("LaunchLua Start")
  GameLoop.Init(Logger, TriggerWrapper)
  -- print("LaunchLua End")
  Logger.Log("LaunchLua End")
end


if (UNIT_TEST) then
  -- dbg = require("debugger")
  -- dbg()
  Test_GameLoop.RunTests()
  Test_Logger.RunTests()
end


