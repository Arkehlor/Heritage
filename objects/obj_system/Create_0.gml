/// @description Creates the grid for pathfinding

global.sprite_size = 16; // standard size of the sprites
global.power_sprite_size = log2(global.sprite_size); // size as a power of 2

global.grid = mp_grid_create(0, 0, room_width / global.sprite_size, room_height / global.sprite_size, global.sprite_size, global.sprite_size); // Create the grid of the map
global.cost_grid = ds_grid_create(room_width / global.sprite_size, room_height / global.sprite_size); // Create the grid for the pathfinding algorithm for enemies
mp_grid_add_instances(global.grid, obj_wall, 0); // add all instances of obj_wall as obstacles in the grid
mp_grid_to_ds_grid(global.grid, global.cost_grid);

global.game_speed = 1.5; // Time before game "launches"
global.enemy_turn_speed = 0.2; // Time of enemy turn
enemy_turn = 0;

global.state = states.overworld; // Standard state

alarm[0] = 60 * global.game_speed; // x time before alarm 1 IE beginning of player turn