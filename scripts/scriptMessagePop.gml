if !ds_queue_empty(global.NewMessage)
{var a, b;
 a = ds_queue_dequeue(global.NewMessage);
 
 ds_grid_resize(global.Message, ds_grid_width(global.Message), ds_grid_height(global.Message) + 1);
 b = ds_grid_height(global.Message) - 1;
 ds_grid_set(global.Message, 0, b, MessageTimeout);
 ds_grid_set(global.Message, 1, b, a);
 alarm[1] = MessageAlarm;}
