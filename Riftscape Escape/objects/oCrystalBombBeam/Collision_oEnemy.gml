if (!array_contains(damageArray, other.id)) {
	enemyTakeDamage(damage*0.1, other);
	array_push(damageArray, other.id);
	array_push(damageTimerArray, 0);
	
	if (other. enemyHP <= 0) {
		if (oPlayerManager.hasCrystalEssence) {
			blood = instance_create_layer(other.x, other.y, "Instances", oEssenceCrystal)
		}
		instance_destroy(other);
		oPlayerManager.hasBombKilled = true;
		global.playerKilled = true;
	}
}