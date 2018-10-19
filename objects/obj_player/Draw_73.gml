/// @description Draw the path of the player

if keyboard_check(vk_f2) // if the player holds the F2 key down
{
	draw_set_alpha(0.25); // set transparency
	draw_set_colour(c_white);
	
	mp_grid_draw(global.grid); // draw the grid : yes is accessible, red is an obstacle
	
	for (var i = 0; i < room_width; i += global.sprite_size;) // draw the grid
	{
	    draw_line_width(i, 0, i, room_height, 1);
	}
	
	for (var j = 0; j < room_width; j += global.sprite_size;) // same
	{
	    draw_line_width(0, j, room_width, j, 1);
	}
	
	draw_set_alpha(1);
	draw_set_color(c_white);
	draw_path(path, x, y, true); // draw the path
}   