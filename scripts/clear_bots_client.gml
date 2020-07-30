with obj_controle {
    i = 0;
    while(i < ds_list_size(bots)) {
        if bots[| i] != 0 {
            ds_list_delete(jogadores,i);
            ds_list_delete(bots,i);
        }
        else {
            i++;
        }
    }
}
