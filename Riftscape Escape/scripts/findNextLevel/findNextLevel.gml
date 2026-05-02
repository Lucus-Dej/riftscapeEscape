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
		case f3:
		newLevel = desert0;
		break;
		case desert0:
		newLevel = desert01;
		break;
		case desert01:
		newLevel = d3;
		break;
		case d3:
		newLevel = wasteland0;
		break;
		case wasteland0:
		newLevel = w1;
		break;
		case w1:
		newLevel = plains0;
		break;
		case plains0:
		newLevel = plains01;
		break;
		case plains01:
		newLevel = p3;
		break;
		case p3:
		newLevel = theEnd;
		break;
		
	}
	return newLevel;

}