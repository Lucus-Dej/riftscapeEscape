other.obHP -= global.playerDamage*2;
if (other.obHP <= 0) {
	instance_destroy(other);
}
