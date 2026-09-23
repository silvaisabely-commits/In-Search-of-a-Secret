if (mostrar) {

    draw_set_alpha(0.85);
    draw_set_color(c_black);
    draw_rectangle(150, 800, 1770, 1010, false);

    draw_set_alpha(1);
    draw_set_color(c_white);

    draw_text(200, 840, "ASSASSINO");
    draw_text(200, 890, "Mais esqueletos a frente...");
    draw_text(200, 925, "Parece que ainda nao terminei.");

    draw_set_color(c_ltgray);
    draw_text(1450, 960, "SPACE para continuar");
}