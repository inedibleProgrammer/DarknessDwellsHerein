local Unit_PlayerManager = {}

function PlayerManagerReturnsTrue()
  assert(PlayerManager.ReturnsTrue() == true)
end

function PlayerManagerAssignsAllPlayers()
  local playerManagerLog = Logger.Init()
  PlayerManager.Init(playerManagerLog, Colors, mockPlayerWrapper, mockTriggerWrapper)
end

function Unit_PlayerManager.RunTests()
  mockPlayerWrapper.maxPlayerSlots = 28
  PlayerManagerReturnsTrue()
  PlayerManagerAssignsAllPlayers()
end


