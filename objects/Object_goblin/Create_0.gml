temporizador_virada = 0;
event_inherited();

// =====================================
// GOBLIN - CONFIGURAÇÕES
// =====================================

// Movimento
vel_x = 0;
vel_y = 0;

velocidade_andando = 1;
velocidade_correndo = 2.5;

gravidade = 0.4;
velocidade_max_queda = 8;


// Distâncias
distancia_detectar = 180;      // distância para COMEÇAR a perseguir
distancia_desistir = 260;      // distância para PARAR de perseguir (maior, cria folga)
distancia_atacar = 35;


// Patrulha
estado_anterior = "patrulhando";
x_inicial = x;
distancia_patrulha = 120;

direcao = 1;


// Estado inicial
estado = "patrulhando";


// Sprite inicial
sprite_index = sprite_goblin_parado;
image_speed = 0.15;

som_goblin = audio_play_sound(goblins_falando, 1, true);
audio_sound_gain(som_goblin, 0.35, 0);