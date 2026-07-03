if (bite_timer <= 0 && on_cooldown =false && oPlayerManager.iframes <= 0) {	
	instance_create_layer(x, y, "Instances", oBoom);
	audio_play_sound_at(aBoom, x, y, 1, 1, 1, 1, false, 1, global.sfxAudio);
	playerTakeDamage(damage);
	instance_destroy(self);
	on_cooldown = true;
	bite_timer = bite_cooldown;
}
if (contactIframe <= 0 && global.contactDmg > 0 && global.playerContactDmg) {
	instance_destroy();
}