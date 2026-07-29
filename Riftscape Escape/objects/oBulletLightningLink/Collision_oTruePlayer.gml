if (!array_contains(damageArray, other.id) && evil) {
	playerTakeDamage(damage);
	array_push(damageArray, other.id);
	array_push(damageTimerArray, 0);
}