local Int_Commands = {}

-- function BlzDisplayChatMessage(whichPlayer, recipient, message) end	-- (native)

function Int_Commands.InitDummyCommand()
  TriggerWrapper.Init()
  PlayerWrapper.Init()
  Commands.Init(Logger, TriggerWrapper, PlayerWrapper, StringUtil)
  PlayerManager.Init(Logger, Colors, PlayerWrapper, TriggerWrapper, StringUtil)

  Int_Commands.testCommand = {}
  Int_Commands.testCommand.activator = "-dummy"
  Int_Commands.testCommand.users = {Player(0)}
  Int_Commands.testCommand.dummyTestData = "Test will fail"
  Int_Commands.testCommand.handler = function()
    print("Handler entered")
    Int_Commands.testCommand.text = Commands.triggerWrapper.GetEventPlayerChatString()
    print("1")
    Int_Commands.testCommand.commandingPlayer = Commands.triggerWrapper.GetTriggerPlayer()
    print("2")
    Int_Commands.testCommand.tokens = Commands.stringUtil.Split(Int_Commands.testCommand.text, " ")
    print("3")
    Int_Commands.testCommand.dummyTestData = "Test will pass"
    print("Handler exited")
  end

  TriggerWrapper.eventPlayerChatString = "-dummy"
  Commands.Add(Int_Commands.testCommand)
  -- TriggerSleepAction(1)

  -- assert(testCommand.dummyTestData == "Test will pass", "String must match")
end


function Int_Commands.ChatTestTriggerHandler()
  print("ChatTestTriggerHandler Start")
  function TestAsserts()
    assert(Int_Commands.testCommand.dummyTestData == "Test will pass", "String must match")
  end
  xpcall(TestAsserts, print)
  -- BlzDisplayChatMessage(Player(0), 0, "-dummy")
  print("ChatTestTriggerHandler End")
end

function Int_Commands.InitTests()
  Int_Commands.testAssertsTrigger = TriggerWrapper.CreateTrigger()
  -- function TriggerRegisterTimerEvent(whichTrigger, timeout, periodic) end	-- (native)
  TriggerWrapper.TriggerAddAction(Int_Commands.testAssertsTrigger, Int_Commands.ChatTestTriggerHandler)
  -- TriggerWrapper.TriggerRegisterTimerEvent(Int_Commands.testAssertsTrigger, 1, false)

  -- function TriggerWrapper.TriggerRegisterPlayerChatEvent(trigger, player, messageActivator, isExactMatchOnly)
  TriggerWrapper.TriggerRegisterPlayerChatEvent(Int_Commands.testAssertsTrigger, Player(0), "-chattest", TriggerWrapper.NOT_EXACT)

  Int_Commands.InitDummyCommand()
end



