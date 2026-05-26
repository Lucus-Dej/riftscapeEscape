if (searchItem == true) {
	if (bossSearch) {
		event_user(1);
		bossSearch = false;
	} else {
		event_user(0);
	}
	
	searchItem = false;
}
if (global.chargeItem != noone) {
	
}
if (hasLilFurnace && !instance_exists(oLilFurnace)) {
	if (instance_exists(oTruePlayer)) {
		instance_create_layer(oTruePlayer.x, oTruePlayer.y, "Instances", oLilFurnace);
	}
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
if (hasVeribroseEssence && !veriFlagTP) {
	if (instance_exists(oGoNext)) {
		with (oGoNext) {
			other.savedRoom = owned.goFloor;
			owned.goFloor = other.veriRoom;
		}
		veriFlagTP = true;
	}
}
if (veriFlagTP && savedRoom != noone && room = veribroseItemRoom) {
	with (oGoNext) {
		owned.goFloor = other.savedRoom;
	}
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
if (hasSifterEssence) {
	sifterEssenceDmg = global.playerEssence/20;
	if (sifterTimer > 0) sifterTimer--;
	
	with (oEnemy) {
		var d = point_distance(x, y, oTruePlayer.x, oTruePlayer.y);
		
		if (d <= other.sifterEssenceRange) {
			
			if (!array_contains(other.sifterLinkArray, id)) {
				array_push(other.sifterLinkArray, id)
				var link = instance_create_layer(x, y, "Instances", oEnemyLink);
				 
				 link.enemyA = id;
				 with (oTruePlayer) {
					 link.enemyB = id;
				 }
				 array_push(other.sifterLinks, link);
			}
		}
	}
	for (var i = array_length(sifterLinkArray)-1; i >= 0; i--) {
		var enem = sifterLinkArray[i];
		if (!instance_exists(enem) || point_distance(oTruePlayer.x, oTruePlayer.y, enem.x, enem.y) > sifterEssenceRange) {
			if (instance_exists(sifterLinks[i])) {
				with (sifterLinks[i]) {
					instance_destroy();
				}
			}
			array_delete(sifterLinkArray,i,1);
			array_delete(sifterLinks,i,1);
		} else {
			if (sifterTimer <= 0) {
				if (oPlayerManager.inOverhealth) {
					enem.enemey_hp -= sifterEssenceDmg*2.5;
					oPlayerManager.overhealthTimer += 7.5;
				} else {
					enem.enemey_hp -= sifterEssenceDmg;
					oPlayerManager.overhealthSuperTimer -= 7.5;
					global.player_health += sifterEssenceDmg*10;
				}
				
				enem.flash = 1;
				
				if (enem.enemey_hp <= 0) {
					instance_destroy(enem)
				}
			}
		}
	}
	if (sifterTimer <= 0) {
		sifterTimer = sifterCooldown;
	}
}
if (hasAlextraEssence) {
	with (oEnemy) {
		if (array_get_index(other.alextraEntry, id) == -1) {
			array_push(other.alextraEntry, id);
			array_push(other.alextraDone, other.alextraTimer);
		}
	}
	if (array_length(alextraEntry) > 0) {
		for (var i = array_length(alextraEntry) - 1; i>= 0; i--) {
			if (alextraDone[i] > 0 && instance_exists(alextraEntry[i])) {
				alextraDone[i] --;
				alextraEntry[i].brainDead = true;
				alextraEntry[i].image_blend = c_purple;
			} else if (alextraDone[i] <= 0 && instance_exists(alextraEntry[i])) {
				alextraEntry[i].brainDead = false;
				alextraEntry[i].image_blend = c_white;
				
			} else {
				array_delete(alextraEntry, i, 1);
				array_delete(alextraDone, i, 1);
			}
		}
	}
}
if (hasTorzolEssence && global.player_health < oPlayerManager.max_hp*0.95 && global.activeRoom) {
	var missingHP = (oPlayerManager.max_hp - global.player_health);
	var torzBonus = (missingHP*0.0008)*global.playerLife/4;
	global.player_health += torzBonus;
}
// tesseract stuff
if (hasTesseract) {
	oPlayerManager.tesseractBonusDamage = (oTruePlayer.currentSpeed/18)
	if (oTruePlayer.currentSpeed > 1) {
		if (oPlayerManager.tesseractSpeed <= global.player_speed/3.5) {
			oPlayerManager.tesseractSpeedBonus += 0.002;
			oPlayerManager.tesseractSpeed += 0.0095;
		}
	} else {
		if (oPlayerManager.tesseractSpeedBonus > 0) {
			oPlayerManager.tesseractSpeedBonus /= 1.1;
		}
		if (oPlayerManager.tesseractSpeed > 0) {
			oPlayerManager.tesseractSpeed  /= 1.1;
		}
	}
}
// Tethered Soul stuff
if (hasTetheredSoul) {
	if (!instance_exists(oTetheredSoul)) {
		instance_create_layer(oTruePlayer.x, oTruePlayer.y, "Instances", oTetheredSoul)
	}
}
