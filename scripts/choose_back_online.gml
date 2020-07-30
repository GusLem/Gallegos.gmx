///choose_back_online()

with obj_network {
    if texto == "Servidor" {
        network_destroy(server);
    }
    if texto == "Cliente" {
        network_destroy(client);
    }
}

bob = instance_create(0,0,obj_trans);
bob.rmm = rm_menu
