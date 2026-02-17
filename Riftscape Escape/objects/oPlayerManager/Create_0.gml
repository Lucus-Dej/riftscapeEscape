global.playerFate = 1; //damage
global.playerReality = 1; //speed
global.playerThought = 1; //cooldown
global.playerLife = 1; //health
global.playerTime = 1; //luck
global.playerEssence = 1; //lifesteal

//weird enemy / damage stuff
tookDamage = false;
lastKilled = noone;
lastKilledX = 0;
lastKilledY = 0;

//sword stuff
sword_charge = 0;
swordTotal = 0;
swordCooldown = 100;
initate_sword = false;
swordAttKey = "Q";
swordAttPressed = false;
hasSwordReality = false;
hasSwordTime = false;
hasSwordThought = false;
hasSwordFate = false;
hasSwordLife = false;
swordCooldownBonus = 0;
swordCooldownBonusTime = 0;
moveSword = false;
fateSwordCount = 0
summonedSword = 0;
swordAng = 0;
count = 0;
swordAng = 0;
realitySwordBonus = 0;

//dodge stuff
initDodge = false;
evilDodgeFlagIHate = false;
dodgeCharge = 0;
dodgeTotal = 0;
dodgeCooldown = 100;
dodgeKey = "E";
isDodge = false;
inDodge = false;
dodgeDuration = 5.5;
dodgeFlag = true;
hasDodgeFate = false;
hasDodgeLife = false;
hasDodgeThought = false;
hasDodgeEssence = false;
hasDodgeTime = false;
iframes = 0;

trackDodgeFate = false;
dodgeFateCheck = noone;
trackDodgeThoughtTimer = 0;
thoughtDodgeCooldownBoost = 0;
dodgeEssenceTimer = 2;
dodgeLifeHP = 0
dodgeLifeStart = false;
dodgeLifeBonus = 0
dodgeBlackFlashTimer = 0;
dodgeBlackFlashCheck = false;
dodgeChainFailed = false;
enum DODGE_PHASE {
	locked, onCooldown, onStandby, dodging, blackflashing, blackflashRecovery, blackFlashChecking
}
dodgeState = DODGE_PHASE.locked;
	
	
	

//crystal stuff
initCrystal = false;
crystalCharge = 0;
crystalTotal = 0;
crystalCooldown = 100;
crystalKey = "R";
hasCrystalReality = false;
hasCrystalThought = false;
hasCrystalFate = false;
hasCrystalEssence = false;
hasCrystalLife = false;

bombActive = false;
hasBombKilled = false;

enum BOMB_KILL_CHECK {
	checking, failed, waiting, success
}
realityBombCheck = BOMB_KILL_CHECK.failed;
realityBombCooldownBoost = 0;

//minon stuff
initMinion = false;
hasMinionTime = false;
hasMinionReality = false;
hasMinionThought = false;
hasMinionEssence = false;
hasMinionFate = false;

// fate circle stuff
initCircle = false;
circleCharge = 0;
circleTotal = 0;
circleCooldown = 100;
circleKey = "C";
circleThoughtUpgrade = true;
circleCooldownBonus = 0;
hasCircleThought = false;
hasCircleReality = false;
hasCircleTime = false;
hasCircleLife = false;
hasCircleEssence = false;

// mind husk
initHusk = false;
huskCharge = 0;
huskTotal = 0;
huskCooldown = 100;
huskKey = "V";
hasFateHusk = false;
hasEssenceHusk = false;
hasLifeHusk = false;
hasTimeHusk = false;
hasRealityHusk = false;
realityHuskSpeedBonus = 0;

// health stuff
healthTotal = 100;
max_hp = healthTotal;
uiHealth = 100;
healthRatio = 1;
overhealthSuperCooldown = 1800;
overhealthSuperTotal = overhealthSuperCooldown;
overhealthCooldownUI = 0;
overhealthSuperTimer = 1799;
overhealthTimer = 100;
overhealthCooldown = overhealthTimer;
overHealthOverheated = false
overheatBar = noone;
overhealthFlag = true;

//xp
xpTotal = 0;
xpLevel = 1;
xpProgress = 45.0;
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


hasFateToken = false;
hasLifeToken = false;
hasRealityToken = false;
hasThoughtToken = false;
hasTimeToken = false;
hasEssenceToken = false;

fateTokenSpent = false;
lifeTokenSpent = false;
realityTokenSpent = false;
thoughtTokenSpent = false;
timeTokenSpent = false;
essenceTokenSpent = false;




//basic player stat calcs
superCoolCooldownBonus = 0;
cooldownRate = 0;
baseCooldown = global.playerThought;
statCooldown = 0;
overHealthCooldownBuff = 0;
tesseractSpeedBonus = 0;

baseSpeed = 4;
statSpeed = 0;
dodgeSpeed = 0;
overHealthSpeedBonus = 0;

global.bullet_delay = 50;
baseBulletDelay = global.bullet_delay;
overHealthBulletDelay = global.playerEssence/4;
statBulletDelay = 0;
statBulletDebuff = 0;

baseDamage = 0.95;
statDamage = 0;
overHealthDamageBuff = 0;


global.player_speed = baseSpeed;
global.playerSword = false;
global.playerKilled = false;
global.grid_cool = true;
global.lifesteal = global.playerEssence/20;
global.tempHP = 0;
global.playerDamage = 0;
global.upLife = false;
global.playerSpawned = false;
global.bigGo = "up";
global.bullet_cooldown = 0;
global.chosenBullet = oBullet;
global.explosionBullet = oBoom;
global.bullet_speed = 5+ global.playerReality;
canRich = false;
canPierce = false;
inOverhealth = false;
global.player_health = 100;

//item specific things
hasBrainInAJar = false;
brainJarBonus = 1;
tesseractBonusDamage = 0;
sculptureBonus = 1;
tesseractSpeed = 0;

uiX = 16;
uiY = 96;
uiLine = 0;
resW = 1366;
resH = 768;