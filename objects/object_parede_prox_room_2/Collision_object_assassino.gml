// =====================================
// BLOQUEIA A SAIDA SE HOUVER INIMIGOS
// =====================================

if (exige_inimigos_mortos) {

    var total_inimigos = instance_number(object_inimigo);

    show_debug_message("INIMIGOS VIVOS: " + string(total_inimigos));

    if (total_inimigos > 0) {
        exit;
    }
}


// =====================================
// TROCA DE ROOM
// =====================================

global.spawn_x = spawn_x;
global.spawn_y = spawn_y;

if (proxima_room != noone) {
    room_goto(proxima_room);
}
if (other.protegido_porta > 0) {
    exit;
}