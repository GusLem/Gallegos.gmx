with obj_controle {
    ds_list_clear(jogadores);
    for(i=0;i<ds_list_size(bots);i++) {
        if bots[| i] != 0 {
            with bots[| i] {
                instance_destroy();
            }
        }
    }
    ds_list_clear(bots);
    
    p_counter = 0;
    b_counter = 0;
}
