// ROOM START EVENT — object_assassino

if (room == Room25_mission_completed) {
    visible = false;
    vel_x = 0;
    vel_y = 0;
    exit;
}

visible = true;

if (variable_global_exists("spawn_x")) {
    x = global.spawn_x;
    y = global.spawn_y;
    vel_x = 0;
    vel_y = 0;
}
if (variable_global_exists("spawn_x")) {
    x = global.spawn_x;
    y = global.spawn_y;
    vel_x = 0;
    vel_y = 0;
}

// Proteção contra colisão imediata com portas
protegido_porta = 15; // frames de segurança