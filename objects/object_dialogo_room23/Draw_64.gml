if (mostrar) {

    draw_set_alpha(0.85);
    draw_set_color(c_black);
    draw_rectangle(150, 800, 1770, 1010, false);

    draw_set_alpha(1);
    draw_set_color(c_white);

    switch (dialogo) {

        case 1:
            draw_text(200, 840, "FEITICEIRA");
            draw_text(200, 890, "Entao voce conseguiu chegar ate aqui.");
        break;


        case 2:
            draw_text(200, 840, "ASSASSINO");
            draw_text(200, 890, "Vim terminar o trabalho.");
        break;


        case 3:
            draw_text(200, 840, "FEITICEIRA");
            draw_text(200, 890, "E trouxe exatamente o que eu precisava.");
        break;


        case 4:
            draw_text(200, 840, "ASSASSINO");
            draw_text(200, 890, "O anel...");
        break;


        case 5:
            draw_text(200, 840, "FEITICEIRA");
            draw_text(200, 890, "Voce realmente achou que essa missao");
            draw_text(200, 925, "era sobre uma divida?");
        break;


        case 6:
            draw_text(200, 840, "ASSASSINO");
            draw_text(200, 890, "O que voce fez?");
        break;


        case 7:
            draw_text(200, 840, "FEITICEIRA");
            draw_text(200, 890, "Apenas esperei que alguem desesperado");
            draw_text(200, 925, "trouxesse minha liberdade ate mim.");
        break;

    }

    draw_set_color(c_ltgray);
draw_text(1300, 970, "SPACE para continuar");
draw_text(1600, 970, "[ESC] PULAR");
}