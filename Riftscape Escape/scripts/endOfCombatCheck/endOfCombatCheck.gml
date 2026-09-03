function endOfCombatCheck(){
	show_debug_message("CALLING END OF ROOM CHECK FOR ROOM ID: "+string(RoomID))
	if (oItemManager.hasReflectiveGem && !global.damageCheck) {
		oItemManager.reflectiveGemLuckBonus += 0.75;
	}
	if (!instance_exists(oDeathRuneSpecter) && oPlayerManager.hasDeathRune) {
		enem = spawnEnemViaEgg(60, oDeathRuneSpecter, false, false, RoomID, id, instance_nearest(x, y, oSpawnSpawner))
	}
	if (oItemManager.hasRareSeed && !global.damageCheck) {
		var randLifeUp = irandom_range(1, 8);
		show_debug_message((randLifeUp+global.playerTime*0.5 - (global.playerLife*0.25 + 0.25) ))
		if (randLifeUp+global.playerTime*0.5 - (global.playerLife*0.25) + 0.25 >= 8) {
			lifeUp();
		}
	}
}