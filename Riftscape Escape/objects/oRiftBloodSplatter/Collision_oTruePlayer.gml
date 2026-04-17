decayRate = 0.1;
canHeal = true;
if (oPlayerManager.hasDodgeThought && (oPlayerManager.dodgeState = DODGE_PHASE.dodging || oPlayerManager.dodgeState = DODGE_PHASE.blackflashing)) {
	oPlayerManager.thoughtDodgeCooldownBoost += 6.5;
}