function copyBullet(_old, _new){
	
	var bulletData = {
		canBounce: _old.canBounce,
		turretApplied: _old.turretApplied,
		canSpread: _old.canSpread,
		spreadCount: _old.spreadCount,
		richCount: _old.richCount,
		blend: _old.image_blend,
		xscale: _old.image_xscale,
		yscale: _old.image_yscale,
		bounceNum: _old.bounceNum,
		critShot: _old.critShot,
	}
	array_copy(_new.damageArray, 0, _old.damageArray, 0, array_length(_old.damageArray))
	array_copy(_new.damageTimerArray, 0, _old.damageTimerArray, 0, array_length(_old.damageTimerArray))
	//unpack values into _new
	if (instance_exists(_new)) {
		with (_new) {
			richCount = bulletData.richCount;
			canBounce = bulletData.canBounce;
			turretApplied = bulletData.turretApplied;
			canSpread = bulletData.canSpread;
			spreadCount = bulletData.spreadCount;
			image_blend = bulletData.blend;
			image_xscale = bulletData.xscale;
			image_yscale = bulletData.yscale;
			bounceNum = bulletData.bounceNum;
			critShot = bulletData.critShot;
		}
	}
	
}