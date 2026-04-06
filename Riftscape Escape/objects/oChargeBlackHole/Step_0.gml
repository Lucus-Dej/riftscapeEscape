collision_circle_list(x, y, 128+64*pull*2, oEnemyBullets, false, true, bulletCheck, false)
image_angle += 2;
/*var playerDist = point_distance(oTruePlayer.x, oTruePlayer.y, x, y);
if (instance_exists(oTruePlayer) && playerDist < 48+96*pull*2) {
	var pdir = point_direction(oTruePlayer.x, oTruePlayer.y, x, y);
	oTruePlayer.x += lengthdir_x(pull*0.8, pdir);
	oTruePlayer.y += lengthdir_y(pull*0.8, pdir);
}*/
if (instance_exists(host)) {
	x = host.x;
	y = host.y;
}
existance--;

if (ds_list_size(bulletCheck) > 0) {
	for (var i = 0; i < ds_list_size(bulletCheck); i++) {
		var bullet = bulletCheck[| i];
		
		if (instance_exists(bullet)) {
		var dir = point_direction(bullet.x, bullet.y, x, y);
		var dis = point_distance(bullet.x, bullet.y, x, y);
		
		bullet.x += lengthdir_x(pull*0.55, dir);
		bullet.y += lengthdir_y(pull*0.55, dir);
		
		if (dis < 68) {
			if (image_xscale < 3) {
				image_xscale+= 0.1;
				image_yscale += 0.1;
			} else {
				image_xscale+= 0.01;
				image_yscale += 0.01;
			}
			bulletCount++;
			hp -= bullet.damage;
			ds_list_delete(bulletCheck, i)
			instance_destroy(bullet)
			if (hp <= 0) {
				instance_destroy();
			}
			
			break;
			}
		}
	}
}
if (existance <= 0) {
	instance_destroy();
}