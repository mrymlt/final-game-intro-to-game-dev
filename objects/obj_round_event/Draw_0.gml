//image_speed = 0.05

//if (global.zoro_points == 3 || global.zoro_points == 2){
//	draw_sprite(spr_end_zoro,image_index,0,0)
//}
//else{
//	draw_sprite(spr_end_sanji,image_index,0,0)
//}
image_speed = 0.05;
if (global.rounds == 1){
	if (global.zoro_points == 2){
		draw_sprite(spr_zor_lose,-1,0,0);
		
	}
	else{
		draw_sprite(spr_san_lose,-1,0,0);
	}
}
if (global.rounds == 2){
	if (global.zoro_points == 2 && global.zoro_round_one = true || !(global.zoro_points == 1) || (global.zoro_points == 3)){
		draw_sprite(spr_san_lose,-1,0,0);
	}
	else{
		draw_sprite(spr_zor_lose,-1,0,0);
		}
}


//if spr_zor_lose.image_index == image_number || spr_san_lose.image_index == image_number{
//	zoro_lose = false;
//	room_restart();
//}