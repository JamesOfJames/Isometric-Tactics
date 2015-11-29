///path_finder_path_to_goal(Paths,Start,Goal) 
/*
** Paths is the path map returned by any of the search scripts
**
**
** Returns a ds_list with the cells to travel through to get from the start cell to the goal cell
** First entry in the list is the start and the last is the goal position.
*/

var Paths = argument0 ;
var Const = ds_map_size(Paths) ;

var SC = argument1 ;
var EC = argument2 ;

//var Next = ds_map_find_value(Paths,EC) ;
var Next = Paths[? EC]
var Pre  = Next ;


//Construct a list of cells to visit
var List = ds_list_create() ;
ds_list_add(List,EC) ;
ds_list_add(List,Pre) ;
var i = 0 ;
do
    {
    Pre = Next ;
    if (ds_map_exists(Paths,Pre))
        {
        //Next = ds_map_find_value(Paths,Pre) ;
       Next = Paths[? Pre] ;
        }

    if (Pre == SC) 
        {
        var OldList = List ;
        List = ds_list_reverse(List) ;
        ds_list_destroy(OldList) ;
        return List ;
        }
        
        ds_list_add(List,Next) ;
    i++
    }
until (Pre == SC)|| i > Const

ds_list_destroy(List)
return -1 ;