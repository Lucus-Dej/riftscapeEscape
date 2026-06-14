function requestEnemies(_RoomManager, _FloorManager){
	var rM = _RoomManager;
	var fM = _FloorManager;
	
}
function getEnemPool(_currentFloor) {
	var enemArray = [];
	var bossArray = [];
	var evilArray = [];
	var challengeArray = [];
	switch (_currentFloor) {
		case "caves":
		enemArray = [oCavesStoneGolem, oEnemExplosiveSpider, oEnemBat, oEnemCentiHead, oEnemCaveSpider, oEnemSpider];
		bossArray = [oEnemCentiHead, oBoss, oBoss2, oCavesStoneGolem, oMiniBoss, oMiniBoss2, oEnemBigBat, oEnemMotherCaveSpider];
		evilArray = [oMiniBoss, oMiniBoss2, oEnemBigBat]
		
		break;
		
		case "desert":
		enemArray = [oEnemDesertWasp, oEnemCaveSpider, oEnemDesertSanke, oEnemSandSniper, oEnemDesertBiter, oEnemMiniMummy];
		bossArray = [oDesertSlammer, oEnemSandSniper, oEnemMiniMummy, oWaspHive]; 
		evilArray = [oDesertSlammer, oWaspHive]
		break;
		
		case "wasteland":
		enemArray = [oWastelandSpitter, oEnemTurret, oWastelandBurner, oEnemRifterSpider, oMiniBoss3, oWastelandFireRunner, oWastelandFireSpirit, oRifterDrone]
		bossArray = [oBoss3, oMiniBoss3, oEnemBlackHole];
		evilArray = [oBoss, oBoss2, oWastelandFireRunner, oEnemBlackHole]
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
