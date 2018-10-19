/// @description Drraw the path of the enemy

if keyboard_check(vk_f3) // if the player holds the F1 key down
{	
	draw_set_alpha(1);
	draw_set_color(c_white);
	draw_path(path, x, y, true); // draw the path
} 