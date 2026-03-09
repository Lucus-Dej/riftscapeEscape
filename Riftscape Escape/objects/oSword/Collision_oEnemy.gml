hit = other;
if (!ds_exists(damagedList, ds_type_map)) {
	damagedList = ds_map_create();
}
    if (!ds_map_exists(damagedList, hit.id)) {
        ds_map_add(damagedList, hit.id, true);
	other.enemey_hp -= global.playerDamage+global.playerEssence/5;
	
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