if (primed && !array_contains(damageArray, other.id)) {
	if (oItemManager.hasLostCrown) {
		callDOT(other, damage, 320, 16, dotType.poison, irandom(pestPower))
	} else {
		callDOT(other, damage, 320, 24, dotType.poison, irandom(pestPower))
	}
	other.effectHorsePest = true;
	//enemyTakeDamage(damage, other);
	array_push(damageArray, other.id);
	array_push(damageTimerArray, 0);
	accelSpeed += 0.25;
}