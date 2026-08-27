function inValidMinimapRange(_obj) {
	if (_obj.x < oMinimapManager.validCords.topLeftX || _obj.x > oMinimapManager.validCords.topLeftX + oMinimapManager.view_w ||
		_obj.y < oMinimapManager.validCords.topLeftY || _obj.y > oMinimapManager.validCords.topLeftY + oMinimapManager.view_h
	) {
		return false;
	} else {
		return true;
	}
	
}