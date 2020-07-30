///create_circulo(x1,y1,x2,y2,target,value)

var obj;

obj = instance_create(0,0,obj_circulo);
obj.x1 = argument0;
obj.y1 = argument1;
obj.x2 = argument2;
obj.y2 = argument3;

obj.x1v = argument0;
obj.y1v = argument1;
obj.x2v = argument2;
obj.y2v = argument3;

obj.target = argument4;
obj.jogador = argument5;

obj.value = argument6

return obj;
