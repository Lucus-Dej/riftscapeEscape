if (other.lastDamagedBy != id) {
	other.lastDamagedBy = id;
	if (oPlayerManager.hasSwordFate) {
		other.enemey_hp -= global.playerDamage*2;
	} else {
	other.enemey_hp -= global.playerDamage;
	}
	global.player_health += global.lifesteal*2 + global.playerDamage+global.playerEssence/5;
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