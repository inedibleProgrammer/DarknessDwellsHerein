local Unit_Commands = {}


function Unit_Commands.PlayerRunsCommand()
  local commandsLog = Logger.Init()
  Commands.Init(commandsLog, mockTriggerWrapper, mockPlayerWrapper, StringUtil)
  PlayerManager.Init(commandsLog, Colors, mockPlayerWrapper, mockTriggerWrapper, StringUtil)

  local testCommand = {}
  testCommand.activator = "-dummy"
  testCommand.users = Commands.ALL_PLAYERS
  testCommand.dummyTestData = "Test will fail"
  testCommand.handler = function()
    testCommand.text = Commands.triggerWrapper.GetEventPlayerChatString()
    testCommand.commandingPlayer = Commands.triggerWrapper.GetTriggerPlayer()
    testCommand.tokens = Commands.stringUtil.Split(testCommand.text, " ")
    testCommand.dummyTestData = "Test will pass"
  end

  mockTriggerWrapper.eventPlayerChatString = "-dummy"
  Commands.Add(testCommand)
  testCommand.handler()

  assert(testCommand.dummyTestData == "Test will pass", "String must match")
end

function Unit_Commands.RunTests()
  Unit_Commands.PlayerRunsCommand()
end
