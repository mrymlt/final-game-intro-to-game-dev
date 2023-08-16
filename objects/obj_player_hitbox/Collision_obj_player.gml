if creator == noone || creator == other{
		exit;
}

other.max_health -=1;
other.state = "knockback";
other.knockback_speed = knockback_speed;
obj_screenshake.shake = true;
if (creator.x < other.x && other.image_xscale == -1){
	other.image_xscale = 1;
}
if (creator.x > other.x && other.image_xscale == 1){
	other.image_xscale = -1;
}

if (other.max_health <= 0){
	creator.state = "win";
}

