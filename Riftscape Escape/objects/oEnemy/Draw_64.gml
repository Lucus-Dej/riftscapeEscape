if (bossModApplied) {
	var startX = (display_get_gui_width()/2)-256
	var endX = (display_get_gui_width()/2)+256
	var spacing = -48;

	var baseY = display_get_gui_height() * 0.95;

	var startY = baseY + bossBarIndex * spacing;
	var endY = startY + 16;

	var realHP = (enemey_hp / healthTotal) * 100;
	uiHealth =  lerp(uiHealth, realHP, 0.5);

	var targetSize = 64;

	var sw = sprite_get_width(sprite_index);
	var sh = sprite_get_height(sprite_index);

	var scaleX = targetSize / sw;
	var scaleY = targetSize / sh;

	draw_healthbar(startX, startY, endX, endY, uiHealth, c_black, c_red, c_red, 0, true, true);
	draw_sprite_ext(sprite_index, 0, startX, startY+8, scaleX, scaleY, 0, c_white, 0.8);
}