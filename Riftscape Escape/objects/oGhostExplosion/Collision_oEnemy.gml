if (!ds_exists(damagedList, ds_type_map)) {
	damagedList = ds_map_create();
}
if (!ds_map_exists(damagedList, other.id)) {
    ds_map_add(damagedList, other.id, true);
	other.enemey_hp -= damage;
	addDamageNumber(other.x, other.y, damage);
}

if (other.enemey_hp <= 0) {
	overkill = damage - other.enemey_hp;
	instance_destroy(other);
	global.playerKilled = true;
	oPlayerManager.lastKilled = other.id;
	if (oItemManager.hasHauntedGravestone) {
		var ghost = instance_create_layer(x, y, "Instances", oGravestoneGhost);
		if (oItemManager.hasLostCrown) {
			ghost.damage += overkill*1.5;
		} else {
			ghost.damage += overkill*1.1;
		}
	}
} 