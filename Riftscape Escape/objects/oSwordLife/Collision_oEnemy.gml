// Inherit the parent event
event_inherited();
global.player_health += global.lifesteal*2
with other {
	event_user(14);
	doTick = true;
	dotTarget = self;
	dotTicks = 16;
	dotDelay = 12;
	dotDamage = global.playerLife/2.5;
	event_user(15);
	
	alarm[0] = dotDelay;
}