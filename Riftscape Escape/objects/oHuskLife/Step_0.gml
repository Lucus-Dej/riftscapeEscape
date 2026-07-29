existance--;
if (existance <= 0) {
	instance_destroy()
}
portalDelay--;
oPlayerManager.huskTotal = 0;
if (portalDelay <= 0) {
	ready = true;
	if (oPlayerManager.huskPressed) {
		if (oPlayerManager.hasFateHusk) {
			var rounds = clamp(3 - floor(existance / (existanceTot / 3)), 1, 3);
			var bullets = global.playerThought;
			var spacing = 360 / bullets;
			for (var r = 0; r < rounds; r++) {
				var offset = spacing * (r / rounds);
				for (var i = 0; i < bullets; i ++) {
					var shotAngle = offset + i * spacing;
					if (r == 0 && i == 0) {
						bulletFire(x, y, shotAngle, 5-r, global.playerDamage*0.2 + 0.2 + sqrt(global.playerThought)*1.1, oHuskBullet, oTruePlayer);
					} else {
						bulletFire(x, y, shotAngle, 5-r, global.playerDamage*0.2 + 0.2 + sqrt(global.playerThought)*1.1, oHuskBullet, oTruePlayer, true);
					}
				}
			}
		}
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
			oPlayerManager.realityHuskSpeedBonus = 8;
		}
	}
}

if (instance_exists(oEnemy)) {
	target = instance_nearest(x, y, oEnemy);
	var dir = point_direction(x, y, target.x, target.y);
	image_angle = dir;
	if (bulletDelay > 0)  {
			bulletDelay --;
		}
	if (bulletDelay <= 0) {
		bulletDelay = global.bullet_delay/1+(global.playerThought*0.15);
		playerBulletFire(x, y, dir, 6, global.playerDamage*0.08 + 0.01 + sqrt(global.playerThought)*0.1, oHuskBullet, id);
	}
}