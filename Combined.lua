
local Commands = {}



function Commands.Init(logger, triggerWrapper, playerWrapper)
  Commands.logger = logger
  Commands.triggerWrapper = triggerWrapper
  Commands.playerWrapper = playerWrapper
  Commands.list = {}
end

function Commands.Add(command)
  table.insert(Commands.list, command)
  Commands.logger.Log("Command added")
end


function Commands.AnyPlayerStringInit()
end





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



local Logger = {}

function Logger.ReturnsTrue()
  return true
end

function Logger.Init()
  -- Logger.printWrapper = printWrapper
  Logger.messages = {}
  Logger.size = 0
end

function Logger.Log(message)
  table.insert(Logger.messages, message)
  Logger.size = Logger.size + 1
end

function Logger.Size()
  return Logger.size
end

function Logger.GetMessages(start, count)
  local request = {}
  for i = start, start + count - 1  do
    -- message = Logger.messages[i]
    -- Logger.printWrapper.DisplayTextToPlayer(0, 0, 0, message)
    table.insert(request, Logger.messages[i])
  end
  return request
end





-- This is a generated file
local MapInfo = {}
MapInfo.name = "Darkness Dwells Herein"
MapInfo.version = "Alpha"
MapInfo.commit = "c8df0cb702839f7c1d6081c015580c414fbf3c01"


local PlayerManager = {}




function PlayerManager.Init(logger, colors, playerWrapper, triggerWrapper)
  PlayerManager.logger = logger
  PlayerManager.colors = colors
  PlayerManager.playerWrapper = playerWrapper
  PlayerManager.playerList = {}
end


function PlayerManager.AnyPlayerChatString()
end




local PlayerWrapper = {}


function PlayerWrapper.Init()

end





PrintWrapper = {}


function PrintWrapper.Init()
end

function PrintWrapper.DisplayTextToPlayer(toPlayer, x, y, message)
  DisplayTextToPlayer(toPlayer, x, y, message)
end




local TriggerWrapper = {}


function TriggerWrapper.CreateTrigger()
  local trigger = CreateTrigger()
  return trigger
end


function TriggerWrapper.TriggerAddAction(trigger, handler)
  TriggerAddAction(trigger, handler)
end

function TriggerWrapper.TriggerRegisterTimerEvent(trigger, timeout, periodic)
  TriggerRegisterTimerEvent(trigger, timeout, periodic)
end




Test_GameLoop = {}


function Test_GameLoop.RunTests()
  assert(GameLoop.ReturnsTrue(), "Expected true")
end





local Test_Logger = {}


local dummyPrintWrapper = {}

dummyPrintWrapper.DisplayTextToPlayer = function(toPlayer, x, y, message)
  print(message)
end


function LoggerReturnsTrue()
  assert(Logger.ReturnsTrue())
end


function LoggerReturnsSize()
  Logger.Init()
  Logger.Log("This is a test")
  assert(Logger.Size() == 1)
end

function LoggerPrintsFirst3Messages()
  Logger.Init()
  local testData = {}
  testData[1] = "First Message"
  testData[2] = "Second Message"
  testData[3] = "Third Message"

  Logger.Log(testData[1])
  Logger.Log(testData[2])
  Logger.Log(testData[3])
  local request = Logger.GetMessages(1, 3)

  for i = 1, 3, 1 do
    assert(request[i] == testData[i])
  end

  assert(Logger.Size() == 3)
end

function Test_Logger.RunTests()
  LoggerReturnsTrue()
  LoggerReturnsSize()
  LoggerPrintsFirst3Messages()
end





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


