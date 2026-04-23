function bossMod(_enem){
	with _enem {
		switch object_index {
			case oEnemBasic:
			dmgMult = 2.5;
			speedMult = 2.25;
			hpMult = 8;
			break;
			
			case oWastelandBurner:
			dmgMult = 2;
			speedMult = 2;
			break;
			
			case oCaveSpitter:
			dmgMult = 1.2;
			hpMult = 5;
			cooldownMult = 4;
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
			dmgMult = 3;
			speedMult = 2;
			hpMult = 4.5;
			cooldownMult = 3;
			break;
			
			case oWastelandFireRunner:
			hpMult = 1.3;
			dmgMult = 2.5;
			phasePoint1 *= hpMult;
			break;
			
			case oBoss:
			hpMult = 2.5;
			dmgMult = 1.5;
			cooldownMult = 3;
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
		}
		//event_user(13);
	}
}