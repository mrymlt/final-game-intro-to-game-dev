//if (mouse_check_button(vk_left) && place_meeting(mouse_x,mouse_y,self)){
	
//}
if (position_meeting(mouse_x,mouse_y,self)){
	image_index = 1;
	if (mouse_check_button(mb_left)){
		audio_play_sound(snd_button,1,false);
		room_goto(rm_fighting);
	}
}
else{
	image_index = 0;
}

if (keyboard_check(vk_anykey)){
	room_goto(rm_fighting);
}