local Unit_Logger = {}


function Unit_Logger.LoggerReturnsTrue()
  assert(Logger.ReturnsTrue(), "Must be true")
end


function Unit_Logger.LoggerReturnsSize()
  Logger.Init()
  Logger.Log("This is a test")
  assert(Logger.Size() == 1, "Size must be 1")
end

function Unit_Logger.LoggerPrintsFirstMessage()
  Logger.Init()
  local testData = "First Message"

  Logger.Log(testData)

  local request = Logger.GetMessages(1, 1)

  assert(request[1] == testData, "Strings must match")
end

function Unit_Logger.LoggerPrintsFirst3Messages()
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

  assert(Logger.Size() == 3, "Strings must match")
end

function Unit_Logger.RunTests()
  Unit_Logger.LoggerReturnsTrue()
  Unit_Logger.LoggerReturnsSize()
  Unit_Logger.LoggerPrintsFirstMessage()
  Unit_Logger.LoggerPrintsFirst3Messages()
end




