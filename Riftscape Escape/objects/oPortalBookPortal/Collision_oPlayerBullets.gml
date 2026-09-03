if (portalId == 1) {
	var friend = noone;
	with (oPortalBookPortal) {
		if (portalId == 2) {
			friend = id;
		}
	}
	if (!array_contains(travelArray, other.id) && instance_exists(friend)) {
		other.x = friend.x;
		other.y = friend.y;
		array_push(friend.travelArray, other.id);
		array_push(friend.travelCooldownArray, 0);
		array_push(travelArray, other.id);
		array_push(travelCooldownArray, 0);
	}
} else if (portalId == 2) {
	var friend = noone;
	with (oPortalBookPortal) {
		if (portalId == 1) {
			friend = id;
		}
	}
	if (!array_contains(travelArray, other.id) && instance_exists(friend)) {
		other.x = friend.x;
		other.y = friend.y;
		array_push(friend.travelArray, other.id);
		array_push(friend.travelCooldownArray, 0);
		array_push(travelArray, other.id);
		array_push(travelCooldownArray, 0);
	}
}


