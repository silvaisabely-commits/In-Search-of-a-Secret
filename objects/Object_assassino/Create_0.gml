global.dialogo_aberto = false;
// =====================================
// MOVIMENTO
// =====================================

vel_x = 0;
vel_y = 0;

velocidade = 4;
forca_pulo = -10;
gravidade = 0.5;

velocidade_max_queda = 12;

altura_degrau = 8;


// =====================================
// VIDA
// =====================================

vida_max = 15;
vida = vida_max;


// =====================================
// SPRITE / COLISÃO
// =====================================

mask_index = sprite_assassino;

image_speed = 0.15;


// =====================================
// COMBATE
// =====================================

atacando = false;

dano = 3;

ja_acertou = false;


// =====================================
// DANO RECEBIDO
// =====================================

tomando_dano = false;
tempo_dano = 0;


// =====================================
// MORTE
// =====================================

morrendo = false;
protegido_porta = 0;

// Garante que a variável existe desde o início do jogo
if (!variable_global_exists("tem_anel")) {
    global.tem_anel = false;
}

if (!variable_global_exists("aviso_tempo")) {
    global.aviso_tempo = 0;
    global.aviso_texto = "";
}