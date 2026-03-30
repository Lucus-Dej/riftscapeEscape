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
if (oItemManager.hasBrokenSnowglobe) {
	speed += 0.25;
	damage += 0.025;
}
if (oItemManager.hasBrokenBoomerang) {
	boomerangTime--;
	if (boomerangTime <= 0) {
		speed -= 0.35;
	}
}
if (!ds_exists(damagedList, ds_type_map)) {
    show_debug_message("MAP DIED in " + string(object_index) + " id:" + string(id));
}
x += lengthdir_x(speed, direction);
y += lengthdir_y(speed, direction);