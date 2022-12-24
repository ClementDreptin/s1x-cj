local bindcommands = {
  'set sv_cheats 1',
  'bind button_lshldr "set pos_load 0"',
  'bind button_rshldr "set pos_save 0"',
  'bind dpad_left ufo',
  'bind h "set cp_spawn 0"',
}

local brushmodeltable = {
  ["mp_refraction"] = 164,
  ["mp_lab2"] = 215,
  ["mp_comeback"] = 123,
  ["mp_laser2"] = 183,
  ["mp_detroit"] = 126,
  ["mp_greenband"] = 119,
  ["mp_levity"] = 122,
  ["mp_instinct"] = 146,
  ["mp_recovery"] = 288,
  ["mp_venus"] = 144,
  ["mp_prison"] = 129,
  ["mp_solar"] = 129,
  ["mp_terrace"] = 117,
  ["mp_dam"] = 127,
  ["mp_torqued"] = 218,
  ["mp_clowntown3"] = 133,
  ["mp_lost"] = 175,
  ["mp_urban"] = 121,
  ["mp_blackbox"] = 158,
  ["mp_climate_3"] = 121,
  ["mp_perplex_1"] = 235,
  ["mp_spark"] = 125,
  ["mp_highrise2"] = 298,
  ["mp_kremlin"] = 203,
  ["mp_bigben2"] = 132,
  ["mp_sector17"] = 126,
  ["mp_fracture"] = 243,
  ["mp_lair"] = 142,
  ["mp_liberty"] = 267,
  ["mp_seoul2"] = 151,
}

local function radians(degrees)
  return degrees * (math.pi / 180)
end

local function spawncarepackage(player)
  local mapname = game:getdvar("ui_mapname")
  if mapname == nil or mapname == "" then
    print("Could get te current map's name")
    return
  end

  local brushmodelnum = brushmodeltable[mapname]
  if brushmodelnum == nil then
    print("Could not get the brushmodel for " .. mapname)
    return
  end

  local playerorigin = player:getorigin()
  local playerangles = player:getangles()

  local distance = 150

  local carepackageorigin = vector:new(0, 0, 0)
  carepackageorigin.x = playerorigin.x + (distance * math.cos(radians(playerangles.y)))
  carepackageorigin.y = playerorigin.y + (distance * math.sin(radians(playerangles.y)))
  carepackageorigin.z = playerorigin.z

  local carepackage = game:spawn("script_model", carepackageorigin)
  if carepackage == nil then
    print("Could not spawn care package")
    return
  end

  carepackage:setmodel("orbital_carepackage_pod_01_ai")

  local collision = game:getentbynum(brushmodelnum)
  if collision == nil then
    print("Could not find brushmodel number " .. brushmodelnum)
    return
  end

  carepackage:clonebrushmodeltoscriptmodel(collision)
end

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

local function executebindcommands(_)
  for _, command in ipairs(bindcommands) do
    game:executecommand(command)
  end
end

Commands = {
  ["cp_spawn"] = spawncarepackage,
  ["pos_save"] = savepos,
  ["pos_load"] = loadpos,
  ["binds"] = executebindcommands,
}
