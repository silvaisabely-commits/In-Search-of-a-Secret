// Se esta saída exigir que todos os inimigos estejam mortos
if (exige_inimigos_mortos) {

    var total_inimigos =
        instance_number(object_goblin)
        + instance_number(object_esqueleto_3)
        + instance_number(object_inimigo_gelo)
        + instance_number(object_guardiao)
        + instance_number(object_boos_goblin)
        + instance_number(object_feiticeira_enfraquecida)
        + instance_number(object_feiticeira_poder_total);

    // Ainda existem inimigos
    if (total_inimigos > 0) {
        exit;
    }
}


// Guarda onde o Assassino deve nascer
global.spawn_x = spawn_x;
global.spawn_y = spawn_y;

// Vai para a próxima room
if (proxima_room != noone) {
    room_goto(proxima_room);
}