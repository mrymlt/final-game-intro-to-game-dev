if (shake) 
{ 
   shake_time -= 1; 
   var x_move = irandom_range(-shake_magnitude, shake_magnitude); 
   var y_move = irandom_range(-shake_magnitude, shake_magnitude); 
   camera_set_view_pos(view_camera[0], x_move + 16, y_move + 18); 

   if (shake_time <= 0) 
   { 
      shake_magnitude -= shake_fade; 

      if (shake_magnitude <= 0) 
      { 
         camera_set_view_pos(view_camera[0], 16, 18);
			shake = false;
			shake_time = 15;
			shake_magnitude = 2;
			shake_fade = 0.10;
      } 
   } 
}