event_inherited();
if (brainDead) {
    exit;
}

//path timer reduction
path_timer--;
if (phasePoint1 >= enemey_hp && enraged == false) {
	spawnNum -= 100;
	enemSpeed -= 1;
	bullet_speed = 1.5;
	fire_duration += 30;
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
		
		var bullet = bulletFire(x, y, bulletAng, bullet_speed, damage, oPoisonBullet, id);
		with (bullet) {
			if (layer_get_name(layer) != "Flying") {
				layer = layer_get_id("Flying");
			}
			bullet.isGhost = true;
			bullet.existance /= 2;
			bullet.dotDamage = damage*0.2;
			bullet.source = id;
			bullet.dotTicks = 4;
			bullet.dotDelay = 12;
			bullet.type = dotType.poison;
		}
		recoil_timer = recoil_cooldown;
		} else {
			shoot_cooldown = shoot_delay;
			recoil_timer = recoil_cooldown;
			fire_timer = fire_duration;
		}
	}
}
//pathfinding
if (dragTimer > 0) {
    applyDrag(dragPower, dragDir, oWalls);
    dragTimer--;

    if (dragTimer <= 0) {
        path_timer = 0;
    }
}
if (path_timer <= 0) {
    path_timer = path_cooldown;
    pathfind(global.flyGrid, oTruePlayer, enemSpeed, id);
}
spawnCheck = irandom(spawnNum)
if (isBoss) {
	spawnCheck = irandom(spawnNum/cooldownMult)
}

if (spawnCheck == 1) {
	var spawn = instance_create_layer(x, y, "Instances", oEnemDesertWasp);
	if (isBoss) {
		spawn.base_speed += 0.2;
	}
	spawn.xp = 0;
	spawn.enemey_hp *= 0.5;
	spawn.maxHP *= 0.5;
	spawn.image_xscale /= 2;
	spawn.image_yscale /= 2;
}