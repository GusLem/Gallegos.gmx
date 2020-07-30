///create_quadrado(x1,y1,x2,y2)

var obj;

obj = instance_create(0,0,obj_quadrado)
obj.x1 = argument0
obj.y1 = argument1
obj.x2 = argument2
obj.y2 = argument3

obj.x1v = argument0
obj.y1v = argument1
obj.x2v = argument2
obj.y2v = argument3

obj.jogador = argument4
obj.tilto = argument5

with obj {
    for(i=0;i<5;i++) {
        for(j=0;j<5;j++) {
            create_empty(x1-64+(i*32),y1-64+(j*32),x1-32+(i*32),y1-32+(j*32),1)
        }
    }
}

return obj;
