gg_trg_PrintMessage = nil
gg_trg_LaunchLua = nil
gg_trg_ForcePlayerToChat = nil
gg_trg_Wait = nil
function InitGlobals()
end

local Colors = {}

function Colors.Init()
  Colors.colorList = {}

  Colors.AddColor("red", 1, "00FF0303")
  Colors.AddColor("blue", 2, "000042FF")
  Colors.AddColor("teal", 3, "001CE6B9")
  Colors.AddColor("purple", 4, "00540081")
  Colors.AddColor("yellow", 5, "00FFFC00")
  Colors.AddColor("orange", 6, "00FE8A0E")
  Colors.AddColor("green", 7, "0020C000")
  Colors.AddColor("pink", 8, "00E55BB0")
  Colors.AddColor("gray", 9, "00959697")
  Colors.AddColor("light_blue", 10, "007EBFF1")
  Colors.AddColor("dark_green", 11, "00106246")
  Colors.AddColor("brown", 12, "004E2A04")
  Colors.AddColor("maroon", 13, "009B0000")
  Colors.AddColor("navy", 14, "000000C3")
  Colors.AddColor("turquoise", 15, "0000EAFF")
  Colors.AddColor("violet", 16, "00BE00FE")
  Colors.AddColor("wheat", 17, "00EBCD87")
  Colors.AddColor("peach", 18, "00F8A48B")
  Colors.AddColor("mint", 19, "00BFFF80")
  Colors.AddColor("lavender", 20, "00DCB9EB")
  Colors.AddColor("coal", 21, "00282828")
  Colors.AddColor("snow", 22, "00EBF0FF")
  Colors.AddColor("emerald", 23, "0000781E")
  Colors.AddColor("peanut", 24, "00A46F33")
  Colors.AddColor("some_weird_green", 25, "0022744F")
  Colors.AddColor("gold", 26, "00FFD700")
  Colors.AddColor("bright_blue", 27, "0019CAF6")
end

function Colors.Create(text, number, hexCode)
  local this = {}
  this.text = text
  this.number = number
  this.hexCode = hexCode

  return this
end

function Colors.AddColor(colorname, number, hexCode)
  local color = Colors.Create(colorname, number, hexCode)
  table.insert(Colors.colorList, color)
end

local Commands = {}



function Commands.Init(logger, triggerWrapper, playerWrapper, stringUtil)
  Commands.logger = logger
  Commands.triggerWrapper = triggerWrapper
  Commands.playerWrapper = playerWrapper
  Commands.stringUtil = stringUtil
  Commands.list = {}
end

function Commands.Add(command)
  command.trigger = Commands.triggerWrapper.CreateTrigger()
  Commands.triggerWrapper.TriggerAddAction(command.trigger, command.handler)

  for _,v in pairs(command.users) do
    Commands.triggerWrapper.TriggerRegisterPlayerChatEvent(command.trigger, v, command.activator, Commands.triggerWrapper.NO_EXACT_MATCH)
  end

  table.insert(Commands.list, command)
  Commands.logger.Log("Command added: " .. command.activator)
end




local GameLog = {}

function GameLog.ReturnsTrue()
  return true
end


function GameLog.Init(logger, triggerWrapper, commands)
  GameLog.logger = logger
  GameLog.triggerWrapper = triggerWrapper
  GameLog.commands = commands

  GameLog.logCommand = {}
  GameLog.logCommand.text = "log"
  GameLog.logCommand.handler = function()
    print("GameLog Handler")
  end
  GameLog.commands.Add(GameLog.triggerWrapper.logCommand)
end



local GameLoop = {}

function GameLoop.ReturnsTrue()
  return true
end

function GameLoop.Init(logger, triggerWrapper)
  GameLoop.logger = logger
  GameLoop.logger.Log("GameLoop Init Start")
  GameLoop.triggerWrapper = triggerWrapper
  GameLoop.loopTrigger = GameLoop.triggerWrapper.CreateTrigger()
  GameLoop.logger.Log("GameLoop Init End")
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





-- This is a generated file
local MapInfo = {}
MapInfo.name = "Darkness Dwells Herein"
MapInfo.version = "Alpha"
MapInfo.commit = "d1d5220b8d49ce14036c45fdb6141d201fe0e6dc"


local PlayerManager = {}



function PlayerManager.PlayerChatAction()
  -- print("Player chat")
  local command = {}
  command.text = PlayerManager.triggerWrapper.GetEventPlayerChatString()
  command.commandingPlayer = PlayerManager.triggerWrapper.GetTriggerPlayer()
  command.tokens = PlayerManager.stringUtil.Split(command.text, " ")

end

function PlayerManager.ReturnsTrue()
  return true
end

function PlayerManager.Init(logger, colors, playerWrapper, triggerWrapper, stringUtil)
  PlayerManager.logger = logger
  PlayerManager.colors = colors
  PlayerManager.playerWrapper = playerWrapper
  PlayerManager.triggerWrapper = triggerWrapper
  PlayerManager.stringUtil = stringUtil

  PlayerManager.playerList = {}
end

--[[
function PlayerManager.AnyPlayerChatString()
  for i = 0, PlayerManager.playerWrapper.maxPlayerSlots + 1 do
    PlayerManager.triggerWrapper.TriggerRegisterPlayerChatEvent(PlayerManager.playerChatTrigger, PlayerManager.playerWrapper.Player(i), COMMAND_ACTIVATOR, NO_EXACT_MATCH)
  end
end
--]]




local PlayerWrapper = {}


function PlayerWrapper.Init()
  PlayerWrapper.maxPlayerSlots = bj_MAX_PLAYER_SLOTS
end


function PlayerWrapper.Player(number)
  return Player(number)
end




PrintWrapper = {}


function PrintWrapper.Init()
end

function PrintWrapper.DisplayTextToPlayer(toPlayer, x, y, message)
  DisplayTextToPlayer(toPlayer, x, y, message)
end



local StringUtil = {}


function StringUtil.Split(inputStr, sep)
  if sep == nil then
    sep = " "
  end
  local t = {}
  for str in string.gmatch(inputStr, "([^"..sep.."]+)") do
    table.insert(t, str)
  end
  return t
end


local TriggerWrapper = {}


function TriggerWrapper.Init()
  TriggerWrapper.EXACT_MATCH = true
  TriggerWrapper.NO_EXACT_MATCH = false
  TriggerWrapper.PERIODIC = true
  TriggerWrapper.NOT_PERIODIC = false
end

function TriggerWrapper.CreateTrigger()
  local trigger = CreateTrigger()
  return trigger
end


function TriggerWrapper.TriggerAddAction(trigger, handler)
  TriggerAddAction(trigger, handler)
end

-- function TriggerRegisterTimerEvent(whichTrigger, timeout, periodic) end	-- (native)
function TriggerWrapper.TriggerRegisterTimerEvent(trigger, timeout, isPeriodic)
  TriggerRegisterTimerEvent(trigger, timeout, isPeriodic)
end

function TriggerWrapper.TriggerRegisterPlayerChatEvent(trigger, player, messageActivator, isExactMatchOnly)
  TriggerRegisterPlayerChatEvent(trigger, player, messageActivator, isExactMatchOnly)
end

-- function GetEventPlayerChatString() end	-- (native)
function TriggerWrapper.GetEventPlayerChatString()
  return GetEventPlayerChatString()
end

-- function GetTriggerPlayer() end	-- (native)
function TriggerWrapper.GetTriggerPlayer()
  return GetTriggerPlayer()
end




local mockPlayerWrapper = {}

function mockPlayerWrapper.Player(number)
end




local mockTriggerWrapper = {}

function mockTriggerWrapper.CreateTrigger()
end

function mockTriggerWrapper.TriggerAddAction(trigger, action)
end

function mockTriggerWrapper.TriggerRegisterTimerEvent(trigger, timeout, periodic)
end

function mockTriggerWrapper.TriggerRegisterPlayerChatEvent(trigger, player, messageActivator, exactMatchOnly)
end

function mockTriggerWrapper.GetEventPlayerChatString()
  return mockTriggerWrapper.eventPlayerChatString
end

function mockTriggerWrapper.GetTriggerPlayer()
  return mockTriggerWrapper.triggerPlayer
end



local Unit_Commands = {}


function Unit_Commands.PlayerRunsCommand()
  Commands.Init(Logger, mockTriggerWrapper, mockPlayerWrapper, StringUtil)
  PlayerManager.Init(Logger, Colors, mockPlayerWrapper, mockTriggerWrapper, StringUtil)

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

local Unit_GameLog = {}

function Unit_GameLog.ReturnsTrue()
  assert(GameLog.ReturnsTrue() == true, "Must return true")
end

function Unit_GameLog.CommandExecutes()
  Commands.Init(Logger, mockTriggerWrapper, mockPlayerWrapper)
  PlayerManager.Init(Logger, Colors, mockPlayerWrapper, mockTriggerWrapper, StringUtil)
end

function Unit_GameLog.RunTests()
  Unit_GameLog.ReturnsTrue()
  Unit_GameLog.CommandExecutes()
end


Unit_GameLoop = {}


function Unit_GameLoop.RunTests()
  assert(GameLoop.ReturnsTrue(), "Expected true")
end





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





local Unit_PlayerManager = {}

function PlayerManagerReturnsTrue()
  assert(PlayerManager.ReturnsTrue() == true)
end

function PlayerManagerAssignsAllPlayers()
  PlayerManager.Init(Logger, Colors, mockPlayerWrapper, mockTriggerWrapper)
end

function Unit_PlayerManager.RunTests()
  mockPlayerWrapper.maxPlayerSlots = 28
  PlayerManagerReturnsTrue()
  PlayerManagerAssignsAllPlayers()
end



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




--[[ Darkness Dwells Herein ]]

-- UNIT_TEST = true
INTEGRATION_TEST = true


local GameConfig = {}

-- SuperUsers:
GameConfig.SuperUserList = {
  "worldedit",
  "MasterLich#11192"
}

function GameInit()
  Logger.Init()
  PlayerWrapper.Init()
  GameLoop.Init(Logger, TriggerWrapper)
  Commands.Init(Logger, TriggerWrapper, PlayerWrapper)
  PlayerManager.Init(Logger, Colors, PlayerWrapper, TriggerWrapper, StringUtil)
end


function LaunchIntegrationTests()
  Int_Commands.InitTests()
end


function LaunchLua()
  print("LaunchLua Start")
  -- TriggerSleepAction(2)

  if (INTEGRATION_TEST) then
    -- dbg = require("debugger")
    -- dbg()
    print("Integration tests enabled")
    Logger.Init()
    Logger.Log("Integration tests starting...")
    xpcall(LaunchIntegrationTests, print)
    print("Integration tests end")
  else
    xpcall(GameInit, print)
  end
  print("LaunchLua End")
end


function LaunchUnitTests()
  Unit_GameLoop.RunTests()
  Unit_Logger.RunTests()
  Unit_PlayerManager.RunTests()
  Unit_GameLog.RunTests()
  Unit_Commands.RunTests()
end


if (UNIT_TEST) then
  -- dbg = require("debugger")
  -- dbg()
  print("Unit tests enabled")
  Logger.Init()
  Logger.Log("Unit tests starting...")
  xpcall(LaunchUnitTests, print)
  print("Unit tests end")
end







function Trig_LaunchLua_Actions()
    LaunchLua()
end

function InitTrig_LaunchLua()
gg_trg_LaunchLua = CreateTrigger()
TriggerAddAction(gg_trg_LaunchLua, Trig_LaunchLua_Actions)
end

function InitCustomTriggers()
InitTrig_LaunchLua()
end

function RunInitializationTriggers()
ConditionalTriggerExecute(gg_trg_LaunchLua)
end

function InitCustomPlayerSlots()
SetPlayerStartLocation(Player(0), 0)
SetPlayerColor(Player(0), ConvertPlayerColor(0))
SetPlayerRacePreference(Player(0), RACE_PREF_HUMAN)
SetPlayerRaceSelectable(Player(0), true)
SetPlayerController(Player(0), MAP_CONTROL_USER)
end

function InitCustomTeams()
SetPlayerTeam(Player(0), 0)
end

function main()
SetCameraBounds(-29952.0 + GetCameraMargin(CAMERA_MARGIN_LEFT), -30208.0 + GetCameraMargin(CAMERA_MARGIN_BOTTOM), 29952.0 - GetCameraMargin(CAMERA_MARGIN_RIGHT), 29696.0 - GetCameraMargin(CAMERA_MARGIN_TOP), -29952.0 + GetCameraMargin(CAMERA_MARGIN_LEFT), 29696.0 - GetCameraMargin(CAMERA_MARGIN_TOP), 29952.0 - GetCameraMargin(CAMERA_MARGIN_RIGHT), -30208.0 + GetCameraMargin(CAMERA_MARGIN_BOTTOM))
SetDayNightModels("Environment\\DNC\\DNCLordaeron\\DNCLordaeronTerrain\\DNCLordaeronTerrain.mdl", "Environment\\DNC\\DNCLordaeron\\DNCLordaeronUnit\\DNCLordaeronUnit.mdl")
NewSoundEnvironment("Default")
SetAmbientDaySound("CityScapeDay")
SetAmbientNightSound("CityScapeNight")
SetMapMusic("Music", true, 0)
InitBlizzard()
InitGlobals()
InitCustomTriggers()
RunInitializationTriggers()
end

function config()
SetMapName("TRIGSTR_003")
SetMapDescription("TRIGSTR_005")
SetPlayers(1)
SetTeams(1)
SetGamePlacement(MAP_PLACEMENT_USE_MAP_SETTINGS)
DefineStartLocation(0, -640.0, -960.0)
InitCustomPlayerSlots()
SetPlayerSlotAvailable(Player(0), MAP_CONTROL_USER)
InitGenericPlayerSlots()
end

