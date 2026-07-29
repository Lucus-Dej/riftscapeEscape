if (!array_contains(damageArray, other.id) && !evil) {
	enemyTakeDamage(damage, other);
	array_push(damageArray, other.id);
	array_push(damageTimerArray, 0);
}