hit = other;
if (!ds_exists(damagedList, ds_type_map)) {
	damagedList = ds_map_create();
}
    if (!ds_map_exists(damagedList, hit.id)) {
        ds_map_add(damagedList, hit.id, true);
	other.enemey_hp -= damage + power(global.playerEssence, 1.2) * 0.2;
	
	global.player_health += global.lifesteal*2 + global.playerDamage/1.5+global.playerEssence/5;
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