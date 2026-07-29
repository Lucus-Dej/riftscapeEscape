
show_debug_message(irandom(100));
show_debug_message(irandom(100));
show_debug_message(irandom(100));

global.playerFate = 1; //damage
global.playerReality = 1; //speed
global.playerThought = 1; //cooldown
global.playerLife = 1; //health
global.playerTime = 1; //luck
global.playerEssence = 1; //lifesteal
event_user(0);
global.damageNumbers = [];
global.inCombat = false;
global.playerContactDmg = false;
global.playerCanFly = false;
global.Grid = mp_grid_create(0,0, room_width/ 32, room_height/32, 32, 32);
mp_grid_add_instances(global.Grid, oColl, true);
 
global.flyGrid = mp_grid_create(0,0, room_width/ 32, room_height/32, 32, 32);
mp_grid_add_instances(global.flyGrid, oIndestructable, true)
lastDamaged = noone;
//weird enemy / damage stuff
tookDamage = false;
incombat = false;
lastKilled = noone;
lastKilledX = 0;
lastKilledY = 0;
fireRate = 0;
fireRateCap = 10;
global.bossBarCount = 0;
global.activeRoom = false;
global.initEvilRoom = false;
bloodyGemCooldown = 12;
bloodyGemTimer = bloodyGemCooldown;
trueCrit = false;
gridDebugPressed = keyboard_check_pressed(vk_decimal)
toggleGrid = false;



iframes = 0;
if (global.difficulty == 1) {
	iframeTotal = 60;
} else if (global.difficulty == 2) {
	iframeTotal = 40;
} else if (global.difficulty >= 3) {
	iframeTotal = 24;
}


	
	
	


global.activeEssenceClones = 0;

enum fateMinionMode {
	idle,
	primed,
	attacking,
	returning,
	recharging
}

// health stuff
healthTotal = 100;
max_hp = healthTotal;
uiHealth = 100;
healthRatio = 1;
overhealthSuperCooldown = 1800;
overhealthSuperTotal = overhealthSuperCooldown;
overhealthCooldownUI = 0;
overhealthSuperTimer = 2100;
overhealthTimer = 100;
overhealthCooldown = overhealthTimer;
overHealthOverheated = false
overheatBar = noone;
overhealthFlag = true;

//xp
xpMult = 1;
if (global.difficulty == 4) {
	xpMult = 0.8;
}
xpTotal = 0;
xpLevel = 1;
totalXP = 0;
xpProgress = 200;
xpUI = 100;
overXP = 0;
canLevel = false;
levelKey = "Tab";
levelPressed = false;
leveling = false;
doneLeveling = false;
levelsPending = 0;
inLevelMenu = false;
levelMenuLayer = "levelingMenu";
inTokenMenu = false;
tokenMenuLayer = "tokenMenu";
checkTokenMenu = layer_get_visible(tokenMenuLayer);
checkLevelLayer = layer_get_visible(levelMenuLayer);


startX = 22;
startY = 48;
yIncrement = 10;
spacing = 28;

abilityActive = [initate_sword, initDodge, initCrystal, initCircle, initHusk];

abiltyCharge = [sword_charge, dodgeCharge, crystalCharge, circleCharge, huskCharge];

abilityKey = [swordAttKey, dodgeKey, crystalKey, circleKey, huskKey];

spriteCharging = [10, 4, 8, 0, 6];
spriteReady = [11, 5, 9, 1, 7];

abilityColor = [c_blue, c_orange, c_aqua, c_aqua, c_purple];




//basic player stat calcs
superCoolCooldownBonus = 0;
cooldownRate = 0;
baseCooldown = global.playerThought;
statCooldown = 0;
overHealthCooldownBuff = 0;
tesseractSpeedBonus = 0;
krostEssenceSpeedBouns = 0;
deltaItemBuff = 0;
global.playerInvis = false;
invisTimer = 0;
enum damageType {
	playerFire,
	playerPois,
	playerIce,
	playerBlood,
	playerLightning,
	
	dotFire,
	dotPois,
	dotBlood,
	dotIce,
	dotLightning,
	
	sword,
	dodge,
	husk,
	bomb,
	torzMinion,
	
	basic,
	contact,
}

global.contactDmg = 0;
dodgeContactDmg = 1;
addHPBonus = 0;
baseSpeed = 7;
statSpeed = 0;
dodgeSpeed = 0;
overHealthSpeedBonus = 0;

global.bullet_delay = 36;
baseBulletDelay = global.bullet_delay;
overHealthBulletDelay = global.playerEssence/4;
statBulletDelay = 0;
statBulletDebuff = 0;

baseDamage = 0.95;
statDamage = 0;
overHealthDamageBuff = 0;

global.playerSpeedPenalty = 0;
global.player_speed = baseSpeed;
global.playerSword = false;
global.playerKilled = false;
global.grid_cool = false;
global.lifesteal = global.playerEssence/10;
global.tempHP = 0;
global.playerDamage = 0;
global.upLife = false;
global.playerSpawned = false;
global.bigGo = "up";
global.bullet_cooldown = 0;
global.chosenBullet = oBullet;
global.explosionBullet = oBoom;
global.bullet_speed = 5+ global.playerReality;

lifeLeveled = 0;
fateLeveled = 0;
thoughtLeveled = 0;
timeLeveled = 0;
realityLeveled = 0;
essenceLeveled = 0;

canRich = false;
canPierce = false;
inOverhealth = false;
global.player_health = 100;

//item specific things
boomerangDmg = 0;
directorsDebuff = 1;
hasBrainInAJar = false;
brainJarBonus = 1;
tesseractBonusDamage = 0;
sculptureBonus = 1;
tesseractSpeed = 0;


debug = false;
uiX = 16;
uiY = 192+64;
uiLine = 0;
resW = 1366;
resH = 768;

// level stuff
levelArray = [caves0, caves01, f3, desert0, desert01, d3, wasteland0, wasteland02, w1, plains0, plains01, p3, theEnd, itemRoom]
levelIndex = 0;
currentLevl = levelArray[levelIndex]
nextLevel = levelArray[levelIndex +1];
confluxCost = 2;
xpThreshdolds = [];

//rune stuff
validRuneArray = [oItemDenyRune, oPowerUpRune, oBossRune, oTrapRune, oVeribroseRune, oVirstRune, oTorzolRune, oAlextraRune, oKrostRune, oSifterRune, oLifestealRune, oOverhealthRune, oBulletRangeRune, oBossDropRune, oExplosiveRune, oLuckRune, oXPReducedRune];
activeRuneArray = [];
hasItemDenyRune = false;
hasPowerUpRune = false
hasBossRune = false;
hasTrapRune = false;
hasKrostRune = false;
hasAlextraRune = false;
hasVirstRune = false;
hasTorzolRune = false;
hasSifterRune = false;
hasVeribroseRune = false;
hasLifestealRune = false;
hasOverhealthRune = false;
hasBulletRangeRune = false;
hasBossDropRune = false;
hasExplosiveRune = false;
hasLuckRune = false;
hasXPRune = false;
virstRuneSavedItem = noone;
hasSifterRune = false;
displayRuneDuration = 0;
runeTxt = "";
xpRuneReduction = 1;
krostRuneDebuff = 1;
lockAbilities = false;
decayAbilites = false;
siferRunePauseCooldown = 90;
sifterRunePauseTimer = 0;
