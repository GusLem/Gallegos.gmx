with obj_controle {
    if ds_list_size(jogadores) < 4 {
        ds_list_add(jogadores, "Player " + string(++p_counter));
        ds_list_add(bots,0);
    }
}
