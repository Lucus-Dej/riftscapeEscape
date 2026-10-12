// Inherit the parent event
event_inherited();

shoot_cooldown = irandom_range(10, 100);
shoot_delay = 160;
 enemyHP = 2.5;
enemSpeed = 0.2;
bullet_speed = 16.5;
baseSpeed = enemSpeed;
damage = 30.5;
searchPlayer();
chargeCooldown = 18;
chargeTime = chargeCooldown;
modifiedAlpha = 1;
if (global.difficulty >= 4) {
	damage = 42;
	shoot_delay = 110;
	bullet_speed = 18;
}
