

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

function Logger.Init(printWrapper)
  Logger.printWrapper = printWrapper
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

function Logger.Dump(start, count)
  for i = start, start + count - 1  do
    message = Logger.messages[i]
    Logger.printWrapper.DisplayTextToPlayer(0, 0, 0, message)
  end
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
  Logger.Init(dummyPrintWrapper)
  Logger.Log("This is a test")
  assert(Logger.Size() == 1)
end

function LoggerPrints3Messages()
  Logger.Init(dummyPrintWrapper)
  Logger.Log("First Message")
  Logger.Log("Second Message")
  Logger.Log("Third Message")
  Logger.Dump(1, 3) -- Check display yourself
end

function Test_Logger.RunTests()
  LoggerReturnsTrue()
  LoggerReturnsSize()
  LoggerPrints3Messages()
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


