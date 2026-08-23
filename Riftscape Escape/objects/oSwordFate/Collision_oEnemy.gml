if (other.lastDamagedBy != id) {
	other.lastDamagedBy = id;
	var damage = global.playerDamage +sqrt(global.playerEssence) * 0.15;
	enemyTakeDamage(damage, other, , , damageType.sword);
	other.jabbed = true;
	if (oPlayerManager.hasSwordReality) {
		oPlayerManager.realitySwordBonus += global.playerReality;
	}
	if (oPlayerManager.hasSwordLife) {
		callDOT(other, damage*0.06, 25, 12, dotType.blood, oSword)
	}
	healPlayer(global.lifesteal + global.playerEssence/5)
}
if (!array_contains(oPlayerManager.swordJabObjArray, other.id)) {
	with (other) {
		var i = array_get_index(slowTargetArray, oSwordJab)
		if (i == -1) {
			array_push(slowArray,90);
			array_push(slowTargetArray, oSwordJab)
			array_push(slowTimerArray, oPlayerManager.swordJabDuration);
			array_push(slowMaxTimerArray, oPlayerManager.swordJabDuration);
		} else {
			slowArray[i] = 90;
			slowTimerArray[i] = oPlayerManager.swordJabDuration;
			slowMaxTimerArray[i] = oPlayerManager.swordJabDuration;
		}
		jabbed = true;
		if (oPlayerManager.hasSwordThought) {
			brainDead = true;
			path_end()
		}
	}
	array_push(oPlayerManager.swordJabObjArray, other.id);
	array_push(oPlayerManager.swordJabTimerArray, 0);
}

instance_destroy();