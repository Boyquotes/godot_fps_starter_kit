extends "res://engine/entity2.gd"

onready var obj = get_parent().get_node("spikefiend")

var spikefiend_node = null


func _ready():
	##enemy gravity not implemented yet
#	vel.y += GRAVITY

	## We want to know when a body has entered/exited our vision area, so we assign the body_entered and body_exited
	## signals.
	$Vision_Area.connect("body_entered", self, "body_entered_vision")
	$Vision_Area.connect("body_exited", self, "body_exited_vision")
	$Chase_Area.connect("body_entered", self, "body_entered_chase")
	$Chase_Area.connect("body_exited", self, "body_exited_chase")

	## Get all of the nodes we will need
	node_clshape = $clshape
	node_fall = $fall
	node_turret_head = $Head
	node_raycast = $Ray_Cast
	node_flash_one = $Flash
	node_flash_two = $Flash_2

	## Add some exceptions to the raycast (so we cannot hurt ourself)
	node_raycast.add_exception(self)
	node_raycast.add_exception($CollisionShape)
	node_raycast.add_exception($clshape)
	node_raycast.add_exception($Vision_Area)

	## Because we are not firing at start, we need to assure the flash is invisible.
	node_flash_one.visible = false
	node_flash_two.visible = false

	## Get the smoke particles and make sure it's not emitting
	smoke_particles = $Smoke
	smoke_particles.emitting = false

	## make sure our turret has max health at start
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
			create_sound("sf_death4")
			soundvar = 0
		elif soundvar == 2:
			create_sound("sf_death3")
			soundvar = 3
		elif soundvar == 1:
			create_sound("sf_death2")
			soundvar = 2
		elif soundvar == 0:
			create_sound("sf_death1")
			soundvar = 1
		is_dead = true


	if is_dead == true:
		is_dying = false
		move_and_slide(vel)
		if(not anim.is_playing()):
				anim.play("death")

		## Reset all of the firing variables
		flash_timer = 0
		fire_timer = 0
		node_flash_one.visible = false
		node_flash_two.visible = false


	##is active variables control monsters different states. 
	##is_actve controls monster idle or chase
	##isactive_2 controls shooting and or attacking

	if is_active == false:
		if is_dying == false:
			if is_dead == false:
				if hitstun != 0:
					hitstun -= 1
				if hitstun == 0:
					anim.play("idle")

	if is_active == true:
		if current_target == null:
			if is_dying == false:
				if is_dead == false:
					if hitstun != 0:
						hitstun -= 1
					if hitstun == 0:
						anim.play("walk")

	## If the turret is active, then we want to process the firing code
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

		## If the flash timer is more than zero (meaning the flash is visible) we want to remove
		## time (delta) from it
		if flash_timer > 0:
			flash_timer -= delta

			## If the flash timer is 0 or less, hide the flash meshes because we have waited long enough
			## and no longer need to show them
			if flash_timer <= 0:
				node_flash_one.visible = false
				node_flash_two.visible = false

		## If we have a target...
		if current_target != null:

			## Make the head look at the target, adding the player height to it's position so we are not aiming
			## at the player's feet.

			## If we are not destroyed...
			if enemy_health > 0:

				## If we have ammo, we need to see if we can fire. Otherwise, we need to process the reloading code
				if ammo_in_turret > 0:
					## If we have waited long enough to fire, then fire a bullet
					if fire_timer > 0:
						fire_timer -= delta
					else:
						fire_bullet()
						if soundvar == 3:
							create_sound("sf_attack4")
							soundvar = 0
						elif soundvar == 2:
							create_sound("sf_attack3")
							soundvar = 3
						elif soundvar == 1:
							create_sound("sf_attack2")
							soundvar = 2
						elif soundvar == 0:
							create_sound("sf_attack1")
							soundvar = 1
				else:
					## If we're reloading, then subtract delta from ammo_reload_timer.
					## If not, then refill the turret's ammo.
					if ammo_reload_timer > 0:
						ammo_reload_timer -= delta
					else:
						ammo_in_turret = AMMO_IN_FULL_TURRET


	if enemy_health <= 0:

		if BLEED_timer > 0:
			BLEED_timer -= delta
		else:
			##allows enemy to resurrect
#			enemy_health = MAX_ENEMY_HEALTH
			smoke_particles.emitting = false


func body_entered_chase(body):
	if body.has_method("process_input"):
		if is_dying == false:
			if is_dead == false:
	## If we do not have a target, and the bodybu that's entered our
	## vision area is a KinematicBody, we want to fire at it
				if current_target == null:
					if body.has_method("process_input"):
						current_target = body
						is_active = true
				if soundvar == 3:
					create_sound("sf_idle4")
					soundvar = 0
				elif soundvar == 2:
					create_sound("sf_idle3")
					soundvar = 3
				elif soundvar == 1:
					create_sound("sf_idle2")
					soundvar = 2
				elif soundvar == 0:
					create_sound("sf_idle1")
					soundvar = 1



func body_exited_chase(body):
	## If the body that has just left is our target, we need to
	## reset the turret's target dependent variables and set the target to null.
	if body.has_method("process_input"):
		current_target = null
		is_active = false


func body_entered_vision(body):
	if is_dying == false:
		if is_dead == false:
	## If we do not have a target, and the body that's entered our
	## vision area is a KinematicBody, we want to fire at it
			if current_target == null:
				if body.has_method("process_input"):
					current_target = body
					is_active = true


func body_exited_vision(body):
	## If the body that has just left is our target, we need to
	## reset the turret's target dependent variables and set the target to null.
	if current_target != null:
		if body == current_target:
			# Set the target to null, and since we do not have a target, we are no longer active
			current_target = null
			is_active = true


			## Reset all of the firing variables
			flash_timer = 0
			fire_timer = 0
			node_flash_one.visible = false
			node_flash_two.visible = false


func bullet_hit(damage, bullet_hit_pos):
	## Remove however much damage we have received from our health
	enemy_health -= damage
	## hitstun makes enemy unable to attack for a little bit
	hitstun = 30
	anim.play("gethit")
	if soundvar == 3:
		create_sound("sf_gethit4")
		soundvar = 0
	elif soundvar == 2:
		create_sound("sf_gethit3")
		soundvar = 3
	elif soundvar == 1:
		create_sound("sf_gethit2")
		soundvar = 2
	elif soundvar == 0:
		create_sound("sf_gethit1")
		soundvar = 1

	## Death and bleed and DROP
	if enemy_health <= 0:
		MOVE_SPEED = 0
		get_drop_spikefiend()
		smoke_particles.emitting = true
		BLEED_timer = BLEED_TIME
		is_dying = true
