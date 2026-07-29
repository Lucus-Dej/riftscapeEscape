event_inherited();
if (brainDead) {
    exit;
}

var playerDir = point_direction(x, y, oTruePlayer.x, oTruePlayer.y); 

if (phasePoint1 >=  enemyHP && enraged == false) {
	enemSpeed += 1.6;
	bullet_speed -= 2;
	fire_duration += 6;
	shoot_delay += 50;
	recoil_cooldown += 10;
	damage -= 6;
	enraged = true;
}
// countdown
shoot_cooldown--;
// fire when ready, fires default bullet
if (shoot_cooldown <= 0) {
	recoil_timer--;
	if (recoil_timer <= 0) {
		fire_timer --;
		if (fire_timer > 0) {
			var ang = point_direction(x, y, oTruePlayer.x, oTruePlayer.y);
			if (enraged) {
				var angBonus = irandom_range(35,55);
				bulletFire(x, y, (ang-angBonus), bullet_speed, damage, oBossBullet, id);
				bulletFire(x, y, (ang+angBonus), bullet_speed, damage, oBossBullet, id);
			}
			bulletFireAt(x, y, oTruePlayer, bullet_speed-0.5, damage, oBossBullet, id);
			recoil_timer = recoil_cooldown;
			} else {
				shoot_cooldown = shoot_delay;
				recoil_timer = recoil_cooldown;
				fire_timer = fire_duration;
		}
	}
}
