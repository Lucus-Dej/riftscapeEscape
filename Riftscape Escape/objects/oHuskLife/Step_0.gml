portalDelay--;
oPlayerManager.huskTotal = 0;
if (portalDelay <= 0) {
	ready = true;
	if (oPlayerManager.huskPressed) {
		flagDestroy = true;
		oTruePlayer.x = x;
		oTruePlayer.y = y;
		portalDelay = 999;
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
		bullet.damage = (global.playerDamage/2)+(global.playerThought/10);
		bullet.direction = point_direction(x, y, target.x, target.y);

	}
}