if (!global.playerCanFly) {
	var push = irandom_range(2,5);
	x -= lengthdir_x(push,point_direction(x,y,other.x,other.y));
	y-= lengthdir_y(push,point_direction(x,y,other.x,other.y));
}