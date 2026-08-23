if (!array_contains(damageArray, other.id)) {
	enemyTakeDamage(damage, other,,,damageType.sword);
	array_push(damageArray, other.id);
	array_push(damageTimerArray, 0);
}