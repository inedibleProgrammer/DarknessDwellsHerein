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



