extends KinematicBody

var dropvar = null

onready var loot_holder = get_node("Loot_Holder")
onready var loot_holder2 = get_node("Loot_Holder2")
onready var loot_holder3 = get_node("Loot_Holder3")
onready var loot_holder4 = get_node("Loot_Holder4")
onready var loot_holder5 = get_node("Loot_Holder5")
onready var loot_holder6 = get_node("Loot_Holder6")
onready var loot_holder7 = get_node("Loot_Holder7")
onready var loot_holder8 = get_node("Loot_Holder8")

var hpdrop = load("res://Scenes/loot/Health_Pickup.tscn")
var apdrop = load("res://Scenes/loot/Armor_Pickup.tscn")
var ammo1drop = load("res://Scenes/loot/Ammo_Pickup.tscn")
var golddrop = load("res://Scenes/loot/gold1.tscn")
var gold5drop = load("res://Scenes/loot/gold5.tscn")
var hp1pdrop = load("res://Scenes/loot/Loot_Upgrade_Green.tscn")
var hp10pdrop = load("res://Scenes/loot/Loot_Upgrade_Green_Large.tscn")
var ap1pdrop = load("res://Scenes/loot/Loot_Upgrade_Blue.tscn")
var ap10pdrop = load("res://Scenes/loot/Loot_Upgrade_Blue_Large.tscn")
var pistola5drop = load("res://Scenes/loot/Loot_WPupgrade_Blue.tscn")
var pistola15drop = load("res://Scenes/loot/Loot_WPupgrade_Green.tscn")
var pistolcs2drop = load("res://Scenes/loot/Loot_WPupgrade_Yellow.tscn")
var pistolcs5drop = load("res://Scenes/loot/Loot_WPupgrade_Red.tscn")
var riflea20drop = load("res://Scenes/loot/Loot_WRupgrade_Blue.tscn")
var riflea50drop = load("res://Scenes/loot/Loot_WRupgrade_Green.tscn")
var riflecs10drop = load("res://Scenes/loot/Loot_WRupgrade_Yellow.tscn")
var riflecs20drop = load("res://Scenes/loot/Loot_WRupgrade_Red.tscn")
var shotguna4drop = load("res://Scenes/loot/Loot_WSupgrade_Blue.tscn")
var shotguna10drop = load("res://Scenes/loot/Loot_WSupgrade_Green.tscn")
var shotguncs1drop = load("res://Scenes/loot/Loot_WSupgrade_Yellow.tscn")
var shotguncs3drop = load("res://Scenes/loot/Loot_WSupgrade_Red.tscn")
var chainguna50drop = load("res://Scenes/loot/Loot_WCupgrade_Blue.tscn")
var chainguna150drop = load("res://Scenes/loot/Loot_WCupgrade_Green.tscn")
var chainguncs20drop = load("res://Scenes/loot/Loot_WCupgrade_Yellow.tscn")
var chainguncs50drop = load("res://Scenes/loot/Loot_WCupgrade_Red.tscn")
var speeddrop = load("res://Scenes/loot/Loot_Upgrade_Orange.tscn")
var jumpdrop = load("res://Scenes/loot/Loot_Upgrade_Brown.tscn")
var phyattack1drop = load("res://Scenes/loot/Loot_Upgrade_Purple.tscn")
var phyattack3drop = load("res://Scenes/loot/Loot_Upgrade_Purple_Large.tscn")
var expattack1drop = load("res://Scenes/loot/Loot_Upgrade_Pink.tscn")
var expattack3drop = load("res://Scenes/loot/Loot_Upgrade_Pink_Large.tscn")
var ap5drop = load("res://Scenes/loot/Loot_Aitem_Blue.tscn")
var ap50drop = load("res://Scenes/loot/Loot_Aitem_Green.tscn")
var ap100drop = load("res://Scenes/loot/Loot_Aitem_Yellow.tscn")
var ap200drop = load("res://Scenes/loot/Loot_Aitem_Red.tscn")
var hp5drop = load("res://Scenes/loot/Loot_Hitem_Blue.tscn")
var hp50drop = load("res://Scenes/loot/Loot_Hitem_Green.tscn")
var hp100drop = load("res://Scenes/loot/Loot_Hitem_Yellow.tscn")
var hp200drop = load("res://Scenes/loot/Loot_Hitem_Red.tscn")
var nadea1drop = load("res://Scenes/loot/Loot_Upgrade_Red.tscn")
var stickya1drop = load("res://Scenes/loot/Loot_Upgrade_Yellow.tscn")
var nademaxdrop = load("res://Scenes/loot/Loot_GItem_Green.tscn")
var stickymaxdrop = load("res://Scenes/loot/Loot_GItem_Blue.tscn")

var clawdrop = load("res://Scenes/loot/Loot_Mpart_Yellow.tscn")
var toothdrop = load("res://Scenes/loot/Loot_Mpart_Green.tscn")
var talondrop = load("res://Scenes/loot/Loot_Mpart_Red.tscn")
var bonedrop = load("res://Scenes/loot/Loot_Mpart_Blue.tscn")


var hpdrop_instance = hpdrop.instance()
var apdrop_instance = apdrop.instance()
var ammo1drop_instance = ammo1drop.instance()
var golddrop_instance = golddrop.instance()
var gold5drop_instance = gold5drop.instance()
var hp1pdrop_instance = hp1pdrop.instance()
var hp10pdrop_instance = hp10pdrop.instance()
var ap1pdrop_instance = ap1pdrop.instance()
var ap10pdrop_instance = ap10pdrop.instance()
var pistola5drop_instance = pistola5drop.instance()
var pistola15drop_instance = pistola15drop.instance()
var pistolcs2drop_instance = pistolcs2drop.instance()
var pistolcs5drop_instance = pistolcs5drop.instance()
var riflea20drop_instance = riflea20drop.instance()
var riflea50drop_instance = riflea50drop.instance()
var riflecs10drop_instance = riflecs10drop.instance()
var riflecs20drop_instance = riflecs20drop.instance()
var shotguna4drop_instance = shotguna4drop.instance()
var shotguna10drop_instance = shotguna10drop.instance()
var shotguncs1drop_instance = shotguncs1drop.instance()
var shotguncs3drop_instance = shotguncs3drop.instance()
var chainguna50drop_instance = chainguna50drop.instance()
var chainguna150drop_instance = chainguna150drop.instance()
var chainguncs20drop_instance = chainguncs20drop.instance()
var chainguncs50drop_instance = chainguncs50drop.instance()
var speeddrop_instance = speeddrop.instance()
var jumpdrop_instance = jumpdrop.instance()
var phyattack1drop_instance = phyattack1drop.instance()
var phyattack3drop_instance = phyattack3drop.instance()
var expattack1drop_instance = expattack1drop.instance()
var expattack3drop_instance = expattack3drop.instance()
var ap5drop_instance = ap5drop.instance()
var ap50drop_instance = ap50drop.instance()
var ap100drop_instance = ap100drop.instance()
var ap200drop_instance = ap200drop.instance()
var hp5drop_instance = hp5drop.instance()
var hp50drop_instance = hp50drop.instance()
var hp100drop_instance = hp100drop.instance()
var hp200drop_instance = hp200drop.instance()
var nademaxdrop_instance = nademaxdrop.instance()
var stickymaxdrop_instance = stickymaxdrop.instance()
var nadea1drop_instance = nadea1drop.instance()
var stickya1drop_instance = stickya1drop.instance()

var clawdrop_instance = clawdrop.instance()
var toothdrop_instance = toothdrop.instance()
var talondrop_instance = talondrop.instance()
var bonedrop_instance = bonedrop.instance()

var player
var current_target = null
var level
export(bool) var has_key1 = false
export(bool) var has_key2 = false
export(bool) var has_key3  = false
export(bool) var has_rifle  = false
export(bool) var has_shotgun  = false
export(bool) var has_chaingun  = false

export(int) var MAX_NADES = 0 
export(int) var MAX_STICKY = 0

export(int) var ammo_in_turret = 0
export(int) var AMMO_IN_FULL_TURRET = 0
export(int) var AMMO_RELOAD_TIME = 0
export(float) var ammo_reload_timer = 0
export var bullet_scene = preload("res://Bullet_Scene.tscn")


export(float)var FLASH_TIME = 0
export(float)var FIRE_TIME = 0
export(float)var fire_timer = 0
export(float)var flash_timer = 0

export var global_position = Vector3()
var playerPosition

export var MAIN_MENU_PATH = "res://Main_Menu.tscn"
export var vel = Vector3()

export(bool) var use_raycast = false
export(int) var PLAYER_HEIGHT = 0
export var TYPE = "ENEMY"
export var dir = Vector3()
export var knockdir = Vector3()

export(int)var soundvar = 0
var camera = null

export(int) var WEIGHT = 0
export(int) var MASS = 0
export(int) var MOVE_SPEED = 0
export(int) var  MAX_SPEED = 0
export(int) var  JUMP_SPEED = 0
export(float) var  ACCEL= 0
export(int) var  MAX_SPRINT_SPEED = 0

export(int) var SPRINT_ACCEL = 0
export(float) var GRAVITY = 0

##export(int)var flash_timer = 0
##export(int)var FLASH_TIME = 0
##export(int)var fire_timer = 0
##export(int)var FIRE_TIME = 0

export(bool) var is_sprinting = false
export(int) var  p_timer = 0
export(int) var  DEACCEL= 0
export(int) var  MAX_SLOPE_ANGLE = 0

## A variable for tracking whether we are active or not.
## Active in this case means able to fire at the target
export(bool) var is_active = false
export(bool) var is_active2 = false

export(int) var BLEED_TIME = 0

export(int)var BLEED_timer = 0

export(int) var damage = 0
export(int) var P_DAMAGE = 0
export(int) var  hitstun = 0

export(bool) var dead = false

var animation_manager

export(bool)var smoke_particles

## The amount of health we currently have
export(int) var  health = 0
## The amount of gold we currently have
export(int) var  playergold = 0
## The amount of health we have when fully healed
export(int) var  MAX_HEALTH = 0
## The max amount of gold player can carry
export(int) var  MAX_GOLD = 0
## The amount of health we currently have
export(int) var  armor = 0
## The amount of health we have when fully healed
export(int) var  MAX_ARMOR = 0
## The amount of time (in seconds) required to respawn
export(int) var  RESPAWN_TIME = 0
## A variable to track how long we've been dead
export(int) var  dead_time = 0
## A variable to track whether or not we are currently dead
export(bool) var is_dead = false
## A variable to track whether or not we are currently dying
export(bool) var is_dying = false
## A variable to track whether or not we are currently hit
export(bool) var is_hit = false

export(int)var enemy_health = 0

export(int)var MAX_ENEMY_HEALTH = 0

var node_turret_head = null
var node_enemy_head = null
var node_raycast = null
var node_clshape = null
var node_flash_one = null
var node_flash_two = null
var node_fall = null

var TURRET_DAMAGE_BULLET = 0

var TURRET_DAMAGE_RAYCAST = 0

export onready var anim = get_node("anim")

export(int) var big_bone_amount = 0
export(int) var big_talon_amount = 0
export(int) var big_tooth_amount = 0
export(int) var big_claw_amount = 0


func create_sound(sound_name, position=null):
	## Play the inputted sound at the inputted position
	## (NOTE: it will only play at the inputted position if you are using a AudioPlayer3D node)
	Globals.play_sound(sound_name, false, position)


func movement_loop():
	var motion
	if hitstun == 0:
		motion = dir.normalized() * MOVE_SPEED
	else:
		motion = knockdir.normalized() * MOVE_SPEED * 1.5
		move_and_slide(motion, Vector3(0,0,0))


func set_camera(c):
	camera = c


func P_hit(P_DAMAGE, global_transform):
	if armor == 0:
		health -= P_DAMAGE
	else:
		armor -= P_DAMAGE


func EX_hit(P_DAMAGE, global_transform):
	if armor == 0:
		health -= P_DAMAGE
	else:
		armor -= P_DAMAGE


func bullet_hit(damage, bullet_global_transform):
	if armor <= 0:
		health -= damage
	else:
		armor -= damage
		armor = clamp(armor, 0, MAX_ARMOR)


func _not_acitve():
	if is_active == false:
		MOVE_SPEED = 0


func fire_bullet():
	## If we are not using raycasting, then spawn a bullet using the bullet scene
	if use_raycast == false:

		## Clone the bullet, get the scene root, and add the bullet as a child.
		## NOTE: we are assuming that the first child of the scene's root is
		## the 3D level we're wanting to spawn the bullet at.
		var clone = bullet_scene.instance()
		var scene_root = get_tree().root.get_children()[0]
		scene_root.add_child(clone)

		## Set the bullet's global_transform to that of the pistol spawn point (which is this node).
		clone.global_transform = $Head/Barrel_End.global_transform
		## The bullet is a little too small (by default), so let's make it bigger!
		clone.scale = Vector3(8, 8, 8)
		## Set how much damage the bullet does
		clone.BULLET_DAMAGE = TURRET_DAMAGE_BULLET
		## Set how fast the bullet travels. We want the bullet to travel a little slower than the player
		clone.BULLET_SPEED = 60

		## Remove the bullet from the turret
		ammo_in_turret -= 1
	## Otherwise we are using raycasting (which works most of the time, sometimes it does not for some reason)
	else:
		## Rotate the raycast to look at the target (assuring we'll hit the target)
		node_raycast.look_at(current_target.global_transform.origin + Vector3(0, PLAYER_HEIGHT, 0), Vector3(0,1,0))

		## Force the raycast to update. This will force the raycast to detect collisions when we call it.
		## This means we are getting a frame perfect collision check with the 3D world.
		node_raycast.force_raycast_update()

		## If the ray hit something, get its collider and see if it has the 'bullet_hit' method.
		## If it does, then call it and pass the ray's global transform so we can tell which direction the bullet game from
		if node_raycast.is_colliding():
			var body = node_raycast.get_collider()
			if body.has_method("bullet_hit"):
				body.bullet_hit(TURRET_DAMAGE_RAYCAST, node_raycast.global_transform)

		## Remove the bullet from the turret
		ammo_in_turret -= 1

	## Make the flash meshes visible
	node_flash_one.visible = true
	node_flash_two.visible = true
	anim.play("shoot")
	## Set the flash and fire timers
	flash_timer = FLASH_TIME
	fire_timer = FIRE_TIME

	## If the turret is out of ammo, set the reload timer
	if ammo_in_turret <= 0:
		ammo_reload_timer = AMMO_RELOAD_TIME



func get_drop_scarab():
	dropvar = randi()%4

	if dropvar == 0:
		loot_holder.add_child(talondrop_instance)
	if dropvar == 1:
		loot_holder.add_child(golddrop_instance)


	dropvar = randi()%4

	if dropvar == 0:
		loot_holder2.add_child(ammo1drop_instance)
	if dropvar == 1:
		loot_holder2.add_child(golddrop_instance)


	dropvar = randi()%20

	if dropvar == 0:
		loot_holder3.add_child(hp5drop_instance)
	if dropvar == 1:
		loot_holder3.add_child(golddrop_instance)


	dropvar = randi()%4

	if dropvar == 0:
		loot_holder4.add_child(ap5drop_instance)
	if dropvar == 1:
		loot_holder4.add_child(golddrop_instance)


	dropvar = randi()%20

	if dropvar == 0:
		loot_holder5.add_child(hpdrop_instance)
	if dropvar == 1:
		loot_holder5.add_child(golddrop_instance)


	dropvar = randi()%10
	
	if dropvar == 0:
		loot_holder6.add_child(apdrop_instance)
	if dropvar == 1:
		loot_holder6.add_child(golddrop_instance)


	dropvar = randi()%10

	if dropvar == 0:
		loot_holder7.add_child(ap5drop_instance)
	if dropvar == 1:
		loot_holder7.add_child(golddrop_instance)


	dropvar = randi()%10

	if dropvar == 0:
		loot_holder8.add_child(golddrop_instance)
	if dropvar == 1:
		loot_holder8.add_child(gold5drop_instance)


func get_drop_thulk():
	dropvar = randi()%4

	if dropvar == 0:
		loot_holder.add_child(bonedrop_instance)
	if dropvar == 1:
		loot_holder.add_child(gold5drop_instance)


	dropvar = randi()%8

	if dropvar == 0:
		loot_holder2.add_child(toothdrop_instance)
	if dropvar == 1:
		loot_holder2.add_child(gold5drop_instance)


	dropvar = randi()%10

	if dropvar == 0:
		loot_holder3.add_child(apdrop_instance)
	if dropvar == 1:
		loot_holder3.add_child(ap50drop_instance)
	if dropvar == 2:
		loot_holder3.add_child(ap100drop_instance)
	if dropvar == 3:
		loot_holder3.add_child(ap200drop_instance)
	if dropvar == 4:
		loot_holder3.add_child(gold5drop_instance)


	dropvar = randi()%10

	if dropvar == 0:
		loot_holder4.add_child(gold5drop_instance)
	if dropvar == 1:
		loot_holder4.add_child(gold5drop_instance)


	dropvar = randi()%20

	if dropvar == 0:
		loot_holder5.add_child(hp100drop_instance)
	if dropvar == 1:
		loot_holder5.add_child(hp200drop_instance)
	if dropvar == 1:
		loot_holder5.add_child(gold5drop_instance)


	dropvar = randi()%20

	if dropvar == 0:
		loot_holder6.add_child(apdrop_instance)
	if dropvar == 1:
		loot_holder6.add_child(gold5drop_instance)
	if dropvar == 2:
		loot_holder6.add_child(toothdrop_instance)
	if dropvar == 3:
		loot_holder6.add_child(bonedrop_instance)
	if dropvar == 4:
		loot_holder6.add_child(gold5drop_instance)


	dropvar = randi()%4

	if dropvar == 0:
		loot_holder7.add_child(apdrop_instance)
	if dropvar == 1:
		loot_holder7.add_child(gold5drop_instance)


	dropvar = randi()%4

	if dropvar == 0:
		loot_holder8.add_child(golddrop_instance)
	if dropvar == 1:
		loot_holder8.add_child(gold5drop_instance)


func get_drop_rahorde():
	dropvar = randi()%10

	if dropvar == 0:
		loot_holder.add_child(talondrop_instance)
	if dropvar == 1:
		loot_holder.add_child(gold5drop_instance)


	dropvar = randi()%10

	if dropvar == 0:
		loot_holder2.add_child(ammo1drop_instance)
	if dropvar == 1:
		loot_holder2.add_child(gold5drop_instance)


	dropvar = randi()%10

	if dropvar == 0:
		loot_holder3.add_child(gold5drop_instance)
	if dropvar == 1:
		loot_holder3.add_child(gold5drop_instance)


	dropvar = randi()%20

	if dropvar == 0:
		loot_holder4.add_child(hp50drop_instance)
	if dropvar == 1:
		loot_holder4.add_child(gold5drop_instance)


	dropvar = randi()%20

	if dropvar == 0:
		loot_holder5.add_child(ap50drop_instance)
	if dropvar == 1:
		loot_holder5.add_child(gold5drop_instance)


	dropvar = randi()%10

	if dropvar == 0:
		loot_holder6.add_child(hpdrop_instance)
	if dropvar == 1:
		loot_holder6.add_child(gold5drop_instance)


	dropvar = randi()%10

	if dropvar == 0:
		loot_holder7.add_child(apdrop_instance)
	if dropvar == 1:
		loot_holder7.add_child(gold5drop_instance)


	dropvar = randi()%10

	if dropvar == 0:
		loot_holder8.add_child(talondrop_instance)


func get_drop_spikefiend():
	dropvar = randi()%4
	
	if dropvar == 0:
		loot_holder2.add_child(ammo1drop_instance)
	if dropvar == 1:
		loot_holder.add_child(golddrop_instance)


	dropvar = randi()%4
	
	if dropvar == 0:
		loot_holder2.add_child(ammo1drop_instance)
	if dropvar == 1:
		loot_holder2.add_child(golddrop_instance)


	dropvar = randi()%20

	if dropvar == 0:
		loot_holder3.add_child(hp5drop_instance)
	if dropvar == 1:
		loot_holder3.add_child(golddrop_instance)


	dropvar = randi()%4

	if dropvar == 0:
		loot_holder4.add_child(ap5drop_instance)
	if dropvar == 1:
		loot_holder4.add_child(golddrop_instance)


	dropvar = randi()%20

	if dropvar == 0:
		loot_holder5.add_child(hpdrop_instance)
	if dropvar == 1:
		loot_holder5.add_child(golddrop_instance)


	dropvar = randi()%10

	if dropvar == 0:
		loot_holder6.add_child(apdrop_instance)
	if dropvar == 1:
		loot_holder6.add_child(golddrop_instance)


	dropvar = randi()%10

	if dropvar == 0:
		loot_holder7.add_child(ap5drop_instance)
	if dropvar == 1:
		loot_holder7.add_child(golddrop_instance)


	dropvar = randi()%10

	if dropvar == 0:
		loot_holder8.add_child(golddrop_instance)
	if dropvar == 1:
		loot_holder8.add_child(gold5drop_instance)


func get_drop_mosquito():
	dropvar = randi()%4

	if dropvar == 0:
		loot_holder2.add_child(ammo1drop_instance)
	if dropvar == 1:
		loot_holder.add_child(golddrop_instance)


	dropvar = randi()%4

	if dropvar == 0:
		loot_holder2.add_child(ammo1drop_instance)
	if dropvar == 1:
		loot_holder2.add_child(golddrop_instance)


	dropvar = randi()%20

	if dropvar == 0:
		loot_holder3.add_child(hp5drop_instance)
	if dropvar == 1:
		loot_holder3.add_child(golddrop_instance)


	dropvar = randi()%4

	if dropvar == 0:
		loot_holder4.add_child(ap5drop_instance)
	if dropvar == 1:
		loot_holder4.add_child(golddrop_instance)


	dropvar = randi()%20

	if dropvar == 0:
		loot_holder5.add_child(hpdrop_instance)
	if dropvar == 1:
		loot_holder5.add_child(golddrop_instance)


	dropvar = randi()%10

	if dropvar == 0:
		loot_holder6.add_child(apdrop_instance)
	if dropvar == 1:
		loot_holder6.add_child(golddrop_instance)


	dropvar = randi()%10

	if dropvar == 0:
		loot_holder7.add_child(ap5drop_instance)
	if dropvar == 1:
		loot_holder7.add_child(golddrop_instance)


	dropvar = randi()%10

	if dropvar == 0:
		loot_holder8.add_child(golddrop_instance)
	if dropvar == 1:
		loot_holder8.add_child(gold5drop_instance)


func get_drop_charurus():
	dropvar = randi()%10
	
	if dropvar == 0:
		loot_holder.add_child(talondrop_instance)
	if dropvar == 1:
		loot_holder.add_child(gold5drop_instance)


	dropvar = randi()%8

	if dropvar == 0:
		loot_holder2.add_child(clawdrop_instance)
	if dropvar == 1:
		loot_holder2.add_child(gold5drop_instance)


	dropvar = randi()%10

	if dropvar == 0:
		loot_holder3.add_child(apdrop_instance)
	if dropvar == 1:
		loot_holder3.add_child(ap50drop_instance)
	if dropvar == 2:
		loot_holder3.add_child(ap100drop_instance)
	if dropvar == 3:
		loot_holder3.add_child(ap200drop_instance)
	if dropvar == 4:
		loot_holder3.add_child(gold5drop_instance)


	dropvar = randi()%10

	if dropvar == 0:
		loot_holder4.add_child(gold5drop_instance)
	if dropvar == 1:
		loot_holder4.add_child(gold5drop_instance)


	dropvar = randi()%20

	if dropvar == 0:
		loot_holder5.add_child(hp100drop_instance)
	if dropvar == 1:
		loot_holder5.add_child(hp200drop_instance)
	if dropvar == 1:
		loot_holder5.add_child(gold5drop_instance)


	dropvar = randi()%20

	if dropvar == 0:
		loot_holder6.add_child(hpdrop_instance)
	if dropvar == 1:
		loot_holder6.add_child(hp50drop_instance)
	if dropvar == 2:
		loot_holder6.add_child(hp100drop_instance)
	if dropvar == 3:
		loot_holder6.add_child(hp200drop_instance)
	if dropvar == 4:
		loot_holder6.add_child(gold5drop_instance)


	dropvar = randi()%4

	if dropvar == 0:
		loot_holder7.add_child(apdrop_instance)
	if dropvar == 1:
		loot_holder7.add_child(gold5drop_instance)
	dropvar = randi()%4
	if dropvar == 0:
		loot_holder8.add_child(golddrop_instance)
	if dropvar == 1:
		loot_holder8.add_child(gold5drop_instance)


func get_drop_radament():
	dropvar = randi()%10

	if dropvar == 0:
		loot_holder.add_child(bonedrop_instance)
	if dropvar == 1:
		loot_holder.add_child(gold5drop_instance)


	dropvar = randi()%8

	if dropvar == 0:
		loot_holder2.add_child(hp1pdrop_instance)
	if dropvar == 1:
		loot_holder2.add_child(ap1pdrop_instance)
	if dropvar == 2:
		loot_holder2.add_child(pistola5drop_instance)
	if dropvar == 3:
		loot_holder2.add_child(toothdrop_instance)
	if dropvar == 4:
		loot_holder2.add_child(pistolcs2drop_instance)
	if dropvar == 5:
		loot_holder2.add_child(riflea20drop_instance)
	if dropvar == 6:
		loot_holder2.add_child(riflecs10drop_instance)
	if dropvar == 7:
		loot_holder2.add_child(phyattack1drop_instance)
	if dropvar == 8:
		loot_holder2.add_child(expattack1drop_instance)
	if dropvar == 9:
		loot_holder2.add_child(nadea1drop_instance)
	if dropvar == 10:
		loot_holder2.add_child(stickya1drop_instance)
	if dropvar == 11:
		loot_holder2.add_child(jumpdrop_instance)


	dropvar = randi()%10

	if dropvar == 0:
		loot_holder3.add_child(ammo1drop_instance)
	if dropvar == 1:
		loot_holder3.add_child(gold5drop_instance)


	dropvar = randi()%20

	if dropvar == 0:
		loot_holder4.add_child(hp50drop_instance)
	if dropvar == 1:
		loot_holder4.add_child(hp100drop_instance)
	if dropvar == 2:
		loot_holder4.add_child(hp200drop_instance)
	if dropvar == 3:
		loot_holder7.add_child(gold5drop_instance)


	dropvar = randi()%20

	if dropvar == 0:
		loot_holder5.add_child(ap50drop_instance)
	if dropvar == 1:
		loot_holder5.add_child(ap100drop_instance)
	if dropvar == 2:
		loot_holder5.add_child(ap200drop_instance)
	if dropvar == 3:
		loot_holder5.add_child(gold5drop_instance)


	dropvar = randi()%10

	if dropvar == 0:
		loot_holder6.add_child(hpdrop_instance)
	if dropvar == 1:
		loot_holder6.add_child(gold5drop_instance)


	dropvar = randi()%10

	if dropvar == 0:
		loot_holder7.add_child(apdrop_instance)
	if dropvar == 1:
		loot_holder7.add_child(gold5drop_instance)


	dropvar = randi()%10

	if dropvar == 0:
		loot_holder8.add_child(bonedrop_instance)
	if dropvar == 1:
		loot_holder7.add_child(gold5drop_instance)


func get_drop_spider():
	dropvar = randi()%4

	if dropvar == 1:
		loot_holder.add_child(golddrop_instance)


	dropvar = randi()%4
	
	if dropvar == 0:
		loot_holder2.add_child(golddrop_instance)


	dropvar = randi()%20

	if dropvar == 0:
		loot_holder3.add_child(hp5drop_instance)
	if dropvar == 1:
		loot_holder3.add_child(golddrop_instance)


	dropvar = randi()%4

	if dropvar == 0:
		loot_holder4.add_child(ap5drop_instance)
	if dropvar == 1:
		loot_holder4.add_child(golddrop_instance)


	dropvar = randi()%20

	if dropvar == 0:
		loot_holder5.add_child(hpdrop_instance)
	if dropvar == 1:
		loot_holder5.add_child(golddrop_instance)


	dropvar = randi()%10

	if dropvar == 0:
		loot_holder6.add_child(apdrop_instance)
	if dropvar == 1:
		loot_holder6.add_child(golddrop_instance)


	dropvar = randi()%10

	if dropvar == 0:
		loot_holder7.add_child(hp50drop_instance)
	if dropvar == 1:
		loot_holder7.add_child(golddrop_instance)


	dropvar = randi()%100

	if dropvar == 0:
		loot_holder8.add_child(speeddrop_instance)
	if dropvar == 1:
		loot_holder8.add_child(jumpdrop_instance)


func get_drop_ffm2():
	dropvar = randi()%10

	if dropvar == 0:
		loot_holder.add_child(talondrop_instance)
	if dropvar == 1:
		loot_holder.add_child(gold5drop_instance)


	dropvar = randi()%10

	if dropvar == 0:
		loot_holder2.add_child(ammo1drop_instance)
	if dropvar == 1:
		loot_holder2.add_child(gold5drop_instance)


	dropvar = randi()%10

	if dropvar == 0:
		loot_holder3.add_child(gold5drop_instance)
	if dropvar == 1:
		loot_holder3.add_child(gold5drop_instance)


	dropvar = randi()%20

	if dropvar == 0:
		loot_holder4.add_child(hp50drop_instance)
	if dropvar == 1:
		loot_holder4.add_child(gold5drop_instance)

	
	dropvar = randi()%20

	if dropvar == 0:
		loot_holder5.add_child(ap50drop_instance)
	if dropvar == 1:
		loot_holder5.add_child(gold5drop_instance)


	dropvar = randi()%10

	if dropvar == 0:
		loot_holder6.add_child(hpdrop_instance)
	if dropvar == 1:
		loot_holder6.add_child(gold5drop_instance)


	dropvar = randi()%10

	if dropvar == 0:
		loot_holder7.add_child(apdrop_instance)
	if dropvar == 1:
		loot_holder7.add_child(gold5drop_instance)


	dropvar = randi()%10

	if dropvar == 0:
		loot_holder8.add_child(talondrop_instance)


func get_drop_bloodlord():
	dropvar = randi()%4

	if dropvar == 0:
		loot_holder.add_child(clawdrop_instance)
	if dropvar == 1:
		loot_holder.add_child(gold5drop_instance)


	dropvar = randi()%100

	if dropvar == 0:
		loot_holder2.add_child(hp1pdrop_instance)
	if dropvar == 1:
		loot_holder2.add_child(ap1pdrop_instance)
	if dropvar == 2:
		loot_holder2.add_child(pistola5drop_instance)
	if dropvar == 3:
		loot_holder2.add_child(toothdrop_instance)
	if dropvar == 4:
		loot_holder2.add_child(pistolcs2drop_instance)
	if dropvar == 5:
		loot_holder2.add_child(riflea20drop_instance)
	if dropvar == 6:
		loot_holder2.add_child(riflecs10drop_instance)
	if dropvar == 7:
		loot_holder2.add_child(phyattack1drop_instance)
	if dropvar == 8:
		loot_holder2.add_child(expattack1drop_instance)
	if dropvar == 9:
		loot_holder2.add_child(nadea1drop_instance)
	if dropvar == 10:
		loot_holder2.add_child(stickya1drop_instance)
	if dropvar == 11:
		loot_holder2.add_child(speeddrop_instance)


	dropvar = randi()%10

	if dropvar == 0:
		loot_holder3.add_child(ap100drop_instance)
	if dropvar == 1:
		loot_holder3.add_child(ap200drop_instance)
	if dropvar == 2:
		loot_holder3.add_child(gold5drop_instance)


	dropvar = randi()%10

	if dropvar == 0:
		loot_holder4.add_child(gold5drop_instance)
	if dropvar == 1:
		loot_holder4.add_child(gold5drop_instance)


	dropvar = randi()%20

	if dropvar == 0:
		loot_holder5.add_child(hp100drop_instance)
	if dropvar == 1:
		loot_holder5.add_child(hp200drop_instance)
	if dropvar == 2:
		loot_holder5.add_child(gold5drop_instance)


	dropvar = randi()%4

	if dropvar == 0:
		loot_holder6.add_child(apdrop_instance)
	if dropvar == 1:
		loot_holder6.add_child(hpdrop_instance)
	if dropvar == 2:
		loot_holder6.add_child(gold5drop_instance)


	dropvar = randi()%4

	if dropvar == 0:
		loot_holder7.add_child(apdrop_instance)
	if dropvar == 1:
		loot_holder7.add_child(hpdrop_instance)
	if dropvar == 2:
		loot_holder7.add_child(gold5drop_instance)


	dropvar = randi()%4

	if dropvar == 0:
		loot_holder8.add_child(golddrop_instance)
	if dropvar == 1:
		loot_holder8.add_child(gold5drop_instance)
	if dropvar == 2:
		loot_holder8.add_child(toothdrop_instance)


func get_drop_balrog():
	dropvar = randi()%4

	if dropvar == 0:
		loot_holder.add_child(clawdrop_instance)
	if dropvar == 1:
		loot_holder.add_child(gold5drop_instance)


	dropvar = randi()%8

	if dropvar == 0:
		loot_holder2.add_child(hp1pdrop_instance)
	if dropvar == 1:
		loot_holder2.add_child(ap1pdrop_instance)
	if dropvar == 2:
		loot_holder2.add_child(pistola5drop_instance)
	if dropvar == 3:
		loot_holder2.add_child(toothdrop_instance)
	if dropvar == 4:
		loot_holder2.add_child(pistolcs2drop_instance)
	if dropvar == 5:
		loot_holder2.add_child(riflea20drop_instance)
	if dropvar == 6:
		loot_holder2.add_child(riflecs10drop_instance)
	if dropvar == 7:
		loot_holder2.add_child(phyattack1drop_instance)
	if dropvar == 8:
		loot_holder2.add_child(expattack1drop_instance)
	if dropvar == 9:
		loot_holder2.add_child(nadea1drop_instance)
	if dropvar == 10:
		loot_holder2.add_child(stickya1drop_instance)
	if dropvar == 11:
		loot_holder2.add_child(jumpdrop_instance)


	dropvar = randi()%10

	if dropvar == 0:
		loot_holder3.add_child(ap100drop_instance)
	if dropvar == 1:
		loot_holder3.add_child(ap200drop_instance)
	if dropvar == 2:
		loot_holder3.add_child(gold5drop_instance)


	dropvar = randi()%10

	if dropvar == 0:
		loot_holder4.add_child(gold5drop_instance)
	if dropvar == 1:
		loot_holder4.add_child(gold5drop_instance)


	dropvar = randi()%20

	if dropvar == 0:
		loot_holder5.add_child(hpdrop_instance)
	if dropvar == 1:
		loot_holder5.add_child(apdrop_instance)
	if dropvar == 2:
		loot_holder5.add_child(gold5drop_instance)


	dropvar = randi()%20

	if dropvar == 0:
		loot_holder6.add_child(hp100drop_instance)
	if dropvar == 1:
		loot_holder6.add_child(hp200drop_instance)
	if dropvar == 2:
		loot_holder6.add_child(gold5drop_instance)


	dropvar = randi()%4

	if dropvar == 0:
		loot_holder7.add_child(apdrop_instance)
	if dropvar == 1:
		loot_holder7.add_child(hpdrop_instance)
	if dropvar == 2:
		loot_holder7.add_child(gold5drop_instance)


	dropvar = randi()%4

	if dropvar == 0:
		loot_holder8.add_child(golddrop_instance)
	if dropvar == 1:
		loot_holder8.add_child(gold5drop_instance)
	if dropvar == 2:
		loot_holder8.add_child(toothdrop_instance)
