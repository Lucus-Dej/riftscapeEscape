depth = -99999999;

lightSurface = -1;

lightList = array_create(0);
litEntity = noone;
unlitEntity = noone

array_push(lightList, oTruePlayer);
array_push(lightList, oTruePlayer);
lightSurface = surface_create(room_width, room_height)
shadowSurface = surface_create(room_width, room_height)

lightObjArray[0] = (oLightEmmiter);
lightObjArray[1] = (oLightWall);


smallLightArray[0] = (oTruePlayer);
smallLightArray[1] = (oPlayerAbilities);
smallLightArray[2] = (oEnemy);


tinyLightArray[0] = (oEnemyBullets);
tinyLightArray[1] = (oPlayerBullets);

lightExclusionArray[0] = (oUnlitEnemy);
lightExclusionArray[1] = (oUpgradeTokenFollow);
darknessAlpha = 0.7;

vertex_format_begin();
vertex_format_add_position_3d();
vf = vertex_format_end();
vb = vertex_create_buffer();

//Shader uniform variable setup
u_pos = shader_get_uniform(shdLight,"u_pos");
u_pos2 = shader_get_uniform(shdShadow,"u_pos");
u_z = shader_get_uniform(shdLight,"u_z");
u_z2 = shader_get_uniform(shdShadow,"u_z");