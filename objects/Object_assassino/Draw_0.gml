draw_text(20, 20, "Vida: " + string(vida));

if (tomando_dano) {

    draw_set_alpha(0.45);

    draw_self();

    draw_set_alpha(1);

}
else {

    draw_self();
}