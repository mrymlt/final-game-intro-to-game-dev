depth = -5000;

right_move = keyboard_check(right_key);
left_move = -keyboard_check(left_key);
up_move = keyboard_check(up_key);
//down_move = keyboard_check_pressed(down_key);
//attack_one = keyboard_check(attack_one_key);
//attack_two = keyboard_check(attack_two_key);

show_debug_message(image_xscale)

move = right_move + left_move;
x_sp = move_sp * move * speed_accel;

//if !(move == 0){
	//speed_accel += 0.03;
//}
//else 
speed_accel = 2;


#region boundary
	if x >= (room_width/12)*11{
		x = ((room_width/12)*11);
		speed_accel = 1;
	}
	if x <= 500{
		x = 500;
		speed_accel = 1;
	}

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

if (y_sp > 0){
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
	image_speed = 0.7;
	sprite_index = walk_sprite;
	mask_index = walk_sprite;

	
		if (place_meeting(x+x_sp,y,obj_ground)){
			while !(place_meeting(x+sign(x_sp),y,obj_ground)){
				x += sign(x_sp);
			}
			//x_sp = 0;
	
		}

		x += x_sp;
		

		if !(keyboard_check(left_key) || keyboard_check(right_key)){
			sprite_index = idle_sprite;
			image_speed = 0.2;
			
		}

		
		
		//if no key pressed idle animation
		
		if keyboard_check_pressed(down_key){
			state = "duck";
			image_speed = 0.7;
			image_index = 0;
		}
		if (keyboard_check_pressed(up_key) && (place_meeting(x,y+1,obj_ground))){
			state = "jump";
			sprite_index = jump_sprite;
			image_index = 0;
			image_speed = 0.7

			image_index = 0;
		}
		if (keyboard_check_pressed(attack_one_key)){
			state = "attack one";
			image_speed = 0.7;
			image_index = 0;
		}
		if (keyboard_check_pressed(attack_two_key)){
			state = "attack two";
			image_speed = 0.7;
			image_index = 0;
		}
		if (max_health <= 0){
			image_index = 0;
			image_speed = 0.7;
			state = "lose";

		}	
	#endregion move
	break;
	
	case "jump":
	#region jump
	show_debug_message(image_index)
	
		if (place_meeting(x,y+1,obj_ground)) && image_index >= 2 && image_index <= 3{
			y_sp = -jump;		

		}
		
		if (!(place_meeting(x,y+1,obj_ground)) && image_index >= 3 && y_sp <= 0){
			image_speed *= 0;
		}
			
		x += x_sp;
		
		if (keyboard_check_pressed(up_key)){
			image_speed = 0.7;
			image_index = 1;
			y_sp = up_move * -jump;
			state = "double jump";
			//image_index = 0;
		}
		if (place_meeting(x,y+1,obj_ground) && y_sp >= 0){
			image_speed = 0.7;
			if scr_anim_done_end_frame(){
				state = "move";
				image_index = 0;
			}
			
				
		}
		
		
	#endregion jump
	break;
	
	case "duck":
	#region duck
		if (place_meeting(x,y+1,obj_ground)){
			sprite_index = crouch_sprite
			mask_index = crouch_sprite
		}

		if (keyboard_check_pressed(right_key) || keyboard_check_pressed(left_key)){
			image_index = 0;
			
			state = "roll";
		}
		if (keyboard_check_released(down_key)){
			image_speed = 0.7;
				image_index = 0;
				state = "move";
			
		}
		if (keyboard_check_pressed(attack_one_key)){
			image_speed = 0.7;
			image_index = 0;
			state = "crouch attack";
		}
		if scr_anim_done_end_frame(){
			state = "move";
		}
		
	#endregion duck
	break;
	
	case "attack one":
	#region attack_one
		x += image_xscale*1;
	
		sprite_index = attack_one_sprite;
		if scr_anim_done(1){
			hitbox_function(x,y,attack_one_sprite_damage,self,4,4,1,image_xscale)
		}
		
		if (keyboard_check_pressed(attack_one_key) && (image_index >= 2 && image_index <= 5)){
			image_index = 0;
			image_speed = 0.7;
			state = "speed attack";
			
		}
		if scr_anim_done_end_frame(){
			state = "move";
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
			image_speed = 0.7;
			if scr_anim_done_end_frame(){
				state = "move";
				image_index = 0;
			}
		}

	#endregion double_jump
	break;
	
	case "attack down":
	#region attack_down
	
	sprite_index = attack_down_sprite;
		y_sp += grav * 2;
		x += image_xscale*2;
		
		if (!(place_meeting(x,y+1,obj_ground)) && image_index >= 4){
			image_speed *= 0;
		}
		
		sprite_index = attack_down_sprite
		if (image_index >= 1){
			hitbox_function(x,y,attack_down_damage,self,4,4,3,image_xscale)
		}
		if (place_meeting(x,y+1,obj_ground) && y_sp >= 0){
			image_speed = 0.7;
			if scr_anim_done_end_frame(){
				state = "move";
				image_index = 0;
			}
				
		}
	#endregion attack_down
	break;
	
	case "roll":
	#region roll
		sprite_index = roll_sprite;
		x -= image_xscale*lerp(20,0,0.2);
		if scr_anim_done_end_frame(){
			state = "move";
		}
	#endregion roll
	break;
	
	case "attack two":
 	#region attack_two
	sprite_index = attack_two_sprite;
	if (image_index <= 1){
			hitbox_function(x,y,attack_two_damage,self,4,4,2,image_xscale)
	}
	if (keyboard_check_pressed(attack_two_key)){	
			state = "strong attack";
			image_speed = 0.7;
			image_index = 0;
		}
		//sprite_index = attack_two_sprite;	
		x -= image_xscale*7;
		if scr_anim_done_end_frame(){
			state = "move";
		}
		
	#endregion attack_two
	break;
	
	case "speed attack":
	#region speed_attack
	
	sprite_index = attack_one_duo_sprite;
	if (image_index <= 1){
			hitbox_function(x,y,attack_triple_damage,self,4,4,2,image_xscale)
			
			if (obj_screenshake.shake == true){
				if !(instance_exists(obj_combo)){
					instance_create_layer(x + (-image_xscale * 300), y - sprite_height - 200,"combos",obj_combo);
				}
			}
		}
		//x += image_xscale*lerp(4,0,0.1);
		sprite_index = attack_one_duo_sprite;
		
		if (keyboard_check_pressed(attack_one_key)){
			instance_destroy(obj_combo);
			state = "attack one triple";
			
		}
		if scr_anim_done_end_frame(){
			instance_destroy(obj_combo);
			state = "move";
		}
	#endregion speed_attack
	break;
	
	case "crouch attack":
	#region crouch_attack
	
	
	sprite_index = crouch_attack_sprite;
	if (image_index <= 1){
			hitbox_function(x,y,attack_crouch_damage,self,4,4,1,image_xscale)
			if (obj_screenshake.shake == true){
				if !(instance_exists(obj_combo)){
					instance_create_layer(x + (-image_xscale * 300), y - sprite_height - 200,"combos",obj_combo);
				}
			}
		}
		x += image_xscale*1;
		sprite_index = crouch_attack_sprite;
		if scr_anim_done_end_frame(){
			instance_destroy(obj_combo)
			state = "move";
		}
	#endregion crouch_attack
	break;
	
	case "strong attack":
	#region strong_attack
	sprite_index = attack_strong_sprite;
	
	if (image_index <= 1){
			hitbox_function(x,y,attack_strong_damage,self,4,4,2,image_xscale)
			if (obj_screenshake.shake == true){
				if !(instance_exists(obj_combo)){
					instance_create_layer(x + (-image_xscale * 300), y - sprite_height - 200,"combos",obj_combo);
				}
			}
		}
		//x += image_xscale*lerp(12,0,0.1);
		//sprite_index = attack_two_sprite;
		if scr_anim_done_end_frame(){
			instance_destroy(obj_combo);
			state = "move";
		}
	#endregion strong_attack
	break;
	
	case "knockback":
	#region knockback
		sprite_index = knockback_sprite;
		if !(instance_exists(obj_particle)){
			var particle = instance_create_depth(x,y-(sprite_height/1.5),-15000,obj_particle);
			particle.image_angle = point_direction(particle.x,particle.y,x,y)
		}
		//if (part_particles_count(obj_particle.hitparticle) <= 1){
		//	part_particles_create(obj_particle.particle_system, x, y -(sprite_height/2), obj_particle.hitparticle, 1);
		//}
		if !(audio_is_playing(snd_hit)) {
			
			 var sound = audio_play_sound(snd_hit, 10, false);
			 //audio_stop_sound(snd_hit);
			instance_destroy(sound);
		}
		
		knockback_speed = lerp(knockback_speed, 0, 0.1);
		x += image_xscale*knockback_speed
			
		//if (knockback_speed < 1){
		//	knockback_speed = 0;
		//	state = "move";
			
		//}
		if scr_anim_done_end_frame() && knockback_speed < 1{
			knockback_speed = 0;
			instance_destroy(obj_particle)
			state = "move";
		}
	#endregion knockback
	break;
	
	case "attack one triple":
	#region attack_one_triple
	sprite_index = attack_one_triple_sprite;

	if (image_index <= 1){
			hitbox_function(x,y,attack_strong_damage,self,4,4,3,image_xscale)
			if (obj_screenshake.shake == true){
				if !(instance_exists(obj_triple_combo)){
					instance_create_layer(x + (-image_xscale * 300), y - sprite_height - 200,"combos",obj_triple_combo);
				}
			}
		}
		//x += image_xscale*lerp(4,0,0.1);
		sprite_index = attack_one_triple_sprite;
	if scr_anim_done_end_frame(){
		instance_destroy(obj_triple_combo)
			state = "move";
		}
	#endregion attack_one_triple
	break;
	
	case "lose":
	#region lose
		sprite_index = lose_sprite;
		
				if !(instance_exists(obj_fatality)){
					instance_create_layer(x + (-image_xscale * 300), y - sprite_height - 200,"combos",obj_fatality);
				}
			
	#endregion lose
	break;
	
	case "win":
	#region win
		sprite_index = win_sprite
		
	#endregion win
	break;
}
