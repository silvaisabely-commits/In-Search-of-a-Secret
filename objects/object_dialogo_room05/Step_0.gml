if (!terminou && instance_exists(object_assassino)) {

    var jogador = instance_find(object_assassino, 0);

    // Quando o Assassino avançar um pouco na room
    if (jogador.x > 500) {
        mostrar = true;
    }
}

// SPACE fecha o pensamento
if (mostrar && keyboard_check_pressed(vk_space)) {
    mostrar = false;
    terminou = true;
}