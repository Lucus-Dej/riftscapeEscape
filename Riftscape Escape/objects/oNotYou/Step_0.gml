if (follow != noone) {
	xTo = follow.x;
	yTo = follow.y;
}
x += (xTo - x)/50;
y += (yTo - y)/50;
if (timer >= 0) timer--;
