/// @description Insert description here

x = scr_snap_center_cell(x, 16);
y = scr_snap_center_cell(y, 16);

path = path_add(); // create a path for the player
path_set_kind(path, 0); // make the path a rigid one