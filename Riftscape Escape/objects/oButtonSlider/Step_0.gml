if (active && instance_exists(owner)) {
	var left  = owner.x;
	var right = owner.x + owner.sprite_width;
	x = mouse_x;
	x = clamp(mouse_x, left, right);
	sliderVal = (x - left) / (right - left);
	sliderVal = clamp(sliderVal, 0, 1);
}
if (active == mouse_check_button_released(1)) {
	active = false;
}
if (!instance_exists(owner)) {
	instance_destroy();
}