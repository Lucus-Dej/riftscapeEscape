function bulletFire(_x, _y, _dir, _speed, _damage, _bulletType, _owner) {

    var b = instance_create_layer(_x, _y, "Instances", _bulletType);

    b.direction   = _dir;
    b.image_angle = _dir;
    b.speed       = _speed;
    b.damage      = _damage;
    b.owner       = _owner;

    return b;
}
function bulletFireAt(_x, _y, _target, _speed, _damage, _bulletType, _owner) {

    if (!instance_exists(_target)) return noone;

    var dir = point_direction(_x, _y, _target.x, _target.y);

    return bulletFire(_x, _y, dir, _speed, _damage, _bulletType, _owner);
}