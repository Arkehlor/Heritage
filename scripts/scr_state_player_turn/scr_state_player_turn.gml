/// @function                   scr_state_player_turn();
/// @description                The turn of the player

if (mouse_check_button_pressed(mb_left)) // If the player presses the left mouse button
{
	with (obj_player)
	{
		scr_navigate(x, y, path, movspeed, scr_snap_center_cell(mouse_x, global.sprite_size), scr_snap_center_cell(mouse_y, global.sprite_size));
		// Moves him to where he clicked on the grid
	}
	
}