swordAng = oPlayerManager.swordAng;
damage = global.playerDamage +sqrt(global.playerEssence) * 0.15;

if (oItemManager.hasFireCharm) {
	var fCount = 1;
	var spacing = 4;
	var startingAng = swordAng;
	var ranSpeed = global.bullet_speed * (random_range(0.5, 1.5));
	fireFireFireCharm(x, y, startingAng, ranSpeed);
}