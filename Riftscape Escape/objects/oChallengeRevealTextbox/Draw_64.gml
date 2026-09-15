if (display) {
	gpu_push_state();
	gpu_set_fog(false, 0,0,0)
	draw_self();

	draw_set_colour(c_white);
	draw_set_font(fLevels);
	draw_set_halign(fa_center);
	
	draw_set_alpha(alpha)
	
	var guiW = display_get_gui_width();
    var guiH = display_get_gui_height();
	x = guiW * 0.5;
    y = guiH * 0.28;
	
	if (drawText != noone) {
		draw_sprite_ext(sSecretChallengeUnlockMedel, 0, x, y-96, 3, 3, 0, c_white, 1)
		draw_text_ext_transformed(x, y-sprite_height*0.35, drawText, 4, 1024, 2, 2, 0);
		draw_text_ext_transformed(x, y-sprite_height*0.05, drawDesc, 2, 1024, 1, 1, 0);
	}
	draw_set_halign(fa_left);
	draw_set_alpha(1)
	gpu_pop_state();
}
