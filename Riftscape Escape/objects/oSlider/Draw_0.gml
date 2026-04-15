draw_self();
draw_set_colour(c_white);
draw_set_font(fLevels);

if (drawText != noone) {
	draw_text_ext_transformed(x-string_width(drawText)-96, y-sprite_height/2, drawText, 16, 256, 2, 2, 0);
}