if (!enraged) {
	if (conditional) {
		ds_list_clear(laserList)
		collision_circle_list(x, y-sprite_height*0.12, 32, oVeriLaser, true, false, laserList, true);
	
		var connected = false;
		for (var i = 0; i < ds_list_size(laserList); i++) {
			var laserCheck = laserList[| i];

			if (laserCheck.host != id) {
				connected = true;
				break;
			}
		}
		setPower(connected);
	}
	if (active && !instance_exists(laser)) {
		laser = instance_create_layer(x, y-sprite_height*0.14, "Items", oVeriLaser, {host: id, image_angle: laserAng});
		if (boss) {
			laser.target = oVeribroseBoss;
		}
	}
	if (instance_exists(laser) && !laser.targetFound) {
		laser.image_angle = lerp(laser.image_angle, laserAng, 0.1);
	}
	if (!active && instance_exists(laser)) {
		instance_destroy(laser)
	}
	if (instance_exists(oTruePlayer) && instance_exists(laser) && !laser.targetFound) {
		pressTimer--;
		var dist = point_distance(x, y, oTruePlayer.x, oTruePlayer.y);
		if (dist < 96) {
			oPlayerManager.runeTxt = "Press Space/Alt To Change Angle";
			oPlayerManager.displayRuneDuration = 60;
			if (keyboard_check(vk_space) && pressTimer <= 0) {
				pressTimer = pressInt
					laserAng -= 15;
			}
			if (keyboard_check(vk_alt) && pressTimer <= 0) {
				pressTimer = pressInt
					laserAng += 15;
			}
		}
	
	}
} else {
	var i = irandom(enragedAttackRate);
	if (i == 0) {
		doLaser = true;
	}
	if (doLaser) {
		if (!instance_exists(mazeLaser)) {
			mazeLaser = instance_create_layer(x, y-sprite_height*0.14, "Instances", oVeribroseBossLaser);
			mazeLaser.host = id;
			mazeLaser.image_xscale = 120;
		} else {
			var leadAmount = point_distance(x, y, oTruePlayer.x, oTruePlayer.y)*0.7;

			var moveDir = point_direction(0, 0, oTruePlayer.hsp, oTruePlayer.vsp);
			var moveSpeed = point_distance(0, 0, oTruePlayer.hsp, oTruePlayer.vsp);

			var futureX = oTruePlayer.x;
			var futureY = oTruePlayer.y;

			if (moveSpeed > 0) {
			    futureX += lengthdir_x(leadAmount, moveDir);
			    futureY += lengthdir_y(leadAmount, moveDir);
			}

			var dir = point_direction(x, y, futureX, futureY);
			var turnFactor = 0.05 * (1 - mazeLaserAlpha);
			laserDir -= angle_difference(laserDir, dir) * turnFactor;

			if (laserDir > 361) {
				laserDir -= 360;
			}
			if (laserDir < -1) {
				laserDir += 360;
			}
			if (mazeLaserAlpha < 1) {
				mazeLaserAlpha += mazeLaserInc;
				mazeLaserInc += 0.00015;
				mazeLaser.image_alpha = mazeLaserAlpha;
				mazeLaser.image_angle = laserDir
			} else {
				if (mazeLaserCurrentFrames < mazeLaserExistFrames) {
					mazeLaserCurrentFrames++;
				} else {
					mazeLaser.decay = true;
					mazeLaser = noone;
					mazeLaserNum++;
					mazeLaserCurrentFrames = 0;
					mazeLaserAlpha = -0.2;
					mazeLaserInc = 0.001;
					doLaser = false;
				}
			}
			
		}
	}
}

