if (!maxHPSet) {
	maxHP =  enemyHP;
	maxHPSet = true;
}

if (brainDead) {
    exit;
}
if (!bossModApplied && isBoss) {
	bossModApplied = true;
	 enemyHP *= hpMult;
	baseSpeed *= speedMult;
	enemSpeed *= speedMult;
	damage *= dmgMult;
	shoot_delay /= cooldownMult;
	event_user(13);
}

flash = max(0, flash - 0.15);
