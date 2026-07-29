

if (oItemManager.hasLostCrown) {
	deathPower = (deathPowerKills)*2;
} else {
	deathPower = deathPowerKills;
}
chaseSpeed = baseChaseSpeed +deathPower*0.55 + accelSpeed;
rot = baseRot + deathPower*0.2 + accelSpeed*0.5;
damage = global.playerDamage*0.4 + 0.2 + (deathPower * 0.12)

cooldown = baseCooldown - deathPower;



if (instance_exists(follow) && follow != oTruePlayer) {
	var dir = point_direction(x, y, follow.x, follow.y);
	direction  -= clamp(angle_difference(direction, dir), -rot, rot)
	var dist = point_distance(x, y, follow.x, follow.y);
	if (dist > 256) {
		accelSpeed += 0.015;
	} else {
		if (accelSpeed > 0) {
			accelSpeed -= 0.15;
			if (accelSpeed < 0) {
				accelSpeed = 0
			}
		}
	}
	x += lengthdir_x(chaseSpeed, direction);
	y += lengthdir_y(chaseSpeed, direction);
	image_angle = direction - 45
	
}
if (!instance_exists(follow)) {
	follow = oTruePlayer;
	accelSpeed = 0;
}
if (array_length(damageArray) > 0) {
	for (var i = array_length(damageArray) - 1; i >= 0; i--) {
		if (damageTimerArray[i] < dmgRefreshTime) {
			damageTimerArray[i]++;
		} else {
			array_delete(damageTimerArray, i, 1);
			array_delete(damageArray, i, 1);
		}
	}
}
