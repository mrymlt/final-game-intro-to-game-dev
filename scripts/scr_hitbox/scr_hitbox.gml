///@arg x
///@arg y
///@arg sprite
///@arg creator
///@arg knockback
///@arg lifespan
///@arg damage
///@arg xscale

function hitbox_function(x,y,sprite,creator,knockback,lifespan,damage,xscale){
		var hitbox = instance_create_layer(x,y, "Instances", obj_player_hitbox);
		hitbox.sprite_index = sprite;
		hitbox.creator = creator;
		hitbox.knockback = knockback;
		hitbox.alarm[0] = lifespan;
		hitbox.damage = damage;
		hitbox.image_xscale = xscale;
	}
