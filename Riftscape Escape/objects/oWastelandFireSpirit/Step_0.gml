event_inherited();
if (brainDead) {
    exit;
}

path_timer--;
// countdown
if (shoot_cooldown > 0) {
    shoot_cooldown--;
}
// enraged
if (phasePoint1 >= enemey_hp && enraged == false) {
	shoot_delay -= 20;
	enraged = true;
	arcAngle +=30;
}


if (attack == 0) {
	if (minionCount < minionMax/2) {
		attack = irandom_range(1, 2)
	} else {
		attack = irandom_range(2, 5)
	}
}

if (enraged && distance_to_object(oTruePlayer) < 120) {
	shoot_cooldown--;
} 
// fire when ready
if (shoot_cooldown <= 0) {
	if (attack == 1 || attack == 2) {
		if (minionCount < minionMax) {
			var minion = instance_create_layer(x, y, "Instances", oWastelandFireWisp);
			minion.host = id;
			array_push(minionArray, minion);
			minionCount++
		} else {
			if (maxHP > enemey_hp) {
				enemey_hp += 0.1*minionCount;
			}
		}
	} else if (attack == 3) {
		if (array_length(minionArray) > 0) {
			var sumIndex = irandom(array_length(minionArray)-1);
			var launchee = minionArray[sumIndex];
			var minion = instance_create_layer(launchee.x, launchee.y, "Instances", oWastelandBurner);
			instance_destroy(launchee);
			minion.xp = 0;
		}
	} else if (attack == 4 || attack == 5) {
		if (array_length(minionArray) > 0) {
			for (var i = 0; i < minionCount; i++) {
				var launchee = minionArray[i];
				bulletFireAt(launchee.x, launchee.y, oTruePlayer, 8.5, 15, oBadBullet, id);
			}
		}
	}
	attack = 0;
	shoot_cooldown = shoot_delay
}
if (array_length(minionArray) > 0) {
	var divider = 360/minionCount;
	orbitAngle += 2;
	for (var i = 0; i < minionCount; i++) {
		var minion = minionArray[i];
		var ang = orbitAngle + divider * i;
		var targetX = x + lengthdir_x(radius, ang);
		var targetY = y + lengthdir_y(radius, ang);

		minion.x = lerp(minion.x, targetX, 0.15);
		minion.y = lerp(minion.y, targetY, 0.15);
	}
}
if (dragTimer > 0) {
    applyDrag(dragPower, dragDir, oWalls);
    dragTimer--;

    if (dragTimer <= 0) {
        path_timer = 0;
    }
}

if (path_timer <= 0) {
    path_timer = path_cooldown;
    pathfind(global.Grid, oTruePlayer, enemSpeed, id);
}