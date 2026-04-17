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
	if (oItemManager.hasBrokenSnowglobe && oPlayerManager.hasMinionFate) {
		speed += increaseRate;
		damage += 0.025;
	}
	if (canAccel && oPlayerManager.hasMinionFate) {
		speed += increaseRate;
	}
	if (canDecel && oPlayerManager.hasMinionFate) {
		speed -= decayRate
	}
	if (oItemManager.hasSingularity && oPlayerManager.hasMinionFate) {
		var dist = 720;
		var target = instance_nearest(x, y, oEnemy);
	if (instance_exists(target))
		if (point_distance(x, y, target.x, target.y) <= dist && lastHit != target) {
			var dir = point_direction(x, y, target.x, target.y);
			var pull = 10;
			x += lengthdir_x(pull*0.55, dir);
			y += lengthdir_y(pull*0.55, dir);
		}
	}
	if (oItemManager.hasBrokenBoomerang && oPlayerManager.hasMinionFate) {
		boomerangTime--;
		if (boomerangTime <= 0) {
			speed -= decayRate
		}
	}
}
if (oPlayerManager.canPierce && !pierceDebuffed && oPlayerManager.hasMinionFate) {
	speed *= 0.8
	pierceDebuffed = true;
}
if (!ds_exists(damagedList, ds_type_map)) {
    show_debug_message("MAP DIED in " + string(object_index) + " id:" + string(id));
}
x += lengthdir_x(speed, direction);
y += lengthdir_y(speed, direction);