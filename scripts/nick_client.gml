with obj_botao {
    if !back {
        instance_destroy();
    }
}
            
with obj_network {
    client_name = other.str;
    alarm[0] = 10;
    txt_netw = "";
}
