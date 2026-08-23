other.obHP -= global.playerDamage/8;
if (other.obHP <= 0) {
	instance_destroy(other);
}
