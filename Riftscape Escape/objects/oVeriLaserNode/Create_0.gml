laser = noone;
flash = 0;
active = true;
if (conditional) {
	active = false;
}
laserList = ds_list_create();
pressInt = 12;
pressTimer = 0;
enraged = false;
enragedAttackRate = 600;
mazeLaser = noone;
mazeLaserAlpha = -0.2;
mazeLaserInc = 0.001;
doLaser = false;
laserDir = 0;
mazeLaserExistFrames = 30;
mazeLaserCurrentFrames = 0;
mazeLaserNum = 0;
mazeLaserTotal = 0;
//sprite_index = sVeriCrystalAngry;
image_xscale = 4;
image_yscale = 4;
setPower = function (_state) {
	if (enraged) {
		active = true;
		sprite_index = sVeriCrystalAngry;
		exit;
	}
	if (_state) {
		active = true;
		sprite_index = sVeriCrystalChamber;
	} else {
		active = false;
		sprite_index = sVeriCrystalInactive;
		if (instance_exists(laser)) {
			instance_destroy(laser)
		}
	}
}