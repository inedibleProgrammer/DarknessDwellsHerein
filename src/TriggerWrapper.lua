
local TriggerWrapper = {}


function TriggerWrapper.Init()
  TriggerWrapper.EXACT_MATCH = true
  TriggerWrapper.NO_EXACT_MATCH = false
  TriggerWrapper.PERIODIC = true
  TriggerWrapper.NOT_PERIODIC = false
end

function TriggerWrapper.CreateTrigger()
  local trigger = CreateTrigger()
  return trigger
end


function TriggerWrapper.TriggerAddAction(trigger, handler)
  TriggerAddAction(trigger, handler)
end

-- function TriggerRegisterTimerEvent(whichTrigger, timeout, periodic) end	-- (native)
function TriggerWrapper.TriggerRegisterTimerEvent(trigger, timeout, isPeriodic)
  TriggerRegisterTimerEvent(trigger, timeout, isPeriodic)
end

function TriggerWrapper.TriggerRegisterPlayerChatEvent(trigger, player, messageActivator, isExactMatchOnly)
  TriggerRegisterPlayerChatEvent(trigger, player, messageActivator, isExactMatchOnly)
end

-- function GetEventPlayerChatString() end	-- (native)
function TriggerWrapper.GetEventPlayerChatString()
  return GetEventPlayerChatString()
end

-- function GetTriggerPlayer() end	-- (native)
function TriggerWrapper.GetTriggerPlayer()
  return GetTriggerPlayer()
end



