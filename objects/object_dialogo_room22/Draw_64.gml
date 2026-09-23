if (!mostrar) exit;


// FUNDO DO DIALOGO
draw_set_alpha(0.85);
draw_set_color(c_black);
draw_rectangle(150, 800, 1770, 1010, false);

draw_set_alpha(1);
draw_set_color(c_white);


// FALAS
switch (dialogo) {

    case 1:
        draw_text(200, 840, "ESQUELETO");
        draw_text(200, 890, "Espere...");
    break;


    case 2:
        draw_text(200, 840, "ASSASSINO");
        draw_text(200, 890, "Voce... fala?");
    break;


    case 3:
        draw_text(200, 840, "ESQUELETO");
        draw_text(200, 890, "O objeto que voce procura...");
        draw_text(200, 925, "Nao entregue a ela.");
    break;


    case 4:
        draw_text(200, 840, "ASSASSINO");
        draw_text(200, 890, "A feiticeira?");
    break;


    case 5:
        draw_text(200, 840, "ESQUELETO");
        draw_text(200, 890, "Ela precisa dele.");
        draw_text(200, 925, "Foi por isso que voce chegou ate aqui.");
    break;


    case 6:
        draw_text(200, 840, "ASSASSINO");
        draw_text(200, 890, "Eu apenas tenho uma divida a cumprir.");
    break;


    case 7:
        draw_text(200, 840, "ESQUELETO");
        draw_text(200, 890, "Entao voce ainda nao entendeu...");
    break;


    case 8:
        draw_text(200, 840, "ESQUELETO");
        draw_text(200, 890, "Voce nao esta levando o anel para ela.");
        draw_text(200, 925, "Voce esta libertando ela.");
    break;
}

// INSTRUCAO
// INSTRUCAO
draw_set_color(c_ltgray);
draw_text(1300, 960, "SPACE para continuar");
draw_text(1600, 960, "[ESC] PULAR");