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

var distancia = point_distance(x, y, jogador.x, jogador.y);


// =====================================
// DEFINE O ESTADO
// =====================================

if (morrendo) {
    estado = "morrendo";
}
else if (distancia <= distancia_atacar) {
    estado = "atacando";
}
else if (distancia <= distancia_detectar) {
    estado = "perseguindo";
}
else {
    estado = "patrulhando";
}


// =====================================
// COMPORTAMENTO
// =====================================

switch (estado) {

    // -------------------------
    // PATRULHANDO
    // -------------------------
    case "patrulhando":

        vel_x = direcao * velocidade_andando;

        if (x >= x_inicial + distancia_patrulha) {
            direcao = -1;
        }

        if (x <= x_inicial - distancia_patrulha) {
            direcao = 1;
        }

        image_xscale = direcao;

        if (sprite_index != sprite_boos_globin_caminhando) {
            sprite_index = sprite_boos_globin_caminhando;
            image_index = 0;
        }

        image_speed = 1;

    break;


    // -------------------------
    // PERSEGUINDO
    // -------------------------
    case "perseguindo":

        if (jogador.x > x) {
            direcao = 1;
        }
        else {
            direcao = -1;
        }

        vel_x = direcao * velocidade_correndo;

        image_xscale = direcao;

        if (sprite_index != sprite_boos_globin_caminhando) {
            sprite_index = sprite_boos_globin_caminhando;
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

        if (sprite_index != sprite_boos_globin_atacando) {
            sprite_index = sprite_boos_globin_atacando;
            image_index = 0;
            ja_atacou = false;
        }

        image_speed = 1;


        // Momento do golpe
        if (image_index >= 2 && !ja_atacou) {

            if (point_distance(x, y, jogador.x, jogador.y)
            <= distancia_atacar + 10) {

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

        if (sprite_index != sprite_boos_globin_morrendo) {
            sprite_index = sprite_boos_globin_morrendo;
            image_index = 0;
            image_speed = 1;
        }

        if (image_index >= image_number - 1) {
            if (variable_instance_exists(id, "som_boss_goblin")) {
				audio_stop_sound(som_boss_goblin);
			}
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
        direcao *= -1;
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