if (other.lastDamagedBy != id) {
	other.lastDamagedBy = id;
	
	other.enemey_hp -= global.playerDamage + power(global.playerEssence, 1.2) * 0.15;
	global.player_health += global.lifesteal + global.playerDamage/4+global.playerEssence/5;
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