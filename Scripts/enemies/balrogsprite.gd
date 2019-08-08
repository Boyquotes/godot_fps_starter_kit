extends "res://Scripts/Enemies/sprite_global.gd"

func _physics_process(delta):
	## Edit this number to match the ammount of rows in the spritesheet
	frame = anim_col + row * 20
	
	
	
	
	
	