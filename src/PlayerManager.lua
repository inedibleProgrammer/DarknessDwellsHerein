local PlayerManager = {}



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
  logger.Log("PlayerManager initialized")
end




