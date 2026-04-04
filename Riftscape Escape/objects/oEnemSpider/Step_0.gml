if (brainDead) {
    exit;
}
if (!bossModApplied && isBoss) {
	bossModApplied = true;
	enemey_hp *= hpMult;
	base_speed *= speedMult;
	enemSpeed *= speedMult;
	damage *= dmgMult;
	bite_cooldown /= cooldownMult;
	event_user(13);
}

var playerDir = point_direction(x, y, oTruePlayer.x, oTruePlayer.y); 
image_angle = playerDir+90;
// countdown
flash = max(0, flash - 0.15);
path_timer--;
bite_timer --;
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
    pathfind(global.Grid, oTruePlayer, enemSpeed, id);
}