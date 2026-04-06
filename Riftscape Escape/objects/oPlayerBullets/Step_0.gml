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
if (oItemManager.hasBrokenBoomerang) {
	boomerangTime--;
	if (boomerangTime <= 0) {
		speed -= decayRate
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