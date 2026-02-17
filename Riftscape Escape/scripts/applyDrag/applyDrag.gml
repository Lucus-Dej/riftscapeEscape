function applyDrag(_power, _dir, _wallStopper) {

    var dx = lengthdir_x(_power, _dir);
    var dy = lengthdir_y(_power, _dir);

    if (!place_meeting(x + dx, y, _wallStopper)) x += dx;
    if (!place_meeting(x, y + dy, _wallStopper)) y += dy;
}
