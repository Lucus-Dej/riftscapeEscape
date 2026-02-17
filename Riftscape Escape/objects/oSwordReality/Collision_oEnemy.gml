if (other.lastDamagedBy != id) {
	other.lastDamagedBy = id;
	other.enemey_hp -= global.playerDamage;
	if (oPlayerManager.hasSwordLife) {
	with other {
	event_user(14);
	doTick = true;
	dotTarget = self;
	dotTicks = 5;
	dotDelay = 25;
	dotDamage = global.playerFate/10;
	event_user(15);
	alarm[0] = dotDelay;
}
}
	global.player_health += (global.playerDamage) + global.lifesteal;
}
if (other.enemey_hp <= 0) {
	if (oPlayerManager.hasSwordThought) {
		oPlayerManager.swordCooldownBonus = 12;
		oPlayerManager.swordCooldownBonusTime = 30;
	}
	instance_destroy(other);
	global.playerKilled = true;
}