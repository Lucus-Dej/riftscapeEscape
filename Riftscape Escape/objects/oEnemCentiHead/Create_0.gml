event_inherited();
enemyHP = 2;
shoot_delay = 15;
on_cooldown = false;
bite_timer = shoot_delay;
enemSpeed = 3.25;
baseSpeed = enemSpeed;
damage = 16.5;
contactDamage = damage;
bodyCount = 8;
bodyArray = [];
spawnedBody = false;
image_xscale = 0.75;
image_yscale = 0.75;
if (global.difficulty >= 4) {
	damage = 20;
	enemSpeed = 4;
	baseSpeed = enemSpeed;
}