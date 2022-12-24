Commands = {}

require("src.binds")
require("src.bots")
require("src.carepackage")
require("src.saveload")

local function processdvars(player)
  for funcname, func in pairs(Commands) do
    local dvarvalue = game:getdvar(funcname)
    if (dvarvalue ~= "") then
      func(player)
      game:setdvar(funcname, "")
    end
  end
end

local function initdvars()
  for funcname in pairs(Commands) do
    game:setdvar(funcname, "")
  end
end

local function onplayerconnected(player)
  if game:isbot(player) == 1 then
    Bot = player
    return
  end

  initdvars()
  Commands.binds()

  local timer = game:oninterval(function() processdvars(player) end, 200)

  player:onnotify("disconnect", function() timer:clear() end)
end

level:onnotify("connected", onplayerconnected)
