extends "res://Scripts/loot/Loot_global2.gd"


func _on_Item_Pickup_Trigger_body_entered(body):
	if body.has_method("process_input"):
		select_item(item_var)
		body.got_key2()
