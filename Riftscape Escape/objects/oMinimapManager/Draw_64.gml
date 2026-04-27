if (instance_exists(follow) && (!oPlayerManager.inLevelMenu && !oPlayerManager.inTokenMenu)) {
	var map_x = display_get_gui_width() - 216;
	var map_y = 16;
	var map_w = 200;
	var map_h = 200;


	draw_set_colour(c_dkgray);
	draw_rectangle(map_x - 4, map_y - 4, map_x + map_w + 4, map_y + map_h + 4, false);
	draw_set_alpha(0.6);

	draw_set_colour(c_white);
	draw_rectangle(map_x - 4, map_y - 4, map_x + map_w + 4, map_y + map_h + 4, true);


	draw_set_alpha(1);


	draw_surface(minimapSurface, map_x, map_y);
	draw_set_colour(c_red);
}