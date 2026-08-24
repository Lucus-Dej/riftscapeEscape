
if (global.do3d) {
	var mx = device_mouse_x_to_gui(0);
	var my = device_mouse_y_to_gui(0);
	var hovering = point_in_rectangle(mx, my, x - sprite_width * 0.5, y - sprite_height * 0.5, x + sprite_width * 0.5, y + sprite_height  * 0.5)
	
	if (hovering && global.inCombat) {
		faded = true;
		image_alpha = 0.3;
	} else if (hovering) {
		image_alpha = 0.5;
		faded = true;
	} else if (!hovering) {
		image_alpha = 1;
	}
	if (hovering && mouse_check_button_pressed(mb_left)) {
	    click();
	}
}


if (!faded)
if (global.inCombat) {
	image_alpha = 0.5;
} else {
	image_alpha = 1;
}