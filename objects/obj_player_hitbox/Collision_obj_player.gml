if creator == noone || creator == other{
		exit;
}

other.max_health -=1;
other.state = "knockback";
other.knockback_speed = knockback_speed;
show_debug_message(other.max_health)

if (other.max_health <= 0){
	creator.state = "win";
}

