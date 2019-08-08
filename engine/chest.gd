extends StaticBody

## The amount of damage needed to break a target
const TARGET_HEALTH = 0
## The amount of health the target currently has
var current_health = 0

var is_active

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
var nadea1drop = load("res://Scenes/loot/Loot_Upgrade_Yellow.tscn")
var stickya1drop = load("res://Scenes/loot/Loot_Upgrade_Red.tscn")

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
var nadea1drop_instance = nadea1drop.instance()
var stickya1drop_instance = stickya1drop.instance()

var dropvar

## A node for holding the broken target scene.
## We use this to easily add/remove the broken target scene
onready var broken_breakable_holder = get_node("Broken_Breakable_Holder")
onready var loot_holder = get_node("Loot_Holder")
onready var loot_holder2 = get_node("Loot_Holder2")
onready var loot_holder3 = get_node("Loot_Holder3")
onready var loot_holder4 = get_node("Loot_Holder4")
onready var loot_holder5 = get_node("Loot_Holder5")
onready var loot_holder6 = get_node("Loot_Holder6")
onready var loot_holder7 = get_node("Loot_Holder7")
onready var loot_holder8 = get_node("Loot_Holder8")
## The collision shape for the breakable.
## NOTE: this is for the whole breakable, not the pieces of the breakable
var breakable_collision_shape

## The amount of time (in seconds) it takes for a breakable to respawn
const BREAKABLE_RESPAWN_TIME = 14
## A variable for tracking how long a breakable has been broken
var breakable_respawn_timer = 0
var c
var not_looted = true
## The destroyed breakable scene. We use 'export' so we can assign it from
## the editor
export (PackedScene) var destroyed_breakable

func _ready():

	breakable_collision_shape = $Collision_Shape
	c = $ChestCartoon


func _on_Area_body_entered(body):
	if body.has_method("process_input"):
		is_active = true


##Base chest type, contains no weapon upgrades
func drop_loot():
	dropvar = randi()%11
	if dropvar == 0:
		loot_holder.add_child(hp1pdrop_instance)
	if dropvar == 1:
		loot_holder.add_child(hp10pdrop_instance)
	if dropvar == 2:
		loot_holder.add_child(ap1pdrop_instance)
	if dropvar == 3:
		loot_holder.add_child(ap10pdrop_instance)
	if dropvar == 4:
		loot_holder.add_child(speeddrop_instance)
	if dropvar == 5:
		loot_holder.add_child(jumpdrop_instance)
	if dropvar == 6:
		loot_holder.add_child(phyattack1drop_instance)
	if dropvar == 7:
		loot_holder.add_child(phyattack3drop_instance)
	if dropvar == 8:
		loot_holder.add_child(expattack1drop_instance)
	if dropvar == 9:
		loot_holder.add_child(expattack3drop_instance)
	if dropvar == 10:
		loot_holder.add_child(nadea1drop_instance)
	if dropvar == 11:
		loot_holder.add_child(stickya1drop_instance)



## Pistol Chest type, can drop pistol upgrades
func drop_loot_p():
	dropvar = randi()%50
	if dropvar == 0:
		loot_holder.add_child(pistola15drop_instance)
	if dropvar == 1:
		loot_holder.add_child(pistolcs5drop_instance)

	dropvar = randi()%5
	if dropvar == 0:
		loot_holder2.add_child(pistolcs2drop_instance)
	if dropvar == 1:
		loot_holder2.add_child(pistola5drop_instance)
	if dropvar == 2:
		loot_holder.add_child(nadea1drop_instance)
	if dropvar == 3:
		loot_holder.add_child(stickya1drop_instance)
	if dropvar == 4:
		loot_holder.add_child(expattack1drop_instance)
	if dropvar == 5:
		loot_holder.add_child(speeddrop_instance)


## Rifle Chest type, can drop rifle upgrades
func drop_loot_r():
	dropvar = randi()%50
	if dropvar == 0:
		loot_holder.add_child(riflea50drop_instance)
	if dropvar == 1:
		loot_holder.add_child(riflecs20drop_instance)

	dropvar = randi()%5
	if dropvar == 0:
		loot_holder2.add_child(riflecs10drop_instance)
	if dropvar == 1:
		loot_holder2.add_child(riflea50drop_instance)
	if dropvar == 2:
		loot_holder.add_child(nadea1drop_instance)
	if dropvar == 3:
		loot_holder.add_child(stickya1drop_instance)
	if dropvar == 4:
		loot_holder.add_child(expattack1drop_instance)
	if dropvar == 5:
		loot_holder.add_child(speeddrop_instance)


## Shotgun Chest type, can drop shotgun upgrades
func drop_loot_s():
	dropvar = randi()%50
	if dropvar == 0:
		loot_holder.add_child(shotguna10drop_instance)
	if dropvar == 1:
		loot_holder.add_child(shotguncs3drop_instance)

	dropvar = randi()%5
	if dropvar == 0:
		loot_holder2.add_child(shotguncs1drop_instance)
	if dropvar == 1:
		loot_holder2.add_child(shotguna4drop_instance)
	if dropvar == 2:
		loot_holder.add_child(nadea1drop_instance)
	if dropvar == 3:
		loot_holder.add_child(stickya1drop_instance)
	if dropvar == 4:
		loot_holder.add_child(expattack1drop_instance)
	if dropvar == 5:
		loot_holder.add_child(speeddrop_instance)


## Chaingun Chest type, can drop chaingun upgrades
func drop_loot_c():
	dropvar = randi()%50
	if dropvar == 0:
		loot_holder.add_child(chainguncs50drop_instance)
	if dropvar == 1:
		loot_holder.add_child(chainguna150drop_instance)

	dropvar = randi()%5
	if dropvar == 0:
		loot_holder2.add_child(chainguna50drop_instance)
	if dropvar == 1:
		loot_holder2.add_child(chainguncs20drop_instance)
	if dropvar == 2:
		loot_holder.add_child(nadea1drop_instance)
	if dropvar == 3:
		loot_holder.add_child(stickya1drop_instance)
	if dropvar == 4:
		loot_holder.add_child(expattack1drop_instance)
	if dropvar == 5:
		loot_holder.add_child(speeddrop_instance)


## All Chest type, can drop upgrades for all weapons
func drop_loot_all():
	dropvar = randi()%50
	if dropvar == 0:
		loot_holder.add_child(chainguncs50drop_instance)
	if dropvar == 1:
		loot_holder.add_child(chainguna150drop_instance)
	if dropvar == 2:
		loot_holder.add_child(shotguna10drop_instance)
	if dropvar == 3:
		loot_holder.add_child(shotguncs3drop_instance)
	if dropvar == 4:
		loot_holder.add_child(riflea50drop_instance)
	if dropvar == 5:
		loot_holder.add_child(riflecs20drop_instance)
	if dropvar == 6:
		loot_holder.add_child(pistola15drop_instance)
	if dropvar == 7:
		loot_holder.add_child(pistolcs5drop_instance)
		
	dropvar = randi()%23
	if dropvar == 0:
		loot_holder2.add_child(chainguna50drop_instance)
	if dropvar == 1:
		loot_holder2.add_child(chainguncs20drop_instance)
	if dropvar == 2:
		loot_holder.add_child(nadea1drop_instance)
	if dropvar == 3:
		loot_holder.add_child(stickya1drop_instance)
	if dropvar == 4:
		loot_holder.add_child(expattack1drop_instance)
	if dropvar == 5:
		loot_holder.add_child(speeddrop_instance)
	if dropvar == 6:
		loot_holder2.add_child(shotguncs1drop_instance)
	if dropvar == 7:
		loot_holder2.add_child(shotguna4drop_instance)
	if dropvar == 8:
		loot_holder.add_child(nadea1drop_instance)
	if dropvar == 9:
		loot_holder.add_child(stickya1drop_instance)
	if dropvar == 10:
		loot_holder.add_child(expattack1drop_instance)
	if dropvar == 11:
		loot_holder.add_child(speeddrop_instance)
	if dropvar == 12:
		loot_holder2.add_child(riflecs10drop_instance)
	if dropvar == 13:
		loot_holder2.add_child(riflea50drop_instance)
	if dropvar == 14:
		loot_holder.add_child(nadea1drop_instance)
	if dropvar == 15:
		loot_holder.add_child(stickya1drop_instance)
	if dropvar == 16:
		loot_holder.add_child(expattack1drop_instance)
	if dropvar == 17:
		loot_holder.add_child(speeddrop_instance)
	if dropvar == 18:
		loot_holder2.add_child(pistolcs2drop_instance)
	if dropvar == 19:
		loot_holder2.add_child(pistola5drop_instance)
	if dropvar == 20:
		loot_holder.add_child(nadea1drop_instance)
	if dropvar == 21:
		loot_holder.add_child(stickya1drop_instance)
	if dropvar == 22:
		loot_holder.add_child(expattack1drop_instance)
	if dropvar == 23:
		loot_holder.add_child(speeddrop_instance)