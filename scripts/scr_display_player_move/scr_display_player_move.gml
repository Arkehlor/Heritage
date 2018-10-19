/// @function                   scr_display_player_move();
/// @description				Start of the turn of the player

with (obj_player)
{
	for (var i = -MP; i < MP + 1; i++)
	{
		for (var j = abs(i) - MP; j < MP - abs(i) + 1; j++)
		{
			if (i != 0 || j != 0)
			{
				if (mp_grid_path(global.grid, path, x, y, x + i * global.sprite_size, y + j * global.sprite_size, 0))
				{
					if (path_get_number(path) < MP + 2)
					{
						instance_create_layer(x + i * global.sprite_size, y + j * global.sprite_size,"moves_layer",obj_possible_move);
					}
				}

			}
		}
	}
}
