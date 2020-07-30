with obj_exitgame {
    if obj_controle.online {
        if obj_network.texto == "Servidor" {
            network_destroy(obj_network.server);
        }
        if obj_network.texto == "Cliente" {
            network_destroy(obj_network.client);
        }
    }
    leaving = true;
}
