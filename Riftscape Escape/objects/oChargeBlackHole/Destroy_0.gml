ds_list_destroy(bulletCheck)
if (bulletCount > 0) {
	shotAngle = 360/bulletCount;
	for (var i = 0; i < 360; i += shotAngle) {
		var angle = i;
		var bullet = bulletFire(x, y, angle, global.bullet_speed, global.playerDamage*1.2, global.chosenBullet, oTruePlayer.id);
		bullet.canDecel = true;
		bullet.image_blend = c_purple;
	}
}