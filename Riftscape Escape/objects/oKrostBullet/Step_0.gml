if (iframe >= 0) {
	iframe--;
}
//flash = max(0, flash - 0.15);
if (instance_exists(owner) &&rotate) {
	orbitAngle += 2; 
	x = orbitCenter.x + lengthdir_x(orbitRadius, orbitAngle);
	y = orbitCenter.y + lengthdir_y(orbitRadius, orbitAngle);
}
if (canAccel) {
	speed += 0.2;
}
if (canDecel && speed > 0 && !refireFlag) {
	speed -= decelRate;
	if (speed < 5.5)
	flash += 0.05;
} else if (speed <= 0 && !refireFlag && !gridBullet) {
	refireFlag = true;
}
if (refireFlag) {
	var bullet = bulletFireAt(x, y, oTruePlayer, 2.25, 12, oSniperBullet, owner);
	
	if (bounceBullet) {
		bullet.canBounce = true;
		bullet.canAccel = true;
	}
	instance_destroy();
}
if (gridBullet) {
	existance--;
}
if (existance < 60) {
	flash += 0.05;
}
if (gridBullet && existance <= 0) {
	refireFlag = true;
}
var dist = 128;
var gridCheck = collision_rectangle(x+dist-48, y+dist-48, x-dist-48, y-dist-48, oWalls, false, true)
if (gridBullet && gridCheck == noone && !fired) {
	fired = true;
	
	if (up) {
		var b1 = bulletFireAt(x, y-dist, oTruePlayer, 0, 0, oKrostBullet, owner);
		b1.up = true;
		b1.gridBullet = true;
		var l = bulletFireAt(x-dist, y, oTruePlayer, 0, 0, oKrostBullet, owner);
		l.left = true;
		l.gridBullet = true;
		var r = bulletFireAt(x+dist, y, oTruePlayer, 0, 0, oKrostBullet, owner);
		r.right = true;
		r.gridBullet = true;
	}
	if (down) {
		var b2 = bulletFireAt(x, y+dist, oTruePlayer, 0, 0, oKrostBullet, owner);
		b2.down = true;
		b2.gridBullet = true;
		var l = bulletFireAt(x-dist, y, oTruePlayer, 0, 0, oKrostBullet, owner);
		l.left = true;
		l.gridBullet = true;
		var r = bulletFireAt(x+dist, y, oTruePlayer, 0, 0, oKrostBullet, owner);
		r.right = true;
		r.gridBullet = true;
	}
	if (left) {
		var b3 = bulletFireAt(x-dist, y, oTruePlayer, 0, 0, oKrostBullet, owner);
		b3.left = true;
		b3.gridBullet = true;
	}
	if (right) {
		var b4 = bulletFireAt(x+dist, y, oTruePlayer, 0, 0, oKrostBullet, owner);
		b4.right = true;
		b4.gridBullet = true;
	}
}