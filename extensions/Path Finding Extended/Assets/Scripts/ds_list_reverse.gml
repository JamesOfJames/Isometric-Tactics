///ds_list_reverse(list)

var L = argument0 ;
var LS = ds_list_size(L) ;
var TS = ds_list_create() ;

for(var i = 0 ; i < LS ; i++)
    {
    //ds_list_add(TS,ds_list_find_value(L,(LS-1)-i)) ;
    ds_list_add(TS,L[|LS-1-i]) ;
    }
    
return TS ;