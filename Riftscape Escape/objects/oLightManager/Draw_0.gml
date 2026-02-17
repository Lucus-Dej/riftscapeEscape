/*if (!surface_exists(lightSurface)) {
    lightSurface = surface_create(room_width, room_height);
}
surface_set_target(lightSurface);

draw_clear_alpha(c_black, 0.5);

gpu_set_blendmode_ext(bm_zero, bm_inv_src_colour);
//draw_sprite_ext(sLight, 0, mouse_x, mouse_y, 2, 2, 0, image_blend, image_alpha);
for (i=0; i <= array_length(lightObjArray)-1; i++) {
	
	with (lightObjArray[i]) {
		draw_sprite_ext(sLight, 0, x, y, 1.5, 1.5, 0, image_blend, 0.5)
	}
}

for (i=0; i <= array_length(smallLightArray)-1; i++) {
	
	with (smallLightArray[i]) {
		draw_sprite_ext(sLight, 0, x, y, 0.5, 0.5, 0, image_blend, 0.5)
	}
}

for (i=0; i <= array_length(tinyLightArray)-1; i++) {
	
	with (tinyLightArray[i]) {
		draw_sprite_ext(sLight, 0, x, y, 0.15, 0.15, 0, image_blend, 0.5)
	}
}
for (i=0; i <= array_length(lightExclusionArray)-1; i++) {
	
	with (lightExclusionArray[i]) {
		draw_sprite_ext(sLight, 0, x, y, 0, 0, 0, image_blend, 0.5)
	}
}
gpu_set_blendmode(bm_normal);

surface_reset_target();

if (surface_exists(lightSurface)) {
	draw_surface(lightSurface, 0, 0);
} else {
	lightSurface = surface_create(room_width, room_height)
} */

// Create surface if needed
