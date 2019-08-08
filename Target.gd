
extends RigidBody
## The amount of damage needed to break a target
const TARGET_HEALTH = 40
## The amount of health the target currently has
var current_health = 40

const RUBBLE_DESPAWN_TIME = 6

var rubble_despawn_timer = 0


var hpdrop = load("res://Scenes/loot/Health_Pickup.tscn")
var apdrop = load("res://Scenes/loot/Armor_Pickup.tscn")
var ammo1drop = load("res://Scenes/loot/Ammo_Pickup.tscn")
var golddrop = load("res://Scenes/loot/gold1.tscn")
var gold5drop = load("res://Scenes/loot/gold5.tscn")
var aitemgreendrop = load("res://Scenes/loot/Loot_Aitem_Green.tscn")
var aitembluedrop = load("res://Scenes/loot/Loot_Aitem_Blue.tscn")
var hitemgreendrop = load("res://Scenes/loot/Loot_Hitem_Green.tscn")
var hitembluedrop = load("res://Scenes/loot/Loot_Hitem_Blue.tscn")

var hpdrop_instance = hpdrop.instance()
var apdrop_instance = apdrop.instance()
var ammo1drop_instance = ammo1drop.instance()
var golddrop_instance = golddrop.instance()
var gold5drop_instance = gold5drop.instance()
var aitemgreendrop_instance = aitemgreendrop.instance()
var aitembluedrop_instance = aitembluedrop.instance()
var hitemgreendrop_instance = hitemgreendrop.instance()
var hitembluedrop_instance = hitembluedrop.instance()




## A node for holding the broken target scene.
## We use this to easily add/remove the broken target scene
var broken_breakable_holder
var loot_holder
var loot_holder2
var loot_holder3
var loot_holder4
var loot_holder5
var loot_holder6
var loot_holder7
var loot_holder8


## The collision shape for the target.
## NOTE: this is for the whole target, not the pieces of the target
var breakable_collision_shape

export (PackedScene) var destroyed_breakable

var golddropvar = null
var dropvar = null

func _ready():

	## Get the required nodes
	## NOTE: we are using get_node here because we need to get a node in the parent
	broken_breakable_holder = get_parent().get_node("Broken_Breakable_Holder")
	loot_holder = get_parent().get_node("Loot_Holder")
	loot_holder2 = get_parent().get_node("Loot_Holder2")
	loot_holder3 = get_parent().get_node("Loot_Holder3")
	loot_holder4 = get_parent().get_node("Loot_Holder4")
	loot_holder5 = get_parent().get_node("Loot_Holder5")
	loot_holder6 = get_parent().get_node("Loot_Holder6")
	loot_holder7 = get_parent().get_node("Loot_Holder7")
	loot_holder8 = get_parent().get_node("Loot_Holder8")
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

func _get_drop():
	dropvar = randi()%4
	if dropvar == 0:
		loot_holder.add_child(ammo1drop_instance)

	dropvar = randi()%4
	if dropvar == 0:
		loot_holder2.add_child(hitemgreendrop_instance)

	dropvar = randi()%4
	if dropvar == 0:
		loot_holder3.add_child(aitemgreendrop_instance)

	dropvar = randi()%4
	if dropvar == 0:
		loot_holder4.add_child(hitembluedrop_instance)

	dropvar = randi()%4
	if dropvar == 0:
		loot_holder5.add_child(aitembluedrop_instance)

	dropvar = randi()%4
	if dropvar == 0:
		loot_holder6.add_child(hpdrop_instance)

	dropvar = randi()%4
	if dropvar == 0:
		loot_holder7.add_child(apdrop_instance)
#
	dropvar = randi()%4
	if dropvar == 0:
		loot_holder8.add_child(golddrop_instance)
#
#

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
		$Target_Whole.visible = false

		
		



