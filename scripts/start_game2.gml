with obj_controle {
    if ds_list_size(jogadores) > 1 and obj_network.texto = "Servidor" {
         Estado = "game";
         ready = false;
         start = true;
                
         numjog = ds_list_size(jogadores);
         inflas = numjog div 2;
                
         with obj_network {
            event_user(2);
         }
         
         active_player = 0;
         
         with obj_botao {
                instance_destroy();
            }
            
        m_counter = 0
        audio_sound_gain(global.musica_menu,0,500);
        global.musica = audio_play_sound(musics[| m_counter].music,1,0)
        audio_sound_gain(global.musica,0,0);
        audio_sound_gain(global.musica,1,2500);
        
        alarm[3] = 90;
    }
}
