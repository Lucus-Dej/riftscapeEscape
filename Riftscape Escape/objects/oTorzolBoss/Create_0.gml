event_inherited();
shoot_cooldown = irandom_range(10, 110);
shoot_delay = 130;
enemyHP = 220;
enemSpeed = 1.4;
baseSpeed = enemSpeed;
damage = 32.5;
//invincible = true;
bullet_speed = 6;
searchPlayer();
image_speed = 0;
rageTimer = 0;
rageBreak = 300;
halfRaged = false;
fullRaged = false;
revincibleDuration = 300;
moveCount = 0;
moveTotal = 6;
choice = -1;
maxMoves = 3
baseRegen = 0.001;
regenRate = baseRegen;
moveTimerFlex = 0;
phasePoint1 =  enemyHP*(2/3);
phase1Applied = false;
phasePoint2 = enemyHP*(1/2);
phase2Applied = false;
phasePoint3 =  enemyHP*(1/3);
phase3Applied = false;
phase = 0;
move1Count = 0;
move1Limit = 2;
move1Timer = 32;
move2count = 0;
move2Limit = 3

move3count = 0;
move3Limit = 1;
move3Timer = 60;
move3speed = 12;
warning = noone;

move4count = 0;
move4limit = 4;

move5BulletCount = 64;
move5rngRate = 0;

image_xscale = 2;
image_yscale = 2;
isBoss = true;
if (trueTorz) {
	moveTotal *= 2;
	shoot_delay -= 10;
	enemyHP *= 1.5;
	phasePoint1 *= 1.5;
	phasePoint2 *= 1.5;
	phasePoint3 *= 1.5;
	move3Timer -= 4; 
	move1Limit +=2;
	move2Limit += 4;
	move3Limit += 2;
	move3speed += 4;
	move4limit +=6;
}