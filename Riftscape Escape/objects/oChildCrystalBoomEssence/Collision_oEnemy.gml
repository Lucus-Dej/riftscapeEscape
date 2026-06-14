hit = other;
if (!ds_exists(damagedList, ds_type_map)) {
	damagedList = ds_map_create();
}

if (!ds_map_exists(damagedList, hit.id)) {
        ds_map_add(damagedList, hit.id, true);
	if (chainDistance > 0) {
		damage = 0.1 + global.lifesteal/6;
		enemyTakeDamage(damage, other);
		global.player_health += damage;
	} else {
		damage = 0.65 + global.lifesteal/2;
		enemyTakeDamage(damage, other);
		global.player_health += damage;
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