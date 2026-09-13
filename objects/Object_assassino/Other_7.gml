// =====================================
// FIM DA ANIMAÇÃO DE MORTE
// =====================================

if (morrendo) {

    // Recupera a vida
    vida = vida_max;


    // Volta para o checkpoint
    if (variable_global_exists("spawn_x")) {

        x = global.spawn_x;
        y = global.spawn_y;
    }


    // Reseta movimento
    vel_x = 0;
    vel_y = 0;


    // Sai do estado de morte
    morrendo = false;


    // Volta para o sprite normal
    sprite_index = sprite_assassino;
    image_index = 0;
    image_speed = 0.15;
}