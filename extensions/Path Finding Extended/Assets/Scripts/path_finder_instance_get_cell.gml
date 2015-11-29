///path_finder_instance_get_cell(Inst,Graph,CellSize,XOffset,YOffset) 

var I = argument0 ;
var Graph = argument1 ;
var CS = argument2 ;
var XO = argument3 ;
var YO = argument4 ;

var C = -1;

if (instance_exists(I))
    {
    var X = round((I.x - XO)/CS) ;
    var Y = round((I.y - YO)/CS) ;
    if (path_finder_grid_in_bounds(Graph,X,Y))
        {
        C = path_finder_grid_cell_get_id(Graph,X,Y) ;
        }
    }
    
return C ;