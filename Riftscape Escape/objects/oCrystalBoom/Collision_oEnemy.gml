hit = other;
if (!ds_exists(damagedList, ds_type_map)) {
	damagedList = ds_map_create();
}
if (!ds_map_exists(damagedList, hit.id)) {
    ds_map_add(damagedList, hit.id, true);
	damage = 2 + global.playerDamage + global.playerTime * 1.1;
	other.enemey_hp -= damage
	addDamageNumber(other.x, other.y, damage);
}

if (other.enemey_hp <= 0) {
	if (oPlayerManager.hasCrystalEssence) {
		blood = instance_create_layer(other.x, other.y, "Instances", oEssenceCrystal)
		if (oPlayerManager.hasCrystalReality) {
			blood.goUp = goUp;
			blood.goLeft = goLeft
			blood.goRight = goRight;
			blood.goDown = goDown;
		}
		blood.chainDistance = chainDistance;
	}
   instance_destroy(other);
   global.playerKilled = true;
   oPlayerManager.hasBombKilled = true;
} 