if (displayItemTimer > 0) {
	gpu_push_state();
	gpu_set_fog(false, 0,0,0)
	var alpha = min(displayItemTimer / 20, 1);
	guiW = display_get_gui_width();
	guiH = display_get_gui_height();
	
	var txtW = string_width(itemDesc);
	var txtH = string_height(itemDesc)
	
	var xPos = guiW * 0.5;
	var yPos = guiH * 0.8;
	pad = 64;
	var sprW = sprite_get_width(sItemDescription);
	
	var xScale = (txtW+pad)/sprW;
	
	draw_sprite_ext(sItemDescription, 0, display_get_gui_width()*0.5, display_get_gui_height()*0.8, xScale, 1.5, 0, c_white, alpha);
	draw_set_colour(c_white);
	drawOutline((guiW*0.5)-txtW/2, (guiH*0.8)-pad/2+8, itemDesc, c_white, c_black)
	//draw_text((guiW*0.5)-txtW/2, (guiH*0.8)-pad/2+8, itemDesc);
	displayItemTimer--;
	gpu_pop_state();
}