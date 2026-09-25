oPlayerManager.runeTxt = "Hold Space To Deposit Spare XP. Hold Alt To Withdraw."; 
oPlayerManager.displayRuneDuration = 60;
if (keyboard_check(vk_space)) {
	if (oPlayerManager.xpTotal > 0) {
		var tempXPMod = 0.1;
		switch (global.difficulty) {
			case 1:
			tempXPMod = 0.02;
			break;
			
			case 2:
			tempXPMod = 0.1;
			break;
			
			case 3:
			tempXPMod = 0.3;
			break;
			
			case 4:
			tempXPMod = 0.75;
			break;
		}
		var value = 10 + ramp;
		value = min(value, oPlayerManager.xpTotal)
		oPlayerManager.xpTotal -= value;
		global.lifestats.xp += value*tempXPMod;
		if (global.lifestats.xp >= 99999 && !global.meta.challenges.gotItemPiggyBank) {
			global.meta.challenges.gotItemPiggyBank = true;
			showChallenge("gotItemPiggyBank");
		}
		ramp++;
	} else {
		if (oPlayerManager.levelsPending > 0) {
			downLevelPlayer();
		}
	}
} else if (keyboard_check(vk_alt)) {
	ramp += 0.1;
	var value = 1 + ramp;
	value = min(value, global.lifestats.xp)
	if (global.lifestats.xp > 0) {
		global.lifestats.xp -= value;
		oPlayerManager.xpTotal += value;
		if (global.lifestats.xp < 0) {
			global.lifestats.xp = 0;
		}
	}
} else {
	ramp = 0;
}