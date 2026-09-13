// =====================================
// MORTE DO PLAYER
// =====================================

// Começa a animação de morte
if (vida <= 0 && !morrendo) {

    morrendo = true;

    vel_x = 0;
    vel_y = 0;

    atacando = false;
    ja_acertou = false;

    image_blend = c_white;

    sprite_index = sprite_assassino_morrendo;
    image_index = 0;
    image_speed = 1;
}


// Enquanto estiver morrendo,
// não deixa executar movimento, ataque etc.
if (morrendo) {

    vel_x = 0;
    vel_y = 0;

    exit;
}


// =====================================
// CONTROLES
// =====================================

var direita = keyboard_check(ord("D"));
var esquerda = keyboard_check(ord("A"));

vel_x = (direita - esquerda) * velocidade;


// =====================================
// VIRAR PERSONAGEM
// =====================================

if (vel_x > 0) {
    image_xscale = 1;
}

if (vel_x < 0) {
    image_xscale = -1;
}


// =====================================
// VERIFICA CHÃO
// =====================================

var no_chao = place_meeting(
    x,
    y + 1,
    object_colisao_chao
);


// =====================================
// PULO
// =====================================

if (keyboard_check_pressed(vk_space) && no_chao) {
    vel_y = forca_pulo;
}


// =====================================
// GRAVIDADE
// =====================================

vel_y += gravidade;

vel_y = min(
    vel_y,
    velocidade_max_queda
);


// =====================================
// COLISÃO HORIZONTAL
// =====================================

if (place_meeting(
    x + vel_x,
    y,
    object_colisao_chao
)) {

    while (!place_meeting(
        x + sign(vel_x),
        y,
        object_colisao_chao
    )) {

        x += sign(vel_x);
    }

    vel_x = 0;
}

x += vel_x;


// =====================================
// COLISÃO VERTICAL
// =====================================

if (place_meeting(
    x,
    y + vel_y,
    object_colisao_chao
)) {

    while (!place_meeting(
        x,
        y + sign(vel_y),
        object_colisao_chao
    )) {

        y += sign(vel_y);
    }

    vel_y = 0;
}

y += vel_y;


// =====================================
// ATUALIZA CHÃO
// =====================================

no_chao = place_meeting(
    x,
    y + 1,
    object_colisao_chao
);


// =====================================
// ATAQUE
// =====================================

if (keyboard_check_pressed(ord("E")) && !atacando) {

    atacando = true;
    ja_acertou = false;

    sprite_index = sprite_assassino_ataque2;
    image_index = 0;
    image_speed = 1;
}


// =====================================
// ANIMAÇÕES
// =====================================

if (atacando) {

    // Mantém a animação de ataque

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

    // Golpe acerta no quadro 4
    if (image_index >= 3 && !ja_acertou) {

        var alcance_ataque = 100;

        var alvo = instance_nearest(
            x,
            y,
            object_inimigo
        );

        if (instance_exists(alvo)) {

            var distancia_alvo = point_distance(
                x,
                y,
                alvo.x,
                alvo.y
            );

            if (distancia_alvo <= alcance_ataque) {

                // Inimigo precisa estar na frente
                if (
                    (image_xscale == 1 && alvo.x > x)
                    ||
                    (image_xscale == -1 && alvo.x < x)
                ) {

                    // Tira vida
                    alvo.vida -= dano;

                    // Feedback visual
                    alvo.tomando_dano = true;
                    alvo.tempo_dano = 8;

                    // Evita múltiplos danos
                    // no mesmo ataque
                    ja_acertou = true;
                }
            }
        }
    }


    // Finaliza a animação de ataque
    if (image_index >= image_number - 1) {

        atacando = false;
        ja_acertou = false;

        image_index = 0;
    }
}


// =====================================
// FEEDBACK DE DANO
// =====================================

if (tomando_dano) {

    image_blend = c_red;

    tempo_dano--;

    if (tempo_dano <= 0) {

        tomando_dano = false;

        image_blend = c_white;
    }

}
else {

    image_blend = c_white;
}


// =====================================
// SE CAIR PARA FORA DA ROOM
// =====================================

if (y > room_height + 100) {

    if (variable_global_exists("spawn_x")) {

        x = global.spawn_x;
        y = global.spawn_y;
    }

    vel_x = 0;
    vel_y = 0;
}