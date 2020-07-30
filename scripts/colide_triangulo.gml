///colide_triangulo(x1,y1,circ)
with obj_circulo {
    if x1 == argument0 and y1 == argument1 and id != other.id {
        return false;
    }
}

with obj_triangulo {
    if (x2-x1) > 32 {continue;}

    var circ;
    if argument2 {
        circ = (jogador == other.target);
    }
    else {
        circ = (jogador != other.jogador);
    }
    if x1 == argument0 and y1 == argument1 and circ {
        other.target_num = jogador;
        return true;
    }
}

with obj_quadrado {
    if (x2-x1) > 32 {continue;}
    
    if argument2 {
        if x1 == argument0 and y1 == argument1 and (jogador == other.target) {
            other.quad_value = 3;
            return true;
        }
    }
}

return false;
