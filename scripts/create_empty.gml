///create_empty(x1,y1,x2,y2,time)

with base {
    if object_index != obj_empty {
        if (x1 < argument2 && x2 > argument0 && y1 < argument3 && y2 > argument1)  {
            exit;
        }
    }
}

var obj;

obj = instance_create(0,0,obj_empty)
obj.x1 = argument0
obj.y1 = argument1
obj.x2 = argument2
obj.y2 = argument3

obj.x1v = argument0
obj.y1v = argument1
obj.x2v = argument2
obj.y2v = argument3

obj.alarm[0] = argument4

return obj;
