if (mostrar) {
    global.dialogo_aberto = true;
}
if (!terminou && instance_exists(object_assassino)) {

    var jogador = instance_find(object_assassino, 0);

    if (jogador.x > 650) {
        mostrar = true;
    }
}

if (mostrar && keyboard_check_pressed(vk_space)) {

    dialogo++;

    if (dialogo > 7) {
        mostrar = false;
        terminou = true;
    }
}

// PULAR DIÁLOGO INTEIRO
if (mostrar && keyboard_check_pressed(vk_escape)) {
    mostrar = false;
    terminou = true;
}