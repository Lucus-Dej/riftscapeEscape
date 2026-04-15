draw_self();
draw_set_colour(c_white);
draw_set_font(fLevels);

if (drawText != noone) {
	draw_text_ext_transformed(x-string_width(drawText), y-sprite_height*0.2, drawText, 4, 256, 2, 2, 0);
}