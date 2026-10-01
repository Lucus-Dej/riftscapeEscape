direction = swordAng;
image_angle = swordAng;
if (swordAng <= 0) {
	swordAng = 360;
}
x = oTruePlayer.x;
y = oTruePlayer.y;
if (oPlayerManager.moveSword) {
swordAng += 6;
}
if (oItemManager.hasBloodCharm) {
	var bloodCheck = irandom_range(1, 8) + global.playerTime * 0.2;
	 if (bloodCheck >= 8) {
		var distMax = sprite_width/2;
		var dist = sprite_width/2;
		var startX = x - lengthdir_x(dist, image_angle);
		var startY = y - lengthdir_y(dist, image_angle);
		var damage = global.playerDamage +sqrt(global.playerEssence) * 0.15;
		var spill = instance_create_layer(startX, startY, "Items", oBloodSpill)
		spill.dmg = damage;
		var scale = random_range(0.5, 0.75);
		scale = (image_xscale*0.5)*scale;
		spill.image_xscale = scale;
		spill.image_yscale = scale;
		
	 }
}
