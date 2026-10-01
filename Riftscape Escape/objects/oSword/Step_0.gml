x = oTruePlayer.x;
y = oTruePlayer.y;
var aim = point_direction(oTruePlayer.x, oTruePlayer.y, mouse_x, mouse_y);
image_angle = aim - 90;
if (oItemManager.hasBloodCharm) {
	timer++;
	var ang = (image_angle)-bloodInc*timer;
	show_debug_message(ang)
	var distW = sprite_width/2;
	var distH = sprite_height/2;
	var startX = x - lengthdir_x(distW, ang);
	var startY = y - lengthdir_y(distH, ang);
	var spill = instance_create_layer(startX, startY, "Items", oBloodSpill)
	spill.dmg = damage;
	var scale = random_range(0.5, 0.75);
	scale = (image_xscale*0.5)*scale;
	spill.image_xscale = scale;
	spill.image_yscale = scale;
}
