if (instance_exists(object_assassino)) {

    var jogador = instance_find(object_assassino, 0);

    var distancia = point_distance(x, y, jogador.x, jogador.y);

    // Inicia conversa
    if (distancia < 120 && keyboard_check_pressed(ord("Q")) && !falando) {
        falando = true;
        dialogo = 1;
    }

    // Avança diálogo
    if (falando && keyboard_check_pressed(vk_space)) {

        dialogo++;

        if (dialogo > 8) {
            falando = false;
            dialogo = 0;
        }
    }
}