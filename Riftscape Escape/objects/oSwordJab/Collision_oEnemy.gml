if (!ds_exists(damagedList, ds_type_map)) {
	damagedList = ds_map_create();
}
if (!ds_map_exists(damagedList, other)) {
	ds_map_add(damagedList, other, true);
	enemyTakeDamage(damage, other, , , damageType.sword);
	if (oPlayerManager.hasSwordReality) {
		oPlayerManager.realitySwordBonus += global.playerReality;
	}
	healPlayer(global.lifesteal + damage*0.8 + global.playerEssence/5)
	if (oPlayerManager.hasSwordLife) {
		callDOT(other, damage*0.06, 25, 12, dotType.blood, oSword)
	}
}

if (!array_contains(oPlayerManager.swordJabObjArray, other.id) && !flipped) {
	with (other) {
		var i = array_get_index(slowTargetArray, other.object_index)
		if (i == -1) {
			array_push(slowArray,90);
			array_push(slowTargetArray, other.object_index)
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

