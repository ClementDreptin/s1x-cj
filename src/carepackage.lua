require("src.utils")

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

local function spawncarepackage(player)
  local mapname = game:getdvar("ui_mapname")
  if mapname == nil or mapname == "" then
    print("Could not get the current map's name")
    return
  end

  local brushmodelnum = brushmodeltable[mapname]
  if brushmodelnum == nil then
    print("Could not get the brushmodel for " .. mapname)
    return
  end

  local carepackageorigin = Utils.projectforward(player, 150)

  local carepackage = game:spawn("script_model", carepackageorigin)
  if carepackage == nil then
    print("Could not spawn care package")
    return
  end

  carepackage:rotateyaw(player:getangles().y, 0)

  carepackage:setmodel("orbital_carepackage_pod_01_ai")

  local collision = game:getentbynum(brushmodelnum)
  if collision == nil then
    print("Could not find brushmodel number " .. brushmodelnum)
    return
  end

  carepackage:clonebrushmodeltoscriptmodel(collision)
end

Commands.cp_spawn = spawncarepackage
