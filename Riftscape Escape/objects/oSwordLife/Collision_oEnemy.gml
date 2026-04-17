// Inherit the parent event
event_inherited();
global.player_health += global.lifesteal*2
callDOT(other, global.playerLife/6, 12, 12, dotType.poison, object_index);