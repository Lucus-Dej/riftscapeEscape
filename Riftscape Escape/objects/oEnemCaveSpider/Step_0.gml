event_inherited();
if (brainDead) {
    exit;
}
bite_timer--;
if (bite_timer > 0) {
	var playerDir = point_direction(x, y, oTruePlayer.x, oTruePlayer.y); 
	image_angle = playerDir+90;
	enemSpeed = initalSpeed;
} 
if (bite_timer < 0) {
	enemSpeed = 0.2;
}
if (bite_timer < -1*shoot_delay/2) {
	bite_timer = irandom(shoot_delay);
}

if (bite_timer <= 0 && on_cooldown = true) {
	on_cooldown = false;
}
