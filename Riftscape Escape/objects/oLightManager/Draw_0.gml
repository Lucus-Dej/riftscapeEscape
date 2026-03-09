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
		draw_sprite_ext(sLight, 0, x, y, 0.12, 0.12, 0, image_blend, 0.5)
	}
}
for (i=0; i <= array_length(lightExclusionArray)-1; i++) {
	
	with (lightExclusionArray[i]) {
		draw_sprite_ext(sLight, 0, x, y, 0, 0, 0, image_blend, 0.5)
	}
}
gpu_set_blendmode(bm_normal);

gpu_set_blendmode_ext(bm_dest_colour, bm_zero);

with(oSuperwalls)
{
    draw_self();
}

gpu_set_blendmode(bm_normal);
surface_reset_target();

if (surface_exists(lightSurface)) {
	draw_surface(lightSurface, 0, 0);
} else {
	lightSurface = surface_create(room_width, room_height)
} 

*/

var cam = view_camera[0];

var camX = camera_get_view_x(cam);
var camY = camera_get_view_y(cam);
var camW = camera_get_view_width(cam);
var camH = camera_get_view_height(cam);


// Create surface if needed
if (!surface_exists(lightSurface))
{
    lightSurface = surface_create(camW, camH);
}


// Resize if camera size changed
if (surface_get_width(lightSurface) != camW
||  surface_get_height(lightSurface) != camH)
{
    surface_free(lightSurface);
    lightSurface = surface_create(camW, camH);
}



// Draw lighting
surface_set_target(lightSurface);

draw_clear_alpha(c_black, 0.5);

gpu_set_blendmode_ext(bm_zero, bm_inv_src_colour);


// Draw lights relative to camera
for (var i = 0; i < array_length(lightObjArray); i++) {
    var inst = lightObjArray[i];
	if (variable_instance_exists(inst, "isLightExcluded") && inst.isLightExcluded) continue;
    with (inst) {
        draw_sprite_ext( sLight, 0, x - camX,  y - camY, 1.5, 1.5, 0, c_white, 0.4);
    }
}
for (var i = 0; i < array_length(smallLightArray); i++) {
    var inst = smallLightArray[i];
	//if (variable_instance_exists(inst, "isLightExcluded") && inst.isLightExcluded) continue;
	if (instance_exists(inst)) {
		
		with (inst) {
			if (isLightExcluded) continue;
			draw_sprite_ext( sLight, 0, x - camX,  y - camY, .5, .5, 0, c_white, 0.4);
		}
		inst = noone;
	}
}
for (var i = 0; i < array_length(tinyLightArray); i++) {
    var inst = tinyLightArray[i];
	if (variable_instance_exists(inst, "isLightExcluded") && inst.isLightExcluded) continue;
    with (inst) {
        draw_sprite_ext( sLight, 0, x - camX,  y - camY, 0.12, 0.12, 0, c_white, 0.2);
    }
}
for (var i = 0; i < array_length(lightExclusionArray); i++) {
    var inst = lightExclusionArray[i];

    
}
gpu_set_blendmode(bm_normal);

surface_reset_target();



// Draw surface at camera position
draw_surface(lightSurface, camX, camY);
