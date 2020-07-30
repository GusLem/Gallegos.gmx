///infla(xc,yc)

x1 += (x1-argument0);
x2 += (x2-argument0);
y1 += (y1-argument1);
y2 += (y2-argument1);

if object_index == obj_empty {
    create_empty(x1,y1,x1+32,y1+32,40);
    create_empty(x1+32,y1,x1+64,y1+32,40);
    create_empty(x1,y1+32,x1+32,y1+64,40);
    create_empty(x1+32,y1+32,x1+64,y1+64,40);

    alarm[1] = 45;
}
