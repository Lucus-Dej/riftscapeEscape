// Inherit the parent event
event_inherited();
shoot_cooldown = irandom_range(10, 110);
shoot_delay = 120;
image_xscale += 1;
image_yscale += 1;
enemyHP = 19;
enemSpeed = 1.4;
baseSpeed = enemSpeed;
damage = 20;
contactDamage = 35;
bullet_speed = 6.5;
searchPlayer();
bulletCount = 0;
attack = -1;
blackHole = noone;
blackholeDuration = 0;

