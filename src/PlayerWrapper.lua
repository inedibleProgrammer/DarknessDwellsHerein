local PlayerWrapper = {}


function PlayerWrapper.Init()
  PlayerWrapper.maxPlayerSlots = bj_MAX_PLAYER_SLOTS
end


function PlayerWrapper.Player(number)
  return Player(number)
end


