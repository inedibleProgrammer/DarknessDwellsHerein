

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
end

function Test_Logger.RunTests()
  LoggerReturnsTrue()
  LoggerReturnsSize()
  LoggerPrintsFirst3Messages()
end






UNIT_TEST = true
-- UNIT_TEST = false


function LaunchLua()
  print("LaunchLua Start")
  Logger.Init(PrintWrapper)
  GameLoop.Init(TriggerWrapper)
  print("LaunchLua End")
end


if (UNIT_TEST) then
  -- dbg = require("debugger")
  -- dbg()
  Test_GameLoop.RunTests()
  Test_Logger.RunTests()
end


