event_inherited();

// =====================================
// FEITICEIRA - FASE 2 ENFRAQUECIDA
// =====================================

// Vida
vida = 12;
vida_max = 12;

// Ainda causa dano, mas está enfraquecida
dano = 2;


// =====================================
// MOVIMENTO
// =====================================

vel_x = 0;
vel_y = 0;

velocidade_caminhando = 1.3;

gravidade = 0.4;
velocidade_max_queda = 8;


// =====================================
// DISTÂNCIAS
// =====================================

distancia_detectar = 300;
distancia_atacar = 180;


// =====================================
// ATAQUE
// =====================================

ataque_em_andamento = false;

tempo_entre_ataques = 0;
tempo_espera_ataque = 60;


// =====================================
// ESTADO
// =====================================

estado = "parada";

direcao = 1;


// =====================================
// SPRITE
// =====================================

sprite_index = sprite_feiticeira_enfraq_parada;
image_speed = 1;


// =====================================
// TAMANHO
// =====================================

image_xscale = 1.15;
image_yscale = 1.15;


// =====================================
// MÁSCARA FIXA
// =====================================

mask_index = sprite_feiticeira_enfraq_parada;