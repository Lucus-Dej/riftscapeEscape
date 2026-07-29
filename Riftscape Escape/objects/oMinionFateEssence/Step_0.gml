dmgRefreshTime = global.bullet_delay;
rot = 1 + global.playerFate;
minionChaseSpeed = global.playerReality*0.4 + 5.5;
if (oPlayerManager.hasMinionReality) {
	minionRealitySpeedBonus = -35;
}
if (oItemManager.hasLostCrown) {
	minionCrownDmgBonus = 0.2;
	minionCrownSpeedBonus = -25;
}
damage = (baseDmg + minionCrownDmgBonus + global.playerLife*0.005 + global.playerDamage*0.2)/(instance_number(oMinionEssence) + instance_number(oMinionFateEssence))*1.1;
damage = max(damage, 0.01)
minionSpeed = 65 + minionRealitySpeedBonus + minionCrownSpeedBonus;
minionSpeed = max(5, minionSpeed);
if (follow == oTruePlayer) {
	accelSpeed = 0;
	xTo = follow.x;
	yTo = follow.y;
	x += (xTo - x)/(minionSpeed);
	y += (yTo - y)/(minionSpeed);
} else if (instance_exists(follow) && follow != oTruePlayer) {
	accelSpeed += 0.015;
	xTo = follow.x;
	yTo = follow.y;
	var dir = point_direction(x, y, follow.x, follow.y);
	direction  -= clamp(angle_difference(direction, dir), -rot, rot)
	
	x += lengthdir_x(minionChaseSpeed, direction);
	y += lengthdir_y(minionChaseSpeed, direction);
	//image_angle = direction - 45
}


ds_list_clear(targetList);
collision_circle_list(x, y, 128+32*global.playerFate, oEnemy, false, false, targetList, true);
if (ds_list_size(targetList) > 0 && ((keyboard_check(vk_space) or mouse_check_button(mb_left) || oPlayerManager.hasMinionThought)) && array_length(damageArray) < (global.playerFate + global.playerLife + global.playerEssence*0.5)*0.5 - 4) {
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
	follow = oTruePlayer;
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
