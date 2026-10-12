event_inherited();
shoot_cooldown = irandom_range(10, 25);
enemSpeed = 0.6;
baseSpeed = enemSpeed;
bullet_speed = 8;
shoot_delay = 120;
recoil_cooldown = 10;
fire_duration = 9;
fire_timer = fire_duration;
recoil_timer = 0;
 enemyHP = 15.5;
phasePoint1 =  enemyHP/2;
enraged = false;
move = -1;
damage = 9.5;
searchPlayer();
if (global.difficulty >= 4) {
	damage = 12;
	shoot_delay = 90;
}
