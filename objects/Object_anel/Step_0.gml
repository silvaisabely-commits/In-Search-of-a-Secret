if (!coletado && instance_exists(object_assassino)) {

    if (place_meeting(x, y, object_assassino)) {

        coletado = true;

        global.tem_anel = true;

        // Avisa o jogador que coletou
        global.aviso_texto = "ANEL COLETADO!";
        global.aviso_tempo = 90; // 90 frames ≈ 1.5 segundos (a 60 fps)

        instance_destroy();
    }
}