gg_trg_PrintMessage = nil
gg_trg_LaunchLua = nil
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



function Commands.Init(logger, triggerWrapper, playerWrapper)
  Commands.logger = logger
  Commands.triggerWrapper = triggerWrapper
  Commands.playerWrapper = playerWrapper
  Commands.list = {}
end

function Commands.Add(command)
  table.insert(Commands.list, command)
  Commands.logger.Log("Command added")
end






local GameLoop = {}

function GameLoop.ReturnsTrue()
  return true
end

function GameLoop.Init(logger, triggerWrapper)
  -- print("GameLoop Init Start")
  GameLoop.logger = logger
  GameLoop.logger.Log("GameLoop Init Start")
  GameLoop.triggerWrapper = triggerWrapper
  GameLoop.triggerWrapper.CreateTrigger()
  -- print("GameLoop Init End")
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
MapInfo.commit = "fe6de9fd31721d75232c561180a0833d6809af47"


local PlayerManager = {}


NO_EXACT_MATCH = false
COMMAND_ACTIVATOR = "-cmd"

function PlayerChatAction()
  print("Player chat")
end

function PlayerManager.ReturnsTrue()
  return true
end

function PlayerManager.Init(logger, colors, playerWrapper, triggerWrapper)
  PlayerManager.logger = logger
  PlayerManager.colors = colors
  PlayerManager.playerWrapper = playerWrapper
  PlayerManager.triggerWrapper = triggerWrapper
  PlayerManager.playerList = {}
  PlayerManager.playerChatTrigger = triggerWrapper.CreateTrigger()
  PlayerManager.triggerWrapper.TriggerAddAction(PlayerManager.playerChatTrigger, PlayerChatAction)
  PlayerManager.AnyPlayerChatString()
end


function PlayerManager.AnyPlayerChatString()
  for i = 0, PlayerManager.playerWrapper.maxPlayerSlots + 1 do
    PlayerManager.triggerWrapper.TriggerRegisterPlayerChatEvent(PlayerManager.playerChatTrigger, PlayerManager.playerWrapper.Player(i), COMMAND_ACTIVATOR, NO_EXACT_MATCH)
  end
end




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




local TriggerWrapper = {}


function TriggerWrapper.CreateTrigger()
  local trigger = CreateTrigger()
  return trigger
end


function TriggerWrapper.TriggerAddAction(trigger, handler)
  TriggerAddAction(trigger, handler)
end

function TriggerWrapper.TriggerRegisterTimerEvent(trigger, timeout, periodic)
  TriggerRegisterTimerEvent(trigger, timeout, periodic)
end

function TriggerWrapper.TriggerRegisterPlayerChatEvent(trigger, player, messageActivator, exactMatchOnly)
  TriggerRegisterPlayerChatEvent(trigger, player, messageActivator, exactMatchOnly)
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

function Test_Logger.RunTests()
  LoggerReturnsTrue()
  LoggerReturnsSize()
  LoggerPrintsFirst3Messages()
end





local Test_PlayerManager = {}

function PlayerManagerReturnsTrue()
  assert(PlayerManager.ReturnsTrue() == true)
end

function PlayerManagerAssignsAllPlayers()
  PlayerManager.Init(Logger, Colors, mockPlayerWrapper, mockTriggerWrapper)
end

function Test_PlayerManager.RunTests()
  mockPlayerWrapper.maxPlayerSlots = 28
  PlayerManagerReturnsTrue()
  PlayerManagerAssignsAllPlayers()
end



--[[ Darkness Dwells Herein ]]

-- UNIT_TEST = true


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
  print("after commands")
  PlayerManager.Init(Logger, Colors, PlayerWrapper, TriggerWrapper)
end

function LaunchLua()
  print("LaunchLua Start")
  xpcall(GameInit, print)
  print("LaunchLua End")
end


if (UNIT_TEST) then
  -- dbg = require("debugger")
  -- dbg()
  Test_GameLoop.RunTests()
  Test_Logger.RunTests()
  Test_PlayerManager.RunTests()
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

