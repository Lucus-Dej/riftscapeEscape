if (other.lastDamagedBy != id) {
	other.lastDamagedBy = id;
	
	other.enemey_hp -= global.playerDamage + power(global.playerEssence, 1.2) * 0.15;
	global.player_health += global.lifesteal + global.playerDamage/4+global.playerEssence/5;
}

if (other.enemey_hp <= 0) {
	if (other.xp > 0) {
		oPlayerManager.swordKills += 1;
		oPlayerManager.swordDmgBonus = sqrt(oPlayerManager.swordKills)*1.3 - 1.2;
	}
	if (oPlayerManager.hasSwordThought) {
		oPlayerManager.swordCooldownBonus = 12;
		oPlayerManager.swordCooldownBonusTime += 32;
	}
	instance_destroy(other);
	global.playerKilled = true;
}
instance_destroy()