extends Spatial

var is_ready = false
export(int) var item_var = 0

onready var inv = preload("res://Scripts/Script_PlayerInventory.gd")


func _ready():
	$Holder/Item_Pickup_Trigger.connect("body_entered", self, "trigger_body_entered")

	is_ready = true


func create_sound(sound_name, position=null):
	## Play the inputted sound at the inputted position
	## (NOTE: it will only play at the inputted position if you are using a AudioPlayer3D node)
	Globals.play_sound(sound_name, false, position)


func select_item(v):
	var affectedSlot = Global_Player.inventory_addItem(v)
	if (affectedSlot >= 0):
		inv.update_slot(affectedSlot)
		create_sound("pickupitem")
		$Holder/Item_Pickup_Trigger/Shape_Kit.disabled = true
		$Holder.visible = false