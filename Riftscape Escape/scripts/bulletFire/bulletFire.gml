function bulletFire(_x, _y, _dir, _speed, _damage, _bulletType, _owner, _silent = false, _skipMagnet = false) {
	var parent = noone;
	
	if (instance_exists(_owner)) {
		parent = object_get_parent(_owner.object_index);
	}
	var b = noone;
	if (instance_exists(_owner) && _owner.object_index == oTruePlayer) {
		
		if (global.playerCanFly) {
			 b = instance_create_layer(_x, _y, "Flying", _bulletType);
		} else {
			 b = instance_create_layer(_x, _y, "Instances", _bulletType);
		}
		if (oItemManager.hasPoisonCharm && oTruePlayer.currentSpeed == 0) {
			var poisCheck = irandom_range(1, 12);
			if (poisCheck + global.playerTime*0.6 >= 12) {
				b.canPois = true;
			}
		}
		if (oItemManager.hasBottleOil) {
			var oilCheck = irandom(15) + global.playerTime*0.4;
			if (oilCheck >= 15) {
				b.primedForOil = true;
			}
		}
	} else {
		 b = instance_create_layer(_x, _y, "Instances", _bulletType);
	}
   
	if (variable_instance_exists(b, "currentSpeed")) {
		b.currentSpeed = _speed;
	}
	
	if (instance_exists(_owner))
	if ((parent == oEnemy || parent == oSubEnemy || parent == oEnemyTurrets) && _owner.object_index != oTruePlayer) {
		with (_owner) {
			perfectParryTimer = 6;
		}
		var tempDiffSpeedMult = 1;
		if (global.difficulty == 1) {
			tempDiffSpeedMult = 0.6;
		} else if (global.difficulty >= 3) {
			tempDiffSpeedMult = 1.4;
		}
		if (variable_instance_exists(b, "currentSpeed")) {
			b.currentSpeed *= tempDiffSpeedMult;
			b.homeSpeed *= tempDiffSpeedMult;
			b.turnSpeed *= tempDiffSpeedMult;
		}
		if (global.playerInvis) {
			_dir = irandom(360);
		}
		if (!_silent) {
			if (global.enemBulletCount < 4) {
				global.enemBulletCount++;
			}
			if (global.enemBulletCount <= 2) {
				audio_play_sound(aEnemFire, 1, false, global.sfxAudio)
			}
			
		}
		
	}
	if (instance_exists(_owner))
	
	if (parent == oPlayerBullets || parent == oPlayerLifeStealBullets) {
		
		 if (turretApplied) {
			 b.isTurret = false;
			 b.turretApplied = true;
		 }
	 }
		
	
	b.baseSpeed = _dir;
    b.direction = _dir;
    b.image_angle = _dir;
    b.speed = _speed;
    b.damage = _damage;
    b.owner = _owner;
	if (instance_exists(_owner) && _owner.object_index == oTruePlayer) {
		var critNum = irandom_range(1, 100) + global.playerTime;
		if (place_meeting(_owner.x, _owner.y, oCricleOfFate) && oPlayerManager.hasCircleTime) {
			critNum *= 2;
		}
		if (_bulletType == oMinonBullet && oPlayerManager.hasMinionTime) {
			critNum *= 2.5;
		}
		if (critNum >= 100 || oPlayerManager.trueCrit) {
			oPlayerManager.trueCrit = false;
			b.damage = _damage * (1.3+(global.playerTime*0.015));
			b.image_xscale += 0.5;
			b.image_yscale += 0.5;
			b.image_blend = c_aqua;
			b.critShot = true;
			if (b.object_index == oMinonBullet) {
				b.sprite_index = sMinionFateBullet;
			}
			if (!_silent) {
				audio_play_sound(aSniperMiss, 1, false, global.sfxAudio)
			}
			
		}
	}
	if (instance_exists(_owner) && instance_exists(id)) {
		if (_owner.object_index == oVirstBoss && !_skipMagnet) {
			if (oItemManager.hasMagnet && oTruePlayer.orbitCount < 16) {
				var rand = irandom_range(1, 15);
				if (rand+6 >= 15) {
					var c =  bulletFire(_x, _y, _dir, _speed, _damage*.4, _bulletType, _owner, false, true);
					c.image_xscale -= 0.25;
					c.image_yscale -= 0.25;
					c.existance *= 3;
					c.canOrbit = true;
					c.orbitCenter = _owner;
					c.orbitAngle = point_direction(_owner.x, _owner.y, _x, _y);
					c.orbitTargetRadius = 64;
					_owner.orbitCount++;
					c.orbitRadius = 0;
					c.orbitAngle = _dir;
					c.orbitSpeed = _speed;
				}
			}
		}
	}
	if (instance_exists(_owner) && instance_exists(id))
	if (id.object_index == oTruePlayer && !_skipMagnet) {
		var critNum = irandom_range(1, 100) + global.playerTime;
		if (_bulletType == oMinonBullet && oPlayerManager.hasMinionTime) {
			critNum *= 2.5;
		}
		if (critNum >= 100 || oPlayerManager.trueCrit) {
			oPlayerManager.trueCrit = false;
			b.damage = _damage * (1.3+(global.playerTime*0.015));
			b.image_xscale += 0.5;
			b.image_yscale += 0.5;
			b.image_blend = c_aqua;
			b.critShot = true;
			if (b.object_index == oMinonBullet) {
				b.sprite_index = sMinionFateBullet;
			}
		}
		if (oItemManager.hasMagnet && oTruePlayer.orbitCount < 16) {
		var rand = irandom_range(1, 15);
			if (rand+global.playerTime >= 15) {
				var c =  bulletFire(_x, _y, _dir, _speed, _damage*.4, _bulletType, _owner, false, true);
				c.image_xscale -= 0.25;
				c.image_yscale -= 0.25;
				c.existance *= 3;
				c.canOrbit = true;
				c.orbitCenter = _owner;
				c.orbitAngle = point_direction(_owner.x, _owner.y, _x, _y);
				c.orbitTargetRadius = 64;
				oTruePlayer.orbitCount++;
				c.orbitRadius = 0;
				c.orbitAngle = _dir;
				c.orbitSpeed = _speed;
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
	audio_play_sound(aPlayerFire, 1, false, global.sfxAudio)
	if (!instance_exists(_owner)) {
		exit;
	}
	var parent = object_get_parent(_owner.object_index);
	 var b =  bulletFire(_x, _y, _dir, _speed, _damage, _bulletType, _owner);   //instance_create_layer(_x, _y, "Instances", _bulletType);
	 if (variable_instance_exists(b, "currentSpeed")) {
		 b.currentSpeed = _speed;
	 }
	 if (oItemManager.hasFireCharm) {
		 var fireCharmCheck = irandom_range(0, 8) + global.playerTime*0.75;
		 if (fireCharmCheck >= 8) {
			var fCount = 6;
			var spacing = 10;
			var startingAng = _dir - (spacing*fCount)/2;
			for (var i = 0; i < fCount; i++) {
				var ranSpeed = global.bullet_speed * (random_range(0.5, 1.5));
				fireFireFireCharm(_x, _y, startingAng, ranSpeed);
				startingAng += spacing;
			}
		 }
	 }
	  if (oItemManager.hasIceCharm) {
		 var iceCharmCheck = irandom_range(0, 8) + global.playerTime*0.75 - instance_number(oSnowStorm)*0.5;
		 if (iceCharmCheck >= 8) {
			var snowStorm = instance_create_layer(_x, _y, "Flying", oSnowStorm);
			snowStorm.direction = _dir;
			snowStorm.speed = _speed*0.6;
		 }
	 }
	 
	 if (parent == oPlayerBullets || parent == oPlayerLifeStealBullets ||  parent == oVirstBullet) {
		 if (turretApplied) {
			 b.isTurret = false;
			 b.turretApplied = true;
		 }
	 }
	/*if (oItemManager.hasMagnet && oTruePlayer.orbitCount < 16) {
		var rand = irandom_range(1, 15);
		if (rand+global.playerTime >= 15) {
			 
			var c = bulletFire(_x, _y, _dir, _speed, _damage, _bulletType, _owner);
			if (parent == oPlayerBullets || parent == oPlayerLifeStealBullets) {
				 show_debug_message("we shooting orbit turrets now")
				 if (turretApplied) {
					 c.isTurret = false;
					 c.turretApplied = true;
				 }
			 }
			c.existance *= 3;
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
	*/
	b.baseSpeed = _dir;
    b.owner = _owner;
	if (place_meeting(_owner.x, _owner.y, oCricleOfFate) && oPlayerManager.hasCircleReality && _owner.object_index == oTruePlayer) {
		var t = bulletFire(_x, _y, _dir, _speed*0.6, _damage*0.3, _bulletType, _owner);
		t.image_xscale /= 1.5;
		t.image_yscale /= 1.5;
	}
	/*var critNum = irandom_range(1, 100) + global.playerTime;
	if (critNum >= 100 || oPlayerManager.trueCrit) {
		oPlayerManager.trueCrit = false;
		b.damage = b.damage * (1.3+(global.playerTime*0.015));
		b.image_xscale += 0.5;
		b.image_yscale += 0.5;
		b.image_blend = c_aqua;
		b.critShot = true;
		audio_play_sound(aSniperMiss, 1, false, global.sfxAudio)
	} else {
		audio_play_sound(aPlayerFire, 1, false, global.sfxAudio)
	}*/
	if (instance_exists(oItemManager)) {
		if (oItemManager.hasMetalOrb) {
			var orbAngOffset = 25;
			b.damage = _damage*0.65;
			var sideBulletA = bulletFire(_x, _y, _dir-orbAngOffset, _speed, _damage*0.65, _bulletType, _owner);
			if (instance_exists(sideBulletA)) {
				if (variable_instance_exists(sideBulletA, "currentSpeed")) {
					sideBulletA.currentSpeed = _speed;
				}
				if (parent == oPlayerBullets || parent == oPlayerLifeStealBullets || parent == oVirstBullet) {
					if (turretApplied) {
						sideBulletA.isTurret = false;
						sideBulletA.turretApplied = true;
					}
				}
				/*
				sideBulletA.baseSpeed = _speed;
				sideBulletA.direction = _dir+orbAngOffset;
				sideBulletA.image_angle = _dir+orbAngOffset;
				sideBulletA.speed = _speed;
				sideBulletA.damage = _damage*0.65;
				sideBulletA.owner = _owner;
				var critNumA = irandom_range(1, 100) + global.playerTime;
				if (critNumA >= 100 || oPlayerManager.trueCrit) {
					oPlayerManager.trueCrit = false;
					sideBulletA.damage = b.damage * (1.3+(global.playerTime/40))*0.65;
					sideBulletA.image_xscale += 0.5;
					sideBulletA.image_yscale += 0.5;
					sideBulletA.image_blend = c_aqua;
					audio_play_sound(aSniperMiss, 1, false, global.sfxAudio)
				}*/
				if (place_meeting(_owner.x, _owner.y, oCricleOfFate) && oPlayerManager.hasCircleReality && _owner.object_index == oTruePlayer) {
					 var t = bulletFire(_x, _y, _dir+orbAngOffset, _speed*0.6, _damage*0.3, _bulletType, _owner);
						t.image_xscale /= 1.5;
						t.image_yscale /= 1.5;
				 }
			}
			
			
			
			var sideBulletB = bulletFire(_x, _y, _dir+orbAngOffset, _speed, _damage*0.65, _bulletType, _owner);
			if (instance_exists(sideBulletB)) {
					if (variable_instance_exists(sideBulletB, "currentSpeed")) {
					sideBulletB.currentSpeed = _speed;
				}
				if (parent == oPlayerBullets || parent == oPlayerLifeStealBullets || parent == oVirstBullet) {
					if (turretApplied) {
						sideBulletB.isTurret = false;
						sideBulletB.turretApplied = true;
					}
				}/*
				sideBulletB.baseSpeed = _dir;
				sideBulletB.direction = _dir-orbAngOffset;
				sideBulletB.image_angle = _dir-orbAngOffset;
				sideBulletB.speed = _speed;
				sideBulletB.damage = _damage*0.65;
				sideBulletA.owner = _owner;
				sideBulletB.owner = _owner;
				var critNumB = irandom_range(1, 100 ) + global.playerTime;
				if (critNumB >= 100 || oPlayerManager.trueCrit) {
					oPlayerManager.trueCrit = false;
					sideBulletB.damage = b.damage * (1.3+(global.playerTime/40))*0.65;
					sideBulletB.image_xscale += 0.5;
					sideBulletB.image_yscale += 0.5;
					sideBulletB.image_blend = c_aqua;
					audio_play_sound(aSniperMiss, 1, false, global.sfxAudio)
				}*/
				if (place_meeting(_owner.x, _owner.y, oCricleOfFate) && oPlayerManager.hasCircleReality && _owner.object_index == oTruePlayer) {
					 var t = bulletFire(_x, _y, _dir-orbAngOffset, _speed*0.6, _damage*0.3, _bulletType, _owner);
						t.image_xscale /= 1.5;
						t.image_yscale /= 1.5;
				 }
			}
		}
	}
}