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
		enemArray = [oEnemExplosiveSpider, oEnemBat, oEnemCentiHead, oEnemCaveSpider, oEnemSpider];
		bossArray = [oEnemCentiHead, oBoss, oBoss2, oMiniBoss, oMiniBoss2, oEnemBigBat, oEnemMotherCaveSpider];
		evilArray = [oMiniBoss, oMiniBoss2, oEnemBigBat]
		
		break;
		
		case "desert":
		enemArray = [oEnemDesertWasp, oEnemCaveSpider, oEnemDesertSanke, oEnemSandSniper, oEnemDesertBiter, oEnemMiniMummy];
		bossArray = [oBoss3, oDesertSlammer, oEnemSandSniper, oDesertSlammer, oEnemMiniMummy, oWaspHive]; 
		evilArray = [oDesertSlammer, oWaspHive]
		break;
		
		case "wasteland":
		enemArray = [oEnemBig, oEnemMotherCaveSpider, oCaveSpitter, oRifterTank, oEnemSandSniper, oEnemTurret, oDesertSlammer, oWastelandBurner, oMiniBoss, oMiniBoss3]
		bossArray = [oBoss3, oWastelandFireRunner, oRifterTank, oEnemBlackHole];
		evilArray = [oBoss, oBoss2, oWastelandFireRunner, oEnemBlackHole]
		break;
		
		case "kingdom":
		enemArray = [oRifterTank, oRifterSlammer, oRifterSniper, oEnemRifterSpider, oEnemMotherCaveSpider, oEnemTurret, oEnemBig];
		bossArray = [oRifterTank, oRifterSlammer, oRifterSpitter];
		evilArray = [oRifterSpitter];
		break;
		
		case "plains":
		enemArray = [oEnemCaveSpider, oPlainsShooter, oCaveSpitter, oEnemBig,oEnemMotherCaveSpider, oEnemSandSniper, oEnemTurret, oDesertSlammer, oWastelandBurner, oWastelandFireRunner, oMiniBoss, oMiniBoss3, oMiniBoss2, oBoss, oBoss2, oBoss3, oRifterTank];
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
