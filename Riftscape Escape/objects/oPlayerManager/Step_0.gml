// xp stuff
xpUI = (xpTotal/xpProgress)*100;
if (global.grid_cool == false) {
	global.Grid = mp_grid_create(0,0, room_width/ 32, room_height/32, 32, 32);
	mp_grid_add_instances(global.Grid, oColl, true);
	 
	global.flyGrid = mp_grid_create(0,0, room_width/ 32, room_height/32, 32, 32);
	mp_grid_add_instances(global.flyGrid, oIndestructable, true);
	global.grid_cool = true;
}
if (xpTotal >= xpProgress) {
	array_push(xpThreshdolds, xpProgress);
	xpTotal -= xpProgress;
	xpProgress *= 1.25;
	canLevel = true;
	levelsPending++;
	xpLevel++;
	
}
gridDebugPressed = keyboard_check_pressed(vk_enter);
if (gridDebugPressed) {
	toggleGrid = !toggleGrid;
	debug = !debug;
	show_debug_log(debug)
}
checkTokenMenu = layer_get_visible(tokenMenuLayer);
checkLevelLayer = layer_get_visible(levelMenuLayer);
levelPressed = keyboard_check_pressed(vk_tab)
if (checkTokenMenu || checkLevelLayer) {
	oPauseManager.forceUnpause = true;
	if (keyboard_check_pressed(vk_escape)) {
		inTokenMenu = false;
		inLevelMenu = false;
		layer_set_visible(tokenMenuLayer, false);
		layer_set_visible(levelMenuLayer, false);
	}
} else {
	oPauseManager.forceUnpause = false;
}
if (levelPressed) {
	inLevelMenu = !inLevelMenu;
	if (inLevelMenu) {
		layer_set_visible(levelMenuLayer, true)
		layer_set_visible(tokenMenuLayer, true)
	} else {
		layer_set_visible(levelMenuLayer, false)
		layer_set_visible(tokenMenuLayer, false)
	}
	if (inTokenMenu) {
		inTokenMenu = false;
		inLevelMenu = false;
		layer_set_visible(tokenMenuLayer, false)
		layer_set_visible(levelMenuLayer, false)
	}
}
if (levelsPending <= 0) {
	instance_destroy(oLevelManager)
}

if (canLevel && levelPressed && !leveling) {
	leveling = true;
}



if (leveling && levelsPending <=0) {
	canLevel = false;
	doneLeveling = false;
	leveling = false;
}



// damage and health stuff
if (tookDamage) {
	iframes = 24;
	tookDamage = false;
}
if (instance_exists(oEnemy)) {
	global.inCombat = true;
} else {
	global.inCombat = false;
}
if (global.player_health <= 0) {
	if (oItemManager.hasTetheredSoul && instance_exists(oTetheredSoul)) {
		instance_destroy(oTetheredSoul)
		global.player_health = max_hp;
	} else if (oItemManager.hasVirstEssence) {
		global.player_health = max_hp;
		itemRemove(oVirstEssence);
		var count = array_length(oItemManager.itemList);
		for (var i = array_length(oItemManager.itemList) - 1; i >= 0; i--) {
			var item = oItemManager.itemList[i];
			itemRemove(item);
		}
		refreshItemPool();
		for (var i = 0; i < count; i++) {
			var item = rollItem(true, itemSearchType.random);
			itemAdd(item);
		}
		
	} else if (room == hordeSurvival) {
		room_goto(caves0);
		global.player_health = max_hp*0.6;
	} else {
		room_goto(dead);
		global.player_health = max_hp*0.6;
	}
	
}
if (hasTorzolRune && global.player_health > oPlayerManager.max_hp*0.6) {
	var torzDrain = global.player_health * 0.001;
	global.player_health -= torzDrain;
}
//stat calcs
global.player_speed = (krostEssenceSpeedBouns + sculptureBonus*(baseSpeed + tesseractSpeed + realitySwordBonus + realityHuskSpeedBonus +statSpeed + dodgeSpeed+ overHealthSpeedBonus + global.playerSpeedPenalty)*0.8);
if (global.player_speed < 0) {
	global.player_speed = 0;
}
if (invisTimer > 0) {
	global.playerInvis = true;
	if (instance_exists(oPlayer)) {
		oPlayer.image_alpha = 0.4;
	}
	invisTimer --;
	if (invisTimer <= 0) {
		global.playerInvis = false;
		if (instance_exists(oPlayer)) {
		oPlayer.image_alpha = 1;
	}
	}
}
fireRate = (baseBulletDelay+statBulletDebuff)/(1 + ((thoughtDodgeFireRateBoost) + (thoughtCircleFireRateBoost) + (oItemManager.effectiveYinBonus) + (statBulletDelay) + (brainJarBonus-1) + (tesseractSpeedBonus) + (overHealthBulletDelay)));
if (fireRate < fireRateCap) {
	global.bullet_delay = fireRateCap - ((fireRateCap - fireRate)*0.2);
} else {
	global.bullet_delay = fireRate;
}
global.playerDamage = (tesseractBonusDamage + baseDamage + oItemManager.effectiveYangBonus + fateDamageBuff + overHealthDamageBuff + boomerangDmg)/staticItemDmgPercent;
global.bullet_speed = 5+ sqrt(global.playerReality*0.8);
global.contactDmg = krostEssenceSpeedBouns*0.8 + dodgeContactDmg;
if (oItemManager.hasKrostEssence) {
	global.contactDmg += oTruePlayer.currentSpeed*0.2;
}
cooldownRate = superCoolCooldownBonus + brainJarBonus*(sqrt(baseCooldown + statCooldown + deltaItemBuff + overHealthCooldownBuff + circleCooldownBonus)*0.5);
if (krostEssenceSpeedBouns > 0) {
	krostEssenceSpeedBouns -= 0.002;
}
if (deltaItemBuff > 0) {
	deltaItemBuff--;
}
if (sifterRunePauseTimer > 0) {
	sifterRunePauseTimer--;
	cooldownRate = 1;
}

// rune stuff
if (hasSifterRune && sifterRunePauseTimer <= 0) {
	cooldownRate = -1;
	if (swordTotal > 0) {
		swordTotal -= 0.6;
	}
	if (circleTotal > 0) {
		circleTotal -= 0.6;
	}
	if (dodgeTotal > 0) {
		dodgeTotal -= 0.6;
	}
	if (crystalTotal > 0) {
		crystalTotal -= 0.6;
	}
	if (huskTotal > 0) {
		huskTotal -= 0.6;
	}
}

//sword stuff
swordAttPressed = keyboard_check_released(ord(swordAttKey));
if (initate_sword) {
	sword_charge = swordTotal/(swordMax)*100;
	if (swordTotal <= swordMax) {
		if (!lockAbilities)
		swordTotal += 1+(cooldownRate + swordCooldownBonus);
	}
}
if (swordCooldownBonusTime >0) {
	swordCooldownBonusTime -= 0.8;
}
if (swordCooldownBonusTime <= 0) {
	swordCooldownBonus = 0;
}

if (swordTotal >= swordMax && swordAttPressed && initate_sword) {
	if (hasSwordFate) {
		fateSwordCount = global.playerFate;
		summonedSword = 0;
	}
	if (swordHoldCount < swordReleaseTime) {
		instance_create_layer(oTruePlayer.x, oTruePlayer.y, "Instances", oSwordJab);
		swordTotal = swordMax*0.85;
	} else {
		instance_create_layer(oTruePlayer.x, oTruePlayer.y, "Instances", oSword);
		if (hasSwordReality) {
			if (!instance_exists(oSwordReality))
			instance_create_layer(oTruePlayer.x, oTruePlayer.y, "Instances", oSwordReality);
		}
		
		swordTotal = 0;
	}
}
if (keyboard_check(ord(swordAttKey))) {
	swordHoldCount++;
} else {
	swordHoldCount = 0;
}
if (!instance_exists(oSwordFate)) {
	moveSword = false;
}
if (array_length(swordJabObjArray) > 0) {
	for (var i = array_length(swordJabObjArray) - 1; i >= 0; i--) {
		if (!instance_exists(swordJabObjArray[i])) {
			array_delete(swordJabTimerArray, i, 1);
			array_delete(swordJabObjArray, i, 1);
			continue;
		}
		if (swordJabTimerArray[i] < swordJabDuration) {
			swordJabTimerArray[i]++;
		} else {
			if (oPlayerManager.hasSwordTime) {
				for (var j = array_length(swordJabObjArray[i].links) - 1; j >= 0; j--) {
					if (instance_exists(swordJabObjArray[i].links[j])) {
						with (swordJabObjArray[i].links[j]) {
							instance_destroy();
						}
					}
				}
			}
			
			swordJabObjArray[i].brainDead = false;
			swordJabObjArray[i].jabbed = false;
			array_delete(swordJabTimerArray, i, 1);
			array_delete(swordJabObjArray, i, 1);
			continue;
		}
		
		var host = swordJabObjArray[i];
		if (oPlayerManager.hasSwordTime)
		for (var j = i + 1; j < array_length(swordJabObjArray); j++) {
			var otherObj = swordJabObjArray[j];
			
			if (!instance_exists(otherObj)) {
				continue;
			}
			var makeLink = true;
			
			for (var k = 0; k < array_length(host.links); k++) {
				var l = host.links[k];
				
				if (!instance_exists(l)) {
					continue;
				}
				if (l.host == otherObj || l.connector == otherObj) {
					makeLink = false;
					break;
				}
			}
			if (array_length(host.links) >= host.maxLinks) {
				makeLink = false;
			}
			if (makeLink) {
				var link = instance_create_layer(host.x, host.y, "Instances", oBulletLightningLink);
				link.checkDist = false;
				array_push(host.links, link);
				array_push(otherObj.links, link);
				
				link.host = host;
				link.connector = otherObj;
			}
		}
	}
}
//dodge stuff
dodgePressed = keyboard_check_pressed(ord(dodgeKey));
if (global.playerReality >= 6 && evilDodgeFlagIHate) {
	dodgeLifeHP = global.player_health/4;
	global.playerContactDmg = true;
	dodgeCharge = (dodgeTotal/dodgeMax)*100;
}
if (initDodge && !evilDodgeFlagIHate) {
	dodgeState = DODGE_PHASE.onCooldown;
	evilDodgeFlagIHate = true;
}
if (dodgeState == DODGE_PHASE.onCooldown) {
	dodgeSpeed = 0;
	dodgeLifeStart = false;
	dodgeContactDmg = 0;
	
	if (dodgeTotal >= dodgeMax) {
		dodgeState = DODGE_PHASE.onStandby;
	} else {
		dodgeTotal += 1 + (cooldownRate);
	}
}
if (iframes > 0) {
	iframes--;
}
if (dodgeState == DODGE_PHASE.onStandby) {
	if (dodgeTotal < dodgeMax) {
		dodgeState = DODGE_PHASE.onCooldown;
	}
	inDodge = false;
	dodgeContactDmg = 0;
	if (dodgePressed && dodgeTotal >= dodgeMax) {
		instance_create_layer(oTruePlayer.x, oTruePlayer.y, "Instances", oDodgeImpact);
		dodgeContactDmg = 1;
		inDodge = true;
		dodgeTotal = 0;
		dodgeState = DODGE_PHASE.dodging;
		dodgeSpeed =  18.5 + (global.playerReality/10);
		dodgeDuration = 6;
		iframes = 22+global.playerReality*2;
	}
}
if (dodgeState == DODGE_PHASE.dodging) {
	dodgeDuration -= 0.5;
	dodgeContactDmg = 1;
	if (hasDodgeLife && !dodgeLifeStart) {
		dodgeLifeBonus = dodgeLifeHP;
		dodgeLifeStart = true;
	}
	if (dodgeDuration <= 0) {
			if (hasDodgeTime && inDodge) {
			dodgeBlackFlashTimer = 100;
			dodgeBlackFlashCheck = true;
		}
		dodgeState = DODGE_PHASE.onCooldown;
	}
}
if (dodgeBlackFlashTimer > 0 && dodgeBlackFlashTimer < 20 && inDodge && dodgePressed) {

	dodgeState = DODGE_PHASE.blackflashing;
	dodgeBlackFlashTimer = 100;
	dodgeDuration = 6;
	iframes = 22+(global.playerReality+global.playerTime)*2;
	dodgeSpeed =  16.5 + (global.playerReality/10)
} else if (dodgeBlackFlashTimer > 15 && inDodge && dodgePressed) {
	instance_create_layer(oTruePlayer.x, oTruePlayer.y, "Instances", oDodgeImpact);
	dodgeState = DODGE_PHASE.onCooldown;
	inDodge = false;
	dodgeBlackFlashTimer = 0;
	dodgeDuration = 5.5;
}
if (dodgeBlackFlashTimer > 0) {
	dodgeBlackFlashTimer -= 1;
}
if (dodgeBlackFlashTimer <= 0) {
	dodgeBlackFlashCheck = false;
}
if (dodgeState == DODGE_PHASE.blackflashing) {
	dodgeDuration -= 0.5;
	dodgeContactDmg = 2;
	if (hasDodgeLife && !dodgeLifeStart) {
		dodgeLifeBonus = dodgeLifeHP;
		dodgeLifeStart = true;
	}
	if (dodgeDuration <= 0) {
		dodgeTotal = -100;
		dodgeState = DODGE_PHASE.onCooldown;
	}
}
if (hasDodgeEssence && dodgeDuration > 0 && inDodge) {
	instance_create_layer(oTruePlayer.x, oTruePlayer.y, "Instances", oBloodSpill);
}



//crystal stuff
crystalPressed = keyboard_check_pressed(ord(crystalKey));
if (initCrystal) {
	crystalCharge = crystalTotal/25;
	if (crystalTotal <= crystalMax) {
		if (!lockAbilities)
		crystalTotal +=1+(cooldownRate)+(realityBombCooldownBoost);
	}
}
if (crystalTotal >= crystalMax && crystalPressed && initCrystal) {
	instance_create_layer(oTruePlayer.x, oTruePlayer.y, "Instances", oCrystal);
	crystalTotal = 0;
}
if (instance_exists(oCrystalBoom) || instance_exists(oChildCrystalBoom)) {
	bombActive = true;
}
if ((instance_exists(oCrystalBoom) || instance_exists(oChildCrystalBoom)) && realityBombCheck != BOMB_KILL_CHECK.failed) {
	if (hasBombKilled) {
		realityBombCheck = BOMB_KILL_CHECK.failed;
	}
}
if (!instance_exists(oCrystalBoom) && !instance_exists(oChildCrystalBoom) && hasCrystalThought && realityBombCheck == BOMB_KILL_CHECK.checking && bombActive) {
	//realityBombCheck = BOMB_KILL_CHECK.success;
	bombActive = false;
}
if (realityBombCheck == BOMB_KILL_CHECK.success && hasCrystalThought) {
	realityBombCooldownBoost = 4;
	hasBombKilled = false;
}
if (realityBombCooldownBoost > 0 && realityBombCheck == BOMB_KILL_CHECK.success) {
	realityBombCooldownBoost -= 1;
	
	if (realityBombCooldownBoost <= 0) {
		realityBombCheck = BOMB_KILL_CHECK.checking;
	}
}
if (realityBombCheck == BOMB_KILL_CHECK.failed) {
	realityBombCooldownBoost = 0;
	if (crystalTotal >= 1500) {
		realityBombCheck = BOMB_KILL_CHECK.checking;
	}
}
//minion stuff
if (initMinion && !instance_exists(oMinion)) {
	/*if (oItemManager.hasReflectiveGem && instance_exists(oTruePlayer)) {
		var dir = point_direction(oTruePlayer.x,oTruePlayer.y, mouse_x, mouse_y);
		var enem = noone;
		with (oTruePlayer) {
			enem = instance_nearest(x, y, oEnemy) 
		}
		if (enem != noone) {
			dir = point_direction(oTruePlayer.x, oTruePlayer.y, enem.x, enem.y)
		}
		playerBulletFire(oTruePlayer.x, oTruePlayer.y, dir, global.bullet_speed*0.85, global.playerDamage*2, global.chosenBullet, oTruePlayer);
	} */
	instance_create_layer(oTruePlayer.x, oTruePlayer.y, "Instances", oMinion);
}
if (initMinion && hasMinionFate && !instance_exists(oMinionFate)) {
	
	instance_create_layer(oTruePlayer.x, oTruePlayer.y, "Instances", oMinionFate);
}
// fate circle stuff
circlePressed = keyboard_check_pressed(ord(circleKey));
if (initCircle) {
	circleCharge = circleTotal/(circleMax/100);
	if (circleTotal <= circleMax) {
		if (!lockAbilities)
		circleTotal += 1+(cooldownRate);
	}
}
if (circleTotal >= circleMax && circlePressed && initCircle) {
	instance_create_layer(oTruePlayer.x, oTruePlayer.y, "Items", oCricleOfFate);
}

// husk stuff
huskPressed = keyboard_check_pressed(ord(huskKey));
if (global.playerThought >= 5 && initHusk) {
	huskCharge = huskTotal/(huskMax/100);
	if (huskTotal <= huskMax) {
		if (!lockAbilities)
		huskTotal += 1+(cooldownRate);
	}
}
if (huskTotal >= huskMax && huskPressed && initHusk) {
	instance_create_layer(oTruePlayer.x, oTruePlayer.y, "Items", oMindHusk);
	huskTotal = 0;
}

if (realityHuskSpeedBonus >0) {
	realityHuskSpeedBonus -= 0.1;
}
if (realitySwordBonus > 0) {
	realitySwordBonus -= 0.05;
}

realitySwordBonus = clamp(realitySwordBonus, 0, 10);
// health stuff
hpSoftCap = max_hp*global.healthPenalty;
if (global.player_health > hpSoftCap) {
	global.player_health = hpSoftCap;
}
//if (global.playerKilled == true && inOverhealth) {
//	overhealthTimer += 20+global.playerEssence*10;
//}
if (thoughtDodgeFireRateBoost > 0) {
	thoughtDodgeFireRateBoost -= 0.1;
}

//healthRatio = power(1.02, global.playerLife - 1);
//max_hp = healthTotal *healthRatio;
uiHealth = (global.player_health/max_hp) * healthTotal;



if (global.difficulty == 1) {
	overhealthCooldown = 100 + 50+global.playerEssence*8
	global.lifesteal = (global.playerDamage* 0.4 + max_hp * (0.005 + (global.playerEssence*0.01))*oItemManager.sacDaggerBonus);
} else if (global.difficulty == 2) {
	overhealthCooldown = 100 + 40+global.playerEssence*5
	global.lifesteal = (global.playerDamage* 0.35 + max_hp * (0.0020 + (global.playerEssence*0.0055))*oItemManager.sacDaggerBonus);
} else if (global.difficulty >= 3) {
	overhealthCooldown = 100 + 40+global.playerEssence*5
	global.lifesteal = (global.playerDamage* 0.3 + max_hp * (0.0015 + (global.playerEssence*0.0035))*oItemManager.sacDaggerBonus);
}

if (global.player_health > hpSoftCap && !inOverhealth) {
	//global.player_health = hpSoftCap;
}

if (inOverhealth) {
	dodgeLifeBonus = 0;
	overHealthSpeedBonus = sqrt(global.playerEssence) * 0.85;
	overHealthBulletDelay = sqrt(global.playerEssence)*0.18;
	overHealthDamageBuff = sqrt(global.playerEssence)*0.12;
	overHealthCooldownBuff = sqrt(global.playerEssence)*0.95;
	global.player_health = 115;
}
if (inOverhealth && overhealthFlag) {
	overhealthFlag = false;
	//cooldownRate += global.playerEssence/5;
}