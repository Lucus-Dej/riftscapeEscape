// checks if boss exists, changing count logic if so
hasBoss = (instance_exists(oBossStart));
// timers
if (portal_timer >= 0 && ready) {
	portal_timer--;
}
if (portal_timer <= 0) {
	spawn_timer--;
}



if (ready && !spawned && portal_timer <= 0 && enemies > 0) {
	event_user(0);
	if (totalBoss > 0) {
		pick = bossPull;
		pick.spawning = true;
		temp_portal = instance_create_layer(pick.x, pick.y, "Instances", oBossPortal);
		audio_play_sound_at(aPortalOpen, x, y, 0, 1, 1, 1, false, 0);
	} else {
		pick = instance_find(oEnemStart, irandom(instance_number(oEnemStart) - 1));
		temp_portal = instance_create_layer(pick.x, pick.y, "Instances", oPortal);
		audio_play_sound_at(aPortalOpen, x, y, 0, 1, 1, 1, false, 0)
	}
	spawned = true;
}
if (spawned == true && spawn_timer <= 0) {
	spawned = false;
	portal_count--;
	instance_destroy(temp_portal);
	instance_create_layer(pick.x, pick.y, "Instances", tempEnemy);
	temp_portal = noone;
	spawn_timer = spawn_cooldown;
	portal_timer = portal_cooldown;
	
}
if (enemies <= 0 ) {
	instance_create_layer(x, y, "Instances", oRoomCheck);
}