var nova_musica = musica_floresta_exploracao;

if (room == Room24_mission_completed) {

    if (musica_atual != noone) {
        audio_stop_sound(musica_atual);
        musica_atual = noone;
    }

    exit;
}

// BATALHAS
if (
    room == Room03_floresta1 ||
    room == Room10_vila_ruinas ||
    room == Room13_minerios ||
    room == Room18_porta_fortaleza ||
    room == Room21_fortaleza_batalha1 ||
    room == Room22_fortaleza_batalha2
) {
    nova_musica = musica_batalha;
}

// BOSS FINAL
if (room == Room23_anel_confronto_final) {
    nova_musica = musica_boss;
}

// TROCA A MUSICA
if (nova_musica != musica_atual) {

    if (musica_atual != noone) {
        audio_stop_sound(musica_atual);
    }

    audio_play_sound(nova_musica, 1, true);

    musica_atual = nova_musica;
}