hit = other;
if (!ds_exists(damagedList, ds_type_map)) {
	damagedList = ds_map_create();
}
    if (!ds_map_exists(damagedList, hit.id)) {
        ds_map_add(damagedList, hit.id, true);
	if (chainDistance > 0) {
		other.enemey_hp -= 0.6 + global.playerTime/12
	} else {
		other.enemey_hp -= 1 + global.playerDamage/4 + global.playerTime/10;
	}
}
if (other.enemey_hp <= 0) {
	if (oPlayerManager.hasCrystalEssence) {
		blood = instance_create_layer(other.x, other.y, "Instances", oEssenceCrystal)
		blood.chainDistance = chainDistance;
		if (oPlayerManager.hasCrystalReality) {
			blood.goUp = goUp;
			blood.goLeft = goLeft
			blood.goRight = goRight;
			blood.goDown = goDown;
		}
	}
   instance_destroy(other);
   oPlayerManager.hasBombKilled = true;
   global.playerKilled = true;
} 