// Inherit the parent event
event_inherited();
RoomID = 0;
enemey_hp = 500;
baseHP = enemey_hp;
healthTotal = enemey_hp;
spawnPool = 350;
phasePoint1 = enemey_hp*(2/3);
phasedUpOne = false;
phasedUpTwo = false;
phasePoint2 = enemey_hp*(1/5);
healing = false;
phase = 1;
shield = noone;
spawnArray = [oRifterSniper, oRifterSlammer, oRifterSpitter, oEnemRifterSpider];
damage = 30;
attack = 0;
enemSpeed = 0.55;
base_speed = enemSpeed;
shoot_cooldown = 60;
shoot_delay = 400;
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