local Int_Commands = {}


function Int_Commands.InitDummyCommand()
  TriggerWrapper.Init()
  PlayerWrapper.Init()
  Commands.Init(Logger, TriggerWrapper, PlayerWrapper, StringUtil)
  PlayerManager.Init(Logger, Colors, PlayerWrapper, TriggerWrapper, StringUtil)

  Int_Commands.testCommand = {}
  Int_Commands.testCommand.activator = "-dummy"
  Int_Commands.testCommand.users = Commands.ALL_PLAYERS
  Int_Commands.testCommand.dummyTestData = "Test will fail"
  Int_Commands.testCommand.handler = function()
    print("testCommand Handler entered")
    Int_Commands.testCommand.text = Commands.triggerWrapper.GetEventPlayerChatString()
    Int_Commands.testCommand.commandingPlayer = Commands.triggerWrapper.GetTriggerPlayer()
    Int_Commands.testCommand.tokens = Commands.stringUtil.Split(Int_Commands.testCommand.text, " ")
    Int_Commands.testCommand.dummyTestData = "Test will pass"
    print("testCommand Handler exited")
  end

  TriggerWrapper.eventPlayerChatString = "-dummy"
  Commands.Add(Int_Commands.testCommand)
end


function Int_Commands.ChatTestTriggerHandler()
  print("ChatTestTriggerHandler Start")
  function TestAsserts()
    assert(Int_Commands.testCommand.dummyTestData == "Test will pass", "String must match")
    assert(Int_Commands.testCommand.tokens[1] == "-dummy", "String must match")
  end
  xpcall(TestAsserts, print)
  print("ChatTestTriggerHandler End")
end


--[[
  - Tests are performed by typing "-dummy" followed by "-chattest"
--]]
function Int_Commands.InitTests()
  Int_Commands.testAssertsTrigger = TriggerWrapper.CreateTrigger()
  TriggerWrapper.TriggerAddAction(Int_Commands.testAssertsTrigger, Int_Commands.ChatTestTriggerHandler)

  TriggerWrapper.TriggerRegisterPlayerChatEvent(Int_Commands.testAssertsTrigger, Player(0), "-chattest", TriggerWrapper.NOT_EXACT)
  Int_Commands.InitDummyCommand()
end



