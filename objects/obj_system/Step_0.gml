/// @description Insert description here

if (position_meeting(mouse_x, mouse_y, obj_possible_move)) // If the mouse hovers a possible move tile
{
	with (obj_possible_move) // Withing all of the possible move tiles
	{
		image_blend = -1; // Resets hue
	}

	with (obj_player) // Within the player
	{
		mp_grid_path(global.grid, path, x, y, scr_snap_center_cell(mouse_x, global.sprite_size), scr_snap_center_cell(mouse_y, global.sprite_size), 0);
		// Try to compute a path from the player to the mouse
		
		for (var i = 0; i < MP + 1; i++) // for as many times as movement points the player has
		{
			var _inst = instance_position(path_get_x(path, i / MP), path_get_y(path, i / MP), obj_possible_move);
			// Checks which possible move tile the path computed goes through
			
			with (_inst) // Within this specific tile
			{
				image_blend = c_lime; // Color it
			}
		}
	}
}
else
{
	with (obj_possible_move) // Withing all of the possible move tiles
	{
		image_blend = -1; // Resets hue
	}	
}

if (keyboard_check_pressed(vk_backspace)) // If the player presses backspace, skip turn
{
	alarm[3] = 1;
	alarm[1] = -1;
	alarm[2] = -1;
}

if (keyboard_check_pressed(vk_space)) // If the player presses space, skip turn part
{
	switch (global.state)
	{
		case states.rush :
			alarm[1] = 1;
			break;
		
		case states.norm :
			alarm[2] = 1;
			break;
			
		case states.prep :
			alarm[3] = 1;
			break;
	}
}