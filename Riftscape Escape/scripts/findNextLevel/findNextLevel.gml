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