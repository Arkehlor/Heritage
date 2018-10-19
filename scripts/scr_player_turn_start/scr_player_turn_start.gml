/// @function                   scr_player_turn_start();
/// @description                Resets value of the player

with (obj_player)
{
	MP = base_MP + 1; // Resets and increments MP as it is the rush phase
	if (!moving)
	{
		layer_destroy_instances("moves_layer");
		scr_display_player_move();
	}
}