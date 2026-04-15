existance--;
if (existance <= 0) {
	instance_destroy()
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
			doRefund = true;
		}
		oTruePlayer.x = x;
		oTruePlayer.y = y;
		if (oPlayerManager.hasTimeHusk) {
			portalDelay = 30;
			x = tpSpotX;
			y = tpSpotY;
		}
		if (oPlayerManager.hasRealityHusk) {
			oPlayerManager.realityHuskSpeedBonus += 8;
		}
	}
}

if (oPlayerManager.hasFateHusk && instance_exists(oEnemy)) {
	target = instance_nearest(x, y, oEnemy);
	var dir = point_direction(x, y, target.x, target.y);
	image_angle = dir;
	if (bulletDelay > 0)  {
			bulletDelay --;
		}
	if (bulletDelay <= 0) {
		bulletDelay = global.bullet_delay/1+(global.playerThought/10);
		var bullet = bulletFireAt(x, y, target, 4, global.playerDamage/5, oHuskBullet, id);
		if (oItemManager.hasMetalOrb) {
			bulletFire(x, y, dir+35, 4, global.playerDamage/10, oHuskBullet, id);
			bulletFire(x, y, dir-35, 4, global.playerDamage/10, oHuskBullet, id);
		}
	}
}