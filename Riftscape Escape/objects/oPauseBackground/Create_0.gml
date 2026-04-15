
var cam = view_camera[0];

var width = camera_get_view_width(cam);
var height = camera_get_view_height(cam);


x = camera_get_view_x(cam) + width * 0.5;
y = camera_get_view_y(cam) + height * 0.5;

var sprWidth = sprite_get_width(sprite_index);
var sprHeight = sprite_get_height(sprite_index);

image_xscale = width / sprWidth;
image_yscale = height / sprHeight;