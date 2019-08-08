extends WindowDialog

var active_item_price

var gamesaver

var activeItemSlot:int = -1
var dropItemSlot:int = -1
var itemeffect:int =-1

var playerPosition = Vector3()
var dropPosition = Vector3()

var loot_holder
var bought_item
var sold_item
var price

onready var isDraggingItem:bool = false
onready var mouseButtonReleased:bool = true
var draggedItemSlot:int = -1
onready var initial_mousePos:Vector2 = Vector2()
onready var cursor_insideItemList:bool = false

var isAwaitingSplit:bool = false
var splitItemSlot:int = -1


var levelg
var player
var level
var testingarea
var drop
var pistol
var nades
var rifle
var shotgun
var chaingun

var gold1drop = load("res://Scenes/loot/Gold1.tscn")
var gold5drop = load("res://Scenes/loot/Gold5.tscn")
var health1drop = load("res://Scenes/loot/Health_Pickup.tscn")
var ammo1drop = load("res://Scenes/loot/Ammo_Pickup.tscn")
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
var nadea1drop = load("res://Scenes/loot/Loot_Upgrade_Yellow.tscn")
var stickya1drop = load("res://Scenes/loot/Loot_Upgrade_Red.tscn")
var nademaxdrop = load("res://Scenes/loot/Loot_GItem_Green.tscn")
var stickymaxdrop = load("res://Scenes/loot/Loot_GItem_Blue.tscn")


var clawdrop = load("res://Scenes/loot/Loot_Mpart_Yellow.tscn")
var toothdrop = load("res://Scenes/loot/Loot_Mpart_Green.tscn")
var talondrop = load("res://Scenes/loot/Loot_Mpart_Red.tscn")
var bonedrop = load("res://Scenes/loot/Loot_Mpart_Blue.tscn")

var key1drop = load("res://Scenes/loot/Loot_Key_Green.tscn")
var key2drop = load("res://Scenes/loot/Loot_Key_Yellow.tscn")
var key3drop = load("res://Scenes/loot/Loot_Key_Red.tscn")


var ammo1drop_instance = ammo1drop.instance()
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
var key1drop_instance = key1drop.instance()
var key2drop_instance = key2drop.instance()
var key3drop_instance = key3drop.instance()
var clawdrop_instance = clawdrop.instance()
var toothdrop_instance = toothdrop.instance()
var talondrop_instance = talondrop.instance()
var bonedrop_instance = bonedrop.instance()


func _ready() -> void:

	
	## Initialize Item List
	$Panel/ItemList.set_max_columns(10)
	$Panel/ItemList.set_fixed_icon_size(Vector2(48,48))
	$Panel/ItemList.set_icon_mode($Panel/ItemList.ICON_MODE_TOP)
	$Panel/ItemList.set_select_mode($Panel/ItemList.SELECT_SINGLE)
	$Panel/ItemList.set_same_column_width(true)
	$Panel/ItemList.set_allow_rmb_select(true)
	

	level = Globals.levelv
	player = get_tree().get_root().get_node(level).find_node("Player")
	levelg = get_tree().get_root().get_node(level)
	testingarea = get_tree().get_root().get_node("Testing_Area")
	pistol = get_node("/root/Weapon_Pistol")
	gamesaver = .get_node("/root/GameSaver")
	
	
	$Health_Label.text = str(player.health)
	$Max_Health_Label.text = str(player.MAX_HEALTH)
	$Armor_Label.text = str(player.armor)
	$Max_Armor_Label.text = str(player.MAX_ARMOR)
	$Phy_Damage_Label.text = str(player.health)
	$Exp_Damage_Label.text = str(player.damage)
	$Speed_Label.text = str(player.MOVE_SPEED)
	$Jumpspeed_Label.text = str(player.JUMP_SPEED)
	$Gold_Label.text = str(player.playergold)
	$Max_Gold_Label.text = str(player.MAX_GOLD)
	$Big_Bone_Label.text = str(player.big_bone_amount)
	$Big_Talon_Label.text = str(player.big_talon_amount)
	$Big_Tooth_Label.text = str(player.big_tooth_amount)
	$Big_Claw_Label.text = str(player.big_claw_amount)
	#loot_holder = testingarea.get_node("Loot_Holder")
	
	Global_Player.load_state()
	load_items()
	
	set_process(false)
	set_process_input(true)
	
#warning-ignore:unused_argument
func _process(delta) -> void:
	$Health_Label.text = str(player.health)
	$Max_Health_Label.text = str(player.MAX_HEALTH)
	$Armor_Label.text = str(player.armor)
	$Max_Armor_Label.text = str(player.MAX_ARMOR)
	$Phy_Damage_Label.text = str(player.health)
	$Exp_Damage_Label.text = str(player.damage)
	$Speed_Label.text = str(player.MOVE_SPEED)
	$Jumpspeed_Label.text = str(player.JUMP_SPEED)
	$Gold_Label.text = str(player.playergold)
	$Max_Gold_Label.text = str(player.MAX_GOLD)
	$Big_Bone_Label.text = str(player.big_bone_amount)
	$Big_Talon_Label.text = str(player.big_talon_amount)
	$Big_Tooth_Label.text = str(player.big_tooth_amount)
	$Big_Claw_Label.text = str(player.big_claw_amount)
	load_items()
	
	
	if (isDraggingItem):
		$Panel/Sprite_DraggedItem.global_position = get_viewport().get_mouse_position()


func _input(event) -> void:
	if (!isDraggingItem):
		if event.is_action_pressed("key_shift"):
			isAwaitingSplit = true
		if event.is_action_released("key_shift"):
			isAwaitingSplit = false
	
	if (event is InputEventMouseButton):
		if (!isAwaitingSplit):
			if (event.is_action_pressed("mouse_leftbtn")):
				mouseButtonReleased = false
				initial_mousePos = get_viewport().get_mouse_position()
			if (event.is_action_released("mouse_leftbtn")):
				move_merge_item()
				end_drag_item()
		else:
			if (event.is_action_pressed("mouse_rightbtn")):
				if (activeItemSlot >= 0):
					begin_split_item()
	if (event is InputEventMouseMotion):
		if (cursor_insideItemList):
			activeItemSlot = $Panel/ItemList.get_item_at_position($Panel/ItemList.get_local_mouse_position(),true)
			if (activeItemSlot >= 0):
				$Panel/ItemList.select(activeItemSlot, true)
				if (isDraggingItem or mouseButtonReleased):
					return
				if (!$Panel/ItemList.is_item_selectable(activeItemSlot)): 
					end_drag_item()
				if (initial_mousePos.distance_to(get_viewport().get_mouse_position()) > 0.0): 
					begin_drag_item(activeItemSlot)
		else:
			activeItemSlot = -1


func load_items() -> void:
	$Panel/ItemList.clear()
	for slot in range(0, Global_Player.inventory_maxSlots):
		$Panel/ItemList.add_item("", null, false)
		update_slot(slot)


func clear_items() -> void:
	$Panel/ItemList.clear()


func update_slot(slot:int) -> void:
	if (slot < 0): 
		return
	var inventoryItem:Dictionary = Global_Player.inventory[str(slot)]
	var itemMetaData = Global_ItemDatabase.get_item(str(inventoryItem["id"]))
	var icon = ResourceLoader.load(itemMetaData["icon"])
	var amount = int(inventoryItem["amount"])
	
	itemMetaData["amount"] = amount
	if (!itemMetaData["stackable"]): 
		amount = " "
	$Panel/ItemList.set_item_text(slot, String(amount))
	$Panel/ItemList.set_item_icon(slot, icon)
	$Panel/ItemList.set_item_selectable(slot, int(inventoryItem["id"]) > 0)
	$Panel/ItemList.set_item_metadata(slot, itemMetaData)
	$Panel/ItemList.set_item_tooltip(slot, itemMetaData["name"])
	$Panel/ItemList.set_item_tooltip_enabled(slot, int(inventoryItem["id"]) > 0)


func _on_ItemList_item_rmb_selected(index:int, atpos:Vector2) -> void:
	if (isDraggingItem):
		return
	if (isAwaitingSplit):
		return
	
	dropItemSlot = index
	var itemData:Dictionary = $Panel/ItemList.get_item_metadata(index)
	if (int(itemData["id"])) < 1: return
	var strItemInfo:String = ""
	
	$Panel/WindowDialog_ItemMenu.set_position(get_viewport().get_mouse_position())
	$Panel/WindowDialog_ItemMenu.set_title(itemData["name"])
	$Panel/WindowDialog_ItemMenu/ItemMenu_TextureFrame_Icon.set_texture($Panel/ItemList.get_item_icon(index))
	
	strItemInfo = "Name: [color=#00aedb] " + itemData["name"] + "[/color]\n"
	strItemInfo = strItemInfo + "Type: [color=#f37735] " + itemData["type"] + "[/color]\n"
	strItemInfo = strItemInfo + "Weight: [color=#00b159] " + String(itemData["weight"]) + "[/color]\n"
	strItemInfo = strItemInfo + "Sell Price: [color=#ffc425] " + String(itemData["sell_price"]) + "[/color] gold\n"
	strItemInfo = strItemInfo + "\n[color=#b3cde0]" + itemData["description"] + "[/color]"
	
	$Panel/WindowDialog_ItemMenu/ItemMenu_RichTextLabel_ItemInfo.set_bbcode(strItemInfo)
	activeItemSlot = index
	itemeffect = (itemData["effect"])
	$Panel/WindowDialog_ItemMenu.popup()
	
	active_item_price = (int(itemData["sell_price"]))


func _on_ItemMenu_Button_DropItem_pressed() -> void:
	var newAmount = Global_Player.inventory_removeItem(dropItemSlot)
	if (newAmount < 1):
		$Panel/WindowDialog_ItemMenu.hide()
	update_slot(dropItemSlot)
	_item_drop()


func begin_split_item() -> void:
	if activeItemSlot < 0:
		return
	splitItemSlot = activeItemSlot
	var itemMetaData = $Panel/ItemList.get_item_metadata(splitItemSlot)
	var availableAmount = int(itemMetaData["amount"])
	if (availableAmount > 1):
		$Panel/WindowDialog_SplitItemWindow/SplitItemWindow_HSlider_Amount.min_value = 1
		$Panel/WindowDialog_SplitItemWindow/SplitItemWindow_HSlider_Amount.max_value = availableAmount -1
		$Panel/WindowDialog_SplitItemWindow/SplitItemWindow_HSlider_Amount.value = 1
		$Panel/WindowDialog_SplitItemWindow.popup()


func _on_SplitItemWindow_Button_Split_pressed() -> void:
	update_slot(Global_Player.inventory_splitItem(splitItemSlot, int($Panel/WindowDialog_SplitItemWindow/SplitItemWindow_HSlider_Amount.value)))
	update_slot(splitItemSlot)
	splitItemSlot = -1
	$Panel/WindowDialog_SplitItemWindow.hide()
	

func begin_drag_item(index:int) -> void:
	if (isDraggingItem): 
		return
	if (index < 0): 
		return
	
	set_process(true)
	$Panel/Sprite_DraggedItem.texture = $Panel/ItemList.get_item_icon(index)
	$Panel/Sprite_DraggedItem.show()
	
	
	$Panel/ItemList.set_item_text(index, " ")
	$Panel/ItemList.set_item_icon(index, ResourceLoader.load(Global_ItemDatabase.get_item("0")["icon"]))
	
	draggedItemSlot = index
	isDraggingItem = true
	mouseButtonReleased = false
	$Panel/Sprite_DraggedItem.global_translate(get_viewport().get_mouse_position())


func end_drag_item() -> void:
	set_process(false)
	draggedItemSlot = -1
	$Panel/Sprite_DraggedItem.hide()
	mouseButtonReleased = true
	isDraggingItem = false
	activeItemSlot = -1


func move_merge_item() -> void:
	if (draggedItemSlot < 0): 
		return
	if (activeItemSlot < 0):
		update_slot(draggedItemSlot)
		return
		
	if (activeItemSlot == draggedItemSlot):
		update_slot(draggedItemSlot)
	else:
		if ($Panel/ItemList.get_item_metadata(activeItemSlot)["id"] == $Panel/ItemList.get_item_metadata(draggedItemSlot)["id"]):
			var itemData = $Panel/ItemList.get_item_metadata(activeItemSlot)
			if (int(itemData["stack_limit"]) >= 2):
				Global_Player.inventory_mergeItem(draggedItemSlot, activeItemSlot)
				update_slot(draggedItemSlot)
				update_slot(activeItemSlot)
				return
			else:
				update_slot(draggedItemSlot)
				return
		else:
			Global_Player.inventory_moveItem(draggedItemSlot, activeItemSlot)
			update_slot(draggedItemSlot)
			update_slot(activeItemSlot)


func _on_ItemList_mouse_entered() -> void:
	cursor_insideItemList = true;


func _on_ItemList_mouse_exited() -> void:
	cursor_insideItemList = false;


func _on_SplitItemWindow_Button_Cancel_pressed() -> void:
	$Panel/WindowDialog_SplitItemWindow.hide()


func _on_SplitItemWindow_HSlider_Amount_value_changed(value:int) -> void:
	$Panel/WindowDialog_SplitItemWindow/SplitItemWindow_Label_Amount.text = String(value)


func _on_ItemMenu_Button_UseItem_pressed():
	var itemMetaData = $Panel/ItemList.get_item_metadata(dropItemSlot)
	set_process(true)
	if (itemMetaData["type"]) != "mpart":
		var newAmount = Global_Player.inventory_removeItem(dropItemSlot)
		if (newAmount < 1):
			$Panel/WindowDialog_ItemMenu.hide()
		update_slot(dropItemSlot)
		_item_effect()
		get_tree().paused = true
	if (itemMetaData["type"]) == "mpart":
		var a = (itemMetaData["amount"])
		if a < 10:
			$Panel/WindowDialog_notenough.popup()
		elif a >= 10:
			var newAmount = Global_Player.inventory_combineItem(dropItemSlot)
			if (newAmount < 1):
				$Panel/WindowDialog_ItemMenu.hide()
			combine()
			update_slot(dropItemSlot)
			load_items()
			set_process(true)


func _item_effect():
	if itemeffect == 1:
		player.add_max_health(1)
	if itemeffect == 2:
		player.add_max_health(10)
	if itemeffect == 3:
		player.add_max_armor(1)
	if itemeffect == 4:
		player.add_max_armor(10)
	if itemeffect == 5:
		player.add_clip_size_pistol(2)
	if itemeffect == 6:
		player.add_clip_size_pistol(5)
	if itemeffect == 7:
		player.add_clip_size_rifle(10)
	if itemeffect == 8:
		player.add_clip_size_rifle(20)
	if itemeffect == 9:
		player.add_clip_size_shotgun(1)
	if itemeffect == 10:
		player.add_clip_size_shotgun(3)
	if itemeffect == 11:
		player.add_clip_size_chaingun(20)
	if itemeffect == 12:
		player.add_clip_size_chaingun(50)
	if itemeffect == 13:
		player.add_max_pistol_ammo(5)
	if itemeffect == 14:
		player.add_max_pistol_ammo(15)
	if itemeffect == 15:
		player.add_max_rifle_ammo(20)
	if itemeffect == 16:
		player.add_max_rifle_ammo(50)
	if itemeffect == 17:
		player.add_max_shotgun_ammo(4)
	if itemeffect == 18:
		player.add_max_shotgun_ammo(8)
	if itemeffect == 19:
		player.add_max_chaingun_ammo(50)
	if itemeffect == 20:
		player.add_max_chaingun_ammo(150)
	if itemeffect == 21:
		player.add_max_nade(1)
	if itemeffect == 22:
		player.add_max_sticky(1)
	if itemeffect == 23:
		player.add_phy_damage(1)
	if itemeffect == 24:
		player.add_phy_damage(3)
	if itemeffect == 25:
		player.add_exp_damage(1)
	if itemeffect == 26:
		player.add_exp_damage(3)
	if itemeffect == 27:
		player.add_max_groundspeed(1)
	if itemeffect == 28:
		player.add_max_jump(1)
	if itemeffect == 29:
		player.add_health(5)
	if itemeffect == 30:
		player.add_health(50)
	if itemeffect == 31:
		player.add_health(100)
	if itemeffect == 32:
		player.add_health(200)
	if itemeffect == 33:
		player.add_armor(5)
	if itemeffect == 34:
		player.add_armor(50)
	if itemeffect == 35:
		player.add_armor(100)
	if itemeffect == 36:
		player.add_armor(200)
	if itemeffect == 37:
		player.add_grenade(4)
	if itemeffect == 38:
		player.add_sticky(4)
	if itemeffect == 39:
		player.use_portal(50)
	if itemeffect == 40:
		use_key1()
	if itemeffect == 41:
		use_key1()
	if itemeffect == 42:
		use_key2()
	if itemeffect == 43:
		use_key3()
	if itemeffect == 44:
		combine()
	if itemeffect == 45:
		combine()
	if itemeffect == 46:
		combine()
	if itemeffect == 47:
		combine()
	if itemeffect == 48:
		player.add_grenade(10)
	if itemeffect == 49:
		player.add_sticky(10)

	####itemeffect int values
	###0 - null
	###1 - Max HP +1
	###2 - Max HP +10
	###3 - Max ARMOR +1
	###4 - Max ARMOR +10
	###5 - Pistol CLIP SIZE + 2 
	###6 - Pistol CLIP SIZE + 4 
	###7 - Rifle CLIP SIZE + 10 
	###8 - Rifle CLIP SIZE + 20 
	###9 - shotgun CLIP SIZE + 1 
	###10 - shotgun CLIP SIZE + 3 
	###11 -  chaingun CLIP SIZE + 20 
	###12 - chaingun CLIP SIZE + 50 
	###13 - Pistol Max Ammo + 5 
	###14 - Pistol Max Ammo + 15 
	###15 - Rifle Max Ammo + 20 
	###16 - Rifle Max Ammo + 50 
	###17 - shotgun Max Ammo + 4 
	###18 - shotgun Max Ammo + 10
	###19 - chaingun Max Ammo + 50 
	###20 - chaingun Max Ammo + 150
	###21 - Max Grenades +1 
	###22 - Max Sticky Grenades +1 
	###23 - Phsyical Damage + 1
	###24 - Physical Damage + 3
	###25 - Explosive Damage + 1
	###26 - Explosive Damage + 3
	###27 - movement Speed + 
	###28 - jump increase !!
	###29 - Health + 5
	###30 - Health + 50
	###31 - Health + 100
	###32 - Health + 200 
	###33 - Armor + 5
	###34 - Armor + 50
	###35 - Armor + 100
	###36 - Armor + 200
	###37 - Town Portal !! 
	###38 - combine 10 into 1 - monster parts
	###39 - take apart, 1 into 10 - monster parts

func _on_store_item1_pressed():
	bought_item = 1
	_buy_item()


func _on_store_item2_pressed():
	bought_item = 2
	_buy_item()


func _on_store_item3_pressed():
	bought_item = 3
	_buy_item()


func _on_store_item4_pressed():
	bought_item = 4
	_buy_item()


func _on_store_item5_pressed():
	bought_item = 5
	_buy_item()


func _on_store_item6_pressed():

	bought_item = 6
	if player.big_tooth_amount > 0:
		_buy_item()
		player.remove_big_tooth(1)
		set_process(true)


func _on_store_item7_pressed():
	bought_item = 7
	if player.big_talon_amount > 0 and player.big_tooth_amount > 0 and player.big_bone_amount > 0:
		_buy_item()
		player.remove_big_talon(1)
		player.remove_big_tooth(1)
		player.remove_big_tooth(1)
		set_process(true)


func _on_store_item8_pressed():
	bought_item = 8
	if player.big_talon_amount > 2 and player.big_tooth_amount > 0:
		_buy_item()
		player.remove_big_talon(3)
		player.remove_big_tooth(1)
		set_process(true)


func _on_store_item9_pressed():
	bought_item = 9
	if player.big_talon_amount > 0:
		_buy_item()
		player.remove_big_talon()
		set_process(true)


func _on_store_item10_pressed():
	bought_item = 10
	_buy_item()


func _on_store_item11_hp5_pressed():
	bought_item = 11
	_buy_item()


func _on_store_item12_pressed():
	bought_item = 12
	_buy_item()


func _on_store_item13_pressed():
	bought_item = 13
	_buy_item()


func _on_store_item14_pressed():
	bought_item = 14
	if player.big_talon_amount > 0:
		_buy_item()
		player.remove_big_claw(1)
		set_process(true)


func _on_store_item15_pressed():
	bought_item = 15
	if player.big_talon_amount > 2 and player.big_tooth_amount > 2 and player.big_claw_amount > 0:
		_buy_item()
		player.remove_big_talon(3)
		player.remove_big_tooth(3)
		player.remove_big_claw(1)
		set_process(true)


func _on_store_item16_pressed():
	bought_item = 16
	if player.big_talon_amount > 0 and player.big_tooth_amount > 0 and player.big_tooth_amount > 0 and player.big_claw_amount > 0:
		_buy_item()
		player.remove_big_talon(1)
		player.remove_big_tooth(1)
		player.remove_big_bone(1)
		player.remove_big_claw(1)
		set_process(true)


func _on_store_item17_pressed():
	bought_item = 17
	if player.big_talon_amount > 1 and player.big_tooth_amount > 1 and player.big_tooth_amount > 0 and player.big_claw_amount > 0:
		_buy_item()
		player.remove_big_talon(2)
		player.remove_big_tooth(2)
		player.remove_big_bone(1)
		player.remove_big_claw(1)
		set_process(true)


func _on_store_item18_pressed():
	bought_item = 18
	_buy_item()


func _on_store_item19_pressed():
	bought_item = 19
	_buy_item()


func _on_store_item20_pressed():
	bought_item = 20
	if player.big_talon_amount > 3 and player.big_tooth_amount > 3 and player.big_tooth_amount > 3 and player.big_claw_amount > 3:
		_buy_item()
		player.remove_big_talon(4)
		player.remove_big_tooth(4)
		player.remove_big_bone(4)
		player.remove_big_claw(4)
		set_process(true)


func _on_store_item21_pressed():
	bought_item = 21
	_buy_item()


func _on_store_item22_pressed():
	bought_item = 22
	if player.big_talon_amount > 9 and player.big_tooth_amount > 9 and player.big_tooth_amount > 9 and player.big_claw_amount > 9:
		_buy_item()
		player.remove_big_talon(10)
		player.remove_big_tooth(10)
		player.remove_big_bone(10)
		player.remove_big_claw(10)
		set_process(true)


func _on_store_item23_pressed():
	bought_item = 23
	_buy_item()


func _on_store_item24_pressed():
	bought_item = 24
	_buy_item()


func _on_store_item25_pressed():
	bought_item = 25
	if player.big_talon_amount > 0 and player.big_tooth_amount > 0 and player.big_tooth_amount > 2 and player.big_claw_amount > 1:
		_buy_item()
		player.remove_big_talon(1)
		player.remove_big_tooth(1)
		player.remove_big_bone(3)
		player.remove_big_claw(2)
		set_process(true)


func _on_store_item26_pressed():
	bought_item = 26
	_buy_item()


func _on_store_item27_pressed():
	bought_item = 27
	_buy_item()


func _on_store_item28_pressed():
	bought_item = 28
	_buy_item()


func _on_store_item29_pressed():
	bought_item = 29
	_buy_item()


func _on_store_item30_pressed():
	bought_item = 30
	if player.big_talon_amount > 3 and player.big_tooth_amount > 3 and player.big_tooth_amount > 3 and player.big_claw_amount > 3:
		_buy_item()
		player.remove_big_talon(4)
		player.remove_big_tooth(4)
		player.remove_big_bone(4)
		player.remove_big_claw(4)
		set_process(true)


func _on_store_item31_pressed():
	bought_item = 31
	if player.big_talon_amount > 3 and player.big_tooth_amount > 3 and player.big_tooth_amount > 3 and player.big_claw_amount > 3:
		_buy_item()
		player.remove_big_talon(4)
		player.remove_big_tooth(4)
		player.remove_big_bone(4)
		player.remove_big_claw(4)
		set_process(true)


func _on_store_item32_pressed():
	bought_item = 32
	_buy_item()


func _on_store_item33_pressed():
	bought_item = 33
	if player.big_talon_amount > 3 and player.big_tooth_amount > 3 and player.big_tooth_amount > 3 and player.big_claw_amount > 3:
		_buy_item()
		player.remove_big_talon(4)
		player.remove_big_tooth(4)
		player.remove_big_bone(4)
		player.remove_big_claw(4)
		set_process(true)


func _on_store_item34_pressed():
	bought_item = 34
	_buy_item()


func _on_store_item35_pressed():
	bought_item = 35
	if player.big_bone_amount > 0:
		_buy_item()
		player.remove_big_bone()
		set_process(true)


func _on_store_item36_pressed():
	bought_item = 36
	if player.big_bone_amount > 2 and player.big_tooth_amount > 0:
		_buy_item()
		player.remove_big_bone(3)
		player.remove_big_tooth(1)
		set_process(true)


func _on_store_item37_stickya1_pressed():
	bought_item = 37
	if player.big_talon_amount > 3 and player.big_tooth_amount > 3 and player.big_tooth_amount > 3 and player.big_claw_amount > 0:
		_buy_item()
		player.remove_big_talon(4)
		player.remove_big_tooth(4)
		player.remove_big_bone(4)
		player.remove_big_claw(1)


func _on_store_item38_nadea1_pressed():
	bought_item = 38
	if player.big_talon_amount > 3 and player.big_tooth_amount > 3 and player.big_tooth_amount > 3 and player.big_claw_amount > 0:
		_buy_item()
		player.remove_big_talon(4)
		player.remove_big_tooth(4)
		player.remove_big_bone(4)
		player.remove_big_claw(1)


func _on_store_item39_nadepack_pressed():
	bought_item = 39
	_buy_item()


func _on_store_item40_stickypack_pressed():
	bought_item = 40
	_buy_item()


func use_key1():
	$Panel/WindowDialog_nouse.popup()
	var affectedSlot = Global_Player.inventory_addItem(41)
	if (affectedSlot >= 0): 
		update_slot(affectedSlot)


func use_key2():
	$Panel/WindowDialog_nouse.popup()
	var affectedSlot = Global_Player.inventory_addItem(42)
	if (affectedSlot >= 0): 
		update_slot(affectedSlot)


func use_key3():
	$Panel/WindowDialog_nouse.popup()
	var affectedSlot = Global_Player.inventory_addItem(43)
	if (affectedSlot >= 0): 
		update_slot(affectedSlot)


func _buy_item():
	var itemData:Dictionary = Global_ItemDatabase.get_item(str(bought_item))
	price = int(itemData["sell_price"])
	if player.playergold >= price:
		player.playergold -= price
		var affectedSlot = Global_Player.inventory_addItem(bought_item)
		if (affectedSlot >= 0): 
			update_slot(affectedSlot)
	else:
		$Panel/WindowDialog_Cannotafford.popup()


func _on_Nouse_Button_Return_pressed():
	$Panel/WindowDialog_nouse.hide()


func _on_Cannotafford_Button_Return_pressed():
	$Panel/WindowDialog_Cannotafford.hide()


func _item_drop():
	playerPosition = player.get_translation()

	#if itemeffect == 0:
	if itemeffect == 1:
		hp1pdrop_instance.set_translation(playerPosition + Vector3(0,0,-8))
		levelg.add_child(hp1pdrop_instance)
	if itemeffect == 2:
		hp10pdrop_instance.set_translation(playerPosition + Vector3(0,0,-8))
		levelg.add_child(hp10pdrop_instance)
	if itemeffect == 3:
		ap1pdrop_instance.set_translation(playerPosition + Vector3(0,0,-8))
		levelg.add_child(ap1pdrop_instance)
	if itemeffect == 4:
		ap10pdrop_instance.set_translation(playerPosition + Vector3(0,0,-8))
		levelg.add_child(ap10pdrop_instance)
	if itemeffect == 5:
		pistolcs2drop_instance.set_translation(playerPosition + Vector3(0,0,-8))
		testingarea.add_child(pistolcs2drop_instance)
	if itemeffect == 6:
		pistolcs5drop_instance.set_translation(playerPosition + Vector3(0,0,-8))
		testingarea.add_child(pistolcs5drop_instance)
	if itemeffect == 7:
		riflecs10drop_instance.set_translation(playerPosition + Vector3(0,0,-8))
		testingarea.add_child(riflecs10drop_instance)
	if itemeffect == 8:
		riflecs20drop_instance.set_translation(playerPosition + Vector3(0,0,-8))
		testingarea.add_child(riflecs20drop_instance)
	if itemeffect == 9:
		shotguncs1drop_instance.set_translation(playerPosition + Vector3(0,0,-8))
		testingarea.add_child(shotguncs1drop_instance)
	if itemeffect == 10:
		shotguncs3drop_instance.set_translation(playerPosition + Vector3(0,0,-8))
		testingarea.add_child(shotguncs3drop_instance)
	if itemeffect == 11:
		chainguncs20drop_instance.set_translation(playerPosition + Vector3(0,0,-8))
		testingarea.add_child(chainguncs20drop_instance)
	if itemeffect == 12:
		chainguncs50drop_instance.set_translation(playerPosition + Vector3(0,0,-8))
		testingarea.add_child(chainguncs50drop_instance)
	if itemeffect == 13:
		pistola5drop_instance.set_translation(playerPosition + Vector3(0,0,-8))
		testingarea.add_child(pistola5drop_instance)
	if itemeffect == 14:
		pistola15drop_instance.set_translation(playerPosition + Vector3(0,0,-8))
		testingarea.add_child(pistola15drop_instance)
	if itemeffect == 15:
		riflea20drop_instance.set_translation(playerPosition + Vector3(0,0,-8))
		testingarea.add_child(riflea20drop_instance)
		player.add_max_ammo_rifle(20)
	if itemeffect == 16:
		riflea50drop_instance.set_translation(playerPosition + Vector3(0,0,-8))
		testingarea.add_child(riflea50drop_instance)
	if itemeffect == 17:
		shotguna4drop_instance.set_translation(playerPosition + Vector3(0,0,-8))
		testingarea.add_child(shotguna4drop_instance)
	if itemeffect == 18:
		shotguna10drop_instance.set_translation(playerPosition + Vector3(0,0,-8))
		testingarea.add_child(shotguna10drop_instance)
	if itemeffect == 19:
		chainguna50drop_instance.set_translation(playerPosition + Vector3(0,0,-8))
		testingarea.add_child(chainguna50drop_instance)
	if itemeffect == 20:
		chainguna150drop_instance.set_translation(playerPosition + Vector3(0,0,-8))
		testingarea.add_child(chainguna150drop_instance)
	if itemeffect == 21:
		nadea1drop_instance.set_translation(playerPosition + Vector3(0,0,-8))
		testingarea.add_child(nadea1drop_instance)
	if itemeffect == 22:
		stickya1drop_instance.set_translation(playerPosition + Vector3(0,0,-8))
		testingarea.add_child(stickya1drop_instance)
	if itemeffect == 23:
		phyattack1drop_instance.set_translation(playerPosition + Vector3(0,0,-8))
		testingarea.add_child(phyattack1drop_instance)
	if itemeffect == 24:
		phyattack3drop_instance.set_translation(playerPosition + Vector3(0,0,-8))
		testingarea.add_child(phyattack3drop_instance)
	if itemeffect == 25:
		expattack1drop_instance.set_translation(playerPosition + Vector3(0,0,-8))
		testingarea.add_child(expattack1drop_instance)
	if itemeffect == 26:
		expattack3drop_instance.set_translation(playerPosition + Vector3(0,0,-8))
		testingarea.add_child(expattack3drop_instance)
	if itemeffect == 27:
		speeddrop_instance.set_translation(playerPosition + Vector3(0,0,-8))
		testingarea.add_child(speeddrop_instance)
	if itemeffect == 28:
		jumpdrop_instance.set_translation(playerPosition + Vector3(0,0,-8))
		testingarea.add_child(jumpdrop_instance)
	if itemeffect == 29:
		hp5drop_instance.set_translation(playerPosition + Vector3(0,0,-8))
		testingarea.add_child(hp5drop_instance)
	if itemeffect == 30:
		hp50drop_instance.set_translation(playerPosition + Vector3(0,0,-8))
		testingarea.add_child(hp50drop_instance)
	if itemeffect == 31:
		hp100drop_instance.set_translation(playerPosition + Vector3(0,0,-8))
		testingarea.add_child(hp100drop_instance)
	if itemeffect == 32:
		hp200drop_instance.set_translation(playerPosition + Vector3(0,0,-8))
		testingarea.add_child(hp200drop_instance)
	if itemeffect == 33:
		ap5drop_instance.set_translation(playerPosition + Vector3(0,0,-8))
		testingarea.add_child(ap5drop_instance)
	if itemeffect == 34:
		ap50drop_instance.set_translation(playerPosition + Vector3(0,0,-8))
		testingarea.add_child(ap50drop_instance)
	if itemeffect == 35:
		ap100drop_instance.set_translation(playerPosition + Vector3(0,0,-8))
		testingarea.add_child(ap100drop_instance)
	if itemeffect == 36:
		ap200drop_instance.set_translation(playerPosition + Vector3(0,0,-8))
		testingarea.add_child(ap200drop_instance)
#	if itemeffect == 37:
#	if itemeffect == 38:

	if itemeffect == 39:
		hp1pdrop_instance.set_translation(playerPosition + Vector3(0,0,-8))
		testingarea.add_child(hp1pdrop_instance)
		#player.use_portal(50)
	if itemeffect == 40:
		hp1pdrop_instance.set_translation(playerPosition + Vector3(0,0,-8))
		testingarea.add_child(hp1pdrop_instance)
	if itemeffect == 41:
		key1drop_instance.set_translation(playerPosition + Vector3(0,0,-8))
		testingarea.add_child(key1drop_instance)
		player.lost_key1()
	if itemeffect == 42:
		key2drop_instance.set_translation(playerPosition + Vector3(0,0,-8))
		testingarea.add_child(key2drop_instance)
		player.lost_key2()
	if itemeffect == 43:
		key3drop_instance.set_translation(playerPosition + Vector3(0,0,-8))
		testingarea.add_child(key3drop_instance)
		player.lost_key3()
	if itemeffect == 44:
		clawdrop_instance.set_translation(playerPosition + Vector3(0,0,-8))
		testingarea.add_child(clawdrop_instance)
	if itemeffect == 45:
		talondrop_instance.set_translation(playerPosition + Vector3(0,0,-8))
		testingarea.add_child(talondrop_instance)
	if itemeffect == 46:
		toothdrop_instance.set_translation(playerPosition + Vector3(0,0,-8))
		testingarea.add_child(toothdrop_instance)
	if itemeffect == 47:
		bonedrop_instance.set_translation(playerPosition + Vector3(0,0,-8))
		testingarea.add_child(bonedrop_instance)
	if itemeffect == 48:
		nademaxdrop_instance.set_translation(playerPosition + Vector3(0,0,-8))
		testingarea.add_child(nademaxdrop_instance)
	if itemeffect == 49:
		stickymaxdrop_instance.set_translation(playerPosition + Vector3(0,0,-8))
		testingarea.add_child(stickymaxdrop_instance)


func _on_ItemMenu_Button_sellItem_pressed():
	player.add_gold(int(active_item_price))
	var newAmount = Global_Player.inventory_removeItem(dropItemSlot)
	if (newAmount < 1):
		$Panel/WindowDialog_ItemMenu.hide()
	update_slot(dropItemSlot)


func combine():
	var itemMetaData = $Panel/ItemList.get_item_metadata(dropItemSlot)
	if (itemMetaData["name"]) == "Tooth":
		player.add_big_tooth()
	if (itemMetaData["name"]) == "Claw":
		player.add_big_claw()
	if (itemMetaData["name"]) == "Talon":
		player.add_big_talon()
	if (itemMetaData["name"]) == "Bone":
		player.add_big_bone()


func _on_Notenough_Button_Return_pressed():
	$Panel/WindowDialog_notenough.hide()
