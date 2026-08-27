if (toggleGrid) {
	mp_grid_draw(global.Grid)
}
for (var i = array_length(global.damageNumbers) - 1; i >= 0; i--) {
	var d = global.damageNumbers[i];

	d.y += d.velY;
	d.life--;

	global.damageNumbers[i] = d;

	if (d.life <= 0) {
		array_delete(global.damageNumbers, i, 1);
	}
}
for (var i = 0; i < array_length(global.damageNumbers); i++) {
	var d = global.damageNumbers[i];

	var alpha = d.life / d.maxLife;

	draw_set_alpha(alpha);
	draw_set_colour(d.color);
	if (!d.doGUI) {
		var displayAmount = string(d.damage);
		displayAmount = (d.add+displayAmount+d.addEnd)
		if (oPlayerManager.hasFirstPRune) {
			gpu_push_state();
			gpu_set_fog(false, 0,0,0)
			if (!instance_exists(oCamera)) {
				exit;
			}
			var dir = oCamera.direction-90;

			var matrix = matrix_build(d.x, d.y, d.z, 90+oCamera.tilt, 0, dir, 1, 1, 1);

			matrix_set(matrix_world, matrix);

			displayAmount = (d.add+displayAmount+d.addEnd)
			drawOutline(0, 0, displayAmount, d.color, c_black);

			matrix_set(matrix_world, matrix_build_identity());
			gpu_pop_state();
		} else {
			drawOutline(d.x, d.y, displayAmount, d.color, c_black);
		}
	}
	//draw_text(d.x, d.y, string(d.damage));
}

draw_set_alpha(1);
draw_set_colour(c_white);