depth = -9999
var left = x;
var setter = noone;
var marker = 0;
if (controlsMusic) {
	setter = global.musicAudio;
	marker = 1;
} else if (controlsSFX) {
	setter = global.sfxAudio;
	marker = 2;
}
var spawnX = left + (sprite_width * setter);

child = instance_create_layer(spawnX, y, "Instances", oButtonSlider, {ID: marker });

child.owner = id;
child.depth = -10000;

drawText = noone;