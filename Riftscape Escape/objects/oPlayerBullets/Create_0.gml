damage = global.playerDamage;
critShot = false;
bounceNum = 0;
tracking = 0;
canBounce = false
canSpread = false;
baseSpeed = 0;
spreadCount = 0;
collCheck = noone;
overkill = 0;
decayRate = (global.playerReality + 4)/24
increaseRate = (global.playerReality + 2)/32
pierceDebuffed = false;
deceyToZero = false;
isTurret = false;

bounced = false;

inCircle = false;
canParry = true;
parried = false;

newDir = 0;
bounceTarget = noone;
canLifesteal = false;
canAccel = false;
canDecel = false;
canOrbit = false
lastHit = noone;
existance = 40+20*global.playerReality;
if (oItemManager.hasBrokenBoomerang) {
	existance *= 1.6;
}
orbitCenter = oTruePlayer;
orbitRadius = 0;
orbitTargetRadius = 90;
orbitAngle = point_direction(x, y, mouse_x, mouse_y);
orbitSpeed = global.bullet_speed;
boomerangTime = 12;
speed = global.bullet_speed;
richCount = 0;
resetTimer = 120;
startReset = false;
hasReversed = false;
damage = global.playerDamage;
image_angle = point_direction(
    x, y,
    oTruePlayer.x + oTruePlayer._xinput,
    oTruePlayer.y + oTruePlayer._yinput
);
damagedList = ds_map_create();
ignoreEnemy = noone;
ignoreWall = noone;
target = noone;
turretCooldown = global.bullet_delay*0.7;
turretDelay = turretCooldown;
turretApplied = false;
firedFromTurret = false;
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
	spreadCount = 6+global.playerTime;
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