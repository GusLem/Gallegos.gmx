///pessa_cor

switch jogador {

    case 0:
        cor = c_red; 
    break;
    
    case 1:
        cor = c_blue; 
    break;
    
    case 2:
        cor = c_green; 
    break;
    
    case 3:
        cor = c_yellow; 
    break; 

}

draw_set_color(cor)
return cor;
