if (primed && !array_contains(damageArray, other.id)) {
	enemyTakeDamage(damage, other);
	array_push(damageArray, other.id);
	array_push(damageTimerArray, 0);
	accelSpeed += 0.25;
	if (mode == SICKLEMODE.attacking && famPower < baseCooldown*1.1) {
		with (oSickFamineMinion) {
			famPower += 8;
		}
		
	}
	missCount = 0;
	
}