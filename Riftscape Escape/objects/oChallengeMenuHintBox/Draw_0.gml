draw_self();
draw_set_colour(c_white);
draw_set_font(fLevels);
draw_set_alpha(image_alpha)
if (drawText != noone) {
	draw_text_ext_transformed(x - string_width(drawText) * 0.75, y-sprite_height*0.2, drawText, 4, 1024, 1.5, 1.5, 0);
}
draw_set_alpha(1)

