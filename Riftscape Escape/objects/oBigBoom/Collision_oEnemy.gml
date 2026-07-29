var enem = other;
lastHit = enem;


if (purpose == 1) {
	if (!ds_exists(boomDamageList, ds_type_map)) {
        boomDamageList = ds_map_create();
    }
	if (!ds_map_exists(boomDamageList, enem.id)) {
        ds_map_add(boomDamageList, enem.id, true);
        enemyTakeDamage(damage, enem,,,damageType.bomb);
	}
}