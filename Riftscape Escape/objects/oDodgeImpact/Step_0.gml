if (oItemManager.hasFireCharm) {
	 var fireCharmCheck = irandom_range(0, 8) + global.playerTime*0.75;
	 if (fireCharmCheck >= 8) {
		 var distMax = sprite_width/2;
		 var ang = irandom(359);
		 var startX = x + lengthdir_x(distMax, ang);
		 var startY = y + lengthdir_y(distMax, ang);
		 var ranSpeed = global.bullet_speed * (random_range(0.5, 1.5));
		 fireFireFireCharm(startX, startY, ang-180, ranSpeed);
	 }
}
if (oItemManager.hasBloodCharm && followPlayer) {
	var bloodCheck = irandom_range(1, 3) + global.playerTime * 0.2;
	 if (bloodCheck >= 3 && instance_exists(oTruePlayer)) {
		var distMax = sprite_width/2;
		var ang = irandom(359);
		var startX = oTruePlayer.x;
		var startY = oTruePlayer.y;
		
		var spill = instance_create_layer(startX, startY, "Items", oBloodSpill)
		spill.dmg = damage*0.05;
		var scale = random_range(0.5, 0.75);
		scale = (image_xscale*0.5)*scale;
		spill.image_xscale = scale;
		spill.image_yscale = scale;
		
	 }
}
if (existence > 0) {
	existence--;
	var incRate = existence/exisTotal;
	image_xscale += 0.3*incRate;
	image_yscale += 0.3*incRate;
	image_alpha = incRate;
} else {
	instance_destroy();
}
if (instance_exists(oTruePlayer) && followPlayer) {
	x = lerp(x, oTruePlayer.x, 0.03);
	y = lerp(y, oTruePlayer.y, 0.03);
}