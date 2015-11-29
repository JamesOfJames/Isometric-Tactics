///maze_generate(width,height,complexity,density)

var width = argument0 ;
var height = argument1 ;

var complexity = argument2 ;
var density = argument3 ;

// OnlYodd shapes

    shape[0] = floor(height / 2) * 2 + 1 ;
    shape[1] = floor(width / 2) * 2 + 1 ;
    
   
    // Adjust complexity and density relative to maze size
    complexity = (complexity* (5* (shape[0] + shape[1])))
    density    = (density* floor(shape[0] / 2) * floor(shape[1] / 2))
    
    
    // Build actual maze
    Z = ds_grid_create(shape[1],shape[0]) ;
    
    // Fill borders
    ds_grid_set_region(Z,0,0,shape[1]-1,shape[0]-1,1) ;
    ds_grid_set_region(Z,1,1,shape[1]-2,shape[0]-2,0) ;
    
    // Make aisles
    for (var i =0 ; i < density ; i++)
        { 
        
        var X =  irandom_range(0, floor(shape[1] /2)) * 2 ;
        var Y =  irandom_range(0, floor(shape[0] /2)) * 2 ;
        //ds_grid_set(Z,X,Y,1) ;
        Z[# X , Y] = 1 ;
        
        for (var j = 0 ; j < complexity ; j++)
            {
            neighbours = ds_list_create() ;
            
            if (X> 1) ds_list_add(neighbours,X-2 +Y*shape[1]) ;
            if (X< shape[1] - 2) ds_list_add(neighbours,X+2 + Y*shape[1]) ;
            if (Y> 1) ds_list_add(neighbours,X+ (Y-2)*shape[1]) ;
            if (Y< shape[0] - 2) ds_list_add(neighbours,X+ (Y+2)*shape[1]) ;
            
            var NS = ds_list_size(neighbours) ;
            
            if (NS > 0)
                {
                var Index = irandom_range(0,NS-1) ;
                y_ = floor(ds_list_find_value(neighbours,Index)/shape[1]) ;
                x_ = ds_list_find_value(neighbours,Index) mod shape[1] ;
                
                if (Z[#x_,y_] == 0)
                    {
                    //ds_grid_set(Z,x_,y_,1) ;
                    Z[#x_,y_] = 1 ;
                    //ds_grid_set(Z,x_ + floor((X- x_)/2),y_ + floor((Y- y_)/2),1) ;
                    Z[# x_ + floor((X - x_)/2),y + floor((Y  - y_)/2)] = 1 ;
                    X= x_ ;
                    Y= y_
                    }
                }
            ds_list_destroy(neighbours) ;
            }
                    
            }
            
return Z ;