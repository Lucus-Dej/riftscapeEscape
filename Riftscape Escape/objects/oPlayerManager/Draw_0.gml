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
	
	drawOutline(d.x, d.y, string(d.damage), c_white, c_black);
	//draw_text(d.x, d.y, string(d.damage));
}

draw_set_alpha(1);
draw_set_colour(c_white);