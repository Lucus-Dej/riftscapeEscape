var pbCount = instance_number(oPlayerBullets);
if (pbCount > 99) {
	existance -= 0.1*pbCount;
}
if (tempGhostTimer > 0) {
	tempGhostTimer--;
}
if (oItemManager.hasConRift) {
	if (linkTimer > 0) {
		linkTimer--;
	} else {
		linkTimer = linkCooldown;
		ds_list_clear(nearbyBullets);
		collision_circle_list(x, y, 128, oPlayerBullets, false, true, nearbyBullets, true);
		for (var i = 0; i < ds_list_size(nearbyBullets); i++) {
			var b = nearbyBullets[| i];
			var makeLink = true;
			var len = array_length(links);
			for (var j = 0; j < len; j++) {
				var l = links[j];
				
				if (!instance_exists(l)) {
					continue;
				}
				
				if (l.host == b || l.connector == b) {
					makeLink = false;
					break;
				}
			}
			//with (oBulletLightningLink) {
			//	if ((connector == other.id && host == b.id) || (host == other.id && connector == b.id)) {
			//		makeLink = false;
			//	}
			//}
			if (array_length(links) > maxLinks) {
				makeLink = false;
			}
			if (makeLink) {
				//other.connected = true;
				var link = instance_create_layer(x, y, "Instances", oBulletLightningLink);
				array_push(links, link)
				array_push(b.links, link)
				link.host = id;
				link.connector = b;
			}
		}
	}
}/*
with (oPlayerBullets) {
	// abs(makeTime - other.makeTime) <= 12)
	var hostID = id;
	var targetID = other.id;
	var makeLink = true;
	var dist = point_distance(x, y, other.x, other.y);
	if (id != other.id && dist <= 128) {
		
		with (oBulletLightningLink) {
			if ((connector == hostID && host == targetID) || (host == hostID && connector == targetID)) {
				makeLink = false;
			}
		}
		if (makeLink) {
			//other.connected = true;
			var link = instance_create_layer(x, y, "Instances", oBulletLightningLink);
			link.host = id;
			link.connector = other.id;
		}
	}
}*/
if (!firedFromTurret && !turretApplied && isTurret) {
	image_xscale += 0.5;
	image_yscale += 0.5;
	existance *= 3;
	canDecel = true;
	deceyToZero = true;
	decayRate *= 1.2;
	turretApplied = true;
}
existance--;
if (oPlayerManager.hasBulletRangeRune) {
	existance--;
}
if (existance <= 0) {
	instance_destroy();
}
if (oItemManager.hasWeightlessHourglass) {
	
	if (speed > 0) {
		speed -= decayRate;
		if (speed < 0 && speed != 0) {
			speed = 0;
		}
		image_xscale += 0.01;
		image_yscale += 0.01;
	
		damage += 0.01;
	} 
}
if (isTurret && !firedFromTurret && turretApplied) {
		turretDelay--;
		var tar = instance_nearest(x, y, oEnemy);
		if (instance_exists(tar)) {
			var tarDir = point_direction(x, y, tar.x, tar.y)
			var line = collision_line(x, y, tar.x, tar.y, oBulletBlocker, false, false)
			
			if (turretDelay <= 0 && instance_exists(oEnemy) && line == noone) {
				var f = bulletFire(x, y, tarDir, global.bullet_speed*0.7, damage*0.3, object_index, self);
				f.bounceNum = bounceNum;
				f.canBounce = false;
				f.ignoreWall = ignoreWall;
				f.canSpread = canSpread;
				f.image_blend = image_blend;
				f.turretApplied = turretApplied;
				f.critShot = critShot;
				array_copy(f.damageArray, 0, damageArray, 0, array_length(damageArray))
				array_copy(f.damageTimerArray, 0, damageTimerArray, 0, array_length(damageTimerArray))
				turretDelay = turretCooldown;
			}
		}
		
		
	}
if (!is_real(x) || !is_real(y)) {
    show_debug_message("oBullet position corrupted");
    instance_destroy();
    exit;
}


if (!is_real(speed) || !is_real(direction)) {
    show_debug_message("oBullet movement corrupted");
    instance_destroy();
    exit;
}
if (canOrbit && instance_exists(orbitCenter)) {

    orbitAngle += orbitSpeed;

    orbitRadius = lerp(orbitRadius, orbitTargetRadius, 0.1);

    x = orbitCenter.x + lengthdir_x(orbitRadius, orbitAngle);
    y = orbitCenter.y + lengthdir_y(orbitRadius, orbitAngle);
} else {
	if (canAccel) {
		speed += increaseRate;
	}
	if (canDecel) {
		if (!deceyToZero) {
			speed -= decayRate
		} else if (deceyToZero && speed > 0) {
			speed -= decayRate;
			if (speed < 0) {
				speed = 0;
			}
		}
	}

if (oItemManager.hasLaserPointer) {
	target = oMouseTracker;
	canPush = true;
	
}
if (oItemManager.hasSingularity) {
	canPush = false;
	var dist = 160;
	var nearestDist = dist;
	with (oEnemy) {
		if (!array_contains(other.damageArray, other.id)) {
			var d = point_distance(other.x, other.y, x, y);
			if (d < 160) {
				nearestDist = d;
				other.target = id;
			}
		}
	}
}
if (instance_exists(target) && !array_contains(damageArray, target)) {
		var turnSpeed = 12;
		var dir = point_direction(x, y, target.x, target.y);
		direction  -= clamp(angle_difference(direction, dir), -turnSpeed, turnSpeed)
	}
	if (!instance_exists(target) || array_contains(damageArray, target)) {
		target = noone;
	}
}

if (oPlayerManager.canPierce && !pierceDebuffed) {
	speed *= 0.8
	pierceDebuffed = true;
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
x += lengthdir_x(speed, direction);
y += lengthdir_y(speed, direction);
speedBonus = abs(speed*0.08-global.bullet_speed*0.06-damage*0.1);
