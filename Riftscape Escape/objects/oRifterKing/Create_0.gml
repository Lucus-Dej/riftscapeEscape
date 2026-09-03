// Inherit the parent event
event_inherited();
RoomID = 0;
enemyHP = 500;
baseHP =  enemyHP;
healthTotal =  enemyHP;
spawnPool = 350;
phasePoint1 =  enemyHP*(2/3);
phasedUpOne = false;
phasedUpTwo = false;
phasePoint2 =  enemyHP*(1/5);
healing = false;
phase = 1;
shield = noone;
spawnArray = [oRifterSniper, oRifterSlammer, oRifterSpitter, oEnemRifterSpider];
damage = 30;
attack = 0;
enemSpeed = 0.625;
baseSpeed = enemSpeed;
shoot_cooldown = 60;
shoot_delay = 300;
Manager = noone;
flagArray = [];
inUse = false;
segments = 11;
WaveTotal = 5;
waveCount = WaveTotal;
waveCooldown = 105;
waveTimer = waveCooldown;

shotAngle = 0;
spiralAng = 0;
spiralBuffer = 4.5;
spiralTimer = 0;
endDelay = 60;
endSpawned = false;
orbitDistance = 360;

slamDamage = 30;
slamCooldown = 60;
slamTimer = slamCooldown;
slamCount = 0;
slamLimit = 3;
attackDelay = 64;
attackTimer = attackDelay;
chargeTime = 0;
hsp = 0;
vsp = 0;
chargeTargetX = 0;
chargeTargetY = 0;
chargeDir = 0;

enum RIFTERCHARGE {
	IDLE, WINDUP, CHARGE, RECOVER
}
state = RIFTERCHARGE.IDLE;