Utils = {}

local function radians(degrees)
  return degrees * (math.pi / 180)
end

Utils.vecproject = function(origin, orientation, distance)
  distance = distance or 150

  if origin == nil then
    print("You need to provide an origin to project a vector from")
    return
  end

  if orientation == nil then
    print("You need to provide an orientation to project a vector towards")
    return
  end

  local vec = vector:new(0, 0, 0)
  vec.x = origin.x + (distance * math.cos(radians(orientation)))
  vec.y = origin.y + (distance * math.sin(radians(orientation)))
  vec.z = origin.z

  return vec
end
