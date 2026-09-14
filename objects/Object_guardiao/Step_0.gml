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
// DISTÂNCIA HORIZONTAL DO JOGADOR
// =====================================

var distancia = abs(jogador.x - x);


// =====================================
// DEFINE O ESTADO
// =====================================

if (morrendo) {
    estado = "morrendo";
}
else if (distancia <= distancia_atacar) {
    estado = "atacando";
}
else {
    estado = "parado";
}


// =====================================
// COMPORTAMENTO
// =====================================

switch (estado) {

    // -------------------------
    // PARADO
    // -------------------------
    case "parado":

        vel_x = 0;

        if (jogador.x > x) {
            direcao = 1;
        }
        else {
            direcao = -1;
        }

        image_xscale = direcao;

        if (sprite_index != sprite_guardiao_parado) {
            sprite_index = sprite_guardiao_parado;
            image_index = 0;
        }

        image_speed = 1;

    break;


    // -------------------------
    // ATACANDO
    // -------------------------
    case "atacando":

        vel_x = 0;

        if (jogador.x > x) {
            direcao = 1;
        }
        else {
            direcao = -1;
        }

        image_xscale = direcao;

        if (sprite_index != sprite_guardiao_ataque) {
            sprite_index = sprite_guardiao_ataque;
            image_index = 0;
            ja_atacou = false;
        }

        image_speed = 1;


        // Momento do golpe
        if (image_index >= 2 && !ja_atacou) {

            if (abs(jogador.x - x) <= distancia_atacar + 20) {

                jogador.vida -= dano;

                jogador.tomando_dano = true;
                jogador.tempo_dano = 8;

                ja_atacou = true;
            }
        }


        // Reinicia o ataque
        if (image_index >= image_number - 1) {

            ja_atacou = false;
            image_index = 0;
        }

    break;


    // -------------------------
    // MORRENDO
    // -------------------------
    case "morrendo":

        vel_x = 0;

        if (sprite_index != sprite_guardiao_morrendo) {
            sprite_index = sprite_guardiao_morrendo;
            image_index = 0;
            image_speed = 1;
        }

        if (image_index >= image_number - 1) {
			if (variable_instance_exists(id, "som_guardiao")) {
				audio_stop_sound(som_guardiao);
			}
			
            instance_destroy();
        }

    break;
}


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