// =====================================
// BARRA DE VIDA DO ASSASSINO
// =====================================

// Posição da barra
var barra_x = 30;
var barra_y = 30;

// Tamanho
var largura = 200;
var altura = 20;


// =====================================
// GARANTE QUE A VIDA NÃO PASSE DOS LIMITES
// =====================================

vida = clamp(vida, 0, vida_max);


// =====================================
// PORCENTAGEM DE VIDA
// =====================================

var porcentagem = vida / vida_max;


// =====================================
// FUNDO DA BARRA
// =====================================

draw_set_color(c_black);

draw_rectangle(
    barra_x - 3,
    barra_y - 3,
    barra_x + largura + 3,
    barra_y + altura + 3,
    false
);


// =====================================
// PARTE VAZIA
// =====================================

draw_set_color(c_dkgray);

draw_rectangle(
    barra_x,
    barra_y,
    barra_x + largura,
    barra_y + altura,
    false
);


// =====================================
// VIDA ATUAL
// =====================================

draw_set_color(c_red);

draw_rectangle(
    barra_x,
    barra_y,
    barra_x + (largura * porcentagem),
    barra_y + altura,
    false
);


// =====================================
// TEXTO
// =====================================

draw_set_color(c_white);

draw_text(
    barra_x,
    barra_y + altura + 6,
    "VIDA: " + string(vida) + " / " + string(vida_max)
);


// =====================================
// VOLTA A COR PARA BRANCO
// =====================================

draw_set_color(c_white);

// Mostra o aviso de item coletado
if (global.aviso_tempo > 0) {

    draw_set_alpha(0.85);
    draw_set_color(c_black);
    draw_rectangle(700, 100, 1220, 160, false);

    draw_set_alpha(1);
    draw_set_color(c_yellow);
    draw_set_halign(fa_center);

    draw_text_transformed(
        960,
        115,
        global.aviso_texto,
        1.8,
        1.8,
        0
    );

    draw_set_halign(fa_left);
    draw_set_color(c_white);
}