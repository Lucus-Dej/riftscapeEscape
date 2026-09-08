laser = noone;
flash = 0;
active = true;
if (conditional) {
	active = false;
}
laserAng = 90;
laserList = ds_list_create();

image_xscale = 4;
image_yscale = 4;
setPower = function (_state) {
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