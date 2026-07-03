event_inherited();
if (brainDead) {
    exit;
}
bite_timer--;
if (bite_timer > 0) {
	var playerDir = point_direction(x, y, oTruePlayer.x, oTruePlayer.y); 
	image_angle = playerDir+90;
	enemSpeed = base_speed;
} 
if (bite_timer < 0) {
	enemSpeed = 0.2;
}
if (bite_timer < -1*shoot_delay/2) {
	bite_timer = irandom(shoot_delay);
}

// countdown
path_timer--;
if (bite_timer <= 0 && on_cooldown = true) {
	on_cooldown = false;
}

if (dragTimer > 0) {
    applyDrag(dragPower, dragDir, oWalls);
    dragTimer--;

    if (dragTimer <= 0) {
        path_timer = 0;
    }
}

if (path_timer <= 0) {
    path_timer = path_cooldown;
    var search = pathfind(global.Grid, oTruePlayer, enemSpeed, id);
	if (!search) {
		respawnTimer--;
	}
}