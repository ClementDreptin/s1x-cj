Commands = {}

require("src.binds")
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
  for funcName in pairs(Commands) do
    game:setdvar(funcName, "")
  end
end

local function onplayerconnected(player)
  initdvars()
  Commands.binds()

  local timer = game:oninterval(function() processdvars(player) end, 200)

  player:onnotify("disconnect", function() timer:clear() end)
end

level:onnotify("connected", onplayerconnected)
