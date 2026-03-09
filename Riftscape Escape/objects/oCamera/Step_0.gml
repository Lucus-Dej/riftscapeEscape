if (follow != oTruePlayer) {
camX = x;
camY = y;
var cam = view_camera[0];
var halfView = camera_get_view_width(cam) / 2;

maxPeek = min(128 + (global.playerReality * 16), halfView - 64);
var desiredPeekX = 0;
var desiredPeekY = 0;

var targetX = follow.x;
var targetY = follow.y;



var dir = point_direction(follow.x, follow.y, mouse_x, mouse_y);
var dist = point_distance(follow.x, follow.y, mouse_x, mouse_y);



var passive = 32;

desiredPeekX = lengthdir_x(min(dist, passive), dir);
desiredPeekY = lengthdir_y(min(dist, passive), dir);

if (keyboard_check_pressed(vk_shift)) {
	peakFlag = !peakFlag;
}

if (peakFlag && follow != noone) {
    var peekDistance = min(dist, maxPeek);

    desiredPeekX = lengthdir_x(peekDistance, dir);
    desiredPeekY = lengthdir_y(peekDistance, dir);
}



peekX = lerp(peekX, desiredPeekX, peekSpeed);
peekY = lerp(peekY, desiredPeekY, peekSpeed);


targetX = follow.x + peekX;
targetY = follow.y + peekY;


x = lerp(x, targetX, camFollowSpeed);
y = lerp(y, targetY, camFollowSpeed);


camX = x;
camY = y;


camera_set_view_pos(
    view_camera[0],
    camX - camW * 0.5,
    camY - camH * 0.5
);
}