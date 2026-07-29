event_inherited();
shoot_cooldown = irandom_range(10, 25);
enemSpeed = 1.05;
baseSpeed = enemSpeed;
bullet_speed = 4;
shoot_delay = 120;
recoil_cooldown = 10;
fire_duration = 9;
fire_timer = fire_duration;
recoil_timer = 0;
 enemyHP = 13;
phasePoint1 =  enemyHP/2;
enraged = false;
count = irandom_range(2, 4)
damage = 9.5;
enragedAngle = 0;
spawnCheck = 0;
spawnNum = 300;
flying = true;
if (layer_get_name(layer) != "Flying") {
	layer = layer_get_id("Flying");
}