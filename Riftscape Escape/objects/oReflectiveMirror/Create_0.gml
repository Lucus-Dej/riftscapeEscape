laser = noone;
flash = 0;
active = true;
if (conditional) {
	active = false;
}
laserList = ds_list_create();
pressInt = 12;
pressTimer = 0;
reflectingAng = 0;
setPower = function (_state) {
	
	if (_state) {
		active = true;
		
	} else {
		active = false;
		if (instance_exists(laser)) {
			instance_destroy(laser)
		}
	}
}