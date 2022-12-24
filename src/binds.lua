local bindcommands = {
  'set sv_cheats 1',
  'bind button_lshldr "set pos_load 0"',
  'bind button_rshldr "set pos_save 0"',
  'bind dpad_left ufo',
  'bind h "set cp_spawn 0"',
  'bind j "set bot_teleport 0"',
  'bind k "set bot_move 0"',
}

local function executebindcommands(_)
  for _, command in ipairs(bindcommands) do
    game:executecommand(command)
  end
end

Commands.binds = executebindcommands
