local LogDisplay = {}



function LogDisplay.Init(logger, commands)
  LogDisplay.logger = logger
  LogDisplay.commands = commands

  LogDisplay.logSizeCommand = {}
  LogDisplay.logSizeCommand.activator = "-log"
  LogDisplay.logSizeCommand.users = commands.ALL_PLAYERS
  LogDisplay.logSizeCommand.handler = function()
    LogDisplay.logSizeCommand.text = LogDisplay.commands.triggerWrapper.GetEventPlayerChatString()
    LogDisplay.logSizeCommand.commandingPlayer = LogDisplay.commands.triggerWrapper.GetTriggerPlayer()
    LogDisplay.logSizeCommand.tokens = LogDisplay.commands.stringUtil.Split(LogDisplay.logSizeCommand.text, " ")
    local tokens = LogDisplay.logSizeCommand.tokens

    print("Log command summary: ")

    if(tokens[2] == "size") then
      print(logger.Size())
    end
  end

  commands.Add(LogDisplay.logSizeCommand)
end
