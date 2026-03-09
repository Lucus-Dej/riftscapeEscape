function wdOrbitalAttack(){

var radius = 256;

for (var i = 0; i < bullet_count; i++) {
    var angle = i * (360 / bullet_count);
    var bx = x + lengthdir_x(radius, angle);
    var by = y + lengthdir_y(radius, angle);
	var b = bulletFire(bx, by, 4, 0, damage, owdBullets, id)
	b.type = 2;
    b.image_xscale = 4;
	b.image_yscale = 4;
	b.image_angle = 0;
	b.playerSummon = true;
    b.orbitCenter = id;
    b.orbitAngle = angle;
    b.orbitRadius = radius;
	b.accel = false;
	b.existance = 600;
	b.rotate = true;
}
}

function wdSummonFireRunners() {
	if (instance_exists(oWastelandFireRunner)) {
		sumEnem = oWastelandBurner;
		attack = 0;
		shoot_cooldown = 0;
		return;
	} else {
		sumEnem = oWastelandFireRunner;
	}
	count = irandom_range(1, 1);
	wdSummonList = ds_list_create();
	with oEnemStart {
		if (RoomID == other.RoomID) {
			ds_list_add(other.wdSummonList, id);
		}
	}
	for (var i = 0; i < count; i++) {
		var e = irandom(ds_list_size(wdSummonList) - 1);
		pick = wdSummonList[| e];
		summon = instance_create_layer(pick.x, pick.y, "Instances", sumEnem);
		summon.enemey_hp = enemey_hp/8;
	}
	ds_list_destroy(wdSummonList)
}
	
function wdFirewall() {
	
	var dir = point_direction(x, y, oTruePlayer.x, oTruePlayer.y);

	for (var i = -segments/2; i <= segments/2; i++) {
		var offset = i*spacing;
		
		var px = x + lengthdir_x(offset, dir + 90);
		var py = y + lengthdir_y(offset, dir + 90);
		
		var f = bulletFire(px, py, dir, 8, damage/1.25, owdBullets, id);
		f.accel = false;
		f.image_xscale = 2;
		f.image_yscale = 2;
	}
}
function wdFirenado(_count) {
	
    nadoActive = true;

    nadoCount = _count;
    nadoAngle = 0;
    nadoSpin = choose(-1, 1) * random_range(2, 4);

    nadoFireTimer = 0;
    nadoFireDuration = 500; 

    nadoRingSpeed = 1.8;
}
function wdFireShield(_count) {
	nadoActive = true;

    nadoCount = _count;
    nadoAngle = 0;
    nadoSpin = choose(-1, 1) * random_range(2, 4);

    nadoFireTimer = 0;
    nadoFireDuration = 180; 

    nadoRingSpeed = 1.2;
}
function spawnFireLine(_angle) {
    spawnFireHalf(_angle);        // forward
    spawnFireHalf(_angle + 180);  // backward
}

function spawnFireHalf(_angle,) {
    var maxDist = lineLength;

    var hit = collision_line( x, y, x + lengthdir_x(maxDist, _angle), y + lengthdir_y(maxDist, _angle), oSuperwalls, false, true);

    if (hit != noone) {
        maxDist = point_distance(x, y, hit.x, hit.y);
    }

    var count = floor(maxDist / lineSpacing);

    for (var i = 1; i <= count; i++) {
        var dist = i * lineSpacing;

        var px = x + lengthdir_x(dist, _angle);
        var py = y + lengthdir_y(dist, _angle);

        var b = bulletFire(px, py, 0, 0, damage/2, owdBullets, id);

        b.accel = false;
        b.infExist = false;
        b.existance = lineInterval + 1;

        b.image_xscale = 2;
        b.image_yscale = 2;
    }
}