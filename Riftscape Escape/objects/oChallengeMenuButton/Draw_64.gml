if (display && global.do3d) {
	gpu_push_state();
	gpu_set_fog(false, 0,0,0)
	draw_self();

	draw_set_colour(c_white);
	draw_set_font(fLevels);
	draw_set_alpha(image_alpha)
	if (drawText != noone) {
		draw_text_ext_transformed(x+sprite_width/4+string_width(drawText), y-sprite_height*0.2, drawText, 4, 1024, 1.5, 1.5, 0);
	}
	gpu_pop_state();
}
