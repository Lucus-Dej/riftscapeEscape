// xp stuff
xpUI = (xpTotal/xpProgress)*100;
if (global.grid_cool == false) {
	global.Grid = mp_grid_create(0,0, room_width/ 32, room_height/32, 32, 32);
	mp_grid_add_instances(global.Grid, oColl, 0);
	global.grid_cool = true;
}
if (xpTotal >= xpProgress) {
	xpTotal -= xpProgress;
	xpProgress *= 1.12;
	canLevel = true;
	levelsPending++;
	xpLevel++;
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
	if (inOverhealth) {
		overhealthTimer -= 75;
	}
	iframes = 3;
	tookDamage = false;
}

if (global.player_health <= 0) {
	if (oItemManager.hasTetheredSoul && instance_exists(oTetheredSoul)) {
		instance_destroy(oTetheredSoul)
		global.player_health =max_hp;
	} else {
	room_goto(dead);
	global.player_health = 1;
	}
}

//stat calcs
global.player_speed = sculptureBonus*(baseSpeed + tesseractSpeed + realitySwordBonus + realityHuskSpeedBonus +statSpeed + dodgeSpeed+ overHealthSpeedBonus);
global.bullet_delay = (baseBulletDelay+statBulletDebuff)/(1 + ((statBulletDelay) + (brainJarBonus-1) + (tesseractSpeedBonus) + (overHealthBulletDelay)));
global.playerDamage = tesseractBonusDamage + baseDamage + statDamage + overHealthDamageBuff;
global.bullet_speed = 5+ sqrt(global.playerReality*0.8);
cooldownRate = superCoolCooldownBonus + brainJarBonus*(sqrt(baseCooldown + statCooldown + thoughtDodgeCooldownBoost + overHealthCooldownBuff + circleCooldownBonus)*0.5);



//sword stuff
swordAttPressed = keyboard_check_pressed(ord(swordAttKey));
if (initate_sword) {
	sword_charge = swordTotal/13.5;
	if (swordTotal <= 1350) {
		swordTotal += 1+(cooldownRate + swordCooldownBonus);
	}
}
if (swordCooldownBonusTime >0) {
	swordCooldownBonusTime -= 0.8;
}
if (swordCooldownBonusTime <= 0) {
	swordCooldownBonus = 0;
}
if (swordTotal >= 1000 && swordAttPressed) {
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
if (global.playerReality >= 5) {
	dodgeLifeHP = global.player_health/4;
	dodgeCharge = dodgeTotal / 4.5;
}
if (initDodge && !evilDodgeFlagIHate) {
	dodgeState = DODGE_PHASE.onCooldown;
	evilDodgeFlagIHate = true;
}
if (dodgeState == DODGE_PHASE.onCooldown) {
	dodgeSpeed = 0;
	dodgeLifeStart = false;
	dodgeTotal += 1 + (cooldownRate);
	if (dodgeTotal >= 450) {
		dodgeState = DODGE_PHASE.onStandby;
	}
}
if (iframes > 0) {
	iframes--;
}
if (dodgeState == DODGE_PHASE.onStandby) {
	inDodge = false;
	if (dodgePressed) {
		trackDodgeFate = true;
		inDodge = true;
		dodgeTotal = 0;
		dodgeState = DODGE_PHASE.dodging;
		dodgeSpeed =  11.5 + (global.playerReality/10);
		dodgeDuration = 5.5;
		iframes = 2+global.playerReality;
	}
}
if (dodgeState == DODGE_PHASE.dodging) {
	dodgeDuration -= 0.5;
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
	trackDodgeFate = true;
	dodgeState = DODGE_PHASE.blackflashing;
	dodgeBlackFlashTimer = 100;
	dodgeDuration = 6;
	iframes = 2+global.playerReality+global.playerTime;
	dodgeSpeed =  16.5 + (global.playerReality/10)
} else if (dodgeBlackFlashTimer > 15 && inDodge && dodgePressed) {
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
	if (crystalTotal <= 2500) {
		crystalTotal +=1+(cooldownRate)+(realityBombCooldownBoost);
	}
}
if (crystalTotal >= 2500 && crystalPressed) {
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
	instance_create_layer(oTruePlayer.x, oTruePlayer.y, "Instances", oMinion);
}
if (initMinion && hasMinionTime && !instance_exists(oMinionTime)) {
	instance_create_layer(oTruePlayer.x, oTruePlayer.y, "Instances", oMinionTime);
}
// fate circle stuff
circlePressed = keyboard_check_pressed(ord(circleKey));
if (initCircle) {
	circleCharge = circleTotal/22.5;
	if (circleTotal <= 2250) {
		circleTotal +=1+(cooldownRate);
	}
}
if (circleTotal >= 2250 && circlePressed) {
	instance_create_layer(oTruePlayer.x, oTruePlayer.y, "Items", oCricleOfFate);
}
	
// husk stuff
huskPressed = keyboard_check_pressed(ord(huskKey))
if (global.playerThought >= 5) {
	huskCharge = huskTotal/17.5;
	if (huskTotal <= 1750) {
		huskTotal += 1+(cooldownRate);
	}
}
if (huskTotal >= 1750 && huskPressed) {
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
if (global.playerKilled == true && inOverhealth) {
	overhealthTimer = 110+global.playerEssence*10;
}
if (thoughtDodgeCooldownBoost > 0) {
	thoughtDodgeCooldownBoost -= 0.05;
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

global.lifesteal = (global.playerEssence/2+(global.playerDamage/3))*oItemManager.sacDaggerBonus;

if (inOverhealth == true) {
	dodgeLifeBonus = 0;
	overHealthSpeedBonus = sqrt(global.playerEssence) * 0.6;
	overHealthBulletDelay = sqrt(global.playerEssence)*0.1;
	overHealthDamageBuff = sqrt(global.playerEssence)*0.1;
	overHealthCooldownBuff = sqrt(global.playerEssence)*0.9;
	global.player_health = 9999;
}
if (inOverhealth && overhealthFlag) {
	overhealthFlag = false;
	//cooldownRate += global.playerEssence/5;
}