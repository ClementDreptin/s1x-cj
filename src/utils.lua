Utils = {}

Utils.projectforward = function(player, distance)
  distance = distance or 150

  if player == nil or game:isplayer(player) ~= 1 then
    print("You need to provide a player to project from")
    return
  end

  local origin = player:getorigin()
  local angles = player:getangles()

  local forwardvec = game:anglestoforward(angles)

  return vector:new(
    origin.x + (forwardvec.x * distance),
    origin.y + (forwardvec.y * distance),
    origin.z
  )
end
