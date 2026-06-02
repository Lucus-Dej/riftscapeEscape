// Inherit the parent event
event_inherited();

if (instance_exists(head)) {
	var arr = head.bodyArray;

	for (var i = 0; i < array_length(arr); i++) {
		if (arr[i] == id) {
			array_delete(arr, i, 1);
			break;
		}
	}

	head.bodyArray = arr;

	with (oEnemCentiBody) {
		if (follow == other.id) {
			follow = other.follow;
		}
	}
}