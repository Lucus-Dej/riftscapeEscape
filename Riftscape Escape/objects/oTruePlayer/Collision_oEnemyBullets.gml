if (!array_contains(damageArray, other.id)) {
	if (oPlayerManager.hasDodgeThought && (oPlayerManager.dodgeState = DODGE_PHASE.dodging || oPlayerManager.dodgeState = DODGE_PHASE.blackflashing)) {
		oPlayerManager.thoughtDodgeFireRateBoost += 1;
	}
	array_push(damageArray, other.id);
	array_push(damageTimerArray, 0);
}