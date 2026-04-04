bulletCheck = collision_circle_list(x, y, 96*pull, oPlayerBullets, false, true, bulletCheck, false)
image_angle += rotation;
var playerDist = point_distance(oTruePlayer.x, oTruePlayer.y, x, y);
if (instance_exists(oTruePlayer) && playerDist < 80*pull) {
	var pdir = point_direction(oTruePlayer.x, oTruePlayer.y, x, y);
	oTruePlayer.x += lengthdir_x(pull*0.8, pdir);
	oTruePlayer.y += lengthdir_y(pull*0.8, pdir);
}
if (ds_list_size(bulletCheck) > 0) {
	for (var i = 0; i < ds_list_size(bulletCheck); i++) {
		var bullet = bulletCheck[| i];
		
		if (instance_exists(bullet)) {
		var dir = point_direction(bullet.x, bullet.y, x, y);
		var dis = point_distance(bullet.x, bullet.y, x, y);
		
		bullet.x += lengthdir_x(pull*0.55, dir);
		bullet.y += lengthdir_y(pull*0.55, dir);
		
		if (dis < 4) {
			if (instance_exists(host)) {
				host.bulletCount ++;
				if (host.image_yscale < 3) {
					host.rotation +=0.5;
					host.image_xscale+= 0.1;
					host.image_yscale += 0.1;
					host.damage += 1;
					image_xscale+= 0.1;
					image_yscale += 0.1
				}
			}
			instance_destroy(bullet)
			ds_list_delete(bulletCheck, i)
			
			break;
			}
		}
	}
}