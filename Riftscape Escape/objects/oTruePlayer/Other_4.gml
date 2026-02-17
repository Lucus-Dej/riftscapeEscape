visual = instance_create_layer(x, y, "Instances", oPlayer);
visual.owner = id;
global.shot = false;
currentSpeed = 0;
inCircle = false;
light = instance_create_layer(x, y, "Instances", oLightFollow);
light.Light_Type = "Spot Light"
light.Light_Range = 128;
if (instance_exists(light)) {
	with light {
		light[|eLight.Range] = 256;
	}
}