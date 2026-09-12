if (oPlayerManager.hasFirstPRune) {
	if (!instance_exists(oCamera)) {
	exit;
}
	var dir = oCamera.direction-90;

	var matrix = matrix_build(x, y, 24, 90+oCamera.tilt*zTilt, 0, dir, 1, 1, 1);

	matrix_set(matrix_world, matrix);

	draw_sprite_ext(sprite_index, image_index, 0, 0, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
	draw_set_colour(c_red)
	draw_text_transformed(-16- string_width(displayString)/2, -string_height(displayString)/2, displayString, 1, 1, 0)
	matrix_set(matrix_world, matrix_build_identity());
} else {
	draw_self();
	draw_set_colour(c_red)
	draw_text_transformed(x-16 - string_width(displayString)/2, y-string_height(displayString)/2, displayString, 1, 1, 0)
	
}