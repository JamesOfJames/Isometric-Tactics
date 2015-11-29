///path_finder_list_to_path(Graph,Path List,CellSize,XOffset,YOffset)

var Graph  = argument0 ;
var PathList = argument1 ;
var Path = path_add() ;
var Size = ds_list_size(PathList) ;


var CS = argument2 ;
var XO = argument3 ;
var YO = argument4 ;

for ( var i = 0 ; i < Size ; i++)
    {
    //var C = ds_list_find_value(PathList,(Size-1)- i) ;
    var C = PathList[| Size-1-i]
    show_debug_message(C) ;
    var X = path_finder_grid_cell_get_x(Graph,C) ;
    var Y = path_finder_grid_cell_get_y(Graph,C) ;
    path_add_point(Path,(X+0.5)*CS + XO,(Y+0.5)*CS + YO,100)

     }
     
return Path ;