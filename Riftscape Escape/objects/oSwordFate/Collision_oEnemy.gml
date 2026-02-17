if (other.lastDamagedBy != id) {
	other.lastDamagedBy = id;
	if (oPlayerManager.hasSwordFate) {
		other.enemey_hp -= global.playerDamage*2;
	} else {
	other.enemey_hp -= global.playerDamage;
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
instance_destroy()