///path_finder_grid_neighbours_directional_constraints_8(grid,x,y,constraints)
/*
** Returns a ds_list of all the neighbours of the given cell that can be travelled too.
**
**
*/

var NeighbourList = ds_list_create() ;
var Current = path_finder_grid_cell_get_id(argument0,argument1,argument2) ;


//var SM = ds_map_find_value(argument3,ds_grid_get(argument0,argument1,argument2)) ;
var SM = argument3[?argument0[#argument1,argument2]] ;

//show_debug_message(SM) ;

if (ds_exists(SM,ds_type_map))
    {
   
    
    //var U = ds_map_find_value(SM,"UP") ;
    //var D = ds_map_find_value(SM,"DOWN") ;
    //var R = ds_map_find_value(SM,"RIGHT") ;
    //var L = ds_map_find_value(SM,"LEFT") ;
    //var TR = ds_map_find_value(SM,"TOPRIGHT") ;
    //var TL = ds_map_find_value(SM,"TOPLEFT") ;
    //var DL = ds_map_find_value(SM,"DOWNLEFT") ;
    //var DR = ds_map_find_value(SM,"DOWNRIGHT") ;
    var U = SM[?"UP"] ;
    var D = SM[?"DOWN"] ;
    var R = SM[?"RIGHT"] ;
    var L = SM[?"LEFT"] ;
    var TR = SM[?"TOPRIGHT"] ;
    var TL = SM[?"TOPLEFT"] ;
    var DL = SM[?"DOWNLEFT"] ;
    var DR = SM[?"DOWNRIGHT"] ;
    }
else
    {
    var U = true ;
    var D = true ;
    var R = true ;
    var L = true ;
    var TR = true ;
    var TL = true ;
    var DR = true ;
    var DL = true ;
    }
//show_debug_message("Up : " + string(U) + "Down : " + string(D) + "Right : " + string(R)+ "Left : " + string(L))    
var W =  ds_grid_width(argument0) ;
    
for(var i = 0 ; i < 8 ; i++)
    {
    if ( (R*(i==0) + TR*(i==1) + U*(i==2) + TL*(i==3) + L*(i==4) + DL*(i==5) + D*(i==6) + DR*(i==7)) )
        {
        var X = argument1 + sign(lengthdir_x(1,45*i)) ;
        var Y = argument2 + sign(lengthdir_y(1,45*i)) ;
        if (path_finder_grid_in_bounds(argument0,X,Y))
            {
            if (path_finder_grid_cell_passable(argument0,X,Y))
                {
                ds_list_add(NeighbourList,X + W*Y) ;
                }
            }
        }
    
    }
    
return NeighbourList ; 