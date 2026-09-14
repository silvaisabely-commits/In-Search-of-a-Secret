event_inherited();

// =====================================
// BOSS GOBLIN - CONFIGURAÇÕES
// =====================================

// Vida
vida = 10;
vida_max = 10;

// Dano
dano = 2;


// =====================================
// MOVIMENTO
// =====================================

vel_x = 0;
vel_y = 0;

velocidade_andando = 0.8;
velocidade_correndo = 1.8;

gravidade = 0.4;
velocidade_max_queda = 8;


// =====================================
// DISTÂNCIAS
// =====================================

distancia_detectar = 260;
distancia_atacar = 55;


// =====================================
// PATRULHA
// =====================================

x_inicial = x;
distancia_patrulha = 100;

direcao = 1;


// =====================================
// ESTADO INICIAL
// =====================================

estado = "patrulhando";


// =====================================
// SPRITE INICIAL
// =====================================

sprite_index = sprite_boos_globin_parado;
image_speed = 1;
// Máscara fixa de colisão
mask_index = sprite_boos_globin_parado;

som_boss_goblin = audio_play_sound(boos_goblin, 1, true);
audio_sound_gain(som_boss_goblin, 0.35, 0);