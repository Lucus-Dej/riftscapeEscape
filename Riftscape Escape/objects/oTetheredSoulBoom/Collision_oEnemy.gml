if (other.lastDamagedBy != id) {
	other.lastDamagedBy = id;
	other.enemey_hp -= 2.5;
}

if (other.enemey_hp <= 0) {
   instance_destroy(other);
   global.playerKilled = true;
} 