// Inherit the parent event
event_inherited();
var dotDmg = 3;
if (global.difficulty >= 4) {
	dotDmg = 5.5;
}
callDOT(other, 3, dotDmg, 24, dotType.poison, id)
