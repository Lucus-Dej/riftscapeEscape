// Inherit the parent event
event_inherited();
refireFlag = false;
gridBullet = false;
up = false;
down = false;
left = false;
right = false;
existance = irandom_range(110, 330)
bounceBullet = false
fired = false;
flash = 0;
bulletSpeed = 10;
// player ints
damagedList = ds_map_create();
nearbyBullets = ds_list_create();
dmgRefreshTime = oPlayerManager.iframeTotal;
flying = false;
tempGhostTimer = 0;
damageArray = [];
damageTimerArray = [];
links = [];
maxLinks = 6;
linkTimer = 0;
linkCooldown = 4;
makeTime = global.gameSteps;
connecter = noone;
connected = false;
damage = 5;
critShot = false;
bounceNum = 0;
tracking = 0;
canBounce = false
canSpread = false;
baseSpeed = 0;
spreadCount = 0;
collCheck = noone;
overkill = 0;
pierceDebuffed = false;
deceyToZero = false;
isTurret = false;
bounced = false;
canPush = false;
inCircle = false;
canParry = true;
parried = false;
link = noone;
newDir = 0;
bounceTarget = noone;
canLifesteal = false;
canAccel = false;
canDecel = false;
canOrbit = false
lastHit = noone;
existance = 120
decayRate = 0.1;
increaseRate = 0.35;
orbitCenter = oVirstBoss;
orbitRadius = 0;
orbitTargetRadius = 90;
orbitAngle = 0
orbitSpeed = 6;
boomerangTime = 12;
speed = 6;
richCount = 0;
resetTimer = 120;
startReset = false;
hasReversed = false;
ignoreEnemy = noone;
ignoreWall = noone;
target = noone;
turretCooldown = 120*0.7;
turretDelay = turretCooldown;
turretApplied = false;
firedFromTurret = false;
speedBonus = 0;
if (oItemManager.hasLaserPointer) {
	existance *= 1.2;
}
if (oItemManager.hasDartGun) {
	isTurret = true;
}
if (oPlayerManager.canRich) {
	richCount = 1;
} else {
	richCount = 0;
}
if (oItemManager.hasHeartPendent) {
	canBounce = true;
	bounceNum += 1;
}
if (oItemManager.hasUnstableEnergy) {
	canSpread = true
	spreadCount = 12;
} 
if (oItemManager.hasMirrorShard) {
	canBounce = true;
	bounceNum += 1;
	tracking = 1;
} 
if (oItemManager.hasDirtyMirror) {
	canBounce = true;
	bounceNum += 3;
}
if (oItemManager.hasBrokenSnowglobe) {
	canAccel = true;
	existance *= 1.3;
}
if (oItemManager.hasWeightlessHourglass) {
	decayRate*= 0.6;
}
if (oItemManager.hasBrokenBoomerang) {
	existance *= 1.6;
	canDecel = true;
	if (!oItemManager.hasDartGun) {
		
		deceyToZero = false;
	}
}
if (oItemManager.hasMagnet || global.playerCanFly) {
	flying = true
}
var pbCount = instance_number(oVirstBullet);
if (pbCount > 999) {
	existance = 4;
}