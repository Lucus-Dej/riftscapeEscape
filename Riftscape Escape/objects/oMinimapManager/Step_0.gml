if (instance_exists(follow)) {
	var cam = minimapCam;

	var view_w = 2400; 
	var view_h = 2400;

	// center on player
	var cx = follow.x - view_w * 0.5;
	var cy = follow.y - view_h * 0.5;

	// clamp to room
	cx = clamp(cx, 0, room_width - view_w);
	cy = clamp(cy, 0, room_height - view_h);

	camera_set_view_size(cam, view_w, view_h);
	camera_set_view_pos(cam, cx, cy);
}