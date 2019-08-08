extends Spatial

# The size of this ammo pickup
export (int, "full size", "small") var kit_size = 1 setget kit_size_change

# The amount of health each pickup in each size contains
# 0 = full size pickup, 1 = small pickup
export var HEALTH_AMOUNTS = [70, 30]
export var GOLD1_AMOUNTS = [10, 1]
export var GOLD5_AMOUNTS = [25, 5]
export var ARMOR1_AMOUNTS = [25, 1]
export var ARMOR5_AMOUNTS = [25, 5]

## The length of time (in seconds) it will take for the pickup to respawn
#const RESPAWN_TIME = 20
## A variable for tracking how much respawn time has passed
#var respawn_timer = 0

# A variable for tracking whether _ready has been called.
# Because setget functions are called before _ready, we need to ignore the
# first kit_size_change call, because we cannot access child nodes until _ready is called
export (bool) var is_ready = false

func kit_size_change(value):
	# We only want to change things IF _ready has already been called.
	# this is because we cannot access nodes until _ready has been called, but all setget
	# functions are called before _ready. To get around this, we only set kit_value if we
	# are not ready.
	if is_ready:
		# Make the current kit invisible and disable its collision shape
		kit_size_change_values(kit_size, false)
		kit_size = value
		# Make the newly assigned kit visible and enable its collision shape
		kit_size_change_values(kit_size, true)
	else:
		kit_size = value


func kit_size_change_values(size, enable):
	# Based on the size passed in, enable/disable the correct nodes.
	# This includes the collision shape, so we cannot pickup health for a size that is not visible.
	# (If all sizes are disabled, then we cannot collect health at all)
	if size == 0:
		$Holder/Pickup_Trigger/Shape_Kit.disabled = !enable
		$Holder/large.visible = enable
	elif size == 1:
		$Holder/Pickup_Trigger/Shape_Kit_Small.disabled = !enable
		$Holder/Small.visible = enable
