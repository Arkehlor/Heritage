/// @description End of prep, start of enemy turn

if (enemy_turn == 0)
{
	with (obj_enemy)
	{
		mp_grid_clear_cell(global.grid, x >> global.power_sprite_size , y >> global.power_sprite_size);
	}
	
	global.state = states.ai_turn; // Sets current state as enemy turn

	layer_destroy_instances("moves_layer"); // Destroy player possible moves
	layer_destroy_instances("timer_layer"); // Destroy player timer
	
	enemies = instance_number(obj_enemy);
	
	if (enemies > 0)
	{
		scr_ai_enemy_surround(instance_find(obj_enemy, enemy_turn));
		enemy_turn++;
		alarm[3] = 60 * global.enemy_turn_speed;
	}
	else
	{
		alarm[0] = 1;// Victory ?	
	}
}
else
{
	if (enemy_turn == enemies)
	{
		alarm[0] = 1;
		enemy_turn = 0;
	}
	else
	{
		scr_ai_enemy_surround(instance_find(obj_enemy, enemy_turn));
		enemy_turn++;
		alarm[3] = 60 * global.enemy_turn_speed;
	}

}

