function useChargeItem(){
	if (global.currentCharges >= global.itemCharges && global.chargeItem != noone) {
		
	switch (global.chargeItem.object_index) {
		
			case oFreedom:
			global.playerCanFly = true;
			oItemManager.freedomFlyFlag = true;
			break;
			
			case oFreedomPage:
			global.playerCanFly = true;
			oItemManager.freedomFlyFlag = true;
			global.chargeItem = noone;
			break;
			
			case oDictionaryCharge:
			global.itemCharges += 3;
			var i = irandom_range(1, 6);
			switch (i) {
				case 1:
				realityUp();
				break;
			
				case 2:
				lifeUp();
				break;
			
				case 3:
				essenceUp();
				break;
			
				case 4:
				timeUp();
				break;
			
				case 5:
				fateUp();
				break;
			
				case 6:
				thoughtUp();
				break;
			}
			break;
			
			case oDictionaryPage:
			var f = irandom_range(1, 6);
			switch (f) {
				case 1:
				realityUp();
				break;
			
				case 2:
				lifeUp();
				break;
			
				case 3:
				essenceUp();
				break;
			
				case 4:
				timeUp();
				break;
			
				case 5:
				fateUp();
				break;
			
				case 6:
				thoughtUp();
				break;
			}
			global.chargeItem = noone;
			break;
			
		
			case oThePathForward:
			//dropID = instance_create_layer(x, y, "Instances", oItemFlag);
			var newItem = rollItem(true,,,10);
			instance_create_layer(oTruePlayer.x, oTruePlayer.y, "Instances", newItem);
			global.itemCharges += 6;
			break;
			
			case oPathForwardPage:
			//dropID = instance_create_layer(x, y, "Instances", oItemFlag);
			var newerItem = rollItem(true,,,2);
			instance_create_layer(oTruePlayer.x, oTruePlayer.y, "Instances", newerItem);
			global.chargeItem = noone;
			break;
		
			case oDeathBook:
			with (oEnemy) {
				enemyTakeDamage(15, id, , true, damageType.playerBlood)
			}
			break;
			
			case oDeathPage:
			with (oEnemy) {
				enemyTakeDamage(5, id, , true, damageType.playerBlood)
			}
			global.chargeItem = noone;
			break;
			
			case oHarvestBook:
			for (var f = 0; f < 8; f++) {
				var summon = instance_create_layer(oTruePlayer.x, oTruePlayer.y, "Instances", oMinionHarvestBlocker);
				summon.orbitAngle = f*45;
			}
			with (oMinionHarvestBlocker) {
				init = true;
			}
			break;
			
			case oHarvestPage:
			for (var f = 0; f < 4; f++) {
				var summon = instance_create_layer(oTruePlayer.x, oTruePlayer.y, "Instances", oMinionHarvestBlocker);
				summon.orbitAngle = f*90;
			}
			with (oMinionHarvestBlocker) {
				init = true;
			}
			global.chargeItem = noone;
			break;
		
			case oDreamsBook:
			room_goto(hordeSurvival);
			global.chargeItem = noone;
			break;
			
			case oDreamsPage:
			room_goto(room);
			global.chargeItem = noone;
			break;
		
			case oBlackHoleCharge:
			instance_create_layer(oTruePlayer.x, oTruePlayer.y, "Items", oChargeBlackHole);
			break;
			
			case oBlackHolePage:
			instance_create_layer(oTruePlayer.x, oTruePlayer.y, "Items", oChargeBlackHole);
			global.chargeItem = noone;
			break;
		
			case oFoolsGold:
			var foolsItem = rollItem(false, itemSearchType.foolsGold);
			itemAdd(foolsItem);
			oItemManager.foolsGoldItem = foolsItem;
			oItemManager.foolsGoldTimer = 1;
			global.chargeItem = noone;
			break;
			
			case oFoolsGoldPage:
			var foolsItem = rollItem(false, itemSearchType.foolsGold);
			itemAdd(foolsItem);
			oItemManager.foolsGoldItem = foolsItem;
			oItemManager.foolsGoldTimer = 1;
			global.chargeItem = noone;
			break;
		
			case oPortalBook:
			var num = instance_number(oPortalBookPortal)
			if (!instance_exists(oItemManager.portalbook.portal1)) {
				oItemManager.portalbook.portal1 = instance_create_layer(oTruePlayer.x, oTruePlayer.y, "Items", oPortalBookPortal);
				oItemManager.portalbook.portal1.portalId = 1; 
			} else if (!instance_exists(oItemManager.portalbook.portal2)) {
				oItemManager.portalbook.portal2 = instance_create_layer(oTruePlayer.x, oTruePlayer.y, "Items", oPortalBookPortal);
				oItemManager.portalbook.portal2.portalId = 2; 
			}
		
			break;
		
		}
		global.currentCharges = 0;
	}
}