local mockTriggerWrapper = {}

function mockTriggerWrapper.CreateTrigger()
end

function mockTriggerWrapper.TriggerAddAction(trigger, action)
end

function mockTriggerWrapper.TriggerRegisterTimerEvent(trigger, timeout, periodic)
end

function mockTriggerWrapper.TriggerRegisterPlayerChatEvent(trigger, player, messageActivator, exactMatchOnly)
end

function mockTriggerWrapper.GetEventPlayerChatString()
  return mockTriggerWrapper.eventPlayerChatString
end

function mockTriggerWrapper.GetTriggerPlayer()
  return mockTriggerWrapper.triggerPlayer
end


