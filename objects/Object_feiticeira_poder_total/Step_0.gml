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
// DISTÂNCIA DO JOGADOR
// =====================================

var distancia = abs(jogador.x - x);


// =====================================
// TEMPO ENTRE ATAQUES
// =====================================

if (tempo_entre_ataques > 0) {
    tempo_entre_ataques--;
}


// =====================================
// SE A VIDA ACABOU
// =====================================

if (vida <= 0) {

    // Cria a segunda fase na mesma posição
    instance_create_layer(
        x,
        y,
        layer,
        object_feiticeira_enfraquecida
    );

    // Remove a fase atual
    instance_destroy();

    exit;
}


// =====================================
// DEFINE A DIREÇÃO
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

if (ataque_em_andamento) {

    // Mantém o ataque atual até a animação terminar

}
else if (distancia <= distancia_corpo_a_corpo
&& tempo_entre_ataques <= 0) {

    estado = "corpo_a_corpo";

}
else if (distancia <= distancia_magia
&& tempo_entre_ataques <= 0) {

    // Escolhe aleatoriamente entre duas magias
    if (irandom(1) == 0) {
        estado = "magia_cajado";
    }
    else {
        estado = "raios";
    }

}
else if (distancia <= distancia_detectar) {

    estado = "correndo";

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

        if (sprite_index != sprite_feiticeira_parada_total) {
            sprite_index = sprite_feiticeira_parada_total;
            image_index = 0;
        }

        image_speed = 1;

    break;


    // -------------------------
    // CORRENDO
    // -------------------------
    case "correndo":

        vel_x = direcao * velocidade_correndo;

        if (sprite_index != sprite_feiticeira_correndo_total) {
            sprite_index = sprite_feiticeira_correndo_total;
            image_index = 0;
        }

        image_speed = 1;

    break;


    // -------------------------
    // ATAQUE CORPO A CORPO
    // -------------------------
    case "corpo_a_corpo":

        vel_x = 0;

        if (!ataque_em_andamento) {

            ataque_em_andamento = true;
            ja_atacou = false;

            sprite_index = sprite_feiticeira_ataque_corpo_a_corpo_total;
            image_index = 0;
            image_speed = 1;
        }


        // Momento do golpe
        if (image_index >= 2 && !ja_atacou) {

            if (abs(jogador.x - x)
            <= distancia_corpo_a_corpo + 20) {

                jogador.vida -= dano;

                jogador.tomando_dano = true;
                jogador.tempo_dano = 8;

                ja_atacou = true;
            }
        }


        // Finaliza o ataque
        if (image_index >= image_number - 1) {

            ataque_em_andamento = false;
            ja_atacou = false;

            tempo_entre_ataques = tempo_espera_ataque;

            estado = "parada";
        }

    break;


    // -------------------------
    // MAGIA DO CAJADO
    // -------------------------
    case "magia_cajado":

        vel_x = 0;

        if (!ataque_em_andamento) {

            ataque_em_andamento = true;
            ja_atacou = false;

            sprite_index = sprite_feiticeira_magia_cajado_total;
            image_index = 0;
            image_speed = 1;
        }


        // Por enquanto o dano é direto
        if (image_index >= 3 && !ja_atacou) {

            if (abs(jogador.x - x) <= distancia_magia) {

                jogador.vida -= dano;

                jogador.tomando_dano = true;
                jogador.tempo_dano = 8;

                ja_atacou = true;
            }
        }


        if (image_index >= image_number - 1) {

            ataque_em_andamento = false;
            ja_atacou = false;

            tempo_entre_ataques = tempo_espera_ataque;

            estado = "parada";
        }

    break;


    // -------------------------
    // INVOCAÇÃO DE RAIOS
    // -------------------------
    case "raios":

        vel_x = 0;

        if (!ataque_em_andamento) {

            ataque_em_andamento = true;
            ja_atacou = false;

            sprite_index = sprite_feiticeira_invocacao_raios_total;
            image_index = 0;
            image_speed = 1;
        }


        // Por enquanto o raio acerta se estiver no alcance
        if (image_index >= 3 && !ja_atacou) {

            if (abs(jogador.x - x) <= distancia_magia) {

                jogador.vida -= dano + 1;

                jogador.tomando_dano = true;
                jogador.tempo_dano = 8;

                ja_atacou = true;
            }
        }


        if (image_index >= image_number - 1) {

            ataque_em_andamento = false;
            ja_atacou = false;

            tempo_entre_ataques = tempo_espera_ataque;

            estado = "parada";
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