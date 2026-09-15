global.grid_cool = false;
if (global.lifestats.coverBroken <= 100) {
	global.lifestats.coverBroken++;
} else if (!global.meta.challenges.gotItemHammer) {
	global.meta.challenges.gotItemHammer = true;
	showChallenge("gotItemHammer")
}