
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




