event_inherited();

with other {
	event_user(14);
	doTick = true;
	dotTarget = self;
	dotTicks = 4;
	dotDelay = 12;
	dotDamage = global.playerFate/8;
	event_user(15);
	
	alarm[0] = dotDelay;
}