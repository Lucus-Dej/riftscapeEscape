if (instance_exists(oTruePlayer)) {
	dir = point_direction(x, y, mouse_x, mouse_y);
	//light[|eLight.Angle] = dir;
	light[|eLight.Direction] = dir;
	self.Light_Angle = dir;
	self.Light_Direction = dir;
}