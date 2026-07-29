if (oItemManager.hasLostCrown) {
	bulletCheck =  irandom_range(8, 200) + global.playerTime*5;
	bulletMax = 200;
} else {
	bulletCheck =  irandom_range(8, 300) + global.playerTime*4;
	bulletMax = 300;
}
if (follow != noone) {
	xTo = follow.x;
	yTo = follow.y;
}
x += (xTo - x)/(minionSpeed);
y += (yTo - y)/(minionSpeed);
if (oPlayerManager.inOverhealth && (bulletCheck >= bulletMax)) {
	var dir = irandom_range(1, 360);
	 bullet = playerBulletFire(x, y, dir, global.bullet_speed, global.playerDamage*0.65, global.chosenBullet, id);
}