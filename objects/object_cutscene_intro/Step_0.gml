// =====================================
// CUTSCENE - EFEITO DE DIGITAÇÃO
// =====================================

var texto_atual = textos[dialogo];


// =====================================
// PEQUENO TEMPO INICIAL
// =====================================

if (!pode_avancar) {

    tempo_inicio--;

    if (tempo_inicio <= 0) {
        pode_avancar = true;
    }

    exit;
}


// =====================================
// DIGITAÇÃO DO TEXTO
// =====================================

if (caracteres_visiveis < string_length(texto_atual)) {

    caracteres_visiveis += velocidade_texto;

    caracteres_visiveis = min(
        caracteres_visiveis,
        string_length(texto_atual)
    );
}


// =====================================
// ESPAÇO
// =====================================

if (keyboard_check_pressed(vk_space)) {

    // -------------------------------------
    // TEXTO AINDA ESTÁ SENDO DIGITADO
    // -------------------------------------

    if (caracteres_visiveis < string_length(texto_atual)) {

        // Mostra a frase inteira
        caracteres_visiveis = string_length(texto_atual);

    }

    // -------------------------------------
    // TEXTO JÁ TERMINOU
    // -------------------------------------

    else {

        // Ainda existem diálogos
        if (dialogo < array_length(textos) - 1) {

            dialogo++;

            // Começa a próxima frase do zero
            caracteres_visiveis = 0;

        }

        // Último diálogo
        else {

            room_goto(Room02_frente_cabana);
        }
    }
}