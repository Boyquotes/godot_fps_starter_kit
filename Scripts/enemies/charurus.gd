extends "res://engine/entity2.gd"

onready var obj = get_parent().get_node("charurus")

var charurus_node = null

func _ready():
	##enemy gravity not implemented yet
#	vel.y += GRAVITY

# We want to know when a body has entered/exited our vision area, so we assign the body_entered and body_exited
# signals.
	$Vision_Area.connect("body_entered", self, "body_entered_vision")
	$Vision_Area.connect("body_exited", self, "body_exited_vision")
	$hitbox.connect("body_entered", self, "body_entered_hitbox")
	$hitbox.connect("body_exited", self, "body_exited_hitbox")
	$Chase_Area.connect("body_entered", self, "body_entered_chase")
	$Chase_Area.connect("body_exited", self, "body_exited_chase")

	# Get all of the nodes we will need
	node_clshape = $clshape
	node_fall = $fall
	node_turret_head = $Head
	node_raycast = $Ray_Cast

	# Add some exceptions to the raycast (so we cannot hurt ourself)
	node_raycast.add_exception(self)
	node_raycast.add_exception($Vision_Area)

	# Get the smoke particles and make sure it's not emitting
	smoke_particles = $Smoke
	smoke_particles.emitting = false

	# make sure our enemy has max health at start
	enemy_health = MAX_ENEMY_HEALTH

	level = Globals.levelv
	player = get_tree().get_root().get_node(level).find_node("Player")


func _physics_process(delta):
	movement_loop()
	
	if is_dying == true:
		current_target = null
		anim.play("die")
		$clshape.disabled = true
		if soundvar == 3:
			create_sound("th_death4")
			soundvar = 0
		elif soundvar == 2:
			create_sound("th_death3")
			soundvar = 3
		elif soundvar == 1:
			create_sound("th_death2")
			soundvar = 2
		elif soundvar == 0:
			create_sound("th_death1")
			soundvar = 1
		is_dead = true

	if is_dead == true:
		is_dying = false
		move_and_slide(vel)
		if(not anim.is_playing()):
				anim.play("death")


	##is active variables control monsters different states. 
	##is_actve controls monster idle or chase
	##isactive_2 controls shooting and or attacking

	if is_active == false:
		if is_active2 == false:
			if is_dying == false:
				if is_dead == false:
					if hitstun != 0:
						hitstun -= 1
					if hitstun == 0:
						anim.play("idle")

	if is_active == true:
		if is_active2 == false:
			if current_target == null:
				if is_dying == false:
					if is_dead == false:
						if hitstun != 0:
							hitstun -= 1
						if hitstun == 0:
							anim.play("walk")

	if is_active == true:
		playerPosition = player.get_translation()
		look_at(playerPosition, Vector3(0,1,0))
		move_and_collide((playerPosition-get_translation()).normalized() * MOVE_SPEED * delta)	

		if is_dying == false:
			if is_dead == false:
				if hitstun != 0:
					hitstun -= 1
				if hitstun == 0:
					anim.play("walk")

	if is_active2 == true:
		if is_dying == false:
			if is_dead == false:

				anim.play("attack")
				p_attack()

	if enemy_health <= 0:

		if BLEED_timer > 0:
			BLEED_timer -= delta
		else:
			## This allows enemy to resurrect
#			enemy_health = MAX_ENEMY_HEALTH
			smoke_particles.emitting = false


func p_attack():
	var hitbox = $hitbox
	var bodies = hitbox.get_overlapping_bodies()
	if hitstun != 0:
		hitstun -= 1
	if hitstun == 0:
	# For every body inside the knife's area, see if it has the method 'bullet_hit'.
	# If one of the bodies do, then call it and pass the area's global origin as the bullet collision point.
		for body in bodies:

		# Make sure we're not going to hurt ourselves, so check to see if the body we collided with is ourself.
		# If it is, then do nothing.
			if body == charurus_node:
				continue
			if body.has_method("P_hit"):
				body.P_hit(P_DAMAGE, hitbox.global_transform)
				##hitstun time is amount of time between attacks
				hitstun = 100
				if soundvar == 3:
					create_sound("th_attack4")
					soundvar = 0 
				elif soundvar == 2:
					create_sound("th_attack3")
					soundvar = 3
				elif soundvar == 1:
					create_sound("th_attack2")
					soundvar = 2
				elif soundvar == 0:
					create_sound("th_attack1")
					soundvar = 1


func body_entered_chase(body):
	if body.has_method("process_input"):
		if is_dying == false:
			if is_dead == false:
				is_active = true
				is_active2 = false
				current_target = null
				if soundvar == 3:
					create_sound("th_idle4")
					soundvar = 0
				elif soundvar == 2:
					create_sound("th_idle3")
					soundvar = 3
				elif soundvar == 1:
					create_sound("th_idle2")
					soundvar = 2
				elif soundvar == 0:
					create_sound("th_idle1")
					soundvar = 1


func body_exited_chase(body):
	if body.has_method("process_input"):
		current_target = null
		
		is_active = false

func body_entered_vision(body):
	if is_dying == false:
		if is_dead == false:
			if current_target == null:
				if body.has_method("process_input"):
					current_target = body
					is_active = true
					is_active2 = false


func body_exited_vision(body):
	## If the body that has just left is our target, we need to
	## reset the enemie's target dependent variables and set the target to null.
	if current_target != null:
		if body == current_target:
			## Set the target to null, and since we do not have a target, we are no longer active
			current_target = null
			is_active = true
			is_active2 = false

		
func body_entered_hitbox(body):
	if body.has_method("process_input"):
		current_target = null
		is_active2 = true
		is_active = false

	
func body_exited_hitbox(body):
	if body.has_method("process_input"):
		current_target = body
		is_active2 = false
		is_active = true

func bullet_hit(damage, bullet_hit_pos):
	## Remove however much damage we have received from our health
	enemy_health -= damage
	## hitstun makes enemy unable to attack for a little bit
	hitstun = 30
	anim.play("gethit")
	if soundvar == 3:
		create_sound("th_gethit4")
		soundvar = 0
	elif soundvar == 2:
		create_sound("th_gethit3")
		soundvar = 3
	elif soundvar == 1:
		create_sound("th_gethit2")
		soundvar = 2
	elif soundvar == 0:
		create_sound("th_gethit1")
		soundvar = 1

	## DEATH AND BLEED AND DROP
	if enemy_health <= 0:
		MOVE_SPEED = 0
		get_drop_charurus()
		smoke_particles.emitting = true
		BLEED_timer = BLEED_TIME
		is_dying = true