var som = audio_play_sound(fogos_artificio, 1, false);
audio_sound_gain(som, 0.45, 0);

// Toca novamente depois de um intervalo aleatorio
alarm[0] = irandom_range(20, 45);