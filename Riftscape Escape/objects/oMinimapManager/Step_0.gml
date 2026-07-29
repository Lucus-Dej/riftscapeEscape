if (mouse_wheel_up()) {
    view_w -= zoomSpeed;
    view_h -= zoomSpeed;
}

if (mouse_wheel_down()) {
    view_w += zoomSpeed;
    view_h += zoomSpeed;
}
scale = view_h/maxZoom;
max(scale, 1)
view_w = clamp(view_w, minZoom, maxZoom);
view_h = clamp(view_h, minZoom, maxZoom);
if (instance_exists(follow)) {
	var cam = minimapCam;

	var cx = follow.x - view_w * 0.5;
	var cy = follow.y - view_h * 0.5;

	cx = clamp(cx, 0, room_width - view_w);
	cy = clamp(cy, 0, room_height - view_h);

	camera_set_view_size(cam, view_w, view_h);
	camera_set_view_pos(cam, cx, cy);
}