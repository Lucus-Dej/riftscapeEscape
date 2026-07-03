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
		if (turretDelay <= 0 && instance_exists(oEnemy)) {
			var tar = instance_nearest(x, y, oEnemy);
			var tarDir = point_direction(x, y, tar.x, tar.y)
			var f = bulletFire(x, y, tarDir, global.bullet_speed*0.7, damage*0.3, object_index, self);
			f.bounceNum = bounceNum;
			f.canBounce = false;
			f.ignoreWall = ignoreWall;
			f.canSpread = canSpread;
			f.image_blend = image_blend;
			f.turretApplied = turretApplied;
			f.damagedList = ds_map_create();
			f.critShot = critShot;
			if (ds_exists(damagedList, ds_type_map)) {
				ds_map_copy(f.damagedList, damagedList);
			}
			
			turretDelay = turretCooldown;
		}
	}
if (!is_real(x) || !is_real(y)) {
    show_debug_message("oBullet position corrupted");
    instance_destroy();
    exit;
}
if (!hasReversed && speed <= 0) {
	show_debug_message("Rest Bullet")
	if (ds_exists(damagedList, ds_type_map)) {
		ds_map_clear(damagedList)
	}
	hasReversed = true;
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
	
	if (oItemManager.hasSingularity) {
		var dist = 160;
		var nearestDist = dist;
		with (oEnemy) {
			if (ds_exists(other.damagedList, ds_type_map))
			if (!ds_map_exists(other.damagedList, id)) {
				var d = point_distance(other.x, other.y, x, y);
				if (d < 160) {
					nearestDist = d;
					other.target = id;
				}
			}
		}
	if (instance_exists(target) && lastHit != target) {
		var turnSpeed = 6;
		var dir = point_direction(x, y, target.x, target.y);
			direction  -= clamp(angle_difference(direction, dir), -turnSpeed, turnSpeed)
		}
		if (ds_exists(other.damagedList, ds_type_map))
		if (!instance_exists(target) || ds_map_exists(damagedList, target)) {
			target = noone;
		}
	}
	
}
if (oPlayerManager.canPierce && !pierceDebuffed) {
	speed *= 0.8
	pierceDebuffed = true;
}
if (!ds_exists(damagedList, ds_type_map)) {
    show_debug_message("MAP DIED in " + string(object_index) + " id:" + string(id));
}
x += lengthdir_x(speed, direction);
y += lengthdir_y(speed, direction);
speedBonus = speed*0.1-0.55;