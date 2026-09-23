if (mostrar) {
    global.dialogo_aberto = true;
}
if (!terminou && instance_exists(object_assassino)) {

    var jogador = instance_find(object_assassino, 0);

    if (jogador.x > 1100) {
        mostrar = true;
    }
}


// AVANCAR DIALOGO
if (mostrar && keyboard_check_pressed(vk_space)) {

    dialogo++;

    if (dialogo > 8) {
        mostrar = false;
        terminou = true;
    }
}


// PULAR DIÁLOGO INTEIRO
if (mostrar && keyboard_check_pressed(vk_escape)) {
    mostrar = false;
    terminou = true;
}