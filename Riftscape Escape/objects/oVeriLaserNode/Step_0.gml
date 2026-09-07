if (active && !instance_exists(laser)) {
	laser = instance_create_layer(x, y-sprite_height*0.12, "Items", oVeriLaser, {host: id});
}
if (instance_exists(laser) && !laser.targetFound) {
	laser.image_angle = lerp(laser.image_angle, laserAng, 0.1);
}
if (instance_exists(oTruePlayer) && !laser.targetFound) {
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
