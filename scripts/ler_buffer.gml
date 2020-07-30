///ler_buffer(buffer)

buffer_seek(argument0,buffer_seek_start,0)

switch (buffer_read(argument0,buffer_u8)) {
    
    case 0:
        //Autenticação
        var name = buffer_read(argument0,buffer_string);
        
        if texto == "Servidor" {
            buffer_seek(buffer, buffer_seek_start, 0);
            buffer_write(buffer,buffer_u8,2);
            buffer_write(buffer,buffer_u8,ds_list_size(obj_controle.jogadores));
            for(i=0;i<ds_list_size(obj_controle.jogadores);i++) {
                buffer_write(buffer,buffer_string,obj_controle.jogadores[| i]);
            }
            
            buffer_write(buffer,buffer_u8,ds_list_size(obj_controle.jogadores));
            for(i=0;i<ds_list_size(obj_controle.jogadores);i++) {
                buffer_write(buffer,buffer_u8,(obj_controle.bots[| i] != 0));
            }
            
            network_send_packet(async_load[? "id"],buffer,buffer_tell(buffer));
        }
        
        ds_list_add(obj_controle.jogadores,name);
        ds_list_add(obj_controle.bots,0);
        
        if texto == "Servidor" {
            buffer_seek(buffer, buffer_seek_start, 0);
            buffer_write(buffer,buffer_u8,0);
            buffer_write(buffer,buffer_string,name);
            
            for(i=0;i<ds_list_size(crientes);i++) {
                network_send_packet(crientes[| i],buffer,buffer_tell(buffer));
            }
        }
        
    break;
    
    case 1:
        var quad = buffer_read(argument0,buffer_u8);
    
        var xx = buffer_read(argument0,buffer_u16);
        var yy = buffer_read(argument0,buffer_u16);
        
        colide_empty((xx div 32)*32,(yy div 32)*32);

        if !quad {
            create_quadrado((xx div 32)*32,(yy div 32)*32,(xx div 32)*32 + 32,(yy div 32)*32 + 32,obj_controle.jogador,1)
            obj_controle.quads[obj_controle.jogador]--;
        }
        else {
            create_triangulo((xx div 32)*32,(yy div 32)*32,(xx div 32)*32 + 32,(yy div 32)*32 + 32,obj_controle.jogador,1)
        }
        obj_controle.jogador = circular(obj_controle.jogador+1,0,obj_controle.numjog-1);
        
        if texto == "Servidor" {
            buffer_seek(buffer, buffer_seek_start,0);
            buffer_write(buffer,buffer_u8,1);
            buffer_write(buffer,buffer_u8,quad);
            buffer_write(buffer,buffer_u16,xx);
            buffer_write(buffer,buffer_u16,yy);
        
            for(i=0;i<ds_list_size(crientes);i++) {
                network_send_packet(crientes[| i],buffer,buffer_tell(buffer));
            }
        }
        
        checa_bot();
    break;
    
    case 2:
        var numb1 = buffer_read(argument0,buffer_u8);
         for(i=0;i<numb1;i++) {
            var str = buffer_read(argument0,buffer_string);
            ds_list_add(obj_controle.jogadores,str);
         }
         
         var numb2 = buffer_read(argument0,buffer_u8);
         for(i=0;i<numb2;i++) {
            var bola = buffer_read(argument0,buffer_u8);
            ds_list_add(obj_controle.bots,bola);
         }
    break;
    
    case 3:
        with obj_controle {
            Estado = "game";
            ready = false;
            start = true;
            
            active_player = ds_list_find_index(jogadores,obj_network.client_name);
            
            numjog = ds_list_size(jogadores);
            inflas = numjog div 2;
            
                with obj_botao {
                    instance_destroy();
                }
                
            m_counter = 0
            audio_sound_gain(global.musica_menu,0,500);
            global.musica = audio_play_sound(musics[| m_counter].music,1,0)
            audio_sound_gain(global.musica,0,0);
            audio_sound_gain(global.musica,1,2500);
            audio_sound_gain(global.musica_menu,0,500);
            
            alarm[3] = 90;
        }
    break;
    
    case 4:
        with base {
            infla(obj_controle.xc,obj_controle.yc);
        }
        
        obj_controle.jogador = circular(obj_controle.jogador+1,0,obj_controle.numjog-1);
        obj_controle.ready = false;
        obj_controle.alarm[0] = 45;    
        obj_controle.inflas--;
        
        if texto == "Servidor" {
            buffer_seek(buffer, buffer_seek_start,0);
            buffer_write(buffer,buffer_u8,4);
        
            for(i=0;i<ds_list_size(crientes);i++) {
                network_send_packet(crientes[| i],buffer,buffer_tell(buffer));
            }
        }
    break;
    
    case 5:
        error = instance_create(0,0,obj_neterror);
        error.txt = "Player Disconnected.#Aborting...";
            
        network_destroy(client);
    break;
    
    case 6:
        if texto == "Servidor" {
            buffer_seek(buffer, buffer_seek_start,0);
            buffer_write(buffer,buffer_u8,6);
            network_send_packet(async_load[? "id"],buffer,buffer_tell(buffer));
        }
        else {
            alarm[4] = -1;
        }
    break;
    
    case 7:
        var full = buffer_read(argument0,buffer_u8);
        if full {
            txt_netw = "Server Full";
            network_destroy(client);
        }
        else {
            texto = "Cliente";
            txt_netw = "Connected.";
            ins = instance_create(gw/2,gh/2,obj_instexto);
            ins.txt = "Nickname:";
            ins.scr = nick_client;
            ins.free = 1;
        }
    break;
    
    case 8:
        var bol = buffer_read(argument0,buffer_u8);
        
        if !bol {
            add_bot_client();
        }
        else {
            clear_bots_client();
        }
        
    break;
    
    case 9:
        var indi = buffer_read(argument0,buffer_u8);
        ds_list_delete(obj_controle.jogadores,indi);
    break;
    
}
