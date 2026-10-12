event_inherited();
shoot_cooldown = irandom_range(10, 110);
shoot_delay = 160;
enemyHP = 3.6;
enemSpeed = 4.4;
baseSpeed = enemSpeed;
damage = 14.5;
bullet_speed = 6.5;
searchPlayer();
image_speed = 0;
rageTimer = 0;
rageBreak = 300;
halfRaged = false;
fullRaged = false;
image_xscale = 2;
image_yscale = 2;
if (global.difficulty >= 4) {
	damage = 18.5;
	shoot_delay = 110;
	rageBreak = 120;
	enemSpeed = 6;
	baseSpeed = enemSpeed;
	initalSpeed = enemSpeed;
}