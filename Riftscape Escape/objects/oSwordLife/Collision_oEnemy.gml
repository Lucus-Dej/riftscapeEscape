// Inherit the parent event
event_inherited();

if (variable_instance_exists(other, "invincible")) {
	 if (other.invincible) {
		exit; 
	 }
}

global.player_health += global.lifesteal*2;
callDOT(other, global.playerLife/6, 12, 12, dotType.poison, object_index);

