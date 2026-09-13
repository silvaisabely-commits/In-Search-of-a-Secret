// =====================================
// CONTROLES
// =====================================

var direita  = keyboard_check(ord("D"));
var esquerda = keyboard_check(ord("A"));

vel_x = (direita - esquerda) * velocidade;


// Virar personagem
if (vel_x > 0) {
    image_xscale = 1;
}

if (vel_x < 0) {
    image_xscale = -1;
}


// =====================================
// VERIFICA SE ESTÁ NO CHÃO
// =====================================

var no_chao = place_meeting(x, y + 1, Object_chao);


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

// Limite para velocidade de queda
vel_y = min(vel_y, velocidade_max_queda);


// =====================================
// COLISÃO HORIZONTAL
// =====================================

if (place_meeting(x + vel_x, y, Object_chao)) {

    while (!place_meeting(x + sign(vel_x), y, Object_chao)) {
        x += sign(vel_x);
    }

    vel_x = 0;
}

x += vel_x;


// =====================================
// COLISÃO VERTICAL
// =====================================

if (place_meeting(x, y + vel_y, Object_chao)) {

    while (!place_meeting(x, y + sign(vel_y), Object_chao)) {
        y += sign(vel_y);
    }

    vel_y = 0;
}

y += vel_y;


// Atualiza depois da movimentação
no_chao = place_meeting(x, y + 1, Object_chao);


// =====================================
// ANIMAÇÕES
// =====================================

if (!no_chao) {

    if (sprite_index != sprite_assassino_pulando) {
        sprite_index = sprite_assassino_pulando;
        image_index = 0;
    }

}
else if (vel_x != 0) {

    if (sprite_index != sprite_assassino_andando) {
        sprite_index = sprite_assassino_andando;
        image_index = 0;
    }

}
else {

    if (sprite_index != sprite_assassino) {
        sprite_index = sprite_assassino;
        image_index = 0;
    }

}