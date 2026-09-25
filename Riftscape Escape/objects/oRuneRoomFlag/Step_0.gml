if (instance_exists(oTruePlayer) && distance_to_object(oTruePlayer) < 320 && !gaveHint) {
	oPlayerManager.displayRuneDuration = 240;
	oPlayerManager.runeTxt = "Chose Your Fate... Every Penalty Comes With Reward";
	gaveHint = true;
}
if (displayDuration > 0) {
	displayDuration--;
	displayText(txt, true);
}