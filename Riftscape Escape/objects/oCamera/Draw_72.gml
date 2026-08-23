draw_clear(c_black)

var zTilt = lengthdir_y(1, tilt);
var zLook = z + zTilt;
var zMult = 1 - abs(zTilt);
var xLook = x + lengthdir_x(1, direction)*zMult;
var yLook = y + lengthdir_y(1, direction)*zMult;
viewMat = matrix_build_lookat(x, y, z, xLook, yLook, zLook, 0, 0, -1);
camera_set_view_mat(cam, viewMat);