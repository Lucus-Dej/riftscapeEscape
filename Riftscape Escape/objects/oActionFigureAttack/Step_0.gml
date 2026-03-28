if (shotAngle < 360) {
	shotTimer--;
	if (shotTimer <= 0) {
		bullet = instance_create_layer(x, y, "Instances", oActionFigureBullets);
		bullet.direction = shotAngle;
		bullet.speed = 5;
		shotTimer = 8;
		shotAngle+= 360/(7+(oItemManager.actionFigurePower));
		bullet.damage = global.playerDamage/3;
	}
} else {
	instance_destroy(self);
}