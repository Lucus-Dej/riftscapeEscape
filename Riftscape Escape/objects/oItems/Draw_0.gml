if (oPlayerManager.hasFirstPRune) {
	if (!instance_exists(oCamera)) {
	exit;
}
	var dir = oCamera.direction-90;

	var matrix = matrix_build(x, y, 24, 90+oCamera.tilt*zTilt, 0, dir, 1, 1, 1);

	matrix_set(matrix_world, matrix);

	draw_sprite_ext(sprite_index, image_index, 0, 0, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
	if (shopItem) {
		draw_text_transformed(0, -64, "Price: "+string(price)+"Luck Bonus", 2, 2, 0)
	}
	matrix_set(matrix_world, matrix_build_identity());
} else {
	draw_self();
	if (shopItem) {
		
		draw_text_transformed(x-string_width(displayString)/2, y+48, displayString, 1, 1, 0)
		
	}
	
}