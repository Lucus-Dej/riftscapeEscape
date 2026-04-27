existance--;
if (existance <= 0) {
	instance_destroy();
}
if (!is_real(x) || !is_real(y)) {
    show_debug_message("oBullet position corrupted");
    instance_destroy();
    exit;
}
if (startReset && !hasReversed && speed <= 0) {
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
	if (oItemManager.hasBrokenSnowglobe) {
		speed += increaseRate;
		damage += 0.025;
	}
	if (canAccel) {
		speed += increaseRate;
	}
	if (canDecel) {
		speed -= decayRate
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
	if (oItemManager.hasBrokenBoomerang) {
		boomerangTime--;
		if (boomerangTime <= 0) {
			speed -= decayRate
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