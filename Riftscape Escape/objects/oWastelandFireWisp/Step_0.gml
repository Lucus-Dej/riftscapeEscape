// Inherit the parent event
event_inherited();

if (!instance_exists(host)) {
	instance_destroy();
}