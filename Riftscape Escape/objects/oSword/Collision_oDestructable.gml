other.obHP -= global.playerDamage/4;
if (other.obHP <= 0) {
	instance_destroy(other);
}
