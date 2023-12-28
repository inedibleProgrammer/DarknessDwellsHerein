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
  -- print("player manager init")
  PlayerManager.logger = logger
  PlayerManager.colors = colors
  PlayerManager.playerWrapper = playerWrapper
  PlayerManager.triggerWrapper = triggerWrapper
  PlayerManager.playerList = {}
  PlayerManager.playerChatTrigger = triggerWrapper.CreateTrigger()
  PlayerManager.triggerWrapper.TriggerAddAction(PlayerManager.playerChatTrigger, PlayerChatAction)
  -- print("before chat thing")
  PlayerManager.AnyPlayerChatString()
  -- print("player manager end")
end


function PlayerManager.AnyPlayerChatString()
  for i = 0, PlayerManager.playerWrapper.maxPlayerSlots + 1 do
    PlayerManager.triggerWrapper.TriggerRegisterPlayerChatEvent(PlayerManager.playerChatTrigger, PlayerManager.playerWrapper.Player(i), COMMAND_ACTIVATOR, NO_EXACT_MATCH)
  end
end



