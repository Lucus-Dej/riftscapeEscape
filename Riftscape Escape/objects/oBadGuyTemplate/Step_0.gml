/*
path_timer--;


// countdown
if (shoot_cooldown > 0)
    shoot_cooldown--;

// fire when ready
if (shoot_cooldown <= 0) {
    var b = instance_create_layer(x, y, "Instances", oBadBullet);
	if (oPlayerManager.hasCircleTime && oTruePlayer.inCircle) {
		b.image_angle = point_direction(x, y, mouse_x, mouse_y)
		b.direction =  point_direction(x, y, mouse_x, mouse_y)
	} else {
	b.image_angle = point_direction(x, y, oTruePlayer.x, oTruePlayer.y);
    b.direction = point_direction(x, y, oTruePlayer.x, oTruePlayer.y);
	}
    b.speed = 3;
	b.damage = damage;

    shoot_cooldown = shoot_delay;
}
if (dragTimer > 0) {
    var dx = lengthdir_x(dragPower, dragDir);
    var dy = lengthdir_y(dragPower, dragDir);

    if (!place_meeting(x + dx, y, oWalls)) x += dx;
    if (!place_meeting(x, y + dy, oWalls)) y += dy;

    dragTimer--;

    if (dragTimer <= 0) {
        path_timer = 0;
    }
}
// pathfinding
if (path_timer <= 0) 
{
	path_timer = path_cooldown;
	if instance_exists(oTruePlayer) 
	{
		path_end();
		if (path_exists(path))
		{
			path_delete(path);
		}
		path = path_add();
	
		if (mp_grid_path(global.Grid, path, x, y, oTruePlayer.x, oTruePlayer.y, true)) {
			path_start(path, enemSpeed, path_action_stop, false);
		}
	}
}
if (enrage_point >= enemey_hp && enraged == false) {
	enemSpeed += 1.7;
	bullet_speed += 1.5;
	fire_duration += 6;
	shoot_delay += 10;
	recoil_cooldown -= 4;
	enraged = true;
}