damage = global.playerDamage;
bounceNum = 0;
tracking = 0;
canBounce = false
canSpread = false;

if (oItemManager.hasUnstableEnergy && oPlayerManager.hasMinionFate) {
	canSpread = true
} 
if (oItemManager.hasMirrorShard && oPlayerManager.hasMinionFate) {
	canBounce = true
	bounceNum += 1;
	tracking = 1;
} 
if (oItemManager.hasDirtyMirror && oPlayerManager.hasMinionFate) {
	canBounce = true;
	bounceNum += 3;
	tracking = 0;
}
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
existance = 300;
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
if (oPlayerManager.canRich && oPlayerManager.hasMinionFate) {
	richCount = 1;
} else {
	richCount = 0;
}
decayRate = (global.playerReality + 4)/24
increaseRate = (global.playerReality + 2)/32
pierceDebuffed = false;
