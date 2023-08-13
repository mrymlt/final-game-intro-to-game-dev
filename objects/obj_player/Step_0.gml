depth = -5000;

right_move = keyboard_check(right_key);
left_move = -keyboard_check(left_key);
up_move = keyboard_check(up_key);
//down_move = keyboard_check_pressed(down_key);
//attack_one = keyboard_check(attack_one_key);
//attack_two = keyboard_check(attack_two_key);


move = right_move + left_move;
x_sp = move_sp * move * speed_accel;

if !(move == 0){
	speed_accel += 0.03;
}
else speed_accel = 1;


#region boundary
	if x >= (room_width/12)*11{
		x = ((room_width/12)*11);
		speed_accel = 1;
	}
	if x <= (room_width/12){
		x = ((room_width/12) );
		speed_accel = 1;
	}
	
	//if (place_meeting(x,y,obj_player)){
	//	x += image_xscale*obj_player.sprite_width
	//	//move_sp = 0;
	//	var pd = point_direction(x, y,obj_player.x,obj_player.y);
	//	var push_am = 1 * cos( degtorad( direction - pd));
	//	obj_player.x += lengthdir_x(push_am, pd);
	//	obj_player.y += lengthdir_y(push_am, pd);
	//}
	//if (position_meeting(x,y,other.solid)){
	//	show_debug_message("H")
	//	move = 0;
	//}
#endregion boundary

#region image_xscale
if (x_sp < 0){
	image_xscale = 1;
}
else if (x_sp > 0){
	image_xscale = -1;
}
else{
	image_xscale = image_xscale;
}
#endregion image_xscale

if (y_sp < 15){
	y_sp += grav;
}
//show_debug_message(state)
#region gravity
if (place_meeting(x,y+y_sp,obj_ground)){
		while !(place_meeting(x,y+sign(y_sp),obj_ground)){
			y += sign(y_sp);
		}
	y_sp = 0;
	}
y += y_sp;
#endregion gravity

//part_particles_create(obj_particle.particle_system, room_width/2, room_height/2, obj_particle.hitparticle, 1000);
		
switch (state){
	case "move":
	#region move
	image_speed = 1.5;
	sprite_index = walk_sprite;
	mask_index = walk_sprite;
	
		if (place_meeting(x+x_sp,y,obj_ground)){
			while !(place_meeting(x+sign(x_sp),y,obj_ground)){
				x += sign(x_sp);
			}
			//x_sp = 0;
	
		}

		x += x_sp;
		
		//if (place_meeting(x+x_sp,y,obj_player)){
		//	move_sp = (move_sp/12)*11;
			
		//}
		
		if !(keyboard_check(up_key) || keyboard_check(down_key) || 
		keyboard_check(left_key) || keyboard_check(right_key) || keyboard_check(attack_one_key) ||
		keyboard_check(attack_two_key)){
			sprite_index = idle_sprite;
			image_speed *= 0.3;
		}
		
		//if no key pressed idle animation
		
		if keyboard_check_pressed(down_key){
			state = "duck";
			image_index = 0;
		}
		if ((up_move ==1) && (place_meeting(x,y+1,obj_ground))){
			state = "jump";
			image_index = 0;
		}
		if (keyboard_check_pressed(attack_one_key)){
			state = "attack one";
			image_index = 0;
		}
		if (keyboard_check_pressed(attack_two_key)){
			state = "attack two";
			image_index = 0;
		}
		if (max_health <= 0){
			image_index = 0;
			state = "lose";

		}	
	#endregion move
	break;
	
	case "jump":
	#region jump
		if (place_meeting(x,y+1,obj_ground)){
			y_sp = up_move * -jump;		
			sprite_index = jump_sprite;
			image_index = 0;
		}
		
		if (!(place_meeting(x,y+1,obj_ground)) && image_index >= 3){
			image_speed *= 0;
		}
		
		x += x_sp;
		if (keyboard_check_pressed(attack_one_key)){
			state = "attack one";
			image_index = 0;
		}
		
		if (keyboard_check_pressed(up_key)){
			image_speed = 2;
			y_sp = up_move * -jump;
			state = "double jump";
			image_index = 0;
		}
		if (place_meeting(x,y+1,obj_ground) && y_sp >= 0){
				state = "move";
				image_index = 0;
		}
		
	#endregion jump
	break;
	
	case "duck":
	#region duck
		if (place_meeting(x,y+1,obj_ground)){
			sprite_index = crouch_sprite
			mask_index = crouch_sprite
		}
		//if (keyboard_check(down_key) && image_index >= 3){
		//	//show_debug_message(image_speed)
		//	image_speed = 0;
		//	image_index = 3;
		//}
		//else{
		//	image_speed = 2;
		//}
		if (keyboard_check(right_key) || keyboard_check(left_key)){
			image_index = 0;
			state = "roll";
		}
		if (keyboard_check_released(down_key)){
			image_speed = 2;
				image_index = 0;
				state = "move";
			
		}
		if (keyboard_check(attack_one_key)){
			image_speed = 2;
			image_index = 0;
			state = "crouch attack";
		}
		
	#endregion duck
	break;
	
	case "attack one":
	#region attack_one
		x += image_xscale*1;
		sprite_index = attack_one_sprite;
		if (image_index <= 1){
			hitbox_function(x,y,attack_one_sprite,self,4,4,1,image_xscale)
		}
		
		if (keyboard_check_pressed(attack_one_key) && (image_index >= 1 && image_index <= 4)){
			state = "speed attack";
			image_index = 0;
		}
	#endregion attack_one
	break;
	
	case "double jump":
	#region double_jump
	sprite_index = jump_sprite;
		if (keyboard_check(attack_one_key)){
			image_speed = 2;
			image_index = 0;
			state = "attack down";
		}
		
		if (image_index >= 3){
			image_speed *= 0;
		}
		if (place_meeting(x,y+1,obj_ground) && y_sp >= 0){
			image_index = 0;
			state = "move"
		}
		

	#endregion double_jump
	break;
	
	case "attack down":
	#region attack_down
	obj_triple_combo.visible = true;
	obj_combo.visible = false;
	sprite_index = attack_down_sprite;
		y_sp += grav * 3;
		x += image_xscale*2;
		if (!(place_meeting(x,y+1,obj_ground)) && image_index >= 3){
			image_speed *= 0;
		}
		sprite_index = attack_down_sprite
		if (image_index >= 1){
			hitbox_function(x,y,attack_down_sprite,self,4,4,3,image_xscale)
		}
		if (place_meeting(x,y+1,obj_ground) && y_sp >= 0){
			state = "move";
			image_index = 0;
		}
	#endregion attack_down
	break;
	
	case "roll":
	#region roll
		sprite_index = roll_sprite;
		x -= image_xscale*lerp(20,0,0.2);
	#endregion roll
	break;
	
	case "attack two":
	#region attack_two
	sprite_index = attack_two_sprite;
	if (image_index <= 1){
			hitbox_function(x,y,knockback_sprite,self,4,4,2,image_xscale)
		}
		sprite_index = attack_two_sprite;	
		x -= image_xscale*7;
		if (keyboard_check_released(attack_two_key)){
			state = "move";
		}
		
	#endregion attack_two
	break;
	
	case "speed attack":
	#region speed_attack
	obj_combo.visible = true;
	sprite_index = attack_one_duo_sprite;
	if (image_index <= 1){
			hitbox_function(x,y,attack_one_duo_sprite,self,4,4,2,image_xscale)
		}
		x += image_xscale*lerp(4,0,0.1);
		sprite_index = attack_one_duo_sprite;
		if (keyboard_check_pressed(attack_two_key)){
			image_index = 0;
			state = "strong attack";
		}
		if (keyboard_check_pressed(attack_one_key)){
			state = "attack one triple";
			image_index = 0;
		}
	#endregion speed_attack
	break;
	
	case "crouch attack":
	#region crouch_attack
	obj_combo.visible = true;
	image_speed = 2;
	sprite_index = crouch_attack_sprite;
	if (image_index <= 1){
			hitbox_function(x,y,crouch_attack_sprite,self,4,4,1,image_xscale)
		}
		x += image_xscale*1;
		sprite_index = crouch_attack_sprite;
	#endregion crouch_attack
	break;
	
	case "strong attack":
	#region strong_attack
	sprite_index = attack_strong_sprite;
	obj_triple_combo.visible = true;
	obj_combo.visible = false;
	if (image_index <= 1){
			hitbox_function(x,y,attack_strong_sprite,self,4,4,2,image_xscale)
		}
		x += image_xscale*lerp(12,0,0.1);
		sprite_index = attack_two_sprite;
	#endregion strong_attack
	break;
	
	case "knockback":
	#region knockback
		sprite_index = knockback_sprite;
		if (part_particles_count(obj_particle.hitparticle) <= 2){
			part_particles_create(obj_particle.particle_system, x, y -(sprite_height/2), obj_particle.hitparticle, 1);
		}
		if !(audio_is_playing(snd_hit)) {
			  var sound = audio_play_sound(snd_hit, 10, false);
			instance_destroy(sound);
		}
		knockback_speed = lerp(knockback_speed, 0, 0.1);
		x += image_xscale*knockback_speed
			
		if (knockback_speed < 1){
			knockback_speed = 0;
			state = "move";
			
		}
	#endregion knockback
	break;
	
	case "attack one triple":
	#region attack_one_triple
	sprite_index = attack_one_triple_sprite;
	obj_triple_combo.visible = true;
	obj_combo.visible = false;
	if (image_index <= 1){
			hitbox_function(x,y,attack_strong_sprite,self,4,4,3,image_xscale)
			
		}
		x += image_xscale*lerp(4,0,0.1);
		sprite_index = attack_one_triple_sprite;
	#endregion attack_one_triple
	break;
	
	case "lose":
	#region lose
		sprite_index = lose_sprite;
		obj_fatality.visible = true;
		obj_triple_combo.visible = false;
	obj_combo.visible = false;
	#endregion lose
	break;
	
	case "win":
	#region win
		sprite_index = win_sprite
		
	#endregion win
	break;
}
