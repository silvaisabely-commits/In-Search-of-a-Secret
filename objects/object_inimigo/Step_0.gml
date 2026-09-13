// =====================================
// FEEDBACK DE DANO
// =====================================

if (tomando_dano) {

    image_blend = c_red;

    tempo_dano--;

    if (tempo_dano <= 0) {
        tomando_dano = false;
        image_blend = c_white;
    }

}
else {

    image_blend = c_white;
}


// =====================================
// MORTE
// =====================================

if (vida <= 0) {
    morrendo = true;
}