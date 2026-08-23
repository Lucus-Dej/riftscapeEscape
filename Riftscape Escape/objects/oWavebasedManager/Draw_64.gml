if (active) {
	gpu_push_state();
	gpu_set_fog(false, 0,0,0)
	draw_set_colour(c_white)
	var guiW = display_get_gui_width();
	var guiH = display_get_gui_height();
	var xPos = guiW * 0.5;
	var yPos = guiH * 0.1;
	var txtLength = string_width(waveTxt)*2;
	var enemiesLength = string_width(enemString);
	draw_text_transformed(xPos-(txtLength*0.5), yPos, waveTxt, 2, 2, 0)
	draw_text(xPos-(enemiesLength*0.5), yPos+32, enemString)
	gpu_pop_state();
}