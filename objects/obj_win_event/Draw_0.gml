image_speed = 0.05

if (global.zoro_points >= global.sanji_points){
	draw_sprite(spr_end_zoro,image_index,0,0)
}

if (global.zoro_points <= global.sanji_points){
	draw_sprite(spr_end_sanji,image_index,0,0)
}