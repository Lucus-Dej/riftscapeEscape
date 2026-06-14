function bossMod(_enem){
	with _enem {
		switch object_index {
			case oCavesStoneGolem:
			dmgMult = 1.2;
			speedMult = 1.2;
			hpMult = 5.5;
			rageBreak *= hpMult*1.1;
			break;
			
			case oEnemMiniMummy:
			dmgMult = 2;
			speedMult = 1.4;
			hpMult = 4;
			cooldownMult = 3;
			break;
			
			case oWastelandFireSpirit:
			hpMult = 4;
			cooldownMult = 2;
			speedMult = 1.5;
			dmgMult =  1.3;
			break;
			
			case oWaspHive:
			speedMult = 2;
			hpMult = 3.5;
			count *= 2;
			phasePoint1 *= hpMult;
			break;
			
			case oEnemMotherCaveSpider:
			dmgMult = 2;
			speedMult = 1.3;
			hpMult = 3.5;
			count *= 2;
			case oEnemSnakeJoke:
			break;
			case oEnemCentiHead:
			dmgMult = 2;
			speedMult = 1.2;
			hpMult = 4;
			bodyCount *= 12;
			image_xscale += 1;
			image_yscale += 1;
			break;
			case oEnemBigBat:
			dmgMult = 2;
			speedMult = 2.25;
			hpMult = 4;
			break;
			
			case oWastelandBurner:
			dmgMult = 2;
			speedMult = 2;
			break;
			
			case oWastelandSpitter:
			dmgMult = 1.2;
			hpMult = 5;
			cooldownMult = 3;
			image_xscale += 1.5;
			image_yscale += 1.5
			break;
			
			case oEnemSandSniper:
			dmgMult = 1.5;
			speedMult = 1.2;
			hpMult = 8;
			cooldownMult = 2;
			break;
			
			case oEnemBig:
			image_xscale += 2;
			image_yscale += 2;
			dmgMult = 1;
			speedMult = 1.1;
			hpMult = 4.5;
			cooldownMult = 2;
			break;
			
			case oWastelandFireRunner:
			hpMult = 1.3;
			dmgMult = 2.5;
			phasePoint1 *= hpMult;
			break;
			
			case oBoss:
			hpMult = 2;
			dmgMult = 1.5;
			cooldownMult = 2;
			phasePoint1 *= hpMult;
			break;
			
			case oBoss2:
			hpMult = 2;
			dmgMult = 1.2;
			phasePoint1 *= hpMult;
			image_xscale += 1;
			image_yscale += 1;
			break;
			
			case oBoss3:
			hpMult = 1.5;
			dmgMult = 1.25;
			phasePoint1 *= hpMult;
			cooldownMult = 2;
			break;
			
			case oDesertSlammer:
			hpMult = 2.4;
			dmgMult = 1.5;
			cooldownMult = 4;
			phasePoint1 *= hpMult;
			image_xscale += 1;
			image_yscale += 1;
			break;
			
			case oMiniBoss:
			hpMult = 2;
			dmgMult = 1.3;
			cooldownMult = 3.6;
			break;
			
			case oMiniBoss2:
			hpMult = 1.3;
			dmgMult = 1.3;
			cooldownMult = 2;
			break;
			
			case oMiniBoss3:
			hpMult = 2;
			dmgMult = 1.5;
			phasePoint1 *= hpMult;
			break;
			
			case oRifterTank:
			hpMult = 2.5;
			dmgMult = 1.2;
			cooldownMult = 4.5;
			break;
			
			case oMummy:
			hpMult = 1.25;
			dmgMult = 1.1;
			phasePoint1 *= hpMult;
			phasePoint2 *= hpMult;
			break;
			
			case oWastelandDestroyer:
			hpMult *= 1.25;
			phasePoint1 *= hpMult;
			phasePoint2 *= hpMult;
			break;
			
			case oPlainsShooter:
			dmgMult = 1.5;
			break;
			
			case oRifterSlammer:
			hpMult = 2;
			dmgMult = 1.3;
			cooldownMult = 2;
			image_xscale += 1;
			image_yscale += 1;
			break;
			
			case oRifterSpitter:
			hpMult = 2.5;
			dmgMult = 1.3;
			cooldownMult = 4;
			break;
			
			case oRifterSniper:
			hpMult = 2;
			dmgMult = 1.3;
			cooldownMult = 1.3;
			break;
			
			case oEnemRifterSpider:
			hpMult = 2;
			dmgMult = 1.3;
			speedMult = 2;
			break;
			
			case oRifterKing:
			break;
			
		}
		//event_user(13);
	}
}