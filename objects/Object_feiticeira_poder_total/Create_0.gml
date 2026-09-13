event_inherited();

// =====================================
// FEITICEIRA - FASE 1
// =====================================

// Vida
vida = 20;
vida_max = 20;

// Dano base
dano = 2;


// =====================================
// MOVIMENTO
// =====================================

vel_x = 0;
vel_y = 0;

velocidade_correndo = 2;

gravidade = 0.4;
velocidade_max_queda = 8;


// =====================================
// DISTÂNCIAS
// =====================================

distancia_detectar = 350;
distancia_corpo_a_corpo = 70;
distancia_magia = 260;


// =====================================
// ESTADO
// =====================================

estado = "parada";

direcao = 1;


// =====================================
// CONTROLE DE ATAQUES
// =====================================

ataque_em_andamento = false;
tipo_ataque = "";

tempo_entre_ataques = 0;
tempo_espera_ataque = 45;


// =====================================
// SPRITE INICIAL
// =====================================

sprite_index = sprite_feiticeira_parada_total;
image_speed = 1;


// =====================================
// MÁSCARA FIXA
// =====================================

mask_index = sprite_feiticeira_parada_total;

image_xscale = 1.15;
image_yscale = 1.15;