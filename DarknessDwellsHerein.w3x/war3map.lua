gg_trg_LaunchLua = nil
function InitGlobals()
end



local GameLoop = {}

function GameLoop.Init()
  print("GameLoop Init")
end



function LaunchLua()
  print("LaunchLua Start")  
  GameLoop.Init()
  print("LaunchLua End")
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

