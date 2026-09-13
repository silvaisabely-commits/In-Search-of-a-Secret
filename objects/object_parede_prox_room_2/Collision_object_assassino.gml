if (room == Room02_frente_cabana) {

    global.spawn_x = 180;
    global.spawn_y = 600;

    room_goto(Room03_floresta1);
}

else if (room == Room03_floresta1) {

    global.spawn_x = 180;
    global.spawn_y = 750;

    room_goto(Room04_floresta2);
}

else if (room == Room04_floresta2) {

    global.spawn_x = 180;
    global.spawn_y = 600;

    room_goto(Room05_floresta3);
}