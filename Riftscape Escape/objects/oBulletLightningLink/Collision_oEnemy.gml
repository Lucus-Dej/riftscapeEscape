if (!ds_exists(damagedList, ds_type_map)) {
	damagedList = ds_map_create();
}
if (!ds_map_exists(damagedList, other.id)) {
	ds_map_add(damagedList, other.id, true);
	enemyTakeDamage(damage, other);
}
