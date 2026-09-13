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


// ANIMAÇÕES
if (!no_chao) {

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


// SE CAIR PARA FORA DA ROOM
if (y > room_height + 100) {

    if (variable_global_exists("spawn_x")) {
        x = global.spawn_x;
        y = global.spawn_y;
    }

    vel_x = 0;
    vel_y = 0;
}