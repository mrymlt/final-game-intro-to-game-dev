if creator == noone || creator == other{
		exit;
}

other.max_health -=1;
other.state = "knockback";
other.knockback_speed = knockback_speed;
obj_screenshake.shake = true;

if (other.max_health <= 0){
	creator.state = "win";
}

