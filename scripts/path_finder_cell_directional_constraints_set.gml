///path_finder_cell_directional_constraints_set(Constraint Map,Cell,Up,Down,Left,Right)

var M = argument0 ;

var U = argument2 ;
var D = argument3 ;
var L = argument4 ;
var R = argument5 ;


var C = argument1 ;

//show_debug_message(string(U)+string(D)+string(R)+string(L)) ;



if (!ds_map_exists(M,C))
    {
    var SM = ds_map_create() ;
    ds_map_add(SM,"UP",U) ;
    ds_map_add(SM,"DOWN",D) ;
    ds_map_add(SM,"RIGHT",R) ;
    ds_map_add(SM,"LEFT",L) ;

    ds_map_add(M,C,SM) ;
    }
else
    {
    var SM = ds_map_find_value(M,C) ;
    ds_map_replace(SM,"UP",U) ;
    ds_map_replace(SM,"DOWN",D) ;
    ds_map_replace(SM,"RIGHT",R) ;
    ds_map_replace(SM,"LEFT",L) ;

    }
