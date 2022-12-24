local function savepos(player)
  player.savedorigin = player:getorigin()
  player.savedangles = player:getangles()

  player:iclientprintln("Position ^2Saved")
end

local function loadpos(player)
  if player.savedorigin == nil or player.savedangles == nil then
    player:iclientprintln("^1Save a position first!")
    return
  end

  player:setorigin(player.savedorigin)
  player:setangles(player.savedangles)
end

Commands.pos_save = savepos
Commands.pos_load = loadpos
