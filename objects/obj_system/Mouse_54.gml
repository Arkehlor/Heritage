/// @description Modifies the terrain

if keyboard_check(vk_f1)  // if the F1 key is pressed
{
	
	var _snapx = (mouse_x >> global.power_sprite_size); // get the coordinates of the grid that the mouse is on
	var _snapy = (mouse_y >> global.power_sprite_size);
	
	var _inst = instance_position(mouse_x, mouse_y, obj_wall); // check for an obj_wall at the coordinates
	
	if instance_exists(_inst) // if there is one
	{
		mp_grid_clear_cell(global.grid, _snapx, _snapy); // get rid of it as an obstacle
		instance_destroy(_inst);
	}
	else // if there is none
	{
		_inst = instance_create_layer(_snapx << global.power_sprite_size, _snapy << global.power_sprite_size, "wall_layer", obj_wall); // Create one at the coordinates of the mouse
		
		with (_inst) // within this new wall
	    {
			mp_grid_add_instances(global.grid, id, false); // add it to the obstacles
	    }
	}
}