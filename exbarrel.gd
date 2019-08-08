extends RigidBody
const BASE_BULLET_BOOST = 9;

## The amount of damage needed to break a target
const TARGET_HEALTH = 40

## The amount of health the target currently has
var current_health = 40

var breakable = load("res://Breakable.gd")
var entity = load("res://engine/entity2.gd")

var hp5drop = load("res://Scenes/loot/Loot_Hitem_Blue.tscn")
var hp50drop = load("res://Scenes/loot/Loot_Hitem_Green.tscn")
var ap5drop = load("res://Scenes/loot/Loot_Aitem_Blue.tscn")
var ap50drop = load("res://Scenes/loot/Loot_Aitem_Green.tscn")
var hpdrop = load("res://Scenes/loot/Health_Pickup.tscn")
var apdrop = load("res://Scenes/loot/Armor_Pickup.tscn")
var ammo1drop = load("res://Scenes/loot/Ammo_Pickup.tscn")
var nadedrop = load("res://Scenes/loot/Ammo_Pickup.tscn")
var golddrop = load("res://Scenes/loot/gold1.tscn")
var gold5drop = load("res://Scenes/loot/gold5.tscn")


var clawdrop = load("res://Scenes/loot/Loot_Mpart_Yellow.tscn")
var toothdrop = load("res://Scenes/loot/Loot_Mpart_Green.tscn")
var talondrop = load("res://Scenes/loot/Loot_Mpart_Red.tscn")
var bonedrop = load("res://Scenes/loot/Loot_Mpart_Blue.tscn")

var hpdrop_instance = hpdrop.instance()
var apdrop_instance = apdrop.instance()
var ammo1drop_instance = ammo1drop.instance()
var golddrop_instance = golddrop.instance()
var gold5drop_instance = gold5drop.instance()
var ap50drop_instance = ap50drop.instance()
var ap5drop_instance = ap5drop.instance()
var hp5drop_instance = hp5drop.instance()
var hp50drop_instance = hp50drop.instance()

var clawdrop_instance = clawdrop.instance()
var toothdrop_instance = toothdrop.instance()
var talondrop_instance = talondrop.instance()
var bonedrop_instance = bonedrop.instance()


export (PackedScene) var destroyed_breakable
# A node for holding the broken target scene.
# We use this to easily add/remove the broken target scene
onready var broken_breakable_holder = get_node("Broken_Breakable_Holder")

onready var loot_holder = get_node("Loot_Holder")
onready var loot_holder2 = get_node("Loot_Holder2")
onready var loot_holder3 = get_node("Loot_Holder3")
onready var loot_holder4 = get_node("Loot_Holder4")
onready var loot_holder5 = get_node("Loot_Holder5")
onready var loot_holder6 = get_node("Loot_Holder6")
onready var loot_holder7 = get_node("Loot_Holder7")
onready var loot_holder8 = get_node("Loot_Holder8")

## The collision shape for the target.
## NOTE: this is for the whole target, not the pieces of the target
#var target2_collision_shape

## The destroyed target scene. We use 'export' so we can assign it from
## the editor

const RUBBLE_DESPAWN_TIME = 6

var rubble_despawn_timer = 0
var breakable_collision_shape
var golddropvar = null
var dropvar = null

func _ready():
	breakable_collision_shape = $Collision_Shape


func _physics_process(delta):
	## If the target respawn timer is more than 0, then we're currently disabled and need
	## to reduce time from the timer so we can respawn
	if rubble_despawn_timer > 0:
		rubble_despawn_timer -= delta

		if rubble_despawn_timer <= 0:

			## Remove all children in the broken target holder
			for child in broken_breakable_holder.get_children():
				child.queue_free()


func EX_hit(damage, bullet_hit_pos):
	current_health -= damage

	## If we're at 0 health or below, we need to spawn the broken target scene
	if current_health <= 0:
		## Instance the scene and add it as a child of the broken target holder
		var clone = destroyed_breakable.instance()
		broken_breakable_holder.add_child(clone)

		## make the pieces of the target explode outwards
		for rigid in clone.get_children():
			if rigid is RigidBody:
				## Find the center position of the target relative to the RigidBody
				var center_in_rigid_space = broken_breakable_holder.global_transform.origin - rigid.global_transform.origin
				## Find the direction from the local center to the RigidBody
				var direction = (rigid.transform.origin - center_in_rigid_space).normalized()
				## Apply the impulse with some additional force (I find 12 works nicely)
				rigid.apply_impulse(center_in_rigid_space, direction * 12 * damage)

		## Set our respawn timer
		rubble_despawn_timer = RUBBLE_DESPAWN_TIME

		## Disable our collision shape and make ourselves invisible
		breakable_collision_shape.disabled = true
		$Grenade.visible = false
		## Set our despawn timer

		pause_mode = MODE_STATIC




func bullet_hit(damage, bullet_hit_pos):
	current_health -= damage

	## If we're at 0 health or below, we need to spawn the broken target scene
	if current_health <= 0:
		## Instance the scene and add it as a child of the broken target holder
		var clone = destroyed_breakable.instance()
		broken_breakable_holder.add_child(clone)

		## make the pieces of the target explode outwards
		for rigid in clone.get_children():
			if rigid is RigidBody:
				## Find the center position of the target relative to the RigidBody
				var center_in_rigid_space = broken_breakable_holder.global_transform.origin - rigid.global_transform.origin
				## Find the direction from the local center to the RigidBody
				var direction = (rigid.transform.origin - center_in_rigid_space).normalized()
				## Apply the impulse with some additional force (I find 12 works nicely)
				rigid.apply_impulse(center_in_rigid_space, direction * 12 * damage)

		## Set our respawn timer
		rubble_despawn_timer = RUBBLE_DESPAWN_TIME

		## Disable our collision shape and make ourselves invisible
		breakable_collision_shape.disabled = true
		$Target_Whole.visible = false
		## Set our despawn timer
		set_mode(MODE_STATIC)



func _get_drop():
	dropvar = randi()%1
	if dropvar == 0:
		loot_holder.add_child(ammo1drop_instance)
	if dropvar == 1:
		loot_holder.add_child(golddrop_instance)


	dropvar = randi()%1
	if dropvar == 0:
		loot_holder3.add_child(ap5drop_instance)
	if dropvar == 1:
		loot_holder3.add_child(golddrop_instance)
	dropvar = randi()%4
	if dropvar == 0:
		loot_holder4.add_child(apdrop_instance)
	if dropvar == 1:
		loot_holder4.add_child(golddrop_instance)

	dropvar = randi()%1
	if dropvar == 0:
		loot_holder5.add_child(ap50drop_instance)
	if dropvar == 1:
		loot_holder5.add_child(golddrop_instance)
	dropvar = randi()%4
	if dropvar == 0:
		loot_holder6.add_child(golddrop_instance)

	dropvar = randi()%100
	if dropvar == 0:
		loot_holder7.add_child(bonedrop_instance)
	if dropvar == 1:
		loot_holder7.add_child(clawdrop_instance)

	dropvar = randi()%20
	if dropvar == 0:
		loot_holder8.add_child(toothdrop_instance)
	if dropvar == 1:
		loot_holder8.add_child(talondrop_instance)
