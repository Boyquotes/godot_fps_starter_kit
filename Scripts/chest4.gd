extends "res://engine/chest.gd"

##Chest with chaingun upgrades


func _physics_process(delta):
	if not_looted == true:
		if Input.is_action_just_pressed("key_e"):
			if is_active == true:
				drop_loot_c()
				c.visible = false
				breakable_collision_shape.disabled = true
				not_looted = false