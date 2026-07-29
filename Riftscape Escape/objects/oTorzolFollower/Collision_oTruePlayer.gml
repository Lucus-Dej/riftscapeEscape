if (attackTimer <= 0) {
	attackTimer = attackCooldown;
	callDOT(other, 0.2, 999999, 12, dotType.blood, irandom(99999999999))
}
