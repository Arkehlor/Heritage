/// @description Insert description here

var _width = camera_get_view_width(0);
var _height = camera_get_view_height(0);

draw_set_alpha(1);
draw_set_color(c_black);

draw_rectangle(0, _height - (20 / 161 * _width), 1 / 5 * _width, _height, 0); // character info mockup

draw_rectangle(4 / 5 * _width, _height - (1 / 5 * _width), _width, _height, 0); // map mockup

draw_rectangle(23 / 100 * _width, _height - (16 / 161 * _width), 23 / 100 * _width  , _height - (4 / 161 * _width), 0);	


if (o_pressed)
{
	draw_set_alpha(0.75);
	draw_rectangle(0, 0, 1 / 5 * _width, 6 / 9 * _height, 0); // enemy turn
}

if(enemy_hover)
{
	draw_set_alpha(0.75);
	draw_rectangle(4 /  5 * _width, 1 / 40 * _height, _width, 1.61 / 5 * _width + 1 / 40 * _height, 0);	// enemy info mockup
}

draw_set_alpha(1);