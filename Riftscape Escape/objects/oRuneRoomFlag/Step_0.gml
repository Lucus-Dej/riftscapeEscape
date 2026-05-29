if (instance_exists(oTruePlayer) && distance_to_object(oTruePlayer) < 320 && !gaveHint) {
	displayDuration = 240;
	txt = "Chose Your Fate... Every Penalty Comes With Reward";
	gaveHint = true;
}
if (displayDuration > 0) {
	displayDuration--;
	displayText(txt, true);
}