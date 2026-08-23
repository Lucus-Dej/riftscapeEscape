hit = other;
if (!ds_exists(damagedList, ds_type_map)) {
	damagedList = ds_map_create();
}
if (!ds_map_exists(damagedList, hit.id)) {
    ds_map_add(damagedList, hit.id, true);
	enemyTakeDamage(damage, other,,,damageType.bomb);
	healPlayer(damage*5, true)
	if (other. enemyHP <= 0) {
	if (oPlayerManager.hasCrystalEssence) {
		blood = instance_create_layer(other.x, other.y, "Instances", oEssenceCrystal)
	}
   oPlayerManager.hasBombKilled = true;
   global.playerKilled = true;
} 
}
