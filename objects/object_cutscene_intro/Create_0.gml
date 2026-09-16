// =====================================
// CUTSCENE DE INTRODUÇÃO
// =====================================

// Diálogo atual
dialogo = 0;

// Impede avançar imediatamente
pode_avancar = false;
tempo_inicio = 20;


// =====================================
// TEXTOS DA INTRODUÇÃO
// =====================================

textos = [

    "A noite estava silenciosa. O assassino descansava sozinho em sua cabana.",

    "TOC. TOC.",

    "Duas batidas interrompem o silencio.",

    "Ao abrir a porta, nao havia ninguem. Apenas uma carta deixada no chao.",

    "Assassino, chegou o momento de pagar sua divida.",

    "Se deseja finalmente se livrar do que me deve, siga para a fortaleza.",

    "Existe algo la dentro que preciso que voce recupere.",

    "Nao tente descobrir o que procura. Voce so precisa encontra-lo.",

    "Traga-o ate mim e sua divida estara paga. - A Feiticeira",

    "Entao finalmente chegou a hora... Uma divida eh uma divida.",

    "Termino esse trabalho, recebo meu pagamento e desapareco."
];


// =====================================
// QUEM ESTÁ FALANDO
// =====================================

nomes = [

    "NARRACAO",
    "",
    "NARRACAO",
    "NARRACAO",

    "CARTA",
    "CARTA",
    "CARTA",
    "CARTA",
    "CARTA",

    "ASSASSINO",
    "ASSASSINO"
];


// =====================================
// CONTROLE DA CUTSCENE
// =====================================

cutscene_terminou = false;

// =====================================
// EFEITO DE DIGITAÇÃO
// =====================================

caracteres_visiveis = 0;

// Velocidade da digitação
velocidade_texto = 1;