function requestEnemies(_RoomManager, _FloorManager){
	var rM = _RoomManager;
	var fM = _FloorManager;
	
}
function getEnemPool(_currentFloor, _all = false) {
	var enemArray = [];
	var bossArray = [];
	var evilArray = [];
	var challengeArray = [];
	switch (_currentFloor) {
		case "caves":
		var l = irandom_range(1, 5);
		switch (l) {
			case 1:
			enemArray = [oCavesStoneGolem, oEnemCavesSludger, oEnemBat];
			break;
			case 2:
			enemArray = [oCavesStoneGolem, oEnemExplosiveSpider, oEnemCentiHead];
			break;
			case 3:
			enemArray = [oEnemCavesSludger, oEnemExplosiveSpider, oEnemCaveSpider, oEnemSpider, oBoss2];
			break;
			case 4:
			enemArray = [oEnemBat, oEnemCentiHead, oEnemExplosiveBat];
			break;
			case 5:
			enemArray = [oEnemExplosiveSpider, oEnemExplosiveBat];
			break;

		}
		if (_all) {
			enemArray = [oEnemCavesSludger,oEnemExplosiveBat, oEnemExplosiveSpider, oEnemCaveSpider, oEnemSpider, oEnemBat, oEnemCentiHead];
		}
		//enemArray = [oCavesStoneGolem, oEnemCavesSludger, oEnemExplosiveSpider, oEnemBat, oEnemCentiHead, oEnemCaveSpider, oEnemSpider];
		bossArray = [oEnemCentiHead, oBoss, oBoss2, oCavesStoneGolem, oMiniBoss, oMiniBoss2, oEnemBigBat, oEnemMotherCaveSpider];
		evilArray = [oMiniBoss, oMiniBoss2, oEnemBigBat]
		
		break;
		
		case "desert":
		enemArray = [oEnemDesertWasp, oEnemCaveSpider, oEnemDesertSanke, oEnemSandSniper, oEnemDesertBiter, oEnemMiniMummy];
		bossArray = [oDesertSlammer, oEnemMiniMummy, oWaspHive]; 
		evilArray = [oDesertSlammer, oWaspHive]
		break;
		
		case "wasteland":
		enemArray = [oWastelandSpitter, oEnemTurret, oWastelandBurner, oRifterSniper, oMiniBoss3, oRifterDrone]
		bossArray = [oBoss3, oMiniBoss3, oEnemBlackHole, oRifterDrone, oRifterSniper, oWastelandSpitter, oWastelandFireSpirit, oWastelandFireRunner];
		evilArray = [oWastelandFireSpirit, oWastelandFireRunner, oEnemBlackHole]
		break;
		
		case "kingdom":
		enemArray = [oRifterTank, oRifterDrone, oRifterSlammer, oRifterSniper, oEnemRifterSpider, oEnemTurret, oEnemBig];
		bossArray = [oRifterTank, oRifterSlammer, oRifterSpitter];
		evilArray = [oRifterSpitter];
		break;
		
		case "plains":
		enemArray = [oEnemCaveSpider, oPlainsShooter, oWastelandSpitter, oEnemBig,oEnemMotherCaveSpider, oEnemSandSniper, oEnemTurret, oDesertSlammer, oWastelandBurner, oWastelandFireRunner, oMiniBoss, oMiniBoss3, oMiniBoss2, oBoss, oBoss2, oBoss3, oRifterTank];
		bossArray = [oRifterTank, oEnemBlackHole, oMummy, oWastelandDestroyer];
		evilArray = [oRifterTank]
		break;
		
		case "chaoslands":
		enemArray = [oEnemSandSniper, oEnemRifterSpider, oRifterDrone, oRifterSlammer, oRifterSpitter, oBoss, oBoss2, oMiniBoss, oMiniBoss2, oDesertSlammer, oEnemSpider, oEnemCaveSpider, oEnemCavesSludger, oEnemBat, oEnemBlackHole, oEnemMotherCaveSpider];
		bossArray = [oRifterSlammer, oRifterTank, oBoss3, oMummy, oEnemBigBat];
		challengeArray = [];
		break;
		
	}
	challengeArray = array_concat(challengeArray, enemArray, evilArray)
	var request = {
		normArray: enemArray,
		bArray: bossArray,
		cArray: evilArray
	};
	return request;
}
function defineCustomEnemPool() {
	
}
