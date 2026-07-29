if (!array_contains(damageArray, other.id) && !other.sub) {
	enemyTakeDamage(damage, other,,,damageType.playerLightning);
	array_push(damageArray, other.id);
	array_push(damageTimerArray, 0);
}