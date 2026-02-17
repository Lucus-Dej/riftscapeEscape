// Inherit the parent event
event_inherited();

enemey_hp = 500;

enragePoint1 = enemey_hp*(2/3);
enragePoint2 = enemey_hp*(1/3);
phase = 0;
xp = 35;
damage = 15;
attack = 0;
enemSpeed = 0.35;
base_enemSpeed = enemSpeed;
shoot_cooldown = 100;
shoot_delay = 420;
bullet_count = 8;
nadoActive = false;
segments = 6;
spacing = 112;
nadoIntensity = 16;
wallCount = 4;
wallTotal = wallCount;
wallSpawnCooldown = 90;
wallSpawnTimer = wallSpawnCooldown;
ringCount = 12;
ringBonus = 0;
spawnTimer = 450;

nadoFireTimer = 0;

lineAngle = 0;
lineCount = 2;

lineLength = 1500;
lineSpacing = 112;

lineRotateSpeed = 0.5;

lineTimer = 0;
lineInterval = 6;

with followLight {
	light[|eLight.Color] = $FF05177F;
	light[|eLight.Range] = 1024;
	light[|eLight.Intensity] = 2;
}