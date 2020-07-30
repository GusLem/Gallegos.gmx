with obj_network {
    var port = 7405;

    server = network_create_server(network_socket_tcp, port, 4);
    texto = "Servidor";
    ins = instance_create(gw/2,gh/2,obj_instexto);
    ins.txt = "Nickname:";
    ins.scr = gera_host;
    ins.free = 1; 
}
