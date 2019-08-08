extends Node
var dropvar

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


var broken_target_holder
var loot_holder
var loot_holder2
var loot_holder3
var loot_holder4
var loot_holder5
var loot_holder6
var loot_holder7
var loot_holder8

func get_drop_ffm2():
	dropvar = randi()%6
	if dropvar == 0:
		loot_holder.add_child(ammo1drop_instance)

#	dropvar = randi()%4
#	if dropvar == 0:
#		loot_holder2.add_child(hitemgreendrop_instance)

	dropvar = randi()%10
	if dropvar == 0:
		loot_holder3.add_child(aitemgreendrop_instance)

#	dropvar = randi()%4
#	if dropvar == 0:
#		loot_holder4.add_child(hitembluedrop_instance)

	dropvar = randi()%20
	if dropvar == 0:
		loot_holder5.add_child(aitembluedrop_instance)

#	dropvar = randi()%4
#	if dropvar == 0:
#		loot_holder6.add_child(hpdrop_instance)

	dropvar = randi()%4
	if dropvar == 0:
		loot_holder7.add_child(apdrop_instance)
#
	dropvar = randi()%4
	if dropvar == 0:
		loot_holder8.add_child(golddrop_instance)
		
func get_drop_spider():
	dropvar = randi()%6
	if dropvar == 0:
		loot_holder.add_child(ammo1drop_instance)

#	dropvar = randi()%4
#	if dropvar == 0:
#		loot_holder2.add_child(hitemgreendrop_instance)

	dropvar = randi()%10
	if dropvar == 0:
		loot_holder3.add_child(aitemgreendrop_instance)

#	dropvar = randi()%4
#	if dropvar == 0:
#		loot_holder4.add_child(hitembluedrop_instance)

	dropvar = randi()%20
	if dropvar == 0:
		loot_holder5.add_child(aitembluedrop_instance)

#	dropvar = randi()%4
#	if dropvar == 0:
#		loot_holder6.add_child(hpdrop_instance)

	dropvar = randi()%4
	if dropvar == 0:
		loot_holder7.add_child(apdrop_instance)
#
	dropvar = randi()%4
	if dropvar == 0:
		loot_holder8.add_child(golddrop_instance)
		
func get_drop_mosquito():
	dropvar = randi()%6
	if dropvar == 0:
		loot_holder.add_child(ammo1drop_instance)

#	dropvar = randi()%4
#	if dropvar == 0:
#		loot_holder2.add_child(hitemgreendrop_instance)

	dropvar = randi()%10
	if dropvar == 0:
		loot_holder3.add_child(aitemgreendrop_instance)

#	dropvar = randi()%4
#	if dropvar == 0:
#		loot_holder4.add_child(hitembluedrop_instance)

	dropvar = randi()%20
	if dropvar == 0:
		loot_holder5.add_child(aitembluedrop_instance)

#	dropvar = randi()%4
#	if dropvar == 0:
#		loot_holder6.add_child(hpdrop_instance)

	dropvar = randi()%4
	if dropvar == 0:
		loot_holder7.add_child(apdrop_instance)
#
	dropvar = randi()%4
	if dropvar == 0:
		loot_holder8.add_child(golddrop_instance)
		
func get_drop_balrog():
	dropvar = randi()%6
	if dropvar == 0:
		loot_holder.add_child(ammo1drop_instance)

#	dropvar = randi()%4
#	if dropvar == 0:
#		loot_holder2.add_child(hitemgreendrop_instance)

	dropvar = randi()%10
	if dropvar == 0:
		loot_holder3.add_child(aitemgreendrop_instance)

#	dropvar = randi()%4
#	if dropvar == 0:
#		loot_holder4.add_child(hitembluedrop_instance)

	dropvar = randi()%20
	if dropvar == 0:
		loot_holder5.add_child(aitembluedrop_instance)

#	dropvar = randi()%4
#	if dropvar == 0:
#		loot_holder6.add_child(hpdrop_instance)

	dropvar = randi()%4
	if dropvar == 0:
		loot_holder7.add_child(apdrop_instance)
#
	dropvar = randi()%4
	if dropvar == 0:
		loot_holder8.add_child(golddrop_instance)
		
func get_drop_bloodlord():
	dropvar = randi()%6
	if dropvar == 0:
		loot_holder.add_child(ammo1drop_instance)

#	dropvar = randi()%4
#	if dropvar == 0:
#		loot_holder2.add_child(hitemgreendrop_instance)

	dropvar = randi()%10
	if dropvar == 0:
		loot_holder3.add_child(aitemgreendrop_instance)

#	dropvar = randi()%4
#	if dropvar == 0:
#		loot_holder4.add_child(hitembluedrop_instance)

	dropvar = randi()%20
	if dropvar == 0:
		loot_holder5.add_child(aitembluedrop_instance)

#	dropvar = randi()%4
#	if dropvar == 0:
#		loot_holder6.add_child(hpdrop_instance)

	dropvar = randi()%4
	if dropvar == 0:
		loot_holder7.add_child(apdrop_instance)
#
	dropvar = randi()%4
	if dropvar == 0:
		loot_holder8.add_child(golddrop_instance)
		
func get_drop_charrurus():
	dropvar = randi()%6
	if dropvar == 0:
		loot_holder.add_child(ammo1drop_instance)

#	dropvar = randi()%4
#	if dropvar == 0:
#		loot_holder2.add_child(hitemgreendrop_instance)

	dropvar = randi()%10
	if dropvar == 0:
		loot_holder3.add_child(aitemgreendrop_instance)

#	dropvar = randi()%4
#	if dropvar == 0:
#		loot_holder4.add_child(hitembluedrop_instance)

	dropvar = randi()%20
	if dropvar == 0:
		loot_holder5.add_child(aitembluedrop_instance)

#	dropvar = randi()%4
#	if dropvar == 0:
#		loot_holder6.add_child(hpdrop_instance)

	dropvar = randi()%4
	if dropvar == 0:
		loot_holder7.add_child(apdrop_instance)
#
	dropvar = randi()%4
	if dropvar == 0:
		loot_holder8.add_child(golddrop_instance)
		
func get_drop_rahorde():
	dropvar = randi()%6
	if dropvar == 0:
		loot_holder.add_child(ammo1drop_instance)

#	dropvar = randi()%4
#	if dropvar == 0:
#		loot_holder2.add_child(hitemgreendrop_instance)

	dropvar = randi()%10
	if dropvar == 0:
		loot_holder3.add_child(aitemgreendrop_instance)

#	dropvar = randi()%4
#	if dropvar == 0:
#		loot_holder4.add_child(hitembluedrop_instance)

	dropvar = randi()%20
	if dropvar == 0:
		loot_holder5.add_child(aitembluedrop_instance)

#	dropvar = randi()%4
#	if dropvar == 0:
#		loot_holder6.add_child(hpdrop_instance)

	dropvar = randi()%4
	if dropvar == 0:
		loot_holder7.add_child(apdrop_instance)
#
	dropvar = randi()%4
	if dropvar == 0:
		loot_holder8.add_child(golddrop_instance)
		
func get_drop_scarab():
	dropvar = randi()%6
	if dropvar == 0:
		loot_holder.add_child(ammo1drop_instance)

#	dropvar = randi()%4
#	if dropvar == 0:
#		loot_holder2.add_child(hitemgreendrop_instance)

	dropvar = randi()%10
	if dropvar == 0:
		loot_holder3.add_child(aitemgreendrop_instance)

#	dropvar = randi()%4
#	if dropvar == 0:
#		loot_holder4.add_child(hitembluedrop_instance)

	dropvar = randi()%20
	if dropvar == 0:
		loot_holder5.add_child(aitembluedrop_instance)

#	dropvar = randi()%4
#	if dropvar == 0:
#		loot_holder6.add_child(hpdrop_instance)

	dropvar = randi()%4
	if dropvar == 0:
		loot_holder7.add_child(apdrop_instance)
#
	dropvar = randi()%4
	if dropvar == 0:
		loot_holder8.add_child(golddrop_instance)
		
func get_drop_spikefiend():
	dropvar = randi()%6
	if dropvar == 0:
		loot_holder.add_child(ammo1drop_instance)

#	dropvar = randi()%4
#	if dropvar == 0:
#		loot_holder2.add_child(hitemgreendrop_instance)

	dropvar = randi()%10
	if dropvar == 0:
		loot_holder3.add_child(aitemgreendrop_instance)

#	dropvar = randi()%4
#	if dropvar == 0:
#		loot_holder4.add_child(hitembluedrop_instance)

	dropvar = randi()%20
	if dropvar == 0:
		loot_holder5.add_child(aitembluedrop_instance)

#	dropvar = randi()%4
#	if dropvar == 0:
#		loot_holder6.add_child(hpdrop_instance)

	dropvar = randi()%4
	if dropvar == 0:
		loot_holder7.add_child(apdrop_instance)
#
	dropvar = randi()%4
	if dropvar == 0:
		loot_holder8.add_child(golddrop_instance)
		
func get_drop_thulk():
	dropvar = randi()%6
	if dropvar == 0:
		loot_holder.add_child(ammo1drop_instance)

#	dropvar = randi()%4
#	if dropvar == 0:
#		loot_holder2.add_child(hitemgreendrop_instance)

	dropvar = randi()%10
	if dropvar == 0:
		loot_holder3.add_child(aitemgreendrop_instance)

#	dropvar = randi()%4
#	if dropvar == 0:
#		loot_holder4.add_child(hitembluedrop_instance)

	dropvar = randi()%20
	if dropvar == 0:
		loot_holder5.add_child(aitembluedrop_instance)

#	dropvar = randi()%4
#	if dropvar == 0:
#		loot_holder6.add_child(hpdrop_instance)

	dropvar = randi()%4
	if dropvar == 0:
		loot_holder7.add_child(apdrop_instance)
#
	dropvar = randi()%4
	if dropvar == 0:
		loot_holder8.add_child(golddrop_instance)
		
