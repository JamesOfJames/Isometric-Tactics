///demo_path_finder_grid_define(Grid)
var W = ds_grid_width(argument0) ;
var H = ds_grid_height(argument0) ;

// Create a border
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

// Make a random cell into a wall
for (var i = 0 ; i < 120 ; i++)
    {
    var C = irandom(W*H) ;
    var X = path_finder_grid_cell_get_x(argument0,C) ;
    var Y = path_finder_grid_cell_get_y(argument0,C) ;
    path_finder_grid_cell_set_wall(argument0,X,Y) ;
    }

// Make some water cells    
for (var i = 0 ; i < 10 ; i++)
    {
    var X = irandom_range(1,W-2) ;
    var Y = irandom_range(1,H-2) ;
    
    ds_grid_set(argument0,X,Y,-1) ;
    }
