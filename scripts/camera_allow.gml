with base {
    if !(x1 > view_xview+view_wview+argument0 or
    y1 > view_yview+view_hview+argument1 or
    x2 < view_xview+argument0 or
    y2 < view_yview+argument1) {
        return true;
    }
}

return false;
