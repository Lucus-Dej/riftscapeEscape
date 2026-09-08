if (conditional) {
	ds_list_clear(laserList)
	collision_circle_list(x, y-sprite_height*0.12, 8, oVeriLaser, true, false, laserList, true);
	
	var connected = false;
	for (var i = 0; i < ds_list_size(laserList); i++) {
		var laserCheck = laserList[| i];
		show_debug_message(laserCheck.host)
		show_debug_message(id)
		if (laserCheck.host != id) {
			connected = true;
			break;
		}
	}
	setPower(connected);
}
if (active && !instance_exists(laser)) {
	laser = instance_create_layer(x, y-sprite_height*0.12, "Items", oVeriLaser, {host: id, image_angle: laserAng});
}
if (instance_exists(laser) && !laser.targetFound) {
	laser.image_angle = lerp(laser.image_angle, laserAng, 0.1);
}
if (!active && instance_exists(laser)) {
	instance_destroy(laser)
}
if (instance_exists(oTruePlayer) && instance_exists(laser) && !laser.targetFound) {
	var dist = point_distance(x, y, oTruePlayer.x, oTruePlayer.y);
	if (dist < 96) {
		oPlayerManager.runeTxt = "Press Space To Change Angle";
		oPlayerManager.displayRuneDuration = 60;
		if (keyboard_check_pressed(vk_space)) {
			var dir = point_direction(x, y, oTruePlayer.x, oTruePlayer.y)
			
			var angDif = angle_difference(laser.image_angle, dir);
			if (angDif > 0) {
				laserAng -= 15;
			} else {
				laserAng += 15;
			}
		}
	}
	
}
