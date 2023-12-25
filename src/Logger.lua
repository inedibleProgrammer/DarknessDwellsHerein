local Logger = {}

function Logger.ReturnsTrue()
  return true
end

function Logger.Init(printWrapper)
  Logger.printWrapper = printWrapper
  Logger.messages = {}
  Logger.size = 0
end

function Logger.Log(message)
  table.insert(Logger.messages, message)
  Logger.size = Logger.size + 1
end

function Logger.Size()
  return Logger.size
end

function Logger.GetMessages(start, count)
  request = {}
  for i = start, start + count - 1  do
    -- message = Logger.messages[i]
    -- Logger.printWrapper.DisplayTextToPlayer(0, 0, 0, message)
    table.insert(request, Logger.messages[i])
  end
end




