//sword stuff
swordMax = 1100;
sword_charge = swordMax;
swordTotal = swordMax;
swordDmgBonus = 0;
swordKills = 0;
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
dodgeMax = 500;
evilDodgeFlagIHate = false;
dodgeCharge = dodgeMax;
dodgeTotal = dodgeMax;
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
trackDodgeFate = false;
dodgeFateCheck = noone;
trackDodgeThoughtTimer = 0;
thoughtDodgeFireRateBoost = 0;
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
crystalMax = 2500;
crystalCharge = crystalMax;
crystalTotal = crystalMax;
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
essenceMinionCount = 0;


// fate circle stuff
circleMax = 2250;
initCircle = false;
circleCharge = circleMax;
circleTotal = circleMax;
circleCooldown = 100;
circleKey = "C";
circleThoughtUpgrade = false;
circleCooldownBonus = 0;
hasCircleThought = false;
hasCircleReality = false;
hasCircleTime = false;
hasCircleLife = false;
hasCircleEssence = false;
// mind husk
initHusk = false;
huskMax = 1600;
huskCharge = huskMax;
huskTotal = huskMax;
huskCooldown = 100;
huskKey = "T";
hasFateHusk = false;
hasEssenceHusk = false;
hasLifeHusk = false;
hasTimeHusk = false;
hasRealityHusk = false;
realityHuskSpeedBonus = 0;

// token stuff
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