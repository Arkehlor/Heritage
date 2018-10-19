/// @description Insert description here

if (keyboard_check_pressed(ord("O")))
{
	o_pressed = !o_pressed;	
}

if (position_meeting(mouse_x, mouse_y, obj_enemy))
{
	enemy_hover = true;
}
else
{
	enemy_hover = false;	
}