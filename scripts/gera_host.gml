with obj_network {
    namos = other.str;
    ds_list_add(obj_controle.jogadores,namos);
    ds_list_add(obj_controle.bots,0);
    
    with obj_botao {
        if !back {
            instance_destroy();
        }
    }
    
    bob = instance_create(gw-200,300,obj_botao);
    bob.txt = "Start Game";
    bob.scr = start_game2;
    
    bob = instance_create(gw-200,100,obj_botao);
    bob.txt = "Add Bot";
    bob.scr = add_bot;
    bob = instance_create(gw-200,200,obj_botao);
    bob.txt = "Clear Bots";
    bob.scr = clear_bots;
}
