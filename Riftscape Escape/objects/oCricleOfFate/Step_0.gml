if (existance >= 0) {
	existance--;
	if (keyboard_check(ord(oPlayerManager.circleKey)) && existance < existanceTot*0.9) {
		doRefund = true;
		instance_destroy();
	}
}
if (!place_meeting(x, y, oTruePlayer)) {
	playerLeftCircle = true;
	if (oPlayerManager.hasCircleThought) {
		oPlayerManager.thoughtCircleFireRateBoost = 0;
	}
} else {
	if (oPlayerManager.hasCircleThought) {
		oPlayerManager.thoughtCircleFireRateBoost += 0.02;
	}
}
image_alpha = 0.1 + existance/(existanceTot);
if (!doRefund) oPlayerManager.circleTotal = 0;
if (existance <= 0) {
	playerOnCircle = false;
	instance_destroy();
}
if (oItemManager.hasFireCharm) {
	var distMax = sprite_width/2;
	var inc = 360/12;
	fireCharmStartingAng += 0.3;
	for (var i = 0; i < 12; i++) {
		var ang = inc*i+fireCharmStartingAng;
		var startX = x + lengthdir_x(distMax, ang);
		var startY = y + lengthdir_y(distMax, ang);
		var ranSpeed = global.bullet_speed * (random_range(0.5, 1.5));
		fireFireFireCharm(startX, startY, ang-180, ranSpeed);
	 }
}
if (oItemManager.hasLightningCharm) {
	var lightningCheck = irandom_range(1, 24) + global.playerTime*0.25;
	if (lightningCheck >= 24) {
		var distMax = sprite_width/2;
		var ang = irandom(359);
		var dist = random_range(0, distMax);
		var startX = x + lengthdir_x(dist, ang);
		var startY = y + lengthdir_y(dist, ang);
		instance_create_layer(startX, startY, "Instances", oLightningBolt);
	}
}
if (oItemManager.hasIceCharm) {
	var iceCharmCheck = irandom_range(0, 23) + global.playerTime*0.75;
	if (iceCharmCheck >= 23) {
		var snowStorm = instance_create_layer(x+irandom_range(-22, 22), y+irandom_range(-22, 22), "Flying", oSnowStorm);
		var ang = point_direction(snowStorm.x, snowStorm.y, mouse_x, mouse_y);
		snowStorm.direction = ang;
		snowStorm.speed = global.bullet_speed*0.6;
	}
}