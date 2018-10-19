/// @function                   scr_snap_center_cell(coordinate, cell_size);
/// @param  {real}  coordinate	The coordinate that you want to snap
/// @param  {real}  cell_size	The size of the cells you want to snap to the center of
/// @description                Returns snapped coordinates to the center of a cell

var _co = argument0;
var _cs = argument1;

return (_co div _cs) * _cs + _cs / 2;
