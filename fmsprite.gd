extends Sprite3D

export var anim_col = 0

var camera = null
func set_camera(c):
	camera = c

func _physics_process(delta):
	if camera == null:
		return
	
	var p_fwd = -camera.global_transform.basis.z
	var fwd = global_transform.basis.z
	var left = global_transform.basis.x
	
	var l_dot = left.dot(p_fwd)
	var f_dot = fwd.dot(p_fwd)
	var row = 0


	if f_dot < -0.85:
		row = 0 # front sprite
	elif f_dot > 0.85:
		row = 4 # back sprite
	else:

		if abs(f_dot) < 0.3 and l_dot > 0:
			row = 6 # Right sprite
		elif abs(f_dot) < 0.3 and l_dot < 0:
			row = 2 # left sprite
		elif f_dot < 0 and l_dot > 0:
			row = 7 # forward right  sprite
		elif f_dot < 0 and l_dot < 0:
			row = 1 # forward left sprite
		elif f_dot > 0 and l_dot < 0:
			row = 3 # back left sprite
		else:
			row = 5 # Back right sprite
	frame = anim_col + row * 20
	
	
	
	
	
	