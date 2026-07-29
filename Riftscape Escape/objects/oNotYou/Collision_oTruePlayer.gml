if (!array_contains(damageArray, other.id) && evil) {
	if (oItemManager.hasLostCrown) {
		damage = 3.5;
	} else {
		damage = 1.5;
	}
	array_push(damageArray, other.id);
	array_push(damageTimerArray, 0);
	playerTakeDamage(damage);
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