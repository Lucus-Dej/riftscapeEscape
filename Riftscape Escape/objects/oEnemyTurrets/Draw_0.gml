shader_set(shdHit);
shader_set_uniform_f(shader_get_uniform(shdHit, "flash"), flash);

if (oPlayerManager.hasFirstPRune) {
	if (!instance_exists(oCamera)) {
		exit;
	}
	var dir = oCamera.direction-90;

	var matrix = matrix_build(x, y, sprite_height/2, 90+oCamera.tilt*zTilt, 0, dir, 1, 1, 1);

	matrix_set(matrix_world, matrix);

	draw_sprite_ext(sprite_index, image_index, 0, 0, image_xscale, image_yscale, 0, image_blend, image_alpha);

	matrix_set(matrix_world, matrix_build_identity());
} else {
	draw_self();
}

shader_reset();