collision_circle_list(x, y, 128+64*pull*2, oPlayerBullets, false, true, bulletCheck, false)
image_angle += rotation;
var playerDist = point_distance(oTruePlayer.x, oTruePlayer.y, x, y);
var blackHoleCheck = collision_line(x, y,oTruePlayer.x, oTruePlayer.y, oWalls, false, true);
if (blackHoleCheck == noone)
if (instance_exists(oTruePlayer) && playerDist < 48+96*pull*2 && playerDist > 48) {
	var pdir = point_direction(oTruePlayer.x, oTruePlayer.y, x, y);
	oTruePlayer.x += lengthdir_x(pull*0.8, pdir);
	oTruePlayer.y += lengthdir_y(pull*0.8, pdir);
}
existence--;
if (ds_list_size(bulletCheck) > 0) {
	for (var i = 0; i < ds_list_size(bulletCheck); i++) {
		var bullet = bulletCheck[| i];
		if (instance_exists(bullet))
		var blackHoleBulletCheck = collision_line(x, y,bullet.x, bullet.y, oWalls, false, true);
		if (instance_exists(bullet) && blackHoleBulletCheck == noone) {
			var dir = point_direction(bullet.x, bullet.y, x, y);
			var dis = point_distance(bullet.x, bullet.y, x, y);
			var turnSpeed = 4;
			bullet.direction  -= clamp(angle_difference(bullet.direction, dir), -turnSpeed, turnSpeed)
			if (dis < 12) {
				instance_destroy(bullet)
				ds_list_delete(bulletCheck, i)
			}
			break;
		}
	}
}
if (existence <= 0) {
	image_xscale -= 0.01;
	image_yscale -= 0.01;
	if (image_yscale <= 0.2) {
		instance_destroy()
	}
}