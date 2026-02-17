var enem = other;
lastHit = enem;


if (purpose == 1) {
	if (!ds_exists(boomDamageList, ds_type_map)) {
        boomDamageList = ds_map_create();
    }
	if (!ds_map_exists(boomDamageList, enem.id)) {
        ds_map_add(boomDamageList, enem.id, true);

        oPlayerManager.lastKilledX = enem.x;
        oPlayerManager.lastKilledY = enem.y;
		other.flash = 1;
        if (oItemManager.hasWaterDamagedNote && !enem.hasDamaged) {
            enem.enemey_hp -= 1.25*damage;
        } else {
            enem.enemey_hp -= damage;
        }
        if (enem.enemey_hp <= 0) {
            oPlayerManager.lastKilled = enem.id;
            instance_destroy(enem);
            global.playerKilled = true;
        }
	}
}