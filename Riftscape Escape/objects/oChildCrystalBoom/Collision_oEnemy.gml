hit = other;
if (!ds_exists(damagedList, ds_type_map)) {
	damagedList = ds_map_create();
}
    if (!ds_map_exists(damagedList, hit.id)) {
        ds_map_add(damagedList, hit.id, true);
	if (chainDistance > 0) {
		damage = 0.3 + global.playerDamage/20 + global.playerTime/12;
		other.enemey_hp -= damage;
		addDamageNumber(other.x, other.y, damage);
	} else {
		damage = 1 + global.playerDamage/4 + global.playerTime/10;
		other.enemey_hp -= damage;
		addDamageNumber(other.x, other.y, damage);
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