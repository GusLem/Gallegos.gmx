with obj_controle {
    var tenta = 0;

    i = 0;
    while(i < ds_list_size(bots)) {
        if bots[| i] != 0 {
            with bots[| i] {
                instance_destroy();
            }
            ds_list_delete(jogadores,i);
            ds_list_delete(bots,i);
            
            tenta = 1;
        }
        else {
            i++;
        }
    }
    
    if tenta and online {
            with obj_network {
                buffer_seek(buffer, buffer_seek_start, 0);
                buffer_write(buffer,buffer_u8,8);
                buffer_write(buffer,buffer_u8,1);
                for(i=0;i<ds_list_size(crientes);i++) {
                    network_send_packet(crientes[| i],buffer,buffer_tell(buffer));
                }
            }
    }
    
    b_counter = 0;
}
