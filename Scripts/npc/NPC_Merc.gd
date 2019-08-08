extends "res://engine/entity2.gd"

onready var obj = get_parent().get_node("NPC_Merc")

var NPC_Merc_node = null

func _ready():
	vel.y += GRAVITY

## We want to know when a body has entered/exited our vision area, so we assign the body_entered and body_exited
## signals.
	$Vision_Area.connect("body_entered", self, "body_entered_vision")
	$Vision_Area.connect("body_exited", self, "body_exited_vision")
	$hitbox.connect("body_entered", self, "body_entered_hitbox")
	$hitbox.connect("body_exited", self, "body_exited_hitbox")
	$Chase_Area.connect("body_entered", self, "body_entered_chase")
	$Chase_Area.connect("body_exited", self, "body_exited_chase")
	
	MOVE_SPEED = 0


	## Get all of the nodes we will need
	node_clshape = $clshape
	node_fall = $fall
	node_turret_head = $Head
	node_raycast = $Ray_Cast
	node_flash_one = $Flash
	node_flash_two = $Flash_2

	## Add some exceptions to the raycast (so we cannot hurt ourself)
	node_raycast.add_exception(self)
	node_raycast.add_exception($Vision_Area)

	## Because we are not firing at start, we need to assure the flash is invisible.
	node_flash_one.visible = false
	node_flash_two.visible = false

	## Get the smoke particles and make sure it's not emitting
	smoke_particles = $Smoke
	smoke_particles.emitting = false

	## make sure our turret has max health at start
	enemy_health = MAX_ENEMY_HEALTH

	## Get the globals autoload script
	## We have to use get node, because we cannot access autoload scripts using $


func _physics_process(delta):
	if is_active == false:
		if is_active2 == false:
			if is_dying == false:
				if is_dead == false:
					if hitstun != 0:
						hitstun -= 1
					if hitstun == 0:
						anim.play("idle")


func body_entered_chase(body):
	if body is KinematicBody:
		if is_dying == false:
			if is_dead == false:

				is_active = true
				is_active2 = false
				current_target = null
				if soundvar == 3:
					create_sound("gd_idle4")
					soundvar = 0
				if soundvar == 2:
					create_sound("gd_idle3")
					soundvar = 3
			if soundvar == 1:
					create_sound("gd_idle2")
					soundvar = 2
			if soundvar == 0:
					create_sound("gd_idle1")
					soundvar = 1


func body_exited_chase(body):
	if body is KinematicBody:
		current_target = null
		is_active = false


func body_entered_vision(body):
	if is_dying == false:
		if is_dead == false:
			if current_target == null:
				if body is KinematicBody:
					current_target = body
					is_active = true
					is_active2 = false


func body_exited_vision(body):
	## If the body that has just left is our target, we need to
	## reset the turret's target dependent variables and set the target to null.
	if current_target != null:
		if body == current_target:
			## Set the target to null, and since we do not have a target, we are no longer active
			current_target = null
			is_active = true
			is_active2 = false


func body_entered_hitbox(body):
	if body is KinematicBody:
		current_target = null
		is_active2 = true
		is_active = false


func body_exited_hitbox(body):
	if body is KinematicBody:
		current_target = body
		is_active2 = false
		is_active = true