if (oPlayerManager.hasTimeHusk) {
	existance--;
	if (existance <= 0) {
		tpSpotX = oTruePlayer.x;
		tpSpotY = oTruePlayer.y;
		instance_create_layer(tpSpotX, tpSpotY, "Instances", oHuskLife)
		instance_destroy()
	}
}
portalDelay--;
oPlayerManager.huskTotal = 0;
if (portalDelay <= 0) {
	ready = true;
	if (oPlayerManager.huskPressed) {
		tpSpotX = oTruePlayer.x; 
		tpSpotY = oTruePlayer.y;
		if (!oPlayerManager.hasTimeHusk) {
			flagDestroy = true;
		}
		if (oPlayerManager.hasTimeHusk) {
			portalDelay = 60;
		}
		oTruePlayer.x = x;
		oTruePlayer.y = y;
		if (oPlayerManager.hasRealityHusk) {
			oPlayerManager.realityHuskSpeedBonus = 10;
		}
	}
}
if (oPlayerManager.hasFateHusk && instance_exists(oEnemy)) {
	target = oEnemy;
	image_angle = point_direction(x, y, target.x, target.y);
	if (bulletDelay > 0)  {
			bulletDelay --;
		}
	if (bulletDelay <= 0) {
		bulletDelay = global.bullet_delay/1+(global.playerThought/10);
		bullet = instance_create_layer(x, y, "Instances", oHuskBullet);
		bullet.speed = 4;
		bullet.damage = global.playerDamage/4;
		bullet.direction = point_direction(x, y, target.x, target.y);

	}
}