extends Spatial

## The size of this ammo pickup
export (int, "full size", "small") var kit_size = 1 setget kit_size_change

## The amount of health each pickup in each size contains
## 0 = full size pickup, 1 = small pickup
const GOLD1_AMOUNTS = [10, 1]

var is_ready = false

func _ready():
	## Get the area for the trigger, and assign it's body_entered signal to trigger_body_entered
	$Holder/Gold_Pickup_Trigger.connect("body_entered", self, "trigger_body_entered")
	
	## Now we can use all of our setget functions.
	is_ready = true
	
	## Hide all of the possible kit sizes
	kit_size_change_values(0, false)
	kit_size_change_values(1, false)
	## Then make only the proper one visible
	kit_size_change_values(kit_size, true)


func kit_size_change(value):
	## We only want to change things IF _ready has already been called.
	## this is because we cannot access nodes until _ready has been called, but all setget
	## functions are called before _ready. To get around this, we only set kit_value if we
	## are not ready.
	if is_ready:
		## Make the current kit invisible and disable its collision shape
		kit_size_change_values(kit_size, false)
		kit_size = value
		## Make the newly assigned kit visible and enable its collision shape
		kit_size_change_values(kit_size, true)
	else:
		kit_size = value


func kit_size_change_values(size, enable):
	## Based on the size passed in, enable/disable the correct nodes.
	## This includes the collision shape, so we cannot pickup health for a size that is not visible.
	## (If all sizes are disabled, then we cannot collect health at all)
	if size == 0:
		$Holder/Gold_Pickup_Trigger/Shape_Kit.disabled = !enable
		$Holder/Gold1_large.visible = enable
	elif size == 1:
		$Holder/Gold_Pickup_Trigger/Shape_Kit_Small.disabled = !enable
		$Holder/Gold1_Small.visible = enable


func trigger_body_entered(body):
	## If the body has the add_health function, then call it,
	## set the respawn timer (so we have to wait for the health to respawn),
	## and make the nodes for the current size disabled.
	if body.has_method("add_gold"):
		body.add_gold(GOLD1_AMOUNTS[kit_size])
	## allows item to respawn
#		respawn_timer = RESPAWN_TIME
		kit_size_change_values(kit_size, false)
		create_sound("pickupitem")


func create_sound(sound_name, position=null):
	# Play the inputted sound at the inputted position
	# (NOTE: it will only play at the inputted position if you are using a AudioPlayer3D node)
	Globals.play_sound(sound_name, false, position)