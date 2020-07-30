with obj_controle {
    if ds_list_size(jogadores) < 4 {
        ds_list_add(jogadores, "Bot " + string(++b_counter));
        cria_bot();
        if online {
            with obj_network {
                buffer_seek(buffer, buffer_seek_start, 0);
                buffer_write(buffer,buffer_u8,8);
                buffer_write(buffer,buffer_u8,0);
                for(i=0;i<ds_list_size(crientes);i++) {
                    network_send_packet(crientes[| i],buffer,buffer_tell(buffer));
                }
            }
        }
    }
}
