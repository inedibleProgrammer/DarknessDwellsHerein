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


