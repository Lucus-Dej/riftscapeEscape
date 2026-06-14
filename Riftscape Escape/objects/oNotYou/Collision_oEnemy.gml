if (oItemManager.hasLostCrown) {
	damage = 0.35;
	sizeMax = 4.5;
}
if (timer <= 0) {
	enemyTakeDamage(damage, other);
	timer = cooldown;
}

if (other.enemey_hp <= 0) {
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