function drawIn3d(_xoff, _yoff, _zoff, _xrot, _yrot, _zrot, _image_xscale, _image_yscale){
	var matrix = matrix_build(x + _xoff, y + _yoff, _zoff, _xrot, _yrot, _zrot, 1, 1, 1);
	
	matrix_set(matrix_world, matrix);
	
	draw_sprite_ext(sprite_index, image_index, 0, 0, _image_xscale, _image_yscale, image_angle, image_blend, image_alpha);
	
	matrix_set(matrix_world, matrix_build_identity());
}