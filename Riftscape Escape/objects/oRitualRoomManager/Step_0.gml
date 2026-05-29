if (array_length(spawnArray) >= 3 && !instance_exists(oEnemy) && !finished) {
	oItemManager.ritualRerollAvailable = true;
	displayDuration = 240;
	disText = "Click An Item In Your Inventory To Reroll It";
	finished = true;
}
if (instance_exists(oTruePlayer) && distance_to_object(oTruePlayer) < 320 && !gaveHint) {
	displayDuration = 240;
	disText = "Ritual Room: Defeat All Bosses To Reroll An Item Of Your Choice";
	gaveHint = true;
}
if (displayDuration > 0) {
	displayDuration--;
	displayText(disText, true);
}