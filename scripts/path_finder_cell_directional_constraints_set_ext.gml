///path_finder_cell_directional_constraints_set_ext(Constraint Map,Cell,Right,TopRight,Top,TopLeft,Left,BottomLeft,Bottom,BottomRight)

var M = argument0 ;

var R = argument2 ;
var TR = argument3 ;
var T = argument4 ;
var TL = argument5 ;
var L = argument6 ;
var BL = argument7 ;
var B = argument8 ;
var BR = argument9 ;


var C = argument1 ;

//show_debug_message(string(U)+string(D)+string(R)+string(L)) ;



if (!ds_map_exists(M,C))
    {
    var SM = ds_map_create() ;
    ds_map_add(SM,"UP",T) ;
    ds_map_add(SM,"DOWN",B) ;
    ds_map_add(SM,"RIGHT",R) ;
    ds_map_add(SM,"LEFT",L) ;
    ds_map_add(SM,"TOPRIGHT",TR) ;
    ds_map_add(SM,"TOPLEFT",TL) ;
    ds_map_add(SM,"DOWNLEFT",BL) ;
    ds_map_add(SM,"DOWNRIGHT",BR) ;
    
    
    ds_map_add(M,C,SM) ;
    }
else
    {
    var SM = ds_map_find_value(M,C) ;
    ds_map_replace(SM,"UP",T) ;
    ds_map_replace(SM,"DOWN",B) ;
    ds_map_replace(SM,"RIGHT",R) ;
    ds_map_replace(SM,"LEFT",L) ;
    ds_map_replace(SM,"TOPRIGHT",TR) ;
    ds_map_replace(SM,"TOPLEFT",TL) ;
    ds_map_replace(SM,"DOWNLEFT",BL) ;
    ds_map_replace(SM,"DOWNRIGHT",BR) ;
    }
