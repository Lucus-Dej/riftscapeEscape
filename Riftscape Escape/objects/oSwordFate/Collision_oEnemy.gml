if (other.lastDamagedBy != id) {
	other.lastDamagedBy = id;
	var damage = global.playerDamage +sqrt(global.playerEssence) * 0.15;
	enemyTakeDamage(damage, other, , , damageType.sword);
	
	global.player_health += global.lifesteal + global.playerEssence*0.2;
}

instance_destroy();