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
		enemArray = [oEnemBasic, oEnemTurret, oEnemSpider, oEnemBig, oCaveSpitter];
		bossArray = [oBoss, oBoss2, oMiniBoss, oMiniBoss2, oEnemBig, oCaveSpitter];
		evilArray = [oMiniBoss, oMiniBoss2]
		
		break;
		
		case "desert":
		enemArray = [oEnemBig, oEnemBasic, oEnemSandSniper, oEnemDesertBiter, oDesertSlammer, oMiniBoss3];
		bossArray = [oBoss3, oDesertSlammer, oEnemSandSniper, oMiniBoss3]; 
		evilArray = [oMiniBoss, oMiniBoss2, oBoss, oBoss2]
		break;
		
		case "wasteland":
		enemArray = [oEnemBig, oCaveSpitter, oRifterTank, oEnemBasic, oEnemSandSniper, oEnemTurret, oDesertSlammer, oWastelandBurner, oMiniBoss, oMiniBoss3]
		bossArray = [oBoss3, oWastelandFireRunner, oRifterTank, oEnemBlackHole];
		evilArray = [oBoss, oBoss2, oWastelandFireRunner, oEnemBlackHole]
		break;
		
		case "plains":
		enemArray = [oPlainsShooter, oCaveSpitter, oEnemBig, oEnemBasic, oEnemSpider, oEnemSandSniper, oEnemTurret, oDesertSlammer, oWastelandBurner, oWastelandFireRunner, oMiniBoss, oMiniBoss3, oMiniBoss2, oBoss, oBoss2, oBoss3, oRifterTank];
		bossArray = [oRifterTank, oEnemBlackHole, oMummy, oWastelandDestroyer];
		evilArray = [oRifterTank]
		break;
		
	}
	challengeArray = array_concat(challengeArray, enemArray, evilArray)
	show_debug_message(challengeArray)
	var request = {
		normArray: enemArray,
		bArray: bossArray,
		cArray: evilArray
	};
	return request;
}
function defineCustomEnemPool() {
	
}
