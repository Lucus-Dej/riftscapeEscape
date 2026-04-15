if (searchItem == true) {
	event_user(0);
	searchItem = false;
}
if (global.chargeItem != noone) {
	
}
//brain in a jar
if (oPlayerManager.hasBrainInAJar && oPlayerManager.tookDamage) {
	brainNum = irandom_range(0,4);
	bigBrainNum = irandom_range(0, 99)
}

if (bigBrainNum+global.playerTime >= 99) {
	if (global.chargeItem != noone) {
		global.currentCharges++;
	}
	bigBrainNum = -9;
}
if (brainNum+global.playerTime/2 >= 4) {
	oPlayerManager.brainJarBonus += 5.5;
	brainNum = -99999;
}
if (oPlayerManager.brainJarBonus > 1) {
	oPlayerManager.brainJarBonus -= 0.1;
}

// rare seed
if (hasRareSeed) {
	with oPlayerManager {
		if (incombat && !other.seedStart) {
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
		if (!incombat && !other.seedFailed) {
			healthUp(oPlayerManager.max_hp/10)
			var randLifeUp = irandom_range(1, 15);
			if (randLifeUp+global.playerTime >= 15) {
				lifeUp();
			}
			other.seedStart = false;
			other.seedFailed = false;
			other.seedCombatCheck = false;
		} else if (!incombat && other.seedFailed) {
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
	oPlayerManager.tesseractBonusDamage = (oTruePlayer.currentSpeed/25)
	if (oTruePlayer.currentSpeed > 1) {
		if (oPlayerManager.tesseractSpeed <= global.player_speed/2) {
			oPlayerManager.tesseractSpeedBonus += 0.002;
			oPlayerManager.tesseractSpeed += 0.0085;
		}
	} else {
		if (oPlayerManager.tesseractSpeedBonus > 0) {
			oPlayerManager.tesseractSpeedBonus /= 2;
		}
		if (oPlayerManager.tesseractSpeed > 0) {
			oPlayerManager.tesseractSpeed  /= 2;
		}
	}
}
// Tethered Soul stuff
if (hasTetheredSoul) {
	if (!instance_exists(oTetheredSoul)) {
		instance_create_layer(oTruePlayer.x, oTruePlayer.y, "Instances", oTetheredSoul)
	}
}
