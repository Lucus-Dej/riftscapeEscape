function bulletFire(_x, _y, _dir, _speed, _damage, _bulletType, _owner) {

    var b = instance_create_layer(_x, _y, "Instances", _bulletType);
	
    b.direction   = _dir;
    b.image_angle = _dir;
    b.speed       = _speed;
    b.damage      = _damage;
    b.owner       = _owner;
	if (instance_exists(_owner) && instance_exists(id))
	if (id.object_index == oTruePlayer && oItemManager.hasMagnet && oTruePlayer.orbitCount < 8) {
		var rand = irandom_range(1, 15);
		if (rand+global.playerTime >= 15) {
			b.canOrbit = true;
			b.orbitCenter = oTruePlayer;
			b.orbitAngle = point_direction(oTruePlayer.x, oTruePlayer.y, _x, _y);
			b.orbitTargetRadius = 90;
			oTruePlayer.orbitCount++;
			b.orbitRadius = 0;
			b.orbitAngle = _dir;
			b.orbitSpeed = _speed;
		}
	}
    return b;
}
function bulletFireAt(_x, _y, _target, _speed, _damage, _bulletType, _owner) {

    if (!instance_exists(_target)) return noone;

    var dir = point_direction(_x, _y, _target.x, _target.y);

    return bulletFire(_x, _y, dir, _speed, _damage, _bulletType, _owner);
}