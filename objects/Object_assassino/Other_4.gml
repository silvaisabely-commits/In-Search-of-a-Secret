if (room == Room24_mission_completed) {
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