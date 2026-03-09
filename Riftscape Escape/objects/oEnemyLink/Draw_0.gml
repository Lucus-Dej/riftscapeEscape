var target = enemyB;

if (instance_exists(enemyB)) {
var dir = point_direction(x, y, target.x, target.y);
var dist = point_distance(x, y, target.x, target.y);

var scale_x = dist / sprite_width;

draw_sprite_ext(sEnemyLinkRifter, 0, x, y, scale_x, 1, dir, c_white, 0.85);
}