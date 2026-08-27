if (instance_exists(oSpawnSpawner)) {
	x = oSpawnSpawner.x;
	y = oSpawnSpawner.y;
}
if (!oPlayerManager.hasFirstPRune) {
	camH = 768;
	camW = 1408;

	follow = oPlayer;

	xTo = x;
	yto = y
} else {
		cam = camera_create_view(0, 0, global.resW, global.resH);
		view_enabled = true;
		view_visible[0] = true;
		view_camera[0] = cam;

		projMat = matrix_build_projection_perspective_fov(80, -global.resW/global.resH, 3, 3000);
		camera_set_proj_mat(cam, projMat);
}