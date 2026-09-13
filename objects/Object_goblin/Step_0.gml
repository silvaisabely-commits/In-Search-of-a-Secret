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

if (vida <= 0) {
    estado = "morrendo";
}
else if (distancia <= distancia_atacar) {
    estado = "atacando";
}
else if (distancia <= distancia_detectar) {
    estado = "correndo";
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

        // Limites da patrulha
        if (x >= x_inicial + distancia_patrulha) {
            direcao = -1;
        }

        if (x <= x_inicial - distancia_patrulha) {
            direcao = 1;
        }

        image_xscale = direcao;

        if (sprite_index != sprite_goblin_caminhando) {
            sprite_index = sprite_goblin_caminhando;
            image_index = 0;
        }

        image_speed = 0.25;

    break;


    // -------------------------
    // CORRENDO ATRÁS DO PLAYER
    // -------------------------
    case "correndo":

        if (jogador.x > x) {
            direcao = 1;
        }
        else {
            direcao = -1;
        }

        vel_x = direcao * velocidade_correndo;

        image_xscale = direcao;

        if (sprite_index != sprite_goblin_correndo) {
            sprite_index = sprite_goblin_correndo;
            image_index = 0;
        }

        image_speed = 0.30;

    break;


    // -------------------------
// ATACANDO
// -------------------------
case "atacando":

    vel_x = 0;

    // Olha para o jogador
    if (jogador.x > x) {
        direcao = 1;
    }
    else {
        direcao = -1;
    }

    image_xscale = direcao;


    // Troca para animação de ataque
    if (sprite_index != sprite_goblin_atacando) {

        sprite_index = sprite_goblin_atacando;

        image_index = 0;

        ja_atacou = false;
    }

    image_speed = 0.25;


    // =====================================
    // MOMENTO EM QUE O ATAQUE ACERTA
    // =====================================

    if (image_index >= 2 && !ja_atacou) {

        if (point_distance(x, y, jogador.x, jogador.y)
        <= distancia_atacar + 10) {

            jogador.vida -= dano;

            ja_atacou = true;
        }
    }


    // Quando a animação termina,
    // permite um novo ataque
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

        if (sprite_index != sprite_goblin_morrendo) {
            sprite_index = sprite_goblin_morrendo;
            image_index = 0;
        }

        image_speed = 0.15;

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