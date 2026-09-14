if (!terminou && instance_exists(object_assassino)) {

    var jogador = instance_find(object_assassino, 0);

    if (jogador.x > 400) {
        mostrar = true;
    }
}

if (mostrar && keyboard_check_pressed(vk_space)) {
    mostrar = false;
    terminou = true;
}