// CONTROLES
var direita = keyboard_check(ord("D"));
var esquerda = keyboard_check(ord("A"));

vel_x = (direita - esquerda) * velocidade;


// VIRAR PERSONAGEM
if (vel_x > 0) image_xscale = 1;
if (vel_x < 0) image_xscale = -1;


// VERIFICA CHÃO
var no_chao = place_meeting(x, y + 1, Object_colisao_chao);


// PULO
if (keyboard_check_pressed(vk_space) && no_chao) {
    vel_y = forca_pulo;
}


// GRAVIDADE
vel_y += gravidade;
vel_y = min(vel_y, velocidade_max_queda);


// COLISÃO HORIZONTAL
if (place_meeting(x + vel_x, y, Object_colisao_chao)) {

    while (!place_meeting(x + sign(vel_x), y, Object_colisao_chao)) {
        x += sign(vel_x);
    }

    vel_x = 0;
}

x += vel_x;


// COLISÃO VERTICAL
if (place_meeting(x, y + vel_y, Object_colisao_chao)) {

    while (!place_meeting(x, y + sign(vel_y), Object_colisao_chao)) {
        y += sign(vel_y);
    }

    vel_y = 0;
}

y += vel_y;


// ATUALIZA CHÃO
no_chao = place_meeting(x, y + 1, Object_colisao_chao);

// =====================================
// ATAQUE
// =====================================

if (keyboard_check_pressed(ord("E")) && !atacando) {

    atacando = true;
    ja_acertou = false;

    sprite_index = sprite_assassino_ataque2;
    image_index = 0;
    image_speed = 0.8;
}

// =====================================
// ANIMAÇÕES
// =====================================

if (atacando) {

    // Enquanto estiver atacando, mantém
    // sprite_assassino_ataque2.
    // Não troca para pulo, corrida ou parado.

}
else if (!no_chao) {

    if (sprite_index != sprite_assassino_pulando) {
        sprite_index = sprite_assassino_pulando;
        image_index = 0;
        image_speed = 0.15;
    }

}
else if (vel_x != 0) {

    if (sprite_index != sprite_assassino_correndo) {
        sprite_index = sprite_assassino_correndo;
        image_index = 0;
        image_speed = 0.18;
    }

}
else {

    if (sprite_index != sprite_assassino) {
        sprite_index = sprite_assassino;
        image_index = 0;
        image_speed = 0.15;
    }

}

// =====================================
// DANO DO ATAQUE
// =====================================

if (atacando) {

    // O golpe acerta no quadro 4 da animação
    if (image_index >= 3 && !ja_acertou) {

        var alcance_ataque = 45;

        var alvo = instance_nearest(x, y, object_goblin);

        if (instance_exists(alvo)) {

            var distancia_alvo = point_distance(x, y, alvo.x, alvo.y);

            if (distancia_alvo <= alcance_ataque) {

                // Goblin precisa estar na frente do assassino
                if (
                    (image_xscale == 1 && alvo.x > x)
                    ||
                    (image_xscale == -1 && alvo.x < x)
                ) {

                    alvo.vida -= dano;

                    ja_acertou = true;
                }
            }
        }
    }


    // Finaliza o ataque quando a animação termina
    if (image_index >= image_number - 1) {

        atacando = false;
        ja_acertou = false;

        image_index = 0;
    }
}

// SE CAIR PARA FORA DA ROOM
if (y > room_height + 100) {

    if (variable_global_exists("spawn_x")) {
        x = global.spawn_x;
        y = global.spawn_y;
    }

    vel_x = 0;
    vel_y = 0;
}