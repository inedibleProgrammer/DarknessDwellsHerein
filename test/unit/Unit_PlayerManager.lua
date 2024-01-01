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


