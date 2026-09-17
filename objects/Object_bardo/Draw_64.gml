if (!instance_exists(object_assassino)) exit;

var jogador = instance_find(object_assassino, 0);
var distancia = point_distance(x, y, jogador.x, jogador.y);


// AVISO PARA INTERAGIR
if (distancia < 120 && !falando) {

    draw_set_color(c_white);
    draw_text(820, 720, "Pressione Q para conversar");
}


// CAIXA DE DIALOGO
if (falando) {

    draw_set_alpha(0.85);
    draw_set_color(c_black);
    draw_rectangle(150, 800, 1770, 1010, false);

    draw_set_alpha(1);
    draw_set_color(c_white);


    switch (dialogo) {

        case 1:
            draw_text(200, 840, "BARDO");
            draw_text(200, 890, "Voce nao parece ser daqui.");
        break;


        case 2:
            draw_text(200, 840, "ASSASSINO");
            draw_text(200, 890, "Nao sou. Estou procurando alguem.");
        break;


        case 3:
            draw_text(200, 840, "BARDO");
            draw_text(200, 890, "Entao chegou em uma pessima hora.");
            draw_text(200, 925, "Ha algo estranho acontecendo por aqui.");
        break;


        case 4:
            draw_text(200, 840, "ASSASSINO");
            draw_text(200, 890, "Estranho como?");
        break;


        case 5:
            draw_text(200, 840, "BARDO");
            draw_text(200, 890, "Criaturas tem aparecido perto da vila.");
            draw_text(200, 925, "E cada noite chegam mais perto.");
        break;


        case 6:
            draw_text(200, 840, "ASSASSINO");
            draw_text(200, 890, "Ja encontrei algumas pelo caminho.");
        break;


        case 7:
            draw_text(200, 840, "BARDO");
            draw_text(200, 890, "Entao sabe que nao estou exagerando.");
            draw_text(200, 925, "Se pretende continuar, fique atento.");
        break;


        case 8:
            draw_text(200, 840, "ASSASSINO");
            draw_text(200, 890, "Nao e problema meu.");
            draw_text(200, 925, "Vou terminar o meu trabalho e vou embora.");
        break;

    }


    draw_set_color(c_ltgray);
    draw_text(1450, 970, "SPACE para continuar");
}