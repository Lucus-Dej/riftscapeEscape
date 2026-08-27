if (drawTimer > 0) {
	drawTimer--;
} 
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
	validCords.topLeftX = cx;
	validCords.topLeftY = cy;
	validCords.bottomRightX = cx - view_w;
	validCords.bottomRightY = cy - view_w;
	camera_set_view_size(cam, view_w, view_h);
	camera_set_view_pos(cam, cx, cy);
	//if (!dummy) {
	//	instance_create_layer(validCords.topLeftX, validCords.topLeftY, "Instances", oBlueprint); //top left
	//	instance_create_layer(validCords.topLeftX, validCords.topLeftY+view_w, "Instances", oTornPainting); // bottom left
	//	instance_create_layer(validCords.topLeftX+view_h, validCords.topLeftY, "Instances", oBloodySkull); // top right
	//	instance_create_layer(validCords.topLeftX+view_h, validCords.topLeftY+view_w, "Instances", oBlueprint); 
	//	dummy = true;
	//}
	
}
with (oRoomManager) {
	if (instance_exists(mask) && (discovered || hinted || oItemManager.hasGenStone)) {
		mask.image_alpha-= 0.01;
		if (mask.image_alpha <= 0) {
			instance_destroy(mask)
		}
	}
}