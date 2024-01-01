
local Unit_Logger = {}


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

function Unit_Logger.RunTests()
  LoggerReturnsTrue()
  LoggerReturnsSize()
  LoggerPrintsFirst3Messages()
end




