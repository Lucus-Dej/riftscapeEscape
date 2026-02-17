// Inherit the parent event
event_inherited();

with other {
	event_user(14);
	doTick = true;
	dotTarget = self;
	dotTicks = 18;
	dotDelay = 12;
	dotDamage = global.playerLife/6;
	event_user(15);
	
	alarm[0] = dotDelay;
}