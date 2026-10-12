event_inherited();
 enemyHP = 3.3;
shoot_delay = 60;
on_cooldown = false;
bite_timer = shoot_delay;
dashDuration = 12;
dashTimer = dashDuration;
enemSpeed = 2.95;
baseSpeed = enemSpeed;
damage = 16.5;
contactDamage = damage;
bodyCount = 6;
bodyArray = [];
spawnedBody = false;
image_xscale = 0.75;
image_yscale = 0.75;
if (global.difficulty >= 4) {
	damage = 14;
	enemSpeed = 3.65;
	baseSpeed = enemSpeed;
}