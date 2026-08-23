if (torzFreeTimer <= 0 && canHome) {
	other.invincible = false;
	other.moveCount -= irandom_range(1, other.maxMoves-2);
	other.choice = -1;
	other.image_blend = c_green;
	with (oTorzolFountain) {
		active = true;
	}
	if (instance_exists(other.warning)) {
		instance_destroy(other.warning)
	}
	instance_destroy();
}