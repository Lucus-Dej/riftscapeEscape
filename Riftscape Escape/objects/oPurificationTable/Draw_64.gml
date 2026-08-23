if (drawDuration > 0) {
	gpu_push_state();
	gpu_set_fog(false, 0,0,0)
	var alpha = min(drawDuration / 20, 1);
	drawDuration--;
	var guiW = display_get_gui_width();
	var guiH = display_get_gui_height();

	var txtW = string_width(drawText);
	
	var xPos = guiW * 0.5;
	var yPos = guiH * 0.8;
	var pad = 64;
	var sprW = sprite_get_width(sItemDescription);

	var xScale = (txtW + pad) / sprW;
	
	draw_sprite_ext(sItemDescription, 0, xPos, yPos, xScale, 1.5, 0, c_white, alpha);
	
	draw_set_colour(c_white);
	draw_set_alpha(alpha);

	draw_text(xPos - txtW * 0.5, yPos - pad * 0.5 + 8, drawText)
	draw_set_alpha(1)
	gpu_pop_state();
}