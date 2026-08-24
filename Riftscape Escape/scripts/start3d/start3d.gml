function start3d(){
	global.do3d = true;
	global.resW = 1280;
	global.resH = 720;
	
	//window_set_size(global.resW, global.resH);
	//surface_resize(application_surface, global.resW, global.resH);
	
	global.fogCol = c_black;//merge_colour(c_black, c_aqua, 0.5)
	
	gpu_set_fog(true, global.fogCol, 1, 500)
	
	layer_force_draw_depth(true, 0)

	gpu_set_ztestenable(true);
	gpu_set_zwriteenable(true)
	gpu_set_alphatestenable(true);
}