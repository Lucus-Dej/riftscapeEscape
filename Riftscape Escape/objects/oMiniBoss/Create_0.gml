event_inherited();
shoot_cooldown = irandom_range(10, 25);
shoot_delay = 70;
angle = 10;
recoil_cooldown = 16;
fire_duration = 6;
fire_timer = fire_duration;
recoil_timer = 0;
enemyHP = 5;
enemSpeed = 1.6;
baseSpeed = enemSpeed;
base_enemSpeed = enemSpeed;
damage = 14.5;
batArray = [oEnemExplosiveBat, oEnemBat]
bullet_speed = 6;
angleAdd = 0;
image_speed = 0.4;
flying = true;
if (layer_get_name(layer) != "Flying") {
	layer = layer_get_id("Flying");
}