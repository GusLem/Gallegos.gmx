///colide_empty(x1,y1)

with obj_empty {
    if x1 == argument0 and y1 == argument1 {
        instance_destroy();
        return true;
    }
}
return false;
