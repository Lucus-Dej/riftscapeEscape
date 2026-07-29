
if (oPlayerManager.hasLifeHusk) {
	instance_create_layer(tpSpotX, tpSpotY, "Instances", oHuskLife);
	
}
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
if (doRefund) {
	oPlayerManager.huskTotal = (existance/existanceTot)*oPlayerManager.huskMax;
}