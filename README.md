# S1x CodJumper Mod
S1x mod with basic features for CodJumping.

## Installation
- Download the [zip archive of this repository](https://github.com/ClementDreptin/s1x-cj/archive/refs/heads/master.zip).
- Extract the zip archive into `\path\to\AW\s1x\lua-scripts\` (make sure to create the `lua-scripts` directory if you don't already have one)

You can also simply clone the repository into `\path\to\AW\s1x\lua-scripts\` if you know how that works.

## How it works
This mod simply creates dvars and monitors them. Their default value is an empty string (`""`) and once they change, a function is called.

Here is a list of the available dvars:
- `pos_save`: Save the current position and view angles of the player.
- `pos_load`: Load the previously saved position and view angles of the player.
- `cp_spawn`: Spawn a care package in front a the player<sup>[1](#notes)</sup>.
- `bot_teleport`: Teleport the bot in front of the player<sup>[2](#notes)</sup>.

So, for example, to save the current position and view angles, open the console and type `pos_save <any_value>`. If you later want to load the previously saved position and view angles, type `pos_load <any_value>`.

## Binds
For convenience, the following binds are set:
- `button_lshldr` (LB/L1): Load position and view angles.
- `button_rshldr` (RB/R1): Save position and view angles.
- `dpad_left`: Toggle UFO.
- `h`: Spawn a care package.
- `j`: Teleport the bot in front of the player.
- `k`: Freeze/unfreeze the bot.

If you don't play with a controller or want to use different binds, feel free to change them [here](/src/binds.lua).

## Notes
<sup>1</sup> The collision body applied is not the care package one but one that is more flat and easier to stand on.
<sup>2</sup> This assumes only one bot is in the game. If multiple bots are in the game, the last bot that connected will be targeted.
