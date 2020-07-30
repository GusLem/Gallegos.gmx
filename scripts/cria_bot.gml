///cria_bot()

bob = instance_create(0,0,obj_bot);
bob.jogador = ds_list_size(bots);
ds_list_add(bots,bob);
