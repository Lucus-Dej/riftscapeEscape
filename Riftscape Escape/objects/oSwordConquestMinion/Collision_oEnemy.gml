if (primed && !array_contains(damageArray, other.id) && active) {
	enemyTakeDamage(damage, other,,true);
	array_push(damageArray, other.id);
	array_push(damageTimerArray, 0);
	accelSpeed += 0.005;
}