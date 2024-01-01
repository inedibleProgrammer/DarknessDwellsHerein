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
