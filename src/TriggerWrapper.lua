
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


