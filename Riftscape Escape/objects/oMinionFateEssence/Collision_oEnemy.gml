if (!array_contains(damageArray, other.id)) {
	enemyTakeDamage(damage, other,,, damageType.torzMinion);
	array_push(damageArray, other.id);
	array_push(damageTimerArray, 0);
	accelSpeed += 0.25;
}