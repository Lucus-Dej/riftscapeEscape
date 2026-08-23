// Inherit the parent event
event_inherited();

if (variable_instance_exists(other, "invincible")) {
	 if (other.invincible) {
		exit; 
	 }
}

callDOT(other, global.playerLife/6, 12, 12, dotType.poison, oSword);

