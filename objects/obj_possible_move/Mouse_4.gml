/// @description Insert description here

with (obj_player)
{
	path_start(path, mov_speed, path_action_stop, 1) // follow the path
	moving = true;
	MP -= path_get_number(path) - 1;
}

layer_destroy_instances("moves_layer");
