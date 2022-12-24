require("src.utils")

Bot = nil

local function teleportbot(player)
  if Bot == nil then
    player:iclientprintln("^1There is no bot in the game!")
    return
  end

  local botneworigin = Utils.vecproject(player:getorigin(), player:getangles().y, 150)

  Bot:setorigin(botneworigin)

  -- The scripting environment seems to convert booleans to numbers so "Bot.isfrozen" can't simply be
  -- swapped by doing "not Bot.isfrozen", which is why we use numbers instead
  Bot.isfrozen = 1
  Bot:freezecontrols(Bot.isfrozen)
end

local function setbotmovement(player)
  if Bot == nil then
    player:iclientprintln("^1There is no bot in the game!")
    return
  end

  -- Just in case the bot movement is set before teleporting the bot
  if Bot.isfrozen == nil then
    Bot.isfrozen = 0
  end

  -- Trick to swap a number between 0 and 1
  Bot.isfrozen = 1 - Bot.isfrozen
  Bot:freezecontrols(Bot.isfrozen)
end

Commands.bot_teleport = teleportbot
Commands.bot_move = setbotmovement
