event_inherited();

// =====================================
// PROCURA O JOGADOR
// =====================================

var jogador = instance_nearest(x, y, object_assassino);


// =====================================
// GRAVIDADE
// =====================================

vel_y += gravidade;
vel_y = min(vel_y, velocidade_max_queda);


// =====================================
// DISTÂNCIA HORIZONTAL
// =====================================

var distancia = abs(jogador.x - x);


// =====================================
// TEMPO ENTRE ATAQUES
// =====================================

if (tempo_entre_ataques > 0) {
    tempo_entre_ataques--;
}


// =====================================
// DIREÇÃO
// =====================================

if (jogador.x > x) {
    direcao = 1;
}
else {
    direcao = -1;
}

image_xscale = direcao * 1.15;


// =====================================
// DEFINE O ESTADO
// =====================================

if (morrendo) {

    estado = "morrendo";

}
else if (ataque_em_andamento) {

    // Mantém o ataque atual até terminar

}
else if (distancia <= distancia_atacar
&& tempo_entre_ataques <= 0) {

    estado = "atacando";

}
else if (distancia <= distancia_detectar) {

    estado = "caminhando";

}
else {

    estado = "parada";
}


// =====================================
// COMPORTAMENTO
// =====================================

switch (estado) {

    // -------------------------
    // PARADA
    // -------------------------
    case "parada":

        vel_x = 0;

        if (sprite_index != sprite_feiticeira_enfraq_parada) {

            sprite_index = sprite_feiticeira_enfraq_parada;
            image_index = 0;
        }

        image_speed = 1;

    break;


    // -------------------------
    // CAMINHANDO
    // -------------------------
    case "caminhando":

        vel_x = direcao * velocidade_caminhando;

        if (sprite_index != sprite_feiticeira_enfraq_caminhando) {

            sprite_index = sprite_feiticeira_enfraq_caminhando;
            image_index = 0;
        }

        image_speed = 1;

    break;


    // -------------------------
    // ATACANDO
    // -------------------------
    case "atacando":

        vel_x = 0;

        // Começa o ataque apenas uma vez
        if (!ataque_em_andamento) {

            ataque_em_andamento = true;
            ja_atacou = false;

            sprite_index = sprite_feiticeira_enfraq_ataque_cajado;
            image_index = 0;
            image_speed = 1;
        }


        // =====================================
        // MOMENTO DO GOLPE
        // =====================================

        if (image_index >= 2 && !ja_atacou) {

            if (abs(jogador.x - x)
            <= distancia_atacar + 20) {

                jogador.vida -= dano;

                jogador.tomando_dano = true;
                jogador.tempo_dano = 8;

                ja_atacou = true;
            }
        }


        // =====================================
        // TERMINA O ATAQUE
        // =====================================

        if (image_index >= image_number - 1) {

            ataque_em_andamento = false;
            ja_atacou = false;

            tempo_entre_ataques = tempo_espera_ataque;

            estado = "parada";
        }

    break;


    // -------------------------
    // MORRENDO
    // -------------------------
    case "morrendo":

        vel_x = 0;

        if (sprite_index != sprite_feiticeira_morrendo) {

            sprite_index = sprite_feiticeira_morrendo;
            image_index = 0;
            image_speed = 1;
        }


        // Quando a animação terminar,
        // remove a feiticeira
        if (image_index >= image_number - 1) {

            instance_destroy();
        }

    break;
}


// =====================================
// COLISÃO HORIZONTAL
// =====================================

if (vel_x != 0) {

    if (place_meeting(x + vel_x, y, object_chao)) {

        while (!place_meeting(x + sign(vel_x), y, object_chao)) {
            x += sign(vel_x);
        }

        vel_x = 0;
    }
}

x += vel_x;


// =====================================
// COLISÃO VERTICAL
// =====================================

if (vel_y != 0) {

    if (place_meeting(x, y + vel_y, object_chao)) {

        while (!place_meeting(x, y + sign(vel_y), object_chao)) {
            y += sign(vel_y);
        }

        vel_y = 0;
    }
}

y += vel_y;	