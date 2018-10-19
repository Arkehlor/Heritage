/// @description Draws the timer on screen

var _w = camera_get_view_width(0);
var _h = camera_get_view_height(0);

var _upper_left_corner_x = 23 / 100 * _w;
var _upper_left_corner_y = 1 / 20 * _h;
var _lower_right_corner_x = 77 / 100 * _w - 1;
var _lower_right_corner_y = 7 / 80 * _h;

draw_set_alpha(0.8);
draw_set_color(c_black);
draw_rectangle(_upper_left_corner_x, _upper_left_corner_y, _lower_right_corner_x, _lower_right_corner_y, 0);

switch (global.state)
{
	case states.rush :
		draw_set_color(c_red);
		draw_rectangle(_upper_left_corner_x, _upper_left_corner_y, _upper_left_corner_x + (54 * _w / 100 * global.rush_time) * (timer / max_time), _lower_right_corner_y, 0);
		break;
		
	case states.norm :
		draw_set_color(c_blue);
		draw_rectangle(_upper_left_corner_x, _upper_left_corner_y, _upper_left_corner_x + (54 * _w / 100 * global.rush_time) + (54 * _w / 100 * global.norm_time) * (timer / max_time), _lower_right_corner_y, 0);
		break;
		
	case states.prep :
		draw_set_color(c_green);
		draw_rectangle(_upper_left_corner_x, _upper_left_corner_y, _upper_left_corner_x + (54 * _w / 100 * global.rush_time) + (54 * _w / 100 * global.norm_time) + (54 * _w / 100 * global.prep_time) * (timer / max_time), _lower_right_corner_y, 0);
		break;
}

draw_set_color(c_white);
draw_line_width(_upper_left_corner_x + (54 * _w / 100 * global.rush_time), _upper_left_corner_y, _upper_left_corner_x + (54 * _w / 100 * global.rush_time),  _lower_right_corner_y, 3);
draw_line_width(_upper_left_corner_x + (54 * _w / 100 * global.rush_time) + (54 * _w / 100 * global.norm_time), _upper_left_corner_y, _upper_left_corner_x + (54 * _w / 100 * global.rush_time) + (54 * _w / 100 * global.norm_time),  _lower_right_corner_y, 3);