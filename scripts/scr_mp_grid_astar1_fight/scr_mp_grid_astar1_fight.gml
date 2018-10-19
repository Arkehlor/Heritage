/// @function scr_mp_grid_astar1(grid, path, x_start, y_start, x_goal, y_goal, xstart, ystart, hcells, vcells, cellwidth, cellheight);

/// @description Finds and creates the shortes path from the start position to the goal position.
// The path is created using the given mp_grid and is stored to the given path index.
// Note: This overwrites any existing path stored in the index.

/// @param {grid} grid             = Index of the mp_grid that is to be used.
/// @param {path} path             = Index of the path that path is to be stored to.
/// @param {real} x_start          = Starting x-coordinate to go from.
/// @param {real} y_start          = Starting y-coordinate to go from.
/// @param {real} x_goal           = Destination x-coordinate to go to.
/// @param {real} y_goal           = Destination y-coordinate to go to.

// The following arguments should match the same as those used to create the original grid.
// I know... Blame yoyo, no get methods for mp_grid to acquire these.

/// @param  {real} xstart        = Starting x coordinate of the mp_grid in the room.
/// @param  {real} ystart        = Starting y coordinate of the mp_grid in the room.
/// @param  {int} hcells        = Number of horizontal cells that the mp_grid will contain.
/// @param  {int} vcells        = Number of vertical cells that the mp_grid will contain.
/// @param  {real} cellwidth     = The width (in pixels) of each individual cell of the mp_grid.
/// @param  {real} cellheight    = The height (in pixels) of each individual cell of the mp_grid.

//@Return: Boolean if path was successfully created.

//Converts arguments to locals.
var grid = argument0;
var path = argument1;
var x1 = argument2;
var y1 = argument3;
var x2 = argument4;
var y2 = argument5;
var grid_x = argument6;
var grid_y = argument7;
var hcells = argument8;
var vcells = argument9;
var cellwidth = argument10;
var cellheight = argument11;

//Converts x/y coordinates to grid indexes.
var x1 = floor((x1 / cellwidth));
var y1 = floor((y1 / cellheight));
var x2 = floor((x2 / cellwidth));
var y2 = floor((y2 / cellheight));

//Clears path of existing points.
path_clear_points(path);
path_set_closed(path, false);

//Initialize ds_grid from mp_grid.
var ds_grid = ds_grid_create(hcells, vcells);
mp_grid_to_ds_grid(grid, ds_grid);

//Check if target is within grid.
if (x1 > hcells or x1 < 0) or (y1 > vcells or y1 < 0)
{
    //Clean-Up Leaks
    ds_grid_destroy(ds_grid);
 
    //Return False
    return false;
}

//Check if target is same as start.
if x1 = x2 and y1 = y2
{
    //Clean-Up Leaks
    ds_grid_destroy(ds_grid);
 
    //Return False
    return false;
}

//Check if target is in a closed cell.
if ds_grid_get(ds_grid, x2, y2) = -1
{
    //Clean-Up Leaks
    ds_grid_destroy(ds_grid);
 
    //Return False
    return false;
}

//Initialize Node Containers.
var list_closed = ds_list_create();
var list_open = ds_priority_create();

//Creates initial node.
var node_start = ds_list_create();
var parent = noone;
var cost = 0;
var distance = floor((point_distance(x1, y1, x2, y2)) + 0.5);
var value = cost + distance;
ds_list_add(node_start, x1, y1, parent, cost, distance, value);

//Adds initial node to open list.
ds_priority_add(list_open, node_start, value);

//Loops until open list is empty.
while !ds_priority_empty(list_open)
{
    //Finds lowest cost open node.
    var node = ds_priority_delete_min(list_open);
 
    //Setup local variables used in loop.
    var xx, yy, i, i2;
    var angle = 0;
 
    //Enters loop to create 8 succesors.
    for (i = 0; i < 4; i++)
    {
        //Gets variables from node.
        var nx = ds_list_find_value(node, 0);
        var ny = ds_list_find_value(node, 1);
     
        //Calculates Coordinates.
        xx = floor((nx + lengthdir_x(1, angle)) + 0.5);
        yy = floor((ny + lengthdir_y(1, angle)) + 0.5);
        angle += 90;    
     
        //Validates coordinates are within grid bounds.
        if (xx > hcells or xx < 0) or (yy > vcells or yy < 0)
        {
            //Enters next loop.
            continue;
        }
     
        //Creates succesor.
        var succesor = ds_list_create();
        parent = node;
        cost = 10;
        distance = floor(point_distance(xx, yy, x2, y2) + 0.5);
        value = cost + distance;
        ds_list_add(succesor, xx, yy, parent, cost, distance, value);
     
        //Check if succesor is in a closed cell.
        if ds_grid_get(ds_grid, xx, yy) = -1
        {
            //Destroy the succesor.
            ds_list_destroy(succesor);
         
            //Enters next loop.
            continue;
        }    
     
        //Check if node is the goal.
        if xx = x2 and yy = y2
        {          
            //Creates path list.
            var list_path = ds_list_create();
            var node_path = succesor;
            var parent = ds_list_find_value(node_path, 2);
            ds_list_add(list_path, node_path);
         
            //Traces parents back to initial node.
            while node_path != node_start
            {
                parent = ds_list_find_value(node_path, 2);
                ds_list_add(list_path, parent);
                node_path = parent;
            }
         
            //Creates the path from the path list.
            for (i2 = ds_list_size(list_path) - 1; i2 >= 0; i2--)
            {
                var node_point = ds_list_find_value(list_path, i2);
                var xx = (grid_x + (ds_list_find_value(node_point, 0) * cellwidth)) + cellwidth / 2;
                var yy = (grid_y + (ds_list_find_value(node_point, 1) * cellheight)) + cellheight / 2;
                path_add_point(path, xx, yy, 100);
            }
         
            //Clean-Up Leaks
            ds_grid_destroy(ds_grid);
            ds_list_destroy(list_path);
            ds_list_destroy(node);
            ds_list_destroy(succesor);
         
            //Loops through closed list.
            for (i2 = 0; i2 < ds_list_size(list_closed); i2++)
            {
                //Cleans up leaks.
                var obj = ds_list_find_value(list_closed, i2);
                ds_list_destroy(obj);
            }
         
            //Loops through open list.
            var size = ds_priority_size(list_open);
            for (i2 = 0; i2 < size; i2++)
            {
                //Cleans up leaks.
                var obj = ds_priority_delete_min(list_open);
                ds_list_destroy(obj);
            }
         
            //Destroys lists.
            ds_list_destroy(list_closed);
            ds_priority_destroy(list_open);
         
            //Return True
            return true;
        }
     
        //Creates a copy of open list to sweep through.
        var list_open_copy = ds_priority_create();
        ds_priority_copy(list_open_copy, list_open);
        var size = ds_priority_size(list_open_copy);
     
        //Creates a continue check boolean, for nested loops.
        var continue_check = false;
     
        //Check if node with same position is in the open list.
        for (i2 = 0; i2 < size; i2++)
        {
            //Gets values from current index.
            var obj = ds_priority_delete_min(list_open_copy);
            var obj_x = ds_list_find_value(obj, 0)
            var obj_y = ds_list_find_value(obj, 1)
            var obj_value = ds_list_find_value(obj, 5)
         
            //Check if same posotion.
            if obj_x = xx and obj_y = yy
            {
                //Check if value of obj is lower then succesor.
                if obj_value < value
                {
                    //Destroy the succesor.
                    ds_list_destroy(succesor);
                 
                    //Updates continue check to skip loop.
                    continue_check = true;
                    break;
                }
                else
                {
                    //Update object with succesor values.
                    ds_list_replace(succesor, 2, ds_list_find_value(obj, 2));
                    ds_list_replace(succesor, 3, ds_list_find_value(obj, 3));
                    ds_list_replace(succesor, 4, ds_list_find_value(obj, 4));
                    ds_list_replace(succesor, 5, ds_list_find_value(obj, 5));
                 
                    //Destroy the succesor.
                    ds_list_destroy(succesor);
                 
                    //Updates continue check to skip loop.
                    continue_check = true;
                    break;
                }
            }
        }
     
        //Deletes copy of open list.
        ds_priority_destroy(list_open_copy);
     
        //Check if should continue.
        if continue_check
        {
            continue;
        }
     
        //Check if node with same position is in the closed list.
        for (i2 = 0; i2 < ds_list_size(list_closed); i2++)
        {
            //Gets values from current index.
            var obj = ds_list_find_value(list_closed, i2);
            var obj_x = ds_list_find_value(obj, 0)
            var obj_y = ds_list_find_value(obj, 1)
         
            //Check if same posotion.
            if obj_x = xx and obj_y = yy
            {
                //Destroy the succesor.
                ds_list_destroy(succesor);
             
                //Updates continue check to skip loop.
                continue_check = true;
                break;
            }
        }
     
        //Check if should continue.
        if continue_check
        {
            continue;
        }

        //Add succesor to open list.
        ds_priority_add(list_open, succesor, value);
    }
 
    //Adds node to closed list.
    ds_list_add(list_closed, node);
}

//Exhausted all nodes.

//Clean-Up Leaks
ds_grid_destroy(ds_grid);

//Loops through closed list.
for (i2 = 0; i2 < ds_list_size(list_closed); i2++)
{
    var obj = ds_list_find_value(list_closed, i2);
    ds_list_destroy(obj);
}

//Destroys lists.
ds_list_destroy(list_closed);
ds_priority_destroy(list_open);

//Return True
return false;