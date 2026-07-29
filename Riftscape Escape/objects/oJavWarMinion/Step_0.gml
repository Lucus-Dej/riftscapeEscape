warPowerEnem = 0;
if (warPowerDmg  < 0) {
	warPowerDmg = 0;
}
with (oEnemy) {
	if (object_get_parent(id.object_index) != oSubEnemy) {
		other.warPowerEnem ++;
	}
}

if (oItemManager.hasLostCrown) {
	warPower = (warPowerEnem + warPowerDmg + warPowerBullets*0.6)*2;
	
} else {
	warPower = warPowerEnem + warPowerDmg + warPowerBullets*0.6;
}
chaseSpeed = baseChaseSpeed + warPower*1.7 + accelSpeed;
rot = baseRot + warPower*0.3 + accelSpeed*0.5;
damage = 0.13 + (warPower * 0.07)
if (warPowerDmg > 0) {
	warPowerDmg -= 0.015;
}
if (warPowerBullets > 0) {
	warPowerBullets -= 0.1;
}
cooldown = baseCooldown - warPower*3.85;


if (primed) {
    //follow = noone;
	ds_list_clear(targetList);
    collision_circle_list(x, y, 512, oEnemy, false, false, targetList, true);
	if (ds_list_size(targetList) > 0) {
		follow = noone;
		for (var i = 0; i < ds_list_size(targetList); i++) {
			var enem = targetList[| i];
	        if (!array_contains(damageArray, enem) && instance_exists(enem)) {
	            follow = enem;
	            break;
	        } 
	    }
		if (follow == noone) {
			follow = oTruePlayer;
		}
	} else {
		
	}
}
if (instance_exists(follow) && follow != oTruePlayer) {
	accelSpeed += 0.015;
	xTo = follow.x;
	yTo = follow.y;
	var dir = point_direction(x, y, follow.x, follow.y);
	direction  -= clamp(angle_difference(direction, dir), -rot, rot)
	
	x += lengthdir_x(chaseSpeed, direction);
	y += lengthdir_y(chaseSpeed, direction);
	image_angle = direction - 45
	
} else if (follow == oTruePlayer) {
	accelSpeed = 0;
	xTo = follow.x;
	yTo = follow.y;
	var dir = point_direction(x, y, oMouseTracker.x, oMouseTracker.y)
	image_angle = dir - 45
	x += (xTo - x)/(minionSpeed);
	y += (yTo - y)/(minionSpeed);
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
