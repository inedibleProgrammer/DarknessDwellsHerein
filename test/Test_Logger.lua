
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

function LoggerPrintsFirst3Messages()
  Logger.Init(dummyPrintWrapper)
  Logger.Log("First Message")
  Logger.Log("Second Message")
  Logger.Log("Third Message")
  request = Logger.Dump(1, 3)
  for k,v in pairs(request) do
  end
end

function Test_Logger.RunTests()
  LoggerReturnsTrue()
  LoggerReturnsSize()
  LoggerPrintsFirst3Messages()
end




