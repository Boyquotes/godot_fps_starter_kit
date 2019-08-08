extends "res://engine/entity2.gd"

#onready var obj = get_parent().get_node("NPC")

const POPUPstore_SCENE = preload("res://Scenes/Scene_NPCInventory.tscn")
var popup = null

var NPC_node = null

var canvas_layer = null

func _ready():
	##Gravity not implemented yet
#	vel.y += GRAVITY

	## Make a new canvas layer.
	## This is so our popup always appears on top of everything else
	canvas_layer = CanvasLayer.new()
	add_child(canvas_layer)

## We want to know when a body has entered/exited our vision area, so we assign the body_entered and body_exited
## signals.
	$Vision_Area.connect("body_entered", self, "body_entered_vision")
	$Vision_Area.connect("body_exited", self, "body_exited_vision")
	$hitbox.connect("body_entered", self, "body_entered_hitbox")
	$hitbox.connect("body_exited", self, "body_exited_hitbox")
	$Chase_Area.connect("body_entered", self, "body_entered_chase")
	$Chase_Area.connect("body_exited", self, "body_exited_chase")
	
	MOVE_SPEED = 0


	# Get all of the nodes we will need
	node_clshape = $clshape
	node_fall = $fall
	node_turret_head = $Head
	node_raycast = $Ray_Cast


	## Add some exceptions to the raycast (so we cannot hurt ourself)
	node_raycast.add_exception(self)
	node_raycast.add_exception($Vision_Area)


	## Get the smoke particles and make sure it's not emitting
	smoke_particles = $Smoke
	smoke_particles.emitting = false

	## make sure our turret has max health at start
	enemy_health = MAX_ENEMY_HEALTH


func _physics_process(delta):
	if is_active == false:
		if is_active2 == false:
			if is_dying == false:
				if is_dead == false:
					if hitstun != 0:
						hitstun -= 1
					if hitstun == 0:
						anim.play("idle")

	if is_active == true:
		if Input.is_action_just_pressed("key_e"):
			if popup == null:
			## Make a new popup scene
				popup = POPUPstore_SCENE.instance()

			## Connect the signals
				popup.connect("popup_hide", self, "popup_closed")

			# Add it as a child, and make it pop up in the center of the screen
				canvas_layer.add_child(popup)
				popup.popup_centered()

			# Make sure the mouse is visible
				Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

			# Pause the game
				get_tree().paused = true


func popup_closed():
	# Unpause the game
	get_tree().paused = false
	get_tree().get_root().get_node(Globals.levelv).get_node("Player").get_node("HUD").visible = true


	## If we have a popup, destoy it
	if popup != null:
		popup.queue_free()
		popup = null


func popup_quit():
	get_tree().paused = false

	## Make sure the mouse is visible
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

	## If we have a popup, destoy it
	if popup != null:
		popup.queue_free()
		popup = null

	## Go back to the title screen scene
	load_new_scene(MAIN_MENU_PATH)


func load_new_scene(new_scene_path):
	## Set respawn points to null so when/if we get to a level with no respawn points,
	## we do not respawn at the respawn points in the level prior.
	## Change scenes
	get_tree().change_scene(new_scene_path)


func body_entered_chase(body):
	if body is KinematicBody:
		if is_dying == false:
			if is_dead == false:

				is_active = true
				is_active2 = false
				current_target = null
				
				if soundvar == 3:
					create_sound("npc_greet1")
					soundvar = 0
				elif soundvar == 2:
					create_sound("npc_greet2")
					soundvar = 3
				elif soundvar == 1:
					create_sound("npc_greet3")
					soundvar = 2
				elif soundvar == 0:
					create_sound("npc_greet4")
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