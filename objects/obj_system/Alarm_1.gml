/// @description End of rush, start of normal

global.state = states.norm; // Sets current state as normal

with (obj_timer) // Within timer object
{
	timer = 0; // Resets timer
	max_time = max_time_norm;	
}

with (obj_player)
{
	MP--; // Decreases player MP as it is the end of the rush phase

	if (!moving)
	{
		layer_destroy_instances("moves_layer");
		scr_display_player_move();
	}
}

alarm[2] = 60 * global.player_turn_speed * global.norm_time; // Prepares next part of turn