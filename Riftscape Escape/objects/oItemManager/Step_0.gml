if (searchItem == true) {
	if (bossSearch) {
		show_debug_message("BOSS ITEM SEARCH")
		bossSearch = false;
		//if (oPlayerManager.hasBossDropRune) exit;
		event_user(1);
	} else {
		event_user(0);
	}
	
	searchItem = false;
}
if (global.chargeItem != noone) {
	
}
if (elementalAuraPoints >= elementalAuraKillThreshold && oItemManager.hasElementalVortex) {
	summonElementalAuras();
	elementalAuraPoints = -100;
}
if (elementalAuraPoints > 0 && global.inCombat && !instance_exists(oElementalAura)) {
	elementalAuraPoints -= 0.01;
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
					enemyTakeDamage(sifterEssenceDmg*2.5, enem,,,damageType.playerBlood);
					oPlayerManager.overhealthTimer += 11.5;
				} else {
					enemyTakeDamage(sifterEssenceDmg, enem,,,damageType.playerBlood);
					oPlayerManager.overhealthSuperTimer -= 11.5;
					healPlayer(sifterEssenceDmg*6, true)
				}
			}
		}
	}
	if (sifterTimer <= 0) {
		sifterTimer = sifterCooldown;
	}
}
/*
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
}*/
if (hasTorzolEssence && global.player_health < oPlayerManager.max_hp*0.85 && global.inCombat) {
	if (torzTimer > 0) {
		torzTimer--;
	} else {
		torzTimer = torzCooldown;
		var missingHP = (oPlayerManager.max_hp - global.player_health);
		var torzBonus = (missingHP*0.015);
		healPlayer(torzBonus, true)
	}
	
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
if !(freedomFlyFlag && global.playerCanFly) {
	with (oTruePlayer) {
		if (!place_meeting(x, y, oSuperwalls)) {
			global.playerCanFly = false;
		}
	}
}

if (oSettingManager.queueEvilRuneAdd) {
	oSettingManager.queueEvilRuneAdd = false;
	var r = irandom(array_length(oPlayerManager.validRuneArray)-1);
	show_debug_message(oPlayerManager.validRuneArray)
	var rune = oPlayerManager.validRuneArray[r];
	var e = rollItem(true, itemSearchType.simple);
	itemAdd(e)
	enableRune(rune);
	show_debug_message(rune)
	array_delete(oPlayerManager.validRuneArray, r, 1);
	array_push(oPlayerManager.activeRuneArray, rune);
}
if (hasBloodyGem && !instance_exists(oBloodyGemMinion)) {
	instance_create_layer(oTruePlayer.x, oTruePlayer.y, "Instances", oBloodyGemMinion)
}
if (hasHorseWar && !instance_exists(oJavWarMinion)) {
	instance_create_layer(oTruePlayer.x, oTruePlayer.y, "Instances", oJavWarMinion)
}
if (hasHorseDeath && !instance_exists(oSyDeathMinion)) {
	instance_create_layer(oTruePlayer.x, oTruePlayer.y, "Instances", oSyDeathMinion)
}
if (hasHorsePest && !instance_exists(oDaggPestMinion)) {
	instance_create_layer(oTruePlayer.x, oTruePlayer.y, "Instances", oDaggPestMinion)
	instance_create_layer(oTruePlayer.x, oTruePlayer.y, "Instances", oDaggPestMinion)
}
if (hasHorseFamine && !instance_exists(oSickFamineMinion)) {
	var l = instance_create_layer(oTruePlayer.x, oTruePlayer.y, "Instances", oSickFamineMinion);
	l.rotation = 1;
	l.sprite_index = sSickleFamineMirrored;
	instance_create_layer(oTruePlayer.x, oTruePlayer.y, "Instances", oSickFamineMinion);
}
if (hasHorseCon && !instance_exists(oSwordConquestMinion)) {
	instance_create_layer(oTruePlayer.x, oTruePlayer.y, "Instances", oSwordConquestMinion)
}
