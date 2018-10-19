/// @description Delayed player turn

with (obj_enemy) {
	ds_grid_set(global.cost_grid, x >> global.power_sprite_size, y >> global.power_sprite_size, move_through);
}

mp_grid_add_instances(global.grid, obj_enemy, 0); // Adds the enemies as obstacles on the grid

global.state = states.rush; // Sets current state as rush

scr_player_turn_start(); // Player turn

instance_create_layer(0, -global.sprite_size,"timer_layer",obj_timer); // Display timer bar

alarm[1] = 60 * global.player_turn_speed * global.rush_time; // Prepares next part of turn