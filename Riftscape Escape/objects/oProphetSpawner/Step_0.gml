event_inherited();
if (brainDead) {
    exit;
}

if (phasePoint1 >=  enemyHP && enraged == false) {
	spawnNum -= 160;
	enemSpeed -= 1;
	bullet_speed = 1.5;
	fire_duration += 16;
	shoot_delay = 1;
	recoil_cooldown -= 6;
	enraged = true;
	enragedAngle = 1;
}


x += irandom_range(-2, 2);
y += irandom_range(-2, 2);
// countdown
shoot_cooldown--;
// fire when ready, fires default bullet
if (shoot_cooldown <= 0) {
	recoil_timer--;
	if (recoil_timer <= 0) {
		fire_timer --;
		if (fire_timer > 0) {
			enragedAngle = irandom_range(0, 359);
			bulletAng = enragedAngle;
		
		var bullet = bulletFire(x, y, bulletAng, bullet_speed, damage, oBadBullet, id);
		with (bullet) {
			if (layer_get_name(layer) != "Flying") {
				layer = layer_get_id("Flying");
			}
			bullet.existance /= 2;
			bullet.dotDamage = damage*0.2;
			bullet.source = id;
		}
		recoil_timer = recoil_cooldown;
		} else {
			shoot_cooldown = shoot_delay;
			recoil_timer = recoil_cooldown;
			fire_timer = fire_duration;
		}
	}
}
spawnCheck = irandom(spawnNum)
if (isBoss) {
	spawnCheck = irandom(spawnNum/cooldownMult)
}

if (spawnCheck == 1) {
	var spawn = instance_create_layer(x, y, "Instances", oMiniProphet);
	if (isBoss) {
		spawn.baseSpeed += 0.2;
	}
	spawn.xp = 0;
	spawn. enemyHP *= 0.1;
	spawn.maxHP *= 0.1;
	spawn.image_xscale /= 4;
	spawn.image_yscale /= 4;
}