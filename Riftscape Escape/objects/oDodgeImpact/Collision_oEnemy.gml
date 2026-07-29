hit = other;
if (!ds_exists(damagedList, ds_type_map)) {
	damagedList = ds_map_create();
}
if (!ds_map_exists(damagedList, hit.id)) {
	ds_map_add(damagedList, hit.id, true);
	enemyTakeDamage(damage, other,,,damageType.dodge);
	if (oPlayerManager.hasDodgeLife) {
		callDOT(other, global.playerLife*0.01 + 0.15, global.playerReality, 12, dotType.poison, object_index);
	}
}