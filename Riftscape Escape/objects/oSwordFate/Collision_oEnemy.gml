if (other.lastDamagedBy != id) {
	other.lastDamagedBy = id;
	var damage = global.playerDamage +sqrt(global.playerEssence) * 0.15;
	other.enemey_hp -= damage;
	addDamageNumber(other.x, other.y, damage);
	global.player_health += global.lifesteal + global.playerDamage/4+global.playerEssence/5;
}

if (other.enemey_hp <= 0) {
	if (other.xp > 0) {
		oPlayerManager.swordKills += 1;
		oPlayerManager.swordDmgBonus = sqrt(oPlayerManager.swordKills)*0.8 - 0.7;
	}
	if (oPlayerManager.hasSwordThought) {
		oPlayerManager.swordCooldownBonus = 12;
		oPlayerManager.swordCooldownBonusTime += 32;
	}
	instance_destroy(other);
	global.playerKilled = true;
}
instance_destroy()