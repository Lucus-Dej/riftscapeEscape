// xp stuff
xpUI = (xpTotal/xpProgress)*100;
if (global.grid_cool == false) {
	global.Grid = mp_grid_create(0,0, room_width/ 32, room_height/32, 32, 32);
	mp_grid_add_instances(global.Grid, oColl, 0);
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
	} else {
		layer_set_visible(levelMenuLayer, false)
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
		oItemManager.hasVirstEssence = false;
		var count = array_length(oItemManager.itemList);
		for (var i = array_length(oItemManager.itemList) - 1; i >= 0; i--) {
			var item = oItemManager.itemList[i];
			itemRemove(item);
		}
		refreshItemPool();
		for (var i = 0; i < count; i++) {
			var item = rollItem(true);
			itemAdd(item);
		}
		
	} else if (room == hordeSurvival) {
		room_goto(caves0);
		global.player_health = max_hp*0.3;
	} else {
		room_goto(dead);
		global.player_health = max_hp*0.3;
	}
	
}

//stat calcs
global.player_speed = (krostEssenceSpeedBouns + sculptureBonus*(baseSpeed + tesseractSpeed + realitySwordBonus + realityHuskSpeedBonus +statSpeed + dodgeSpeed+ overHealthSpeedBonus + global.playerSpeedPenalty)*0.8);
if (global.player_speed < 0) {
	global.player_speed = 0;
}
fireRate = (baseBulletDelay+statBulletDebuff)/(1 + ((statBulletDelay) + (brainJarBonus-1) + (tesseractSpeedBonus) + (overHealthBulletDelay)));
if (fireRate < fireRateCap) {
	global.bullet_delay = fireRateCap - ((fireRateCap - fireRate)*0.2);
} else {
	global.bullet_delay = fireRate;
}
global.playerDamage = (tesseractBonusDamage + baseDamage + statDamage + overHealthDamageBuff + boomerangDmg)/directorsDebuff;
global.bullet_speed = 5+ sqrt(global.playerReality*0.8);
global.contactDmg = krostEssenceSpeedBouns + dodgeContactDmg;
cooldownRate = superCoolCooldownBonus + brainJarBonus*(sqrt(baseCooldown + statCooldown + thoughtDodgeCooldownBoost + deltaItemBuff + overHealthCooldownBuff + circleCooldownBonus)*0.5);
if (krostEssenceSpeedBouns > 0) {
	krostEssenceSpeedBouns -= 0.002;
}
if (deltaItemBuff > 0) {
	deltaItemBuff--;
}

// rune stuff
if (!global.activeRoom && hasCooldownRune) {
	lockAbilities = true;
} else {
	lockAbilities = false;
}

//sword stuff
swordAttPressed = keyboard_check_pressed(ord(swordAttKey));
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
	moveSword = false;
	if (hasSwordFate) {
		fateSwordCount = global.playerFate;
		summonedSword = 0;
	}
	instance_create_layer(oTruePlayer.x, oTruePlayer.y, "Instances", oSword);
	swordTotal = 0;
}
if (hasSwordFate) {
	if (summonedSword < fateSwordCount) {
		fateSword = instance_create_layer(oTruePlayer.x, oTruePlayer.y, "Instances", oSwordFate);
		swordAng += 360/global.playerFate
		fateSword.swordAng = swordAng;
		summonedSword++;
	} else {
		oPlayerManager.moveSword = true;
	}
}
if (!instance_exists(oSwordFate)) {
	moveSword = false;
}
//dodge stuff
dodgePressed = keyboard_check_pressed(ord(dodgeKey));
if (global.playerReality >= 5 && evilDodgeFlagIHate) {
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
		if (!lockAbilities)
		dodgeTotal += 1 + (cooldownRate);
	}
}
if (iframes > 0) {
	iframes--;
}
if (dodgeState == DODGE_PHASE.onStandby) {
	inDodge = false;
	dodgeContactDmg = 0;
	if (dodgePressed) {
		instance_create_layer(oTruePlayer.x, oTruePlayer.y, "Instances", oDodgeImpact);
		dodgeContactDmg = 1;
		if (oItemManager.hasReflectiveGem) {
			var dir = point_direction(oTruePlayer.x,oTruePlayer.y, mouse_x, mouse_y);
			var enem = noone;
			with (oTruePlayer) {
				enem = instance_nearest(x, y, oEnemy) 
			}
			if (enem != noone) {
				dir = point_direction(oTruePlayer.x, oTruePlayer.y, enem.x, enem.y)
			}
			playerBulletFire(oTruePlayer.x, oTruePlayer.y, dir, global.bullet_speed*0.85, global.playerDamage*2, global.chosenBullet, oTruePlayer);
		}
		trackDodgeFate = true;
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
if (dodgeBlackFlashTimer > 0 && dodgeBlackFlashTimer < 15 && inDodge && dodgePressed) {
	if (oItemManager.hasReflectiveGem) {
		var dir = point_direction(oTruePlayer.x,oTruePlayer.y, mouse_x, mouse_y);
		var enem = noone;
		with (oTruePlayer) {
			enem = instance_nearest(x, y, oEnemy) 
		}
		if (enem != noone) {
			dir = point_direction(oTruePlayer.x, oTruePlayer.y, enem.x, enem.y)
		}
		playerBulletFire(oTruePlayer.x, oTruePlayer.y, dir, global.bullet_speed*0.85, global.playerDamage*2, global.chosenBullet, oTruePlayer);
	}
	trackDodgeFate = true;
	dodgeState = DODGE_PHASE.blackflashing;
	dodgeBlackFlashTimer = 100;
	dodgeDuration = 6;
	iframes = 22+(global.playerReality+global.playerTime)*2;
	dodgeSpeed =  16.5 + (global.playerReality/10)
} else if (dodgeBlackFlashTimer > 15 && inDodge && dodgePressed) {
	instance_create_layer(oTruePlayer.x, oTruePlayer.y, "Instances", oDodgeImpact);
	trackDodgeFate = true;
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
if (trackDodgeFate) {
	if (hasDodgeThought) {
		trackDodgeThoughtTimer = 240;
	}
	if (hasDodgeFate) {
		with (oEnemy) {
			if (point_distance(x, y, oTruePlayer.x, oTruePlayer.y) <= 256) {
				dragDir = point_direction(x, y, oTruePlayer.x, oTruePlayer.y);
				dragPower = 24;
				dragTimer = 6;
				path_end();
			}
		}
	}
	trackDodgeFate = false;
}

if (trackDodgeThoughtTimer > 0) {
trackDodgeThoughtTimer--;	
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
	if (oItemManager.hasReflectiveGem) {
		var dir = point_direction(oTruePlayer.x,oTruePlayer.y, mouse_x, mouse_y);
		var enem = noone;
		with (oTruePlayer) {
			enem = instance_nearest(x, y, oEnemy) 
		}
		if (enem != noone) {
			dir = point_direction(oTruePlayer.x, oTruePlayer.y, enem.x, enem.y)
		}
		playerBulletFire(oTruePlayer.x, oTruePlayer.y, dir, global.bullet_speed*0.85, global.playerDamage*2, global.chosenBullet, oTruePlayer);
	}
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
	realityBombCheck = BOMB_KILL_CHECK.success;
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
if (initMinion && hasMinionTime && !instance_exists(oMinionTime)) {
	if (oItemManager.hasReflectiveGem) {
		var dir = point_direction(oTruePlayer.x,oTruePlayer.y, mouse_x, mouse_y);
		var enem = noone;
		with (oTruePlayer) {
			enem = instance_nearest(x, y, oEnemy) 
		}
		if (enem != noone) {
			dir = point_direction(oTruePlayer.x, oTruePlayer.y, enem.x, enem.y)
		}
		playerBulletFire(oTruePlayer.x, oTruePlayer.y, dir, global.bullet_speed*0.85, global.playerDamage*2, global.chosenBullet, oTruePlayer);
	}
	instance_create_layer(oTruePlayer.x, oTruePlayer.y, "Instances", oMinionTime);
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
	if (oItemManager.hasReflectiveGem) {
		var dir = point_direction(oTruePlayer.x, oTruePlayer.y, mouse_x, mouse_y);
		var enem = noone;
		with (oTruePlayer) {
			enem = instance_nearest(x, y, oEnemy) 
		}
		if (enem != noone) {
			dir = point_direction(oTruePlayer.x, oTruePlayer.y, enem.x, enem.y)
		}
		playerBulletFire(oTruePlayer.x, oTruePlayer.y, dir, global.bullet_speed*0.85, global.playerDamage*2, global.chosenBullet, oTruePlayer);
	}
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
	if (oItemManager.hasReflectiveGem) {
		var dir = point_direction(oTruePlayer.x,oTruePlayer.y, mouse_x, mouse_y);
		var enem = noone;
		with (oTruePlayer) {
			enem = instance_nearest(x, y, oEnemy) 
		}
		if (enem != noone) {
			dir = point_direction(oTruePlayer.x, oTruePlayer.y, enem.x, enem.y)
		}
		playerBulletFire(oTruePlayer.x, oTruePlayer.y, dir, global.bullet_speed*0.85, global.playerDamage*2, global.chosenBullet, oTruePlayer);
	}
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
if (uiHealth > 100) {
	global.player_health = max_hp;
}
//if (global.playerKilled == true && inOverhealth) {
//	overhealthTimer += 20+global.playerEssence*10;
//}
if (thoughtDodgeCooldownBoost > 0) {
	thoughtDodgeCooldownBoost -= 0.1;
}

//healthRatio = power(1.02, global.playerLife - 1);
//max_hp = healthTotal *healthRatio;
uiHealth = (global.player_health/max_hp) * healthTotal;

// overhealth stuff
if (inOverhealth == false) {
	if (overHealthOverheated) {
		overhealthSuperTimer--;
	}
}
overhealthCooldown = 100 + 40+global.playerEssence*5

global.lifesteal = global.playerDamage* 0.35 + max_hp * (0.0025 + (global.playerEssence*0.0075))*oItemManager.sacDaggerBonus;

if (inOverhealth) {
	if (oItemManager.hasBloodyGem) {
		if (bloodyGemTimer > 0) {
			bloodyGemTimer--;
		} else {
			var num = irandom_range(1, 300);
			if (num+(global.playerTime*4) >= 300) {
				bloodyGemTimer = bloodyGemCooldown;
				if (instance_exists(oTruePlayer)) {
					playerBulletFire(oTruePlayer.x, oTruePlayer.y, irandom(360), global.bullet_speed*0.6, global.playerDamage*0.7, global.chosenBullet, oTruePlayer);
				}
			}
		}
		
	}
	dodgeLifeBonus = 0;
	overHealthSpeedBonus = sqrt(global.playerEssence) * 0.85;
	overHealthBulletDelay = sqrt(global.playerEssence)*0.26;
	overHealthDamageBuff = sqrt(global.playerEssence)*0.12;
	overHealthCooldownBuff = sqrt(global.playerEssence)*0.9;
	global.player_health = 115;
}
if (inOverhealth && overhealthFlag) {
	overhealthFlag = false;
	//cooldownRate += global.playerEssence/5;
}