if (!array_contains(damageArray, other.id) && !evil) {
	if (oItemManager.hasLostCrown) {
		damage = 0.35;
	} else {
		damage = 0.15;
	}
	array_push(damageArray, other.id);
	array_push(damageTimerArray, 0);
	enemyTakeDamage(damage, other);
}
if (other. enemyHP <= 0) {
	if (image_xscale < sizeMax) {
		if (oItemManager.hasLostCrown) {
			image_xscale *=1.15;
			image_yscale *=1.15;
		} else {
			image_xscale *=1.1;
			image_yscale *=1.1;
		}
	}
}
if (evil) {
	var push =1;
	x -= lengthdir_x(push,point_direction(x,y,other.x,other.y));
	y-= lengthdir_y(push,point_direction(x,y,other.x,other.y));
}