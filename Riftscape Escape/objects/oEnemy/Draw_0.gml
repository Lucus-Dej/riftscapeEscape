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
	
	if (oItemManager.hasGenStone && !sub) {
		if (healthTotal > 0) {
			var realHP = (enemyHP / healthTotal) * 100;
			genHealth =  lerp(genHealth, realHP, 0.5);
			draw_healthbar(-26, -4-sprite_height/2, 26, -8-sprite_height/2, genHealth, c_black, c_red, c_red, 0, true, true)
		}
	}
	
	matrix_set(matrix_world, matrix_build_identity());
} else {
	draw_self();
	if (oItemManager.hasGenStone) {
		if (healthTotal > 0) {
			var realHP = (enemyHP / healthTotal) * 100;
			genHealth =  lerp(genHealth, realHP, 0.5);
			draw_healthbar(x-26, y-4-sprite_height/2, x+26, y-8-sprite_height/2, genHealth, c_black, c_red, c_red, 0, true, true)
		}
	}
}

shader_reset();
