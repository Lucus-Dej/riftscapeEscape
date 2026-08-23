function initSwordJabExplosion(_dmg){
	
	with (oEnemy) {
		if (!sub && jabbed) {
			enemyTakeDamage(_dmg*2, id, , , damageType.sword)
			jabbed = false;
		}
	}
}