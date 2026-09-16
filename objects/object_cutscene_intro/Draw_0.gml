// =====================================
// CUTSCENE - DESENHAR TEXTO
// =====================================

var texto_atual = textos[dialogo];
var nome_atual = nomes[dialogo];


// =====================================
// CONFIGURAÇÃO
// =====================================

draw_set_color(c_black);
draw_set_halign(fa_left);
draw_set_valign(fa_top);


// =====================================
// POSIÇÃO DO TEXTO
// =====================================

var texto_x = 520;
var texto_y = 815;

var largura_texto = 650;


// =====================================
// TAMANHO DO TEXTO
// =====================================

// 1 = tamanho normal
// 1.5 = 50% maior
var escala_texto = 1.5;


// =====================================
// NOME
// =====================================

if (nome_atual != "") {

    draw_text_transformed(
        texto_x,
        texto_y,
        nome_atual,
        escala_texto,
        escala_texto,
        0
    );
}


// =====================================
// TEXTO COM EFEITO DE DIGITAÇÃO
// =====================================

var texto_mostrado = string_copy(
    texto_atual,
    1,
    floor(caracteres_visiveis)
);

draw_text_ext_transformed(
    texto_x,
    texto_y + 45,
    texto_mostrado,
    24,
    largura_texto,
    escala_texto,
    escala_texto,
    0
);


// =====================================
// ESPAÇO
// =====================================

if (pode_avancar) {

    draw_set_halign(fa_right);

    draw_text_transformed(
        1250,
        950,
        "[ESPACO]",
        1.3,
        1.3,
        0
    );
}


// =====================================
// RESTAURA CONFIGURAÇÕES
// =====================================

draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);