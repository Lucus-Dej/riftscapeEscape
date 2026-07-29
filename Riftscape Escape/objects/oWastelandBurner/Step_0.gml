event_inherited();
if (brainDead) {
    exit;
}

// countdown
bite_timer --;
if (bite_timer <= 0 && on_cooldown = true) {
	on_cooldown = false;
}