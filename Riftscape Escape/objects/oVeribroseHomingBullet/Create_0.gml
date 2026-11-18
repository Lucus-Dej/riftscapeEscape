event_inherited();
shoot_cooldown = irandom_range(10, 110);
shoot_delay = 160;
enemyHP = 300;
enemSpeed = random_range(3, global.player_speed*0.8);
baseSpeed = enemSpeed;
damage = 25;
bullet_speed = 6.5;
contactDamage = 25;
searchPlayer();
image_speed = 0;

/*if (global.difficulty >= 4) {
	damage = 18.5;
	shoot_delay = 110;
	rageBreak = 120;
	enemSpeed = 6;
	baseSpeed = enemSpeed;
	initalSpeed = enemSpeed;
}