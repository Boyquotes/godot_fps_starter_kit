extends "res://Scripts/loot/Loot_global.gd"


func _on_Item_Pickup_Trigger_body_entered(body):
	select_item(item_var)
