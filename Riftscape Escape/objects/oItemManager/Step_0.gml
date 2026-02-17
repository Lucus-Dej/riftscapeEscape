if (searchItem == true) {
	event_user(0);
	searchItem = false;
}
//brain in a jar
if (oPlayerManager.hasBrainInAJar && oPlayerManager.tookDamage && !doBrain) {
	brainNum = irandom_range(0,9);
	doBrain = true;
	brainTime = 60;
}
if (doBrain) {
	if (brainNum = 0) {
		oPlayerManager.brainJarBonus = 4;
		if (brainTime >= 0) {
			brainTime --;
		}
		if (brainTime <= 0) {
			brainTime = 12;
			doBrain = false;
			oPlayerManager.brainJarBonus = 1;
		}
	} else {
		doBrain = false;
	}
}
// rare seed
if (hasRareSeed) {
	with oRoomManager {
		if (inCombat && !other.seedStart) {
			other.currentRoomManager = id;
			other.seedCombatCheck= true;
			other.seedStart = true;
		}
	}
}
if (seedCombatCheck && seedStart) {
	if (oPlayerManager.tookDamage) {
		seedFailed = true;
	}
	with currentRoomManager {
		if (!inCombat && !other.seedFailed) {
			global.player_health = oPlayerManager.max_hp;
			other.seedStart = false;
			other.seedFailed = false;
			other.seedCombatCheck = false;
		} else if (!inCombat && other.seedFailed) {
			other.seedCombatCheck = false;
			other.seedStart = false;
			other.seedFailed = false;
		}
	}
}
//sculpture stuff
if (hasSmallSculpture) {
	if (global.playerKilled) {
		sculptureTimer = 300;
		oPlayerManager.sculptureBonus = 1.15;
	}
	if (sculptureTimer <= 0) {
		oPlayerManager.sculptureBonus = 1;
	}
	if (sculptureTimer > 0) {
		sculptureTimer--;
	}
}

// image of you 
if (hasImageOfYou) {
	if (!instance_exists(oNotYou)) {
		instance_create_layer(oTruePlayer.x, oTruePlayer.y, "Instances", oNotYou)
	}
}
//gunpowder
if (hasGunpowder) {
	global.explosionBullet = oBigBoom;
}
// tesseract stuff
if (hasTesseract) {
	oPlayerManager.tesseractBonusDamage = (oTruePlayer.currentSpeed/10)
	if (oTruePlayer.currentSpeed > 1) {
		if (oPlayerManager.tesseractSpeedBonus <= 1.5) {
			oPlayerManager.tesseractSpeedBonus += 0.002;
			oPlayerManager.tesseractSpeed += 0.0085;
		}
	} else {
		oPlayerManager.tesseractSpeedBonus = 0;
		oPlayerManager.tesseractSpeed = 0;
	}
}
// Tethered Soul stuff
if (hasTetheredSoul) {
	if (!instance_exists(oTetheredSoul)) {
		instance_create_layer(oTruePlayer.x, oTruePlayer.y, "Instances", oTetheredSoul)
	}
}
