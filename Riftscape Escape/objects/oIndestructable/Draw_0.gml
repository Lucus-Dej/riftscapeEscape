if (oPlayerManager.hasFirstPRune) {
		var halfWidth  = sprite_width/2;
		var halfHeight = sprite_height/2;
		
		drawIn3d(0, -halfHeight, wallHeight*32, -90, 0, 0, image_xscale, wallHeight);
		drawIn3d(0, halfHeight, wallHeight*32, -90, 0, 0, image_xscale, wallHeight);
		drawIn3d(-halfWidth, 0, wallHeight*32, 0, 90, 0, wallHeight, image_yscale);
		drawIn3d(halfWidth, 0, wallHeight*32, 0, 90, 0,  wallHeight, image_yscale);


		drawIn3d(0, 0, 0, 0, 0, 0, image_xscale, image_yscale);

		drawIn3d(0, 0, wallHeight*64, 0, 0, 0, image_xscale, image_yscale);
	
		if (!instance_exists(oCamera)) {
			exit;
		}
		var dir = oCamera.direction+90;

		var matrix = matrix_build(x, y, 0, 90+oCamera.tilt*zTilt, 0, dir, 1, 1, 1);

		matrix_set(matrix_world, matrix);

		//draw_sprite_ext(sprite_index, image_index, 0, 0, image_xscale, image_yscale, image_angle, image_blend, image_alpha);

		matrix_set(matrix_world, matrix_build_identity());
	} else {
		draw_self()
	}