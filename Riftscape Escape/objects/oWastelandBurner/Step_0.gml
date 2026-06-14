event_inherited();
if (brainDead) {
    exit;
}

// countdown
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
    pathfind(global.flyGrid, oTruePlayer, enemSpeed, id);
}