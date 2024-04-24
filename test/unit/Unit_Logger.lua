local Unit_Logger = {}
Unit_Logger.tests = {}


function Unit_Logger.tests.LoggerPrintsFirst3Messages()
    local testLog = Logger.Init()
    local testData = {}
    testData[1] = "First Message"
    testData[2] = "Second Message"
    testData[3] = "Third Message"

    testLog.Log(testData[1])
    testLog.Log(testData[2])
    testLog.Log(testData[3])
    local request = testLog.GetMessages(1, 3)

    for i = 1, 3, 1 do
        assert(request[i] == testData[i])
    end

    assert(testLog.Size() == 3, "Strings must match")
end

function Unit_Logger.tests.GetsConstructed()
    local testLog = Logger.Init()
    assert(testLog.messages[1] == nil)
end

function Unit_Logger.runAll()
   for _, v in pairs(Unit_Logger.tests) do
     v()
   end
end

function Unit_Logger.RunTests()
   Unit_Logger.runAll()
  --[[
  Unit_Logger.LoggerReturnsTrue()
  Unit_Logger.LoggerReturnsSize()
  Unit_Logger.LoggerPrintsFirstMessage()
  Unit_Logger.LoggerPrintsFirst3Messages()
  --]]
end




