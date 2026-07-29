if (manager == noone) {
	with (oWavebasedManager) {
		if (RoomID == other.RoomID) {
			other.manager = id;
		}
	}
}
if (instance_exists(manager) && manager.state = waveState.done && !finished) {
	displayDuration = 240;
	txt = "Your Luck And XP Have Increased. Take Your Reward";
	finished = true;
	var newItem = rollItem(true, itemSearchType.simple);
	spawnItem(newItem,id, RoomID);
}
if (instance_exists(oTruePlayer) && distance_to_object(oTruePlayer) < 320 && !gaveHint) {
	displayDuration = 240;
	txt = "Arena Room: Defeat Waves For XP/Luck Bonus And A Simple Reward";
	
	gaveHint = true;
}
if (displayDuration > 0) {
	displayDuration--;
	displayText(txt, true);
}