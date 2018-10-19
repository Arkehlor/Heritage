/// @function                   scr_navigate_fight(start_x, start_y, path, finish_x, finish_y);
/// @param  {real}  start_x     The start X position for the path
/// @param  {real}  start_y     The start Y position for the path
/// @param  {path}  path		The path that needs to be changed then followed
/// @param	{real}	speed		The speed at which the path must be followed
/// @param  {real}  finish_x    The finish X position for the path
/// @param  {real}  finish_y    The finish Y position for the path
/// @description                Create a path between two points using the path passed in parameter
///								and the MP grid stored in global variables then follows it
                           

var _sx = argument0;
var _sy = argument1;
var _p	= argument2;
var _s	= argument3;
var _fx = argument4;
var _fy = argument5;

if (mp_grid_path(global.grid, _p, _sx, _sy, _fx, _fy, 0)) // if a path has been found
{
	path_start(_p, _s, path_action_stop, 1) // follow the path
	return true;
}
else // if no path has been found
{
	show_debug_message("ERROR: mp_grid_define_path() - No path created"); 
	return false;
}