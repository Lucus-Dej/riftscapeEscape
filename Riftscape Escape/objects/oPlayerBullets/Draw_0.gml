draw_self();
if (bounceTarget != noone) {
	//draw_line(bounceTarget.x, bounceTarget.y, x, y);
}
if (primedForLightning) {
	draw_sprite_ext(sElectricCharge, irandom(3), x, y, image_xscale, image_yscale, 0, c_white, 0.8)
}