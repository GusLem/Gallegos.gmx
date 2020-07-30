///tilta_cam(xx,yy)

if point_distance(argument0,argument1,view_xview+view_wview/2,view_yview+view_hview/2) > 300 {
    with obj_controle { 
        ready = false
        guided = true;
        xt = argument0
        yt = argument1
        
        ang = point_direction(xt,yt,xv,yv)
        dis = point_distance(xt,yt,xv,yv)
    }
    return true;
}
return false;
