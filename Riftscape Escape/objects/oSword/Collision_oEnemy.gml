hit = other;
if (!ds_exists(damagedList, ds_type_map)) {
	damagedList = ds_map_create();
}
if (!ds_map_exists(damagedList, hit.id)) {
	ds_map_add(damagedList, hit.id, true);
	if (oItemManager.hasPoisonCharm) {
		callDOT(other, damage*0.04, 12, 12, dotType.poison, oTruePlayer);
	}
	enemyTakeDamage(damage, other, , , damageType.sword);
	if (oPlayerManager.hasSwordFate) {
		initSwordJabExplosion(damage);
	}
	healPlayer(global.lifesteal + damage*0.8 + global.playerEssence/5)
}

