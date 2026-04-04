var push = 0.5;
x -= lengthdir_x(push,point_direction(x,y,other.x,other.y));
y-= lengthdir_y(push,point_direction(x,y,other.x,other.y));
pushTimer -= 0.1;
if (pushTimer <= 0) {
	var spawn = instance_nearest(x, y, oEnemStart)
	x = spawn.x;
	y = spawn.y;
	pushTimer = 300;
}