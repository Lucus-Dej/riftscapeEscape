if (!array_contains(damageArray, other.id) && !evil) {
	if (oItemManager.hasLostCrown) {
		damage = 0.35;
	}
	array_push(damageArray, other.id);
	array_push(damageTimerArray, 0);
	enemyTakeDamage(damage, other);
	if (image_xscale < sizeMax) {
		if (oItemManager.hasLostCrown) {
			image_xscale *= 1.0008;
			image_yscale *= 1.0008;
		} else {
			image_xscale *= 1.0001;
			image_yscale *= 1.0001;
		}
	}
}
if (other. enemyHP <= 0) {
	if (image_xscale < sizeMax) {
		if (oItemManager.hasLostCrown) {
			image_xscale *=1.16;
			image_yscale *=1.16;
		} else {
			image_xscale *=1.12;
			image_yscale *=1.12;
		}
	}
}
if (evil) {
	var push =1;
	x -= lengthdir_x(push,point_direction(x,y,other.x,other.y));
	y-= lengthdir_y(push,point_direction(x,y,other.x,other.y));
}