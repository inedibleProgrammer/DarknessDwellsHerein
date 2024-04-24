local Logger = {}

function Logger.ReturnsTrue()
  return true
end

function Logger.Init()
  -- Logger.printWrapper = printWrapper
  -- Logger.messages = {}
  -- Logger.size = 0
  local logger = {}
  logger.size = 0
  logger.messages = {}

  logger.Log = function(message)
    table.insert(logger.messages, message)
    logger.size = logger.size + 1
  end

  logger.Size = function()
    return logger.size
  end

  logger.GetMessages = function(start, count)
    local request = {}

    if (count == 1) then
      table.insert(request, Logger.messages[start])
    else
      for i = start, start + count - 1 do
        -- message = Logger.messages[i]
        -- Logger.printWrapper.DisplayTextToPlayer(0, 0, 0, message)
        table.insert(request, logger.messages[i])
      end
    end
    return request
  end

  return logger
end



