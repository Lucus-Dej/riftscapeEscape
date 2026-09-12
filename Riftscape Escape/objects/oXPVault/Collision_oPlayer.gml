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
			tempXPMod = 0.25;
			break;
			
			case 3:
			tempXPMod = 0.6;
			break;
			
			case 4:
			tempXPMod = 0.95;
			break;
		}
		oPlayerManager.xpTotal -= 1;
		global.lifestats.xp += 1*tempXPMod;
		
	} else {
		if (oPlayerManager.levelsPending > 0) {
			downLevelPlayer();
		}
	}
}
if (keyboard_check(vk_alt)) {
	if (global.lifestats.xp > 0) {
		global.lifestats.xp --;
		oPlayerManager.xpTotal++;
		if (global.lifestats.xp < 0) {
			global.lifestats.xp = 0;
		}
	}
}