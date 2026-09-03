function findNextLevel(_level){
	// levelArray = [desert0, desert01, d3, wasteland0, wasteland02, w1, plains0, plains01, p3, theEnd, itemRoom]
	var newLevel = noone;
	switch (_level) {
		case caves0:
		newLevel = caves01;
		break;
		case caves01:
		newLevel = f3;
		break;
		case caves02:
		newLevel = f3; 
		break;
		case f3:
		newLevel = desert0;
		break;
		case desert0:
		newLevel = desert01;
		break;
		case desert01:
		newLevel = d1;
		break;
		case desert02:
		newLevel = d1;
		break;
		case d1:
		newLevel = wasteland0;
		break;
		case wasteland0:
		newLevel = wasteland01;
		break;
		case wasteland01:
		newLevel = w1;
		break;
		case wasteland02:
		newLevel = w1;
		break;
		case w1:
		newLevel = kingdom0;
		break;
		case kingdom0:
		newLevel = kingdom01;
		break;
		case kingdom01:
		newLevel = k1;
		break;
		case kingdom02:
		newLevel = k1;
		break;
		case k1:
		newLevel = theEnd;
		break;
		
		case chaoslands0:
		newLevel = chaoslands01;
		break;
		case chaoslands01:
		newLevel = theEnd;
		break;
		case chaoslands02:
		newLevel = theEnd;
		break;
		
		case library0:
		newLevel = library01;
		break;
		case library01:
		newLevel = theEnd;
		break;
		case library02:
		newLevel = theEnd;
		break;
		
		case plains0:
		newLevel = plains01;
		break;
		case plains01:
		newLevel = p2;
		break;
		case p2:
		newLevel = p3;
		break;
		case p3:
		newLevel = theEnd;
		break;
		
	}
	return newLevel;

}
function displayNextLevel (_level) {
	var newLevel = noone;
	switch (_level) {
		case caves0:
		newLevel = "Caves 1";
		break;
		case caves01:
		newLevel = "Caves 2";
		break;
		case caves02:
		newLevel = "Caves 3: Challenge"; 
		break;
		case f3:
		newLevel = "Caves: Finale";
		break;
		case desert0:
		newLevel = "Desert 1";
		break;
		case desert01:
		newLevel = "Desert 2"
		break;
		case desert02:
		newLevel = "Desert 3: Challenge";
		break;
		case d1:
		newLevel = "Desert: Finale";
		break;
		case wasteland0:
		newLevel = "Wasteland 1";
		break;
		case wasteland01:
		newLevel = "Wasteland 2";
		break;
		case wasteland02:
		newLevel = "Wasteland 3: Challenge";
		break;
		case w1:
		newLevel = "Wasteland: Finale";
		break;
		case kingdom0:
		newLevel = "Kingdom 1";
		break;
		case kingdom01:
		newLevel = "Kingdom 2";
		break;
		case kingdom02:
		newLevel = "Kingdom 3: Challenge";
		break;
		case k1:
		newLevel = "Kingdom: Finale";
		break;
		case theEnd:
		newLevel = "An Ending";
		break;
		case itemRoom:
		newLevel = "Dev Room: Beware of unsupported portals";
		break;
		
		case chaoslands0:
		newLevel = "Chaoslands 1";
		break;
		case chaoslands01:
		newLevel = "Chaoslands 2";
		break;
		case chaoslands02:
		newLevel = "Chaoslands 3: Challenge";
		break;
		
		case library0:
		newLevel = "Library 1";
		break;
		case library01:
		newLevel = "Library 2";
		break;
		case library02:
		newLevel = "Library 3: Challenge";
		break;
		
		case plains0:
		newLevel = "Plains 1";
		break;
		case plains01:
		newLevel = "Plains 2";
		break;
		case p2:
		newLevel = "Plains: Finale";
		break;
		case p3:
		newLevel = "Plains: Wing's Challenge";
		break;
		
		default:
		newLevel = "Error: Potentially Unsupported Room. Enter At Your Own Risk";
		break;
	}
	return newLevel;
}