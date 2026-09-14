event_inherited();

// =====================================
// ESQUELETO 3 - CONFIGURAÇÕES
// =====================================

// Movimento
vel_x = 0;
vel_y = 0;

velocidade_andando = 0.8;
velocidade_correndo = 2;

gravidade = 0.4;
velocidade_max_queda = 8;


// =====================================
// DISTÂNCIAS
// =====================================

distancia_detectar = 200;
distancia_atacar = 40;


// =====================================
// PATRULHA
// =====================================

x_inicial = x;
distancia_patrulha = 140;

direcao = 1;


// =====================================
// DEFESA
// =====================================

defendendo = false;


// =====================================
// ESTADO INICIAL
// =====================================

estado = "patrulhando";


// =====================================
// SPRITE INICIAL
// =====================================

sprite_index = sprite_esqueleto3_parado;
image_speed = 1;

som_esqueleto = audio_play_sound(esqueletos_caminhando, 1, true);
audio_sound_gain(som_esqueleto, 0.35, 0);