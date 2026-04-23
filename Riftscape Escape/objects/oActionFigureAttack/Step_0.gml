if (shotAngle < 360) {
	shotTimer--;
	if (shotTimer <= 0) {
		shotAngle+= 360/6;
		bulletFire(x, y, shotAngle, 5, global.playerDamage/3, oActionFigureBullets, id)
		shotTimer = 8;
	}
} else {
	instance_destroy(self);
}