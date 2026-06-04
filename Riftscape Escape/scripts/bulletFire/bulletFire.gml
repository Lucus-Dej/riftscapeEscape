function bulletFire(_x, _y, _dir, _speed, _damage, _bulletType, _owner) {

    var b = instance_create_layer(_x, _y, "Instances", _bulletType);
	if (variable_instance_exists(b, "currentSpeed")) {
		b.currentSpeed = _speed;
	}
	b.baseSpeed = _dir;
    b.direction = _dir;
    b.image_angle = _dir;
    b.speed = _speed;
    b.damage = _damage;
    b.owner = _owner;
	if (instance_exists(_owner) && instance_exists(id))
	if (id.object_index == oTruePlayer) {
		var critNum = irandom_range(1, 100) + global.playerTime;
		if (critNum >= 100) {
			b.damage = b.damage * (1+(global.playerTime/20));
			b.image_xscale += 0.5;
			b.image_yscale += 0.5;
			b.image_blend = c_aqua;
			audio_play_sound(aSniperMiss, 1, false, global.sfxAudio)
		}
			if (oItemManager.hasMagnet && oTruePlayer.orbitCount < 16) {
			var rand = irandom_range(1, 15);
			if (rand+global.playerTime >= 15) {
				b.canOrbit = true;
				b.orbitCenter = oTruePlayer;
				b.orbitAngle = point_direction(oTruePlayer.x, oTruePlayer.y, _x, _y);
				b.orbitTargetRadius = 64;
				oTruePlayer.orbitCount++;
				b.orbitRadius = 0;
				b.orbitAngle = _dir;
				b.orbitSpeed = _speed;
			}
		}
	}
    return b;
}
function bulletFireAt(_x, _y, _target, _speed, _damage, _bulletType, _owner) {

    if (!instance_exists(_target)) return noone;

    var dir = point_direction(_x, _y, _target.x, _target.y);

    return bulletFire(_x, _y, dir, _speed, _damage, _bulletType, _owner);
}
function playerBulletFire(_x, _y, _dir, _speed, _damage, _bulletType, _owner) {
	 var b = instance_create_layer(_x, _y, "Instances", _bulletType);
	 if (variable_instance_exists(b, "currentSpeed")) {
		 b.currentSpeed = _speed;
	}
	if (oItemManager.hasMagnet && oTruePlayer.orbitCount < 16) {
		var rand = irandom_range(1, 15);
		if (rand+global.playerTime >= 15) {
			var c = instance_create_layer(_x, _y, "Instances", _bulletType);
			c.canOrbit = true;
			c.orbitCenter = oTruePlayer;
			c.orbitAngle = point_direction(oTruePlayer.x, oTruePlayer.y, _x, _y);
			c.orbitTargetRadius = 64;
			oTruePlayer.orbitCount++;
			c.orbitRadius = 0;
			c.orbitAngle = _dir;
			c.orbitSpeed = _speed;
			
		}
	}
	b.baseSpeed = _dir;
    b.direction = _dir;
    b.image_angle = _dir;
    b.speed = _speed;
	b.damage = _damage;
    b.owner = _owner;
	var critNum = irandom_range(100, 100) + global.playerTime;
	if (critNum >= 100) {
		b.damage = b.damage * (1.3+(global.playerTime*0.015));
		b.image_xscale += 0.5;
		b.image_yscale += 0.5;
		b.image_blend = c_aqua;
		b.critShot = true;
		audio_play_sound(aSniperMiss, 1, false, global.sfxAudio)
	}
	if (instance_exists(oItemManager)) {
		if (oItemManager.hasMetalOrb) {
			var orbAngOffset = 25;
			b.damage = _damage*0.65;
			var sideBulletA = instance_create_layer(_x, _y, "Instances", _bulletType);
			if (instance_exists(sideBulletA)) {
				if (variable_instance_exists(sideBulletA, "currentSpeed")) {
					sideBulletA.currentSpeed = _speed;
				}
				sideBulletA.baseSpeed = _dir;
				sideBulletA.direction = _dir+orbAngOffset;
				sideBulletA.image_angle = _dir+orbAngOffset;
				sideBulletA.speed = _speed;
				sideBulletA.damage = _damage*0.65;
				sideBulletA.owner = _owner;
				var critNumA = irandom_range(1, 100) + global.playerTime;
				if (critNumA >= 100) {
					sideBulletA.damage = b.damage * (1.3+(global.playerTime/40))*0.65;
					sideBulletA.image_xscale += 0.5;
					sideBulletA.image_yscale += 0.5;
					sideBulletA.image_blend = c_aqua;
					audio_play_sound(aSniperMiss, 1, false, global.sfxAudio)
				}
			}
			
			
			
			var sideBulletB = instance_create_layer(_x, _y, "Instances", _bulletType);
			if (instance_exists(sideBulletB)) {
					if (variable_instance_exists(sideBulletB, "currentSpeed")) {
					sideBulletB.currentSpeed = _speed;
				}
				sideBulletB.baseSpeed = _dir;
				sideBulletB.direction = _dir-orbAngOffset;
				sideBulletB.image_angle = _dir-orbAngOffset;
				sideBulletB.speed = _speed;
				sideBulletB.damage = _damage*0.65;
				sideBulletA.owner = _owner;
				sideBulletB.owner = _owner;
				var critNumB = irandom_range(1, 100) + global.playerTime;
				if (critNumB >= 100) {
					sideBulletB.damage = b.damage * (1.3+(global.playerTime/40))*0.65;
					sideBulletB.image_xscale += 0.5;
					sideBulletB.image_yscale += 0.5;
					sideBulletB.image_blend = c_aqua;
					audio_play_sound(aSniperMiss, 1, false, global.sfxAudio)
				}
			}
		}
	}
}