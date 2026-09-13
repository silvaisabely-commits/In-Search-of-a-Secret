var gui_w = display_get_gui_width();
var gui_h = display_get_gui_height();

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_set_font(-1);
draw_set_color(c_white);

// Efeito de piscar suavemente
var alpha = 0.55 + 0.45 * sin(current_time / 350);
draw_set_alpha(alpha);

draw_text(
    gui_w / 2,
    gui_h - 70,
    "Pressione ESPACO para iniciar"
);

// Volta ao normal
draw_set_alpha(1);
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);