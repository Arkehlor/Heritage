/// @function                   scr_ai_enemy_surround(enemy);
/// @param  {inst}  enemy		instance of the enemy that you want to move
/// @description                Resets value of the player

var _inst = argument0;

with (_inst)
{
	ds_grid_set(global.cost_grid, x >> global.power_sprite_size, y >> global.power_sprite_size, 0);
	// clears self from the map
	
	MP = base_MP; // Reset enemy MP
	var _player_x;
	var _player_y;
	
	with (obj_player) // Stores coordinates of the player
	{
		_player_x = x;
		_player_y = y;
	}
	
	if (scr_mp_grid_astar2_fight(global.grid, global.cost_grid, path, x, y, _player_x, _player_y, 0, 0, room_width / global.sprite_size, room_height / global.sprite_size, global.sprite_size, global.sprite_size))
	{
		var _needed_MP = path_get_number(path);
		
		if (_needed_MP > MP + 2)
		{
			for (var i = 1; i < _needed_MP - MP; i++)
			{
				path_delete_point(path, _needed_MP - i);
			}
			
			path_start(path, mov_speed, path_action_stop, 0)
			MP = 0;

		}
		else
		{
			if (_needed_MP == 2)
			{
				ds_grid_set(global.cost_grid, x >> global.power_sprite_size, y >> global.power_sprite_size, move_through);
			}
			else
			{
				path_delete_point(path, _needed_MP - 1);
				path_start(path, mov_speed, path_action_stop, 0);
				MP -= _needed_MP - 2;
			}
		}
	}
	else
	{
		ds_grid_set(global.cost_grid, x >> global.power_sprite_size, y >> global.power_sprite_size, move_through);
	}
}