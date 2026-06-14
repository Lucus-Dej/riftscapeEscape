if (shotAngle < 360) {
	shotTimer--;
	if (shotTimer <= 0) {
		shotAngle+= 360/6;
		var b =bulletFire(x, y, shotAngle, 5, global.playerDamage/3, global.chosenBullet, id);
		b.canLifesteal = false;
		shotTimer = 8;
	}
} else {
	instance_destroy(self);
}