if (!active) {
	image_alpha = 0.4;
} else {
	image_alpha = 1;
}

if (oItemManager.hasLostCrown) {
	conquestPower = (oItemManager.conquestPower)*2;
} else {
	conquestPower = oItemManager.conquestPower;
}
chaseSpeed = baseChaseSpeed +conquestPower*0.35 + accelSpeed;
rot = baseRot + conquestPower*0.5 + accelSpeed*0.5;
damage = global.playerDamage*0.2 + 0.2 + (conquestPower * 0.08)

cooldown = baseCooldown - conquestPower;
image_xscale = 1 + conquestPower*0.1;
image_yscale = 1 + conquestPower*0.1;

if (primed && active) {
    //follow = noone;
	ds_list_clear(targetList);
    collision_circle_list(x, y, 640, oEnemy, false, false, targetList, true);
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

if (instance_exists(follow) && follow != oTruePlayer && active) {
	accelSpeed += 0.035;
	xTo = follow.x;
	yTo = follow.y;
	var dir = point_direction(x, y, follow.x, follow.y);
	direction  -= clamp(angle_difference(direction, dir), -rot, rot)
	
	x += lengthdir_x(chaseSpeed, direction);
	y += lengthdir_y(chaseSpeed, direction);
	image_angle = direction - 45
	
} else if (follow == oTruePlayer) {
	xTo = follow.x;
	yTo = follow.y;
	var dir = point_direction(x, y, oMouseTracker.x, oMouseTracker.y);
	image_angle = dir - 45
	x += (xTo - x)/(minionSpeed);
	y += (yTo - y)/(minionSpeed);
}
if (!instance_exists(follow) || !active) {
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
