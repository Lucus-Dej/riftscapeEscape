view_w = 3200;
view_h = 3200;

zoomSpeed = 400;
scale = 1;
minZoom = 800;
maxZoom = 8000;

follow = oTruePlayer;
minimapSurface = surface_create(200, 200);
minimapCam = camera_create();
minimapCam = camera_create_view(0, 0, room_width, room_height, 0, noone, -1, -1, 200, 200);