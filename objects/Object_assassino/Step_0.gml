if (room == Room25_mission_completed) {
    exit;
}

if (protegido_porta > 0) {
    protegido_porta--;
}

// =====================================
// MORTE DO PLAYER
// =====================================

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
// VERIFICA SE ALGUM DIÁLOGO ESTÁ ABERTO
// =====================================

global.dialogo_aberto = false;

if (instance_exists(object_bardo) && object_bardo.falando) {
    global.dialogo_aberto = true;
}

if (instance_exists(object_dialogo_room05) && object_dialogo_room05.mostrar) {
    global.dialogo_aberto = true;
}

if (instance_exists(object_dialogo_room06) && object_dialogo_room06.mostrar) {
    global.dialogo_aberto = true;
}

if (instance_exists(object_dialogo_room10) && object_dialogo_room10.mostrar) {
    global.dialogo_aberto = true;
}

if (instance_exists(object_dialogo_room11) && object_dialogo_room11.mostrar) {
    global.dialogo_aberto = true;
}

if (instance_exists(object_dialogo_room14) && object_dialogo_room14.mostrar) {
    global.dialogo_aberto = true;
}

if (instance_exists(object_dialogo_room17) && object_dialogo_room17.mostrar) {
    global.dialogo_aberto = true;
}

if (instance_exists(object_dialogo_room20) && object_dialogo_room20.mostrar) {
    global.dialogo_aberto = true;
}

if (instance_exists(object_dialogo_room22) && object_dialogo_room22.mostrar) {
    global.dialogo_aberto = true;
}

if (instance_exists(object_dialogo_room23) && object_dialogo_room23.mostrar) {
    global.dialogo_aberto = true;
}

if (instance_exists(object_cutscene_intro)) {
    global.dialogo_aberto = true;
}


// =====================================
// PULO
// =====================================

if (keyboard_check_pressed(vk_space) && no_chao && !global.dialogo_aberto) {
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

    audio_play_sound(espada_cortante, 1, false);
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
    }

    image_speed = 0.5;
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

                if (
                    (image_xscale == 1 && alvo.x > x)
                    ||
                    (image_xscale == -1 && alvo.x < x)
                ) {

                    alvo.vida -= dano;

                    alvo.tomando_dano = true;
                    alvo.tempo_dano = 8;

                    ja_acertou = true;
                }
            }
        }
    }


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
// Conta o tempo do aviso na tela
if (global.aviso_tempo > 0) {
    global.aviso_tempo--;
}