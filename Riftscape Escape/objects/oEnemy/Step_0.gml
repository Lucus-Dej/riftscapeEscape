if (!bossModApplied && isBoss) {
	bossModApplied = true;
	enemey_hp *= hpMult;
	base_speed *= speedMult;
	enemSpeed *= speedMult;
	damage *= dmgMult;
	shoot_delay /= cooldownMult;
	event_user(13);
}
flash = max(0, flash - 0.15);
if (!maxHPSet) {
	maxHP = enemey_hp;
	maxHPSet = true;
}
if (respawnTimer <= 0) {
	var respawn = instance_nearest(x, y, oEnemStart)
	x = respawn.x;
	y = respawn.y;
	respawnTimer = 30;
}