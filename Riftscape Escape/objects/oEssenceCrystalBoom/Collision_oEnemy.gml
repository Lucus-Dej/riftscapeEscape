hit = other;
if (!ds_exists(damagedList, ds_type_map)) {
	damagedList = ds_map_create();
}
if (!ds_map_exists(damagedList, hit.id)) {
        ds_map_add(damagedList, hit.id, true);
	if (chainDistance > 0) {
		damage = 0.5 + global.lifesteal/5;
		addDamageNumber(other.x, other.y, damage);
		other.enemey_hp -= damage;
		global.player_health += damage;
	} else {
		damage = 2.5 + global.lifesteal + global.playerTime/5;
		addDamageNumber(other.x, other.y, damage);
		other.enemey_hp -= damage;
		global.player_health += damage;
	}
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
   oPlayerManager.hasBombKilled = true;
   global.playerKilled = true;
} 