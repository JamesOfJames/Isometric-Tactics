///demo_path_finder_grid_define_constrained(Grid)
var W = ds_grid_width(argument0) ;
var H = ds_grid_height(argument0) ;

//Borders
for(var i = 0 ; i < W ; i++)
    {
    for(var j =0 ; j < H ; j++)
        {
        if (i==0) || (i== (W-1)) || (j==0) || ( j== (H-1))
            {
            path_finder_grid_cell_set_wall(argument0,i,j) ;
            }
        }
    }


path_finder_grid_instance_set_as_index(argument0,32,32,32,obj_one_way_door,2) ;
path_finder_grid_instance_set_as_wall(argument0,32,32,32,obj_wall) ;
